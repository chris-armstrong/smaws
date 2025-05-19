(** 
    WAF client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

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
  name: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_field_to_match :
  ?data:string -> type_:match_field_type -> unit -> field_to_match
val make_xss_match_tuple :
  text_transformation:text_transformation ->
    field_to_match:field_to_match -> unit -> xss_match_tuple
val make_xss_match_set_update :
  xss_match_tuple:xss_match_tuple ->
    action:change_action -> unit -> xss_match_set_update
val make_xss_match_set_summary :
  name:string -> xss_match_set_id:string -> unit -> xss_match_set_summary
val make_xss_match_set :
  ?name:string ->
    xss_match_tuples:xss_match_tuple list ->
      xss_match_set_id:string -> unit -> xss_match_set
val make_waf_action : type_:waf_action_type -> unit -> waf_action
val make_waf_override_action :
  type_:waf_override_action_type -> unit -> waf_override_action
val make_excluded_rule : rule_id:string -> unit -> excluded_rule
val make_activated_rule :
  ?excluded_rules:excluded_rule list ->
    ?type_:waf_rule_type ->
      ?override_action:waf_override_action ->
        ?action:waf_action ->
          rule_id:string -> priority:int -> unit -> activated_rule
val make_web_acl_update :
  activated_rule:activated_rule ->
    action:change_action -> unit -> web_acl_update
val make_web_acl_summary :
  name:string -> web_acl_id:string -> unit -> web_acl_summary
val make_web_ac_l :
  ?web_acl_arn:string ->
    ?metric_name:string ->
      ?name:string ->
        rules:activated_rule list ->
          default_action:waf_action -> web_acl_id:string -> unit -> web_ac_l
val make_update_xss_match_set_response :
  ?change_token:string -> unit -> update_xss_match_set_response
val make_update_xss_match_set_request :
  updates:xss_match_set_update list ->
    change_token:string ->
      xss_match_set_id:string -> unit -> update_xss_match_set_request
val make_update_web_acl_response :
  ?change_token:string -> unit -> update_web_acl_response
val make_update_web_acl_request :
  ?default_action:waf_action ->
    ?updates:web_acl_update list ->
      change_token:string ->
        web_acl_id:string -> unit -> update_web_acl_request
val make_update_sql_injection_match_set_response :
  ?change_token:string -> unit -> update_sql_injection_match_set_response
val make_sql_injection_match_tuple :
  text_transformation:text_transformation ->
    field_to_match:field_to_match -> unit -> sql_injection_match_tuple
val make_sql_injection_match_set_update :
  sql_injection_match_tuple:sql_injection_match_tuple ->
    action:change_action -> unit -> sql_injection_match_set_update
val make_update_sql_injection_match_set_request :
  updates:sql_injection_match_set_update list ->
    change_token:string ->
      sql_injection_match_set_id:string ->
        unit -> update_sql_injection_match_set_request
val make_update_size_constraint_set_response :
  ?change_token:string -> unit -> update_size_constraint_set_response
val make_size_constraint :
  size:int ->
    comparison_operator:comparison_operator ->
      text_transformation:text_transformation ->
        field_to_match:field_to_match -> unit -> size_constraint
val make_size_constraint_set_update :
  size_constraint:size_constraint ->
    action:change_action -> unit -> size_constraint_set_update
val make_update_size_constraint_set_request :
  updates:size_constraint_set_update list ->
    change_token:string ->
      size_constraint_set_id:string ->
        unit -> update_size_constraint_set_request
val make_update_rule_response :
  ?change_token:string -> unit -> update_rule_response
val make_predicate :
  data_id:string -> type_:predicate_type -> negated:bool -> unit -> predicate
val make_rule_update :
  predicate:predicate -> action:change_action -> unit -> rule_update
val make_update_rule_request :
  updates:rule_update list ->
    change_token:string -> rule_id:string -> unit -> update_rule_request
val make_update_rule_group_response :
  ?change_token:string -> unit -> update_rule_group_response
val make_rule_group_update :
  activated_rule:activated_rule ->
    action:change_action -> unit -> rule_group_update
val make_update_rule_group_request :
  change_token:string ->
    updates:rule_group_update list ->
      rule_group_id:string -> unit -> update_rule_group_request
val make_update_regex_pattern_set_response :
  ?change_token:string -> unit -> update_regex_pattern_set_response
val make_regex_pattern_set_update :
  regex_pattern_string:string ->
    action:change_action -> unit -> regex_pattern_set_update
val make_update_regex_pattern_set_request :
  change_token:string ->
    updates:regex_pattern_set_update list ->
      regex_pattern_set_id:string -> unit -> update_regex_pattern_set_request
val make_update_regex_match_set_response :
  ?change_token:string -> unit -> update_regex_match_set_response
val make_regex_match_tuple :
  regex_pattern_set_id:string ->
    text_transformation:text_transformation ->
      field_to_match:field_to_match -> unit -> regex_match_tuple
val make_regex_match_set_update :
  regex_match_tuple:regex_match_tuple ->
    action:change_action -> unit -> regex_match_set_update
val make_update_regex_match_set_request :
  change_token:string ->
    updates:regex_match_set_update list ->
      regex_match_set_id:string -> unit -> update_regex_match_set_request
val make_update_rate_based_rule_response :
  ?change_token:string -> unit -> update_rate_based_rule_response
val make_update_rate_based_rule_request :
  rate_limit:int ->
    updates:rule_update list ->
      change_token:string ->
        rule_id:string -> unit -> update_rate_based_rule_request
val make_update_ip_set_response :
  ?change_token:string -> unit -> update_ip_set_response
val make_ip_set_descriptor :
  value:string -> type_:ip_set_descriptor_type -> unit -> ip_set_descriptor
val make_ip_set_update :
  ip_set_descriptor:ip_set_descriptor ->
    action:change_action -> unit -> ip_set_update
val make_update_ip_set_request :
  updates:ip_set_update list ->
    change_token:string -> ip_set_id:string -> unit -> update_ip_set_request
val make_update_geo_match_set_response :
  ?change_token:string -> unit -> update_geo_match_set_response
val make_geo_match_constraint :
  value:geo_match_constraint_value ->
    type_:geo_match_constraint_type -> unit -> geo_match_constraint
val make_geo_match_set_update :
  geo_match_constraint:geo_match_constraint ->
    action:change_action -> unit -> geo_match_set_update
val make_update_geo_match_set_request :
  updates:geo_match_set_update list ->
    change_token:string ->
      geo_match_set_id:string -> unit -> update_geo_match_set_request
val make_update_byte_match_set_response :
  ?change_token:string -> unit -> update_byte_match_set_response
val make_byte_match_tuple :
  positional_constraint:positional_constraint ->
    text_transformation:text_transformation ->
      target_string:bytes ->
        field_to_match:field_to_match -> unit -> byte_match_tuple
val make_byte_match_set_update :
  byte_match_tuple:byte_match_tuple ->
    action:change_action -> unit -> byte_match_set_update
val make_update_byte_match_set_request :
  updates:byte_match_set_update list ->
    change_token:string ->
      byte_match_set_id:string -> unit -> update_byte_match_set_request
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_time_window :
  end_time:CoreTypes.Timestamp.t ->
    start_time:CoreTypes.Timestamp.t -> unit -> time_window
val make_tag_resource_response : unit -> tag_resource_response
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_tag_info_for_resource :
  ?tag_list:tag list ->
    ?resource_ar_n:string -> unit -> tag_info_for_resource
val make_subscribed_rule_group_summary :
  metric_name:string ->
    name:string ->
      rule_group_id:string -> unit -> subscribed_rule_group_summary
val make_sql_injection_match_set_summary :
  name:string ->
    sql_injection_match_set_id:string ->
      unit -> sql_injection_match_set_summary
val make_sql_injection_match_set :
  ?name:string ->
    sql_injection_match_tuples:sql_injection_match_tuple list ->
      sql_injection_match_set_id:string -> unit -> sql_injection_match_set
val make_size_constraint_set_summary :
  name:string ->
    size_constraint_set_id:string -> unit -> size_constraint_set_summary
val make_size_constraint_set :
  ?name:string ->
    size_constraints:size_constraint list ->
      size_constraint_set_id:string -> unit -> size_constraint_set
val make_http_header : ?value:string -> ?name:string -> unit -> http_header
val make_http_request :
  ?headers:http_header list ->
    ?http_version:string ->
      ?method_:string ->
        ?ur_i:string ->
          ?country:string -> ?client_i_p:string -> unit -> http_request
val make_sampled_http_request :
  ?rule_within_rule_group:string ->
    ?action:string ->
      ?timestamp_:CoreTypes.Timestamp.t ->
        weight:int -> request:http_request -> unit -> sampled_http_request
val make_rule_summary : name:string -> rule_id:string -> unit -> rule_summary
val make_rule_group_summary :
  name:string -> rule_group_id:string -> unit -> rule_group_summary
val make_rule_group :
  ?metric_name:string ->
    ?name:string -> rule_group_id:string -> unit -> rule_group
val make_rule :
  ?metric_name:string ->
    ?name:string ->
      predicates:predicate list -> rule_id:string -> unit -> rule
val make_regex_pattern_set_summary :
  name:string ->
    regex_pattern_set_id:string -> unit -> regex_pattern_set_summary
val make_regex_pattern_set :
  ?name:string ->
    regex_pattern_strings:string list ->
      regex_pattern_set_id:string -> unit -> regex_pattern_set
val make_regex_match_set_summary :
  name:string -> regex_match_set_id:string -> unit -> regex_match_set_summary
val make_regex_match_set :
  ?regex_match_tuples:regex_match_tuple list ->
    ?name:string -> ?regex_match_set_id:string -> unit -> regex_match_set
val make_rate_based_rule :
  ?metric_name:string ->
    ?name:string ->
      rate_limit:int ->
        rate_key:rate_key ->
          match_predicates:predicate list ->
            rule_id:string -> unit -> rate_based_rule
val make_put_permission_policy_response :
  unit -> put_permission_policy_response
val make_put_permission_policy_request :
  policy:string ->
    resource_arn:string -> unit -> put_permission_policy_request
val make_logging_configuration :
  ?redacted_fields:field_to_match list ->
    log_destination_configs:string list ->
      resource_arn:string -> unit -> logging_configuration
val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration ->
    unit -> put_logging_configuration_response
val make_put_logging_configuration_request :
  logging_configuration:logging_configuration ->
    unit -> put_logging_configuration_request
val make_list_xss_match_sets_response :
  ?xss_match_sets:xss_match_set_summary list ->
    ?next_marker:string -> unit -> list_xss_match_sets_response
val make_list_xss_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit -> list_xss_match_sets_request
val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summary list ->
    ?next_marker:string -> unit -> list_web_ac_ls_response
val make_list_web_ac_ls_request :
  ?limit:int -> ?next_marker:string -> unit -> list_web_ac_ls_request
val make_list_tags_for_resource_response :
  ?tag_info_for_resource:tag_info_for_resource ->
    ?next_marker:string -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  ?limit:int ->
    ?next_marker:string ->
      resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_list_subscribed_rule_groups_response :
  ?rule_groups:subscribed_rule_group_summary list ->
    ?next_marker:string -> unit -> list_subscribed_rule_groups_response
val make_list_subscribed_rule_groups_request :
  ?limit:int ->
    ?next_marker:string -> unit -> list_subscribed_rule_groups_request
val make_list_sql_injection_match_sets_response :
  ?sql_injection_match_sets:sql_injection_match_set_summary list ->
    ?next_marker:string -> unit -> list_sql_injection_match_sets_response
val make_list_sql_injection_match_sets_request :
  ?limit:int ->
    ?next_marker:string -> unit -> list_sql_injection_match_sets_request
val make_list_size_constraint_sets_response :
  ?size_constraint_sets:size_constraint_set_summary list ->
    ?next_marker:string -> unit -> list_size_constraint_sets_response
val make_list_size_constraint_sets_request :
  ?limit:int ->
    ?next_marker:string -> unit -> list_size_constraint_sets_request
val make_list_rules_response :
  ?rules:rule_summary list ->
    ?next_marker:string -> unit -> list_rules_response
val make_list_rules_request :
  ?limit:int -> ?next_marker:string -> unit -> list_rules_request
val make_list_rule_groups_response :
  ?rule_groups:rule_group_summary list ->
    ?next_marker:string -> unit -> list_rule_groups_response
val make_list_rule_groups_request :
  ?limit:int -> ?next_marker:string -> unit -> list_rule_groups_request
val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summary list ->
    ?next_marker:string -> unit -> list_regex_pattern_sets_response
val make_list_regex_pattern_sets_request :
  ?limit:int ->
    ?next_marker:string -> unit -> list_regex_pattern_sets_request
val make_list_regex_match_sets_response :
  ?regex_match_sets:regex_match_set_summary list ->
    ?next_marker:string -> unit -> list_regex_match_sets_response
val make_list_regex_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit -> list_regex_match_sets_request
val make_list_rate_based_rules_response :
  ?rules:rule_summary list ->
    ?next_marker:string -> unit -> list_rate_based_rules_response
val make_list_rate_based_rules_request :
  ?limit:int -> ?next_marker:string -> unit -> list_rate_based_rules_request
val make_list_logging_configurations_response :
  ?next_marker:string ->
    ?logging_configurations:logging_configuration list ->
      unit -> list_logging_configurations_response
val make_list_logging_configurations_request :
  ?limit:int ->
    ?next_marker:string -> unit -> list_logging_configurations_request
val make_ip_set_summary :
  name:string -> ip_set_id:string -> unit -> ip_set_summary
val make_list_ip_sets_response :
  ?ip_sets:ip_set_summary list ->
    ?next_marker:string -> unit -> list_ip_sets_response
val make_list_ip_sets_request :
  ?limit:int -> ?next_marker:string -> unit -> list_ip_sets_request
val make_geo_match_set_summary :
  name:string -> geo_match_set_id:string -> unit -> geo_match_set_summary
val make_list_geo_match_sets_response :
  ?geo_match_sets:geo_match_set_summary list ->
    ?next_marker:string -> unit -> list_geo_match_sets_response
val make_list_geo_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit -> list_geo_match_sets_request
val make_byte_match_set_summary :
  name:string -> byte_match_set_id:string -> unit -> byte_match_set_summary
val make_list_byte_match_sets_response :
  ?byte_match_sets:byte_match_set_summary list ->
    ?next_marker:string -> unit -> list_byte_match_sets_response
val make_list_byte_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit -> list_byte_match_sets_request
val make_list_activated_rules_in_rule_group_response :
  ?activated_rules:activated_rule list ->
    ?next_marker:string ->
      unit -> list_activated_rules_in_rule_group_response
val make_list_activated_rules_in_rule_group_request :
  ?limit:int ->
    ?next_marker:string ->
      ?rule_group_id:string ->
        unit -> list_activated_rules_in_rule_group_request
val make_ip_set :
  ?name:string ->
    ip_set_descriptors:ip_set_descriptor list ->
      ip_set_id:string -> unit -> ip_set
val make_get_xss_match_set_response :
  ?xss_match_set:xss_match_set -> unit -> get_xss_match_set_response
val make_get_xss_match_set_request :
  xss_match_set_id:string -> unit -> get_xss_match_set_request
val make_get_web_acl_response :
  ?web_ac_l:web_ac_l -> unit -> get_web_acl_response
val make_get_web_acl_request :
  web_acl_id:string -> unit -> get_web_acl_request
val make_get_sql_injection_match_set_response :
  ?sql_injection_match_set:sql_injection_match_set ->
    unit -> get_sql_injection_match_set_response
val make_get_sql_injection_match_set_request :
  sql_injection_match_set_id:string ->
    unit -> get_sql_injection_match_set_request
val make_get_size_constraint_set_response :
  ?size_constraint_set:size_constraint_set ->
    unit -> get_size_constraint_set_response
val make_get_size_constraint_set_request :
  size_constraint_set_id:string -> unit -> get_size_constraint_set_request
val make_get_sampled_requests_response :
  ?time_window:time_window ->
    ?population_size:int ->
      ?sampled_requests:sampled_http_request list ->
        unit -> get_sampled_requests_response
val make_get_sampled_requests_request :
  max_items:int ->
    time_window:time_window ->
      rule_id:string ->
        web_acl_id:string -> unit -> get_sampled_requests_request
val make_get_rule_response : ?rule:rule -> unit -> get_rule_response
val make_get_rule_request : rule_id:string -> unit -> get_rule_request
val make_get_rule_group_response :
  ?rule_group:rule_group -> unit -> get_rule_group_response
val make_get_rule_group_request :
  rule_group_id:string -> unit -> get_rule_group_request
val make_get_regex_pattern_set_response :
  ?regex_pattern_set:regex_pattern_set ->
    unit -> get_regex_pattern_set_response
val make_get_regex_pattern_set_request :
  regex_pattern_set_id:string -> unit -> get_regex_pattern_set_request
val make_get_regex_match_set_response :
  ?regex_match_set:regex_match_set -> unit -> get_regex_match_set_response
val make_get_regex_match_set_request :
  regex_match_set_id:string -> unit -> get_regex_match_set_request
val make_get_rate_based_rule_response :
  ?rule:rate_based_rule -> unit -> get_rate_based_rule_response
val make_get_rate_based_rule_request :
  rule_id:string -> unit -> get_rate_based_rule_request
val make_get_rate_based_rule_managed_keys_response :
  ?next_marker:string ->
    ?managed_keys:string list ->
      unit -> get_rate_based_rule_managed_keys_response
val make_get_rate_based_rule_managed_keys_request :
  ?next_marker:string ->
    rule_id:string -> unit -> get_rate_based_rule_managed_keys_request
val make_get_permission_policy_response :
  ?policy:string -> unit -> get_permission_policy_response
val make_get_permission_policy_request :
  resource_arn:string -> unit -> get_permission_policy_request
val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration ->
    unit -> get_logging_configuration_response
val make_get_logging_configuration_request :
  resource_arn:string -> unit -> get_logging_configuration_request
val make_get_ip_set_response : ?ip_set:ip_set -> unit -> get_ip_set_response
val make_get_ip_set_request : ip_set_id:string -> unit -> get_ip_set_request
val make_geo_match_set :
  ?name:string ->
    geo_match_constraints:geo_match_constraint list ->
      geo_match_set_id:string -> unit -> geo_match_set
val make_get_geo_match_set_response :
  ?geo_match_set:geo_match_set -> unit -> get_geo_match_set_response
val make_get_geo_match_set_request :
  geo_match_set_id:string -> unit -> get_geo_match_set_request
val make_get_change_token_status_response :
  ?change_token_status:change_token_status ->
    unit -> get_change_token_status_response
val make_get_change_token_status_request :
  change_token:string -> unit -> get_change_token_status_request
val make_get_change_token_response :
  ?change_token:string -> unit -> get_change_token_response
val make_get_change_token_request : unit -> get_change_token_request
val make_byte_match_set :
  ?name:string ->
    byte_match_tuples:byte_match_tuple list ->
      byte_match_set_id:string -> unit -> byte_match_set
val make_get_byte_match_set_response :
  ?byte_match_set:byte_match_set -> unit -> get_byte_match_set_response
val make_get_byte_match_set_request :
  byte_match_set_id:string -> unit -> get_byte_match_set_request
val make_delete_xss_match_set_response :
  ?change_token:string -> unit -> delete_xss_match_set_response
val make_delete_xss_match_set_request :
  change_token:string ->
    xss_match_set_id:string -> unit -> delete_xss_match_set_request
val make_delete_web_acl_response :
  ?change_token:string -> unit -> delete_web_acl_response
val make_delete_web_acl_request :
  change_token:string -> web_acl_id:string -> unit -> delete_web_acl_request
val make_delete_sql_injection_match_set_response :
  ?change_token:string -> unit -> delete_sql_injection_match_set_response
val make_delete_sql_injection_match_set_request :
  change_token:string ->
    sql_injection_match_set_id:string ->
      unit -> delete_sql_injection_match_set_request
val make_delete_size_constraint_set_response :
  ?change_token:string -> unit -> delete_size_constraint_set_response
val make_delete_size_constraint_set_request :
  change_token:string ->
    size_constraint_set_id:string ->
      unit -> delete_size_constraint_set_request
val make_delete_rule_response :
  ?change_token:string -> unit -> delete_rule_response
val make_delete_rule_request :
  change_token:string -> rule_id:string -> unit -> delete_rule_request
val make_delete_rule_group_response :
  ?change_token:string -> unit -> delete_rule_group_response
val make_delete_rule_group_request :
  change_token:string ->
    rule_group_id:string -> unit -> delete_rule_group_request
val make_delete_regex_pattern_set_response :
  ?change_token:string -> unit -> delete_regex_pattern_set_response
val make_delete_regex_pattern_set_request :
  change_token:string ->
    regex_pattern_set_id:string -> unit -> delete_regex_pattern_set_request
val make_delete_regex_match_set_response :
  ?change_token:string -> unit -> delete_regex_match_set_response
val make_delete_regex_match_set_request :
  change_token:string ->
    regex_match_set_id:string -> unit -> delete_regex_match_set_request
val make_delete_rate_based_rule_response :
  ?change_token:string -> unit -> delete_rate_based_rule_response
val make_delete_rate_based_rule_request :
  change_token:string ->
    rule_id:string -> unit -> delete_rate_based_rule_request
val make_delete_permission_policy_response :
  unit -> delete_permission_policy_response
val make_delete_permission_policy_request :
  resource_arn:string -> unit -> delete_permission_policy_request
val make_delete_logging_configuration_response :
  unit -> delete_logging_configuration_response
val make_delete_logging_configuration_request :
  resource_arn:string -> unit -> delete_logging_configuration_request
val make_delete_ip_set_response :
  ?change_token:string -> unit -> delete_ip_set_response
val make_delete_ip_set_request :
  change_token:string -> ip_set_id:string -> unit -> delete_ip_set_request
val make_delete_geo_match_set_response :
  ?change_token:string -> unit -> delete_geo_match_set_response
val make_delete_geo_match_set_request :
  change_token:string ->
    geo_match_set_id:string -> unit -> delete_geo_match_set_request
val make_delete_byte_match_set_response :
  ?change_token:string -> unit -> delete_byte_match_set_response
val make_delete_byte_match_set_request :
  change_token:string ->
    byte_match_set_id:string -> unit -> delete_byte_match_set_request
val make_create_xss_match_set_response :
  ?change_token:string ->
    ?xss_match_set:xss_match_set -> unit -> create_xss_match_set_response
val make_create_xss_match_set_request :
  change_token:string -> name:string -> unit -> create_xss_match_set_request
val make_create_web_acl_response :
  ?change_token:string ->
    ?web_ac_l:web_ac_l -> unit -> create_web_acl_response
val make_create_web_acl_request :
  ?tags:tag list ->
    change_token:string ->
      default_action:waf_action ->
        metric_name:string -> name:string -> unit -> create_web_acl_request
val make_create_web_acl_migration_stack_response :
  s3_object_url:string -> unit -> create_web_acl_migration_stack_response
val make_create_web_acl_migration_stack_request :
  ignore_unsupported_type:bool ->
    s3_bucket_name:string ->
      web_acl_id:string -> unit -> create_web_acl_migration_stack_request
val make_create_sql_injection_match_set_response :
  ?change_token:string ->
    ?sql_injection_match_set:sql_injection_match_set ->
      unit -> create_sql_injection_match_set_response
val make_create_sql_injection_match_set_request :
  change_token:string ->
    name:string -> unit -> create_sql_injection_match_set_request
val make_create_size_constraint_set_response :
  ?change_token:string ->
    ?size_constraint_set:size_constraint_set ->
      unit -> create_size_constraint_set_response
val make_create_size_constraint_set_request :
  change_token:string ->
    name:string -> unit -> create_size_constraint_set_request
val make_create_rule_response :
  ?change_token:string -> ?rule:rule -> unit -> create_rule_response
val make_create_rule_request :
  ?tags:tag list ->
    change_token:string ->
      metric_name:string -> name:string -> unit -> create_rule_request
val make_create_rule_group_response :
  ?change_token:string ->
    ?rule_group:rule_group -> unit -> create_rule_group_response
val make_create_rule_group_request :
  ?tags:tag list ->
    change_token:string ->
      metric_name:string -> name:string -> unit -> create_rule_group_request
val make_create_regex_pattern_set_response :
  ?change_token:string ->
    ?regex_pattern_set:regex_pattern_set ->
      unit -> create_regex_pattern_set_response
val make_create_regex_pattern_set_request :
  change_token:string ->
    name:string -> unit -> create_regex_pattern_set_request
val make_create_regex_match_set_response :
  ?change_token:string ->
    ?regex_match_set:regex_match_set ->
      unit -> create_regex_match_set_response
val make_create_regex_match_set_request :
  change_token:string ->
    name:string -> unit -> create_regex_match_set_request
val make_create_rate_based_rule_response :
  ?change_token:string ->
    ?rule:rate_based_rule -> unit -> create_rate_based_rule_response
val make_create_rate_based_rule_request :
  ?tags:tag list ->
    change_token:string ->
      rate_limit:int ->
        rate_key:rate_key ->
          metric_name:string ->
            name:string -> unit -> create_rate_based_rule_request
val make_create_ip_set_response :
  ?change_token:string -> ?ip_set:ip_set -> unit -> create_ip_set_response
val make_create_ip_set_request :
  change_token:string -> name:string -> unit -> create_ip_set_request
val make_create_geo_match_set_response :
  ?change_token:string ->
    ?geo_match_set:geo_match_set -> unit -> create_geo_match_set_response
val make_create_geo_match_set_request :
  change_token:string -> name:string -> unit -> create_geo_match_set_request
val make_create_byte_match_set_response :
  ?change_token:string ->
    ?byte_match_set:byte_match_set -> unit -> create_byte_match_set_response
val make_create_byte_match_set_request :
  change_token:string -> name:string -> unit -> create_byte_match_set_request(** {1:operations Operations} *)

module CreateByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_byte_match_set_request ->
        (create_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [ByteMatchSet]. You then use [UpdateByteMatchSet] to identify the part of a web request that you want AWS WAF to inspect, such as the values of the [User-Agent] header or the query string. For example, you can create a [ByteMatchSet] that matches any requests with [User-Agent] headers that contain the string [BadBot]. You can then configure AWS WAF to reject those requests.
    
     To create and configure a [ByteMatchSet], perform the following steps:
     
      {ol
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateByteMatchSet] request.
                
                 }
            {-  Submit a [CreateByteMatchSet] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateByteMatchSet] request.
                
                 }
            {-  Submit an [UpdateByteMatchSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_geo_match_set_request ->
        (create_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates an [GeoMatchSet], which you use to specify which web requests you want to allow or block based on the country that the requests originate from. For example, if you're receiving a lot of requests from one or more countries and you want to block the requests, you can create an [GeoMatchSet] that contains those countries and then configure AWS WAF to block the requests. 
    
     To create and configure a [GeoMatchSet], perform the following steps:
     
      {ol
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateGeoMatchSet] request.
                
                 }
            {-  Submit a [CreateGeoMatchSet] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateGeoMatchSet] request.
                
                 }
            {-  Submit an [UpdateGeoMatchSetSet] request to specify the countries that you want AWS WAF to watch for.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_ip_set_request ->
        (create_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates an [IPSet], which you use to specify which web requests that you want to allow or block based on the IP addresses that the requests originate from. For example, if you're receiving a lot of requests from one or more individual IP addresses or one or more ranges of IP addresses and you want to block the requests, you can create an [IPSet] that contains those IP addresses and then configure AWS WAF to block the requests. 
    
     To create and configure an [IPSet], perform the following steps:
     
      {ol
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateIPSet] request.
                
                 }
            {-  Submit a [CreateIPSet] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateIPSet] request.
                
                 }
            {-  Submit an [UpdateIPSet] request to specify the IP addresses that you want AWS WAF to watch for.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rate_based_rule_request ->
        (create_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [RateBasedRule]. The [RateBasedRule] contains a [RateLimit], which specifies the maximum number of requests that AWS WAF allows from a specified IP address in a five-minute period. The [RateBasedRule] also contains the [IPSet] objects, [ByteMatchSet] objects, and other predicates that identify the requests that you want to count or block if these requests exceed the [RateLimit].
    
     If you add more than one predicate to a [RateBasedRule], a request not only must exceed the [RateLimit], but it also must match all the conditions to be counted or blocked. For example, suppose you add the following to a [RateBasedRule]:
     
      {ul
            {-  An [IPSet] that matches the IP address [192.0.2.44/32] 
                
                 }
            {-  A [ByteMatchSet] that matches [BadBot] in the [User-Agent] header
                
                 }
            }
   Further, you specify a [RateLimit] of 1,000.
   
    You then add the [RateBasedRule] to a [WebACL] and specify that you want to block requests that meet the conditions in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 {i and} the [User-Agent] header in the request must contain the value [BadBot]. Further, requests that match these two conditions must be received at a rate of more than 1,000 requests every five minutes. If both conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below 1,000 for a five-minute period, AWS WAF no longer blocks the requests.
    
     As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a [RateBasedRule]:
     
      {ul
            {-  A [ByteMatchSet] with [FieldToMatch] of [URI] 
                
                 }
            {-  A [PositionalConstraint] of [STARTS_WITH] 
                
                 }
            {-  A [TargetString] of [login] 
                
                 }
            }
   Further, you specify a [RateLimit] of 1,000.
   
    By adding this [RateBasedRule] to a [WebACL], you could limit requests to your login page without affecting the rest of your site.
    
     To create and configure a [RateBasedRule], perform the following steps:
     
      {ol
            {-  Create and update the predicates that you want to include in the rule. For more information, see [CreateByteMatchSet], [CreateIPSet], and [CreateSqlInjectionMatchSet].
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateRule] request.
                
                 }
            {-  Submit a [CreateRateBasedRule] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRule] request.
                
                 }
            {-  Submit an [UpdateRateBasedRule] request to specify the predicates that you want to include in the rule.
                
                 }
            {-  Create and update a [WebACL] that contains the [RateBasedRule]. For more information, see [CreateWebACL].
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_match_set_request ->
        (create_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [RegexMatchSet]. You then use [UpdateRegexMatchSet] to identify the part of a web request that you want AWS WAF to inspect, such as the values of the [User-Agent] header or the query string. For example, you can create a [RegexMatchSet] that contains a [RegexMatchTuple] that looks for any requests with [User-Agent] headers that match a [RegexPatternSet] with pattern [B\[a@\]dB\[o0\]t]. You can then configure AWS WAF to reject those requests.
    
     To create and configure a [RegexMatchSet], perform the following steps:
     
      {ol
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateRegexMatchSet] request.
                
                 }
            {-  Submit a [CreateRegexMatchSet] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRegexMatchSet] request.
                
                 }
            {-  Submit an [UpdateRegexMatchSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value, using a [RegexPatternSet], that you want AWS WAF to watch for.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_pattern_set_request ->
        (create_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [RegexPatternSet]. You then use [UpdateRegexPatternSet] to specify the regular expression (regex) pattern that you want AWS WAF to search for, such as [B\[a@\]dB\[o0\]t]. You can then configure AWS WAF to reject those requests.
    
     To create and configure a [RegexPatternSet], perform the following steps:
     
      {ol
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateRegexPatternSet] request.
                
                 }
            {-  Submit a [CreateRegexPatternSet] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRegexPatternSet] request.
                
                 }
            {-  Submit an [UpdateRegexPatternSet] request to specify the string that you want AWS WAF to watch for.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_request ->
        (create_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [Rule], which contains the [IPSet] objects, [ByteMatchSet] objects, and other predicates that identify the requests that you want to block. If you add more than one predicate to a [Rule], a request must match all of the specifications to be allowed or blocked. For example, suppose that you add the following to a [Rule]:
    
     {ul
           {-  An [IPSet] that matches the IP address [192.0.2.44/32] 
               
                }
           {-  A [ByteMatchSet] that matches [BadBot] in the [User-Agent] header
               
                }
           }
   You then add the [Rule] to a [WebACL] and specify that you want to blocks requests that satisfy the [Rule]. For a request to be blocked, it must come from the IP address 192.0.2.44 {i and} the [User-Agent] header in the request must contain the value [BadBot].
   
    To create and configure a [Rule], perform the following steps:
    
     {ol
           {-  Create and update the predicates that you want to include in the [Rule]. For more information, see [CreateByteMatchSet], [CreateIPSet], and [CreateSqlInjectionMatchSet].
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateRule] request.
               
                }
           {-  Submit a [CreateRule] request.
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRule] request.
               
                }
           {-  Submit an [UpdateRule] request to specify the predicates that you want to include in the [Rule].
               
                }
           {-  Create and update a [WebACL] that contains the [Rule]. For more information, see [CreateWebACL].
               
                }
           }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_group_request ->
        (create_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [RuleGroup]. A rule group is a collection of predefined rules that you add to a web ACL. You use [UpdateRuleGroup] to add rules to the rule group.
    
     Rule groups are subject to the following limits:
     
      {ul
            {-  Three rule groups per account. You can request an increase to this limit by contacting customer support.
                
                 }
            {-  One rule group per web ACL.
                
                 }
            {-  Ten rules per rule group.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_size_constraint_set_request ->
        (create_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [SizeConstraintSet]. You then use [UpdateSizeConstraintSet] to identify the part of a web request that you want AWS WAF to check for length, such as the length of the [User-Agent] header or the length of the query string. For example, you can create a [SizeConstraintSet] that matches any requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to reject those requests.
    
     To create and configure a [SizeConstraintSet], perform the following steps:
     
      {ol
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateSizeConstraintSet] request.
                
                 }
            {-  Submit a [CreateSizeConstraintSet] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateSizeConstraintSet] request.
                
                 }
            {-  Submit an [UpdateSizeConstraintSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_sql_injection_match_set_request ->
        (create_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [SqlInjectionMatchSet], which you use to allow, block, or count requests that contain snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.
    
     To create and configure a [SqlInjectionMatchSet], perform the following steps:
     
      {ol
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateSqlInjectionMatchSet] request.
                
                 }
            {-  Submit a [CreateSqlInjectionMatchSet] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateSqlInjectionMatchSet] request.
                
                 }
            {-  Submit an [UpdateSqlInjectionMatchSet] request to specify the parts of web requests in which you want to allow, block, or count malicious SQL code.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_request ->
        (create_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates a [WebACL], which contains the [Rules] that identify the CloudFront web requests that you want to allow, block, or count. AWS WAF evaluates [Rules] in order based on the value of [Priority] for each [Rule].
    
     You also specify a default action, either [ALLOW] or [BLOCK]. If a web request doesn't match any of the [Rules] in a [WebACL], AWS WAF responds to the request with the default action. 
     
      To create and configure a [WebACL], perform the following steps:
      
       {ol
             {-  Create and update the [ByteMatchSet] objects and other predicates that you want to include in [Rules]. For more information, see [CreateByteMatchSet], [UpdateByteMatchSet], [CreateIPSet], [UpdateIPSet], [CreateSqlInjectionMatchSet], and [UpdateSqlInjectionMatchSet].
                 
                  }
             {-  Create and update the [Rules] that you want to include in the [WebACL]. For more information, see [CreateRule] and [UpdateRule].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateWebACL] request.
                 
                  }
             {-  Submit a [CreateWebACL] request.
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateWebACL] request.
                 
                  }
             {-  Submit an [UpdateWebACL] request to specify the [Rules] that you want to include in the [WebACL], to specify the default action, and to associate the [WebACL] with a CloudFront distribution.
                 
                  }
             }
   For more information about how to use the AWS WAF API, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module CreateWebACLMigrationStack : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_migration_stack_request ->
        (create_web_acl_migration_stack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFEntityMigrationException of waf_entity_migration_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** Creates an AWS CloudFormation WAFV2 template for the specified web ACL in the specified Amazon S3 bucket. Then, in CloudFormation, you create a stack from the template, to create the web ACL and its resources in AWS WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest version of AWS WAF.

 This is part of a larger migration procedure for web ACLs from AWS WAF Classic to the latest version of AWS WAF. For the full procedure, including caveats and manual steps to complete the migration and switch over to the new web ACL, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-migrating-from-classic.html}Migrating your AWS WAF Classic resources to AWS WAF} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. 
  *)

  
end

module CreateXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_xss_match_set_request ->
        (create_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Creates an [XssMatchSet], which you use to allow, block, or count requests that contain cross-site scripting attacks in the specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.
    
     To create and configure an [XssMatchSet], perform the following steps:
     
      {ol
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateXssMatchSet] request.
                
                 }
            {-  Submit a [CreateXssMatchSet] request.
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateXssMatchSet] request.
                
                 }
            {-  Submit an [UpdateXssMatchSet] request to specify the parts of web requests in which you want to allow, block, or count cross-site scripting attacks.
                
                 }
            }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module DeleteByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_byte_match_set_request ->
        (delete_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [ByteMatchSet]. You can't delete a [ByteMatchSet] if it's still used in any [Rules] or if it still includes any [ByteMatchTuple] objects (any filters).
    
     If you just want to remove a [ByteMatchSet] from a [Rule], use [UpdateRule].
     
      To permanently delete a [ByteMatchSet], perform the following steps:
      
       {ol
             {-  Update the [ByteMatchSet] to remove filters, if any. For more information, see [UpdateByteMatchSet].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteByteMatchSet] request.
                 
                  }
             {-  Submit a [DeleteByteMatchSet] request.
                 
                  }
             }
   *)

  
end

module DeleteGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_geo_match_set_request ->
        (delete_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [GeoMatchSet]. You can't delete a [GeoMatchSet] if it's still used in any [Rules] or if it still includes any countries.
    
     If you just want to remove a [GeoMatchSet] from a [Rule], use [UpdateRule].
     
      To permanently delete a [GeoMatchSet] from AWS WAF, perform the following steps:
      
       {ol
             {-  Update the [GeoMatchSet] to remove any countries. For more information, see [UpdateGeoMatchSet].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteGeoMatchSet] request.
                 
                  }
             {-  Submit a [DeleteGeoMatchSet] request.
                 
                  }
             }
   *)

  
