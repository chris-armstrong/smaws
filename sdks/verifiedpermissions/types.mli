type nonrec throttling_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The quota code recognized by the Amazon Web Services Service Quotas service.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The code for the Amazon Web Services service that owns the quota.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request failed because it exceeded a throttling quota.\n"]

type nonrec resource_type =
  | POLICY_STORE_ALIAS [@ocaml.doc ""]
  | SCHEMA [@ocaml.doc ""]
  | POLICY_TEMPLATE [@ocaml.doc ""]
  | POLICY [@ocaml.doc ""]
  | POLICY_STORE [@ocaml.doc ""]
  | IDENTITY_SOURCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  resource_type : resource_type;
      [@ocaml.doc "The resource type of the resource referenced in the failed request.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique ID of the resource referenced in the failed request.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request failed because it references a resource that doesn't exist.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request failed because of an internal error. Try your request again later\n"]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "You don't have sufficient access to perform this action.\n"]

type nonrec untag_resource_output = unit [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  tag_keys : tag_key_list; [@ocaml.doc "The list of tag keys to remove from the resource.\n"]
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the resource from which you are removing tags.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = {
  resource_name : amazon_resource_name option; [@ocaml.doc ""]
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "No more tags be added because the limit (50) has been reached. To add new tags, use \
   [UntagResource] to remove existing tags.\n"]

type nonrec tag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  tags : tag_map; [@ocaml.doc "The list of key-value pairs to associate with the resource.\n"]
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the resource that you're adding tags to.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  tags : tag_map option; [@ocaml.doc "The list of tags associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the resource for which you want to view tags.\n"]
}
[@@ocaml.doc ""]

