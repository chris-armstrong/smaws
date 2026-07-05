type nonrec error_message = string [@@ocaml.doc ""]

type nonrec match_field_type =
  | ALL_QUERY_ARGS [@ocaml.doc ""]
  | SINGLE_QUERY_ARG [@ocaml.doc ""]
  | BODY [@ocaml.doc ""]
  | METHOD [@ocaml.doc ""]
  | HEADER [@ocaml.doc ""]
  | QUERY_STRING [@ocaml.doc ""]
  | URI [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec match_field_data = string [@@ocaml.doc ""]

type nonrec field_to_match = {
  data : match_field_data option;
      [@ocaml.doc
        "When the value of [Type] is [HEADER], enter the name of the header that you want AWS WAF \
         to search, for example, [User-Agent] or [Referer]. The name of the header is not case \
         sensitive.\n\n\
        \ When the value of [Type] is [SINGLE_QUERY_ARG], enter the name of the parameter that you \
         want AWS WAF to search, for example, [UserName] or [SalesRegion]. The parameter name is \
         not case sensitive.\n\
        \ \n\
        \  If the value of [Type] is any other value, omit [Data].\n\
        \  "]
  type_ : match_field_type;
      [@ocaml.doc
        "The part of the web request that you want AWS WAF to search for a specified string. Parts \
         of a request that you can search include the following:\n\n\
        \ {ul\n\
        \       {-   [HEADER]: A specified request header, for example, the value of the \
         [User-Agent] or [Referer] header. If you choose [HEADER] for the type, specify the name \
         of the header in [Data].\n\
        \           \n\
        \            }\n\
        \       {-   [METHOD]: The HTTP method, which indicated the type of operation that the \
         request is asking the origin to perform. Amazon CloudFront supports the following \
         methods: [DELETE], [GET], [HEAD], [OPTIONS], [PATCH], [POST], and [PUT].\n\
        \           \n\
        \            }\n\
        \       {-   [QUERY_STRING]: A query string, which is the part of a URL that appears after \
         a [?] character, if any.\n\
        \           \n\
        \            }\n\
        \       {-   [URI]: The part of a web request that identifies a resource, for example, \
         [/images/daily-ad.jpg].\n\
        \           \n\
        \            }\n\
        \       {-   [BODY]: The part of a request that contains any additional data that you want \
         to send to your web server as the HTTP request body, such as data from a form. The \
         request body immediately follows the request headers. Note that only the first [8192] \
         bytes of the request body are forwarded to AWS WAF for inspection. To allow or block \
         requests based on the length of the body, you can create a size constraint set. For more \
         information, see [CreateSizeConstraintSet]. \n\
        \           \n\
        \            }\n\
        \       {-   [SINGLE_QUERY_ARG]: The parameter in the query string that you will inspect, \
         such as {i UserName} or {i SalesRegion}. The maximum length for [SINGLE_QUERY_ARG] is 30 \
         characters.\n\
        \           \n\
        \            }\n\
        \       {-   [ALL_QUERY_ARGS]: Similar to [SINGLE_QUERY_ARG], but rather than inspecting a \
         single parameter, AWS WAF will inspect all parameters within the query for the value or \
         regex pattern that you specify in [TargetString].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies where in a web request to look for [TargetString].\n\
  \    "]

type nonrec text_transformation =
  | URL_DECODE [@ocaml.doc ""]
  | CMD_LINE [@ocaml.doc ""]
  | LOWERCASE [@ocaml.doc ""]
  | HTML_ENTITY_DECODE [@ocaml.doc ""]
  | COMPRESS_WHITE_SPACE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec xss_match_tuple = {
  text_transformation : text_transformation;
      [@ocaml.doc
        "Text transformations eliminate some of the unusual formatting that attackers use in web \
         requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF \
         performs the transformation on [FieldToMatch] before inspecting it for a match.\n\n\
        \ You can only specify a single type of TextTransformation.\n\
        \ \n\
        \   {b CMD_LINE} \n\
        \  \n\
        \   When you're concerned that attackers are injecting an operating system command line \
         command and using unusual formatting to disguise some or all of the command, use this \
         option to perform the following transformations:\n\
        \   \n\
        \    {ul\n\
        \          {-  Delete the following characters: \\ \" ' ^\n\
        \              \n\
        \               }\n\
        \          {-  Delete spaces before the following characters: / (\n\
        \              \n\
        \               }\n\
        \          {-  Replace the following characters with a space: , ;\n\
        \              \n\
        \               }\n\
        \          {-  Replace multiple spaces with one space\n\
        \              \n\
        \               }\n\
        \          {-  Convert uppercase letters (A-Z) to lowercase (a-z)\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b COMPRESS_WHITE_SPACE} \n\
        \   \n\
        \    Use this option to replace the following characters with a space character (decimal \
         32):\n\
        \    \n\
        \     {ul\n\
        \           {-  \\f, formfeed, decimal 12\n\
        \               \n\
        \                }\n\
        \           {-  \\t, tab, decimal 9\n\
        \               \n\
        \                }\n\
        \           {-  \\n, newline, decimal 10\n\
        \               \n\
        \                }\n\
        \           {-  \\r, carriage return, decimal 13\n\
        \               \n\
        \                }\n\
        \           {-  \\v, vertical tab, decimal 11\n\
        \               \n\
        \                }\n\
        \           {-  non-breaking space, decimal 160\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.\n\
        \   \n\
        \     {b HTML_ENTITY_DECODE} \n\
        \    \n\
        \     Use this option to replace HTML-encoded characters with unencoded characters. \
         [HTML_ENTITY_DECODE] performs the following operations:\n\
        \     \n\
        \      {ul\n\
        \            {-  Replaces [(ampersand)quot;] with [\"] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)lt;] with a \"less than\" symbol\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)gt;] with [>] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in hexadecimal format, \
         [(ampersand)#xhhhh;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in decimal format, \
         [(ampersand)#nnnn;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \    {b LOWERCASE} \n\
        \   \n\
        \    Use this option to convert uppercase letters (A-Z) to lowercase (a-z).\n\
        \    \n\
        \      {b URL_DECODE} \n\
        \     \n\
        \      Use this option to decode a URL-encoded value.\n\
        \      \n\
        \        {b NONE} \n\
        \       \n\
        \        Specify [NONE] if you don't want to perform any text transformations.\n\
        \        "]
  field_to_match : field_to_match;
      [@ocaml.doc "Specifies where in a web request to look for cross-site scripting attacks.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the part of a web request that you want AWS WAF to inspect for cross-site \
   scripting attacks and, if you want AWS WAF to inspect a header, the name of the header.\n\
  \    "]

type nonrec xss_match_tuples = xss_match_tuple list [@@ocaml.doc ""]

type nonrec change_action = DELETE [@ocaml.doc ""] | INSERT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec xss_match_set_update = {
  xss_match_tuple : xss_match_tuple;
      [@ocaml.doc
        "Specifies the part of a web request that you want AWS WAF to inspect for cross-site \
         scripting attacks and, if you want AWS WAF to inspect a header, the name of the header.\n"]
  action : change_action;
      [@ocaml.doc
        "Specify [INSERT] to add an [XssMatchSetUpdate] to an [XssMatchSet]. Use [DELETE] to \
         remove an [XssMatchSetUpdate] from an [XssMatchSet].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the part of a web request that you want to inspect for cross-site scripting \
   attacks and indicates whether you want to add the specification to an [XssMatchSet] or delete \
   it from an [XssMatchSet].\n\
  \    "]

type nonrec xss_match_set_updates = xss_match_set_update list [@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec xss_match_set_summary = {
  name : resource_name; [@ocaml.doc "The name of the [XssMatchSet], if any, specified by [Id].\n"]
  xss_match_set_id : resource_id;
      [@ocaml.doc
        "A unique identifier for an [XssMatchSet]. You use [XssMatchSetId] to get information \
         about a [XssMatchSet] (see [GetXssMatchSet]), update an [XssMatchSet] (see \
         [UpdateXssMatchSet]), insert an [XssMatchSet] into a [Rule] or delete one from a [Rule] \
         (see [UpdateRule]), and delete an [XssMatchSet] from AWS WAF (see [DeleteXssMatchSet]).\n\n\
        \  [XssMatchSetId] is returned by [CreateXssMatchSet] and by [ListXssMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The [Id] and [Name] of an [XssMatchSet].\n\
  \    "]

type nonrec xss_match_set_summaries = xss_match_set_summary list [@@ocaml.doc ""]

type nonrec xss_match_set = {
  xss_match_tuples : xss_match_tuples;
      [@ocaml.doc
        "Specifies the parts of web requests that you want to inspect for cross-site scripting \
         attacks.\n"]
  name : resource_name option; [@ocaml.doc "The name, if any, of the [XssMatchSet].\n"]
  xss_match_set_id : resource_id;
      [@ocaml.doc
        "A unique identifier for an [XssMatchSet]. You use [XssMatchSetId] to get information \
         about an [XssMatchSet] (see [GetXssMatchSet]), update an [XssMatchSet] (see \
         [UpdateXssMatchSet]), insert an [XssMatchSet] into a [Rule] or delete one from a [Rule] \
         (see [UpdateRule]), and delete an [XssMatchSet] from AWS WAF (see [DeleteXssMatchSet]).\n\n\
        \  [XssMatchSetId] is returned by [CreateXssMatchSet] and by [ListXssMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    A complex type that contains [XssMatchTuple] objects, which specify the parts of web \
   requests that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS \
   WAF to inspect a header, the name of the header. If a [XssMatchSet] contains more than one \
   [XssMatchTuple] object, a request needs to include cross-site scripting attacks in only one of \
   the specified parts of the request to be considered a match.\n\
  \    "]

type nonrec rule_priority = int [@@ocaml.doc ""]

type nonrec waf_action_type =
  | COUNT [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""]
  | BLOCK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec waf_action = {
  type_ : waf_action_type;
      [@ocaml.doc
        "Specifies how you want AWS WAF to respond to requests that match the settings in a \
         [Rule]. Valid settings include the following:\n\n\
        \ {ul\n\
        \       {-   [ALLOW]: AWS WAF allows requests\n\
        \           \n\
        \            }\n\
        \       {-   [BLOCK]: AWS WAF blocks requests\n\
        \           \n\
        \            }\n\
        \       {-   [COUNT]: AWS WAF increments a counter of the requests that match all of the \
         conditions in the rule. AWS WAF then continues to inspect the web request based on the \
         remaining rules in the web ACL. You can't specify [COUNT] for the default action for a \
         [WebACL].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    For the action that is associated with a rule in a [WebACL], specifies the action that you \
   want AWS WAF to perform when a web request matches all of the conditions in a rule. For the \
   default action in a [WebACL], specifies the action that you want AWS WAF to take when a web \
   request doesn't match all of the conditions in any of the rules in a [WebACL]. \n\
  \    "]

type nonrec waf_override_action_type = COUNT [@ocaml.doc ""] | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec waf_override_action = {
  type_ : waf_override_action_type;
      [@ocaml.doc
        " [COUNT] overrides the action specified by the individual rule within a [RuleGroup] . If \
         set to [NONE], the rule's action will take place.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The action to take if any rule within the [RuleGroup] matches a request. \n\
  \    "]

type nonrec waf_rule_type =
  | GROUP [@ocaml.doc ""]
  | RATE_BASED [@ocaml.doc ""]
  | REGULAR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec excluded_rule = {
  rule_id : resource_id;
      [@ocaml.doc "The unique identifier for the rule to exclude from the rule group.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The rule to exclude from a rule group. This is applicable only when the [ActivatedRule] \
   refers to a [RuleGroup]. The rule must belong to the [RuleGroup] that is specified by the \
   [ActivatedRule]. \n\
  \    "]

type nonrec excluded_rules = excluded_rule list [@@ocaml.doc ""]

type nonrec activated_rule = {
  excluded_rules : excluded_rules option;
      [@ocaml.doc
        "An array of rules to exclude from a rule group. This is applicable only when the \
         [ActivatedRule] refers to a [RuleGroup].\n\n\
        \ Sometimes it is necessary to troubleshoot rule groups that are blocking traffic \
         unexpectedly (false positives). One troubleshooting technique is to identify the specific \
         rule within the rule group that is blocking the legitimate traffic and then disable \
         (exclude) that particular rule. You can exclude rules from both your own rule groups and \
         AWS Marketplace rule groups that have been associated with a web ACL.\n\
        \ \n\
        \  Specifying [ExcludedRules] does not remove those rules from the rule group. Rather, it \
         changes the action for the rules to [COUNT]. Therefore, requests that match an \
         [ExcludedRule] are counted but not blocked. The [RuleGroup] owner will receive COUNT \
         metrics for each [ExcludedRule].\n\
        \  \n\
        \   If you want to exclude rules from a rule group that is already associated with a web \
         ACL, perform the following steps:\n\
        \   \n\
        \    {ol\n\
        \          {-  Use the AWS WAF logs to identify the IDs of the rules that you want to \
         exclude. For more information about the logs, see \
         {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging Web ACL \
         Traffic Information}.\n\
        \              \n\
        \               }\n\
        \          {-  Submit an [UpdateWebACL] request that has two actions:\n\
        \              \n\
        \               {ul\n\
        \                     {-  The first action deletes the existing rule group from the web \
         ACL. That is, in the [UpdateWebACL] request, the first [Updates:Action] should be \
         [DELETE] and [Updates:ActivatedRule:RuleId] should be the rule group that contains the \
         rules that you want to exclude.\n\
        \                         \n\
        \                          }\n\
        \                     {-  The second action inserts the same rule group back in, but \
         specifying the rules to exclude. That is, the second [Updates:Action] should be [INSERT], \
         [Updates:ActivatedRule:RuleId] should be the rule group that you just removed, and \
         [ExcludedRules] should contain the rules that you want to exclude.\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          }\n\
        \  "]
  type_ : waf_rule_type option;
      [@ocaml.doc
        "The rule type, either [REGULAR], as defined by [Rule], [RATE_BASED], as defined by \
         [RateBasedRule], or [GROUP], as defined by [RuleGroup]. The default is REGULAR. Although \
         this field is optional, be aware that if you try to add a RATE_BASED rule to a web ACL \
         without setting the type, the [UpdateWebACL] request will fail because the request tries \
         to add a REGULAR rule with the specified ID, which does not exist. \n"]
  override_action : waf_override_action option;
      [@ocaml.doc
        "Use the [OverrideAction] to test your [RuleGroup].\n\n\
        \ Any rule in a [RuleGroup] can potentially block a request. If you set the \
         [OverrideAction] to [None], the [RuleGroup] will block a request if any individual rule \
         in the [RuleGroup] matches the request and is configured to block that request. However \
         if you first want to test the [RuleGroup], set the [OverrideAction] to [Count]. The \
         [RuleGroup] will then override any block action specified by individual rules contained \
         within the group. Instead of blocking matching requests, those requests will be counted. \
         You can view a record of counted requests using [GetSampledRequests]. \n\
        \ \n\
        \   [ActivatedRule|OverrideAction] applies only when updating or adding a [RuleGroup] to a \
         [WebACL]. In this case you do not use [ActivatedRule|Action]. For all other update \
         requests, [ActivatedRule|Action] is used instead of [ActivatedRule|OverrideAction].\n\
        \  "]
  action : waf_action option;
      [@ocaml.doc
        "Specifies the action that CloudFront or AWS WAF takes when a web request matches the \
         conditions in the [Rule]. Valid values for [Action] include the following:\n\n\
        \ {ul\n\
        \       {-   [ALLOW]: CloudFront responds with the requested object.\n\
        \           \n\
        \            }\n\
        \       {-   [BLOCK]: CloudFront responds with an HTTP 403 (Forbidden) status code.\n\
        \           \n\
        \            }\n\
        \       {-   [COUNT]: AWS WAF increments a counter of requests that match the conditions \
         in the rule and then continues to inspect the web request based on the remaining rules in \
         the web ACL. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [ActivatedRule|OverrideAction] applies only when updating or adding a [RuleGroup] to \
         a [WebACL]. In this case, you do not use [ActivatedRule|Action]. For all other update \
         requests, [ActivatedRule|Action] is used instead of [ActivatedRule|OverrideAction].\n\
        \   "]
  rule_id : resource_id;
      [@ocaml.doc
        "The [RuleId] for a [Rule]. You use [RuleId] to get more information about a [Rule] (see \
         [GetRule]), update a [Rule] (see [UpdateRule]), insert a [Rule] into a [WebACL] or delete \
         a one from a [WebACL] (see [UpdateWebACL]), or delete a [Rule] from AWS WAF (see \
         [DeleteRule]).\n\n\
        \  [RuleId] is returned by [CreateRule] and by [ListRules].\n\
        \ "]
  priority : rule_priority;
      [@ocaml.doc
        "Specifies the order in which the [Rules] in a [WebACL] are evaluated. Rules with a lower \
         value for [Priority] are evaluated before [Rules] with a higher value. The value must be \
         a unique integer. If you add multiple [Rules] to a [WebACL], the values don't need to be \
         consecutive.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The [ActivatedRule] object in an [UpdateWebACL] request specifies a [Rule] that you want to \
   insert or delete, the priority of the [Rule] in the [WebACL], and the action that you want AWS \
   WAF to take when a web request matches the [Rule] ([ALLOW], [BLOCK], or [COUNT]).\n\
  \    \n\
  \     To specify whether to insert or delete a [Rule], use the [Action] parameter in the \
   [WebACLUpdate] data type.\n\
  \     "]

type nonrec web_acl_update = {
  activated_rule : activated_rule;
      [@ocaml.doc
        "The [ActivatedRule] object in an [UpdateWebACL] request specifies a [Rule] that you want \
         to insert or delete, the priority of the [Rule] in the [WebACL], and the action that you \
         want AWS WAF to take when a web request matches the [Rule] ([ALLOW], [BLOCK], or [COUNT]).\n"]
  action : change_action;
      [@ocaml.doc "Specifies whether to insert a [Rule] into or delete a [Rule] from a [WebACL].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies whether to insert a [Rule] into or delete a [Rule] from a [WebACL].\n\
  \    "]

type nonrec web_acl_updates = web_acl_update list [@@ocaml.doc ""]

type nonrec web_acl_summary = {
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [WebACL]. You can't change the name of a [WebACL] \
         after you create it.\n"]
  web_acl_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [WebACL]. You use [WebACLId] to get information about a \
         [WebACL] (see [GetWebACL]), update a [WebACL] (see [UpdateWebACL]), and delete a [WebACL] \
         from AWS WAF (see [DeleteWebACL]).\n\n\
        \  [WebACLId] is returned by [CreateWebACL] and by [ListWebACLs].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Contains the identifier and the name or description of the [WebACL].\n\
  \    "]

type nonrec web_acl_summaries = web_acl_summary list [@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec activated_rules = activated_rule list [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec web_ac_l = {
  web_acl_arn : resource_arn option; [@ocaml.doc "Tha Amazon Resource Name (ARN) of the web ACL.\n"]
  rules : activated_rules;
      [@ocaml.doc
        "An array that contains the action for each [Rule] in a [WebACL], the priority of the \
         [Rule], and the ID of the [Rule].\n"]
  default_action : waf_action;
      [@ocaml.doc
        "The action to perform if none of the [Rules] contained in the [WebACL] match. The action \
         is specified by the [WafAction] object.\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "A friendly name or description for the metrics for this [WebACL]. The name can contain \
         only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length \
         one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" \
         and \"Default_Action.\" You can't change [MetricName] after you create the [WebACL].\n"]
  name : resource_name option;
      [@ocaml.doc
        "A friendly name or description of the [WebACL]. You can't change the name of a [WebACL] \
         after you create it.\n"]
  web_acl_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [WebACL]. You use [WebACLId] to get information about a \
         [WebACL] (see [GetWebACL]), update a [WebACL] (see [UpdateWebACL]), and delete a [WebACL] \
         from AWS WAF (see [DeleteWebACL]).\n\n\
        \  [WebACLId] is returned by [CreateWebACL] and by [ListWebACLs].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Contains the [Rules] that identify the requests that you want to allow, block, or count. In \
   a [WebACL], you also specify a default action ([ALLOW] or [BLOCK]), and the action for each \
   [Rule] that you add to a [WebACL], for example, block requests from specified IP addresses or \
   block requests from specified referrers. You also associate the [WebACL] with a CloudFront \
   distribution to identify the requests that you want AWS WAF to filter. If you add more than one \
   [Rule] to a [WebACL], a request needs to match only one of the specifications to be allowed, \
   blocked, or counted. For more information, see [UpdateWebACL].\n\
  \    "]

type nonrec waf_tag_operation_internal_error_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "\n"]

type nonrec waf_tag_operation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec waf_subscription_not_found_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified subscription does not exist.\n"]

type nonrec waf_stale_data_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation failed because you tried to create, update, or delete an object by using a change \
   token that has already been used.\n"]

type nonrec waf_service_linked_role_error_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "AWS WAF is not able to access the service linked role. This can be caused by a previous \
   [PutLoggingConfiguration] request, which can lock the service linked role for about 20 seconds. \
   Please try your request again. The service linked role can also be locked by a previous \
   [DeleteServiceLinkedRole] request, which can lock the role for 15 minutes or more. If you \
   recently made a [DeleteServiceLinkedRole], wait at least 15 minutes and try the request again. \
   If you receive this same exception again, you will have to wait additional time until the role \
   is unlocked.\n"]

type nonrec waf_referenced_item_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation failed because you tried to delete an object that is still in use. For example:\n\n\
  \ {ul\n\
  \       {-  You tried to delete a [ByteMatchSet] that is still referenced by a [Rule].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to delete a [Rule] that is still referenced by a [WebACL].\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec waf_nonexistent_item_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The operation failed because the referenced object doesn't exist.\n"]

type nonrec waf_nonexistent_container_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation failed because you tried to add an object to or delete an object from another \
   object that doesn't exist. For example:\n\n\
  \ {ul\n\
  \       {-  You tried to add a [Rule] to or delete a [Rule] from a [WebACL] that doesn't exist.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to add a [ByteMatchSet] to or delete a [ByteMatchSet] from a [Rule] that \
   doesn't exist.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to add an IP address to or delete an IP address from an [IPSet] that \
   doesn't exist.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to add a [ByteMatchTuple] to or delete a [ByteMatchTuple] from a \
   [ByteMatchSet] that doesn't exist.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec waf_non_empty_entity_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation failed because you tried to delete an object that isn't empty. For example:\n\n\
  \ {ul\n\
  \       {-  You tried to delete a [WebACL] that still contains one or more [Rule] objects.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to delete a [Rule] that still contains one or more [ByteMatchSet] objects \
   or other predicates.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to delete a [ByteMatchSet] that contains one or more [ByteMatchTuple] \
   objects.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to delete an [IPSet] that references one or more IP addresses.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec waf_limits_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation exceeds a resource limit, for example, the maximum number of [WebACL] objects \
   that you can create for an AWS account. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}Limits} in the {i AWS WAF \
   Developer Guide}.\n"]

type nonrec waf_invalid_regex_pattern_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The regular expression (regex) you specified in [RegexPatternString] is invalid.\n"]

type nonrec waf_invalid_permission_policy_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The operation failed because the specified policy is not in the proper format. \n\n\
  \ The policy is subject to the following restrictions:\n\
  \ \n\
  \  {ul\n\
  \        {-  You can attach only one policy with each [PutPermissionPolicy] request.\n\
  \            \n\
  \             }\n\
  \        {-  The policy must include an [Effect], [Action] and [Principal]. \n\
  \            \n\
  \             }\n\
  \        {-   [Effect] must specify [Allow].\n\
  \            \n\
  \             }\n\
  \        {-  The [Action] in the policy must be [waf:UpdateWebACL], [waf-regional:UpdateWebACL], \
   [waf:GetRuleGroup] and [waf-regional:GetRuleGroup] . Any extra or wildcard actions in the \
   policy will be rejected.\n\
  \            \n\
  \             }\n\
  \        {-  The policy cannot include a [Resource] parameter.\n\
  \            \n\
  \             }\n\
  \        {-  The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must \
   exist in the same region.\n\
  \            \n\
  \             }\n\
  \        {-  The user making the request must be the owner of the RuleGroup.\n\
  \            \n\
  \             }\n\
  \        {-  Your policy must be composed using IAM Policy version 2012-10-17.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec parameter_exception_field =
  | TAG_KEYS [@ocaml.doc ""]
  | TAGS [@ocaml.doc ""]
  | RESOURCE_ARN [@ocaml.doc ""]
  | NEXT_MARKER [@ocaml.doc ""]
  | RULE_TYPE [@ocaml.doc ""]
  | RATE_KEY [@ocaml.doc ""]
  | GEO_MATCH_LOCATION_VALUE [@ocaml.doc ""]
  | GEO_MATCH_LOCATION_TYPE [@ocaml.doc ""]
  | SIZE_CONSTRAINT_COMPARISON_OPERATOR [@ocaml.doc ""]
  | BYTE_MATCH_POSITIONAL_CONSTRAINT [@ocaml.doc ""]
  | BYTE_MATCH_TEXT_TRANSFORMATION [@ocaml.doc ""]
  | SQL_INJECTION_MATCH_FIELD_TYPE [@ocaml.doc ""]
  | BYTE_MATCH_FIELD_TYPE [@ocaml.doc ""]
  | IPSET_TYPE [@ocaml.doc ""]
  | PREDICATE_TYPE [@ocaml.doc ""]
  | WAF_OVERRIDE_ACTION [@ocaml.doc ""]
  | WAF_ACTION [@ocaml.doc ""]
  | CHANGE_ACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parameter_exception_parameter = string [@@ocaml.doc ""]

type nonrec parameter_exception_reason =
  | INVALID_TAG_KEY [@ocaml.doc ""]
  | ILLEGAL_ARGUMENT [@ocaml.doc ""]
  | ILLEGAL_COMBINATION [@ocaml.doc ""]
  | INVALID_OPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec waf_invalid_parameter_exception = {
  reason : parameter_exception_reason option; [@ocaml.doc ""]
  parameter : parameter_exception_parameter option; [@ocaml.doc ""]
  field : parameter_exception_field option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The operation failed because AWS WAF didn't recognize a parameter in the request. For example:\n\n\
  \ {ul\n\
  \       {-  You specified an invalid parameter name.\n\
  \           \n\
  \            }\n\
  \       {-  You specified an invalid value.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to update an object ([ByteMatchSet], [IPSet], [Rule], or [WebACL]) using \
   an action other than [INSERT] or [DELETE].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to create a [WebACL] with a [DefaultAction] [Type] other than [ALLOW], \
   [BLOCK], or [COUNT].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to create a [RateBasedRule] with a [RateKey] value other than [IP].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to update a [WebACL] with a [WafAction] [Type] other than [ALLOW], \
   [BLOCK], or [COUNT].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to update a [ByteMatchSet] with a [FieldToMatch] [Type] other than HEADER, \
   METHOD, QUERY_STRING, URI, or BODY.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to update a [ByteMatchSet] with a [Field] of [HEADER] but no value for \
   [Data].\n\
  \           \n\
  \            }\n\
  \       {-  Your request references an ARN that is malformed, or corresponds to a resource with \
   which a web ACL cannot be associated.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec waf_invalid_operation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation failed because there was nothing to do. For example:\n\n\
  \ {ul\n\
  \       {-  You tried to remove a [Rule] from a [WebACL], but the [Rule] isn't in the specified \
   [WebACL].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to remove an IP address from an [IPSet], but the IP address isn't in the \
   specified [IPSet].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to remove a [ByteMatchTuple] from a [ByteMatchSet], but the \
   [ByteMatchTuple] isn't in the specified [WebACL].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to add a [Rule] to a [WebACL], but the [Rule] already exists in the \
   specified [WebACL].\n\
  \           \n\
  \            }\n\
  \       {-  You tried to add a [ByteMatchTuple] to a [ByteMatchSet], but the [ByteMatchTuple] \
   already exists in the specified [WebACL].\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec waf_invalid_account_exception = unit [@@ocaml.doc ""]

type nonrec waf_internal_error_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation failed because of a system problem, even though the request was valid. Retry your \
   request.\n"]

type nonrec migration_error_type =
  | S3_INTERNAL_ERROR [@ocaml.doc ""]
  | S3_BUCKET_INVALID_REGION [@ocaml.doc ""]
  | S3_BUCKET_NOT_FOUND [@ocaml.doc ""]
  | S3_BUCKET_NOT_ACCESSIBLE [@ocaml.doc ""]
  | S3_BUCKET_NO_PERMISSION [@ocaml.doc ""]
  | ENTITY_NOT_FOUND [@ocaml.doc ""]
  | ENTITY_NOT_SUPPORTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_reason = string [@@ocaml.doc ""]

type nonrec waf_entity_migration_exception = {
  migration_error_reason : error_reason option; [@ocaml.doc ""]
  migration_error_type : migration_error_type option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The operation failed due to a problem with the migration. The failure cause is provided in the \
   exception, in the [MigrationErrorType]: \n\n\
  \ {ul\n\
  \       {-   [ENTITY_NOT_SUPPORTED] - The web ACL has an unsupported entity but the \
   [IgnoreUnsupportedType] is not set to true.\n\
  \           \n\
  \            }\n\
  \       {-   [ENTITY_NOT_FOUND] - The web ACL doesn't exist. \n\
  \           \n\
  \            }\n\
  \       {-   [S3_BUCKET_NO_PERMISSION] - You don't have permission to perform the [PutObject] \
   action to the specified Amazon S3 bucket.\n\
  \           \n\
  \            }\n\
  \       {-   [S3_BUCKET_NOT_ACCESSIBLE] - The bucket policy doesn't allow AWS WAF to perform the \
   [PutObject] action in the bucket.\n\
  \           \n\
  \            }\n\
  \       {-   [S3_BUCKET_NOT_FOUND] - The S3 bucket doesn't exist. \n\
  \           \n\
  \            }\n\
  \       {-   [S3_BUCKET_INVALID_REGION] - The S3 bucket is not in the same Region as the web ACL.\n\
  \           \n\
  \            }\n\
  \       {-   [S3_INTERNAL_ERROR] - AWS WAF failed to create the template in the S3 bucket for \
   another reason.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec waf_disallowed_name_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The name specified is invalid.\n"]

type nonrec waf_bad_request_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "\n"]

type nonrec change_token = string [@@ocaml.doc ""]

type nonrec update_xss_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateXssMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc "The response to an [UpdateXssMatchSets] request.\n"]

type nonrec update_xss_match_set_request = {
  updates : xss_match_set_updates;
      [@ocaml.doc
        "An array of [XssMatchSetUpdate] objects that you want to insert into or delete from an \
         [XssMatchSet]. For more information, see the applicable data types:\n\n\
        \ {ul\n\
        \       {-   [XssMatchSetUpdate]: Contains [Action] and [XssMatchTuple] \n\
        \           \n\
        \            }\n\
        \       {-   [XssMatchTuple]: Contains [FieldToMatch] and [TextTransformation] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  xss_match_set_id : resource_id;
      [@ocaml.doc
        "The [XssMatchSetId] of the [XssMatchSet] that you want to update. [XssMatchSetId] is \
         returned by [CreateXssMatchSet] and by [ListXssMatchSets].\n"]
}
[@@ocaml.doc "A request to update an [XssMatchSet].\n"]

type nonrec update_web_acl_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateWebACL] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec update_web_acl_request = {
  default_action : waf_action option;
      [@ocaml.doc
        "A default action for the web ACL, either ALLOW or BLOCK. AWS WAF performs the default \
         action if a request doesn't match the criteria in any of the rules in a web ACL.\n"]
  updates : web_acl_updates option;
      [@ocaml.doc
        "An array of updates to make to the [WebACL].\n\n\
        \ An array of [WebACLUpdate] objects that you want to insert into or delete from a \
         [WebACL]. For more information, see the applicable data types:\n\
        \ \n\
        \  {ul\n\
        \        {-   [WebACLUpdate]: Contains [Action] and [ActivatedRule] \n\
        \            \n\
        \             }\n\
        \        {-   [ActivatedRule]: Contains [Action], [OverrideAction], [Priority], [RuleId], \
         and [Type]. [ActivatedRule|OverrideAction] applies only when updating or adding a \
         [RuleGroup] to a [WebACL]. In this case, you do not use [ActivatedRule|Action]. For all \
         other update requests, [ActivatedRule|Action] is used instead of \
         [ActivatedRule|OverrideAction]. \n\
        \            \n\
        \             }\n\
        \        {-   [WafAction]: Contains [Type] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  web_acl_id : resource_id;
      [@ocaml.doc
        "The [WebACLId] of the [WebACL] that you want to update. [WebACLId] is returned by \
         [CreateWebACL] and by [ListWebACLs].\n"]
}
[@@ocaml.doc ""]

type nonrec update_sql_injection_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateSqlInjectionMatchSet] request. You \
         can also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc "The response to an [UpdateSqlInjectionMatchSets] request.\n"]

type nonrec sql_injection_match_tuple = {
  text_transformation : text_transformation;
      [@ocaml.doc
        "Text transformations eliminate some of the unusual formatting that attackers use in web \
         requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF \
         performs the transformation on [FieldToMatch] before inspecting it for a match.\n\n\
        \ You can only specify a single type of TextTransformation.\n\
        \ \n\
        \   {b CMD_LINE} \n\
        \  \n\
        \   When you're concerned that attackers are injecting an operating system command line \
         command and using unusual formatting to disguise some or all of the command, use this \
         option to perform the following transformations:\n\
        \   \n\
        \    {ul\n\
        \          {-  Delete the following characters: \\ \" ' ^\n\
        \              \n\
        \               }\n\
        \          {-  Delete spaces before the following characters: / (\n\
        \              \n\
        \               }\n\
        \          {-  Replace the following characters with a space: , ;\n\
        \              \n\
        \               }\n\
        \          {-  Replace multiple spaces with one space\n\
        \              \n\
        \               }\n\
        \          {-  Convert uppercase letters (A-Z) to lowercase (a-z)\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b COMPRESS_WHITE_SPACE} \n\
        \   \n\
        \    Use this option to replace the following characters with a space character (decimal \
         32):\n\
        \    \n\
        \     {ul\n\
        \           {-  \\f, formfeed, decimal 12\n\
        \               \n\
        \                }\n\
        \           {-  \\t, tab, decimal 9\n\
        \               \n\
        \                }\n\
        \           {-  \\n, newline, decimal 10\n\
        \               \n\
        \                }\n\
        \           {-  \\r, carriage return, decimal 13\n\
        \               \n\
        \                }\n\
        \           {-  \\v, vertical tab, decimal 11\n\
        \               \n\
        \                }\n\
        \           {-  non-breaking space, decimal 160\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.\n\
        \   \n\
        \     {b HTML_ENTITY_DECODE} \n\
        \    \n\
        \     Use this option to replace HTML-encoded characters with unencoded characters. \
         [HTML_ENTITY_DECODE] performs the following operations:\n\
        \     \n\
        \      {ul\n\
        \            {-  Replaces [(ampersand)quot;] with [\"] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)lt;] with a \"less than\" symbol\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)gt;] with [>] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in hexadecimal format, \
         [(ampersand)#xhhhh;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in decimal format, \
         [(ampersand)#nnnn;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \    {b LOWERCASE} \n\
        \   \n\
        \    Use this option to convert uppercase letters (A-Z) to lowercase (a-z).\n\
        \    \n\
        \      {b URL_DECODE} \n\
        \     \n\
        \      Use this option to decode a URL-encoded value.\n\
        \      \n\
        \        {b NONE} \n\
        \       \n\
        \        Specify [NONE] if you don't want to perform any text transformations.\n\
        \        "]
  field_to_match : field_to_match;
      [@ocaml.doc "Specifies where in a web request to look for snippets of malicious SQL code.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the part of a web request that you want AWS WAF to inspect for snippets of \
   malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header.\n\
  \    "]

type nonrec sql_injection_match_set_update = {
  sql_injection_match_tuple : sql_injection_match_tuple;
      [@ocaml.doc
        "Specifies the part of a web request that you want AWS WAF to inspect for snippets of \
         malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header.\n"]
  action : change_action;
      [@ocaml.doc
        "Specify [INSERT] to add a [SqlInjectionMatchSetUpdate] to a [SqlInjectionMatchSet]. Use \
         [DELETE] to remove a [SqlInjectionMatchSetUpdate] from a [SqlInjectionMatchSet].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the part of a web request that you want to inspect for snippets of malicious SQL \
   code and indicates whether you want to add the specification to a [SqlInjectionMatchSet] or \
   delete it from a [SqlInjectionMatchSet].\n\
  \    "]

type nonrec sql_injection_match_set_updates = sql_injection_match_set_update list [@@ocaml.doc ""]

type nonrec update_sql_injection_match_set_request = {
  updates : sql_injection_match_set_updates;
      [@ocaml.doc
        "An array of [SqlInjectionMatchSetUpdate] objects that you want to insert into or delete \
         from a [SqlInjectionMatchSet]. For more information, see the applicable data types:\n\n\
        \ {ul\n\
        \       {-   [SqlInjectionMatchSetUpdate]: Contains [Action] and [SqlInjectionMatchTuple] \n\
        \           \n\
        \            }\n\
        \       {-   [SqlInjectionMatchTuple]: Contains [FieldToMatch] and [TextTransformation] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  sql_injection_match_set_id : resource_id;
      [@ocaml.doc
        "The [SqlInjectionMatchSetId] of the [SqlInjectionMatchSet] that you want to update. \
         [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by \
         [ListSqlInjectionMatchSets].\n"]
}
[@@ocaml.doc "A request to update a [SqlInjectionMatchSet].\n"]

type nonrec update_size_constraint_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateSizeConstraintSet] request. You can \
         also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec comparison_operator =
  | GT [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | LE [@ocaml.doc ""]
  | NE [@ocaml.doc ""]
  | EQ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec size = int [@@ocaml.doc ""]

type nonrec size_constraint = {
  size : size;
      [@ocaml.doc
        "The size in bytes that you want AWS WAF to compare against the size of the specified \
         [FieldToMatch]. AWS WAF uses this in combination with [ComparisonOperator] and \
         [FieldToMatch] to build an expression in the form of \"[Size] [ComparisonOperator] size \
         in bytes of [FieldToMatch]\". If that expression is true, the [SizeConstraint] is \
         considered to match.\n\n\
        \ Valid values for size are 0 - 21474836480 bytes (0 - 20 GB).\n\
        \ \n\
        \  If you specify [URI] for the value of [Type], the / in the URI counts as one character. \
         For example, the URI [/logo.jpg] is nine characters long.\n\
        \  "]
  comparison_operator : comparison_operator;
      [@ocaml.doc
        "The type of comparison you want AWS WAF to perform. AWS WAF uses this in combination with \
         the provided [Size] and [FieldToMatch] to build an expression in the form of \"[Size] \
         [ComparisonOperator] size in bytes of [FieldToMatch]\". If that expression is true, the \
         [SizeConstraint] is considered to match.\n\n\
        \  {b EQ}: Used to test if the [Size] is equal to the size of the [FieldToMatch] \n\
        \ \n\
        \   {b NE}: Used to test if the [Size] is not equal to the size of the [FieldToMatch] \n\
        \  \n\
        \    {b LE}: Used to test if the [Size] is less than or equal to the size of the \
         [FieldToMatch] \n\
        \   \n\
        \     {b LT}: Used to test if the [Size] is strictly less than the size of the \
         [FieldToMatch] \n\
        \    \n\
        \      {b GE}: Used to test if the [Size] is greater than or equal to the size of the \
         [FieldToMatch] \n\
        \     \n\
        \       {b GT}: Used to test if the [Size] is strictly greater than the size of the \
         [FieldToMatch] \n\
        \      "]
  text_transformation : text_transformation;
      [@ocaml.doc
        "Text transformations eliminate some of the unusual formatting that attackers use in web \
         requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF \
         performs the transformation on [FieldToMatch] before inspecting it for a match.\n\n\
        \ You can only specify a single type of TextTransformation.\n\
        \ \n\
        \  Note that if you choose [BODY] for the value of [Type], you must choose [NONE] for \
         [TextTransformation] because CloudFront forwards only the first 8192 bytes for \
         inspection. \n\
        \  \n\
        \    {b NONE} \n\
        \   \n\
        \    Specify [NONE] if you don't want to perform any text transformations.\n\
        \    \n\
        \      {b CMD_LINE} \n\
        \     \n\
        \      When you're concerned that attackers are injecting an operating system command line \
         command and using unusual formatting to disguise some or all of the command, use this \
         option to perform the following transformations:\n\
        \      \n\
        \       {ul\n\
        \             {-  Delete the following characters: \\ \" ' ^\n\
        \                 \n\
        \                  }\n\
        \             {-  Delete spaces before the following characters: / (\n\
        \                 \n\
        \                  }\n\
        \             {-  Replace the following characters with a space: , ;\n\
        \                 \n\
        \                  }\n\
        \             {-  Replace multiple spaces with one space\n\
        \                 \n\
        \                  }\n\
        \             {-  Convert uppercase letters (A-Z) to lowercase (a-z)\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \    {b COMPRESS_WHITE_SPACE} \n\
        \   \n\
        \    Use this option to replace the following characters with a space character (decimal \
         32):\n\
        \    \n\
        \     {ul\n\
        \           {-  \\f, formfeed, decimal 12\n\
        \               \n\
        \                }\n\
        \           {-  \\t, tab, decimal 9\n\
        \               \n\
        \                }\n\
        \           {-  \\n, newline, decimal 10\n\
        \               \n\
        \                }\n\
        \           {-  \\r, carriage return, decimal 13\n\
        \               \n\
        \                }\n\
        \           {-  \\v, vertical tab, decimal 11\n\
        \               \n\
        \                }\n\
        \           {-  non-breaking space, decimal 160\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.\n\
        \   \n\
        \     {b HTML_ENTITY_DECODE} \n\
        \    \n\
        \     Use this option to replace HTML-encoded characters with unencoded characters. \
         [HTML_ENTITY_DECODE] performs the following operations:\n\
        \     \n\
        \      {ul\n\
        \            {-  Replaces [(ampersand)quot;] with [\"] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)lt;] with a \"less than\" symbol\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)gt;] with [>] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in hexadecimal format, \
         [(ampersand)#xhhhh;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in decimal format, \
         [(ampersand)#nnnn;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \    {b LOWERCASE} \n\
        \   \n\
        \    Use this option to convert uppercase letters (A-Z) to lowercase (a-z).\n\
        \    \n\
        \      {b URL_DECODE} \n\
        \     \n\
        \      Use this option to decode a URL-encoded value.\n\
        \      "]
  field_to_match : field_to_match;
      [@ocaml.doc "Specifies where in a web request to look for the size constraint.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies a constraint on the size of a part of the web request. AWS WAF uses the [Size], \
   [ComparisonOperator], and [FieldToMatch] to build an expression in the form of \"[Size] \
   [ComparisonOperator] size in bytes of [FieldToMatch]\". If that expression is true, the \
   [SizeConstraint] is considered to match.\n\
  \    "]

type nonrec size_constraint_set_update = {
  size_constraint : size_constraint;
      [@ocaml.doc
        "Specifies a constraint on the size of a part of the web request. AWS WAF uses the [Size], \
         [ComparisonOperator], and [FieldToMatch] to build an expression in the form of \"[Size] \
         [ComparisonOperator] size in bytes of [FieldToMatch]\". If that expression is true, the \
         [SizeConstraint] is considered to match.\n"]
  action : change_action;
      [@ocaml.doc
        "Specify [INSERT] to add a [SizeConstraintSetUpdate] to a [SizeConstraintSet]. Use \
         [DELETE] to remove a [SizeConstraintSetUpdate] from a [SizeConstraintSet].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the part of a web request that you want to inspect the size of and indicates \
   whether you want to add the specification to a [SizeConstraintSet] or delete it from a \
   [SizeConstraintSet].\n\
  \    "]

type nonrec size_constraint_set_updates = size_constraint_set_update list [@@ocaml.doc ""]

type nonrec update_size_constraint_set_request = {
  updates : size_constraint_set_updates;
      [@ocaml.doc
        "An array of [SizeConstraintSetUpdate] objects that you want to insert into or delete from \
         a [SizeConstraintSet]. For more information, see the applicable data types:\n\n\
        \ {ul\n\
        \       {-   [SizeConstraintSetUpdate]: Contains [Action] and [SizeConstraint] \n\
        \           \n\
        \            }\n\
        \       {-   [SizeConstraint]: Contains [FieldToMatch], [TextTransformation], \
         [ComparisonOperator], and [Size] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  size_constraint_set_id : resource_id;
      [@ocaml.doc
        "The [SizeConstraintSetId] of the [SizeConstraintSet] that you want to update. \
         [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by \
         [ListSizeConstraintSets].\n"]
}
[@@ocaml.doc ""]

type nonrec update_rule_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateRule] request. You can also use this \
         value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec negated = bool [@@ocaml.doc ""]

type nonrec predicate_type =
  | REGEX_MATCH [@ocaml.doc ""]
  | XSS_MATCH [@ocaml.doc ""]
  | SIZE_CONSTRAINT [@ocaml.doc ""]
  | GEO_MATCH [@ocaml.doc ""]
  | SQL_INJECTION_MATCH [@ocaml.doc ""]
  | BYTE_MATCH [@ocaml.doc ""]
  | IP_MATCH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predicate = {
  data_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a predicate in a [Rule], such as [ByteMatchSetId] or [IPSetId]. \
         The ID is returned by the corresponding [Create] or [List] command.\n"]
  type_ : predicate_type;
      [@ocaml.doc "The type of predicate in a [Rule], such as [ByteMatch] or [IPSet].\n"]
  negated : negated;
      [@ocaml.doc
        "Set [Negated] to [False] if you want AWS WAF to allow, block, or count requests based on \
         the settings in the specified [ByteMatchSet], [IPSet], [SqlInjectionMatchSet], \
         [XssMatchSet], [RegexMatchSet], [GeoMatchSet], or [SizeConstraintSet]. For example, if an \
         [IPSet] includes the IP address [192.0.2.44], AWS WAF will allow or block requests based \
         on that IP address.\n\n\
        \ Set [Negated] to [True] if you want AWS WAF to allow or block a request based on the \
         negation of the settings in the [ByteMatchSet], [IPSet], [SqlInjectionMatchSet], \
         [XssMatchSet], [RegexMatchSet], [GeoMatchSet], or [SizeConstraintSet]. For example, if an \
         [IPSet] includes the IP address [192.0.2.44], AWS WAF will allow, block, or count \
         requests based on all IP addresses {i except} [192.0.2.44].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the [ByteMatchSet], [IPSet], [SqlInjectionMatchSet], [XssMatchSet], \
   [RegexMatchSet], [GeoMatchSet], and [SizeConstraintSet] objects that you want to add to a \
   [Rule] and, for each object, indicates whether you want to negate the settings, for example, \
   requests that do NOT originate from the IP address 192.0.2.44. \n\
  \    "]

type nonrec rule_update = {
  predicate : predicate;
      [@ocaml.doc
        "The ID of the [Predicate] (such as an [IPSet]) that you want to add to a [Rule].\n"]
  action : change_action;
      [@ocaml.doc
        "Specify [INSERT] to add a [Predicate] to a [Rule]. Use [DELETE] to remove a [Predicate] \
         from a [Rule].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies a [Predicate] (such as an [IPSet]) and indicates whether you want to add it to a \
   [Rule] or delete it from a [Rule].\n\
  \    "]

type nonrec rule_updates = rule_update list [@@ocaml.doc ""]

type nonrec update_rule_request = {
  updates : rule_updates;
      [@ocaml.doc
        "An array of [RuleUpdate] objects that you want to insert into or delete from a [Rule]. \
         For more information, see the applicable data types:\n\n\
        \ {ul\n\
        \       {-   [RuleUpdate]: Contains [Action] and [Predicate] \n\
        \           \n\
        \            }\n\
        \       {-   [Predicate]: Contains [DataId], [Negated], and [Type] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  rule_id : resource_id;
      [@ocaml.doc
        "The [RuleId] of the [Rule] that you want to update. [RuleId] is returned by [CreateRule] \
         and by [ListRules].\n"]
}
[@@ocaml.doc ""]

type nonrec update_rule_group_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateRuleGroup] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec rule_group_update = {
  activated_rule : activated_rule;
      [@ocaml.doc
        "The [ActivatedRule] object specifies a [Rule] that you want to insert or delete, the \
         priority of the [Rule] in the [WebACL], and the action that you want AWS WAF to take when \
         a web request matches the [Rule] ([ALLOW], [BLOCK], or [COUNT]).\n"]
  action : change_action;
      [@ocaml.doc
        "Specify [INSERT] to add an [ActivatedRule] to a [RuleGroup]. Use [DELETE] to remove an \
         [ActivatedRule] from a [RuleGroup].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies an [ActivatedRule] and indicates whether you want to add it to a [RuleGroup] or \
   delete it from a [RuleGroup].\n\
  \    "]

type nonrec rule_group_updates = rule_group_update list [@@ocaml.doc ""]

type nonrec update_rule_group_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  updates : rule_group_updates;
      [@ocaml.doc
        "An array of [RuleGroupUpdate] objects that you want to insert into or delete from a \
         [RuleGroup].\n\n\
        \ You can only insert [REGULAR] rules into a rule group.\n\
        \ \n\
        \   [ActivatedRule|OverrideAction] applies only when updating or adding a [RuleGroup] to a \
         [WebACL]. In this case you do not use [ActivatedRule|Action]. For all other update \
         requests, [ActivatedRule|Action] is used instead of [ActivatedRule|OverrideAction].\n\
        \  "]
  rule_group_id : resource_id;
      [@ocaml.doc
        "The [RuleGroupId] of the [RuleGroup] that you want to update. [RuleGroupId] is returned \
         by [CreateRuleGroup] and by [ListRuleGroups].\n"]
}
[@@ocaml.doc ""]

type nonrec update_regex_pattern_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateRegexPatternSet] request. You can \
         also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec regex_pattern_string = string [@@ocaml.doc ""]

type nonrec regex_pattern_set_update = {
  regex_pattern_string : regex_pattern_string;
      [@ocaml.doc
        "Specifies the regular expression (regex) pattern that you want AWS WAF to search for, \
         such as [B\\[a@\\]dB\\[o0\\]t].\n"]
  action : change_action;
      [@ocaml.doc "Specifies whether to insert or delete a [RegexPatternString].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    In an [UpdateRegexPatternSet] request, [RegexPatternSetUpdate] specifies whether to insert \
   or delete a [RegexPatternString] and includes the settings for the [RegexPatternString].\n\
  \    "]

type nonrec regex_pattern_set_updates = regex_pattern_set_update list [@@ocaml.doc ""]

type nonrec update_regex_pattern_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  updates : regex_pattern_set_updates;
      [@ocaml.doc
        "An array of [RegexPatternSetUpdate] objects that you want to insert into or delete from a \
         [RegexPatternSet].\n"]
  regex_pattern_set_id : resource_id;
      [@ocaml.doc
        "The [RegexPatternSetId] of the [RegexPatternSet] that you want to update. \
         [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].\n"]
}
[@@ocaml.doc ""]

type nonrec update_regex_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateRegexMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec regex_match_tuple = {
  regex_pattern_set_id : resource_id;
      [@ocaml.doc
        "The [RegexPatternSetId] for a [RegexPatternSet]. You use [RegexPatternSetId] to get \
         information about a [RegexPatternSet] (see [GetRegexPatternSet]), update a \
         [RegexPatternSet] (see [UpdateRegexPatternSet]), insert a [RegexPatternSet] into a \
         [RegexMatchSet] or delete one from a [RegexMatchSet] (see [UpdateRegexMatchSet]), and \
         delete an [RegexPatternSet] from AWS WAF (see [DeleteRegexPatternSet]).\n\n\
        \  [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].\n\
        \ "]
  text_transformation : text_transformation;
      [@ocaml.doc
        "Text transformations eliminate some of the unusual formatting that attackers use in web \
         requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF \
         performs the transformation on [RegexPatternSet] before inspecting a request for a \
         match.\n\n\
        \ You can only specify a single type of TextTransformation.\n\
        \ \n\
        \   {b CMD_LINE} \n\
        \  \n\
        \   When you're concerned that attackers are injecting an operating system commandline \
         command and using unusual formatting to disguise some or all of the command, use this \
         option to perform the following transformations:\n\
        \   \n\
        \    {ul\n\
        \          {-  Delete the following characters: \\ \" ' ^\n\
        \              \n\
        \               }\n\
        \          {-  Delete spaces before the following characters: / (\n\
        \              \n\
        \               }\n\
        \          {-  Replace the following characters with a space: , ;\n\
        \              \n\
        \               }\n\
        \          {-  Replace multiple spaces with one space\n\
        \              \n\
        \               }\n\
        \          {-  Convert uppercase letters (A-Z) to lowercase (a-z)\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b COMPRESS_WHITE_SPACE} \n\
        \   \n\
        \    Use this option to replace the following characters with a space character (decimal \
         32):\n\
        \    \n\
        \     {ul\n\
        \           {-  \\f, formfeed, decimal 12\n\
        \               \n\
        \                }\n\
        \           {-  \\t, tab, decimal 9\n\
        \               \n\
        \                }\n\
        \           {-  \\n, newline, decimal 10\n\
        \               \n\
        \                }\n\
        \           {-  \\r, carriage return, decimal 13\n\
        \               \n\
        \                }\n\
        \           {-  \\v, vertical tab, decimal 11\n\
        \               \n\
        \                }\n\
        \           {-  non-breaking space, decimal 160\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.\n\
        \   \n\
        \     {b HTML_ENTITY_DECODE} \n\
        \    \n\
        \     Use this option to replace HTML-encoded characters with unencoded characters. \
         [HTML_ENTITY_DECODE] performs the following operations:\n\
        \     \n\
        \      {ul\n\
        \            {-  Replaces [(ampersand)quot;] with [\"] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)lt;] with a \"less than\" symbol\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)gt;] with [>] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in hexadecimal format, \
         [(ampersand)#xhhhh;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in decimal format, \
         [(ampersand)#nnnn;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \    {b LOWERCASE} \n\
        \   \n\
        \    Use this option to convert uppercase letters (A-Z) to lowercase (a-z).\n\
        \    \n\
        \      {b URL_DECODE} \n\
        \     \n\
        \      Use this option to decode a URL-encoded value.\n\
        \      \n\
        \        {b NONE} \n\
        \       \n\
        \        Specify [NONE] if you don't want to perform any text transformations.\n\
        \        "]
  field_to_match : field_to_match;
      [@ocaml.doc "Specifies where in a web request to look for the [RegexPatternSet].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The regular expression pattern that you want AWS WAF to search for in web requests, the \
   location in requests that you want AWS WAF to search, and other settings. Each \
   [RegexMatchTuple] object contains: \n\
  \    \n\
  \     {ul\n\
  \           {-  The part of a web request that you want AWS WAF to inspect, such as a query \
   string or the value of the [User-Agent] header. \n\
  \               \n\
  \                }\n\
  \           {-  The identifier of the pattern (a regular expression) that you want AWS WAF to \
   look for. For more information, see [RegexPatternSet]. \n\
  \               \n\
  \                }\n\
  \           {-  Whether to perform any conversions on the request, such as converting it to \
   lowercase, before inspecting it for the specified string.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

type nonrec regex_match_set_update = {
  regex_match_tuple : regex_match_tuple;
      [@ocaml.doc
        "Information about the part of a web request that you want AWS WAF to inspect and the \
         identifier of the regular expression (regex) pattern that you want AWS WAF to search for. \
         If you specify [DELETE] for the value of [Action], the [RegexMatchTuple] values must \
         exactly match the values in the [RegexMatchTuple] that you want to delete from the \
         [RegexMatchSet].\n"]
  action : change_action; [@ocaml.doc "Specifies whether to insert or delete a [RegexMatchTuple].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    In an [UpdateRegexMatchSet] request, [RegexMatchSetUpdate] specifies whether to insert or \
   delete a [RegexMatchTuple] and includes the settings for the [RegexMatchTuple].\n\
  \    "]

type nonrec regex_match_set_updates = regex_match_set_update list [@@ocaml.doc ""]

type nonrec update_regex_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  updates : regex_match_set_updates;
      [@ocaml.doc
        "An array of [RegexMatchSetUpdate] objects that you want to insert into or delete from a \
         [RegexMatchSet]. For more information, see [RegexMatchTuple].\n"]
  regex_match_set_id : resource_id;
      [@ocaml.doc
        "The [RegexMatchSetId] of the [RegexMatchSet] that you want to update. [RegexMatchSetId] \
         is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec update_rate_based_rule_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateRateBasedRule] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec rate_limit = int [@@ocaml.doc ""]

type nonrec update_rate_based_rule_request = {
  rate_limit : rate_limit;
      [@ocaml.doc
        "The maximum number of requests, which have an identical value in the field specified by \
         the [RateKey], allowed in a five-minute period. If the number of requests exceeds the \
         [RateLimit] and the other predicates specified in the rule are also met, AWS WAF triggers \
         the action that is specified for this rule.\n"]
  updates : rule_updates;
      [@ocaml.doc
        "An array of [RuleUpdate] objects that you want to insert into or delete from a \
         [RateBasedRule]. \n"]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  rule_id : resource_id;
      [@ocaml.doc
        "The [RuleId] of the [RateBasedRule] that you want to update. [RuleId] is returned by \
         [CreateRateBasedRule] and by [ListRateBasedRules].\n"]
}
[@@ocaml.doc ""]

type nonrec update_ip_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateIPSet] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec ip_set_descriptor_type = IPV6 [@ocaml.doc ""] | IPV4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ip_set_descriptor_value = string [@@ocaml.doc ""]

type nonrec ip_set_descriptor = {
  value : ip_set_descriptor_value;
      [@ocaml.doc
        "Specify an IPv4 address by using CIDR notation. For example:\n\n\
        \ {ul\n\
        \       {-  To configure AWS WAF to allow, block, or count requests that originated from \
         the IP address 192.0.2.44, specify [192.0.2.44/32].\n\
        \           \n\
        \            }\n\
        \       {-  To configure AWS WAF to allow, block, or count requests that originated from \
         IP addresses from 192.0.2.0 to 192.0.2.255, specify [192.0.2.0/24].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information about CIDR notation, see the Wikipedia entry \
         {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain \
         Routing}.\n\
        \   \n\
        \    Specify an IPv6 address by using CIDR notation. For example:\n\
        \    \n\
        \     {ul\n\
        \           {-  To configure AWS WAF to allow, block, or count requests that originated \
         from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify \
         [1111:0000:0000:0000:0000:0000:0000:0111/128].\n\
        \               \n\
        \                }\n\
        \           {-  To configure AWS WAF to allow, block, or count requests that originated \
         from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to \
         1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify \
         [1111:0000:0000:0000:0000:0000:0000:0000/64].\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  type_ : ip_set_descriptor_type; [@ocaml.doc "Specify [IPV4] or [IPV6].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the IP address type ([IPV4] or [IPV6]) and the IP address range (in CIDR format) \
   that web requests originate from.\n\
  \    "]

type nonrec ip_set_update = {
  ip_set_descriptor : ip_set_descriptor;
      [@ocaml.doc
        "The IP address type ([IPV4] or [IPV6]) and the IP address range (in CIDR notation) that \
         web requests originate from.\n"]
  action : change_action;
      [@ocaml.doc "Specifies whether to insert or delete an IP address with [UpdateIPSet].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the type of update to perform to an [IPSet] with [UpdateIPSet].\n\
  \    "]

type nonrec ip_set_updates = ip_set_update list [@@ocaml.doc ""]

type nonrec update_ip_set_request = {
  updates : ip_set_updates;
      [@ocaml.doc
        "An array of [IPSetUpdate] objects that you want to insert into or delete from an [IPSet]. \
         For more information, see the applicable data types:\n\n\
        \ {ul\n\
        \       {-   [IPSetUpdate]: Contains [Action] and [IPSetDescriptor] \n\
        \           \n\
        \            }\n\
        \       {-   [IPSetDescriptor]: Contains [Type] and [Value] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can insert a maximum of 1000 addresses in a single request.\n\
        \   "]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  ip_set_id : resource_id;
      [@ocaml.doc
        "The [IPSetId] of the [IPSet] that you want to update. [IPSetId] is returned by \
         [CreateIPSet] and by [ListIPSets].\n"]
}
[@@ocaml.doc ""]

type nonrec update_geo_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateGeoMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec geo_match_constraint_type = Country [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec geo_match_constraint_value =
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
  | AF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec geo_match_constraint = {
  value : geo_match_constraint_value;
      [@ocaml.doc "The country that you want AWS WAF to search for.\n"]
  type_ : geo_match_constraint_type;
      [@ocaml.doc
        "The type of geographical area you want AWS WAF to search for. Currently [Country] is the \
         only valid value.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The country from which web requests originate that you want AWS WAF to search for.\n\
  \    "]

type nonrec geo_match_set_update = {
  geo_match_constraint : geo_match_constraint;
      [@ocaml.doc
        "The country from which web requests originate that you want AWS WAF to search for.\n"]
  action : change_action;
      [@ocaml.doc "Specifies whether to insert or delete a country with [UpdateGeoMatchSet].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Specifies the type of update to perform to an [GeoMatchSet] with [UpdateGeoMatchSet].\n\
  \    "]

type nonrec geo_match_set_updates = geo_match_set_update list [@@ocaml.doc ""]

type nonrec update_geo_match_set_request = {
  updates : geo_match_set_updates;
      [@ocaml.doc
        "An array of [GeoMatchSetUpdate] objects that you want to insert into or delete from an \
         [GeoMatchSet]. For more information, see the applicable data types:\n\n\
        \ {ul\n\
        \       {-   [GeoMatchSetUpdate]: Contains [Action] and [GeoMatchConstraint] \n\
        \           \n\
        \            }\n\
        \       {-   [GeoMatchConstraint]: Contains [Type] and [Value] \n\
        \           \n\
        \            You can have only one [Type] and [Value] per [GeoMatchConstraint]. To add \
         multiple countries, include multiple [GeoMatchSetUpdate] objects in your request.\n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  geo_match_set_id : resource_id;
      [@ocaml.doc
        "The [GeoMatchSetId] of the [GeoMatchSet] that you want to update. [GeoMatchSetId] is \
         returned by [CreateGeoMatchSet] and by [ListGeoMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec update_byte_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [UpdateByteMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec byte_match_target_string = bytes [@@ocaml.doc ""]

type nonrec positional_constraint =
  | CONTAINS_WORD [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | ENDS_WITH [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | EXACTLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec byte_match_tuple = {
  positional_constraint : positional_constraint;
      [@ocaml.doc
        "Within the portion of a web request that you want to search (for example, in the query \
         string, if any), specify where you want AWS WAF to search. Valid values include the \
         following:\n\n\
        \  {b CONTAINS} \n\
        \ \n\
        \  The specified part of the web request must include the value of [TargetString], but the \
         location doesn't matter.\n\
        \  \n\
        \    {b CONTAINS_WORD} \n\
        \   \n\
        \    The specified part of the web request must include the value of [TargetString], and \
         [TargetString] must contain only alphanumeric characters or underscore (A-Z, a-z, 0-9, or \
         _). In addition, [TargetString] must be a word, which means one of the following:\n\
        \    \n\
        \     {ul\n\
        \           {-   [TargetString] exactly matches the value of the specified part of the web \
         request, such as the value of a header.\n\
        \               \n\
        \                }\n\
        \           {-   [TargetString] is at the beginning of the specified part of the web \
         request and is followed by a character other than an alphanumeric character or underscore \
         (_), for example, [BadBot;].\n\
        \               \n\
        \                }\n\
        \           {-   [TargetString] is at the end of the specified part of the web request and \
         is preceded by a character other than an alphanumeric character or underscore (_), for \
         example, [;BadBot].\n\
        \               \n\
        \                }\n\
        \           {-   [TargetString] is in the middle of the specified part of the web request \
         and is preceded and followed by characters other than alphanumeric characters or \
         underscore (_), for example, [-BadBot;].\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    {b EXACTLY} \n\
        \   \n\
        \    The value of the specified part of the web request must exactly match the value of \
         [TargetString].\n\
        \    \n\
        \      {b STARTS_WITH} \n\
        \     \n\
        \      The value of [TargetString] must appear at the beginning of the specified part of \
         the web request.\n\
        \      \n\
        \        {b ENDS_WITH} \n\
        \       \n\
        \        The value of [TargetString] must appear at the end of the specified part of the \
         web request.\n\
        \        "]
  text_transformation : text_transformation;
      [@ocaml.doc
        "Text transformations eliminate some of the unusual formatting that attackers use in web \
         requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF \
         performs the transformation on [FieldToMatch] before inspecting it for a match.\n\n\
        \ You can only specify a single type of TextTransformation.\n\
        \ \n\
        \   {b CMD_LINE} \n\
        \  \n\
        \   When you're concerned that attackers are injecting an operating system command line \
         command and using unusual formatting to disguise some or all of the command, use this \
         option to perform the following transformations:\n\
        \   \n\
        \    {ul\n\
        \          {-  Delete the following characters: \\ \" ' ^\n\
        \              \n\
        \               }\n\
        \          {-  Delete spaces before the following characters: / (\n\
        \              \n\
        \               }\n\
        \          {-  Replace the following characters with a space: , ;\n\
        \              \n\
        \               }\n\
        \          {-  Replace multiple spaces with one space\n\
        \              \n\
        \               }\n\
        \          {-  Convert uppercase letters (A-Z) to lowercase (a-z)\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b COMPRESS_WHITE_SPACE} \n\
        \   \n\
        \    Use this option to replace the following characters with a space character (decimal \
         32):\n\
        \    \n\
        \     {ul\n\
        \           {-  \\f, formfeed, decimal 12\n\
        \               \n\
        \                }\n\
        \           {-  \\t, tab, decimal 9\n\
        \               \n\
        \                }\n\
        \           {-  \\n, newline, decimal 10\n\
        \               \n\
        \                }\n\
        \           {-  \\r, carriage return, decimal 13\n\
        \               \n\
        \                }\n\
        \           {-  \\v, vertical tab, decimal 11\n\
        \               \n\
        \                }\n\
        \           {-  non-breaking space, decimal 160\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.\n\
        \   \n\
        \     {b HTML_ENTITY_DECODE} \n\
        \    \n\
        \     Use this option to replace HTML-encoded characters with unencoded characters. \
         [HTML_ENTITY_DECODE] performs the following operations:\n\
        \     \n\
        \      {ul\n\
        \            {-  Replaces [(ampersand)quot;] with [\"] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)lt;] with a \"less than\" symbol\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces [(ampersand)gt;] with [>] \n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in hexadecimal format, \
         [(ampersand)#xhhhh;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            {-  Replaces characters that are represented in decimal format, \
         [(ampersand)#nnnn;], with the corresponding characters\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \    {b LOWERCASE} \n\
        \   \n\
        \    Use this option to convert uppercase letters (A-Z) to lowercase (a-z).\n\
        \    \n\
        \      {b URL_DECODE} \n\
        \     \n\
        \      Use this option to decode a URL-encoded value.\n\
        \      \n\
        \        {b NONE} \n\
        \       \n\
        \        Specify [NONE] if you don't want to perform any text transformations.\n\
        \        "]
  target_string : byte_match_target_string;
      [@ocaml.doc
        "The value that you want AWS WAF to search for. AWS WAF searches for the specified string \
         in the part of web requests that you specified in [FieldToMatch]. The maximum length of \
         the value is 50 bytes.\n\n\
        \ Valid values depend on the values that you specified for [FieldToMatch]:\n\
        \ \n\
        \  {ul\n\
        \        {-   [HEADER]: The value that you want AWS WAF to search for in the request \
         header that you specified in [FieldToMatch], for example, the value of the [User-Agent] \
         or [Referer] header.\n\
        \            \n\
        \             }\n\
        \        {-   [METHOD]: The HTTP method, which indicates the type of operation specified \
         in the request. CloudFront supports the following methods: [DELETE], [GET], [HEAD], \
         [OPTIONS], [PATCH], [POST], and [PUT].\n\
        \            \n\
        \             }\n\
        \        {-   [QUERY_STRING]: The value that you want AWS WAF to search for in the query \
         string, which is the part of a URL that appears after a [?] character.\n\
        \            \n\
        \             }\n\
        \        {-   [URI]: The value that you want AWS WAF to search for in the part of a URL \
         that identifies a resource, for example, [/images/daily-ad.jpg].\n\
        \            \n\
        \             }\n\
        \        {-   [BODY]: The part of a request that contains any additional data that you \
         want to send to your web server as the HTTP request body, such as data from a form. The \
         request body immediately follows the request headers. Note that only the first [8192] \
         bytes of the request body are forwarded to AWS WAF for inspection. To allow or block \
         requests based on the length of the body, you can create a size constraint set. For more \
         information, see [CreateSizeConstraintSet]. \n\
        \            \n\
        \             }\n\
        \        {-   [SINGLE_QUERY_ARG]: The parameter in the query string that you will inspect, \
         such as {i UserName} or {i SalesRegion}. The maximum length for [SINGLE_QUERY_ARG] is 30 \
         characters.\n\
        \            \n\
        \             }\n\
        \        {-   [ALL_QUERY_ARGS]: Similar to [SINGLE_QUERY_ARG], but instead of inspecting a \
         single parameter, AWS WAF inspects all parameters within the query string for the value \
         or regex pattern that you specify in [TargetString].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If [TargetString] includes alphabetic characters A-Z and a-z, note that the value is \
         case sensitive.\n\
        \   \n\
        \     {b If you're using the AWS WAF API} \n\
        \    \n\
        \     Specify a base64-encoded version of the value. The maximum length of the value \
         before you base64-encode it is 50 bytes.\n\
        \     \n\
        \      For example, suppose the value of [Type] is [HEADER] and the value of [Data] is \
         [User-Agent]. If you want to search the [User-Agent] header for the value [BadBot], you \
         base64-encode [BadBot] using MIME base64-encoding and include the resulting value, \
         [QmFkQm90], in the value of [TargetString].\n\
        \      \n\
        \        {b If you're using the AWS CLI or one of the AWS SDKs} \n\
        \       \n\
        \        The value that you want AWS WAF to search for. The SDK automatically base64 \
         encodes the value.\n\
        \        "]
  field_to_match : field_to_match;
      [@ocaml.doc
        "The part of a web request that you want AWS WAF to search, such as a specified header or \
         a query string. For more information, see [FieldToMatch].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF \
   to search for in web requests, the location in requests that you want AWS WAF to search, and \
   other settings.\n\
  \    "]

type nonrec byte_match_set_update = {
  byte_match_tuple : byte_match_tuple;
      [@ocaml.doc
        "Information about the part of a web request that you want AWS WAF to inspect and the \
         value that you want AWS WAF to search for. If you specify [DELETE] for the value of \
         [Action], the [ByteMatchTuple] values must exactly match the values in the \
         [ByteMatchTuple] that you want to delete from the [ByteMatchSet].\n"]
  action : change_action; [@ocaml.doc "Specifies whether to insert or delete a [ByteMatchTuple].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    In an [UpdateByteMatchSet] request, [ByteMatchSetUpdate] specifies whether to insert or \
   delete a [ByteMatchTuple] and includes the settings for the [ByteMatchTuple].\n\
  \    "]

type nonrec byte_match_set_updates = byte_match_set_update list [@@ocaml.doc ""]

type nonrec update_byte_match_set_request = {
  updates : byte_match_set_updates;
      [@ocaml.doc
        "An array of [ByteMatchSetUpdate] objects that you want to insert into or delete from a \
         [ByteMatchSet]. For more information, see the applicable data types:\n\n\
        \ {ul\n\
        \       {-   [ByteMatchSetUpdate]: Contains [Action] and [ByteMatchTuple] \n\
        \           \n\
        \            }\n\
        \       {-   [ByteMatchTuple]: Contains [FieldToMatch], [PositionalConstraint], \
         [TargetString], and [TextTransformation] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  byte_match_set_id : resource_id;
      [@ocaml.doc
        "The [ByteMatchSetId] of the [ByteMatchSet] that you want to update. [ByteMatchSetId] is \
         returned by [CreateByteMatchSet] and by [ListByteMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "\n"]
  resource_ar_n : resource_arn; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec uri_string = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec time_window = {
  end_time : timestamp;
      [@ocaml.doc
        "The end of the time range from which you want [GetSampledRequests] to return a sample of \
         the requests that your AWS resource received. You must specify the date and time in \
         Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. \
         For example, [\"2016-09-27T14:50Z\"]. You can specify any time range in the previous \
         three hours.\n"]
  start_time : timestamp;
      [@ocaml.doc
        "The beginning of the time range from which you want [GetSampledRequests] to return a \
         sample of the requests that your AWS resource received. You must specify the date and \
         time in Coordinated Universal Time (UTC) format. UTC format includes the special \
         designator, [Z]. For example, [\"2016-09-27T14:50Z\"]. You can specify any time range in \
         the previous three hours.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    In a [GetSampledRequests] request, the [StartTime] and [EndTime] objects specify the time \
   range for which you want AWS WAF to return a sample of web requests.\n\
  \    \n\
  \     You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes \
   the special designator, [Z]. For example, [\"2016-09-27T14:50Z\"]. \n\
  \     \n\
  \      In a [GetSampledRequests] response, the [StartTime] and [EndTime] objects specify the \
   time range for which AWS WAF actually returned a sample of web requests. AWS WAF gets the \
   specified number of requests from among the first 5,000 requests that your AWS resource \
   receives during the specified time period. If your resource receives more than 5,000 requests \
   during that period, AWS WAF stops sampling after the 5,000th request. In that case, [EndTime] \
   is the time that AWS WAF received the 5,000th request. \n\
  \      "]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = { value : tag_value; [@ocaml.doc "\n"] key : tag_key [@ocaml.doc "\n"] }
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    A tag associated with an AWS resource. Tags are key:value pairs that you can use to \
   categorize and manage your resources, for purposes like billing. For example, you might set the \
   tag key to \"customer\" and the value to the customer name or ID. You can specify one or more \
   tags to add to each AWS resource, up to 50 tags for a resource.\n\
  \    \n\
  \     Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags \
   through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS \
   WAF Classic: web ACLs, rule groups, and rules. \n\
  \     "]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list; [@ocaml.doc "\n"]
  resource_ar_n : resource_arn; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec tag_info_for_resource = {
  tag_list : tag_list option; [@ocaml.doc "\n"]
  resource_ar_n : resource_arn option; [@ocaml.doc "\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Information for a tag associated with an AWS resource. Tags are key:value pairs that you \
   can use to categorize and manage your resources, for purposes like billing. For example, you \
   might set the tag key to \"customer\" and the value to the customer name or ID. You can specify \
   one or more tags to add to each AWS resource, up to 50 tags for a resource.\n\
  \    \n\
  \     Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags \
   through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS \
   WAF Classic: web ACLs, rule groups, and rules. \n\
  \     "]

type nonrec subscribed_rule_group_summary = {
  metric_name : metric_name;
      [@ocaml.doc
        "A friendly name or description for the metrics for this [RuleGroup]. The name can contain \
         only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length \
         one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" \
         and \"Default_Action.\" You can't change the name of the metric after you create the \
         [RuleGroup].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [RuleGroup]. You can't change the name of a \
         [RuleGroup] after you create it.\n"]
  rule_group_id : resource_id; [@ocaml.doc "A unique identifier for a [RuleGroup].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    A summary of the rule groups you are subscribed to.\n\
  \    "]

type nonrec subscribed_rule_group_summaries = subscribed_rule_group_summary list [@@ocaml.doc ""]

type nonrec sql_injection_match_tuples = sql_injection_match_tuple list [@@ocaml.doc ""]

type nonrec sql_injection_match_set_summary = {
  name : resource_name;
      [@ocaml.doc "The name of the [SqlInjectionMatchSet], if any, specified by [Id].\n"]
  sql_injection_match_set_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [SqlInjectionMatchSet]. You use [SqlInjectionMatchSetId] to get \
         information about a [SqlInjectionMatchSet] (see [GetSqlInjectionMatchSet]), update a \
         [SqlInjectionMatchSet] (see [UpdateSqlInjectionMatchSet]), insert a \
         [SqlInjectionMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and \
         delete a [SqlInjectionMatchSet] from AWS WAF (see [DeleteSqlInjectionMatchSet]).\n\n\
        \  [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by \
         [ListSqlInjectionMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The [Id] and [Name] of a [SqlInjectionMatchSet].\n\
  \    "]

type nonrec sql_injection_match_set_summaries = sql_injection_match_set_summary list
[@@ocaml.doc ""]

type nonrec sql_injection_match_set = {
  sql_injection_match_tuples : sql_injection_match_tuples;
      [@ocaml.doc
        "Specifies the parts of web requests that you want to inspect for snippets of malicious \
         SQL code.\n"]
  name : resource_name option; [@ocaml.doc "The name, if any, of the [SqlInjectionMatchSet].\n"]
  sql_injection_match_set_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [SqlInjectionMatchSet]. You use [SqlInjectionMatchSetId] to get \
         information about a [SqlInjectionMatchSet] (see [GetSqlInjectionMatchSet]), update a \
         [SqlInjectionMatchSet] (see [UpdateSqlInjectionMatchSet]), insert a \
         [SqlInjectionMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and \
         delete a [SqlInjectionMatchSet] from AWS WAF (see [DeleteSqlInjectionMatchSet]).\n\n\
        \  [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by \
         [ListSqlInjectionMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    A complex type that contains [SqlInjectionMatchTuple] objects, which specify the parts of \
   web requests that you want AWS WAF to inspect for snippets of malicious SQL code and, if you \
   want AWS WAF to inspect a header, the name of the header. If a [SqlInjectionMatchSet] contains \
   more than one [SqlInjectionMatchTuple] object, a request needs to include snippets of SQL code \
   in only one of the specified parts of the request to be considered a match.\n\
  \    "]

type nonrec size_constraints = size_constraint list [@@ocaml.doc ""]

type nonrec size_constraint_set_summary = {
  name : resource_name; [@ocaml.doc "The name of the [SizeConstraintSet], if any.\n"]
  size_constraint_set_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [SizeConstraintSet]. You use [SizeConstraintSetId] to get \
         information about a [SizeConstraintSet] (see [GetSizeConstraintSet]), update a \
         [SizeConstraintSet] (see [UpdateSizeConstraintSet]), insert a [SizeConstraintSet] into a \
         [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [SizeConstraintSet] \
         from AWS WAF (see [DeleteSizeConstraintSet]).\n\n\
        \  [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by \
         [ListSizeConstraintSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The [Id] and [Name] of a [SizeConstraintSet].\n\
  \    "]

type nonrec size_constraint_set_summaries = size_constraint_set_summary list [@@ocaml.doc ""]

type nonrec size_constraint_set = {
  size_constraints : size_constraints;
      [@ocaml.doc "Specifies the parts of web requests that you want to inspect the size of.\n"]
  name : resource_name option; [@ocaml.doc "The name, if any, of the [SizeConstraintSet].\n"]
  size_constraint_set_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [SizeConstraintSet]. You use [SizeConstraintSetId] to get \
         information about a [SizeConstraintSet] (see [GetSizeConstraintSet]), update a \
         [SizeConstraintSet] (see [UpdateSizeConstraintSet]), insert a [SizeConstraintSet] into a \
         [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [SizeConstraintSet] \
         from AWS WAF (see [DeleteSizeConstraintSet]).\n\n\
        \  [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by \
         [ListSizeConstraintSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    A complex type that contains [SizeConstraint] objects, which specify the parts of web \
   requests that you want AWS WAF to inspect the size of. If a [SizeConstraintSet] contains more \
   than one [SizeConstraint] object, a request only needs to match one constraint to be considered \
   a match.\n\
  \    "]

type nonrec ip_string = string [@@ocaml.doc ""]

type nonrec country = string [@@ocaml.doc ""]

type nonrec http_method = string [@@ocaml.doc ""]

type nonrec http_version = string [@@ocaml.doc ""]

type nonrec header_name = string [@@ocaml.doc ""]

type nonrec header_value = string [@@ocaml.doc ""]

type nonrec http_header = {
  value : header_value option;
      [@ocaml.doc "The value of one of the headers in the sampled web request.\n"]
  name : header_name option;
      [@ocaml.doc "The name of one of the headers in the sampled web request.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The response from a [GetSampledRequests] request includes an [HTTPHeader] complex type that \
   appears as [Headers] in the response syntax. [HTTPHeader] contains the names and values of all \
   of the headers that appear in one of the web requests that were returned by \
   [GetSampledRequests]. \n\
  \    "]

type nonrec http_headers = http_header list [@@ocaml.doc ""]

type nonrec http_request = {
  headers : http_headers option;
      [@ocaml.doc
        "A complex type that contains two values for each header in the sampled web request: the \
         name of the header and the value of the header.\n"]
  http_version : http_version option;
      [@ocaml.doc
        "The HTTP version specified in the sampled web request, for example, [HTTP/1.1].\n"]
  method_ : http_method option;
      [@ocaml.doc
        "The HTTP method specified in the sampled web request. CloudFront supports the following \
         methods: [DELETE], [GET], [HEAD], [OPTIONS], [PATCH], [POST], and [PUT]. \n"]
  ur_i : uri_string option;
      [@ocaml.doc
        "The part of a web request that identifies the resource, for example, \
         [/images/daily-ad.jpg].\n"]
  country : country option;
      [@ocaml.doc
        "The two-letter country code for the country that the request originated from. For a \
         current list of country codes, see the Wikipedia entry \
         {{:https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2}ISO 3166-1 alpha-2}.\n"]
  client_i_p : ip_string option;
      [@ocaml.doc
        "The IP address that the request originated from. If the [WebACL] is associated with a \
         CloudFront distribution, this is the value of one of the following fields in CloudFront \
         access logs:\n\n\
        \ {ul\n\
        \       {-   [c-ip], if the viewer did not use an HTTP proxy or a load balancer to send \
         the request\n\
        \           \n\
        \            }\n\
        \       {-   [x-forwarded-for], if the viewer did use an HTTP proxy or a load balancer to \
         send the request\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The response from a [GetSampledRequests] request includes an [HTTPRequest] complex type \
   that appears as [Request] in the response syntax. [HTTPRequest] contains information about one \
   of the web requests that were returned by [GetSampledRequests]. \n\
  \    "]

type nonrec sample_weight = int [@@ocaml.doc ""]

type nonrec action = string [@@ocaml.doc ""]

type nonrec sampled_http_request = {
  rule_within_rule_group : resource_id option;
      [@ocaml.doc
        "This value is returned if the [GetSampledRequests] request specifies the ID of a \
         [RuleGroup] rather than the ID of an individual rule. [RuleWithinRuleGroup] is the rule \
         within the specified [RuleGroup] that matched the request listed in the response.\n"]
  action : action option;
      [@ocaml.doc
        "The action for the [Rule] that the request matched: [ALLOW], [BLOCK], or [COUNT].\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "The time at which AWS WAF received the request from your AWS resource, in Unix time \
         format (in seconds).\n"]
  weight : sample_weight;
      [@ocaml.doc
        "A value that indicates how one result in the response relates proportionally to other \
         results in the response. A result that has a weight of [2] represents roughly twice as \
         many CloudFront web requests as a result that has a weight of [1].\n"]
  request : http_request;
      [@ocaml.doc "A complex type that contains detailed information about the request.\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The response from a [GetSampledRequests] request includes a [SampledHTTPRequests] complex \
   type that appears as [SampledRequests] in the response syntax. [SampledHTTPRequests] contains \
   one [SampledHTTPRequest] object for each web request that is returned by [GetSampledRequests].\n\
  \    "]

type nonrec sampled_http_requests = sampled_http_request list [@@ocaml.doc ""]

type nonrec s3_object_url = string [@@ocaml.doc ""]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec rule_summary = {
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [Rule]. You can't change the name of a [Rule] after \
         you create it.\n"]
  rule_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [Rule]. You use [RuleId] to get more information about a [Rule] \
         (see [GetRule]), update a [Rule] (see [UpdateRule]), insert a [Rule] into a [WebACL] or \
         delete one from a [WebACL] (see [UpdateWebACL]), or delete a [Rule] from AWS WAF (see \
         [DeleteRule]).\n\n\
        \  [RuleId] is returned by [CreateRule] and by [ListRules].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Contains the identifier and the friendly name or description of the [Rule].\n\
  \    "]

type nonrec rule_summaries = rule_summary list [@@ocaml.doc ""]

type nonrec rule_group_summary = {
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [RuleGroup]. You can't change the name of a \
         [RuleGroup] after you create it.\n"]
  rule_group_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [RuleGroup]. You use [RuleGroupId] to get more information \
         about a [RuleGroup] (see [GetRuleGroup]), update a [RuleGroup] (see [UpdateRuleGroup]), \
         insert a [RuleGroup] into a [WebACL] or delete one from a [WebACL] (see [UpdateWebACL]), \
         or delete a [RuleGroup] from AWS WAF (see [DeleteRuleGroup]).\n\n\
        \  [RuleGroupId] is returned by [CreateRuleGroup] and by [ListRuleGroups].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Contains the identifier and the friendly name or description of the [RuleGroup].\n\
  \    "]

type nonrec rule_group_summaries = rule_group_summary list [@@ocaml.doc ""]

type nonrec rule_group = {
  metric_name : metric_name option;
      [@ocaml.doc
        "A friendly name or description for the metrics for this [RuleGroup]. The name can contain \
         only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length \
         one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" \
         and \"Default_Action.\" You can't change the name of the metric after you create the \
         [RuleGroup].\n"]
  name : resource_name option;
      [@ocaml.doc
        "The friendly name or description for the [RuleGroup]. You can't change the name of a \
         [RuleGroup] after you create it.\n"]
  rule_group_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [RuleGroup]. You use [RuleGroupId] to get more information \
         about a [RuleGroup] (see [GetRuleGroup]), update a [RuleGroup] (see [UpdateRuleGroup]), \
         insert a [RuleGroup] into a [WebACL] or delete a one from a [WebACL] (see \
         [UpdateWebACL]), or delete a [RuleGroup] from AWS WAF (see [DeleteRuleGroup]).\n\n\
        \  [RuleGroupId] is returned by [CreateRuleGroup] and by [ListRuleGroups].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    A collection of predefined rules that you can add to a web ACL.\n\
  \    \n\
  \     Rule groups are subject to the following limits:\n\
  \     \n\
  \      {ul\n\
  \            {-  Three rule groups per account. You can request an increase to this limit by \
   contacting customer support.\n\
  \                \n\
  \                 }\n\
  \            {-  One rule group per web ACL.\n\
  \                \n\
  \                 }\n\
  \            {-  Ten rules per rule group.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \  "]

type nonrec predicates = predicate list [@@ocaml.doc ""]

type nonrec rule = {
  predicates : predicates;
      [@ocaml.doc
        "The [Predicates] object contains one [Predicate] element for each [ByteMatchSet], \
         [IPSet], or [SqlInjectionMatchSet] object that you want to include in a [Rule].\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "A friendly name or description for the metrics for this [Rule]. The name can contain only \
         alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. \
         It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" and \
         \"Default_Action.\" You can't change [MetricName] after you create the [Rule].\n"]
  name : resource_name option;
      [@ocaml.doc
        "The friendly name or description for the [Rule]. You can't change the name of a [Rule] \
         after you create it.\n"]
  rule_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [Rule]. You use [RuleId] to get more information about a [Rule] \
         (see [GetRule]), update a [Rule] (see [UpdateRule]), insert a [Rule] into a [WebACL] or \
         delete a one from a [WebACL] (see [UpdateWebACL]), or delete a [Rule] from AWS WAF (see \
         [DeleteRule]).\n\n\
        \  [RuleId] is returned by [CreateRule] and by [ListRules].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    A combination of [ByteMatchSet], [IPSet], and/or [SqlInjectionMatchSet] objects that \
   identify the web requests that you want to allow, block, or count. For example, you might \
   create a [Rule] that includes the following predicates:\n\
  \    \n\
  \     {ul\n\
  \           {-  An [IPSet] that causes AWS WAF to search for web requests that originate from \
   the IP address [192.0.2.44] \n\
  \               \n\
  \                }\n\
  \           {-  A [ByteMatchSet] that causes AWS WAF to search for web requests for which the \
   value of the [User-Agent] header is [BadBot].\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To match the settings in this [Rule], a request must originate from [192.0.2.44] AND include \
   a [User-Agent] header for which the value is [BadBot].\n\
  \   "]

type nonrec regex_pattern_strings = regex_pattern_string list [@@ocaml.doc ""]

type nonrec regex_pattern_set_summary = {
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [RegexPatternSet]. You can't change [Name] after \
         you create a [RegexPatternSet].\n"]
  regex_pattern_set_id : resource_id;
      [@ocaml.doc
        "The [RegexPatternSetId] for a [RegexPatternSet]. You use [RegexPatternSetId] to get \
         information about a [RegexPatternSet], update a [RegexPatternSet], remove a \
         [RegexPatternSet] from a [RegexMatchSet], and delete a [RegexPatternSet] from AWS WAF.\n\n\
        \  [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Returned by [ListRegexPatternSets]. Each [RegexPatternSetSummary] object includes the \
   [Name] and [RegexPatternSetId] for one [RegexPatternSet].\n\
  \    "]

type nonrec regex_pattern_set_summaries = regex_pattern_set_summary list [@@ocaml.doc ""]

type nonrec regex_pattern_set = {
  regex_pattern_strings : regex_pattern_strings;
      [@ocaml.doc
        "Specifies the regular expression (regex) patterns that you want AWS WAF to search for, \
         such as [B\\[a@\\]dB\\[o0\\]t].\n"]
  name : resource_name option;
      [@ocaml.doc
        "A friendly name or description of the [RegexPatternSet]. You can't change [Name] after \
         you create a [RegexPatternSet].\n"]
  regex_pattern_set_id : resource_id;
      [@ocaml.doc
        "The identifier for the [RegexPatternSet]. You use [RegexPatternSetId] to get information \
         about a [RegexPatternSet], update a [RegexPatternSet], remove a [RegexPatternSet] from a \
         [RegexMatchSet], and delete a [RegexPatternSet] from AWS WAF.\n\n\
        \  [RegexMatchSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The [RegexPatternSet] specifies the regular expression (regex) pattern that you want AWS \
   WAF to search for, such as [B\\[a@\\]dB\\[o0\\]t]. You can then configure AWS WAF to reject \
   those requests.\n\
  \    "]

type nonrec regex_match_tuples = regex_match_tuple list [@@ocaml.doc ""]

type nonrec regex_match_set_summary = {
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [RegexMatchSet]. You can't change [Name] after you \
         create a [RegexMatchSet].\n"]
  regex_match_set_id : resource_id;
      [@ocaml.doc
        "The [RegexMatchSetId] for a [RegexMatchSet]. You use [RegexMatchSetId] to get information \
         about a [RegexMatchSet], update a [RegexMatchSet], remove a [RegexMatchSet] from a \
         [Rule], and delete a [RegexMatchSet] from AWS WAF.\n\n\
        \  [RegexMatchSetId] is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Returned by [ListRegexMatchSets]. Each [RegexMatchSetSummary] object includes the [Name] \
   and [RegexMatchSetId] for one [RegexMatchSet].\n\
  \    "]

type nonrec regex_match_set_summaries = regex_match_set_summary list [@@ocaml.doc ""]

type nonrec regex_match_set = {
  regex_match_tuples : regex_match_tuples option;
      [@ocaml.doc
        "Contains an array of [RegexMatchTuple] objects. Each [RegexMatchTuple] object contains: \n\n\
        \ {ul\n\
        \       {-  The part of a web request that you want AWS WAF to inspect, such as a query \
         string or the value of the [User-Agent] header. \n\
        \           \n\
        \            }\n\
        \       {-  The identifier of the pattern (a regular expression) that you want AWS WAF to \
         look for. For more information, see [RegexPatternSet].\n\
        \           \n\
        \            }\n\
        \       {-  Whether to perform any conversions on the request, such as converting it to \
         lowercase, before inspecting it for the specified string.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : resource_name option;
      [@ocaml.doc
        "A friendly name or description of the [RegexMatchSet]. You can't change [Name] after you \
         create a [RegexMatchSet].\n"]
  regex_match_set_id : resource_id option;
      [@ocaml.doc
        "The [RegexMatchSetId] for a [RegexMatchSet]. You use [RegexMatchSetId] to get information \
         about a [RegexMatchSet] (see [GetRegexMatchSet]), update a [RegexMatchSet] (see \
         [UpdateRegexMatchSet]), insert a [RegexMatchSet] into a [Rule] or delete one from a \
         [Rule] (see [UpdateRule]), and delete a [RegexMatchSet] from AWS WAF (see \
         [DeleteRegexMatchSet]).\n\n\
        \  [RegexMatchSetId] is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    In a [GetRegexMatchSet] request, [RegexMatchSet] is a complex type that contains the \
   [RegexMatchSetId] and [Name] of a [RegexMatchSet], and the values that you specified when you \
   updated the [RegexMatchSet].\n\
  \    \n\
  \      The values are contained in a [RegexMatchTuple] object, which specify the parts of web \
   requests that you want AWS WAF to inspect and the values that you want AWS WAF to search for. \
   If a [RegexMatchSet] contains more than one [RegexMatchTuple] object, a request needs to match \
   the settings in only one [ByteMatchTuple] to be considered a match.\n\
  \     "]

type nonrec redacted_fields = field_to_match list [@@ocaml.doc ""]

type nonrec rate_key = IP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rate_based_rule = {
  rate_limit : rate_limit;
      [@ocaml.doc
        "The maximum number of requests, which have an identical value in the field specified by \
         the [RateKey], allowed in a five-minute period. If the number of requests exceeds the \
         [RateLimit] and the other predicates specified in the rule are also met, AWS WAF triggers \
         the action that is specified for this rule.\n"]
  rate_key : rate_key;
      [@ocaml.doc
        "The field that AWS WAF uses to determine if requests are likely arriving from single \
         source and thus subject to rate monitoring. The only valid value for [RateKey] is [IP]. \
         [IP] indicates that requests arriving from the same IP address are subject to the \
         [RateLimit] that is specified in the [RateBasedRule].\n"]
  match_predicates : predicates;
      [@ocaml.doc
        "The [Predicates] object contains one [Predicate] element for each [ByteMatchSet], \
         [IPSet], or [SqlInjectionMatchSet] object that you want to include in a [RateBasedRule].\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "A friendly name or description for the metrics for a [RateBasedRule]. The name can \
         contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum \
         length one. It can't contain whitespace or metric names reserved for AWS WAF, including \
         \"All\" and \"Default_Action.\" You can't change the name of the metric after you create \
         the [RateBasedRule].\n"]
  name : resource_name option;
      [@ocaml.doc
        "A friendly name or description for a [RateBasedRule]. You can't change the name of a \
         [RateBasedRule] after you create it.\n"]
  rule_id : resource_id;
      [@ocaml.doc
        "A unique identifier for a [RateBasedRule]. You use [RuleId] to get more information about \
         a [RateBasedRule] (see [GetRateBasedRule]), update a [RateBasedRule] (see \
         [UpdateRateBasedRule]), insert a [RateBasedRule] into a [WebACL] or delete one from a \
         [WebACL] (see [UpdateWebACL]), or delete a [RateBasedRule] from AWS WAF (see \
         [DeleteRateBasedRule]).\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    A [RateBasedRule] is identical to a regular [Rule], with one addition: a [RateBasedRule] \
   counts the number of requests that arrive from a specified IP address every five minutes. For \
   example, based on recent requests that you've seen from an attacker, you might create a \
   [RateBasedRule] that includes the following conditions: \n\
  \    \n\
  \     {ul\n\
  \           {-  The requests come from 192.0.2.44.\n\
  \               \n\
  \                }\n\
  \           {-  They contain the value [BadBot] in the [User-Agent] header.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   In the rule, you also define the rate limit as 1,000.\n\
  \   \n\
  \    Requests that meet both of these conditions and exceed 1,000 requests every five minutes \
   trigger the rule's action (block or count), which is defined in the web ACL.\n\
  \    "]

type nonrec put_permission_policy_response = unit [@@ocaml.doc ""]

type nonrec policy_string = string [@@ocaml.doc ""]

type nonrec put_permission_policy_request = {
  policy : policy_string; [@ocaml.doc "The policy to attach to the specified RuleGroup.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the RuleGroup to which you want to attach the policy.\n"]
}
[@@ocaml.doc ""]

type nonrec log_destination_configs = resource_arn list [@@ocaml.doc ""]

type nonrec logging_configuration = {
  redacted_fields : redacted_fields option;
      [@ocaml.doc
        "The parts of the request that you want redacted from the logs. For example, if you redact \
         the cookie field, the cookie field in the firehose will be [xxx]. \n"]
  log_destination_configs : log_destination_configs;
      [@ocaml.doc "An array of Amazon Kinesis Data Firehose ARNs.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the web ACL that you want to associate with \
         [LogDestinationConfigs].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    The Amazon Kinesis Data Firehose, [RedactedFields] information, and the web ACL Amazon \
   Resource Name (ARN).\n\
  \    "]

type nonrec put_logging_configuration_response = {
  logging_configuration : logging_configuration option;
      [@ocaml.doc "The [LoggingConfiguration] that you submitted in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec put_logging_configuration_request = {
  logging_configuration : logging_configuration;
      [@ocaml.doc
        "The Amazon Kinesis Data Firehose that contains the inspected traffic information, the \
         redacted fields details, and the Amazon Resource Name (ARN) of the web ACL to monitor.\n\n\
        \  When specifying [Type] in [RedactedFields], you must use one of the following values: \
         [URI], [QUERY_STRING], [HEADER], or [METHOD].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec population_size = int [@@ocaml.doc ""]

type nonrec pagination_limit = int [@@ocaml.doc ""]

type nonrec next_marker = string [@@ocaml.doc ""]

type nonrec managed_key = string [@@ocaml.doc ""]

type nonrec managed_keys = managed_key list [@@ocaml.doc ""]

type nonrec logging_configurations = logging_configuration list [@@ocaml.doc ""]

type nonrec list_xss_match_sets_response = {
  xss_match_sets : xss_match_set_summaries option;
      [@ocaml.doc "An array of [XssMatchSetSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [XssMatchSet] objects than the number that you specified for [Limit] in \
         the request, the response includes a [NextMarker] value. To list more [XssMatchSet] \
         objects, submit another [ListXssMatchSets] request, and specify the [NextMarker] value \
         from the response in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc "The response to a [ListXssMatchSets] request.\n"]

type nonrec list_xss_match_sets_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [XssMatchSet] objects that you want AWS WAF to return for this \
         request. If you have more [XssMatchSet] objects than the number you specify for [Limit], \
         the response includes a [NextMarker] value that you can use to get another batch of \
         [Rules].\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [XssMatchSet] objects than the value \
         of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list \
         another group of [XssMatchSets]. For the second and subsequent [ListXssMatchSets] \
         requests, specify the value of [NextMarker] from the previous response to get information \
         about another batch of [XssMatchSets].\n"]
}
[@@ocaml.doc "A request to list the [XssMatchSet] objects created by the current AWS account.\n"]

type nonrec list_web_ac_ls_response = {
  web_ac_ls : web_acl_summaries option; [@ocaml.doc "An array of [WebACLSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [WebACL] objects than the number that you specified for [Limit] in the \
         request, the response includes a [NextMarker] value. To list more [WebACL] objects, \
         submit another [ListWebACLs] request, and specify the [NextMarker] value from the \
         response in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_web_ac_ls_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [WebACL] objects that you want AWS WAF to return for this \
         request. If you have more [WebACL] objects than the number that you specify for [Limit], \
         the response includes a [NextMarker] value that you can use to get another batch of \
         [WebACL] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [WebACL] objects than the number \
         that you specify for [Limit], AWS WAF returns a [NextMarker] value in the response that \
         allows you to list another group of [WebACL] objects. For the second and subsequent \
         [ListWebACLs] requests, specify the value of [NextMarker] from the previous response to \
         get information about another batch of [WebACL] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tag_info_for_resource : tag_info_for_resource option; [@ocaml.doc "\n"]
  next_marker : next_marker option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : resource_arn; [@ocaml.doc "\n"]
  limit : pagination_limit option; [@ocaml.doc "\n"]
  next_marker : next_marker option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec list_subscribed_rule_groups_response = {
  rule_groups : subscribed_rule_group_summaries option;
      [@ocaml.doc "An array of [RuleGroup] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more objects than the number that you specified for [Limit] in the request, \
         the response includes a [NextMarker] value. To list more objects, submit another \
         [ListSubscribedRuleGroups] request, and specify the [NextMarker] value from the response \
         in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_subscribed_rule_groups_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of subscribed rule groups that you want AWS WAF to return for this \
         request. If you have more objects than the number you specify for [Limit], the response \
         includes a [NextMarker] value that you can use to get another batch of objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [ByteMatchSets]subscribed rule \
         groups than the value of [Limit], AWS WAF returns a [NextMarker] value in the response \
         that allows you to list another group of subscribed rule groups. For the second and \
         subsequent [ListSubscribedRuleGroupsRequest] requests, specify the value of [NextMarker] \
         from the previous response to get information about another batch of subscribed rule \
         groups.\n"]
}
[@@ocaml.doc ""]

type nonrec list_sql_injection_match_sets_response = {
  sql_injection_match_sets : sql_injection_match_set_summaries option;
      [@ocaml.doc "An array of [SqlInjectionMatchSetSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [SqlInjectionMatchSet] objects than the number that you specified for \
         [Limit] in the request, the response includes a [NextMarker] value. To list more \
         [SqlInjectionMatchSet] objects, submit another [ListSqlInjectionMatchSets] request, and \
         specify the [NextMarker] value from the response in the [NextMarker] value in the next \
         request.\n"]
}
[@@ocaml.doc "The response to a [ListSqlInjectionMatchSets] request.\n"]

type nonrec list_sql_injection_match_sets_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [SqlInjectionMatchSet] objects that you want AWS WAF to return \
         for this request. If you have more [SqlInjectionMatchSet] objects than the number you \
         specify for [Limit], the response includes a [NextMarker] value that you can use to get \
         another batch of [Rules].\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [SqlInjectionMatchSet] objects than \
         the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows \
         you to list another group of [SqlInjectionMatchSets]. For the second and subsequent \
         [ListSqlInjectionMatchSets] requests, specify the value of [NextMarker] from the previous \
         response to get information about another batch of [SqlInjectionMatchSets].\n"]
}
[@@ocaml.doc
  "A request to list the [SqlInjectionMatchSet] objects created by the current AWS account.\n"]

type nonrec list_size_constraint_sets_response = {
  size_constraint_sets : size_constraint_set_summaries option;
      [@ocaml.doc "An array of [SizeConstraintSetSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [SizeConstraintSet] objects than the number that you specified for \
         [Limit] in the request, the response includes a [NextMarker] value. To list more \
         [SizeConstraintSet] objects, submit another [ListSizeConstraintSets] request, and specify \
         the [NextMarker] value from the response in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_size_constraint_sets_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [SizeConstraintSet] objects that you want AWS WAF to return for \
         this request. If you have more [SizeConstraintSets] objects than the number you specify \
         for [Limit], the response includes a [NextMarker] value that you can use to get another \
         batch of [SizeConstraintSet] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [SizeConstraintSets] than the value \
         of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list \
         another group of [SizeConstraintSets]. For the second and subsequent \
         [ListSizeConstraintSets] requests, specify the value of [NextMarker] from the previous \
         response to get information about another batch of [SizeConstraintSets].\n"]
}
[@@ocaml.doc ""]

type nonrec list_rules_response = {
  rules : rule_summaries option; [@ocaml.doc "An array of [RuleSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [Rules] than the number that you specified for [Limit] in the request, \
         the response includes a [NextMarker] value. To list more [Rules], submit another \
         [ListRules] request, and specify the [NextMarker] value from the response in the \
         [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rules_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [Rules] that you want AWS WAF to return for this request. If you \
         have more [Rules] than the number that you specify for [Limit], the response includes a \
         [NextMarker] value that you can use to get another batch of [Rules].\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [Rules] than the value of [Limit], \
         AWS WAF returns a [NextMarker] value in the response that allows you to list another \
         group of [Rules]. For the second and subsequent [ListRules] requests, specify the value \
         of [NextMarker] from the previous response to get information about another batch of \
         [Rules].\n"]
}
[@@ocaml.doc ""]

type nonrec list_rule_groups_response = {
  rule_groups : rule_group_summaries option; [@ocaml.doc "An array of [RuleGroup] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [RuleGroups] than the number that you specified for [Limit] in the \
         request, the response includes a [NextMarker] value. To list more [RuleGroups], submit \
         another [ListRuleGroups] request, and specify the [NextMarker] value from the response in \
         the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rule_groups_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [RuleGroups] that you want AWS WAF to return for this request. If \
         you have more [RuleGroups] than the number that you specify for [Limit], the response \
         includes a [NextMarker] value that you can use to get another batch of [RuleGroups].\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [RuleGroups] than the value of \
         [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list \
         another group of [RuleGroups]. For the second and subsequent [ListRuleGroups] requests, \
         specify the value of [NextMarker] from the previous response to get information about \
         another batch of [RuleGroups].\n"]
}
[@@ocaml.doc ""]

type nonrec list_regex_pattern_sets_response = {
  regex_pattern_sets : regex_pattern_set_summaries option;
      [@ocaml.doc "An array of [RegexPatternSetSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [RegexPatternSet] objects than the number that you specified for [Limit] \
         in the request, the response includes a [NextMarker] value. To list more \
         [RegexPatternSet] objects, submit another [ListRegexPatternSets] request, and specify the \
         [NextMarker] value from the response in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_regex_pattern_sets_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [RegexPatternSet] objects that you want AWS WAF to return for \
         this request. If you have more [RegexPatternSet] objects than the number you specify for \
         [Limit], the response includes a [NextMarker] value that you can use to get another batch \
         of [RegexPatternSet] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [RegexPatternSet] objects than the \
         value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to \
         list another group of [RegexPatternSet] objects. For the second and subsequent \
         [ListRegexPatternSets] requests, specify the value of [NextMarker] from the previous \
         response to get information about another batch of [RegexPatternSet] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_regex_match_sets_response = {
  regex_match_sets : regex_match_set_summaries option;
      [@ocaml.doc "An array of [RegexMatchSetSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [RegexMatchSet] objects than the number that you specified for [Limit] \
         in the request, the response includes a [NextMarker] value. To list more [RegexMatchSet] \
         objects, submit another [ListRegexMatchSets] request, and specify the [NextMarker] value \
         from the response in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_regex_match_sets_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [RegexMatchSet] objects that you want AWS WAF to return for this \
         request. If you have more [RegexMatchSet] objects than the number you specify for \
         [Limit], the response includes a [NextMarker] value that you can use to get another batch \
         of [RegexMatchSet] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [RegexMatchSet] objects than the \
         value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to \
         list another group of [ByteMatchSets]. For the second and subsequent [ListRegexMatchSets] \
         requests, specify the value of [NextMarker] from the previous response to get information \
         about another batch of [RegexMatchSet] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rate_based_rules_response = {
  rules : rule_summaries option; [@ocaml.doc "An array of [RuleSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [Rules] than the number that you specified for [Limit] in the request, \
         the response includes a [NextMarker] value. To list more [Rules], submit another \
         [ListRateBasedRules] request, and specify the [NextMarker] value from the response in the \
         [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rate_based_rules_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [Rules] that you want AWS WAF to return for this request. If you \
         have more [Rules] than the number that you specify for [Limit], the response includes a \
         [NextMarker] value that you can use to get another batch of [Rules].\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [Rules] than the value of [Limit], \
         AWS WAF returns a [NextMarker] value in the response that allows you to list another \
         group of [Rules]. For the second and subsequent [ListRateBasedRules] requests, specify \
         the value of [NextMarker] from the previous response to get information about another \
         batch of [Rules].\n"]
}
[@@ocaml.doc ""]

type nonrec list_logging_configurations_response = {
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [LoggingConfigurations] than the number that you specified for [Limit] \
         in the request, the response includes a [NextMarker] value. To list more \
         [LoggingConfigurations], submit another [ListLoggingConfigurations] request, and specify \
         the [NextMarker] value from the response in the [NextMarker] value in the next request.\n"]
  logging_configurations : logging_configurations option;
      [@ocaml.doc "An array of [LoggingConfiguration] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_logging_configurations_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [LoggingConfigurations] that you want AWS WAF to return for this \
         request. If you have more [LoggingConfigurations] than the number that you specify for \
         [Limit], the response includes a [NextMarker] value that you can use to get another batch \
         of [LoggingConfigurations].\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [LoggingConfigurations] than the \
         value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to \
         list another group of [LoggingConfigurations]. For the second and subsequent \
         [ListLoggingConfigurations] requests, specify the value of [NextMarker] from the previous \
         response to get information about another batch of [ListLoggingConfigurations].\n"]
}
[@@ocaml.doc ""]

type nonrec ip_set_summary = {
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [IPSet]. You can't change the name of an [IPSet] \
         after you create it.\n"]
  ip_set_id : resource_id;
      [@ocaml.doc
        "The [IPSetId] for an [IPSet]. You can use [IPSetId] in a [GetIPSet] request to get \
         detailed information about an [IPSet].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Contains the identifier and the name of the [IPSet].\n\
  \    "]

type nonrec ip_set_summaries = ip_set_summary list [@@ocaml.doc ""]

type nonrec list_ip_sets_response = {
  ip_sets : ip_set_summaries option; [@ocaml.doc "An array of [IPSetSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "To list more [IPSet] objects, submit another [ListIPSets] request, and in the next \
         request use the [NextMarker] response value as the [NextMarker] value.\n"]
}
[@@ocaml.doc ""]

type nonrec list_ip_sets_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [IPSet] objects that you want AWS WAF to return for this request. \
         If you have more [IPSet] objects than the number you specify for [Limit], the response \
         includes a [NextMarker] value that you can use to get another batch of [IPSet] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "AWS WAF returns a [NextMarker] value in the response that allows you to list another \
         group of [IPSets]. For the second and subsequent [ListIPSets] requests, specify the value \
         of [NextMarker] from the previous response to get information about another batch of \
         [IPSets].\n"]
}
[@@ocaml.doc ""]

type nonrec geo_match_set_summary = {
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [GeoMatchSet]. You can't change the name of an \
         [GeoMatchSet] after you create it.\n"]
  geo_match_set_id : resource_id;
      [@ocaml.doc
        "The [GeoMatchSetId] for an [GeoMatchSet]. You can use [GeoMatchSetId] in a \
         [GetGeoMatchSet] request to get detailed information about an [GeoMatchSet].\n"]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Contains the identifier and the name of the [GeoMatchSet].\n\
  \    "]

type nonrec geo_match_set_summaries = geo_match_set_summary list [@@ocaml.doc ""]

type nonrec list_geo_match_sets_response = {
  geo_match_sets : geo_match_set_summaries option;
      [@ocaml.doc "An array of [GeoMatchSetSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [GeoMatchSet] objects than the number that you specified for [Limit] in \
         the request, the response includes a [NextMarker] value. To list more [GeoMatchSet] \
         objects, submit another [ListGeoMatchSets] request, and specify the [NextMarker] value \
         from the response in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_geo_match_sets_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [GeoMatchSet] objects that you want AWS WAF to return for this \
         request. If you have more [GeoMatchSet] objects than the number you specify for [Limit], \
         the response includes a [NextMarker] value that you can use to get another batch of \
         [GeoMatchSet] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [GeoMatchSet]s than the value of \
         [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list \
         another group of [GeoMatchSet] objects. For the second and subsequent [ListGeoMatchSets] \
         requests, specify the value of [NextMarker] from the previous response to get information \
         about another batch of [GeoMatchSet] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec byte_match_set_summary = {
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [ByteMatchSet]. You can't change [Name] after you \
         create a [ByteMatchSet].\n"]
  byte_match_set_id : resource_id;
      [@ocaml.doc
        "The [ByteMatchSetId] for a [ByteMatchSet]. You use [ByteMatchSetId] to get information \
         about a [ByteMatchSet], update a [ByteMatchSet], remove a [ByteMatchSet] from a [Rule], \
         and delete a [ByteMatchSet] from AWS WAF.\n\n\
        \  [ByteMatchSetId] is returned by [CreateByteMatchSet] and by [ListByteMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Returned by [ListByteMatchSets]. Each [ByteMatchSetSummary] object includes the [Name] and \
   [ByteMatchSetId] for one [ByteMatchSet].\n\
  \    "]

type nonrec byte_match_set_summaries = byte_match_set_summary list [@@ocaml.doc ""]

type nonrec list_byte_match_sets_response = {
  byte_match_sets : byte_match_set_summaries option;
      [@ocaml.doc "An array of [ByteMatchSetSummary] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [ByteMatchSet] objects than the number that you specified for [Limit] in \
         the request, the response includes a [NextMarker] value. To list more [ByteMatchSet] \
         objects, submit another [ListByteMatchSets] request, and specify the [NextMarker] value \
         from the response in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_byte_match_sets_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [ByteMatchSet] objects that you want AWS WAF to return for this \
         request. If you have more [ByteMatchSets] objects than the number you specify for \
         [Limit], the response includes a [NextMarker] value that you can use to get another batch \
         of [ByteMatchSet] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [ByteMatchSets] than the value of \
         [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list \
         another group of [ByteMatchSets]. For the second and subsequent [ListByteMatchSets] \
         requests, specify the value of [NextMarker] from the previous response to get information \
         about another batch of [ByteMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec list_activated_rules_in_rule_group_response = {
  activated_rules : activated_rules option; [@ocaml.doc "An array of [ActivatedRules] objects.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you have more [ActivatedRules] than the number that you specified for [Limit] in the \
         request, the response includes a [NextMarker] value. To list more [ActivatedRules], \
         submit another [ListActivatedRulesInRuleGroup] request, and specify the [NextMarker] \
         value from the response in the [NextMarker] value in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_activated_rules_in_rule_group_request = {
  limit : pagination_limit option;
      [@ocaml.doc
        "Specifies the number of [ActivatedRules] that you want AWS WAF to return for this \
         request. If you have more [ActivatedRules] than the number that you specify for [Limit], \
         the response includes a [NextMarker] value that you can use to get another batch of \
         [ActivatedRules].\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "If you specify a value for [Limit] and you have more [ActivatedRules] than the value of \
         [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list \
         another group of [ActivatedRules]. For the second and subsequent \
         [ListActivatedRulesInRuleGroup] requests, specify the value of [NextMarker] from the \
         previous response to get information about another batch of [ActivatedRules].\n"]
  rule_group_id : resource_id option;
      [@ocaml.doc
        "The [RuleGroupId] of the [RuleGroup] for which you want to get a list of [ActivatedRule] \
         objects.\n"]
}
[@@ocaml.doc ""]

type nonrec ignore_unsupported_type = bool [@@ocaml.doc ""]

type nonrec ip_set_descriptors = ip_set_descriptor list [@@ocaml.doc ""]

type nonrec ip_set = {
  ip_set_descriptors : ip_set_descriptors;
      [@ocaml.doc
        "The IP address type ([IPV4] or [IPV6]) and the IP address range (in CIDR notation) that \
         web requests originate from. If the [WebACL] is associated with a CloudFront distribution \
         and the viewer did not use an HTTP proxy or a load balancer to send the request, this is \
         the value of the c-ip field in the CloudFront access logs.\n"]
  name : resource_name option;
      [@ocaml.doc
        "A friendly name or description of the [IPSet]. You can't change the name of an [IPSet] \
         after you create it.\n"]
  ip_set_id : resource_id;
      [@ocaml.doc
        "The [IPSetId] for an [IPSet]. You use [IPSetId] to get information about an [IPSet] (see \
         [GetIPSet]), update an [IPSet] (see [UpdateIPSet]), insert an [IPSet] into a [Rule] or \
         delete one from a [Rule] (see [UpdateRule]), and delete an [IPSet] from AWS WAF (see \
         [DeleteIPSet]).\n\n\
        \  [IPSetId] is returned by [CreateIPSet] and by [ListIPSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Contains one or more IP addresses or blocks of IP addresses specified in Classless \
   Inter-Domain Routing (CIDR) notation. AWS WAF supports IPv4 address ranges: /8 and any range \
   between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and \
   /128.\n\
  \    \n\
  \     To specify an individual IP address, you specify the four-part IP address followed by a \
   [/32], for example, 192.0.2.0/32. To block a range of IP addresses, you can specify /8 or any \
   range between /16 through /32 (for IPv4) or /24, /32, /48, /56, /64, or /128 (for IPv6). For \
   more information about CIDR notation, see the Wikipedia entry \
   {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain \
   Routing}. \n\
  \     "]

type nonrec get_xss_match_set_response = {
  xss_match_set : xss_match_set option;
      [@ocaml.doc
        "Information about the [XssMatchSet] that you specified in the [GetXssMatchSet] request. \
         For more information, see the following topics:\n\n\
        \ {ul\n\
        \       {-   [XssMatchSet]: Contains [Name], [XssMatchSetId], and an array of \
         [XssMatchTuple] objects\n\
        \           \n\
        \            }\n\
        \       {-   [XssMatchTuple]: Each [XssMatchTuple] object contains [FieldToMatch] and \
         [TextTransformation] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The response to a [GetXssMatchSet] request.\n"]

type nonrec get_xss_match_set_request = {
  xss_match_set_id : resource_id;
      [@ocaml.doc
        "The [XssMatchSetId] of the [XssMatchSet] that you want to get. [XssMatchSetId] is \
         returned by [CreateXssMatchSet] and by [ListXssMatchSets].\n"]
}
[@@ocaml.doc "A request to get an [XssMatchSet].\n"]

type nonrec get_web_acl_response = {
  web_ac_l : web_ac_l option;
      [@ocaml.doc
        "Information about the [WebACL] that you specified in the [GetWebACL] request. For more \
         information, see the following topics:\n\n\
        \ {ul\n\
        \       {-   [WebACL]: Contains [DefaultAction], [MetricName], [Name], an array of [Rule] \
         objects, and [WebACLId] \n\
        \           \n\
        \            }\n\
        \       {-   [DefaultAction] (Data type is [WafAction]): Contains [Type] \n\
        \           \n\
        \            }\n\
        \       {-   [Rules]: Contains an array of [ActivatedRule] objects, which contain \
         [Action], [Priority], and [RuleId] \n\
        \           \n\
        \            }\n\
        \       {-   [Action]: Contains [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_web_acl_request = {
  web_acl_id : resource_id;
      [@ocaml.doc
        "The [WebACLId] of the [WebACL] that you want to get. [WebACLId] is returned by \
         [CreateWebACL] and by [ListWebACLs].\n"]
}
[@@ocaml.doc ""]

type nonrec get_sql_injection_match_set_response = {
  sql_injection_match_set : sql_injection_match_set option;
      [@ocaml.doc
        "Information about the [SqlInjectionMatchSet] that you specified in the \
         [GetSqlInjectionMatchSet] request. For more information, see the following topics:\n\n\
        \ {ul\n\
        \       {-   [SqlInjectionMatchSet]: Contains [Name], [SqlInjectionMatchSetId], and an \
         array of [SqlInjectionMatchTuple] objects\n\
        \           \n\
        \            }\n\
        \       {-   [SqlInjectionMatchTuple]: Each [SqlInjectionMatchTuple] object contains \
         [FieldToMatch] and [TextTransformation] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The response to a [GetSqlInjectionMatchSet] request.\n"]

type nonrec get_sql_injection_match_set_request = {
  sql_injection_match_set_id : resource_id;
      [@ocaml.doc
        "The [SqlInjectionMatchSetId] of the [SqlInjectionMatchSet] that you want to get. \
         [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by \
         [ListSqlInjectionMatchSets].\n"]
}
[@@ocaml.doc "A request to get a [SqlInjectionMatchSet].\n"]

type nonrec get_size_constraint_set_response = {
  size_constraint_set : size_constraint_set option;
      [@ocaml.doc
        "Information about the [SizeConstraintSet] that you specified in the \
         [GetSizeConstraintSet] request. For more information, see the following topics:\n\n\
        \ {ul\n\
        \       {-   [SizeConstraintSet]: Contains [SizeConstraintSetId], [SizeConstraints], and \
         [Name] \n\
        \           \n\
        \            }\n\
        \       {-   [SizeConstraints]: Contains an array of [SizeConstraint] objects. Each \
         [SizeConstraint] object contains [FieldToMatch], [TextTransformation], \
         [ComparisonOperator], and [Size] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_size_constraint_set_request = {
  size_constraint_set_id : resource_id;
      [@ocaml.doc
        "The [SizeConstraintSetId] of the [SizeConstraintSet] that you want to get. \
         [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by \
         [ListSizeConstraintSets].\n"]
}
[@@ocaml.doc ""]

type nonrec get_sampled_requests_response = {
  time_window : time_window option;
      [@ocaml.doc
        "Usually, [TimeWindow] is the time range that you specified in the [GetSampledRequests] \
         request. However, if your AWS resource received more than 5,000 requests during the time \
         range that you specified in the request, [GetSampledRequests] returns the time range for \
         the first 5,000 requests. Times are in Coordinated Universal Time (UTC) format.\n"]
  population_size : population_size option;
      [@ocaml.doc
        "The total number of requests from which [GetSampledRequests] got a sample of [MaxItems] \
         requests. If [PopulationSize] is less than [MaxItems], the sample includes every request \
         that your AWS resource received during the specified time range.\n"]
  sampled_requests : sampled_http_requests option;
      [@ocaml.doc
        "A complex type that contains detailed information about each of the requests in the sample.\n"]
}
[@@ocaml.doc ""]

type nonrec get_sampled_requests_max_items = int [@@ocaml.doc ""]

type nonrec get_sampled_requests_request = {
  max_items : get_sampled_requests_max_items;
      [@ocaml.doc
        "The number of requests that you want AWS WAF to return from among the first 5,000 \
         requests that your AWS resource received during the time range. If your resource received \
         fewer requests than the value of [MaxItems], [GetSampledRequests] returns information \
         about all of them. \n"]
  time_window : time_window;
      [@ocaml.doc
        "The start date and time and the end date and time of the range for which you want \
         [GetSampledRequests] to return a sample of requests. You must specify the times in \
         Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. \
         For example, [\"2016-09-27T14:50Z\"]. You can specify any time range in the previous \
         three hours.\n"]
  rule_id : resource_id;
      [@ocaml.doc
        " [RuleId] is one of three values:\n\n\
        \ {ul\n\
        \       {-  The [RuleId] of the [Rule] or the [RuleGroupId] of the [RuleGroup] for which \
         you want [GetSampledRequests] to return a sample of requests.\n\
        \           \n\
        \            }\n\
        \       {-   [Default_Action], which causes [GetSampledRequests] to return a sample of the \
         requests that didn't match any of the rules in the specified [WebACL].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  web_acl_id : resource_id;
      [@ocaml.doc
        "The [WebACLId] of the [WebACL] for which you want [GetSampledRequests] to return a sample \
         of requests.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rule_response = {
  rule : rule option;
      [@ocaml.doc
        "Information about the [Rule] that you specified in the [GetRule] request. For more \
         information, see the following topics:\n\n\
        \ {ul\n\
        \       {-   [Rule]: Contains [MetricName], [Name], an array of [Predicate] objects, and \
         [RuleId] \n\
        \           \n\
        \            }\n\
        \       {-   [Predicate]: Each [Predicate] object contains [DataId], [Negated], and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_rule_request = {
  rule_id : resource_id;
      [@ocaml.doc
        "The [RuleId] of the [Rule] that you want to get. [RuleId] is returned by [CreateRule] and \
         by [ListRules].\n"]
}
[@@ocaml.doc ""]

type nonrec get_rule_group_response = {
  rule_group : rule_group option;
      [@ocaml.doc
        "Information about the [RuleGroup] that you specified in the [GetRuleGroup] request. \n"]
}
[@@ocaml.doc ""]

type nonrec get_rule_group_request = {
  rule_group_id : resource_id;
      [@ocaml.doc
        "The [RuleGroupId] of the [RuleGroup] that you want to get. [RuleGroupId] is returned by \
         [CreateRuleGroup] and by [ListRuleGroups].\n"]
}
[@@ocaml.doc ""]

type nonrec get_regex_pattern_set_response = {
  regex_pattern_set : regex_pattern_set option;
      [@ocaml.doc
        "Information about the [RegexPatternSet] that you specified in the [GetRegexPatternSet] \
         request, including the identifier of the pattern set and the regular expression patterns \
         you want AWS WAF to search for. \n"]
}
[@@ocaml.doc ""]

type nonrec get_regex_pattern_set_request = {
  regex_pattern_set_id : resource_id;
      [@ocaml.doc
        "The [RegexPatternSetId] of the [RegexPatternSet] that you want to get. \
         [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].\n"]
}
[@@ocaml.doc ""]

type nonrec get_regex_match_set_response = {
  regex_match_set : regex_match_set option;
      [@ocaml.doc
        "Information about the [RegexMatchSet] that you specified in the [GetRegexMatchSet] \
         request. For more information, see [RegexMatchTuple].\n"]
}
[@@ocaml.doc ""]

type nonrec get_regex_match_set_request = {
  regex_match_set_id : resource_id;
      [@ocaml.doc
        "The [RegexMatchSetId] of the [RegexMatchSet] that you want to get. [RegexMatchSetId] is \
         returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec get_rate_based_rule_response = {
  rule : rate_based_rule option;
      [@ocaml.doc
        "Information about the [RateBasedRule] that you specified in the [GetRateBasedRule] request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rate_based_rule_request = {
  rule_id : resource_id;
      [@ocaml.doc
        "The [RuleId] of the [RateBasedRule] that you want to get. [RuleId] is returned by \
         [CreateRateBasedRule] and by [ListRateBasedRules].\n"]
}
[@@ocaml.doc ""]

type nonrec get_rate_based_rule_managed_keys_response = {
  next_marker : next_marker option; [@ocaml.doc "A null value and not currently used.\n"]
  managed_keys : managed_keys option;
      [@ocaml.doc
        "An array of IP addresses that currently are blocked by the specified [RateBasedRule]. \n"]
}
[@@ocaml.doc ""]

type nonrec get_rate_based_rule_managed_keys_request = {
  next_marker : next_marker option;
      [@ocaml.doc "A null value and not currently used. Do not include this in your request.\n"]
  rule_id : resource_id;
      [@ocaml.doc
        "The [RuleId] of the [RateBasedRule] for which you want to get a list of [ManagedKeys]. \
         [RuleId] is returned by [CreateRateBasedRule] and by [ListRateBasedRules].\n"]
}
[@@ocaml.doc ""]

type nonrec get_permission_policy_response = {
  policy : policy_string option; [@ocaml.doc "The IAM policy attached to the specified RuleGroup.\n"]
}
[@@ocaml.doc ""]

type nonrec get_permission_policy_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the RuleGroup for which you want to get the policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_logging_configuration_response = {
  logging_configuration : logging_configuration option;
      [@ocaml.doc "The [LoggingConfiguration] for the specified web ACL.\n"]
}
[@@ocaml.doc ""]

type nonrec get_logging_configuration_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the web ACL for which you want to get the \
         [LoggingConfiguration].\n"]
}
[@@ocaml.doc ""]

type nonrec get_ip_set_response = {
  ip_set : ip_set option;
      [@ocaml.doc
        "Information about the [IPSet] that you specified in the [GetIPSet] request. For more \
         information, see the following topics:\n\n\
        \ {ul\n\
        \       {-   [IPSet]: Contains [IPSetDescriptors], [IPSetId], and [Name] \n\
        \           \n\
        \            }\n\
        \       {-   [IPSetDescriptors]: Contains an array of [IPSetDescriptor] objects. Each \
         [IPSetDescriptor] object contains [Type] and [Value] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_ip_set_request = {
  ip_set_id : resource_id;
      [@ocaml.doc
        "The [IPSetId] of the [IPSet] that you want to get. [IPSetId] is returned by [CreateIPSet] \
         and by [ListIPSets].\n"]
}
[@@ocaml.doc ""]

type nonrec geo_match_constraints = geo_match_constraint list [@@ocaml.doc ""]

type nonrec geo_match_set = {
  geo_match_constraints : geo_match_constraints;
      [@ocaml.doc
        "An array of [GeoMatchConstraint] objects, which contain the country that you want AWS WAF \
         to search for.\n"]
  name : resource_name option;
      [@ocaml.doc
        "A friendly name or description of the [GeoMatchSet]. You can't change the name of an \
         [GeoMatchSet] after you create it.\n"]
  geo_match_set_id : resource_id;
      [@ocaml.doc
        "The [GeoMatchSetId] for an [GeoMatchSet]. You use [GeoMatchSetId] to get information \
         about a [GeoMatchSet] (see [GeoMatchSet]), update a [GeoMatchSet] (see \
         [UpdateGeoMatchSet]), insert a [GeoMatchSet] into a [Rule] or delete one from a [Rule] \
         (see [UpdateRule]), and delete a [GeoMatchSet] from AWS WAF (see [DeleteGeoMatchSet]).\n\n\
        \  [GeoMatchSetId] is returned by [CreateGeoMatchSet] and by [ListGeoMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    Contains one or more countries that AWS WAF will search for.\n\
  \    "]

type nonrec get_geo_match_set_response = {
  geo_match_set : geo_match_set option;
      [@ocaml.doc
        "Information about the [GeoMatchSet] that you specified in the [GetGeoMatchSet] request. \
         This includes the [Type], which for a [GeoMatchContraint] is always [Country], as well as \
         the [Value], which is the identifier for a specific country.\n"]
}
[@@ocaml.doc ""]

type nonrec get_geo_match_set_request = {
  geo_match_set_id : resource_id;
      [@ocaml.doc
        "The [GeoMatchSetId] of the [GeoMatchSet] that you want to get. [GeoMatchSetId] is \
         returned by [CreateGeoMatchSet] and by [ListGeoMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec change_token_status =
  | INSYNC [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_change_token_status_response = {
  change_token_status : change_token_status option; [@ocaml.doc "The status of the change token.\n"]
}
[@@ocaml.doc ""]

type nonrec get_change_token_status_request = {
  change_token : change_token;
      [@ocaml.doc
        "The change token for which you want to get the status. This change token was previously \
         returned in the [GetChangeToken] response.\n"]
}
[@@ocaml.doc ""]

type nonrec get_change_token_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used in the request. Use this value in a \
         [GetChangeTokenStatus] request to get the current status of the request. \n"]
}
[@@ocaml.doc ""]

type nonrec get_change_token_request = unit [@@ocaml.doc ""]

type nonrec byte_match_tuples = byte_match_tuple list [@@ocaml.doc ""]

type nonrec byte_match_set = {
  byte_match_tuples : byte_match_tuples;
      [@ocaml.doc
        "Specifies the bytes (typically a string that corresponds with ASCII characters) that you \
         want AWS WAF to search for in web requests, the location in requests that you want AWS \
         WAF to search, and other settings.\n"]
  name : resource_name option;
      [@ocaml.doc
        "A friendly name or description of the [ByteMatchSet]. You can't change [Name] after you \
         create a [ByteMatchSet].\n"]
  byte_match_set_id : resource_id;
      [@ocaml.doc
        "The [ByteMatchSetId] for a [ByteMatchSet]. You use [ByteMatchSetId] to get information \
         about a [ByteMatchSet] (see [GetByteMatchSet]), update a [ByteMatchSet] (see \
         [UpdateByteMatchSet]), insert a [ByteMatchSet] into a [Rule] or delete one from a [Rule] \
         (see [UpdateRule]), and delete a [ByteMatchSet] from AWS WAF (see [DeleteByteMatchSet]).\n\n\
        \  [ByteMatchSetId] is returned by [CreateByteMatchSet] and by [ListByteMatchSets].\n\
        \ "]
}
[@@ocaml.doc
  " This is {b AWS WAF Classic} documentation. For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF \
   Classic} in the developer guide.\n\
  \ \n\
  \   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer \
   Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global \
   use. \n\
  \  \n\
  \    In a [GetByteMatchSet] request, [ByteMatchSet] is a complex type that contains the \
   [ByteMatchSetId] and [Name] of a [ByteMatchSet], and the values that you specified when you \
   updated the [ByteMatchSet]. \n\
  \    \n\
  \     A complex type that contains [ByteMatchTuple] objects, which specify the parts of web \
   requests that you want AWS WAF to inspect and the values that you want AWS WAF to search for. \
   If a [ByteMatchSet] contains more than one [ByteMatchTuple] object, a request needs to match \
   the settings in only one [ByteMatchTuple] to be considered a match.\n\
  \     "]

type nonrec get_byte_match_set_response = {
  byte_match_set : byte_match_set option;
      [@ocaml.doc
        "Information about the [ByteMatchSet] that you specified in the [GetByteMatchSet] request. \
         For more information, see the following topics:\n\n\
        \ {ul\n\
        \       {-   [ByteMatchSet]: Contains [ByteMatchSetId], [ByteMatchTuples], and [Name] \n\
        \           \n\
        \            }\n\
        \       {-   [ByteMatchTuples]: Contains an array of [ByteMatchTuple] objects. Each \
         [ByteMatchTuple] object contains [FieldToMatch], [PositionalConstraint], [TargetString], \
         and [TextTransformation] \n\
        \           \n\
        \            }\n\
        \       {-   [FieldToMatch]: Contains [Data] and [Type] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_byte_match_set_request = {
  byte_match_set_id : resource_id;
      [@ocaml.doc
        "The [ByteMatchSetId] of the [ByteMatchSet] that you want to get. [ByteMatchSetId] is \
         returned by [CreateByteMatchSet] and by [ListByteMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_xss_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteXssMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc "The response to a request to delete an [XssMatchSet] from AWS WAF.\n"]

type nonrec delete_xss_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  xss_match_set_id : resource_id;
      [@ocaml.doc
        "The [XssMatchSetId] of the [XssMatchSet] that you want to delete. [XssMatchSetId] is \
         returned by [CreateXssMatchSet] and by [ListXssMatchSets].\n"]
}
[@@ocaml.doc "A request to delete an [XssMatchSet] from AWS WAF.\n"]

type nonrec delete_web_acl_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteWebACL] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_web_acl_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  web_acl_id : resource_id;
      [@ocaml.doc
        "The [WebACLId] of the [WebACL] that you want to delete. [WebACLId] is returned by \
         [CreateWebACL] and by [ListWebACLs].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_sql_injection_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteSqlInjectionMatchSet] request. You \
         can also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc "The response to a request to delete a [SqlInjectionMatchSet] from AWS WAF.\n"]

type nonrec delete_sql_injection_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  sql_injection_match_set_id : resource_id;
      [@ocaml.doc
        "The [SqlInjectionMatchSetId] of the [SqlInjectionMatchSet] that you want to delete. \
         [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by \
         [ListSqlInjectionMatchSets].\n"]
}
[@@ocaml.doc "A request to delete a [SqlInjectionMatchSet] from AWS WAF.\n"]

type nonrec delete_size_constraint_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteSizeConstraintSet] request. You can \
         also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_size_constraint_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  size_constraint_set_id : resource_id;
      [@ocaml.doc
        "The [SizeConstraintSetId] of the [SizeConstraintSet] that you want to delete. \
         [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by \
         [ListSizeConstraintSets].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteRule] request. You can also use this \
         value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  rule_id : resource_id;
      [@ocaml.doc
        "The [RuleId] of the [Rule] that you want to delete. [RuleId] is returned by [CreateRule] \
         and by [ListRules].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_group_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteRuleGroup] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_group_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  rule_group_id : resource_id;
      [@ocaml.doc
        "The [RuleGroupId] of the [RuleGroup] that you want to delete. [RuleGroupId] is returned \
         by [CreateRuleGroup] and by [ListRuleGroups].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_regex_pattern_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteRegexPatternSet] request. You can \
         also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_regex_pattern_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  regex_pattern_set_id : resource_id;
      [@ocaml.doc
        "The [RegexPatternSetId] of the [RegexPatternSet] that you want to delete. \
         [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_regex_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteRegexMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_regex_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  regex_match_set_id : resource_id;
      [@ocaml.doc
        "The [RegexMatchSetId] of the [RegexMatchSet] that you want to delete. [RegexMatchSetId] \
         is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rate_based_rule_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteRateBasedRule] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rate_based_rule_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  rule_id : resource_id;
      [@ocaml.doc
        "The [RuleId] of the [RateBasedRule] that you want to delete. [RuleId] is returned by \
         [CreateRateBasedRule] and by [ListRateBasedRules].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_permission_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_permission_policy_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the RuleGroup from which you want to delete the policy.\n\n\
        \ The user making the request must be the owner of the RuleGroup.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_logging_configuration_response = unit [@@ocaml.doc ""]

type nonrec delete_logging_configuration_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the web ACL from which you want to delete the \
         [LoggingConfiguration].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_ip_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteIPSet] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_ip_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  ip_set_id : resource_id;
      [@ocaml.doc
        "The [IPSetId] of the [IPSet] that you want to delete. [IPSetId] is returned by \
         [CreateIPSet] and by [ListIPSets].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_geo_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteGeoMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_geo_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  geo_match_set_id : resource_id;
      [@ocaml.doc
        "The [GeoMatchSetID] of the [GeoMatchSet] that you want to delete. [GeoMatchSetId] is \
         returned by [CreateGeoMatchSet] and by [ListGeoMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_byte_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [DeleteByteMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_byte_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  byte_match_set_id : resource_id;
      [@ocaml.doc
        "The [ByteMatchSetId] of the [ByteMatchSet] that you want to delete. [ByteMatchSetId] is \
         returned by [CreateByteMatchSet] and by [ListByteMatchSets].\n"]
}
[@@ocaml.doc ""]

type nonrec create_xss_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateXssMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  xss_match_set : xss_match_set option; [@ocaml.doc "An [XssMatchSet].\n"]
}
[@@ocaml.doc "The response to a [CreateXssMatchSet] request.\n"]

type nonrec create_xss_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description for the [XssMatchSet] that you're creating. You can't \
         change [Name] after you create the [XssMatchSet].\n"]
}
[@@ocaml.doc "A request to create an [XssMatchSet].\n"]

type nonrec create_web_acl_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateWebACL] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  web_ac_l : web_ac_l option; [@ocaml.doc "The [WebACL] returned in the [CreateWebACL] response.\n"]
}
[@@ocaml.doc ""]

type nonrec create_web_acl_request = {
  tags : tag_list option; [@ocaml.doc "\n"]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  default_action : waf_action;
      [@ocaml.doc
        "The action that you want AWS WAF to take when a request doesn't match the criteria \
         specified in any of the [Rule] objects that are associated with the [WebACL].\n"]
  metric_name : metric_name;
      [@ocaml.doc
        "A friendly name or description for the metrics for this [WebACL].The name can contain \
         only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length \
         one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" \
         and \"Default_Action.\" You can't change [MetricName] after you create the [WebACL].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [WebACL]. You can't change [Name] after you create \
         the [WebACL].\n"]
}
[@@ocaml.doc ""]

type nonrec create_web_acl_migration_stack_response = {
  s3_object_url : s3_object_url; [@ocaml.doc "The URL of the template created in Amazon S3. \n"]
}
[@@ocaml.doc ""]

type nonrec create_web_acl_migration_stack_request = {
  ignore_unsupported_type : ignore_unsupported_type;
      [@ocaml.doc
        "Indicates whether to exclude entities that can't be migrated or to stop the migration. \
         Set this to true to ignore unsupported entities in the web ACL during the migration. \
         Otherwise, if AWS WAF encounters unsupported entities, it stops the process and throws an \
         exception. \n"]
  s3_bucket_name : s3_bucket_name;
      [@ocaml.doc
        "The name of the Amazon S3 bucket to store the CloudFormation template in. The S3 bucket \
         must be configured as follows for the migration: \n\n\
        \ {ul\n\
        \       {-  The bucket name must start with [aws-waf-migration-]. For example, \
         [aws-waf-migration-my-web-acl].\n\
        \           \n\
        \            }\n\
        \       {-  The bucket must be in the Region where you are deploying the template. For \
         example, for a web ACL in us-west-2, you must use an Amazon S3 bucket in us-west-2 and \
         you must deploy the template stack to us-west-2. \n\
        \           \n\
        \            }\n\
        \       {-  The bucket policies must permit the migration process to write data. For \
         listings of the bucket policies, see the Examples section. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  web_acl_id : resource_id;
      [@ocaml.doc "The UUID of the WAF Classic web ACL that you want to migrate to WAF v2.\n"]
}
[@@ocaml.doc ""]

type nonrec create_sql_injection_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateSqlInjectionMatchSet] request. You \
         can also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  sql_injection_match_set : sql_injection_match_set option;
      [@ocaml.doc "A [SqlInjectionMatchSet].\n"]
}
[@@ocaml.doc "The response to a [CreateSqlInjectionMatchSet] request.\n"]

type nonrec create_sql_injection_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description for the [SqlInjectionMatchSet] that you're creating. You \
         can't change [Name] after you create the [SqlInjectionMatchSet].\n"]
}
[@@ocaml.doc "A request to create a [SqlInjectionMatchSet].\n"]

type nonrec create_size_constraint_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateSizeConstraintSet] request. You can \
         also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  size_constraint_set : size_constraint_set option;
      [@ocaml.doc "A [SizeConstraintSet] that contains no [SizeConstraint] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec create_size_constraint_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [SizeConstraintSet]. You can't change [Name] after \
         you create a [SizeConstraintSet].\n"]
}
[@@ocaml.doc ""]

type nonrec create_rule_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateRule] request. You can also use this \
         value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  rule : rule option; [@ocaml.doc "The [Rule] returned in the [CreateRule] response.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rule_request = {
  tags : tag_list option; [@ocaml.doc "\n"]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  metric_name : metric_name;
      [@ocaml.doc
        "A friendly name or description for the metrics for this [Rule]. The name can contain only \
         alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. \
         It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" and \
         \"Default_Action.\" You can't change the name of the metric after you create the [Rule].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [Rule]. You can't change the name of a [Rule] after \
         you create it.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rule_group_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateRuleGroup] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  rule_group : rule_group option; [@ocaml.doc "An empty [RuleGroup].\n"]
}
[@@ocaml.doc ""]

type nonrec create_rule_group_request = {
  tags : tag_list option; [@ocaml.doc "\n"]
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  metric_name : metric_name;
      [@ocaml.doc
        "A friendly name or description for the metrics for this [RuleGroup]. The name can contain \
         only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length \
         one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" \
         and \"Default_Action.\" You can't change the name of the metric after you create the \
         [RuleGroup].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [RuleGroup]. You can't change [Name] after you \
         create a [RuleGroup].\n"]
}
[@@ocaml.doc ""]

type nonrec create_regex_pattern_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateRegexPatternSet] request. You can \
         also use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  regex_pattern_set : regex_pattern_set option;
      [@ocaml.doc "A [RegexPatternSet] that contains no objects.\n"]
}
[@@ocaml.doc ""]

type nonrec create_regex_pattern_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [RegexPatternSet]. You can't change [Name] after \
         you create a [RegexPatternSet].\n"]
}
[@@ocaml.doc ""]

type nonrec create_regex_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateRegexMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  regex_match_set : regex_match_set option;
      [@ocaml.doc "A [RegexMatchSet] that contains no [RegexMatchTuple] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec create_regex_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [RegexMatchSet]. You can't change [Name] after you \
         create a [RegexMatchSet].\n"]
}
[@@ocaml.doc ""]

type nonrec create_rate_based_rule_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateRateBasedRule] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  rule : rate_based_rule option;
      [@ocaml.doc "The [RateBasedRule] that is returned in the [CreateRateBasedRule] response.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rate_based_rule_request = {
  tags : tag_list option; [@ocaml.doc "\n"]
  change_token : change_token;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateRateBasedRule] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  rate_limit : rate_limit;
      [@ocaml.doc
        "The maximum number of requests, which have an identical value in the field that is \
         specified by [RateKey], allowed in a five-minute period. If the number of requests \
         exceeds the [RateLimit] and the other predicates specified in the rule are also met, AWS \
         WAF triggers the action that is specified for this rule.\n"]
  rate_key : rate_key;
      [@ocaml.doc
        "The field that AWS WAF uses to determine if requests are likely arriving from a single \
         source and thus subject to rate monitoring. The only valid value for [RateKey] is [IP]. \
         [IP] indicates that requests that arrive from the same IP address are subject to the \
         [RateLimit] that is specified in the [RateBasedRule].\n"]
  metric_name : metric_name;
      [@ocaml.doc
        "A friendly name or description for the metrics for this [RateBasedRule]. The name can \
         contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum \
         length one. It can't contain whitespace or metric names reserved for AWS WAF, including \
         \"All\" and \"Default_Action.\" You can't change the name of the metric after you create \
         the [RateBasedRule].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [RateBasedRule]. You can't change the name of a \
         [RateBasedRule] after you create it.\n"]
}
[@@ocaml.doc ""]

type nonrec create_ip_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateIPSet] request. You can also use \
         this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  ip_set : ip_set option; [@ocaml.doc "The [IPSet] returned in the [CreateIPSet] response.\n"]
}
[@@ocaml.doc ""]

type nonrec create_ip_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [IPSet]. You can't change [Name] after you create \
         the [IPSet].\n"]
}
[@@ocaml.doc ""]

type nonrec create_geo_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateGeoMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  geo_match_set : geo_match_set option;
      [@ocaml.doc
        "The [GeoMatchSet] returned in the [CreateGeoMatchSet] response. The [GeoMatchSet] \
         contains no [GeoMatchConstraints].\n"]
}
[@@ocaml.doc ""]

type nonrec create_geo_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [GeoMatchSet]. You can't change [Name] after you \
         create the [GeoMatchSet].\n"]
}
[@@ocaml.doc ""]

type nonrec create_byte_match_set_response = {
  change_token : change_token option;
      [@ocaml.doc
        "The [ChangeToken] that you used to submit the [CreateByteMatchSet] request. You can also \
         use this value to query the status of the request. For more information, see \
         [GetChangeTokenStatus].\n"]
  byte_match_set : byte_match_set option;
      [@ocaml.doc "A [ByteMatchSet] that contains no [ByteMatchTuple] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec create_byte_match_set_request = {
  change_token : change_token;
      [@ocaml.doc "The value returned by the most recent call to [GetChangeToken].\n"]
  name : resource_name;
      [@ocaml.doc
        "A friendly name or description of the [ByteMatchSet]. You can't change [Name] after you \
         create a [ByteMatchSet].\n"]
}
[@@ocaml.doc ""]