end

module DeleteIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ip_set_request ->
        (delete_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes an [IPSet]. You can't delete an [IPSet] if it's still used in any [Rules] or if it still includes any IP addresses.
    
     If you just want to remove an [IPSet] from a [Rule], use [UpdateRule].
     
      To permanently delete an [IPSet] from AWS WAF, perform the following steps:
      
       {ol
             {-  Update the [IPSet] to remove IP address ranges, if any. For more information, see [UpdateIPSet].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteIPSet] request.
                 
                  }
             {-  Submit a [DeleteIPSet] request.
                 
                  }
             }
   *)

  
end

module DeleteLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_logging_configuration_request ->
        (delete_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes the [LoggingConfiguration] from the specified web ACL.
     *)

  
end

module DeletePermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_permission_policy_request ->
        (delete_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes an IAM policy from the specified RuleGroup.
    
     The user making the request must be the owner of the RuleGroup.
      *)

  
end

module DeleteRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rate_based_rule_request ->
        (delete_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [RateBasedRule]. You can't delete a rule if it's still used in any [WebACL] objects or if it still includes any predicates, such as [ByteMatchSet] objects.
    
     If you just want to remove a rule from a [WebACL], use [UpdateWebACL].
     
      To permanently delete a [RateBasedRule] from AWS WAF, perform the following steps:
      
       {ol
             {-  Update the [RateBasedRule] to remove predicates, if any. For more information, see [UpdateRateBasedRule].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteRateBasedRule] request.
                 
                  }
             {-  Submit a [DeleteRateBasedRule] request.
                 
                  }
             }
   *)

  