type nonrec validation_mode = STRICT [@ocaml.doc ""] | OFF [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec validation_settings = {
  mode : validation_mode;
      [@ocaml.doc
        "The validation mode currently configured for this policy store. The valid values are:\n\n\
        \ {ul\n\
        \       {-   {b OFF} \226\128\147 Neither Verified Permissions nor Cedar perform any \
         validation on policies. No validation errors are reported by either service.\n\
        \           \n\
        \            }\n\
        \       {-   {b STRICT} \226\128\147 Requires a schema to be present in the policy store. \
         Cedar performs validation on all submitted new or updated static policies and policy \
         templates. Any that fail validation are rejected and Cedar doesn't store them in the \
         policy store.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If [Mode=STRICT] and the policy store doesn't contain a schema, Verified Permissions \
         rejects all static policies and policy templates because there is no schema to validate \
         against. \n\
        \    \n\
        \     To submit a static policy or policy template without a schema, you must turn off \
         validation.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc
  "A structure that contains Cedar policy validation settings for the policy store. The validation \
   mode determines which validation failures that Cedar considers serious enough to block \
   acceptance of a new or edited static policy or policy template. \n\n\
  \ This data type is used as a request parameter in the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicyStore.html}CreatePolicyStore} \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyStore.html}UpdatePolicyStore} \
   operations.\n\
  \ "]

type nonrec validation_exception_field = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Describes the policy validation error.\n"]
  path : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The path to the specific element that Verified Permissions found to be not valid.\n"]
}
[@@ocaml.doc "Details about a field that failed policy validation.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_field_list option;
      [@ocaml.doc "The list of fields that aren't valid.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because one or more input parameters don't satisfy their constraint \
   requirements. The output is provided as a list of fields and a reason for each field that isn't \
   valid.\n\n\
  \ The possible reasons include the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b UnrecognizedEntityType} \n\
  \            \n\
  \             The policy includes an entity type that isn't found in the schema.\n\
  \             \n\
  \              }\n\
  \        {-   {b UnrecognizedActionId} \n\
  \            \n\
  \             The policy includes an action id that isn't found in the schema.\n\
  \             \n\
  \              }\n\
  \        {-   {b InvalidActionApplication} \n\
  \            \n\
  \             The policy includes an action that, according to the schema, doesn't support the \
   specified principal and resource.\n\
  \             \n\
  \              }\n\
  \        {-   {b UnexpectedType} \n\
  \            \n\
  \             The policy included an operand that isn't a valid type for the specified operation.\n\
  \             \n\
  \              }\n\
  \        {-   {b IncompatibleTypes} \n\
  \            \n\
  \             The types of elements included in a [set], or the types of expressions used in an \
   [if...then...else] clause aren't compatible in this context.\n\
  \             \n\
  \              }\n\
  \        {-   {b MissingAttribute} \n\
  \            \n\
  \             The policy attempts to access a record or entity attribute that isn't specified in \
   the schema. Test for the existence of the attribute first before attempting to access its \
   value. For more information, see the \
   {{:https://docs.cedarpolicy.com/policies/syntax-operators.html#has-presence-of-attribute-test}has \
   (presence of attribute test) operator} in the {i Cedar Policy Language Guide}.\n\
  \             \n\
  \              }\n\
  \        {-   {b UnsafeOptionalAttributeAccess} \n\
  \            \n\
  \             The policy attempts to access a record or entity attribute that is optional and \
   isn't guaranteed to be present. Test for the existence of the attribute first before attempting \
   to access its value. For more information, see the \
   {{:https://docs.cedarpolicy.com/policies/syntax-operators.html#has-presence-of-attribute-test}has \
   (presence of attribute test) operator} in the {i Cedar Policy Language Guide}.\n\
  \             \n\
  \              }\n\
  \        {-   {b ImpossiblePolicy} \n\
  \            \n\
  \             Cedar has determined that a policy condition always evaluates to false. If the \
   policy is always false, it can never apply to any query, and so it can never affect an \
   authorization decision.\n\
  \             \n\
  \              }\n\
  \        {-   {b WrongNumberArguments} \n\
  \            \n\
  \             The policy references an extension type with the wrong number of arguments.\n\
  \             \n\
  \              }\n\
  \        {-   {b FunctionArgumentValidationError} \n\
  \            \n\
  \             Cedar couldn't parse the argument passed to an extension type. For example, a \
   string that is to be parsed as an IPv4 address can contain only digits and the period character.\n\
  \             \n\
  \              }\n\
  \        }\n\
  \  "]

type nonrec user_pool_arn = string [@@ocaml.doc ""]

type nonrec static_policy_description = string [@@ocaml.doc ""]

type nonrec policy_statement = string [@@ocaml.doc ""]

type nonrec update_static_policy_definition = {
  statement : policy_statement;
      [@ocaml.doc
        "Specifies the Cedar policy language text to be added to or replaced on the static policy.\n\n\
        \  You can change only the following elements from the original content:\n\
        \  \n\
        \   {ul\n\
        \         {-  The [action] referenced by the policy.\n\
        \             \n\
        \              }\n\
        \         {-  Any conditional clauses, such as [when] or [unless] clauses.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   You {b can't} change the following elements:\n\
        \   \n\
        \    {ul\n\
        \          {-  Changing from [StaticPolicy] to [TemplateLinkedPolicy].\n\
        \              \n\
        \               }\n\
        \          {-  The effect ([permit] or [forbid]) of the policy.\n\
        \              \n\
        \               }\n\
        \          {-  The [principal] referenced by the policy.\n\
        \              \n\
        \               }\n\
        \          {-  The [resource] referenced by the policy.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  description : static_policy_description option;
      [@ocaml.doc "Specifies the description to be added to or replaced on the static policy.\n"]
}
[@@ocaml.doc "Contains information about an update to a static policy.\n"]

type nonrec policy_store_id = string [@@ocaml.doc ""]

type nonrec policy_template_id = string [@@ocaml.doc ""]

type nonrec timestamp_format = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec update_policy_template_output = {
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy template was most recently updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy template was originally created.\n"]
  policy_template_id : policy_template_id; [@ocaml.doc "The ID of the updated policy template.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the updated policy template.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_template_description = string [@@ocaml.doc ""]

type nonrec policy_template_name = string [@@ocaml.doc ""]

type nonrec update_policy_template_input = {
  name : policy_template_name option;
      [@ocaml.doc
        "Specifies a name for the policy template that is unique among all policy templates within \
         the policy store. You can use the name in place of the policy template ID in API \
         operations that reference the policy template. The name must be prefixed with [name/].\n\n\
        \  If you don't include the name in an update request, the existing name is unchanged. To \
         remove a name, set it to an empty string ([\"\"]).\n\
        \  \n\
        \    If you specify a name that is already associated with another policy template in the \
         policy store, you receive a [ConflictException] error.\n\
        \    "]
  statement : policy_statement;
      [@ocaml.doc
        "Specifies new statement content written in Cedar policy language to replace the current \
         body of the policy template.\n\n\
        \ You can change only the following elements of the policy body:\n\
        \ \n\
        \  {ul\n\
        \        {-  The [action] referenced by the policy template.\n\
        \            \n\
        \             }\n\
        \        {-  Any conditional clauses, such as [when] or [unless] clauses.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You {b can't} change the following elements:\n\
        \   \n\
        \    {ul\n\
        \          {-  The effect ([permit] or [forbid]) of the policy template.\n\
        \              \n\
        \               }\n\
        \          {-  The [principal] referenced by the policy template.\n\
        \              \n\
        \               }\n\
        \          {-  The [resource] referenced by the policy template.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  description : policy_template_description option;
      [@ocaml.doc "Specifies a new description to apply to the policy template.\n"]
  policy_template_id : policy_template_id;
      [@ocaml.doc
        "Specifies the ID of the policy template that you want to update.\n\n\
        \ You can use the policy template name in place of the policy template ID. When using a \
         name, prefix it with [name/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PTEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Name: [name/example-policy-template] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the policy template that you want to \
         update.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec resource_conflict = {
  resource_type : resource_type; [@ocaml.doc "The type of the resource involved in a conflict.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the resource involved in a conflict.\n"]
}
[@@ocaml.doc "Contains information about a resource conflict.\n"]

type nonrec resource_conflict_list = resource_conflict list [@@ocaml.doc ""]

type nonrec conflict_exception = {
  resources : resource_conflict_list;
      [@ocaml.doc "The list of resources referenced with this failed request.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because another request to modify a resource occurred at the same time.\n"]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec update_policy_store_output = {
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy store was most recently updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy store was originally created.\n"]
  arn : resource_arn;
      [@ocaml.doc
        "The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of the updated policy store.\n"]
  policy_store_id : policy_store_id; [@ocaml.doc "The ID of the updated policy store.\n"]
}
[@@ocaml.doc ""]

type nonrec deletion_protection = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_store_description = string [@@ocaml.doc ""]

type nonrec update_policy_store_input = {
  description : policy_store_description option;
      [@ocaml.doc
        "Descriptive text that you can provide to help with identification of the current policy \
         store.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Specifies whether the policy store can be deleted. If enabled, the policy store can't be \
         deleted.\n\n\
        \ When you call [UpdatePolicyStore], this parameter is unchanged unless explicitly \
         included in the call.\n\
        \ "]
  validation_settings : validation_settings;
      [@ocaml.doc
        "A structure that defines the validation settings that want to enable for the policy store.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that you want to update\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec policy_id = string [@@ocaml.doc ""]

type nonrec policy_type = TEMPLATE_LINKED [@ocaml.doc ""] | STATIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_type = string [@@ocaml.doc ""]

type nonrec entity_id = string [@@ocaml.doc ""]

type nonrec entity_identifier = {
  entity_id : entity_id;
      [@ocaml.doc
        "The identifier of an entity.\n\n  \n {[\n \"entityId\":\"{i identifier}\"\n ]}\n  \n "]
  entity_type : entity_type;
      [@ocaml.doc
        "The type of an entity.\n\n Example: \n {[\n \"entityType\":\"{i typeName}\"\n ]}\n  \n "]
}
[@@ocaml.doc
  "Contains the identifier of an entity, including its ID and type.\n\n\
  \ This data type is used as a request parameter for \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html}IsAuthorized} \
   operation, and as a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html}CreatePolicy}, \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetPolicy.html}GetPolicy}, \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicy.html}UpdatePolicy} \
   operations.\n\
  \ \n\
  \  Example: \n\
  \  {[\n\
  \  \\{\"entityId\":\"{i string}\",\"entityType\":\"{i string}\"\\}\n\
  \  ]}\n\
  \   \n\
  \  "]

type nonrec action_type = string [@@ocaml.doc ""]

type nonrec action_id = string [@@ocaml.doc ""]

type nonrec action_identifier = {
  action_id : action_id; [@ocaml.doc "The ID of an action.\n"]
  action_type : action_type; [@ocaml.doc "The type of an action.\n"]
}
[@@ocaml.doc
  "Contains information about an action for a request for which an authorization decision is made.\n\n\
  \ This data type is used as a request parameter to the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html}IsAuthorized}, \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html}BatchIsAuthorized}, \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken} \
   operations.\n\
  \ \n\
  \  Example: [{ \"actionId\": \"<action name>\", \"actionType\": \"Action\" }] \n\
  \  "]

type nonrec action_identifier_list = action_identifier list [@@ocaml.doc ""]

type nonrec policy_effect = FORBID [@ocaml.doc ""] | PERMIT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_policy_output = {
  effect_ : policy_effect option;
      [@ocaml.doc
        "The effect of the decision that a policy returns to an authorization request. For \
         example, [\"effect\": \"Permit\"].\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy was most recently updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy was originally created.\n"]
  actions : action_identifier_list option;
      [@ocaml.doc
        "The action that a policy permits or forbids. For example, [{\"actions\": \
         \\[{\"actionId\": \"ViewPhoto\", \"actionType\": \"PhotoFlash::Action\"}, {\"entityID\": \
         \"SharePhoto\", \"entityType\": \"PhotoFlash::Action\"}\\]}].\n"]
  resource : entity_identifier option;
      [@ocaml.doc
        "The resource specified in the policy's scope. This element isn't included in the response \
         when [Resource] isn't present in the policy content.\n"]
  principal : entity_identifier option;
      [@ocaml.doc
        "The principal specified in the policy's scope. This element isn't included in the \
         response when [Principal] isn't present in the policy content.\n"]
  policy_type : policy_type; [@ocaml.doc "The type of the policy that was updated.\n"]
  policy_id : policy_id; [@ocaml.doc "The ID of the policy that was updated.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the policy that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_policy_definition =
  | Static of update_static_policy_definition
      [@ocaml.doc "Contains details about the updates to be applied to a static policy.\n"]
[@@ocaml.doc
  "Contains information about updates to be applied to a policy.\n\n\
  \ This data type is used as a request parameter in the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicy.html}UpdatePolicy} \
   operation.\n\
  \ "]

type nonrec policy_name = string [@@ocaml.doc ""]

type nonrec update_policy_input = {
  name : policy_name option;
      [@ocaml.doc
        "Specifies a name for the policy that is unique among all policies within the policy \
         store. You can use the name in place of the policy ID in API operations that reference \
         the policy. The name must be prefixed with [name/].\n\n\
        \  If you don't include the name in an update request, the existing name is unchanged. To \
         remove a name, set it to an empty string ([\"\"]).\n\
        \  \n\
        \    If you specify a name that is already associated with another policy in the policy \
         store, you receive a [ConflictException] error.\n\
        \    "]
  definition : update_policy_definition option;
      [@ocaml.doc
        "Specifies the updated policy content that you want to replace on the specified policy. \
         The content must be valid Cedar policy language text.\n\n\
        \ If you don't specify this parameter, the existing policy definition remains unchanged.\n\
        \ \n\
        \  You can change only the following elements from the policy definition:\n\
        \  \n\
        \   {ul\n\
        \         {-  The [action] referenced by the policy.\n\
        \             \n\
        \              }\n\
        \         {-  Any conditional clauses, such as [when] or [unless] clauses.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   You {b can't} change the following elements:\n\
        \   \n\
        \    {ul\n\
        \          {-  Changing from [static] to [templateLinked].\n\
        \              \n\
        \               }\n\
        \          {-  Changing the effect of the policy from [permit] or [forbid].\n\
        \              \n\
        \               }\n\
        \          {-  The [principal] referenced by the policy.\n\
        \              \n\
        \               }\n\
        \          {-  The [resource] referenced by the policy.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  policy_id : policy_id;
      [@ocaml.doc
        "Specifies the ID of the policy that you want to update. To find this value, you can use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html}ListPolicies}.\n\n\
        \ You can use the policy name in place of the policy ID. When using a name, prefix it with \
         [name/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [SPEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Name: [name/example-policy] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the policy that you want to update.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The quota code recognized by the Amazon Web Services Service Quotas service.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The code for the Amazon Web Services service that owns the quota.\n"]
  resource_type : resource_type;
      [@ocaml.doc "The resource type of the resource referenced in the failed request.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique ID of the resource referenced in the failed request.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request failed because it would cause a service quota to be exceeded.\n"]

type nonrec claim = string [@@ocaml.doc ""]

type nonrec audience = string [@@ocaml.doc ""]

type nonrec audiences = audience list [@@ocaml.doc ""]

type nonrec update_open_id_connect_access_token_configuration = {
  audiences : audiences option;
      [@ocaml.doc
        "The access token [aud] claim values that you want to accept in your policy store. For \
         example, [https://myapp.example.com, https://myapp2.example.com].\n"]
  principal_id_claim : claim option;
      [@ocaml.doc
        "The claim that determines the principal in OIDC access tokens. For example, [sub].\n"]
}
[@@ocaml.doc
  "The configuration of an OpenID Connect (OIDC) identity source for handling access token claims. \
   Contains the claim that you want to identify as the principal in an authorization request, and \
   the values of the [aud] claim, or audiences, that you want to accept.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateOpenIdConnectTokenSelection.html}UpdateOpenIdConnectTokenSelection} \
   structure, which is a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateIdentitySource.html}UpdateIdentitySource}.\n\
  \ "]

type nonrec client_id = string [@@ocaml.doc ""]

type nonrec client_ids = client_id list [@@ocaml.doc ""]

type nonrec update_open_id_connect_identity_token_configuration = {
  client_ids : client_ids option;
      [@ocaml.doc
        "The ID token audience, or client ID, claim values that you want to accept in your policy \
         store from an OIDC identity provider. For example, [1example23456789, 2example10111213].\n"]
  principal_id_claim : claim option;
      [@ocaml.doc
        "The claim that determines the principal in OIDC access tokens. For example, [sub].\n"]
}
[@@ocaml.doc
  "The configuration of an OpenID Connect (OIDC) identity source for handling identity (ID) token \
   claims. Contains the claim that you want to identify as the principal in an authorization \
   request, and the values of the [aud] claim, or audiences, that you want to accept.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateOpenIdConnectTokenSelection.html}UpdateOpenIdConnectTokenSelection} \
   structure, which is a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateIdentitySource.html}UpdateIdentitySource}.\n\
  \ "]

type nonrec update_open_id_connect_token_selection =
  | IdentityTokenOnly of update_open_id_connect_identity_token_configuration
      [@ocaml.doc
        "The OIDC configuration for processing identity (ID) tokens. Contains allowed client ID \
         claims, for example [1example23456789], and the claim that you want to map to the \
         principal, for example [sub].\n"]
  | AccessTokenOnly of update_open_id_connect_access_token_configuration
      [@ocaml.doc
        "The OIDC configuration for processing access tokens. Contains allowed audience claims, \
         for example [https://auth.example.com], and the claim that you want to map to the \
         principal, for example [sub].\n"]
[@@ocaml.doc
  "The token type that you want to process from your OIDC identity provider. Your policy store can \
   process either identity (ID) or access tokens from a given OIDC identity source.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateOpenIdConnectConfiguration.html}UpdateOpenIdConnectConfiguration} \
   structure, which is a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateIdentitySource.html}UpdateIdentitySource}.\n\
  \ "]

type nonrec group_entity_type = string [@@ocaml.doc ""]

type nonrec update_open_id_connect_group_configuration = {
  group_entity_type : group_entity_type;
      [@ocaml.doc
        "The policy store entity type that you want to map your users' group claim to. For \
         example, [MyCorp::UserGroup]. A group entity type is an entity that can have a user \
         entity type as a member.\n"]
  group_claim : claim;
      [@ocaml.doc
        "The token claim that you want Verified Permissions to interpret as group membership. For \
         example, [groups].\n"]
}
[@@ocaml.doc
  "The claim in OIDC identity provider tokens that indicates a user's group membership, and the \
   entity type that you want to map it to. For example, this object can map the contents of a \
   [groups] claim to [MyCorp::UserGroup].\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateOpenIdConnectConfiguration.html}UpdateOpenIdConnectConfiguration} \
   structure, which is a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateIdentitySource.html}UpdateIdentitySource}.\n\
  \ "]

type nonrec issuer = string [@@ocaml.doc ""]

type nonrec entity_id_prefix = string [@@ocaml.doc ""]

type nonrec update_open_id_connect_configuration = {
  token_selection : update_open_id_connect_token_selection;
      [@ocaml.doc
        "The token type that you want to process from your OIDC identity provider. Your policy \
         store can process either identity (ID) or access tokens from a given OIDC identity source.\n"]
  group_configuration : update_open_id_connect_group_configuration option;
      [@ocaml.doc
        "The claim in OIDC identity provider tokens that indicates a user's group membership, and \
         the entity type that you want to map it to. For example, this object can map the contents \
         of a [groups] claim to [MyCorp::UserGroup].\n"]
  entity_id_prefix : entity_id_prefix option;
      [@ocaml.doc
        "A descriptive string that you want to prefix to user entities from your OIDC identity \
         provider. For example, if you set an [entityIdPrefix] of [MyOIDCProvider], you can \
         reference principals in your policies in the format [MyCorp::User::MyOIDCProvider|Carlos].\n"]
  issuer : issuer;
      [@ocaml.doc
        "The issuer URL of an OIDC identity provider. This URL must have an OIDC discovery \
         endpoint at the path [.well-known/openid-configuration].\n"]
}
[@@ocaml.doc
  "Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity \
   source, that Verified Permissions can use to generate entities from authenticated identities. \
   It specifies the issuer URL, token type that you want to use, and policy store entity details.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateConfiguration.html}UpdateConfiguration} \
   structure, which is a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdateIdentitySource.html}UpdateIdentitySource}.\n\
  \ "]

type nonrec identity_source_id = string [@@ocaml.doc ""]

type nonrec update_identity_source_output = {
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the updated identity source.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the identity source was most recently updated.\n"]
  identity_source_id : identity_source_id; [@ocaml.doc "The ID of the updated identity source.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the updated identity source was originally created.\n"]
}
[@@ocaml.doc ""]

type nonrec update_cognito_group_configuration = {
  group_entity_type : group_entity_type;
      [@ocaml.doc
        "The name of the schema entity type that's mapped to the user pool group. Defaults to \
         [AWS::CognitoGroup].\n"]
}
[@@ocaml.doc "The user group entities from an Amazon Cognito user pool identity source.\n"]

type nonrec update_cognito_user_pool_configuration = {
  group_configuration : update_cognito_group_configuration option;
      [@ocaml.doc
        "The configuration of the user groups from an Amazon Cognito user pool identity source.\n"]
  client_ids : client_ids option;
      [@ocaml.doc
        "The client ID of an app client that is configured for the specified Amazon Cognito user \
         pool.\n"]
  user_pool_arn : user_pool_arn;
      [@ocaml.doc
        "The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of the Amazon Cognito user pool associated with this identity source.\n"]
}
[@@ocaml.doc
  "Contains configuration details of a Amazon Cognito user pool for use with an identity source.\n"]

type nonrec update_configuration =
  | OpenIdConnectConfiguration of update_open_id_connect_configuration
      [@ocaml.doc
        "Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity \
         source, that Verified Permissions can use to generate entities from authenticated \
         identities. It specifies the issuer URL, token type that you want to use, and policy \
         store entity details.\n"]
  | CognitoUserPoolConfiguration of update_cognito_user_pool_configuration
      [@ocaml.doc "Contains configuration details of a Amazon Cognito user pool.\n"]
[@@ocaml.doc "Contains an update to replace the configuration in an existing identity source.\n"]

type nonrec principal_entity_type = string [@@ocaml.doc ""]

type nonrec update_identity_source_input = {
  principal_entity_type : principal_entity_type option;
      [@ocaml.doc
        "Specifies the data type of principals generated for identities authenticated by the \
         identity source.\n"]
  update_configuration : update_configuration;
      [@ocaml.doc
        "Specifies the details required to communicate with the identity provider (IdP) associated \
         with this identity source.\n"]
  identity_source_id : identity_source_id;
      [@ocaml.doc "Specifies the ID of the identity source that you want to update.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the identity source that you want to \
         update.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec token = string [@@ocaml.doc ""]

type nonrec template_linked_policy_definition_item = {
  resource : entity_identifier option;
      [@ocaml.doc
        "The resource associated with this template-linked policy. Verified Permissions \
         substitutes this resource for the [?resource] placeholder in the policy template when it \
         evaluates an authorization request.\n"]
  principal : entity_identifier option;
      [@ocaml.doc
        "The principal associated with this template-linked policy. Verified Permissions \
         substitutes this principal for the [?principal] placeholder in the policy template when \
         it evaluates an authorization request.\n"]
  policy_template_id : policy_template_id;
      [@ocaml.doc "The unique identifier of the policy template used to create this policy.\n"]
}
[@@ocaml.doc "Contains information about a policy created by instantiating a policy template. \n"]

type nonrec template_linked_policy_definition_detail = {
  resource : entity_identifier option;
      [@ocaml.doc
        "The resource associated with this template-linked policy. Verified Permissions \
         substitutes this resource for the [?resource] placeholder in the policy template when it \
         evaluates an authorization request.\n"]
  principal : entity_identifier option;
      [@ocaml.doc
        "The principal associated with this template-linked policy. Verified Permissions \
         substitutes this principal for the [?principal] placeholder in the policy template when \
         it evaluates an authorization request.\n"]
  policy_template_id : policy_template_id;
      [@ocaml.doc "The unique identifier of the policy template used to create this policy.\n"]
}
[@@ocaml.doc
  "Contains information about a policy that was created by instantiating a policy template. \n"]

type nonrec template_linked_policy_definition = {
  resource : entity_identifier option;
      [@ocaml.doc
        "The resource associated with this template-linked policy. Verified Permissions \
         substitutes this resource for the [?resource] placeholder in the policy template when it \
         evaluates an authorization request.\n"]
  principal : entity_identifier option;
      [@ocaml.doc
        "The principal associated with this template-linked policy. Verified Permissions \
         substitutes this principal for the [?principal] placeholder in the policy template when \
         it evaluates an authorization request.\n"]
  policy_template_id : policy_template_id;
      [@ocaml.doc "The unique identifier of the policy template used to create this policy.\n"]
}
[@@ocaml.doc "Contains information about a policy created by instantiating a policy template.\n"]

type nonrec string_attribute = string [@@ocaml.doc ""]

type nonrec static_policy_definition_item = {
  description : static_policy_description option;
      [@ocaml.doc "A description of the static policy.\n"]
}
[@@ocaml.doc
  "A structure that contains details about a static policy. It includes the description and policy \
   statement.\n\n\
  \ This data type is used within a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyDefinition.html}PolicyDefinition} \
   structure as part of a request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html}CreatePolicy} \
   operation.\n\
  \ "]

type nonrec static_policy_definition_detail = {
  statement : policy_statement;
      [@ocaml.doc "The content of the static policy written in the Cedar policy language.\n"]
  description : static_policy_description option;
      [@ocaml.doc "A description of the static policy.\n"]
}
[@@ocaml.doc
  "A structure that contains details about a static policy. It includes the description and policy \
   body.\n\n\
  \ This data type is used within a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyDefinition.html}PolicyDefinition} \
   structure as part of a request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html}CreatePolicy} \
   operation.\n\
  \ "]

type nonrec static_policy_definition = {
  statement : policy_statement;
      [@ocaml.doc
        "The policy content of the static policy, written in the Cedar policy language.\n"]
  description : static_policy_description option;
      [@ocaml.doc "The description of the static policy.\n"]
}
[@@ocaml.doc
  "Contains information about a static policy.\n\n\
  \ This data type is used as a field that is part of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyDefinitionDetail.html}PolicyDefinitionDetail} \
   type.\n\
  \ "]

type nonrec boolean_attribute = bool [@@ocaml.doc ""]

type nonrec long_attribute = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec ip_addr = string [@@ocaml.doc ""]

type nonrec decimal = string [@@ocaml.doc ""]

type nonrec datetime_attribute = string [@@ocaml.doc ""]

type nonrec duration = string [@@ocaml.doc ""]

type attribute_value =
  | Duration of duration
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-duration}duration} \
         type.\n\n\
        \ Example: [{\"duration\": \"1h30m\"}] \n\
        \ "]
  | Datetime of datetime_attribute
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-datetime}datetime} \
         type.\n\n\
        \ Example: [{\"datetime\": \"2024-10-15T11:35:00Z\"}] \n\
        \ "]
  | Decimal of decimal
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-decimal}decimal} \
         type.\n\n\
        \ Example: [{\"decimal\": \"1.1\"}] \n\
        \ "]
  | Ipaddr of ip_addr
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-ipaddr}ipaddr} \
         type.\n\n\
        \ Example: [{\"ip\": \"192.168.1.100\"}] \n\
        \ "]
  | Record of record_attribute
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-record}Record} \
         type.\n\n\
        \ Example: [{\"record\": { \"keyName\": {} } }] \n\
        \ "]
  | Set of set_attribute
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-set}Set} type.\n\n\
        \ Example: [{\"set\": \\[ {} \\] }] \n\
        \ "]
  | String of string_attribute
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-string}String} \
         type.\n\n\
        \ Example: [{\"string\": \"abc\"}] \n\
        \ "]
  | Long of long_attribute
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-long}Long} type.\n\n\
        \ Example: [{\"long\": 0}] \n\
        \ "]
  | EntityIdentifier of entity_identifier
      [@ocaml.doc
        "An attribute value of type \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_EntityIdentifier.html}EntityIdentifier}.\n\n\
        \ Example: [{\"entityIdentifier\": { \"entityId\": \"alice\", \"entityType\": \"User\"} }] \n\
        \ "]
  | Boolean of boolean_attribute
      [@ocaml.doc
        "An attribute value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-bool}Boolean} \
         type.\n\n\
        \ Example: [{\"boolean\": true}] \n\
        \ "]
[@@ocaml.doc
  "The value of an attribute.\n\n\
  \ Contains information about the runtime context for a request for which an authorization \
   decision is made. \n\
  \ \n\
  \  This data type is used as a member of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ContextDefinition.html}ContextDefinition} \
   structure which is used as a request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html}IsAuthorized}, \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html}BatchIsAuthorized}, \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken} \
   operations.\n\
  \  "]

and record_attribute = (Smaws_Lib.Smithy_api.Types.string_ * attribute_value) list [@@ocaml.doc ""]

and set_attribute = attribute_value list [@@ocaml.doc ""]

type nonrec schema_json = string [@@ocaml.doc ""]

type nonrec schema_definition =
  | CedarJson of schema_json
      [@ocaml.doc
        "A JSON string representation of the schema supported by applications that use this policy \
         store. To delete the schema, run \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PutSchema.html}PutSchema} \
         with [{}] for this parameter. For more information, see \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/userguide/schema.html}Policy \
         store schema} in the {i Amazon Verified Permissions User Guide}.\n"]
[@@ocaml.doc
  "Contains a list of principal types, resource types, and actions that can be specified in \
   policies stored in the same policy store. If the validation mode for the policy store is set to \
   [STRICT], then policies that can't be validated by this schema are rejected by Verified \
   Permissions and can't be stored in the policy store.\n"]

type nonrec namespace = string [@@ocaml.doc ""]

type nonrec namespace_list = namespace list [@@ocaml.doc ""]

type nonrec put_schema_output = {
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the schema was last updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the schema was originally created.\n"]
  namespaces : namespace_list;
      [@ocaml.doc "Identifies the namespaces of the entities referenced by this schema.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The unique ID of the policy store that contains the schema.\n"]
}
[@@ocaml.doc ""]

type nonrec put_schema_input = {
  definition : schema_definition;
      [@ocaml.doc
        "Specifies the definition of the schema to be stored. The schema definition must be \
         written in Cedar schema JSON.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store in which to place the schema.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec policy_template_item = {
  name : policy_template_name option;
      [@ocaml.doc
        "The name of the policy template, if one was assigned when the policy template was created \
         or last updated.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy template was most recently updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy template was created.\n"]
  description : policy_template_description option;
      [@ocaml.doc "The description attached to the policy template.\n"]
  policy_template_id : policy_template_id;
      [@ocaml.doc "The unique identifier of the policy template.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The unique identifier of the policy store that contains the template.\n"]
}
[@@ocaml.doc
  "Contains details about a policy template\n\n\
  \ This data type is used as a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyTemplates.html}ListPolicyTemplates} \
   operation.\n\
  \ "]

type nonrec policy_templates_list = policy_template_item list [@@ocaml.doc ""]

type nonrec policy_template = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec policy_store_item = {
  description : policy_store_description option;
      [@ocaml.doc
        "Descriptive text that you can provide to help with identification of the current policy \
         store.\n"]
  last_updated_date : timestamp_format option;
      [@ocaml.doc "The date and time the policy store was most recently updated.\n"]
  created_date : timestamp_format; [@ocaml.doc "The date and time the policy was created.\n"]
  arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the policy store.\n"]
  policy_store_id : policy_store_id; [@ocaml.doc "The unique identifier of the policy store.\n"]
}
[@@ocaml.doc
  "Contains information about a policy store.\n\n\
  \ This data type is used as a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStores.html}ListPolicyStores} \
   operation.\n\
  \ "]

type nonrec policy_store_list = policy_store_item list [@@ocaml.doc ""]

type nonrec alias = string [@@ocaml.doc ""]

type nonrec alias_state = PENDING_DELETION [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_store_alias_item = {
  state : alias_state;
      [@ocaml.doc
        "The state of the policy store alias. Policy Store Aliases in the Active state can be used \
         normally. When a policy store alias is deleted, it enters the PendingDeletion state. \
         Policy Store Aliases in the PendingDeletion state cannot be used, and creating a policy \
         store alias with the same alias name will fail.\n"]
  created_at : timestamp_format;
      [@ocaml.doc "The date and time the policy store alias was created.\n"]
  alias_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the policy store alias.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store associated with the alias.\n"]
  alias_name : alias; [@ocaml.doc "The name of the policy store alias.\n"]
}
[@@ocaml.doc
  "Contains information about a policy store alias.\n\n\
  \ This data type is used as a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases} \
   operation.\n\
  \ "]

type nonrec policy_store_alias_list = policy_store_alias_item list [@@ocaml.doc ""]

type nonrec policy_store_alias_filter = {
  policy_store_id : policy_store_id option;
      [@ocaml.doc
        "The ID of the policy store to filter by. Only policy store aliases associated with this \
         policy store are returned.\n"]
}
[@@ocaml.doc "Contains filters for the [ListPolicyStoreAliases] operation.\n"]

type nonrec policy_store_alias = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec policy_store = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec policy_definition_item =
  | TemplateLinked of template_linked_policy_definition_item
      [@ocaml.doc
        "Information about a template-linked policy that was created by instantiating a policy \
         template.\n"]
  | Static of static_policy_definition_item
      [@ocaml.doc "Information about a static policy that wasn't created with a policy template.\n"]
[@@ocaml.doc
  "A structure that describes a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyDefinintion.html}PolicyDefinintion}. \
   It will always have either an [StaticPolicy] or a [TemplateLinkedPolicy] element.\n\n\
  \ This data type is used as a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html}CreatePolicy} \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html}ListPolicies} \
   operations. \n\
  \ "]

type nonrec policy_item = {
  name : policy_name option;
      [@ocaml.doc
        "The name of the policy, if one was assigned when the policy was created or last updated.\n"]
  effect_ : policy_effect option;
      [@ocaml.doc
        "The effect of the decision that a policy returns to an authorization request. For \
         example, [\"effect\": \"Permit\"].\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time the policy was most recently updated.\n"]
  created_date : timestamp_format; [@ocaml.doc "The date and time the policy was created.\n"]
  definition : policy_definition_item;
      [@ocaml.doc "The policy definition of an item in the list of policies returned.\n"]
  actions : action_identifier_list option;
      [@ocaml.doc
        "The action that a policy permits or forbids. For example, [{\"actions\": \
         \\[{\"actionId\": \"ViewPhoto\", \"actionType\": \"PhotoFlash::Action\"}, {\"entityID\": \
         \"SharePhoto\", \"entityType\": \"PhotoFlash::Action\"}\\]}].\n"]
  resource : entity_identifier option; [@ocaml.doc "The resource associated with the policy.\n"]
  principal : entity_identifier option; [@ocaml.doc "The principal associated with the policy.\n"]
  policy_type : policy_type;
      [@ocaml.doc
        "The type of the policy. This is one of the following values:\n\n\
        \ {ul\n\
        \       {-   [STATIC] \n\
        \           \n\
        \            }\n\
        \       {-   [TEMPLATE_LINKED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  policy_id : policy_id; [@ocaml.doc "The identifier of the policy you want information about.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "The identifier of the policy store where the policy you want information about is stored.\n"]
}
[@@ocaml.doc
  "Contains information about a policy.\n\n\
  \ This data type is used as a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html}ListPolicies} \
   operation.\n\
  \ "]

type nonrec policy_list = policy_item list [@@ocaml.doc ""]

type nonrec entity_reference =
  | Identifier of entity_identifier
      [@ocaml.doc
        "The identifier of the entity. It can consist of either an EntityType and EntityId, a \
         principal, or a resource.\n"]
  | Unspecified of Smaws_Lib.Smithy_api.Types.boolean_
      [@ocaml.doc
        "Used to indicate that a principal or resource is not specified. This can be used to \
         search for policies that are not associated with a specific principal or resource.\n"]
[@@ocaml.doc
  "Contains information about a principal or resource that can be referenced in a Cedar policy.\n\n\
  \ This data type is used as part of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_PolicyFilter.html}PolicyFilter} \
   structure that is used as a request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html}ListPolicies} \
   operation..\n\
  \ "]

type nonrec policy_filter = {
  policy_template_id : policy_template_id option;
      [@ocaml.doc
        "Filters the output to only template-linked policies that were instantiated from the \
         specified policy template.\n"]
  policy_type : policy_type option;
      [@ocaml.doc "Filters the output to only policies of the specified type.\n"]
  resource : entity_reference option;
      [@ocaml.doc "Filters the output to only policies that reference the specified resource.\n"]
  principal : entity_reference option;
      [@ocaml.doc "Filters the output to only policies that reference the specified principal.\n"]
}
[@@ocaml.doc
  "Contains information about a filter to refine policies returned in a query.\n\n\
  \ This data type is used as a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicies.html}ListPolicies} \
   operation.\n\
  \ "]

type nonrec policy_definition_detail =
  | TemplateLinked of template_linked_policy_definition_detail
      [@ocaml.doc
        "Information about a template-linked policy that was created by instantiating a policy \
         template.\n"]
  | Static of static_policy_definition_detail
      [@ocaml.doc "Information about a static policy that wasn't created with a policy template.\n"]
[@@ocaml.doc
  "A structure that describes a policy definition. It must always have either an [static] or a \
   [templateLinked] element.\n\n\
  \ This data type is used as a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetPolicy.html}GetPolicy} \
   operation.\n\
  \ "]

type nonrec policy_definition =
  | TemplateLinked of template_linked_policy_definition
      [@ocaml.doc
        "A structure that describes a policy that was instantiated from a template. The template \
         can specify placeholders for [principal] and [resource]. When you use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html}CreatePolicy} \
         to create a policy from a template, you specify the exact principal and resource to use \
         for the instantiated policy.\n"]
  | Static of static_policy_definition
      [@ocaml.doc
        "A structure that describes a static policy. An static policy doesn't use a template or \
         allow placeholders for entities.\n"]
[@@ocaml.doc
  "A structure that contains the details for a Cedar policy definition. It includes the policy \
   type, a description, and a policy body. This is a top level data type used to create a policy.\n\n\
  \ This data type is used as a request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicy.html}CreatePolicy} \
   operation. This structure must always have either an [static] or a [templateLinked] element.\n\
  \ "]

type nonrec policy = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec parent_list = entity_identifier list [@@ocaml.doc ""]

type nonrec open_id_issuer = COGNITO [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec open_id_connect_access_token_configuration_item = {
  audiences : audiences option;
      [@ocaml.doc
        "The access token [aud] claim values that you want to accept in your policy store. For \
         example, [https://myapp.example.com, https://myapp2.example.com].\n"]
  principal_id_claim : claim option;
      [@ocaml.doc
        "The claim that determines the principal in OIDC access tokens. For example, [sub].\n"]
}
[@@ocaml.doc
  "The configuration of an OpenID Connect (OIDC) identity source for handling access token claims. \
   Contains the claim that you want to identify as the principal in an authorization request, and \
   the values of the [aud] claim, or audiences, that you want to accept.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectTokenSelectionItem.html}OpenIdConnectTokenSelectionItem} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources}.\n\
  \ "]

type nonrec open_id_connect_identity_token_configuration_item = {
  client_ids : client_ids option;
      [@ocaml.doc
        "The ID token audience, or client ID, claim values that you want to accept in your policy \
         store from an OIDC identity provider. For example, [1example23456789, 2example10111213].\n"]
  principal_id_claim : claim option;
      [@ocaml.doc
        "The claim that determines the principal in OIDC access tokens. For example, [sub].\n"]
}
[@@ocaml.doc
  "The configuration of an OpenID Connect (OIDC) identity source for handling identity (ID) token \
   claims. Contains the claim that you want to identify as the principal in an authorization \
   request, and the values of the [aud] claim, or audiences, that you want to accept.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectTokenSelectionItem.html}OpenIdConnectTokenSelectionItem} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources}.\n\
  \ "]

type nonrec open_id_connect_token_selection_item =
  | IdentityTokenOnly of open_id_connect_identity_token_configuration_item
      [@ocaml.doc
        "The OIDC configuration for processing identity (ID) tokens. Contains allowed client ID \
         claims, for example [1example23456789], and the claim that you want to map to the \
         principal, for example [sub].\n"]
  | AccessTokenOnly of open_id_connect_access_token_configuration_item
      [@ocaml.doc
        "The OIDC configuration for processing access tokens. Contains allowed audience claims, \
         for example [https://auth.example.com], and the claim that you want to map to the \
         principal, for example [sub].\n"]
[@@ocaml.doc
  "The token type that you want to process from your OIDC identity provider. Your policy store can \
   process either identity (ID) or access tokens from a given OIDC identity source.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectConfigurationItem.html}OpenIdConnectConfigurationItem} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources}.\n\
  \ "]

type nonrec open_id_connect_access_token_configuration_detail = {
  audiences : audiences option;
      [@ocaml.doc
        "The access token [aud] claim values that you want to accept in your policy store. For \
         example, [https://myapp.example.com, https://myapp2.example.com].\n"]
  principal_id_claim : claim option;
      [@ocaml.doc
        "The claim that determines the principal in OIDC access tokens. For example, [sub].\n"]
}
[@@ocaml.doc
  "The configuration of an OpenID Connect (OIDC) identity source for handling access token claims. \
   Contains the claim that you want to identify as the principal in an authorization request, and \
   the values of the [aud] claim, or audiences, that you want to accept.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectTokenSelectionDetail.html}OpenIdConnectTokenSelectionDetail} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_identity_token_configuration_detail = {
  client_ids : client_ids option;
      [@ocaml.doc
        "The ID token audience, or client ID, claim values that you want to accept in your policy \
         store from an OIDC identity provider. For example, [1example23456789, 2example10111213].\n"]
  principal_id_claim : claim option;
      [@ocaml.doc
        "The claim that determines the principal in OIDC access tokens. For example, [sub].\n"]
}
[@@ocaml.doc
  "The configuration of an OpenID Connect (OIDC) identity source for handling identity (ID) token \
   claims. Contains the claim that you want to identify as the principal in an authorization \
   request, and the values of the [aud] claim, or audiences, that you want to accept.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectTokenSelectionDetail.html}OpenIdConnectTokenSelectionDetail} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_token_selection_detail =
  | IdentityTokenOnly of open_id_connect_identity_token_configuration_detail
      [@ocaml.doc
        "The OIDC configuration for processing identity (ID) tokens. Contains allowed client ID \
         claims, for example [1example23456789], and the claim that you want to map to the \
         principal, for example [sub].\n"]
  | AccessTokenOnly of open_id_connect_access_token_configuration_detail
      [@ocaml.doc
        "The OIDC configuration for processing access tokens. Contains allowed audience claims, \
         for example [https://auth.example.com], and the claim that you want to map to the \
         principal, for example [sub].\n"]
[@@ocaml.doc
  "The token type that you want to process from your OIDC identity provider. Your policy store can \
   process either identity (ID) or access tokens from a given OIDC identity source.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectConfigurationDetail.html}OpenIdConnectConfigurationDetail} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_access_token_configuration = {
  audiences : audiences option;
      [@ocaml.doc
        "The access token [aud] claim values that you want to accept in your policy store. For \
         example, [https://myapp.example.com, https://myapp2.example.com].\n"]
  principal_id_claim : claim option;
      [@ocaml.doc
        "The claim that determines the principal in OIDC access tokens. For example, [sub].\n"]
}
[@@ocaml.doc
  "The configuration of an OpenID Connect (OIDC) identity source for handling access token claims. \
   Contains the claim that you want to identify as the principal in an authorization request, and \
   the values of the [aud] claim, or audiences, that you want to accept.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectTokenSelection.html}OpenIdConnectTokenSelection} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html}CreateIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_identity_token_configuration = {
  client_ids : client_ids option;
      [@ocaml.doc
        "The ID token audience, or client ID, claim values that you want to accept in your policy \
         store from an OIDC identity provider. For example, [1example23456789, 2example10111213].\n"]
  principal_id_claim : claim option;
      [@ocaml.doc
        "The claim that determines the principal in OIDC access tokens. For example, [sub].\n"]
}
[@@ocaml.doc
  "The configuration of an OpenID Connect (OIDC) identity source for handling identity (ID) token \
   claims. Contains the claim that you want to identify as the principal in an authorization \
   request, and the values of the [aud] claim, or audiences, that you want to accept.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectTokenSelection.html}OpenIdConnectTokenSelection} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html}CreateIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_token_selection =
  | IdentityTokenOnly of open_id_connect_identity_token_configuration
      [@ocaml.doc
        "The OIDC configuration for processing identity (ID) tokens. Contains allowed client ID \
         claims, for example [1example23456789], and the claim that you want to map to the \
         principal, for example [sub].\n"]
  | AccessTokenOnly of open_id_connect_access_token_configuration
      [@ocaml.doc
        "The OIDC configuration for processing access tokens. Contains allowed audience claims, \
         for example [https://auth.example.com], and the claim that you want to map to the \
         principal, for example [sub].\n"]
[@@ocaml.doc
  "The token type that you want to process from your OIDC identity provider. Your policy store can \
   process either identity (ID) or access tokens from a given OIDC identity source.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectConfiguration.html}OpenIdConnectConfiguration} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html}CreateIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_group_configuration_item = {
  group_entity_type : group_entity_type;
      [@ocaml.doc
        "The policy store entity type that you want to map your users' group claim to. For \
         example, [MyCorp::UserGroup]. A group entity type is an entity that can have a user \
         entity type as a member.\n"]
  group_claim : claim;
      [@ocaml.doc
        "The token claim that you want Verified Permissions to interpret as group membership. For \
         example, [groups].\n"]
}
[@@ocaml.doc
  "The claim in OIDC identity provider tokens that indicates a user's group membership, and the \
   entity type that you want to map it to. For example, this object can map the contents of a \
   [groups] claim to [MyCorp::UserGroup].\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectConfigurationItem.html}OpenIdConnectConfigurationItem} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySourcea}.\n\
  \ "]

type nonrec open_id_connect_group_configuration_detail = {
  group_entity_type : group_entity_type;
      [@ocaml.doc
        "The policy store entity type that you want to map your users' group claim to. For \
         example, [MyCorp::UserGroup]. A group entity type is an entity that can have a user \
         entity type as a member.\n"]
  group_claim : claim;
      [@ocaml.doc
        "The token claim that you want Verified Permissions to interpret as group membership. For \
         example, [groups].\n"]
}
[@@ocaml.doc
  "The claim in OIDC identity provider tokens that indicates a user's group membership, and the \
   entity type that you want to map it to. For example, this object can map the contents of a \
   [groups] claim to [MyCorp::UserGroup].\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectConfigurationDetail.html}OpenIdConnectConfigurationDetail} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_group_configuration = {
  group_entity_type : group_entity_type;
      [@ocaml.doc
        "The policy store entity type that you want to map your users' group claim to. For \
         example, [MyCorp::UserGroup]. A group entity type is an entity that can have a user \
         entity type as a member.\n"]
  group_claim : claim;
      [@ocaml.doc
        "The token claim that you want Verified Permissions to interpret as group membership. For \
         example, [groups].\n"]
}
[@@ocaml.doc
  "The claim in OIDC identity provider tokens that indicates a user's group membership, and the \
   entity type that you want to map it to. For example, this object can map the contents of a \
   [groups] claim to [MyCorp::UserGroup].\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_OpenIdConnectConfiguration.html}OpenIdConnectConfiguration} \
   structure, which is a parameter of \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html}CreateIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_configuration_item = {
  token_selection : open_id_connect_token_selection_item;
      [@ocaml.doc
        "The token type that you want to process from your OIDC identity provider. Your policy \
         store can process either identity (ID) or access tokens from a given OIDC identity source.\n"]
  group_configuration : open_id_connect_group_configuration_item option;
      [@ocaml.doc
        "The claim in OIDC identity provider tokens that indicates a user's group membership, and \
         the entity type that you want to map it to. For example, this object can map the contents \
         of a [groups] claim to [MyCorp::UserGroup].\n"]
  entity_id_prefix : entity_id_prefix option;
      [@ocaml.doc
        "A descriptive string that you want to prefix to user entities from your OIDC identity \
         provider. For example, if you set an [entityIdPrefix] of [MyOIDCProvider], you can \
         reference principals in your policies in the format [MyCorp::User::MyOIDCProvider|Carlos].\n"]
  issuer : issuer;
      [@ocaml.doc
        "The issuer URL of an OIDC identity provider. This URL must have an OIDC discovery \
         endpoint at the path [.well-known/openid-configuration].\n"]
}
[@@ocaml.doc
  "Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity \
   source, that Verified Permissions can use to generate entities from authenticated identities. \
   It specifies the issuer URL, token type that you want to use, and policy store entity details.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationDetail.html}ConfigurationItem} \
   structure, which is a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources}.\n\
  \ "]

type nonrec open_id_connect_configuration_detail = {
  token_selection : open_id_connect_token_selection_detail;
      [@ocaml.doc
        "The token type that you want to process from your OIDC identity provider. Your policy \
         store can process either identity (ID) or access tokens from a given OIDC identity source.\n"]
  group_configuration : open_id_connect_group_configuration_detail option;
      [@ocaml.doc
        "The claim in OIDC identity provider tokens that indicates a user's group membership, and \
         the entity type that you want to map it to. For example, this object can map the contents \
         of a [groups] claim to [MyCorp::UserGroup].\n"]
  entity_id_prefix : entity_id_prefix option;
      [@ocaml.doc
        "A descriptive string that you want to prefix to user entities from your OIDC identity \
         provider. For example, if you set an [entityIdPrefix] of [MyOIDCProvider], you can \
         reference principals in your policies in the format [MyCorp::User::MyOIDCProvider|Carlos].\n"]
  issuer : issuer;
      [@ocaml.doc
        "The issuer URL of an OIDC identity provider. This URL must have an OIDC discovery \
         endpoint at the path [.well-known/openid-configuration].\n"]
}
[@@ocaml.doc
  "Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity \
   source, that Verified Permissions can use to generate entities from authenticated identities. \
   It specifies the issuer URL, token type that you want to use, and policy store entity details.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationDetail.html}ConfigurationDetail} \
   structure, which is a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource}.\n\
  \ "]

type nonrec open_id_connect_configuration = {
  token_selection : open_id_connect_token_selection;
      [@ocaml.doc
        "The token type that you want to process from your OIDC identity provider. Your policy \
         store can process either identity (ID) or access tokens from a given OIDC identity source.\n"]
  group_configuration : open_id_connect_group_configuration option;
      [@ocaml.doc
        "The claim in OIDC identity provider tokens that indicates a user's group membership, and \
         the entity type that you want to map it to. For example, this object can map the contents \
         of a [groups] claim to [MyCorp::UserGroup].\n"]
  entity_id_prefix : entity_id_prefix option;
      [@ocaml.doc
        "A descriptive string that you want to prefix to user entities from your OIDC identity \
         provider. For example, if you set an [entityIdPrefix] of [MyOIDCProvider], you can \
         reference principals in your policies in the format [MyCorp::User::MyOIDCProvider|Carlos].\n"]
  issuer : issuer;
      [@ocaml.doc
        "The issuer URL of an OIDC identity provider. This URL must have an OIDC discovery \
         endpoint at the path [.well-known/openid-configuration].\n"]
}
[@@ocaml.doc
  "Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity \
   source, that Verified Permissions can use to generate entities from authenticated identities. \
   It specifies the issuer URL, token type that you want to use, and policy store entity details.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_Configuration.html}Configuration} \
   structure, which is a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html}CreateIdentitySource}.\n\
  \ "]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_policy_templates_output = {
  policy_templates : policy_templates_list;
      [@ocaml.doc "The list of the policy templates in the specified policy store.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_policy_templates_input = {
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n\n\
        \ If you do not specify this parameter, the operation defaults to 10 policy templates per \
         response. You can specify a maximum of 50 policy templates per response.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the policy templates you want to list.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec list_policy_stores_output = {
  policy_stores : policy_store_list; [@ocaml.doc "The list of policy stores in the account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_policy_stores_input = {
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n\n\
        \ If you do not specify this parameter, the operation defaults to 10 policy stores per \
         response. You can specify a maximum of 50 policy stores per response.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_policy_store_aliases_output = {
  policy_store_aliases : policy_store_alias_list;
      [@ocaml.doc "The list of policy store aliases in the account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_policy_store_aliases_input = {
  filter : policy_store_alias_filter option;
      [@ocaml.doc
        "Specifies a filter to narrow the results. You can filter by [policyStoreId] to list only \
         the policy store aliases associated with a specific policy store.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n\n\
        \ If you do not specify this parameter, the operation defaults to 5 policy store aliases \
         per response. You can specify a maximum of 50 policy store aliases per response.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_policies_output = {
  policies : policy_list;
      [@ocaml.doc "Lists all policies that are available in the specified policy store.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_policies_input = {
  filter : policy_filter option;
      [@ocaml.doc
        "Specifies a filter that limits the response to only policies that match the specified \
         criteria. For example, you list only the policies that reference a specified principal.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n\n\
        \ If you do not specify this parameter, the operation defaults to 10 policies per \
         response. You can specify a maximum of 50 policies per response.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store you want to list policies from.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec discovery_url = string [@@ocaml.doc ""]

type nonrec identity_source_item_details = {
  open_id_issuer : open_id_issuer option;
      [@ocaml.doc
        "A string that identifies the type of OIDC service represented by this identity source. \n\n\
        \ At this time, the only valid value is [cognito].\n\
        \ "]
  discovery_url : discovery_url option;
      [@ocaml.doc
        "The well-known URL that points to this user pool's OIDC discovery endpoint. This is a URL \
         string in the following format. This URL replaces the placeholders for both the Amazon \
         Web Services Region and the user pool identifier with those appropriate for this user \
         pool.\n\n\
        \  \n\
        \ {[\n\
        \ https://cognito-idp.{i <region>}.amazonaws.com/{i \
         <user-pool-id>}/.well-known/openid-configuration\n\
        \ ]}\n\
        \  \n\
        \ "]
  user_pool_arn : user_pool_arn option;
      [@ocaml.doc
        "The Amazon Cognito user pool whose identities are accessible to this Verified Permissions \
         policy store.\n"]
  client_ids : client_ids option;
      [@ocaml.doc
        "The application client IDs associated with the specified Amazon Cognito user pool that \
         are enabled for this identity source.\n"]
}
[@@ocaml.doc
  "A structure that contains configuration of the identity source.\n\n\
  \ This data type was a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources} \
   operation. Replaced by \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationItem.html}ConfigurationItem}.\n\
  \ "]

type nonrec cognito_group_configuration_item = {
  group_entity_type : group_entity_type option;
      [@ocaml.doc
        "The name of the schema entity type that's mapped to the user pool group. Defaults to \
         [AWS::CognitoGroup].\n"]
}
[@@ocaml.doc
  "The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity \
   source.\n\n\
  \ This data type is part of an \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CognitoUserPoolConfigurationDetail.html}CognitoUserPoolConfigurationItem} \
   structure and is a response parameter to \
   {{:http://forums.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources}.\n\
  \ "]

type nonrec cognito_user_pool_configuration_item = {
  group_configuration : cognito_group_configuration_item option;
      [@ocaml.doc
        "The type of entity that a policy store maps to groups from an Amazon Cognito user pool \
         identity source.\n"]
  issuer : issuer;
      [@ocaml.doc
        "The OpenID Connect (OIDC) [issuer] ID of the Amazon Cognito user pool that contains the \
         identities to be authorized.\n\n\
        \ Example: [\"issuer\": \
         \"https://cognito-idp.us-east-1.amazonaws.com/us-east-1_1a2b3c4d5\"] \n\
        \ "]
  client_ids : client_ids;
      [@ocaml.doc
        "The unique application client IDs that are associated with the specified Amazon Cognito \
         user pool.\n\n\
        \ Example: [\"clientIds\": \\[\"&ExampleCogClientId;\"\\]] \n\
        \ "]
  user_pool_arn : user_pool_arn;
      [@ocaml.doc
        "The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of the Amazon Cognito user pool that contains the identities to be \
         authorized.\n\n\
        \ Example: [\"userPoolArn\": \
         \"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\"] \n\
        \ "]
}
[@@ocaml.doc
  "The configuration for an identity source that represents a connection to an Amazon Cognito user \
   pool used as an identity provider for Verified Permissions.\n\n\
  \ This data type is used as a field that is part of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationItem.html}ConfigurationItem} \
   structure that is part of the response to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources}.\n\
  \ \n\
  \  \
   Example:[\"CognitoUserPoolConfiguration\":{\"UserPoolArn\":\"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\",\"ClientIds\": \
   \\[\"a1b2c3d4e5f6g7h8i9j0kalbmc\"\\],\"groupConfiguration\": {\"groupEntityType\": \
   \"MyCorp::Group\"}}] \n\
  \  "]

type nonrec configuration_item =
  | OpenIdConnectConfiguration of open_id_connect_configuration_item
      [@ocaml.doc
        "Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity \
         source, that Verified Permissions can use to generate entities from authenticated \
         identities. It specifies the issuer URL, token type that you want to use, and policy \
         store entity details.\n\n\
        \ \
         Example:[\"configuration\":{\"openIdConnectConfiguration\":{\"issuer\":\"https://auth.example.com\",\"tokenSelection\":{\"accessTokenOnly\":{\"audiences\":\\[\"https://myapp.example.com\",\"https://myapp2.example.com\"\\],\"principalIdClaim\":\"sub\"}},\"entityIdPrefix\":\"MyOIDCProvider\",\"groupConfiguration\":{\"groupClaim\":\"groups\",\"groupEntityType\":\"MyCorp::UserGroup\"}}}] \n\
        \ "]
  | CognitoUserPoolConfiguration of cognito_user_pool_configuration_item
      [@ocaml.doc
        "Contains configuration details of a Amazon Cognito user pool that Verified Permissions \
         can use as a source of authenticated identities as entities. It specifies the \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of a Amazon Cognito user pool, the policy store entity that you want \
         to assign to user groups, and one or more application client IDs.\n\n\
        \ Example: \
         [\"configuration\":{\"cognitoUserPoolConfiguration\":{\"userPoolArn\":\"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\",\"clientIds\": \
         \\[\"a1b2c3d4e5f6g7h8i9j0kalbmc\"\\],\"groupConfiguration\": {\"groupEntityType\": \
         \"MyCorp::Group\"}}}] \n\
        \ "]
[@@ocaml.doc
  "Contains configuration information about an identity source.\n\n\
  \ This data type is a response parameter to the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources} \
   operation.\n\
  \ "]

type nonrec identity_source_item = {
  configuration : configuration_item option;
      [@ocaml.doc "Contains configuration information about an identity source.\n"]
  principal_entity_type : principal_entity_type;
      [@ocaml.doc
        "The Cedar entity type of the principals returned from the IdP associated with this \
         identity source.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The identifier of the policy store that contains the identity source.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time the identity source was most recently updated.\n"]
  identity_source_id : identity_source_id;
      [@ocaml.doc "The unique identifier of the identity source.\n"]
  details : identity_source_item_details option;
      [@ocaml.doc
        "A structure that contains the details of the associated identity provider (IdP).\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time the identity source was originally created.\n"]
}
[@@ocaml.doc
  "A structure that defines an identity source.\n\n\
  \ This data type is a response parameter to the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentitySources.html}ListIdentitySources} \
   operation.\n\
  \ "]

type nonrec identity_sources = identity_source_item list [@@ocaml.doc ""]

type nonrec list_identity_sources_output = {
  identity_sources : identity_sources;
      [@ocaml.doc "The list of identity sources stored in the specified policy store.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_identity_sources_max_results = int [@@ocaml.doc ""]

type nonrec identity_source_filter = {
  principal_entity_type : principal_entity_type option;
      [@ocaml.doc
        "The Cedar entity type of the principals returned by the identity provider (IdP) \
         associated with this identity source.\n"]
}
[@@ocaml.doc
  "A structure that defines characteristics of an identity source that you can use to filter.\n\n\
  \ This data type is a request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListIdentityStores.html}ListIdentityStores} \
   operation.\n\
  \ "]

type nonrec identity_source_filters = identity_source_filter list [@@ocaml.doc ""]

type nonrec list_identity_sources_input = {
  filters : identity_source_filters option;
      [@ocaml.doc
        "Specifies characteristics of an identity source that you can use to limit the output to \
         matching identity sources.\n"]
  max_results : list_identity_sources_max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n\n\
        \ If you do not specify this parameter, the operation defaults to 10 identity sources per \
         response. You can specify a maximum of 50 identity sources per response.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the identity sources that you want to \
         list.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec kms_key = string [@@ocaml.doc ""]

type nonrec encryption_context_value = string [@@ocaml.doc ""]

type nonrec encryption_context_key = string [@@ocaml.doc ""]

type nonrec encryption_context = (encryption_context_key * encryption_context_value) list
[@@ocaml.doc ""]

type nonrec kms_encryption_state = {
  encryption_context : encryption_context;
      [@ocaml.doc "User-defined, additional context added to encryption processes. \n"]
  key : kms_key;
      [@ocaml.doc
        "The customer-managed KMS key \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} being used for encryption processes. \n"]
}
[@@ocaml.doc
  "A structure that contains the KMS encryption configuration for the policy store. The encryption \
   state shows what customer-managed KMS key is being used to encrypt all resources within the \
   policy store, and any user-defined context key-value pairs added during encryption processes.\n\n\
  \ This data type is used as a field that is part of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_EncryptionState.html}EncryptionState} \
   type.\n\
  \ "]

type nonrec kms_encryption_settings = {
  encryption_context : encryption_context option;
      [@ocaml.doc "User-defined, additional context to be added to encryption processes. \n"]
  key : kms_key;
      [@ocaml.doc
        "The customer-managed KMS key \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)}, alias or ID to be used for encryption processes. \n\n\
        \ Users can provide the full KMS key ARN, a KMS key alias, or a KMS key ID, but it will be \
         mapped to the full KMS key ARN after policy store creation, and referenced when \
         encrypting child resources. \n\
        \ "]
}
[@@ocaml.doc
  "A structure that contains the KMS encryption configuration for the policy store. The encryption \
   settings determine what customer-managed KMS key will be used to encrypt all resources within \
   the policy store, and any user-defined context key-value pairs to append during encryption \
   processes.\n\n\
  \ This data type is used as a field that is part of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_EncryptionSettings.html}EncryptionSettings} \
   type.\n\
  \ "]

type nonrec decision = DENY [@ocaml.doc ""] | ALLOW [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec determining_policy_item = {
  policy_id : policy_id;
      [@ocaml.doc
        "The Id of a policy that determined to an authorization decision.\n\n\
        \ Example: [\"policyId\":\"SPEXAMPLEabcdefg111111\"] \n\
        \ "]
}
[@@ocaml.doc
  "Contains information about one of the policies that determined an authorization decision.\n\n\
  \ This data type is used as an element in a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html}IsAuthorized}, \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html}BatchIsAuthorized}, \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken} \
   operations.\n\
  \ \n\
  \  Example: [\"determiningPolicies\":\\[{\"policyId\":\"SPEXAMPLEabcdefg111111\"}\\]] \n\
  \  "]

type nonrec determining_policy_list = determining_policy_item list [@@ocaml.doc ""]

type nonrec evaluation_error_item = {
  error_description : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The error description.\n"]
}
[@@ocaml.doc
  "Contains a description of an evaluation error.\n\n\
  \ This data type is a response parameter of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html}IsAuthorized}, \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html}BatchIsAuthorized}, \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken} \
   operations.\n\
  \ "]

type nonrec evaluation_error_list = evaluation_error_item list [@@ocaml.doc ""]

type nonrec is_authorized_with_token_output = {
  principal : entity_identifier option;
      [@ocaml.doc "The identifier of the principal in the ID or access token.\n"]
  errors : evaluation_error_list;
      [@ocaml.doc
        "Errors that occurred while making an authorization decision. For example, a policy \
         references an entity or entity attribute that does not exist in the slice.\n"]
  determining_policies : determining_policy_list;
      [@ocaml.doc
        "The list of determining policies used to make the authorization decision. For example, if \
         there are multiple matching policies, where at least one is a forbid policy, then because \
         forbid always overrides permit the forbid policies are the determining policies. If all \
         matching policies are permit policies, then those policies are the determining policies. \
         When no policies match and the response is the default DENY, there are no determining \
         policies.\n"]
  decision : decision;
      [@ocaml.doc
        "An authorization decision that indicates if the authorization request should be allowed \
         or denied.\n"]
}
[@@ocaml.doc ""]

type nonrec context_map = (Smaws_Lib.Smithy_api.Types.string_ * attribute_value) list
[@@ocaml.doc ""]

type nonrec cedar_json = string [@@ocaml.doc ""]

type nonrec context_definition =
  | CedarJson of cedar_json
      [@ocaml.doc
        "A Cedar JSON string representation of the context needed to successfully evaluate an \
         authorization request.\n\n\
        \ Example: [{\"cedarJson\":\"{\\\"<KeyName1>\\\": true, \\\"<KeyName2>\\\": 1234}\" }] \n\
        \ "]
  | ContextMap of context_map
      [@ocaml.doc
        "An list of attributes that are needed to successfully evaluate an authorization request. \
         Each attribute in this array must include a map of a data type and its value.\n\n\
        \ Example: \
         [\"contextMap\":{\"<KeyName1>\":{\"boolean\":true},\"<KeyName2>\":{\"long\":1234}}] \n\
        \ "]
[@@ocaml.doc
  "Contains additional details about the context of the request. Verified Permissions evaluates \
   this information in an authorization request as part of the [when] and [unless] clauses in a \
   policy.\n\n\
  \ This data type is used as a request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html}IsAuthorized}, \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html}BatchIsAuthorized}, \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken} \
   operations.\n\
  \ \n\
  \  If you're passing context as part of the request, exactly one instance of [context] must be \
   passed. If you don't want to pass context, omit the [context] parameter from your request \
   rather than sending [context {}].\n\
  \  \n\
  \   Example: \
   [\"context\":{\"contextMap\":{\"<KeyName1>\":{\"boolean\":true},\"<KeyName2>\":{\"long\":1234}}}] \n\
  \   "]

type nonrec entity_attributes = (Smaws_Lib.Smithy_api.Types.string_ * attribute_value) list
[@@ocaml.doc ""]

type cedar_tag_record_attribute = (Smaws_Lib.Smithy_api.Types.string_ * cedar_tag_value) list
[@@ocaml.doc ""]

and cedar_tag_set_attribute = cedar_tag_value list [@@ocaml.doc ""]

and cedar_tag_value =
  | Duration of duration
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-duration}duration} \
         type.\n\n\
        \ Example: [{\"duration\": \"-1d12h\"}] \n\
        \ "]
  | Datetime of datetime_attribute
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-datetime}datetime} \
         type.\n\n\
        \ Example: [{\"datetime\": \"2025-11-04T11:35:00.000+0100\"}] \n\
        \ "]
  | Decimal of decimal
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-decimal}decimal} \
         type.\n\n\
        \ Example: [{\"decimal\": \"-2.0\"}] \n\
        \ "]
  | Ipaddr of ip_addr
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-ipaddr}ipaddr} \
         type.\n\n\
        \ Example: [{\"ip\": \"10.50.0.0/24\"}] \n\
        \ "]
  | Record of cedar_tag_record_attribute
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-record}Record} \
         type.\n\n\
        \ Example: [{\"record\": { \"keyName\": {} } }] \n\
        \ "]
  | Set of cedar_tag_set_attribute
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-set}Set} type.\n\n\
        \ Example: [{\"set\": \\[ { \"string\": \"abc\" } \\] }] \n\
        \ "]
  | String of string_attribute
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-string}String} \
         type.\n\n\
        \ Example: [{\"string\": \"abc\"}] \n\
        \ "]
  | Long of long_attribute
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-long}Long} type.\n\n\
        \ Example: [{\"long\": 0}] \n\
        \ "]
  | EntityIdentifier of entity_identifier
      [@ocaml.doc
        "A Cedar tag value of type \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_EntityIdentifier.html}EntityIdentifier}.\n\n\
        \ Example: [{\"entityIdentifier\": { \"entityId\": \"alice\", \"entityType\": \"User\"} }] \n\
        \ "]
  | Boolean of boolean_attribute
      [@ocaml.doc
        "A Cedar tag value of \
         {{:https://docs.cedarpolicy.com/policies/syntax-datatypes.html#datatype-bool}Boolean} \
         type.\n\n\
        \ Example: [{\"boolean\": false}] \n\
        \ "]
[@@ocaml.doc
  "The value of an entity's Cedar tag.\n\n\
  \ This data type is used as a member of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_EntityItem.html}EntityItem} \
   structure that forms the body of the [Entities] request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html}IsAuthorized}, \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorized.html}BatchIsAuthorized}, \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken}, \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorizedWithToken.html}BatchIsAuthorizedWithToken} \
   operations.\n\
  \ "]

type nonrec entity_cedar_tags = (Smaws_Lib.Smithy_api.Types.string_ * cedar_tag_value) list
[@@ocaml.doc ""]

type nonrec entity_item = {
  tags : entity_cedar_tags option; [@ocaml.doc "A list of cedar tags for the entity.\n"]
  parents : parent_list option;
      [@ocaml.doc
        "The parent entities in the hierarchy that contains the entity. A principal or resource \
         entity can be defined with at most 99 {i transitive parents} per authorization request. \n\n\
        \ A transitive parent is an entity in the hierarchy of entities including all direct \
         parents, and parents of parents. For example, a user can be a member of 91 groups if one \
         of those groups is a member of eight groups, for a total of 100: one entity, 91 entity \
         parents, and eight parents of parents. \n\
        \ "]
  attributes : entity_attributes option; [@ocaml.doc "A list of attributes for the entity.\n"]
  identifier : entity_identifier; [@ocaml.doc "The identifier of the entity.\n"]
}
[@@ocaml.doc
  "Contains information about an entity that can be referenced in a Cedar policy.\n\n\
  \ This data type is used as one of the fields in the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_EntitiesDefinition.html}EntitiesDefinition} \
   structure.\n\
  \ \n\
  \   [{ \"identifier\": { \"entityType\": \"Photo\", \"entityId\": \"VacationPhoto94.jpg\" }, \
   \"attributes\": {}, \"parents\": \\[ { \"entityType\": \"Album\", \"entityId\": \
   \"alice_folder\" } \\] }] \n\
  \  "]

type nonrec entity_list = entity_item list [@@ocaml.doc ""]

type nonrec entities_definition =
  | CedarJson of cedar_json
      [@ocaml.doc
        "A Cedar JSON string representation of the entities needed to successfully evaluate an \
         authorization request.\n\n\
        \ Example: [{\"cedarJson\": \
         \"\\[{\\\"uid\\\":{\\\"type\\\":\\\"Photo\\\",\\\"id\\\":\\\"VacationPhoto94.jpg\\\"},\\\"attrs\\\":{\\\"accessLevel\\\":\\\"public\\\"},\\\"parents\\\":\\[\\]}\\]\"}] \n\
        \ "]
  | EntityList of entity_list
      [@ocaml.doc
        "An array of entities that are needed to successfully evaluate an authorization request. \
         Each entity in this array must include an identifier for the entity, the attributes of \
         the entity, and a list of any parent entities.\n\n\
        \  If you include multiple entities with the same [identifier], only the last one is \
         processed in the request.\n\
        \  \n\
        \   "]
[@@ocaml.doc
  "Contains the list of entities to be considered during an authorization request. This includes \
   all principals, resources, and actions required to successfully evaluate the request.\n\n\
  \ This data type is used as a field in the response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorized.html}IsAuthorized} \
   and \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken} \
   operations.\n\
  \ "]

type nonrec is_authorized_with_token_input = {
  entities : entities_definition option;
      [@ocaml.doc
        "(Optional) Specifies the list of resources and their associated attributes that Verified \
         Permissions can examine when evaluating the policies. These additional entities and their \
         attributes can be referenced and checked by conditional elements in the policies in the \
         specified policy store.\n\n\
        \  You can't include principals in this parameter, only resource and action entities. This \
         parameter can't include any entities of a type that matches the user or group entity \
         types that you defined in your identity source.\n\
        \  \n\
        \   {ul\n\
        \         {-  The [IsAuthorizedWithToken] operation takes principal attributes from {b  {i \
         only} } the [identityToken] or [accessToken] passed to the operation.\n\
        \             \n\
        \              }\n\
        \         {-  For action entities, you can include only their [Identifier] and \
         [EntityType]. \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  context : context_definition option;
      [@ocaml.doc
        "Specifies additional context that can be used to make more granular authorization \
         decisions.\n"]
  resource : entity_identifier option;
      [@ocaml.doc
        "Specifies the resource for which the authorization decision is made. For example, is the \
         principal allowed to perform the action on the resource?\n"]
  action : action_identifier option;
      [@ocaml.doc
        "Specifies the requested action to be authorized. Is the specified principal authorized to \
         perform this action on the specified resource.\n"]
  access_token : token option;
      [@ocaml.doc
        "Specifies an access token for the principal to be authorized. This token is provided to \
         you by the identity provider (IdP) associated with the specified identity source. You \
         must specify either an [accessToken], an [identityToken], or both.\n\n\
        \ Must be an access token. Verified Permissions returns an error if the [token_use] claim \
         in the submitted token isn't [access].\n\
        \ "]
  identity_token : token option;
      [@ocaml.doc
        "Specifies an identity token for the principal to be authorized. This token is provided to \
         you by the identity provider (IdP) associated with the specified identity source. You \
         must specify either an [accessToken], an [identityToken], or both.\n\n\
        \ Must be an ID token. Verified Permissions returns an error if the [token_use] claim in \
         the submitted token isn't [id].\n\
        \ "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store. Policies in this policy store will be used to make \
         an authorization decision for the input.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec is_authorized_output = {
  errors : evaluation_error_list;
      [@ocaml.doc
        "Errors that occurred while making an authorization decision, for example, a policy \
         references an Entity or entity Attribute that does not exist in the slice.\n"]
  determining_policies : determining_policy_list;
      [@ocaml.doc
        "The list of determining policies used to make the authorization decision. For example, if \
         there are two matching policies, where one is a forbid and the other is a permit, then \
         the forbid policy will be the determining policy. In the case of multiple matching permit \
         policies then there would be multiple determining policies. In the case that no policies \
         match, and hence the response is DENY, there would be no determining policies.\n"]
  decision : decision;
      [@ocaml.doc
        "An authorization decision that indicates if the authorization request should be allowed \
         or denied.\n"]
}
[@@ocaml.doc ""]

type nonrec is_authorized_input = {
  entities : entities_definition option;
      [@ocaml.doc
        "(Optional) Specifies the list of resources and principals and their associated attributes \
         that Verified Permissions can examine when evaluating the policies. These additional \
         entities and their attributes can be referenced and checked by conditional elements in \
         the policies in the specified policy store.\n\n\
        \  You can include only principal and resource entities in this parameter; you can't \
         include actions. You must specify actions in the schema.\n\
        \  \n\
        \   "]
  context : context_definition option;
      [@ocaml.doc
        "Specifies additional context that can be used to make more granular authorization \
         decisions.\n"]
  resource : entity_identifier option;
      [@ocaml.doc "Specifies the resource for which the authorization decision is to be made.\n"]
  action : action_identifier option;
      [@ocaml.doc
        "Specifies the requested action to be authorized. For example, is the principal authorized \
         to perform this action on the resource?\n"]
  principal : entity_identifier option;
      [@ocaml.doc "Specifies the principal for which the authorization decision is to be made.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store. Policies in this policy store will be used to make \
         an authorization decision for the input.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec invalid_state_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The policy store can't be deleted because deletion protection is enabled. To delete this policy \
   store, disable deletion protection.\n"]

type nonrec identity_source_details = {
  open_id_issuer : open_id_issuer option;
      [@ocaml.doc
        "A string that identifies the type of OIDC service represented by this identity source. \n\n\
        \ At this time, the only valid value is [cognito].\n\
        \ "]
  discovery_url : discovery_url option;
      [@ocaml.doc
        "The well-known URL that points to this user pool's OIDC discovery endpoint. This is a URL \
         string in the following format. This URL replaces the placeholders for both the Amazon \
         Web Services Region and the user pool identifier with those appropriate for this user \
         pool.\n\n\
        \  \n\
        \ {[\n\
        \ https://cognito-idp.{i <region>}.amazonaws.com/{i \
         <user-pool-id>}/.well-known/openid-configuration\n\
        \ ]}\n\
        \  \n\
        \ "]
  user_pool_arn : user_pool_arn option;
      [@ocaml.doc
        "The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of the Amazon Cognito user pool whose identities are accessible to \
         this Verified Permissions policy store.\n"]
  client_ids : client_ids option;
      [@ocaml.doc
        "The application client IDs associated with the specified Amazon Cognito user pool that \
         are enabled for this identity source.\n"]
}
[@@ocaml.doc
  "A structure that contains configuration of the identity source.\n\n\
  \ This data type was a response parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource} \
   operation. Replaced by \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationDetail.html}ConfigurationDetail}.\n\
  \ "]

type nonrec identity_source = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec get_schema_output = {
  namespaces : namespace_list option;
      [@ocaml.doc "The namespaces of the entities referenced by this schema.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the schema was most recently updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the schema was originally created.\n"]
  schema : schema_json; [@ocaml.doc "The body of the schema, written in Cedar schema JSON.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the schema.\n"]
}
[@@ocaml.doc ""]

type nonrec get_schema_input = {
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the schema.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_policy_template_output = {
  name : policy_template_name option;
      [@ocaml.doc
        "The name of the policy template, if one was assigned when the policy template was created \
         or last updated.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy template was most recently updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy template was originally created.\n"]
  statement : policy_statement;
      [@ocaml.doc
        "The content of the body of the policy template written in the Cedar policy language.\n"]
  description : policy_template_description option;
      [@ocaml.doc "The description of the policy template.\n"]
  policy_template_id : policy_template_id; [@ocaml.doc "The ID of the policy template.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the policy template.\n"]
}
[@@ocaml.doc ""]

type nonrec get_policy_template_input = {
  policy_template_id : policy_template_id;
      [@ocaml.doc
        "Specifies the ID of the policy template that you want information about.\n\n\
        \ You can use the policy template name in place of the policy template ID. When using a \
         name, prefix it with [name/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PTEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Name: [name/example-policy-template] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the policy template that you want \
         information about.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec encryption_state =
  | Default of Smaws_Lib.Smithy_api.Types.unit_
      [@ocaml.doc
        "This is the default encryption state. The policy store is encrypted using an Amazon Web \
         Services owned key.\n"]
  | KmsEncryptionState of kms_encryption_state
      [@ocaml.doc
        "The KMS encryption settings currently configured for this policy store to encrypt data \
         with. It contains the customer-managed KMS key, and a user-defined encryption context. \n"]
[@@ocaml.doc
  "A structure that contains the encryption configuration for the policy store and child \
   resources.\n\n\
  \ This data type is used as a response parameter field for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetPolicyStore.html}GetPolicyStore} \
   operation.\n\
  \ "]

type nonrec cedar_version = CEDAR_4 [@ocaml.doc ""] | CEDAR_2 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec get_policy_store_output = {
  tags : tag_map option; [@ocaml.doc "The list of tags associated with the policy store.\n"]
  cedar_version : cedar_version option;
      [@ocaml.doc
        "The version of the Cedar language used with policies, policy templates, and schemas in \
         this policy store. For more information, see \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/userguide/cedar4-faq.html}Amazon \
         Verified Permissions upgrade to Cedar v4 FAQ}.\n"]
  encryption_state : encryption_state option;
      [@ocaml.doc "A structure that contains the encryption configuration for the policy store.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Specifies whether the policy store can be deleted. If enabled, the policy store can't be \
         deleted.\n\n\
        \ The default state is [DISABLED].\n\
        \ "]
  description : policy_store_description option;
      [@ocaml.doc
        "Descriptive text that you can provide to help with identification of the current policy \
         store.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy store was last updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy store was originally created.\n"]
  validation_settings : validation_settings;
      [@ocaml.doc "The current validation settings for the policy store.\n"]
  arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the policy store.\n"]
  policy_store_id : policy_store_id; [@ocaml.doc "The ID of the policy store;\n"]
}
[@@ocaml.doc ""]

type nonrec get_policy_store_input = {
  tags : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to return the tags that are attached to the policy store. If this \
         parameter is included in the API call, the tags are returned, otherwise they are not \
         returned.\n\n\
        \  If this parameter is included in the API call but there are no tags attached to the \
         policy store, the [tags] response parameter is omitted from the response.\n\
        \  \n\
        \   "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the policy store that you want information about.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_policy_store_alias_output = {
  state : alias_state;
      [@ocaml.doc
        "The state of the policy store alias. Policy Store Aliases in the Active state can be used \
         normally. When a policy store alias is deleted, it enters the PendingDeletion state. \
         Policy Store Aliases in the PendingDeletion cannot be used, and creating a policy store \
         alias with the same alias name will fail.\n"]
  created_at : timestamp_format;
      [@ocaml.doc "The date and time the policy store alias was created.\n"]
  alias_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the policy store alias.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store associated with the alias.\n"]
  alias_name : alias; [@ocaml.doc "The name of the policy store alias.\n"]
}
[@@ocaml.doc ""]

type nonrec get_policy_store_alias_input = {
  alias_name : alias;
      [@ocaml.doc
        "Specifies the name of the policy store alias that you want information about.\n\n\
        \  The alias name must always be prefixed with [policy-store-alias/].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_policy_output = {
  name : policy_name option;
      [@ocaml.doc
        "The name of the policy, if one was assigned when the policy was created or last updated.\n"]
  effect_ : policy_effect option;
      [@ocaml.doc
        "The effect of the decision that a policy returns to an authorization request. For \
         example, [\"effect\": \"Permit\"].\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy was last updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the policy was originally created.\n"]
  definition : policy_definition_detail; [@ocaml.doc "The definition of the requested policy.\n"]
  actions : action_identifier_list option;
      [@ocaml.doc
        "The action that a policy permits or forbids. For example, [{\"actions\": \
         \\[{\"actionId\": \"ViewPhoto\", \"actionType\": \"PhotoFlash::Action\"}, {\"entityID\": \
         \"SharePhoto\", \"entityType\": \"PhotoFlash::Action\"}\\]}].\n"]
  resource : entity_identifier option;
      [@ocaml.doc
        "The resource specified in the policy's scope. This element isn't included in the response \
         when [Resource] isn't present in the policy content.\n"]
  principal : entity_identifier option;
      [@ocaml.doc
        "The principal specified in the policy's scope. This element isn't included in the \
         response when [Principal] isn't present in the policy content.\n"]
  policy_type : policy_type; [@ocaml.doc "The type of the policy.\n"]
  policy_id : policy_id;
      [@ocaml.doc "The unique ID of the policy that you want information about.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "The ID of the policy store that contains the policy that you want information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_policy_input = {
  policy_id : policy_id;
      [@ocaml.doc
        "Specifies the ID of the policy you want information about.\n\n\
        \ You can use the policy name in place of the policy ID. When using a name, prefix it with \
         [name/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [SPEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Name: [name/example-policy] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the policy that you want information \
         about.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec cognito_group_configuration_detail = {
  group_entity_type : group_entity_type option;
      [@ocaml.doc
        "The name of the schema entity type that's mapped to the user pool group. Defaults to \
         [AWS::CognitoGroup].\n"]
}
[@@ocaml.doc
  "The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity \
   source.\n\n\
  \ This data type is part of an \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CognitoUserPoolConfigurationItem.html}CognitoUserPoolConfigurationDetail} \
   structure and is a response parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource}.\n\
  \ "]

type nonrec cognito_user_pool_configuration_detail = {
  group_configuration : cognito_group_configuration_detail option;
      [@ocaml.doc
        "The type of entity that a policy store maps to groups from an Amazon Cognito user pool \
         identity source.\n"]
  issuer : issuer;
      [@ocaml.doc
        "The OpenID Connect (OIDC) [issuer] ID of the Amazon Cognito user pool that contains the \
         identities to be authorized.\n\n\
        \ Example: [\"issuer\": \
         \"https://cognito-idp.us-east-1.amazonaws.com/us-east-1_1a2b3c4d5\"] \n\
        \ "]
  client_ids : client_ids;
      [@ocaml.doc
        "The unique application client IDs that are associated with the specified Amazon Cognito \
         user pool.\n\n\
        \ Example: [\"clientIds\": \\[\"&ExampleCogClientId;\"\\]] \n\
        \ "]
  user_pool_arn : user_pool_arn;
      [@ocaml.doc
        "The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of the Amazon Cognito user pool that contains the identities to be \
         authorized.\n\n\
        \ Example: [\"userPoolArn\": \
         \"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\"] \n\
        \ "]
}
[@@ocaml.doc
  "The configuration for an identity source that represents a connection to an Amazon Cognito user \
   pool used as an identity provider for Verified Permissions.\n\n\
  \ This data type is used as a field that is part of an \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ConfigurationDetail.html}ConfigurationDetail} \
   structure that is part of the response to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource}.\n\
  \ \n\
  \  \
   Example:[\"CognitoUserPoolConfiguration\":{\"UserPoolArn\":\"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\",\"ClientIds\": \
   \\[\"a1b2c3d4e5f6g7h8i9j0kalbmc\"\\],\"groupConfiguration\": {\"groupEntityType\": \
   \"MyCorp::Group\"}}] \n\
  \  "]

type nonrec configuration_detail =
  | OpenIdConnectConfiguration of open_id_connect_configuration_detail
      [@ocaml.doc
        "Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity \
         source, that Verified Permissions can use to generate entities from authenticated \
         identities. It specifies the issuer URL, token type that you want to use, and policy \
         store entity details.\n\n\
        \ \
         Example:[\"configuration\":{\"openIdConnectConfiguration\":{\"issuer\":\"https://auth.example.com\",\"tokenSelection\":{\"accessTokenOnly\":{\"audiences\":\\[\"https://myapp.example.com\",\"https://myapp2.example.com\"\\],\"principalIdClaim\":\"sub\"}},\"entityIdPrefix\":\"MyOIDCProvider\",\"groupConfiguration\":{\"groupClaim\":\"groups\",\"groupEntityType\":\"MyCorp::UserGroup\"}}}] \n\
        \ "]
  | CognitoUserPoolConfiguration of cognito_user_pool_configuration_detail
      [@ocaml.doc
        "Contains configuration details of a Amazon Cognito user pool that Verified Permissions \
         can use as a source of authenticated identities as entities. It specifies the \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of a Amazon Cognito user pool, the policy store entity that you want \
         to assign to user groups, and one or more application client IDs.\n\n\
        \ Example: \
         [\"configuration\":{\"cognitoUserPoolConfiguration\":{\"userPoolArn\":\"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\",\"clientIds\": \
         \\[\"a1b2c3d4e5f6g7h8i9j0kalbmc\"\\],\"groupConfiguration\": {\"groupEntityType\": \
         \"MyCorp::Group\"}}}] \n\
        \ "]
[@@ocaml.doc
  "Contains configuration information about an identity source.\n\n\
  \ This data type is a response parameter to the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_GetIdentitySource.html}GetIdentitySource} \
   operation.\n\
  \ "]

type nonrec get_identity_source_output = {
  configuration : configuration_detail option;
      [@ocaml.doc "Contains configuration information about an identity source.\n"]
  principal_entity_type : principal_entity_type;
      [@ocaml.doc
        "The data type of principals generated for identities authenticated by this identity source.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the identity source.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time that the identity source was most recently updated.\n"]
  identity_source_id : identity_source_id; [@ocaml.doc "The ID of the identity source.\n"]
  details : identity_source_details option;
      [@ocaml.doc "A structure that describes the configuration of the identity source.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time that the identity source was originally created.\n"]
}
[@@ocaml.doc ""]

type nonrec get_identity_source_input = {
  identity_source_id : identity_source_id;
      [@ocaml.doc "Specifies the ID of the identity source you want information about.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the identity source you want \
         information about.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec encryption_settings =
  | Default of Smaws_Lib.Smithy_api.Types.unit_
      [@ocaml.doc
        "This is the default encryption setting. The policy store uses an Amazon Web Services \
         owned key for encrypting data.\n"]
  | KmsEncryptionSettings of kms_encryption_settings
      [@ocaml.doc
        "The KMS encryption settings for this policy store to encrypt data with. It will contain \
         the customer-managed KMS key, and a user-defined encryption context. \n"]
[@@ocaml.doc
  "A structure that contains the encryption configuration for the policy store and child \
   resources. \n\n\
  \ This data type is used as a request parameter in the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreatePolicyStore.html}CreatePolicyStore} \
   operation.\n\
  \ "]

type nonrec deletion_mode = HARD_DELETE [@ocaml.doc ""] | SOFT_DELETE [@ocaml.doc ""]
[@@ocaml.doc
  "The deletion mode for a resource. The valid values are:\n\n\
  \ {ul\n\
  \       {-   {b SoftDelete} \226\128\147 The resource enters the [PendingDeletion] state. This \
   is the default behavior.\n\
  \           \n\
  \            }\n\
  \       {-   {b HardDelete} \226\128\147 The resource is immediately deleted, bypassing the \
   [PendingDeletion] state.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec delete_policy_template_output = unit [@@ocaml.doc ""]

type nonrec delete_policy_template_input = {
  policy_template_id : policy_template_id;
      [@ocaml.doc
        "Specifies the ID of the policy template that you want to delete.\n\n\
        \ You can use the policy template name in place of the policy template ID. When using a \
         name, prefix it with [name/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PTEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Name: [name/example-policy-template] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the policy template that you want to \
         delete.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_policy_store_output = unit [@@ocaml.doc ""]

type nonrec delete_policy_store_input = {
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that you want to delete.\n\n\
        \  To specify a policy store, the alias name cannot be used. Only the ID can be used.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_policy_store_alias_output = unit [@@ocaml.doc ""]

type nonrec delete_policy_store_alias_input = {
  deletion_mode : deletion_mode option;
      [@ocaml.doc
        "Specifies the deletion mode for the policy store alias. The valid values are:\n\n\
        \ {ul\n\
        \       {-   {b SoftDelete} \226\128\147 The policy store alias enters the \
         [PendingDeletion] state. This is the default behavior when no [deletionMode] is specified.\n\
        \           \n\
        \            }\n\
        \       {-   {b HardDelete} \226\128\147 The policy store alias is immediately deleted, \
         bypassing the [PendingDeletion] state.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  alias_name : alias;
      [@ocaml.doc
        "Specifies the name of the policy store alias that you want to delete.\n\n\
        \  The alias name must always be prefixed with [policy-store-alias/].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_policy_output = unit [@@ocaml.doc ""]

type nonrec delete_policy_input = {
  policy_id : policy_id;
      [@ocaml.doc
        "Specifies the ID of the policy that you want to delete.\n\n\
        \ You can use the policy name in place of the policy ID. When using a name, prefix it with \
         [name/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [SPEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Name: [name/example-policy] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the policy that you want to delete.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_identity_source_output = unit [@@ocaml.doc ""]

type nonrec delete_identity_source_input = {
  identity_source_id : identity_source_id;
      [@ocaml.doc "Specifies the ID of the identity source that you want to delete.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store that contains the identity source that you want to \
         delete.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_policy_template_output = {
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time the policy template was most recently updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time the policy template was originally created.\n"]
  policy_template_id : policy_template_id;
      [@ocaml.doc "The unique ID of the new policy template.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the policy template.\n"]
}
[@@ocaml.doc ""]

type nonrec create_policy_template_input = {
  name : policy_template_name option;
      [@ocaml.doc
        "Specifies a name for the policy template that is unique among all policy templates within \
         the policy store. You can use the name in place of the policy template ID in API \
         operations that reference the policy template. The name must be prefixed with [name/].\n\n\
        \ If you specify a name that is already associated with another policy template in the \
         policy store, you receive a [ConflictException] error.\n\
        \ "]
  statement : policy_statement;
      [@ocaml.doc
        "Specifies the content that you want to use for the new policy template, written in the \
         Cedar policy language.\n"]
  description : policy_template_description option;
      [@ocaml.doc "Specifies a description for the policy template.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "The ID of the policy store in which to create the policy template.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
  client_token : idempotency_token option;
      [@ocaml.doc
        "Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the \
         request. This lets you safely retry the request without accidentally performing the same \
         operation a second time. Passing the same value to a later call to an operation requires \
         that you also pass the same value for all other parameters. We recommend that you use a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID type of value.}.\n\n\
        \ If you don't provide this value, then Amazon Web Services generates a random one for you.\n\
        \ \n\
        \  If you retry the operation with the same [ClientToken], but with different parameters, \
         the retry fails with an [ConflictException] error.\n\
        \  \n\
        \   Verified Permissions recognizes a [ClientToken] for eight hours. After eight hours, \
         the next request with the same parameters performs the operation again regardless of the \
         value of [ClientToken].\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_policy_store_output = {
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time the policy store was last updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time the policy store was originally created.\n"]
  arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the new policy store.\n"]
  policy_store_id : policy_store_id; [@ocaml.doc "The unique ID of the new policy store.\n"]
}
[@@ocaml.doc ""]

type nonrec create_policy_store_input = {
  tags : tag_map option;
      [@ocaml.doc "The list of key-value pairs to associate with the policy store.\n"]
  encryption_settings : encryption_settings option;
      [@ocaml.doc
        "Specifies the encryption settings used to encrypt the policy store and their child \
         resources. Allows for the ability to use a customer owned KMS key for encryption of \
         data.\n\n\
        \ This is an optional field to be used when providing a customer-managed KMS key for \
         encryption.\n\
        \ "]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        "Specifies whether the policy store can be deleted. If enabled, the policy store can't be \
         deleted.\n\n\
        \ The default state is [DISABLED].\n\
        \ "]
  description : policy_store_description option;
      [@ocaml.doc
        "Descriptive text that you can provide to help with identification of the current policy \
         store.\n"]
  validation_settings : validation_settings;
      [@ocaml.doc
        "Specifies the validation setting for this policy store.\n\n\
        \ Currently, the only valid and required value is [Mode].\n\
        \ \n\
        \   We recommend that you turn on [STRICT] mode only after you define a schema. If a \
         schema doesn't exist, then [STRICT] mode causes any policy to fail validation, and \
         Verified Permissions rejects the policy. You can turn off validation by using the \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyStore}UpdatePolicyStore}. \
         Then, when you have a schema defined, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyStore}UpdatePolicyStore} \
         again to turn validation back on.\n\
        \   \n\
        \    "]
  client_token : idempotency_token option;
      [@ocaml.doc
        "Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the \
         request. This lets you safely retry the request without accidentally performing the same \
         operation a second time. Passing the same value to a later call to an operation requires \
         that you also pass the same value for all other parameters. We recommend that you use a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID type of value.}.\n\n\
        \ If you don't provide this value, then Amazon Web Services generates a random one for you.\n\
        \ \n\
        \  If you retry the operation with the same [ClientToken], but with different parameters, \
         the retry fails with an [ConflictException] error.\n\
        \  \n\
        \   Verified Permissions recognizes a [ClientToken] for eight hours. After eight hours, \
         the next request with the same parameters performs the operation again regardless of the \
         value of [ClientToken].\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_policy_store_alias_output = {
  created_at : timestamp_format;
      [@ocaml.doc "The date and time the policy store alias was created.\n"]
  alias_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the policy store alias.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store associated with the alias.\n"]
  alias_name : alias; [@ocaml.doc "The name of the policy store alias.\n"]
}
[@@ocaml.doc ""]

type nonrec create_policy_store_alias_input = {
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store to associate with the alias.\n\n\
        \  The associated policy store must be specified using its ID. The alias name cannot be \
         used.\n\
        \  \n\
        \   "]
  alias_name : alias;
      [@ocaml.doc
        "Specifies the name of the policy store alias to create. The name must be unique within \
         your Amazon Web Services account and Amazon Web Services Region.\n\n\
        \  The alias name must always be prefixed with [policy-store-alias/].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_policy_output = {
  effect_ : policy_effect option;
      [@ocaml.doc
        "The effect of the decision that a policy returns to an authorization request. For \
         example, [\"effect\": \"Permit\"].\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time the policy was last updated.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time the policy was originally created.\n"]
  actions : action_identifier_list option;
      [@ocaml.doc
        "The action that a policy permits or forbids. For example, [{\"actions\": \
         \\[{\"actionId\": \"ViewPhoto\", \"actionType\": \"PhotoFlash::Action\"}, {\"entityID\": \
         \"SharePhoto\", \"entityType\": \"PhotoFlash::Action\"}\\]}].\n"]
  resource : entity_identifier option;
      [@ocaml.doc
        "The resource specified in the new policy's scope. This response element isn't present \
         when the [resource] isn't specified in the policy content.\n"]
  principal : entity_identifier option;
      [@ocaml.doc
        "The principal specified in the new policy's scope. This response element isn't present \
         when [principal] isn't specified in the policy content.\n"]
  policy_type : policy_type; [@ocaml.doc "The policy type of the new policy.\n"]
  policy_id : policy_id; [@ocaml.doc "The unique ID of the new policy.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the new policy.\n"]
}
[@@ocaml.doc ""]

type nonrec create_policy_input = {
  name : policy_name option;
      [@ocaml.doc
        "Specifies a name for the policy that is unique among all policies within the policy \
         store. You can use the name in place of the policy ID in API operations that reference \
         the policy. The name must be prefixed with [name/].\n\n\
        \ If you specify a name that is already associated with another policy in the policy \
         store, you receive a [ConflictException] error.\n\
        \ "]
  definition : policy_definition;
      [@ocaml.doc
        "A structure that specifies the policy type and content to use for the new policy. You \
         must include either a static or a templateLinked element. The policy content must be \
         written in the Cedar policy language.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the [PolicyStoreId] of the policy store you want to store the policy in.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
  client_token : idempotency_token option;
      [@ocaml.doc
        "Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the \
         request. This lets you safely retry the request without accidentally performing the same \
         operation a second time. Passing the same value to a later call to an operation requires \
         that you also pass the same value for all other parameters. We recommend that you use a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID type of value.}.\n\n\
        \ If you don't provide this value, then Amazon Web Services generates a random one for you.\n\
        \ \n\
        \  If you retry the operation with the same [ClientToken], but with different parameters, \
         the retry fails with an [ConflictException] error.\n\
        \  \n\
        \   Verified Permissions recognizes a [ClientToken] for eight hours. After eight hours, \
         the next request with the same parameters performs the operation again regardless of the \
         value of [ClientToken].\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_identity_source_output = {
  policy_store_id : policy_store_id;
      [@ocaml.doc "The ID of the policy store that contains the identity source.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time the identity source was most recently updated.\n"]
  identity_source_id : identity_source_id;
      [@ocaml.doc "The unique ID of the new identity source.\n"]
  created_date : timestamp_format;
      [@ocaml.doc "The date and time the identity source was originally created.\n"]
}
[@@ocaml.doc ""]

type nonrec cognito_group_configuration = {
  group_entity_type : group_entity_type;
      [@ocaml.doc
        "The name of the schema entity type that's mapped to the user pool group. Defaults to \
         [AWS::CognitoGroup].\n"]
}
[@@ocaml.doc
  "The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity \
   source.\n\n\
  \ This data type is part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CognitoUserPoolConfiguration.html}CognitoUserPoolConfiguration} \
   structure and is a request parameter in \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html}CreateIdentitySource}.\n\
  \ "]

type nonrec cognito_user_pool_configuration = {
  group_configuration : cognito_group_configuration option;
      [@ocaml.doc
        "The type of entity that a policy store maps to groups from an Amazon Cognito user pool \
         identity source.\n"]
  client_ids : client_ids option;
      [@ocaml.doc
        "The unique application client IDs that are associated with the specified Amazon Cognito \
         user pool.\n\n\
        \ Example: [\"ClientIds\": \\[\"&ExampleCogClientId;\"\\]] \n\
        \ "]
  user_pool_arn : user_pool_arn;
      [@ocaml.doc
        "The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of the Amazon Cognito user pool that contains the identities to be \
         authorized.\n\n\
        \ Example: [\"UserPoolArn\": \
         \"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\"] \n\
        \ "]
}
[@@ocaml.doc
  "The configuration for an identity source that represents a connection to an Amazon Cognito user \
   pool used as an identity provider for Verified Permissions.\n\n\
  \ This data type part of a \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_Configuration.html}Configuration} \
   structure that is used as a parameter to \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html}CreateIdentitySource}.\n\
  \ \n\
  \  \
   Example:[\"CognitoUserPoolConfiguration\":{\"UserPoolArn\":\"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\",\"ClientIds\": \
   \\[\"a1b2c3d4e5f6g7h8i9j0kalbmc\"\\],\"groupConfiguration\": {\"groupEntityType\": \
   \"MyCorp::Group\"}}] \n\
  \  "]

type nonrec configuration =
  | OpenIdConnectConfiguration of open_id_connect_configuration
      [@ocaml.doc
        "Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity \
         source, that Verified Permissions can use to generate entities from authenticated \
         identities. It specifies the issuer URL, token type that you want to use, and policy \
         store entity details.\n\n\
        \ \
         Example:[\"configuration\":{\"openIdConnectConfiguration\":{\"issuer\":\"https://auth.example.com\",\"tokenSelection\":{\"accessTokenOnly\":{\"audiences\":\\[\"https://myapp.example.com\",\"https://myapp2.example.com\"\\],\"principalIdClaim\":\"sub\"}},\"entityIdPrefix\":\"MyOIDCProvider\",\"groupConfiguration\":{\"groupClaim\":\"groups\",\"groupEntityType\":\"MyCorp::UserGroup\"}}}] \n\
        \ "]
  | CognitoUserPoolConfiguration of cognito_user_pool_configuration
      [@ocaml.doc
        "Contains configuration details of a Amazon Cognito user pool that Verified Permissions \
         can use as a source of authenticated identities as entities. It specifies the \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of a Amazon Cognito user pool and one or more application client \
         IDs.\n\n\
        \ Example: \
         [\"configuration\":{\"cognitoUserPoolConfiguration\":{\"userPoolArn\":\"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5\",\"clientIds\": \
         \\[\"a1b2c3d4e5f6g7h8i9j0kalbmc\"\\],\"groupConfiguration\": {\"groupEntityType\": \
         \"MyCorp::Group\"}}}] \n\
        \ "]
[@@ocaml.doc
  "Contains configuration information used when creating a new identity source.\n\n\
  \ This data type is used as a request parameter for the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_CreateIdentitySource.html}CreateIdentitySource} \
   operation.\n\
  \ "]

type nonrec create_identity_source_input = {
  principal_entity_type : principal_entity_type option;
      [@ocaml.doc
        "Specifies the namespace and data type of the principals generated for identities \
         authenticated by the new identity source.\n"]
  configuration : configuration;
      [@ocaml.doc
        "Specifies the details required to communicate with the identity provider (IdP) associated \
         with this identity source.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store in which you want to store this identity source. \
         Only policies and requests made using this policy store can reference identities from the \
         identity provider configured in the new identity source.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
  client_token : idempotency_token option;
      [@ocaml.doc
        "Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the \
         request. This lets you safely retry the request without accidentally performing the same \
         operation a second time. Passing the same value to a later call to an operation requires \
         that you also pass the same value for all other parameters. We recommend that you use a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID type of value.}.\n\n\
        \ If you don't provide this value, then Amazon Web Services generates a random one for you.\n\
        \ \n\
        \  If you retry the operation with the same [ClientToken], but with different parameters, \
         the retry fails with an [ConflictException] error.\n\
        \  \n\
        \   Verified Permissions recognizes a [ClientToken] for eight hours. After eight hours, \
         the next request with the same parameters performs the operation again regardless of the \
         value of [ClientToken].\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec batch_is_authorized_with_token_input_item = {
  context : context_definition option;
      [@ocaml.doc
        "Specifies additional context that can be used to make more granular authorization \
         decisions.\n"]
  resource : entity_identifier option;
      [@ocaml.doc
        "Specifies the resource that you want an authorization decision for. For example, \
         [PhotoFlash::Photo].\n"]
  action : action_identifier option;
      [@ocaml.doc
        "Specifies the requested action to be authorized. For example, [PhotoFlash::ReadPhoto].\n"]
}
[@@ocaml.doc
  "An authorization request that you include in a [BatchIsAuthorizedWithToken] API request.\n"]

type nonrec batch_is_authorized_with_token_output_item = {
  errors : evaluation_error_list;
      [@ocaml.doc
        "Errors that occurred while making an authorization decision. For example, a policy might \
         reference an entity or attribute that doesn't exist in the request.\n"]
  determining_policies : determining_policy_list;
      [@ocaml.doc
        "The list of determining policies used to make the authorization decision. For example, if \
         there are two matching policies, where one is a forbid and the other is a permit, then \
         the forbid policy will be the determining policy. In the case of multiple matching permit \
         policies then there would be multiple determining policies. In the case that no policies \
         match, and hence the response is DENY, there would be no determining policies.\n"]
  decision : decision;
      [@ocaml.doc
        "An authorization decision that indicates if the authorization request should be allowed \
         or denied.\n"]
  request : batch_is_authorized_with_token_input_item;
      [@ocaml.doc "The authorization request that initiated the decision.\n"]
}
[@@ocaml.doc
  "The decision, based on policy evaluation, from an individual authorization request in a \
   [BatchIsAuthorizedWithToken] API request.\n"]

type nonrec batch_is_authorized_with_token_output_list =
  batch_is_authorized_with_token_output_item list
[@@ocaml.doc ""]

type nonrec batch_is_authorized_with_token_output = {
  results : batch_is_authorized_with_token_output_list;
      [@ocaml.doc
        "A series of [Allow] or [Deny] decisions for each request, and the policies that produced \
         them. These results are returned in the order they were requested.\n"]
  principal : entity_identifier option;
      [@ocaml.doc "The identifier of the principal in the ID or access token.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_is_authorized_with_token_input_list =
  batch_is_authorized_with_token_input_item list
[@@ocaml.doc ""]

type nonrec batch_is_authorized_with_token_input = {
  requests : batch_is_authorized_with_token_input_list;
      [@ocaml.doc "An array of up to 30 requests that you want Verified Permissions to evaluate.\n"]
  entities : entities_definition option;
      [@ocaml.doc
        "(Optional) Specifies the list of resources and their associated attributes that Verified \
         Permissions can examine when evaluating the policies. These additional entities and their \
         attributes can be referenced and checked by conditional elements in the policies in the \
         specified policy store.\n\n\
        \  You can't include principals in this parameter, only resource and action entities. This \
         parameter can't include any entities of a type that matches the user or group entity \
         types that you defined in your identity source.\n\
        \  \n\
        \   {ul\n\
        \         {-  The [BatchIsAuthorizedWithToken] operation takes principal attributes from \
         {b  {i only} } the [identityToken] or [accessToken] passed to the operation.\n\
        \             \n\
        \              }\n\
        \         {-  For action entities, you can include only their [Identifier] and \
         [EntityType]. \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  access_token : token option;
      [@ocaml.doc
        "Specifies an access token for the principal that you want to authorize in each request. \
         This token is provided to you by the identity provider (IdP) associated with the \
         specified identity source. You must specify either an [accessToken], an [identityToken], \
         or both.\n\n\
        \ Must be an access token. Verified Permissions returns an error if the [token_use] claim \
         in the submitted token isn't [access].\n\
        \ "]
  identity_token : token option;
      [@ocaml.doc
        "Specifies an identity (ID) token for the principal that you want to authorize in each \
         request. This token is provided to you by the identity provider (IdP) associated with the \
         specified identity source. You must specify either an [accessToken], an [identityToken], \
         or both.\n\n\
        \ Must be an ID token. Verified Permissions returns an error if the [token_use] claim in \
         the submitted token isn't [id].\n\
        \ "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store. Policies in this policy store will be used to make \
         an authorization decision for the input.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec batch_is_authorized_input_item = {
  context : context_definition option;
      [@ocaml.doc
        "Specifies additional context that can be used to make more granular authorization \
         decisions.\n"]
  resource : entity_identifier option;
      [@ocaml.doc
        "Specifies the resource that you want an authorization decision for. For example, \
         [PhotoFlash::Photo].\n"]
  action : action_identifier option;
      [@ocaml.doc
        "Specifies the requested action to be authorized. For example, [PhotoFlash::ReadPhoto].\n"]
  principal : entity_identifier option;
      [@ocaml.doc "Specifies the principal for which the authorization decision is to be made.\n"]
}
[@@ocaml.doc "An authorization request that you include in a [BatchIsAuthorized] API request.\n"]

type nonrec batch_is_authorized_output_item = {
  errors : evaluation_error_list;
      [@ocaml.doc
        "Errors that occurred while making an authorization decision. For example, a policy might \
         reference an entity or attribute that doesn't exist in the request.\n"]
  determining_policies : determining_policy_list;
      [@ocaml.doc
        "The list of determining policies used to make the authorization decision. For example, if \
         there are two matching policies, where one is a forbid and the other is a permit, then \
         the forbid policy will be the determining policy. In the case of multiple matching permit \
         policies then there would be multiple determining policies. In the case that no policies \
         match, and hence the response is DENY, there would be no determining policies.\n"]
  decision : decision;
      [@ocaml.doc
        "An authorization decision that indicates if the authorization request should be allowed \
         or denied.\n"]
  request : batch_is_authorized_input_item;
      [@ocaml.doc "The authorization request that initiated the decision.\n"]
}
[@@ocaml.doc
  "The decision, based on policy evaluation, from an individual authorization request in a \
   [BatchIsAuthorized] API request.\n"]

type nonrec batch_is_authorized_output_list = batch_is_authorized_output_item list [@@ocaml.doc ""]

type nonrec batch_is_authorized_output = {
  results : batch_is_authorized_output_list;
      [@ocaml.doc
        "A series of [Allow] or [Deny] decisions for each request, and the policies that produced \
         them. These results are returned in the order they were requested.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_is_authorized_input_list = batch_is_authorized_input_item list [@@ocaml.doc ""]

type nonrec batch_is_authorized_input = {
  requests : batch_is_authorized_input_list;
      [@ocaml.doc "An array of up to 30 requests that you want Verified Permissions to evaluate.\n"]
  entities : entities_definition option;
      [@ocaml.doc
        "(Optional) Specifies the list of resources and principals and their associated attributes \
         that Verified Permissions can examine when evaluating the policies. These additional \
         entities and their attributes can be referenced and checked by conditional elements in \
         the policies in the specified policy store.\n\n\
        \  You can include only principal and resource entities in this parameter; you can't \
         include actions. You must specify actions in the schema.\n\
        \  \n\
        \   "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "Specifies the ID of the policy store. Policies in this policy store will be used to make \
         the authorization decisions for the input.\n\n\
        \ To specify a policy store, use its ID or alias name. When using an alias name, prefix it \
         with [policy-store-alias/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [PSEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Alias name: [policy-store-alias/example-policy-store] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To view aliases, use \
         {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_ListPolicyStoreAliases.html}ListPolicyStoreAliases}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec batch_get_policy_output_item = {
  name : policy_name option;
      [@ocaml.doc
        "The name of the policy, if one was assigned when the policy was created or last updated.\n"]
  last_updated_date : timestamp_format;
      [@ocaml.doc "The date and time the policy was most recently updated.\n"]
  created_date : timestamp_format; [@ocaml.doc "The date and time the policy was created.\n"]
  definition : policy_definition_detail;
      [@ocaml.doc "The policy definition of an item in the list of policies returned.\n"]
  policy_type : policy_type;
      [@ocaml.doc
        "The type of the policy. This is one of the following values:\n\n\
        \ {ul\n\
        \       {-   [STATIC] \n\
        \           \n\
        \            }\n\
        \       {-   [TEMPLATE_LINKED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  policy_id : policy_id; [@ocaml.doc "The identifier of the policy you want information about.\n"]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "The identifier of the policy store where the policy you want information about is stored.\n"]
}
[@@ocaml.doc "Contains information about a policy returned from a [BatchGetPolicy] API request.\n"]

type nonrec batch_get_policy_output_list = batch_get_policy_output_item list [@@ocaml.doc ""]

type nonrec batch_get_policy_error_code =
  | POLICY_STORE_ALIAS_NOT_FOUND [@ocaml.doc ""]
  | POLICY_NOT_FOUND [@ocaml.doc ""]
  | POLICY_STORE_NOT_FOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_get_policy_error_item = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "A detailed error message.\n"]
  policy_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the policy associated with the failed request.\n"]
  policy_store_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the policy store associated with the failed request.\n"]
  code : batch_get_policy_error_code; [@ocaml.doc "The error code that was returned.\n"]
}
[@@ocaml.doc
  "Contains the information about an error resulting from a [BatchGetPolicy] API call.\n"]

type nonrec batch_get_policy_error_list = batch_get_policy_error_item list [@@ocaml.doc ""]

type nonrec batch_get_policy_output = {
  errors : batch_get_policy_error_list;
      [@ocaml.doc
        "Information about the policies from the request that resulted in an error. These results \
         are returned in the order they were requested.\n"]
  results : batch_get_policy_output_list;
      [@ocaml.doc
        "Information about the policies listed in the request that were successfully returned. \
         These results are returned in the order they were requested.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_policy_input_item = {
  policy_id : policy_id;
      [@ocaml.doc
        "The identifier of the policy you want information about.\n\n\
        \ You can use the policy name in place of the policy ID. When using a name, prefix it with \
         [name/]. For example:\n\
        \ \n\
        \  {ul\n\
        \        {-  ID: [SPEXAMPLEabcdefg111111] \n\
        \            \n\
        \             }\n\
        \        {-  Name: [name/example-policy] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_store_id : policy_store_id;
      [@ocaml.doc
        "The identifier of the policy store where the policy you want information about is stored.\n"]
}
[@@ocaml.doc "Information about a policy that you include in a [BatchGetPolicy] API request.\n"]

type nonrec batch_get_policy_input_list = batch_get_policy_input_item list [@@ocaml.doc ""]

type nonrec batch_get_policy_input = {
  requests : batch_get_policy_input_list;
      [@ocaml.doc "An array of up to 100 policies you want information about.\n"]
}
[@@ocaml.doc ""]