end

module DeleteRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_match_set_request ->
        (delete_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [RegexMatchSet]. You can't delete a [RegexMatchSet] if it's still used in any [Rules] or if it still includes any [RegexMatchTuples] objects (any filters).
    
     If you just want to remove a [RegexMatchSet] from a [Rule], use [UpdateRule].
     
      To permanently delete a [RegexMatchSet], perform the following steps:
      
       {ol
             {-  Update the [RegexMatchSet] to remove filters, if any. For more information, see [UpdateRegexMatchSet].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteRegexMatchSet] request.
                 
                  }
             {-  Submit a [DeleteRegexMatchSet] request.
                 
                  }
             }
   *)

  
end

module DeleteRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_pattern_set_request ->
        (delete_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [RegexPatternSet]. You can't delete a [RegexPatternSet] if it's still used in any [RegexMatchSet] or if the [RegexPatternSet] is not empty. 
     *)

  
end

module DeleteRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (delete_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [Rule]. You can't delete a [Rule] if it's still used in any [WebACL] objects or if it still includes any predicates, such as [ByteMatchSet] objects.
    
     If you just want to remove a [Rule] from a [WebACL], use [UpdateWebACL].
     
      To permanently delete a [Rule] from AWS WAF, perform the following steps:
      
       {ol
             {-  Update the [Rule] to remove predicates, if any. For more information, see [UpdateRule].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteRule] request.
                 
                  }
             {-  Submit a [DeleteRule] request.
                 
                  }
             }
   *)

  
end

module DeleteRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_group_request ->
        (delete_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [RuleGroup]. You can't delete a [RuleGroup] if it's still used in any [WebACL] objects or if it still includes any rules.
    
     If you just want to remove a [RuleGroup] from a [WebACL], use [UpdateWebACL].
     
      To permanently delete a [RuleGroup] from AWS WAF, perform the following steps:
      
       {ol
             {-  Update the [RuleGroup] to remove rules, if any. For more information, see [UpdateRuleGroup].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteRuleGroup] request.
                 
                  }
             {-  Submit a [DeleteRuleGroup] request.
                 
                  }
             }
   *)

  
end

module DeleteSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_size_constraint_set_request ->
        (delete_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [SizeConstraintSet]. You can't delete a [SizeConstraintSet] if it's still used in any [Rules] or if it still includes any [SizeConstraint] objects (any filters).
    
     If you just want to remove a [SizeConstraintSet] from a [Rule], use [UpdateRule].
     
      To permanently delete a [SizeConstraintSet], perform the following steps:
      
       {ol
             {-  Update the [SizeConstraintSet] to remove filters, if any. For more information, see [UpdateSizeConstraintSet].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteSizeConstraintSet] request.
                 
                  }
             {-  Submit a [DeleteSizeConstraintSet] request.
                 
                  }
             }
   *)

  
end

module DeleteSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_sql_injection_match_set_request ->
        (delete_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [SqlInjectionMatchSet]. You can't delete a [SqlInjectionMatchSet] if it's still used in any [Rules] or if it still contains any [SqlInjectionMatchTuple] objects.
    
     If you just want to remove a [SqlInjectionMatchSet] from a [Rule], use [UpdateRule].
     
      To permanently delete a [SqlInjectionMatchSet] from AWS WAF, perform the following steps:
      
       {ol
             {-  Update the [SqlInjectionMatchSet] to remove filters, if any. For more information, see [UpdateSqlInjectionMatchSet].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteSqlInjectionMatchSet] request.
                 
                  }
             {-  Submit a [DeleteSqlInjectionMatchSet] request.
                 
                  }
             }
   *)

  
end

module DeleteWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_web_acl_request ->
        (delete_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes a [WebACL]. You can't delete a [WebACL] if it still contains any [Rules].
    
     To delete a [WebACL], perform the following steps:
     
      {ol
            {-  Update the [WebACL] to remove [Rules], if any. For more information, see [UpdateWebACL].
                
                 }
            {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteWebACL] request.
                
                 }
            {-  Submit a [DeleteWebACL] request.
                
                 }
            }
   *)

  
end

module DeleteXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_xss_match_set_request ->
        (delete_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Permanently deletes an [XssMatchSet]. You can't delete an [XssMatchSet] if it's still used in any [Rules] or if it still contains any [XssMatchTuple] objects.
    
     If you just want to remove an [XssMatchSet] from a [Rule], use [UpdateRule].
     
      To permanently delete an [XssMatchSet] from AWS WAF, perform the following steps:
      
       {ol
             {-  Update the [XssMatchSet] to remove filters, if any. For more information, see [UpdateXssMatchSet].
                 
                  }
             {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteXssMatchSet] request.
                 
                  }
             {-  Submit a [DeleteXssMatchSet] request.
                 
                  }
             }
   *)

  
end

module GetByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_byte_match_set_request ->
        (get_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [ByteMatchSet] specified by [ByteMatchSetId].
     *)

  
end

module GetChangeToken : sig
  val request :
    Smaws_Lib.Context.t ->
      get_change_token_request ->
        (get_change_token_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    When you want to create, update, or delete AWS WAF objects, get a change token and include the change token in the create, update, or delete request. Change tokens ensure that your application doesn't submit conflicting requests to AWS WAF.
    
     Each create, update, or delete request must use a unique change token. If your application submits a [GetChangeToken] request and then submits a second [GetChangeToken] request before submitting a create, update, or delete request, the second [GetChangeToken] request returns the same value as the first [GetChangeToken] request.
     
      When you use a change token in a create, update, or delete request, the status of the change token changes to [PENDING], which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use [GetChangeTokenStatus] to determine the status of your change token.
       *)

  
end

module GetChangeTokenStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_change_token_status_request ->
        (get_change_token_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the status of a [ChangeToken] that you got by calling [GetChangeToken]. [ChangeTokenStatus] is one of the following values:
    
     {ul
           {-   [PROVISIONED]: You requested the change token by calling [GetChangeToken], but you haven't used it yet in a call to create, update, or delete an AWS WAF object.
               
                }
           {-   [PENDING]: AWS WAF is propagating the create, update, or delete request to all AWS WAF servers.
               
                }
           {-   [INSYNC]: Propagation is complete.
               
                }
           }
   *)

  
end

module GetGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_geo_match_set_request ->
        (get_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [GeoMatchSet] that is specified by [GeoMatchSetId].
     *)

  
end

module GetIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ip_set_request ->
        (get_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [IPSet] that is specified by [IPSetId].
     *)

  
end

module GetLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      get_logging_configuration_request ->
        (get_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [LoggingConfiguration] for the specified web ACL.
     *)

  
end

module GetPermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_permission_policy_request ->
        (get_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the IAM policy attached to the RuleGroup.
     *)

  
end

module GetRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_rule_request ->
        (get_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [RateBasedRule] that is specified by the [RuleId] that you included in the [GetRateBasedRule] request.
     *)

  
end

module GetRateBasedRuleManagedKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_rule_managed_keys_request ->
        (get_rate_based_rule_managed_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of IP addresses currently being blocked by the [RateBasedRule] that is specified by the [RuleId]. The maximum number of managed keys that will be blocked is 10,000. If more than 10,000 addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.
     *)

  
end

module GetRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_match_set_request ->
        (get_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [RegexMatchSet] specified by [RegexMatchSetId].
     *)

  
end

module GetRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_pattern_set_request ->
        (get_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [RegexPatternSet] specified by [RegexPatternSetId].
     *)

  
end

module GetRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_request ->
        (get_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [Rule] that is specified by the [RuleId] that you included in the [GetRule] request.
     *)

  
end

module GetRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_group_request ->
        (get_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [RuleGroup] that is specified by the [RuleGroupId] that you included in the [GetRuleGroup] request.
    
     To view the rules in a rule group, use [ListActivatedRulesInRuleGroup].
      *)

  
end

module GetSampledRequests : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sampled_requests_request ->
        (get_sampled_requests_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Gets detailed information about a specified number of requests--a sample--that AWS WAF randomly selects from among the first 5,000 requests that your AWS resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.
    
      [GetSampledRequests] returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, [GetSampledRequests] returns an updated time range. This new time range indicates the actual period during which AWS WAF selected the requests in the sample.
      *)

  
end

module GetSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_size_constraint_set_request ->
        (get_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [SizeConstraintSet] specified by [SizeConstraintSetId].
     *)

  
end

module GetSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sql_injection_match_set_request ->
        (get_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [SqlInjectionMatchSet] that is specified by [SqlInjectionMatchSetId].
     *)

  
end

module GetWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_request ->
        (get_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [WebACL] that is specified by [WebACLId].
     *)

  
end

module GetXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_xss_match_set_request ->
        (get_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns the [XssMatchSet] that is specified by [XssMatchSetId].
     *)

  
end

module ListActivatedRulesInRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activated_rules_in_rule_group_request ->
        (list_activated_rules_in_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [ActivatedRule] objects.
     *)

  
end

module ListByteMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_byte_match_sets_request ->
        (list_byte_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [ByteMatchSetSummary] objects.
     *)

  
end

module ListGeoMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_geo_match_sets_request ->
        (list_geo_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [GeoMatchSetSummary] objects in the response.
     *)

  
end

module ListIPSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_sets_request ->
        (list_ip_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [IPSetSummary] objects in the response.
     *)

  
end

module ListLoggingConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_logging_configurations_request ->
        (list_logging_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [LoggingConfiguration] objects.
     *)

  
end

module ListRateBasedRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rate_based_rules_request ->
        (list_rate_based_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [RuleSummary] objects.
     *)

  
end

module ListRegexMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_match_sets_request ->
        (list_regex_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [RegexMatchSetSummary] objects.
     *)

  
end

module ListRegexPatternSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_pattern_sets_request ->
        (list_regex_pattern_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [RegexPatternSetSummary] objects.
     *)

  
end

module ListRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_groups_request ->
        (list_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [RuleGroup] objects.
     *)

  
end

module ListRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [RuleSummary] objects.
     *)

  
end

module ListSizeConstraintSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_size_constraint_sets_request ->
        (list_size_constraint_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [SizeConstraintSetSummary] objects.
     *)

  
end

module ListSqlInjectionMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_sql_injection_match_sets_request ->
        (list_sql_injection_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [SqlInjectionMatchSet] objects.
     *)

  
end

module ListSubscribedRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_subscribed_rule_groups_request ->
        (list_subscribed_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [RuleGroup] objects that you are subscribed to.
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  [@@ocaml.doc {|  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Retrieves the tags associated with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.
    
     Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. 
      |}]

  
end

module ListWebACLs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_web_ac_ls_request ->
        (list_web_ac_ls_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [WebACLSummary] objects in the response.
     *)

  
end

module ListXssMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_xss_match_sets_request ->
        (list_xss_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Returns an array of [XssMatchSet] objects.
     *)

  
end

module PutLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_logging_configuration_request ->
        (put_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Associates a [LoggingConfiguration] with a specified web ACL.
    
     You can access information about all traffic that AWS WAF inspects using the following steps:
     
      {ol
            {-  Create an Amazon Kinesis Data Firehose. 
                
                 Create the data firehose with a PUT source and in the region that you are operating. However, if you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia). 
                 
                   Do not create the data firehose using a [Kinesis stream] as your source.
                   
                     }
            {-  Associate that firehose to your web ACL using a [PutLoggingConfiguration] request.
                
                 }
            }
   When you successfully enable logging using a [PutLoggingConfiguration] request, AWS WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging Web ACL Traffic Information} in the {i AWS WAF Developer Guide}.
    *)

  
end

module PutPermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_policy_request ->
        (put_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Attaches an IAM policy to the specified resource. The only supported use for this action is to share a RuleGroup across accounts.
    
     The [PutPermissionPolicy] is subject to the following restrictions:
     
      {ul
            {-  You can attach only one policy with each [PutPermissionPolicy] request.
                
                 }
            {-  The policy must include an [Effect], [Action] and [Principal]. 
                
                 }
            {-   [Effect] must specify [Allow].
                
                 }
            {-  The [Action] in the policy must be [waf:UpdateWebACL], [waf-regional:UpdateWebACL], [waf:GetRuleGroup] and [waf-regional:GetRuleGroup] . Any extra or wildcard actions in the policy will be rejected.
                
                 }
            {-  The policy cannot include a [Resource] parameter.
                
                 }
            {-  The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.
                
                 }
            {-  The user making the request must be the owner of the RuleGroup.
                
                 }
            {-  Your policy must be composed using IAM Policy version 2012-10-17.
                
                 }
            }
   For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM Policies}. 
   
    An example of a valid policy parameter is shown in the Examples section below.
     *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  [@@ocaml.doc {|  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Associates tags with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.
    
     Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can use this action to tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. 
      |}]

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    
     *)

  
end

module UpdateByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_byte_match_set_request ->
        (update_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [ByteMatchTuple] objects (filters) in a [ByteMatchSet]. For each [ByteMatchTuple] object, you specify the following values: 
    
     {ul
           {-  Whether to insert or delete the object from the array. If you want to change a [ByteMatchSetUpdate] object, you delete the existing object and add a new one.
               
                }
           {-  The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the [User-Agent] header. 
               
                }
           {-  The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to look for. For more information, including how you specify the values for the AWS WAF API and the AWS CLI or SDKs, see [TargetString] in the [ByteMatchTuple] data type. 
               
                }
           {-  Where to look, such as at the beginning or the end of a query string.
               
                }
           {-  Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.
               
                }
           }
   For example, you can add a [ByteMatchSetUpdate] object that matches web requests in which [User-Agent] headers contain the string [BadBot]. You can then configure AWS WAF to block those requests.
   
    To create and configure a [ByteMatchSet], perform the following steps:
    
     {ol
           {-  Create a [ByteMatchSet.] For more information, see [CreateByteMatchSet].
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateByteMatchSet] request.
               
                }
           {-  Submit an [UpdateByteMatchSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
               
                }
           }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module UpdateGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_geo_match_set_request ->
        (update_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [GeoMatchConstraint] objects in an [GeoMatchSet]. For each [GeoMatchConstraint] object, you specify the following values: 
    
     {ul
           {-  Whether to insert or delete the object from the array. If you want to change an [GeoMatchConstraint] object, you delete the existing object and add a new one.
               
                }
           {-  The [Type]. The only valid value for [Type] is [Country].
               
                }
           {-  The [Value], which is a two character code for the country to add to the [GeoMatchConstraint] object. Valid codes are listed in [GeoMatchConstraint$Value].
               
                }
           }
   To create and configure an [GeoMatchSet], perform the following steps:
   
    {ol
          {-  Submit a [CreateGeoMatchSet] request.
              
               }
          {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateGeoMatchSet] request.
              
               }
          {-  Submit an [UpdateGeoMatchSet] request to specify the country that you want AWS WAF to watch for.
              
               }
          }
   When you update an [GeoMatchSet], you specify the country that you want to add and/or the country that you want to delete. If you want to change a country, you delete the existing country and add the new one.
   
    For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
     *)

  
end

module UpdateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ip_set_request ->
        (update_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [IPSetDescriptor] objects in an [IPSet]. For each [IPSetDescriptor] object, you specify the following values: 
    
     {ul
           {-  Whether to insert or delete the object from the array. If you want to change an [IPSetDescriptor] object, you delete the existing object and add a new one.
               
                }
           {-  The IP address version, [IPv4] or [IPv6]. 
               
                }
           {-  The IP address in CIDR notation, for example, [192.0.2.0/24] (for the range of IP addresses from [192.0.2.0] to [192.0.2.255]) or [192.0.2.44/32] (for the individual IP address [192.0.2.44]). 
               
                }
           }
   AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.
   
    IPv6 addresses can be represented using any of the following formats:
    
     {ul
           {-  1111:0000:0000:0000:0000:0000:0000:0111/128
               
                }
           {-  1111:0:0:0:0:0:0:0111/128
               
                }
           {-  1111::0111/128
               
                }
           {-  1111::111/128
               
                }
           }
   You use an [IPSet] to specify which web requests you want to allow or block based on the IP addresses that the requests originated from. For example, if you're receiving a lot of requests from one or a small number of IP addresses and you want to block the requests, you can create an [IPSet] that specifies those IP addresses, and then configure AWS WAF to block the requests. 
   
    To create and configure an [IPSet], perform the following steps:
    
     {ol
           {-  Submit a [CreateIPSet] request.
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateIPSet] request.
               
                }
           {-  Submit an [UpdateIPSet] request to specify the IP addresses that you want AWS WAF to watch for.
               
                }
           }
   When you update an [IPSet], you specify the IP addresses that you want to add and/or the IP addresses that you want to delete. If you want to change an IP address, you delete the existing IP address and add the new one.
   
    You can insert a maximum of 1000 addresses in a single request.
    
     For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
      *)

  
end

module UpdateRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rate_based_rule_request ->
        (update_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [Predicate] objects in a rule and updates the [RateLimit] in the rule. 
    
     Each [Predicate] object identifies a predicate, such as a [ByteMatchSet] or an [IPSet], that specifies the web requests that you want to block or count. The [RateLimit] specifies the number of requests every five minutes that triggers the rule.
     
      If you add more than one predicate to a [RateBasedRule], a request must match all the predicates and exceed the [RateLimit] to be counted or blocked. For example, suppose you add the following to a [RateBasedRule]:
      
       {ul
             {-  An [IPSet] that matches the IP address [192.0.2.44/32] 
                 
                  }
             {-  A [ByteMatchSet] that matches [BadBot] in the [User-Agent] header
                 
                  }
             }
   Further, you specify a [RateLimit] of 1,000.
   
    You then add the [RateBasedRule] to a [WebACL] and specify that you want to block requests that satisfy the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 {i and} the [User-Agent] header in the request must contain the value [BadBot]. Further, requests that match these two conditions much be received at a rate of more than 1,000 every five minutes. If the rate drops below this limit, AWS WAF no longer blocks the requests.
    
     As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a [RateBasedRule]:
     
      {ul
            {-  A [ByteMatchSet] with [FieldToMatch] of [URI] 
                
                 }
            {-  A [PositionalConstraint] of [STARTS_WITH] 
                
                 }
            {-  A [TargetString] of [login] 
                
                 }
            }
   Further, you specify a [RateLimit] of 1,000.
   
    By adding this [RateBasedRule] to a [WebACL], you could limit requests to your login page without affecting the rest of your site.
     *)

  
end

module UpdateRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_match_set_request ->
        (update_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [RegexMatchTuple] objects (filters) in a [RegexMatchSet]. For each [RegexMatchSetUpdate] object, you specify the following values: 
    
     {ul
           {-  Whether to insert or delete the object from the array. If you want to change a [RegexMatchSetUpdate] object, you delete the existing object and add a new one.
               
                }
           {-  The part of a web request that you want AWS WAF to inspectupdate, such as a query string or the value of the [User-Agent] header. 
               
                }
           {-  The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see [RegexPatternSet]. 
               
                }
           {-  Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.
               
                }
           }
    For example, you can create a [RegexPatternSet] that matches any requests with [User-Agent] headers that contain the string [B\[a@\]dB\[o0\]t]. You can then configure AWS WAF to reject those requests.
   
    To create and configure a [RegexMatchSet], perform the following steps:
    
     {ol
           {-  Create a [RegexMatchSet.] For more information, see [CreateRegexMatchSet].
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRegexMatchSet] request.
               
                }
           {-  Submit an [UpdateRegexMatchSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the identifier of the [RegexPatternSet] that contain the regular expression patters you want AWS WAF to watch for.
               
                }
           }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module UpdateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_pattern_set_request ->
        (update_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidRegexPatternException of waf_invalid_regex_pattern_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [RegexPatternString] objects in a [RegexPatternSet]. For each [RegexPatternString] object, you specify the following values: 
    
     {ul
           {-  Whether to insert or delete the [RegexPatternString].
               
                }
           {-  The regular expression pattern that you want to insert or delete. For more information, see [RegexPatternSet]. 
               
                }
           }
    For example, you can create a [RegexPatternString] such as [B\[a@\]dB\[o0\]t]. AWS WAF will match this [RegexPatternString] to:
   
    {ul
          {-  BadBot
              
               }
          {-  BadB0t
              
               }
          {-  B\@dBot
              
               }
          {-  B\@dB0t
              
               }
          }
   To create and configure a [RegexPatternSet], perform the following steps:
   
    {ol
          {-  Create a [RegexPatternSet.] For more information, see [CreateRegexPatternSet].
              
               }
          {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRegexPatternSet] request.
              
               }
          {-  Submit an [UpdateRegexPatternSet] request to specify the regular expression pattern that you want AWS WAF to watch for.
              
               }
          }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module UpdateRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_request ->
        (update_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [Predicate] objects in a [Rule]. Each [Predicate] object identifies a predicate, such as a [ByteMatchSet] or an [IPSet], that specifies the web requests that you want to allow, block, or count. If you add more than one predicate to a [Rule], a request must match all of the specifications to be allowed, blocked, or counted. For example, suppose that you add the following to a [Rule]: 
    
     {ul
           {-  A [ByteMatchSet] that matches the value [BadBot] in the [User-Agent] header
               
                }
           {-  An [IPSet] that matches the IP address [192.0.2.44] 
               
                }
           }
   You then add the [Rule] to a [WebACL] and specify that you want to block requests that satisfy the [Rule]. For a request to be blocked, the [User-Agent] header in the request must contain the value [BadBot] {i and} the request must originate from the IP address 192.0.2.44.
   
    To create and configure a [Rule], perform the following steps:
    
     {ol
           {-  Create and update the predicates that you want to include in the [Rule].
               
                }
           {-  Create the [Rule]. See [CreateRule].
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRule] request.
               
                }
           {-  Submit an [UpdateRule] request to add predicates to the [Rule].
               
                }
           {-  Create and update a [WebACL] that contains the [Rule]. See [CreateWebACL].
               
                }
           }
   If you want to replace one [ByteMatchSet] or [IPSet] with another, you delete the existing one and add the new one.
   
    For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
     *)

  
end

module UpdateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_group_request ->
        (update_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [ActivatedRule] objects in a [RuleGroup].
    
     You can only insert [REGULAR] rules into a rule group.
     
      You can have a maximum of ten rules per rule group.
      
       To create and configure a [RuleGroup], perform the following steps:
       
        {ol
              {-  Create and update the [Rules] that you want to include in the [RuleGroup]. See [CreateRule].
                  
                   }
              {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRuleGroup] request.
                  
                   }
              {-  Submit an [UpdateRuleGroup] request to add [Rules] to the [RuleGroup].
                  
                   }
              {-  Create and update a [WebACL] that contains the [RuleGroup]. See [CreateWebACL].
                  
                   }
              }
   If you want to replace one [Rule] with another, you delete the existing one and add the new one.
   
    For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
     *)

  
end

module UpdateSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_size_constraint_set_request ->
        (update_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [SizeConstraint] objects (filters) in a [SizeConstraintSet]. For each [SizeConstraint] object, you specify the following values: 
    
     {ul
           {-  Whether to insert or delete the object from the array. If you want to change a [SizeConstraintSetUpdate] object, you delete the existing object and add a new one.
               
                }
           {-  The part of a web request that you want AWS WAF to evaluate, such as the length of a query string or the length of the [User-Agent] header.
               
                }
           {-  Whether to perform any transformations on the request, such as converting it to lowercase, before checking its length. Note that transformations of the request body are not supported because the AWS resource forwards only the first [8192] bytes of your request to AWS WAF.
               
                You can only specify a single type of TextTransformation.
                
                 }
           {-  A [ComparisonOperator] used for evaluating the selected part of the request against the specified [Size], such as equals, greater than, less than, and so on.
               
                }
           {-  The length, in bytes, that you want AWS WAF to watch for in selected part of the request. The length is computed after applying the transformation.
               
                }
           }
   For example, you can add a [SizeConstraintSetUpdate] object that matches web requests in which the length of the [User-Agent] header is greater than 100 bytes. You can then configure AWS WAF to block those requests.
   
    To create and configure a [SizeConstraintSet], perform the following steps:
    
     {ol
           {-  Create a [SizeConstraintSet.] For more information, see [CreateSizeConstraintSet].
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateSizeConstraintSet] request.
               
                }
           {-  Submit an [UpdateSizeConstraintSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
               
                }
           }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module UpdateSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sql_injection_match_set_request ->
        (update_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [SqlInjectionMatchTuple] objects (filters) in a [SqlInjectionMatchSet]. For each [SqlInjectionMatchTuple] object, you specify the following values:
    
     {ul
           {-   [Action]: Whether to insert the object into or delete the object from the array. To change a [SqlInjectionMatchTuple], you delete the existing object and add a new one.
               
                }
           {-   [FieldToMatch]: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.
               
                }
           {-   [TextTransformation]: Which text transformation, if any, to perform on the web request before inspecting the request for snippets of malicious SQL code.
               
                You can only specify a single type of TextTransformation.
                
                 }
           }
   You use [SqlInjectionMatchSet] objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain snippets of SQL code in the query string and you want to block the requests, you can create a [SqlInjectionMatchSet] with the applicable settings, and then configure AWS WAF to block the requests. 
   
    To create and configure a [SqlInjectionMatchSet], perform the following steps:
    
     {ol
           {-  Submit a [CreateSqlInjectionMatchSet] request.
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateIPSet] request.
               
                }
           {-  Submit an [UpdateSqlInjectionMatchSet] request to specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code.
               
                }
           }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

module UpdateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      update_web_acl_request ->
        (update_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [ActivatedRule] objects in a [WebACL]. Each [Rule] identifies web requests that you want to allow, block, or count. When you update a [WebACL], you specify the following values:
    
     {ul
           {-  A default action for the [WebACL], either [ALLOW] or [BLOCK]. AWS WAF performs the default action if a request doesn't match the criteria in any of the [Rules] in a [WebACL].
               
                }
           {-  The [Rules] that you want to add or delete. If you want to replace one [Rule] with another, you delete the existing [Rule] and add the new one.
               
                }
           {-  For each [Rule], whether you want AWS WAF to allow requests, block requests, or count requests that match the conditions in the [Rule].
               
                }
           {-  The order in which you want AWS WAF to evaluate the [Rules] in a [WebACL]. If you add more than one [Rule] to a [WebACL], AWS WAF evaluates each request against the [Rules] in order based on the value of [Priority]. (The [Rule] that has the lowest value for [Priority] is evaluated first.) When a web request matches all the predicates (such as [ByteMatchSets] and [IPSets]) in a [Rule], AWS WAF immediately takes the corresponding action, allow or block, and doesn't evaluate the request against the remaining [Rules] in the [WebACL], if any. 
               
                }
           }
   To create and configure a [WebACL], perform the following steps:
   
    {ol
          {-  Create and update the predicates that you want to include in [Rules]. For more information, see [CreateByteMatchSet], [UpdateByteMatchSet], [CreateIPSet], [UpdateIPSet], [CreateSqlInjectionMatchSet], and [UpdateSqlInjectionMatchSet].
              
               }
          {-  Create and update the [Rules] that you want to include in the [WebACL]. For more information, see [CreateRule] and [UpdateRule].
              
               }
          {-  Create a [WebACL]. See [CreateWebACL].
              
               }
          {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateWebACL] request.
              
               }
          {-  Submit an [UpdateWebACL] request to specify the [Rules] that you want to include in the [WebACL], to specify the default action, and to associate the [WebACL] with a CloudFront distribution. 
              
               The [ActivatedRule] can be a rule group. If you specify a rule group as your [ActivatedRule] , you can exclude specific rules from that rule group.
               
                If you already have a rule group associated with a web ACL and want to submit an [UpdateWebACL] request to exclude certain rules from that rule group, you must first remove the rule group from the web ACL, the re-insert it again, specifying the excluded rules. For details, see [ActivatedRule$ExcludedRules] . 
                
                 }
          }
   Be aware that if you try to add a RATE_BASED rule to a web ACL without setting the rule type when first creating the rule, the [UpdateWebACL] request will fail because the request tries to add a REGULAR rule (the default rule type) with the specified ID, which does not exist. 
   
    For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
     *)

  
end

module UpdateXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_xss_match_set_request ->
        (update_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (**  This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
 
   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. 
  
    Inserts or deletes [XssMatchTuple] objects (filters) in an [XssMatchSet]. For each [XssMatchTuple] object, you specify the following values:
    
     {ul
           {-   [Action]: Whether to insert the object into or delete the object from the array. To change an [XssMatchTuple], you delete the existing object and add a new one.
               
                }
           {-   [FieldToMatch]: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.
               
                }
           {-   [TextTransformation]: Which text transformation, if any, to perform on the web request before inspecting the request for cross-site scripting attacks.
               
                You can only specify a single type of TextTransformation.
                
                 }
           }
   You use [XssMatchSet] objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain cross-site scripting attacks in the request body and you want to block the requests, you can create an [XssMatchSet] with the applicable settings, and then configure AWS WAF to block the requests. 
   
    To create and configure an [XssMatchSet], perform the following steps:
    
     {ol
           {-  Submit a [CreateXssMatchSet] request.
               
                }
           {-  Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateIPSet] request.
               
                }
           {-  Submit an [UpdateXssMatchSet] request to specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks.
               
                }
           }
   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
    *)

  
end

