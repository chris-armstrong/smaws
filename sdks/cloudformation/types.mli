type nonrec resource_type = string [@@ocaml.doc ""]

type nonrec resource_types = resource_type list [@@ocaml.doc ""]

type nonrec warnings = {
  unrecognized_resource_types : resource_types option;
      [@ocaml.doc
        "A list of all of the unrecognized resource types. This is only returned if the \
         [TemplateSummaryConfig] parameter has the [TreatUnrecognizedResourceTypesAsWarning] \
         configuration set to [True].\n"]
}
[@@ocaml.doc "Contains any warnings returned by the [GetTemplateSummary] API action.\n"]

type nonrec warning_type =
  | EXCLUDED_RESOURCES [@ocaml.doc ""]
  | EXCLUDED_PROPERTIES [@ocaml.doc ""]
  | MUTUALLY_EXCLUSIVE_TYPES [@ocaml.doc ""]
  | UNSUPPORTED_PROPERTIES [@ocaml.doc ""]
  | MUTUALLY_EXCLUSIVE_PROPERTIES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec property_path = string [@@ocaml.doc ""]

type nonrec required_property = bool [@@ocaml.doc ""]

type nonrec property_description = string [@@ocaml.doc ""]

type nonrec warning_property = {
  description : property_description option;
      [@ocaml.doc "The description of the property from the resource provider schema.\n"]
  required : required_property option;
      [@ocaml.doc "If [true], the specified property is required.\n"]
  property_path : property_path option;
      [@ocaml.doc
        "The path of the property. For example, if this is for the [S3Bucket] member of the [Code] \
         property, the property path would be [Code/S3Bucket].\n"]
}
[@@ocaml.doc "A specific property that is impacted by a warning.\n"]

type nonrec warning_properties = warning_property list [@@ocaml.doc ""]

type nonrec warning_detail = {
  properties : warning_properties option;
      [@ocaml.doc "The properties of the resource that are impacted by this warning.\n"]
  type_ : warning_type option;
      [@ocaml.doc
        "The type of this warning. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/generate-IaC-write-only-properties.html}Resolve \
         write-only properties} in the {i CloudFormation User Guide}.\n\n\
        \ {ul\n\
        \       {-   [MUTUALLY_EXCLUSIVE_PROPERTIES] - The resource requires mutually-exclusive \
         write-only properties. The IaC generator selects one set of mutually exclusive properties \
         and converts the included properties into parameters. The parameter names have a suffix \
         [OneOf] and the parameter descriptions indicate that the corresponding property can be \
         replaced with other exclusive properties.\n\
        \           \n\
        \            }\n\
        \       {-   [UNSUPPORTED_PROPERTIES] - Unsupported properties are present in the \
         resource. One example of unsupported properties would be a required write-only property \
         that is an array, because a parameter cannot be an array. Another example is an optional \
         write-only property.\n\
        \           \n\
        \            }\n\
        \       {-   [MUTUALLY_EXCLUSIVE_TYPES] - One or more required write-only properties are \
         found in the resource, and the type of that property can be any of several types.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Currently the resource and property reference documentation does not indicate if a \
         property uses a type of [oneOf] or [anyOf]. You need to look at the resource provider \
         schema.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc "The warnings generated for a specific resource for this generated template.\n"]

type nonrec warning_details = warning_detail list [@@ocaml.doc ""]

type nonrec visibility = PRIVATE [@ocaml.doc ""] | PUBLIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec version_bump = MINOR [@ocaml.doc ""] | MAJOR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec version = string [@@ocaml.doc ""]

type nonrec value = string [@@ocaml.doc ""]

type nonrec validation_status_reason = string [@@ocaml.doc ""]

type nonrec validation_status = SKIPPED [@ocaml.doc ""] | FAILED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec validation_path = string [@@ocaml.doc ""]

type nonrec validation_name = string [@@ocaml.doc ""]

type nonrec parameter_key = string [@@ocaml.doc ""]

type nonrec parameter_value = string [@@ocaml.doc ""]

type nonrec no_echo = bool [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec template_parameter = {
  description : description option;
      [@ocaml.doc "User defined description associated with the parameter.\n"]
  no_echo : no_echo option;
      [@ocaml.doc
        "Flag indicating whether the parameter should be displayed as plain text in logs and UIs.\n"]
  default_value : parameter_value option;
      [@ocaml.doc "The default value associated with the parameter.\n"]
  parameter_key : parameter_key option; [@ocaml.doc "The name associated with the parameter.\n"]
}
[@@ocaml.doc "The [TemplateParameter] data type.\n"]

type nonrec template_parameters = template_parameter list [@@ocaml.doc ""]

type nonrec capability =
  | CAPABILITY_AUTO_EXPAND [@ocaml.doc ""]
  | CAPABILITY_NAMED_IAM [@ocaml.doc ""]
  | CAPABILITY_IAM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capabilities = capability list [@@ocaml.doc ""]

type nonrec capabilities_reason = string [@@ocaml.doc ""]

type nonrec transform_name = string [@@ocaml.doc ""]

type nonrec transforms_list = transform_name list [@@ocaml.doc ""]

type nonrec validate_template_output = {
  declared_transforms : transforms_list option;
      [@ocaml.doc "A list of the transforms that are declared in the template.\n"]
  capabilities_reason : capabilities_reason option;
      [@ocaml.doc
        "The list of resources that generated the values in the [Capabilities] response element.\n"]
  capabilities : capabilities option;
      [@ocaml.doc
        "The capabilities found within the template. If your template contains IAM resources, you \
         must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value for this parameter when you \
         use the [CreateStack] or [UpdateStack] actions with your template; otherwise, those \
         actions return an InsufficientCapabilities error.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities}Acknowledging \
         IAM resources in CloudFormation templates}.\n\
        \ "]
  description : description option; [@ocaml.doc "The description found within the template.\n"]
  parameters : template_parameters option; [@ocaml.doc "A list of [TemplateParameter] structures.\n"]
}
[@@ocaml.doc "The output for [ValidateTemplate] action.\n"]

type nonrec template_body = string [@@ocaml.doc ""]

type nonrec template_ur_l = string [@@ocaml.doc ""]

type nonrec validate_template_input = {
  template_ur_l : template_ur_l option;
      [@ocaml.doc
        "The URL of a file that contains the template body. The URL must point to a template (max \
         size: 1 MB) that is located in an Amazon S3 bucket or a Systems Manager document. The \
         location for an Amazon S3 bucket must start with [https://].\n\n\
        \ Conditional: You must pass [TemplateURL] or [TemplateBody]. If both are passed, only \
         [TemplateBody] is used.\n\
        \ "]
  template_body : template_body option;
      [@ocaml.doc
        "Structure that contains the template body with a minimum length of 1 byte and a maximum \
         length of 51,200 bytes.\n\n\
        \ Conditional: You must pass [TemplateURL] or [TemplateBody]. If both are passed, only \
         [TemplateBody] is used.\n\
        \ "]
}
[@@ocaml.doc "The input for [ValidateTemplate] action.\n"]

type nonrec use_previous_value = bool [@@ocaml.doc ""]

type nonrec use_previous_template = bool [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec stack_id = string [@@ocaml.doc ""]

type nonrec update_termination_protection_output = {
  stack_id : stack_id option; [@ocaml.doc "The unique ID of the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_termination_protection = bool [@@ocaml.doc ""]

type nonrec stack_name_or_id = string [@@ocaml.doc ""]

type nonrec update_termination_protection_input = {
  stack_name : stack_name_or_id;
      [@ocaml.doc
        "The name or unique ID of the stack for which you want to set termination protection.\n"]
  enable_termination_protection : enable_termination_protection;
      [@ocaml.doc "Whether to enable termination protection on the specified stack.\n"]
}
[@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec update_stack_set_output = {
  operation_id : client_request_token option;
      [@ocaml.doc "The unique ID for this StackSet operation.\n"]
}
[@@ocaml.doc ""]

type nonrec stack_set_name = string [@@ocaml.doc ""]

type nonrec parameter = {
  resolved_value : parameter_value option;
      [@ocaml.doc
        "Read-only. The value that corresponds to a Systems Manager parameter key. This field is \
         returned only for Systems Manager parameter types in the template. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-supplied-parameter-types.html}Specify \
         existing resources at runtime with CloudFormation-supplied parameter types} in the {i \
         CloudFormation User Guide}.\n"]
  use_previous_value : use_previous_value option;
      [@ocaml.doc
        "During a stack update, use the existing parameter value that the stack is using for a \
         given parameter key. If you specify [true], do not specify a parameter value.\n"]
  parameter_value : parameter_value option;
      [@ocaml.doc "The input value associated with the parameter.\n"]
  parameter_key : parameter_key option;
      [@ocaml.doc
        "The key associated with the parameter. If you don't specify a key and value for a \
         particular parameter, CloudFormation uses the default value that's specified in your \
         template.\n"]
}
[@@ocaml.doc "The [Parameter] data type.\n"]

type nonrec parameters = parameter list [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "A string that contains the value for this tag. You can specify a maximum of 256 \
         characters for a tag value.\n"]
  key : tag_key;
      [@ocaml.doc
        "A string used to identify this tag. You can specify a maximum of 128 characters for a tag \
         key. Tags owned by Amazon Web Services have the reserved prefix: [aws:].\n"]
}
[@@ocaml.doc
  "The Tag type enables you to specify a key-value pair that can be used to store information \
   about an CloudFormation stack.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec region_concurrency_type = PARALLEL [@ocaml.doc ""] | SEQUENTIAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec region_list = region list [@@ocaml.doc ""]

type nonrec failure_tolerance_count = int [@@ocaml.doc ""]

type nonrec failure_tolerance_percentage = int [@@ocaml.doc ""]

type nonrec max_concurrent_count = int [@@ocaml.doc ""]

type nonrec max_concurrent_percentage = int [@@ocaml.doc ""]

type nonrec concurrency_mode =
  | SOFT_FAILURE_TOLERANCE [@ocaml.doc ""]
  | STRICT_FAILURE_TOLERANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_set_operation_preferences = {
  concurrency_mode : concurrency_mode option;
      [@ocaml.doc
        "Specifies how the concurrency level behaves during the operation execution.\n\n\
        \ {ul\n\
        \       {-   [STRICT_FAILURE_TOLERANCE]: This option dynamically lowers the concurrency \
         level to ensure the number of failed accounts never exceeds the value of \
         [FailureToleranceCount] +1. The initial actual concurrency is set to the lower of either \
         the value of the [MaxConcurrentCount], or the value of [FailureToleranceCount] +1. The \
         actual concurrency is then reduced proportionally by the number of failures. This is the \
         default behavior.\n\
        \           \n\
        \            If failure tolerance or Maximum concurrent accounts are set to percentages, \
         the behavior is similar.\n\
        \            \n\
        \             }\n\
        \       {-   [SOFT_FAILURE_TOLERANCE]: This option decouples [FailureToleranceCount] from \
         the actual concurrency. This allows StackSet operations to run at the concurrency level \
         set by the [MaxConcurrentCount] value, or [MaxConcurrentPercentage], regardless of the \
         number of failures.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_concurrent_percentage : max_concurrent_percentage option;
      [@ocaml.doc
        "The maximum percentage of accounts in which to perform this operation at one time.\n\n\
        \ When calculating the number of accounts based on the specified percentage, \
         CloudFormation rounds down to the next whole number. This is true except in cases where \
         rounding down would result is zero. In this case, CloudFormation sets the number as one \
         instead.\n\
        \ \n\
        \  Note that this setting lets you specify the {i maximum} for operations. For large \
         deployments, under certain circumstances the actual number of accounts acted upon \
         concurrently may be lower due to service throttling.\n\
        \  \n\
        \   You can specify either [MaxConcurrentCount] or [MaxConcurrentPercentage], but not both.\n\
        \   \n\
        \    By default, [1] is specified.\n\
        \    "]
  max_concurrent_count : max_concurrent_count option;
      [@ocaml.doc
        "The maximum number of accounts in which to perform this operation at one time. This can \
         depend on the value of [FailureToleranceCount] depending on your [ConcurrencyMode]. \
         [MaxConcurrentCount] is at most one more than the [FailureToleranceCount] if you're using \
         [STRICT_FAILURE_TOLERANCE].\n\n\
        \ Note that this setting lets you specify the {i maximum} for operations. For large \
         deployments, under certain circumstances the actual number of accounts acted upon \
         concurrently may be lower due to service throttling.\n\
        \ \n\
        \  You can specify either [MaxConcurrentCount] or [MaxConcurrentPercentage], but not both.\n\
        \  \n\
        \   By default, [1] is specified.\n\
        \   "]
  failure_tolerance_percentage : failure_tolerance_percentage option;
      [@ocaml.doc
        "The percentage of accounts per Region this stack operation can fail in before \
         CloudFormation stops the operation in that Region. If the operation is stopped in a \
         Region, CloudFormation doesn't attempt the operation in any subsequent Regions.\n\n\
        \ When calculating the number of accounts based on the specified percentage, \
         CloudFormation rounds {i down} to the next whole number.\n\
        \ \n\
        \  You can specify either [FailureToleranceCount] or [FailureTolerancePercentage], but not \
         both.\n\
        \  \n\
        \   By default, [0] is specified.\n\
        \   "]
  failure_tolerance_count : failure_tolerance_count option;
      [@ocaml.doc
        "The number of accounts per Region this operation can fail in before CloudFormation stops \
         the operation in that Region. If the operation is stopped in a Region, CloudFormation \
         doesn't attempt the operation in any subsequent Regions.\n\n\
        \ You can specify either [FailureToleranceCount] or [FailureTolerancePercentage], but not \
         both.\n\
        \ \n\
        \  By default, [0] is specified.\n\
        \  "]
  region_order : region_list option;
      [@ocaml.doc "The order of the Regions where you want to perform the stack operation.\n"]
  region_concurrency_type : region_concurrency_type option;
      [@ocaml.doc
        "The concurrency type of deploying StackSets operations in Regions, could be in parallel \
         or one Region at a time.\n"]
}
[@@ocaml.doc
  "The user-specified preferences for how CloudFormation performs a StackSet operation.\n\n\
  \ For more information about maximum concurrent accounts and failure tolerance, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options}StackSet \
   operation options}.\n\
  \ \n\
  \    [StackSetOperationPreferences] don't apply to [AutoDeployment], even if it's enabled.\n\
  \   \n\
  \    "]

type nonrec role_ar_n = string [@@ocaml.doc ""]

type nonrec execution_role_name = string [@@ocaml.doc ""]

type nonrec account = string [@@ocaml.doc ""]

type nonrec account_list = account list [@@ocaml.doc ""]

type nonrec accounts_url = string [@@ocaml.doc ""]

type nonrec organizational_unit_id = string [@@ocaml.doc ""]

type nonrec organizational_unit_id_list = organizational_unit_id list [@@ocaml.doc ""]

type nonrec account_filter_type =
  | UNION [@ocaml.doc ""]
  | DIFFERENCE [@ocaml.doc ""]
  | INTERSECTION [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_targets = {
  account_filter_type : account_filter_type option;
      [@ocaml.doc
        "Refines which accounts will have stack operations performed on them by specifying how to \
         use the [Accounts] and [OrganizationalUnitIds] properties together.\n\n\
        \ The following values determine how CloudFormation selects target accounts:\n\
        \ \n\
        \  {ul\n\
        \        {-   [INTERSECTION]: Performs stack operations only on specific individual \
         accounts within the selected OUs. Only accounts that are both specified in the [Accounts] \
         property and belong to the specified OUs will be targeted.\n\
        \            \n\
        \             }\n\
        \        {-   [DIFFERENCE]: Performs stack operations on all accounts in the selected OUs \
         except for specific accounts listed in the [Accounts] property. This enables you to \
         exclude certain accounts within an OU, such as suspended accounts.\n\
        \            \n\
        \             }\n\
        \        {-   [UNION]: Performs stack operations on the specified OUs plus additional \
         individual accounts listed in the [Accounts] property. This is the default value if \
         [AccountFilterType] is not provided. This lets you target an entire OU and individual \
         accounts from a different OU in one request. Note that [UNION] is not supported for \
         [CreateStackInstances] operations.\n\
        \            \n\
        \             }\n\
        \        {-   [NONE]: Performs stack operations on all accounts in the specified \
         organizational units (OUs).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  organizational_unit_ids : organizational_unit_id_list option;
      [@ocaml.doc
        "The organization root ID or organizational unit (OU) IDs where you want to perform stack \
         operations. CloudFormation will perform operations on accounts within these OUs and their \
         child OUs.\n"]
  accounts_url : accounts_url option;
      [@ocaml.doc
        "The Amazon S3 URL path to a file that contains a list of Amazon Web Services account IDs. \
         The file format must be either [.csv] or [.txt], and the data can be comma-separated or \
         new-line-separated. There is currently a 10MB limit for the data (approximately 800,000 \
         accounts).\n\n\
        \ This property serves the same purpose as [Accounts] but allows you to specify a large \
         number of accounts.\n\
        \ "]
  accounts : account_list option;
      [@ocaml.doc
        "The Amazon Web Services account IDs where you want to perform stack operations. How these \
         accounts are used depends on the [AccountFilterType] property.\n\n\
        \ If you have many account numbers, you can provide those accounts using the [AccountsUrl] \
         property instead.\n\
        \ "]
}
[@@ocaml.doc
  "Specifies the Organizations accounts where you want to create, update, or delete stack \
   instances. You can target either your entire organization or specific accounts using \
   organizational units (OUs) and account filter options.\n\n\
  \ CloudFormation doesn't deploy stack instances to the organization management account, even if \
   the organization management account is in your organization or in an OU in your organization.\n\
  \ \n\
  \  When performing create operations, if you specify both [OrganizationalUnitIds] and \
   [Accounts], you must also specify the [AccountFilterType] property.\n\
  \  "]

type nonrec permission_models = SELF_MANAGED [@ocaml.doc ""] | SERVICE_MANAGED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_deployment_nullable = bool [@@ocaml.doc ""]

type nonrec retain_stacks_on_account_removal_nullable = bool [@@ocaml.doc ""]

type nonrec stack_set_ar_n = string [@@ocaml.doc ""]

type nonrec stack_set_arn_list = stack_set_ar_n list [@@ocaml.doc ""]

type nonrec auto_deployment = {
  depends_on : stack_set_arn_list option;
      [@ocaml.doc
        "A list of StackSet ARNs that this StackSet depends on for auto-deployment operations. \
         When auto-deployment is triggered, operations will be sequenced to ensure all \
         dependencies complete successfully before this StackSet's operation begins.\n"]
  retain_stacks_on_account_removal : retain_stacks_on_account_removal_nullable option;
      [@ocaml.doc
        "If set to [true], stack resources are retained when an account is removed from a target \
         organization or OU. If set to [false], stack resources are deleted. Specify only if \
         [Enabled] is set to [True].\n"]
  enabled : auto_deployment_nullable option;
      [@ocaml.doc
        "If set to [true], StackSets automatically deploys additional stack instances to \
         Organizations accounts that are added to a target organization or organizational unit \
         (OU) in the specified Regions. If an account is removed from a target organization or OU, \
         StackSets deletes stack instances from the account in the specified Regions.\n"]
}
[@@ocaml.doc
  "Describes whether StackSets automatically deploys to Organizations accounts that are added to a \
   target organization or organizational unit (OU). For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-manage-auto-deployment.html}Enable \
   or disable automatic deployments for StackSets in Organizations} in the {i CloudFormation User \
   Guide}.\n"]

type nonrec call_as = DELEGATED_ADMIN [@ocaml.doc ""] | SELF [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec managed_execution_nullable = bool [@@ocaml.doc ""]

type nonrec managed_execution = {
  active : managed_execution_nullable option;
      [@ocaml.doc
        "When [true], CloudFormation performs non-conflicting operations concurrently and queues \
         conflicting operations. After conflicting operations finish, CloudFormation starts queued \
         operations in request order.\n\n\
        \  If there are already running or queued operations, CloudFormation queues all incoming \
         operations even if they are non-conflicting.\n\
        \  \n\
        \   You can't modify your StackSet's execution configuration while there are running or \
         queued operations for that StackSet.\n\
        \   \n\
        \     When [false] (default), StackSets performs one operation at a time in request order.\n\
        \     "]
}
[@@ocaml.doc
  "Describes whether StackSets performs non-conflicting operations concurrently and queues \
   conflicting operations.\n"]

type nonrec update_stack_set_input = {
  managed_execution : managed_execution option;
      [@ocaml.doc
        "Describes whether CloudFormation performs non-conflicting operations concurrently and \
         queues conflicting operations.\n"]
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  regions : region_list option;
      [@ocaml.doc
        "The Amazon Web Services Regions in which to update associated stack instances. If you \
         specify Regions, you must also specify accounts in which to update StackSet instances.\n\n\
        \ To update {i all} the stack instances associated with this StackSet, do not specify the \
         [Accounts] or [Regions] properties.\n\
        \ \n\
        \  If the StackSet update includes changes to the template (that is, if the [TemplateBody] \
         or [TemplateURL] properties are specified), or the [Parameters] property, CloudFormation \
         marks all stack instances with a status of [OUTDATED] prior to updating the stack \
         instances in the specified accounts and Regions. If the StackSet update does not include \
         changes to the template or parameters, CloudFormation updates the stack instances in the \
         specified accounts and Regions, while leaving all other stack instances with their \
         existing stack instance status.\n\
        \  "]
  accounts : account_list option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The accounts in which to update associated stack \
         instances. If you specify accounts, you must also specify the Amazon Web Services Regions \
         in which to update StackSet instances.\n\n\
        \ To update {i all} the stack instances associated with this StackSet, don't specify the \
         [Accounts] or [Regions] properties.\n\
        \ \n\
        \  If the StackSet update includes changes to the template (that is, if the [TemplateBody] \
         or [TemplateURL] properties are specified), or the [Parameters] property, CloudFormation \
         marks all stack instances with a status of [OUTDATED] prior to updating the stack \
         instances in the specified accounts and Amazon Web Services Regions. If the StackSet \
         update does not include changes to the template or parameters, CloudFormation updates the \
         stack instances in the specified accounts and Amazon Web Services Regions, while leaving \
         all other stack instances with their existing stack instance status.\n\
        \  "]
  operation_id : client_request_token option;
      [@ocaml.doc
        "The unique ID for this StackSet operation.\n\n\
        \ The operation ID also functions as an idempotency token, to ensure that CloudFormation \
         performs the StackSet operation only once, even if you retry the request multiple times. \
         You might retry StackSet operation requests to ensure that CloudFormation successfully \
         received them.\n\
        \ \n\
        \  If you don't specify an operation ID, CloudFormation generates one automatically.\n\
        \  \n\
        \   Repeating this StackSet operation with a new operation ID retries all stack instances \
         whose status is [OUTDATED].\n\
        \   "]
  auto_deployment : auto_deployment option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Describes whether StackSets automatically deploys to \
         Organizations accounts that are added to a target organization or organizational unit \
         (OU). For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-manage-auto-deployment.html}Enable \
         or disable automatic deployments for StackSets in Organizations} in the {i CloudFormation \
         User Guide}.\n\n\
        \ If you specify [AutoDeployment], don't specify [DeploymentTargets] or [Regions].\n\
        \ "]
  permission_model : permission_models option;
      [@ocaml.doc
        "Describes how the IAM roles required for StackSet operations are created. You cannot \
         modify [PermissionModel] if there are stack instances associated with your stack set.\n\n\
        \ {ul\n\
        \       {-  With [self-managed] permissions, you must create the administrator and \
         execution roles required to deploy to target accounts. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html}Grant \
         self-managed permissions}.\n\
        \           \n\
        \            }\n\
        \       {-  With [service-managed] permissions, StackSets automatically creates the IAM \
         roles required to deploy to accounts managed by Organizations. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html}Activate \
         trusted access for StackSets with Organizations}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  deployment_targets : deployment_targets option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] The Organizations accounts in which to update \
         associated stack instances.\n\n\
        \ To update all the stack instances associated with this StackSet, do not specify \
         [DeploymentTargets] or [Regions].\n\
        \ \n\
        \  If the StackSet update includes changes to the template (that is, if [TemplateBody] or \
         [TemplateURL] is specified), or the [Parameters], CloudFormation marks all stack \
         instances with a status of [OUTDATED] prior to updating the stack instances in the \
         specified accounts and Amazon Web Services Regions. If the StackSet update doesn't \
         include changes to the template or parameters, CloudFormation updates the stack instances \
         in the specified accounts and Regions, while leaving all other stack instances with their \
         existing stack instance status.\n\
        \  "]
  execution_role_name : execution_role_name option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The name of the IAM execution role to use to update the \
         stack set. If you do not specify an execution role, CloudFormation uses the \
         [AWSCloudFormationStackSetExecutionRole] role for the StackSet operation.\n\n\
        \ Specify an IAM role only if you are using customized execution roles to control which \
         stack resources users and groups can include in their StackSets.\n\
        \ \n\
        \  If you specify a customized execution role, CloudFormation uses that role to update the \
         stack. If you do not specify a customized execution role, CloudFormation performs the \
         update using the role previously associated with the StackSet, so long as you have \
         permissions to perform operations on the StackSet.\n\
        \  "]
  administration_role_ar_n : role_ar_n option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The Amazon Resource Name (ARN) of the IAM role to use to \
         update this StackSet.\n\n\
        \ Specify an IAM role only if you are using customized administrator roles to control \
         which users or groups can manage specific StackSets within the same administrator \
         account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html}Grant \
         self-managed permissions} in the {i CloudFormation User Guide}.\n\
        \ \n\
        \  If you specified a customized administrator role when you created the StackSet, you \
         must specify a customized administrator role, even if it is the same customized \
         administrator role used with this StackSet previously.\n\
        \  "]
  operation_preferences : stack_set_operation_preferences option;
      [@ocaml.doc "Preferences for how CloudFormation performs this StackSet operation.\n"]
  tags : tags option;
      [@ocaml.doc
        "The key-value pairs to associate with this StackSet and the stacks created from it. \
         CloudFormation also propagates these tags to supported resources that are created in the \
         stacks. You can specify a maximum number of 50 tags.\n\n\
        \ If you specify tags for this parameter, those tags replace any list of tags that are \
         currently associated with this StackSet. This means:\n\
        \ \n\
        \  {ul\n\
        \        {-  If you don't specify this parameter, CloudFormation doesn't modify the \
         stack's tags.\n\
        \            \n\
        \             }\n\
        \        {-  If you specify {i any} tags using this parameter, you must specify {i all} \
         the tags that you want associated with this StackSet, even tags you've specified before \
         (for example, when creating the StackSet or during a previous update of the StackSet.). \
         Any tags that you don't include in the updated list of tags are removed from the \
         StackSet, and therefore from the stacks and resources as well.\n\
        \            \n\
        \             }\n\
        \        {-  If you specify an empty value, CloudFormation removes all currently \
         associated tags.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you specify new tags as part of an [UpdateStackSet] action, CloudFormation checks \
         to see if you have the required IAM permission to tag resources. If you omit tags that \
         are currently associated with the StackSet from the list of tags you specify, \
         CloudFormation assumes that you want to remove those tags from the StackSet, and checks \
         to see if you have permission to untag resources. If you don't have the necessary \
         permission(s), the entire [UpdateStackSet] action fails with an [access denied] error, \
         and the StackSet is not updated.\n\
        \   "]
  capabilities : capabilities option;
      [@ocaml.doc
        "In some cases, you must explicitly acknowledge that your stack template contains certain \
         capabilities in order for CloudFormation to update the StackSet and its associated stack \
         instances.\n\n\
        \ {ul\n\
        \       {-   [CAPABILITY_IAM] and [CAPABILITY_NAMED_IAM] \n\
        \           \n\
        \            Some stack templates might include resources that can affect permissions in \
         your Amazon Web Services account, for example, by creating new IAM users. For those \
         stacks sets, you must explicitly acknowledge this by specifying one of these capabilities.\n\
        \            \n\
        \             The following IAM resources require you to specify either the \
         [CAPABILITY_IAM] or [CAPABILITY_NAMED_IAM] capability.\n\
        \             \n\
        \              {ul\n\
        \                    {-  If you have IAM resources, you can specify either capability.\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you have IAM resources with custom names, you {i must} specify \
         [CAPABILITY_NAMED_IAM].\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you don't specify either of these capabilities, CloudFormation \
         returns an [InsufficientCapabilities] error.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \        }\n\
        \         If your stack template contains these resources, we recommend that you review \
         all permissions associated with them and edit their permissions if necessary.\n\
        \         \n\
        \          {ul\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-accesskey.html}AWS::IAM::AccessKey} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-group.html}AWS::IAM::Group} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-instanceprofile.html}AWS::IAM::InstanceProfile} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-policy.html}AWS::IAM::Policy} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-role.html}AWS::IAM::Role} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-user.html}AWS::IAM::User} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-usertogroupaddition.html}AWS::IAM::UserToGroupAddition} \n\
        \                    \n\
        \                     }\n\
        \                \n\
        \        }\n\
        \         For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities}Acknowledging \
         IAM resources in CloudFormation templates}.\n\
        \         \n\
        \          }\n\
        \       {-   [CAPABILITY_AUTO_EXPAND] \n\
        \           \n\
        \            Some templates reference macros. If your StackSet template references one or \
         more macros, you must update the StackSet directly from the processed template, without \
         first reviewing the resulting changes in a change set. To update the StackSet directly, \
         you must acknowledge this capability. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html}Perform \
         custom processing on CloudFormation templates with template macros}.\n\
        \            \n\
        \              StackSets with service-managed permissions do not currently support the use \
         of macros in templates. (This includes the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-include.html}AWS::Include} \
         and \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html}AWS::Serverless} \
         transforms, which are macros hosted by CloudFormation.) Even if you specify this \
         capability for a StackSet with service-managed permissions, if you reference a macro in \
         your template the StackSet operation will fail.\n\
        \              \n\
        \                }\n\
        \       }\n\
        \  "]
  parameters : parameters option;
      [@ocaml.doc "A list of input parameters for the StackSet template.\n"]
  use_previous_template : use_previous_template option;
      [@ocaml.doc
        "Use the existing template that's associated with the StackSet that you're updating.\n\n\
        \ Conditional: You must specify only one of the following parameters: [TemplateBody] or \
         [TemplateURL]\226\128\148or set [UsePreviousTemplate] to true.\n\
        \ "]
  template_ur_l : template_ur_l option;
      [@ocaml.doc
        "The URL of a file that contains the template body. The URL must point to a template \
         (maximum size: 1 MB) that is located in an Amazon S3 bucket or a Systems Manager \
         document. The location for an Amazon S3 bucket must start with [https://]. S3 static \
         website URLs are not supported.\n\n\
        \ Conditional: You must specify only one of the following parameters: [TemplateBody] or \
         [TemplateURL]\226\128\148or set [UsePreviousTemplate] to true.\n\
        \ "]
  template_body : template_body option;
      [@ocaml.doc
        "The structure that contains the template body, with a minimum length of 1 byte and a \
         maximum length of 51,200 bytes.\n\n\
        \ Conditional: You must specify only one of the following parameters: [TemplateBody] or \
         [TemplateURL]\226\128\148or set [UsePreviousTemplate] to true.\n\
        \ "]
  description : description option;
      [@ocaml.doc "A brief description of updates that you are making.\n"]
  stack_set_name : stack_set_name;
      [@ocaml.doc "The name or unique ID of the StackSet that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec stale_request_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Another operation has been performed on this StackSet since the specified operation was \
   performed.\n"]

type nonrec stack_set_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified StackSet doesn't exist.\n"]

type nonrec stack_instance_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified stack instance doesn't exist.\n"]

type nonrec operation_in_progress_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Another operation is currently in progress for this StackSet. Only one operation can be \
   performed for a stack set at a given time.\n"]

type nonrec operation_id_already_exists_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified operation ID already exists.\n"]

type nonrec invalid_operation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified operation isn't valid.\n"]

type nonrec operation_id = string [@@ocaml.doc ""]

type nonrec update_stack_output = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A unique identifier for this update operation that can be used to track the operation's \
         progress and events.\n"]
  stack_id : stack_id option; [@ocaml.doc "Unique identifier of the stack.\n"]
}
[@@ocaml.doc "The output for an [UpdateStack] action.\n"]

type nonrec update_stack_instances_output = {
  operation_id : client_request_token option;
      [@ocaml.doc "The unique identifier for this StackSet operation.\n"]
}
[@@ocaml.doc ""]

type nonrec stack_set_name_or_id = string [@@ocaml.doc ""]

type nonrec update_stack_instances_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  operation_id : client_request_token option;
      [@ocaml.doc
        "The unique identifier for this StackSet operation.\n\n\
        \ The operation ID also functions as an idempotency token, to ensure that CloudFormation \
         performs the StackSet operation only once, even if you retry the request multiple times. \
         You might retry StackSet operation requests to ensure that CloudFormation successfully \
         received them.\n\
        \ \n\
        \  If you don't specify an operation ID, the SDK generates one automatically.\n\
        \  "]
  operation_preferences : stack_set_operation_preferences option;
      [@ocaml.doc "Preferences for how CloudFormation performs this StackSet operation.\n"]
  parameter_overrides : parameters option;
      [@ocaml.doc
        "A list of input parameters whose values you want to update for the specified stack \
         instances.\n\n\
        \ Any overridden parameter values will be applied to all stack instances in the specified \
         accounts and Amazon Web Services Regions. When specifying parameters and their values, be \
         aware of how CloudFormation sets parameter values during stack instance update operations:\n\
        \ \n\
        \  {ul\n\
        \        {-  To override the current value for a parameter, include the parameter and \
         specify its value.\n\
        \            \n\
        \             }\n\
        \        {-  To leave an overridden parameter set to its present value, include the \
         parameter and specify [UsePreviousValue] as [true]. (You can't specify both a value and \
         set [UsePreviousValue] to [true].)\n\
        \            \n\
        \             }\n\
        \        {-  To set an overridden parameter back to the value specified in the StackSet, \
         specify a parameter list but don't include the parameter in the list.\n\
        \            \n\
        \             }\n\
        \        {-  To leave all parameters set to their present values, don't specify this \
         property at all.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   During StackSet updates, any parameter values overridden for a stack instance aren't \
         updated, but retain their overridden value.\n\
        \   \n\
        \    You can only override the parameter {i values} that are specified in the StackSet. To \
         add or delete a parameter itself, use [UpdateStackSet] to update the StackSet template. \
         If you add a parameter to a template, before you can override the parameter value \
         specified in the StackSet you must first use \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html}UpdateStackSet} \
         to update all stack instances with the updated template and parameter value specified in \
         the StackSet. Once a stack instance has been updated with the new parameter, you can then \
         override the parameter value using [UpdateStackInstances].\n\
        \    "]
  regions : region_list;
      [@ocaml.doc
        "The names of one or more Amazon Web Services Regions in which you want to update \
         parameter values for stack instances. The overridden parameter values will be applied to \
         all stack instances in the specified accounts and Amazon Web Services Regions.\n"]
  deployment_targets : deployment_targets option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] The Organizations accounts in which you want to update \
         parameter values for stack instances. If your update targets OUs, the overridden \
         parameter values only apply to the accounts that are currently in the target OUs and \
         their child OUs. Accounts added to the target OUs and their child OUs in the future won't \
         use the overridden values.\n\n\
        \ You can specify [Accounts] or [DeploymentTargets], but not both.\n\
        \ "]
  accounts : account_list option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The account IDs of one or more Amazon Web Services \
         accounts in which you want to update parameter values for stack instances. The overridden \
         parameter values will be applied to all stack instances in the specified accounts and \
         Amazon Web Services Regions.\n\n\
        \ You can specify [Accounts] or [DeploymentTargets], but not both.\n\
        \ "]
  stack_set_name : stack_set_name_or_id;
      [@ocaml.doc "The name or unique ID of the StackSet associated with the stack instances.\n"]
}
[@@ocaml.doc ""]

type nonrec stack_name = string [@@ocaml.doc ""]

type nonrec stack_policy_during_update_body = string [@@ocaml.doc ""]

type nonrec stack_policy_during_update_ur_l = string [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec type_ = string [@@ocaml.doc ""]

type nonrec rollback_trigger = {
  type_ : type_;
      [@ocaml.doc
        "The resource type of the rollback trigger. Specify either \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-cloudwatch-alarm.html}AWS::CloudWatch::Alarm} \
         or \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-cloudwatch-compositealarm.html}AWS::CloudWatch::CompositeAlarm} \
         resource types.\n"]
  arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rollback trigger.\n\n\
        \ If a specified trigger is missing, the entire stack operation fails and is rolled back.\n\
        \ "]
}
[@@ocaml.doc
  "A rollback trigger CloudFormation monitors during creation and updating of stacks. If any of \
   the alarms you specify goes to ALARM state during the stack operation or within the specified \
   monitoring period afterwards, CloudFormation rolls back the entire stack operation.\n"]

type nonrec rollback_triggers = rollback_trigger list [@@ocaml.doc ""]

type nonrec monitoring_time_in_minutes = int [@@ocaml.doc ""]

type nonrec rollback_configuration = {
  monitoring_time_in_minutes : monitoring_time_in_minutes option;
      [@ocaml.doc
        "The amount of time, in minutes, during which CloudFormation should monitor all the \
         rollback triggers after the stack creation or update operation deploys all necessary \
         resources.\n\n\
        \ The default is 0 minutes.\n\
        \ \n\
        \  If you specify a monitoring period but don't specify any rollback triggers, \
         CloudFormation still waits the specified period of time before cleaning up old resources \
         after update operations. You can use this monitoring period to perform any manual stack \
         validation desired, and manually cancel the stack creation or update (using \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CancelUpdateStack.html}CancelUpdateStack}, \
         for example) as necessary.\n\
        \  \n\
        \   If you specify 0 for this parameter, CloudFormation still monitors the specified \
         rollback triggers during stack creation and update operations. Then, for update \
         operations, it begins disposing of old resources immediately once the operation completes.\n\
        \   "]
  rollback_triggers : rollback_triggers option;
      [@ocaml.doc
        "The triggers to monitor during stack creation or update actions.\n\n\
        \ By default, CloudFormation saves the rollback triggers specified for a stack and applies \
         them to any subsequent update operations for the stack, unless you specify otherwise. If \
         you do specify rollback triggers for this parameter, those triggers replace any list of \
         triggers previously specified for the stack. This means:\n\
        \ \n\
        \  {ul\n\
        \        {-  To use the rollback triggers previously specified for this stack, if any, \
         don't specify this parameter.\n\
        \            \n\
        \             }\n\
        \        {-  To specify new or updated rollback triggers, you must specify {i all} the \
         triggers that you want used for this stack, even triggers you've specified before (for \
         example, when creating the stack or during a previous stack update). Any triggers that \
         you don't include in the updated list of triggers are no longer applied to the stack.\n\
        \            \n\
        \             }\n\
        \        {-  To remove all currently specified triggers, specify an empty list for this \
         parameter.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If a specified trigger is missing, the entire stack operation fails and is rolled back.\n\
        \   "]
}
[@@ocaml.doc
  "Structure that contains the rollback triggers for CloudFormation to monitor during stack \
   creation and updating operations, and for the specified monitoring period afterwards.\n\n\
  \ Rollback triggers enable you to have CloudFormation monitor the state of your application \
   during stack creation and updating, and to roll back that operation if the application breaches \
   the threshold of any of the alarms you've specified. For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-rollback-triggers.html}Roll \
   back your CloudFormation stack on alarm breach with rollback triggers}.\n\
  \ "]

type nonrec stack_policy_body = string [@@ocaml.doc ""]

type nonrec stack_policy_ur_l = string [@@ocaml.doc ""]

type nonrec notification_ar_n = string [@@ocaml.doc ""]

type nonrec notification_ar_ns = notification_ar_n list [@@ocaml.doc ""]

type nonrec disable_rollback = bool [@@ocaml.doc ""]

type nonrec retain_except_on_create = bool [@@ocaml.doc ""]

type nonrec deployment_config_mode = EXPRESS [@ocaml.doc ""] | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_config = {
  disable_rollback : disable_rollback option;
      [@ocaml.doc
        "Specifies whether to disable rollback of the stack if the stack operation fails.\n\n\
        \ Default: [false] \n\
        \ "]
  mode : deployment_config_mode option;
      [@ocaml.doc
        "Specifies the deployment mode for the stack operation. Possible values are:\n\n\
        \ {ul\n\
        \       {-   [STANDARD] - Use the standard deployment behavior, ensuring resources are \
         ready to serve traffic before completing the operation. This is the default. You do not \
         need to specify this value explicitly.\n\
        \           \n\
        \            }\n\
        \       {-   [EXPRESS] - Complete the stack operation when resource configuration is \
         applied, without waiting for resources to become ready to serve traffic. Resources \
         continue becoming ready in the background.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The deployment configuration for a stack operation, including the deployment mode.\n"]

type nonrec disable_validation = bool [@@ocaml.doc ""]

type nonrec update_stack_input = {
  disable_validation : disable_validation option;
      [@ocaml.doc
        " Set to [true] to disable pre-deployment validations in changeset or stack operations. \n\n\
        \  Default: [false] \n\
        \ "]
  deployment_config : deployment_config option;
      [@ocaml.doc
        "The deployment configuration for this stack operation, including the deployment mode.\n"]
  retain_except_on_create : retain_except_on_create option;
      [@ocaml.doc
        "When set to [true], newly created resources are deleted when the operation rolls back. \
         This includes newly created resources marked with a deletion policy of [Retain].\n\n\
        \ Default: [false] \n\
        \ "]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique identifier for this [UpdateStack] request. Specify this token if you plan to \
         retry requests so that CloudFormation knows that you're not attempting to update a stack \
         with the same name. You might retry [UpdateStack] requests to ensure that CloudFormation \
         successfully received them.\n\n\
        \ All events triggered by a given stack operation are assigned the same client request \
         token, which you can use to track operations. For example, if you execute a [CreateStack] \
         operation with the token [token1], then all the [StackEvents] generated by that operation \
         will have [ClientRequestToken] set as [token1].\n\
        \ \n\
        \  In the console, stack operations display the client request token on the Events tab. \
         Stack operations that are initiated from the console use the token format {i \
         Console-StackOperation-ID}, which helps you easily identify the stack operation . For \
         example, if you create a stack using the console, each stack event would be assigned the \
         same token in the following format: \
         [Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002].\n\
        \  "]
  disable_rollback : disable_rollback option;
      [@ocaml.doc
        "Preserve the state of previously provisioned resources when an operation fails.\n\n\
        \ Default: [False] \n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs to associate with this stack. CloudFormation also propagates these tags \
         to supported resources in the stack. You can specify a maximum number of 50 tags.\n\n\
        \ If you don't specify this parameter, CloudFormation doesn't modify the stack's tags. If \
         you specify an empty value, CloudFormation removes all associated tags.\n\
        \ "]
  notification_ar_ns : notification_ar_ns option;
      [@ocaml.doc
        "Amazon Simple Notification Service topic Amazon Resource Names (ARNs) that CloudFormation \
         associates with the stack. Specify an empty list to remove all notification topics.\n"]
  stack_policy_ur_l : stack_policy_ur_l option;
      [@ocaml.doc
        "Location of a file that contains the updated stack policy. The URL must point to a policy \
         (max size: 16KB) located in an S3 bucket in the same Region as the stack. The location \
         for an Amazon S3 bucket must start with [https://]. URLs from S3 static websites are not \
         supported.\n\n\
        \ You can specify either the [StackPolicyBody] or the [StackPolicyURL] parameter, but not \
         both.\n\
        \ \n\
        \  You might update the stack policy, for example, in order to protect a new resource that \
         you created during a stack update. If you don't specify a stack policy, the current \
         policy that is associated with the stack is unchanged.\n\
        \  "]
  stack_policy_body : stack_policy_body option;
      [@ocaml.doc
        "Structure that contains a new stack policy body. You can specify either the \
         [StackPolicyBody] or the [StackPolicyURL] parameter, but not both.\n\n\
        \ You might update the stack policy, for example, in order to protect a new resource that \
         you created during a stack update. If you don't specify a stack policy, the current \
         policy that is associated with the stack is unchanged.\n\
        \ "]
  rollback_configuration : rollback_configuration option;
      [@ocaml.doc
        "The rollback triggers for CloudFormation to monitor during stack creation and updating \
         operations, and for the specified monitoring period afterwards.\n"]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to update the \
         stack. CloudFormation uses the role's credentials to make calls on your behalf. \
         CloudFormation always uses this role for all future operations on the stack. Provided \
         that users have permission to operate on the stack, CloudFormation uses this role even if \
         the users don't have permission to pass it. Ensure that the role grants least privilege.\n\n\
        \ If you don't specify a value, CloudFormation uses the role that was previously \
         associated with the stack. If no role is available, CloudFormation uses a temporary \
         session that is generated from your user credentials.\n\
        \ "]
  resource_types : resource_types option;
      [@ocaml.doc
        "Specifies which resource types you can work with, such as [AWS::EC2::Instance] or \
         [Custom::MyCustomInstance].\n\n\
        \ If the list of resource types doesn't include a resource that you're updating, the stack \
         update fails. By default, CloudFormation grants permissions to all resource types. IAM \
         uses this parameter for CloudFormation-specific condition keys in IAM policies. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html}Control \
         CloudFormation access with Identity and Access Management}.\n\
        \ \n\
        \   Only one of the [Capabilities] and [ResourceType] parameters can be specified.\n\
        \   \n\
        \    "]
  capabilities : capabilities option;
      [@ocaml.doc
        "In some cases, you must explicitly acknowledge that your stack template contains certain \
         capabilities in order for CloudFormation to update the stack.\n\n\
        \ {ul\n\
        \       {-   [CAPABILITY_IAM] and [CAPABILITY_NAMED_IAM] \n\
        \           \n\
        \            Some stack templates might include resources that can affect permissions in \
         your Amazon Web Services account, for example, by creating new IAM users. For those \
         stacks, you must explicitly acknowledge this by specifying one of these capabilities.\n\
        \            \n\
        \             The following IAM resources require you to specify either the \
         [CAPABILITY_IAM] or [CAPABILITY_NAMED_IAM] capability.\n\
        \             \n\
        \              {ul\n\
        \                    {-  If you have IAM resources, you can specify either capability.\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you have IAM resources with custom names, you {i must} specify \
         [CAPABILITY_NAMED_IAM].\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you don't specify either of these capabilities, CloudFormation \
         returns an [InsufficientCapabilities] error.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \        }\n\
        \         If your stack template contains these resources, we suggest that you review all \
         permissions associated with them and edit their permissions if necessary.\n\
        \         \n\
        \          {ul\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-accesskey.html} \
         AWS::IAM::AccessKey} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-group.html} \
         AWS::IAM::Group} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-instanceprofile.html}AWS::IAM::InstanceProfile} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-managedpolicy.html} \
         AWS::IAM::ManagedPolicy} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-policy.html}AWS::IAM::Policy} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-role.html} \
         AWS::IAM::Role} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-user.html} \
         AWS::IAM::User} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-usertogroupaddition.html}AWS::IAM::UserToGroupAddition} \n\
        \                    \n\
        \                     }\n\
        \                \n\
        \        }\n\
        \         For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities}Acknowledging \
         IAM resources in CloudFormation templates}.\n\
        \         \n\
        \          }\n\
        \       {-   [CAPABILITY_AUTO_EXPAND] \n\
        \           \n\
        \            Some template contain macros. Macros perform custom processing on templates; \
         this can include simple actions like find-and-replace operations, all the way to \
         extensive transformations of entire templates. Because of this, users typically create a \
         change set from the processed template, so that they can review the changes resulting \
         from the macros before actually updating the stack. If your stack template contains one \
         or more macros, and you choose to update a stack directly from the processed template, \
         without first reviewing the resulting changes in a change set, you must acknowledge this \
         capability. This includes the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-include.html}AWS::Include} \
         and \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html}AWS::Serverless} \
         transforms, which are macros hosted by CloudFormation.\n\
        \            \n\
        \             If you want to update a stack from a stack template that contains macros {i \
         and} nested stacks, you must update the stack directly from the template using this \
         capability.\n\
        \             \n\
        \               You should only update stacks directly from a stack template that contains \
         macros if you know what processing the macro performs.\n\
        \               \n\
        \                Each macro relies on an underlying Lambda service function for processing \
         stack templates. Be aware that the Lambda function owner can update the function \
         operation without CloudFormation being notified.\n\
        \                \n\
        \                  For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html}Perform \
         custom processing on CloudFormation templates with template macros}.\n\
        \                  \n\
        \                   }\n\
        \       }\n\
        \    Only one of the [Capabilities] and [ResourceType] parameters can be specified.\n\
        \    \n\
        \     "]
  parameters : parameters option;
      [@ocaml.doc
        "A list of [Parameter] structures that specify input parameters for the stack. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html}Parameter} \
         data type.\n"]
  stack_policy_during_update_ur_l : stack_policy_during_update_ur_l option;
      [@ocaml.doc
        "Location of a file that contains the temporary overriding stack policy. The URL must \
         point to a policy (max size: 16KB) located in an S3 bucket in the same Region as the \
         stack. The location for an Amazon S3 bucket must start with [https://]. URLs from S3 \
         static websites are not supported.\n\n\
        \ You can specify either the [StackPolicyDuringUpdateBody] or the \
         [StackPolicyDuringUpdateURL] parameter, but not both.\n\
        \ \n\
        \  If you want to update protected resources, specify a temporary overriding stack policy \
         during this update. If you don't specify a stack policy, the current policy that is \
         associated with the stack will be used.\n\
        \  "]
  stack_policy_during_update_body : stack_policy_during_update_body option;
      [@ocaml.doc
        "Structure that contains the temporary overriding stack policy body. You can specify \
         either the [StackPolicyDuringUpdateBody] or the [StackPolicyDuringUpdateURL] parameter, \
         but not both.\n\n\
        \ If you want to update protected resources, specify a temporary overriding stack policy \
         during this update. If you don't specify a stack policy, the current policy that is \
         associated with the stack will be used.\n\
        \ "]
  use_previous_template : use_previous_template option;
      [@ocaml.doc
        "Reuse the existing template that is associated with the stack that you are updating.\n\n\
        \ When using templates with the [AWS::LanguageExtensions] transform, provide the template \
         instead of using [UsePreviousTemplate] to ensure new parameter values and Systems Manager \
         parameter updates are applied correctly. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/transform-aws-languageextensions.html}AWS::LanguageExtensions \
         transform}.\n\
        \ \n\
        \  Conditional: You must specify only one of the following parameters: [TemplateBody], \
         [TemplateURL], or set the [UsePreviousTemplate] to [true].\n\
        \  "]
  template_ur_l : template_ur_l option;
      [@ocaml.doc
        "The URL of a file that contains the template body. The URL must point to a template \
         that's located in an Amazon S3 bucket or a Systems Manager document. The location for an \
         Amazon S3 bucket must start with [https://].\n\n\
        \ Conditional: You must specify only one of the following parameters: [TemplateBody], \
         [TemplateURL], or set the [UsePreviousTemplate] to [true].\n\
        \ "]
  template_body : template_body option;
      [@ocaml.doc
        "Structure that contains the template body with a minimum length of 1 byte and a maximum \
         length of 51,200 bytes.\n\n\
        \ Conditional: You must specify only one of the following parameters: [TemplateBody], \
         [TemplateURL], or set the [UsePreviousTemplate] to [true].\n\
        \ "]
  stack_name : stack_name; [@ocaml.doc "The name or unique stack ID of the stack to update.\n"]
}
[@@ocaml.doc "The input for an [UpdateStack] action.\n"]

type nonrec token_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A client request token already exists.\n"]

type nonrec insufficient_capabilities_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The template contains resources with capabilities that weren't specified in the Capabilities \
   parameter.\n"]

type nonrec generated_template_id = string [@@ocaml.doc ""]

type nonrec update_generated_template_output = {
  generated_template_id : generated_template_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the generated template. The format is \
         [arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}]. For \
         example, \n\
         {[\n\
         arn:aws:cloudformation:{i us-east-1}:{i 123456789012}:generatedtemplate/{i \
         2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc} \n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec generated_template_name = string [@@ocaml.doc ""]

type nonrec logical_resource_id = string [@@ocaml.doc ""]

type nonrec resource_identifier_property_value = string [@@ocaml.doc ""]

type nonrec resource_identifier_property_key = string [@@ocaml.doc ""]

type nonrec resource_identifier_properties =
  (resource_identifier_property_key * resource_identifier_property_value) list
[@@ocaml.doc ""]

type nonrec resource_definition = {
  resource_identifier : resource_identifier_properties;
      [@ocaml.doc
        "A list of up to 256 key-value pairs that identifies the scanned resource. The key is the \
         name of one of the primary identifiers for the resource. (Primary identifiers are \
         specified in the [primaryIdentifier] list in the resource schema.) The value is the value \
         of that primary identifier. For example, for a [AWS::DynamoDB::Table] resource, the \
         primary identifiers is [TableName] so the key-value pair could be [\"TableName\":\n\
        \    \"MyDDBTable\"]. For more information, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier}primaryIdentifier} \
         in the {i CloudFormation Command Line Interface (CLI) User Guide}.\n"]
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc "The logical resource id for this resource in the generated template.\n"]
  resource_type : resource_type;
      [@ocaml.doc
        "The type of the resource, such as [AWS::DynamoDB::Table]. For the list of supported \
         resources, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support for imports and drift detection} in the {i CloudFormation User Guide} \n"]
}
[@@ocaml.doc
  "A resource included in a generated template. This data type is used with the \
   [CreateGeneratedTemplate] and [UpdateGeneratedTemplate] API actions.\n"]

type nonrec resource_definitions = resource_definition list [@@ocaml.doc ""]

type nonrec jazz_logical_resource_ids = logical_resource_id list [@@ocaml.doc ""]

type nonrec refresh_all_resources = bool [@@ocaml.doc ""]

type nonrec generated_template_deletion_policy = RETAIN [@ocaml.doc ""] | DELETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec generated_template_update_replace_policy =
  | RETAIN [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec template_configuration = {
  update_replace_policy : generated_template_update_replace_policy option;
      [@ocaml.doc
        "The [UpdateReplacePolicy] assigned to resources in the generated template. Supported \
         values are:\n\n\
        \ {ul\n\
        \       {-   [DELETE] - delete all resources when the resource is replaced during an \
         update operation.\n\
        \           \n\
        \            }\n\
        \       {-   [RETAIN] - retain all resources when the resource is replaced during an \
         update operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-updatereplacepolicy.html}UpdateReplacePolicy \
         attribute} in the {i CloudFormation User Guide}.\n\
        \   "]
  deletion_policy : generated_template_deletion_policy option;
      [@ocaml.doc
        "The [DeletionPolicy] assigned to resources in the generated template. Supported values \
         are:\n\n\
        \ {ul\n\
        \       {-   [DELETE] - delete all resources when the stack is deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [RETAIN] - retain all resources when the stack is deleted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-deletionpolicy.html}DeletionPolicy \
         attribute} in the {i CloudFormation User Guide}.\n\
        \   "]
}
[@@ocaml.doc "The configuration details of a generated template.\n"]

type nonrec update_generated_template_input = {
  template_configuration : template_configuration option;
      [@ocaml.doc
        "The configuration details of the generated template, including the [DeletionPolicy] and \
         [UpdateReplacePolicy].\n"]
  refresh_all_resources : refresh_all_resources option;
      [@ocaml.doc
        "If [true], update the resource properties in the generated template with their current \
         live state. This feature is useful when the resource properties in your generated a \
         template does not reflect the live state of the resource properties. This happens when a \
         user update the resource properties after generating a template.\n"]
  remove_resources : jazz_logical_resource_ids option;
      [@ocaml.doc "A list of logical ids for resources to remove from the generated template.\n"]
  add_resources : resource_definitions option;
      [@ocaml.doc "An optional list of resources to be added to the generated template.\n"]
  new_generated_template_name : generated_template_name option;
      [@ocaml.doc "An optional new name to assign to the generated template.\n"]
  generated_template_name : generated_template_name;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) of a generated template.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The quota for the resource has already been reached.\n\n\
  \ For information about resource and stack limitations, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html}CloudFormation \
   quotas} in the {i CloudFormation User Guide}.\n\
  \ "]

type nonrec generated_template_not_found_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The generated template was not found.\n"]

type nonrec already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource with the name requested already exists.\n"]

type nonrec type_arn = string [@@ocaml.doc ""]

type nonrec type_configuration_alias = string [@@ocaml.doc ""]

type nonrec type_configuration_arn = string [@@ocaml.doc ""]

type nonrec third_party_type =
  | HOOK [@ocaml.doc ""]
  | MODULE [@ocaml.doc ""]
  | RESOURCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec type_name = string [@@ocaml.doc ""]

type nonrec type_configuration_identifier = {
  type_name : type_name option;
      [@ocaml.doc "The name of the extension type to which this configuration applies.\n"]
  type_ : third_party_type option; [@ocaml.doc "The type of extension.\n"]
  type_configuration_arn : type_configuration_arn option;
      [@ocaml.doc "The ARN for the configuration, in this account and Region.\n"]
  type_configuration_alias : type_configuration_alias option;
      [@ocaml.doc
        "The alias specified for this configuration, if one was specified when the configuration \
         was set.\n"]
  type_arn : type_arn option;
      [@ocaml.doc
        "The ARN for the extension, in this account and Region.\n\n\
        \ For public extensions, this will be the ARN assigned when you call the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html}ActivateType} \
         API operation in this account and Region. For private extensions, this will be the ARN \
         assigned when you call the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType} \
         API operation in this account and Region.\n\
        \ "]
}
[@@ocaml.doc "Identifying information for the configuration of a CloudFormation extension.\n"]

type nonrec unprocessed_type_configurations = type_configuration_identifier list [@@ocaml.doc ""]

type nonrec registry_type =
  | HOOK [@ocaml.doc ""]
  | MODULE [@ocaml.doc ""]
  | RESOURCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec type_version_id = string [@@ocaml.doc ""]

type nonrec is_default_version = bool [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec public_version_number = string [@@ocaml.doc ""]

type nonrec type_version_summary = {
  public_version_number : public_version_number option;
      [@ocaml.doc
        "For public extensions that have been activated for this account and Region, the version \
         of the public extension to be used for CloudFormation operations in this account and \
         Region. For any extensions other than activated third-party extensions, CloudFormation \
         returns [null].\n\n\
        \ How you specified [AutoUpdate] when enabling the extension affects whether \
         CloudFormation automatically updates the extension in this account and Region when a new \
         version is released. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto}Automatically \
         use new versions of extensions} in the {i CloudFormation User Guide}.\n\
        \ "]
  description : description option; [@ocaml.doc "The description of the extension version.\n"]
  time_created : timestamp option; [@ocaml.doc "When the version was registered.\n"]
  arn : type_arn option; [@ocaml.doc "The ARN of the extension version.\n"]
  is_default_version : is_default_version option;
      [@ocaml.doc
        "Whether the specified extension version is set as the default version.\n\n\
        \ This applies only to private extensions you have registered in your account, and \
         extensions published by Amazon. For public third-party extensions, CloudFormation returns \
         [null].\n\
        \ "]
  version_id : type_version_id option;
      [@ocaml.doc
        "The ID of a specific version of the extension. The version ID is the value at the end of \
         the ARN assigned to the extension version when it's registered.\n"]
  type_name : type_name option; [@ocaml.doc "The name of the extension.\n"]
  type_ : registry_type option; [@ocaml.doc "The kind of extension.\n"]
}
[@@ocaml.doc
  "Contains summary information about a specific version of a CloudFormation extension.\n"]

type nonrec type_version_summaries = type_version_summary list [@@ocaml.doc ""]

type nonrec type_tests_status_description = string [@@ocaml.doc ""]

type nonrec type_tests_status =
  | NOT_TESTED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | PASSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec publisher_id = string [@@ocaml.doc ""]

type nonrec identity_provider =
  | Bitbucket [@ocaml.doc ""]
  | GitHub [@ocaml.doc ""]
  | AWS_Marketplace [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec publisher_name = string [@@ocaml.doc ""]

type nonrec is_activated = bool [@@ocaml.doc ""]

type nonrec type_summary = {
  is_activated : is_activated option;
      [@ocaml.doc
        "Whether the extension is activated for this account and Region.\n\n\
        \ This applies only to third-party public extensions. Extensions published by Amazon are \
         activated by default.\n\
        \ "]
  publisher_name : publisher_name option;
      [@ocaml.doc
        "The publisher name, as defined in the public profile for that publisher in the service \
         used to verify the publisher identity.\n"]
  publisher_identity : identity_provider option;
      [@ocaml.doc
        "The service used to verify the publisher identity.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html}Publishing \
         extensions to make them available for public use} in the {i CloudFormation Command Line \
         Interface (CLI) User Guide}.\n\
        \ "]
  latest_public_version : public_version_number option;
      [@ocaml.doc
        "For public extensions that have been activated for this account and Region, the latest \
         version of the public extension {i that is available}. For any extensions other than \
         activated third-party extensions, CloudFormation returns [null].\n\n\
        \ How you specified [AutoUpdate] when enabling the extension affects whether \
         CloudFormation automatically updates the extension in this account and Region when a new \
         version is released. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto}Automatically \
         use new versions of extensions} in the {i CloudFormation User Guide}.\n\
        \ "]
  public_version_number : public_version_number option;
      [@ocaml.doc
        "For public extensions that have been activated for this account and Region, the version \
         of the public extension to be used for CloudFormation operations in this account and \
         Region.\n\n\
        \ How you specified [AutoUpdate] when enabling the extension affects whether \
         CloudFormation automatically updates the extension in this account and Region when a new \
         version is released. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto}Automatically \
         use new versions of extensions} in the {i CloudFormation User Guide}.\n\
        \ "]
  original_type_name : type_name option;
      [@ocaml.doc
        "For public extensions that have been activated for this account and Region, the type name \
         of the public extension.\n\n\
        \ If you specified a [TypeNameAlias] when enabling the extension in this account and \
         Region, CloudFormation treats that alias as the extension's type name within the account \
         and Region, not the type name of the public extension. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-alias}Use \
         aliases to refer to extensions} in the {i CloudFormation User Guide}.\n\
        \ "]
  publisher_id : publisher_id option;
      [@ocaml.doc
        "The ID of the extension publisher, if the extension is published by a third party. \
         Extensions published by Amazon don't return a publisher ID.\n"]
  description : description option; [@ocaml.doc "The description of the extension.\n"]
  last_updated : timestamp option;
      [@ocaml.doc
        "When the specified extension version was registered. This applies only to:\n\n\
        \ {ul\n\
        \       {-  Private extensions you have registered in your account. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType}.\n\
        \           \n\
        \            }\n\
        \       {-  Public extensions you have activated in your account with auto-update \
         specified. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html}ActivateType}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For all other extension types, CloudFormation returns [null].\n\
        \   "]
  type_arn : type_arn option; [@ocaml.doc "The ARN of the extension.\n"]
  default_version_id : type_version_id option;
      [@ocaml.doc
        "The ID of the default version of the extension. The default version is used when the \
         extension version isn't specified.\n\n\
        \ This applies only to private extensions you have registered in your account. For public \
         extensions, both those provided by Amazon and published by third parties, CloudFormation \
         returns [null]. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType}.\n\
        \ \n\
        \  To set the default version of an extension, use [SetTypeDefaultVersion].\n\
        \  "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ If you specified a [TypeNameAlias] when you call the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html}ActivateType} \
         API operation in your account and Region, CloudFormation considers that alias as the type \
         name.\n\
        \ "]
  type_ : registry_type option; [@ocaml.doc "The kind of extension.\n"]
}
[@@ocaml.doc "Contains summary information about the specified CloudFormation extension.\n"]

type nonrec type_summaries = type_summary list [@@ocaml.doc ""]

type nonrec type_schema = string [@@ocaml.doc ""]

type nonrec type_not_found_exception = {
  message : error_message option;
      [@ocaml.doc "A message with details about the error that occurred.\n"]
}
[@@ocaml.doc "The specified extension doesn't exist in the CloudFormation registry.\n"]

type nonrec type_name_prefix = string [@@ocaml.doc ""]

type nonrec type_hierarchy = string [@@ocaml.doc ""]

type nonrec category =
  | AWS_TYPES [@ocaml.doc ""]
  | THIRD_PARTY [@ocaml.doc ""]
  | ACTIVATED [@ocaml.doc ""]
  | REGISTERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec type_filters = {
  type_name_prefix : type_name_prefix option;
      [@ocaml.doc "A prefix to use as a filter for results.\n"]
  publisher_id : publisher_id option;
      [@ocaml.doc
        "The id of the publisher of the extension.\n\n\
        \ Extensions published by Amazon aren't assigned a publisher ID. Use the [AWS_TYPES] \
         category to specify a list of types published by Amazon.\n\
        \ "]
  category : category option;
      [@ocaml.doc
        "The category of extensions to return.\n\n\
        \ {ul\n\
        \       {-   [REGISTERED]: Private extensions that have been registered for this account \
         and Region.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVATED]: Public extensions that have been activated for this account and \
         Region.\n\
        \           \n\
        \            }\n\
        \       {-   [THIRD_PARTY]: Extensions available for use from publishers other than \
         Amazon. This includes:\n\
        \           \n\
        \            {ul\n\
        \                  {-  Private extensions registered in the account.\n\
        \                      \n\
        \                       }\n\
        \                  {-  Public extensions from publishers other than Amazon, whether \
         activated or not.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [AWS_TYPES]: Extensions available for use from Amazon.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Filter criteria to use in determining which extensions to return.\n"]

type nonrec type_configuration_not_found_exception = {
  message : error_message option;
      [@ocaml.doc "A message with details about the error that occurred.\n"]
}
[@@ocaml.doc "The specified extension configuration can't be found.\n"]

type nonrec type_configuration_identifiers = type_configuration_identifier list [@@ocaml.doc ""]

type nonrec type_configuration = string [@@ocaml.doc ""]

type nonrec is_default_configuration = bool [@@ocaml.doc ""]

type nonrec type_configuration_details = {
  is_default_configuration : is_default_configuration option;
      [@ocaml.doc
        "Whether this configuration data is the default configuration for the extension.\n"]
  type_name : type_name option; [@ocaml.doc "The name of the extension.\n"]
  type_arn : type_arn option;
      [@ocaml.doc
        "The ARN for the extension, in this account and Region.\n\n\
        \ For public extensions, this will be the ARN assigned when you call the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html}ActivateType} \
         API operation in this account and Region. For private extensions, this will be the ARN \
         assigned when you call the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType} \
         API operation in this account and Region.\n\
        \ "]
  last_updated : timestamp option;
      [@ocaml.doc
        "When the configuration data was last updated for this extension.\n\n\
        \ If a configuration hasn't been set for a specified extension, CloudFormation returns \
         [null].\n\
        \ "]
  configuration : type_configuration option;
      [@ocaml.doc
        "A JSON string specifying the configuration data for the extension, in this account and \
         Region.\n\n\
        \ If a configuration hasn't been set for a specified extension, CloudFormation returns [{}].\n\
        \ "]
  alias : type_configuration_alias option;
      [@ocaml.doc
        "The alias specified for this configuration, if one was specified when the configuration \
         was set.\n"]
  arn : type_configuration_arn option;
      [@ocaml.doc "The ARN for the configuration data, in this account and Region.\n"]
}
[@@ocaml.doc
  "Detailed information concerning the specification of a CloudFormation extension in a given \
   account and Region.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html}Edit \
   configuration data for extensions in your account} in the {i CloudFormation User Guide}.\n\
  \ "]

type nonrec type_configuration_details_list = type_configuration_details list [@@ocaml.doc ""]

type nonrec treat_unrecognized_resource_types_as_warnings = bool [@@ocaml.doc ""]

type nonrec total_warnings = int [@@ocaml.doc ""]

type nonrec total_stack_instances_count = int [@@ocaml.doc ""]

type nonrec timeout_minutes = int [@@ocaml.doc ""]

type nonrec third_party_type_arn = string [@@ocaml.doc ""]

type nonrec test_type_output = {
  type_version_arn : type_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the extension.\n"]
}
[@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec test_type_input = {
  log_delivery_bucket : s3_bucket option;
      [@ocaml.doc
        "The S3 bucket to which CloudFormation delivers the contract test execution logs.\n\n\
        \ CloudFormation delivers the logs by the time contract testing has completed and the \
         extension has been assigned a test type status of [PASSED] or [FAILED].\n\
        \ \n\
        \  The user calling [TestType] must be able to access items in the specified S3 bucket. \
         Specifically, the user needs the following permissions:\n\
        \  \n\
        \   {ul\n\
        \         {-   [GetObject] \n\
        \             \n\
        \              }\n\
        \         {-   [PutObject] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazons3.html}Actions, \
         Resources, and Condition Keys for Amazon S3} in the {i Identity and Access Management \
         User Guide}.\n\
        \   "]
  version_id : type_version_id option;
      [@ocaml.doc
        "The version of the extension to test.\n\n\
        \ You can specify the version id with either [Arn], or with [TypeName] and [Type].\n\
        \ \n\
        \  If you don't specify a version, CloudFormation uses the default version of the \
         extension in this account and Region for testing.\n\
        \  "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension to test.\n\n\
        \ Conditional: You must specify [Arn], or [TypeName] and [Type].\n\
        \ "]
  type_ : third_party_type option;
      [@ocaml.doc
        "The type of the extension to test.\n\n\
        \ Conditional: You must specify [Arn], or [TypeName] and [Type].\n\
        \ "]
  arn : type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the extension.\n\n\
        \ Conditional: You must specify [Arn], or [TypeName] and [Type].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec cfn_registry_exception = {
  message : error_message option;
      [@ocaml.doc "A message with details about the error that occurred.\n"]
}
[@@ocaml.doc "An error occurred during a CloudFormation registry operation.\n"]

type nonrec template_summary_config = {
  treat_unrecognized_resource_types_as_warnings :
    treat_unrecognized_resource_types_as_warnings option;
      [@ocaml.doc
        "If set to [True], any unrecognized resource types generate warnings and not an error. Any \
         unrecognized resource types are returned in the [Warnings] output parameter.\n"]
}
[@@ocaml.doc "Options for the [GetTemplateSummary] API action.\n"]

type nonrec generated_template_status =
  | COMPLETE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_PENDING [@ocaml.doc ""]
  | UPDATE_PENDING [@ocaml.doc ""]
  | CREATE_PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec template_status_reason = string [@@ocaml.doc ""]

type nonrec creation_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec last_updated_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec number_of_resources = int [@@ocaml.doc ""]

type nonrec template_summary = {
  number_of_resources : number_of_resources option;
      [@ocaml.doc
        "The number of resources in the generated template. This is a total of resources in \
         pending, in-progress, completed, and failed states.\n"]
  last_updated_time : last_updated_time option;
      [@ocaml.doc "The time the generated template was last updated.\n"]
  creation_time : creation_time option;
      [@ocaml.doc "The time the generated template was created.\n"]
  status_reason : template_status_reason option;
      [@ocaml.doc
        "The reason for the current template generation status. This will provide more details if \
         a failure happened.\n"]
  status : generated_template_status option;
      [@ocaml.doc
        "The status of the template generation. Supported values are:\n\n\
        \ {ul\n\
        \       {-   [CreatePending] - the creation of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [CreateInProgress] - the creation of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [DeletePending] - the deletion of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [DeleteInProgress] - the deletion of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [UpdatePending] - the update of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [UpdateInProgress] - the update of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed] - the template operation failed.\n\
        \           \n\
        \            }\n\
        \       {-   [Complete] - the template operation is complete.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  generated_template_name : generated_template_name option;
      [@ocaml.doc "The name of the generated template.\n"]
  generated_template_id : generated_template_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the generated template. The format is \
         [arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}]. For \
         example, \n\
         {[\n\
         arn:aws:cloudformation:{i us-east-1}:{i 123456789012}:generatedtemplate/{i \
         2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc} \n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc "The summary of a generated template.\n"]

type nonrec template_summaries = template_summary list [@@ocaml.doc ""]

type nonrec template_stage = Processed [@ocaml.doc ""] | Original [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec resources_succeeded = int [@@ocaml.doc ""]

type nonrec resources_failed = int [@@ocaml.doc ""]

type nonrec resources_processing = int [@@ocaml.doc ""]

type nonrec resources_pending = int [@@ocaml.doc ""]

type nonrec template_progress = {
  resources_pending : resources_pending option;
      [@ocaml.doc "The number of resources that are still pending the template generation.\n"]
  resources_processing : resources_processing option;
      [@ocaml.doc "The number of resources that are in-process for the template generation.\n"]
  resources_failed : resources_failed option;
      [@ocaml.doc "The number of resources that failed the template generation.\n"]
  resources_succeeded : resources_succeeded option;
      [@ocaml.doc "The number of resources that succeeded the template generation.\n"]
}
[@@ocaml.doc "A summary of the progress of the template generation.\n"]

type nonrec template_format = YAML [@ocaml.doc ""] | JSON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec template_description = string [@@ocaml.doc ""]

type nonrec supported_major_version = int [@@ocaml.doc ""]

type nonrec supported_major_versions = supported_major_version list [@@ocaml.doc ""]

type nonrec stop_stack_set_operation_output = unit [@@ocaml.doc ""]

type nonrec stop_stack_set_operation_input = {
  call_as : call_as option;
      [@ocaml.doc
        "Specifies whether you are acting as an account administrator in the organization's \
         management account or as a delegated administrator in a member account. Valid only if the \
         StackSet uses service-managed permissions.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  operation_id : client_request_token; [@ocaml.doc "The ID of the stack operation.\n"]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you want to stop the operation for.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified ID refers to an operation that doesn't exist.\n"]

type nonrec status_message = string [@@ocaml.doc ""]

type nonrec resource_scan_id = string [@@ocaml.doc ""]

type nonrec start_resource_scan_output = {
  resource_scan_id : resource_scan_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource scan. The format is \
         [arn:${Partition}:cloudformation:${Region}:${Account}:resourceScan/${Id}]. An example is \n\
         {[\n\
         arn:aws:cloudformation:{i us-east-1}:{i 123456789012}:resourceScan/{i \
         f5b490f7-7ed4-428a-aa06-31ff25db0772} \n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec resource_type_filter = string [@@ocaml.doc ""]

type nonrec resource_type_filters = resource_type_filter list [@@ocaml.doc ""]

type nonrec scan_filter = {
  types : resource_type_filters option;
      [@ocaml.doc
        "An array of strings where each string represents an Amazon Web Services resource type you \
         want to scan. Each string defines the resource type using the format \
         [AWS::ServiceName::ResourceType], for example, [AWS::DynamoDB::Table]. For the full list \
         of supported resource types, see the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support} table in the {i CloudFormation User Guide}.\n\n\
        \ To scan all resource types within a service, you can use a wildcard, represented by an \
         asterisk ([*]). You can place an asterisk at only the end of the string, for example, \
         [AWS::S3::*].\n\
        \ "]
}
[@@ocaml.doc "A filter that is used to specify which resource types to scan.\n"]

type nonrec scan_filters = scan_filter list [@@ocaml.doc ""]

type nonrec start_resource_scan_input = {
  scan_filters : scan_filters option; [@ocaml.doc "The scan filters to use.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique identifier for this [StartResourceScan] request. Specify this token if you plan \
         to retry requests so that CloudFormation knows that you're not attempting to start a new \
         resource scan.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_scan_limit_exceeded_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The limit on resource scans has been exceeded. Reasons include:\n\n\
  \ {ul\n\
  \       {-  Exceeded the daily quota for resource scans.\n\
  \           \n\
  \            }\n\
  \       {-  A resource scan recently failed. You must wait 10 minutes before starting a new \
   resource scan.\n\
  \           \n\
  \            }\n\
  \       {-  The last resource scan failed after exceeding 100,000 resources. When this happens, \
   you must wait 24 hours before starting a new resource scan.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec resource_scan_in_progress_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "A resource scan is currently in progress. Only one can be run at a time for an account in a \
   Region.\n"]

type nonrec stage_list = template_stage list [@@ocaml.doc ""]

type nonrec change_set_id = string [@@ocaml.doc ""]

type nonrec deletion_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec stack_status =
  | IMPORT_ROLLBACK_COMPLETE [@ocaml.doc ""]
  | IMPORT_ROLLBACK_FAILED [@ocaml.doc ""]
  | IMPORT_ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | IMPORT_COMPLETE [@ocaml.doc ""]
  | IMPORT_IN_PROGRESS [@ocaml.doc ""]
  | REVIEW_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_ROLLBACK_COMPLETE [@ocaml.doc ""]
  | UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_ROLLBACK_FAILED [@ocaml.doc ""]
  | UPDATE_ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_COMPLETE [@ocaml.doc ""]
  | UPDATE_COMPLETE_CLEANUP_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | ROLLBACK_COMPLETE [@ocaml.doc ""]
  | ROLLBACK_FAILED [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_status_reason = string [@@ocaml.doc ""]

type nonrec output_key = string [@@ocaml.doc ""]

type nonrec output_value = string [@@ocaml.doc ""]

type nonrec export_name = string [@@ocaml.doc ""]

type nonrec output = {
  export_name : export_name option;
      [@ocaml.doc "The name of the export associated with the output.\n"]
  description : description option;
      [@ocaml.doc "User defined description associated with the output.\n"]
  output_value : output_value option; [@ocaml.doc "The value associated with the output.\n"]
  output_key : output_key option; [@ocaml.doc "The key associated with the output.\n"]
}
[@@ocaml.doc "The [Output] data type.\n"]

type nonrec outputs = output list [@@ocaml.doc ""]

type nonrec stack_drift_status =
  | NOT_CHECKED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | IN_SYNC [@ocaml.doc ""]
  | DRIFTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_drift_information = {
  last_check_timestamp : timestamp option;
      [@ocaml.doc
        "Most recent time when a drift detection operation was initiated on the stack, or any of \
         its individual resources that support drift detection.\n"]
  stack_drift_status : stack_drift_status;
      [@ocaml.doc
        "Status of the stack's actual configuration compared to its expected template \
         configuration.\n\n\
        \ {ul\n\
        \       {-   [DRIFTED]: The stack differs from its expected template configuration. A \
         stack is considered to have drifted if one or more of its resources have drifted.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation hasn't checked if the stack differs from its \
         expected template configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The stack's actual configuration matches its expected template \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN]: CloudFormation could not run drift detection for a resource in the \
         stack.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Contains information about whether the stack's actual configuration differs, or has {i \
   drifted}, from its expected configuration, as defined in the stack template and any values \
   specified as template parameters. A stack is considered to have drifted if one or more of its \
   resources have drifted.\n"]

type nonrec deletion_mode = FORCE_DELETE_STACK [@ocaml.doc ""] | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec detailed_status =
  | VALIDATION_FAILED [@ocaml.doc ""]
  | CONFIGURATION_COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation_type =
  | CREATE_CHANGESET [@ocaml.doc ""]
  | ROLLBACK [@ocaml.doc ""]
  | CONTINUE_ROLLBACK [@ocaml.doc ""]
  | DELETE_STACK [@ocaml.doc ""]
  | UPDATE_STACK [@ocaml.doc ""]
  | CREATE_STACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation_entry = {
  operation_id : operation_id option; [@ocaml.doc "The unique identifier for the operation.\n"]
  operation_type : operation_type option; [@ocaml.doc "The type of operation.\n"]
}
[@@ocaml.doc "Contains information about a CloudFormation operation.\n"]

type nonrec last_operations = operation_entry list [@@ocaml.doc ""]

type nonrec stack = {
  last_operations : last_operations option;
      [@ocaml.doc "Information about the most recent operations performed on this stack.\n"]
  detailed_status : detailed_status option;
      [@ocaml.doc
        "The detailed status of the resource or stack. If [CONFIGURATION_COMPLETE] is present, the \
         resource or resource configuration phase has completed and the stabilization of the \
         resources is in progress. The StackSets [CONFIGURATION_COMPLETE] when all of the \
         resources in the stack have reached that event. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html}Understand \
         CloudFormation stack creation events} in the {i CloudFormation User Guide}.\n"]
  deletion_mode : deletion_mode option;
      [@ocaml.doc
        "Specifies the deletion mode for the stack. Possible values are:\n\n\
        \ {ul\n\
        \       {-   [STANDARD] - Use the standard behavior. Specifying this value is the same as \
         not specifying this parameter.\n\
        \           \n\
        \            }\n\
        \       {-   [FORCE_DELETE_STACK] - Delete the stack if it's stuck in a [DELETE_FAILED] \
         state due to resource deletion failure.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  retain_except_on_create : retain_except_on_create option;
      [@ocaml.doc
        "When set to [true], newly created resources are deleted when the operation rolls back. \
         This includes newly created resources marked with a deletion policy of [Retain].\n\n\
        \ Default: [false] \n\
        \ "]
  drift_information : stack_drift_information option;
      [@ocaml.doc
        "Information about whether a stack's actual configuration differs, or has {i drifted}, \
         from its expected configuration, as defined in the stack template and any values \
         specified as template parameters. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
         unmanaged configuration changes to stacks and resources with drift detection}.\n"]
  root_id : stack_id option;
      [@ocaml.doc
        "For nested stacks, the stack ID of the top-level stack to which the nested stack \
         ultimately belongs.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html}Nested \
         stacks} in the {i CloudFormation User Guide}.\n\
        \ "]
  parent_id : stack_id option;
      [@ocaml.doc
        "For nested stacks, the stack ID of the direct parent of this stack. For the first level \
         of nested stacks, the root stack is also the parent stack.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html}Nested \
         stacks} in the {i CloudFormation User Guide}.\n\
        \ "]
  enable_termination_protection : enable_termination_protection option;
      [@ocaml.doc
        "Whether termination protection is enabled for the stack.\n\n\
        \ For \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html}nested \
         stacks}, termination protection is set on the root stack and can't be changed directly on \
         the nested stack. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html}Protect \
         a CloudFormation stack from being deleted} in the {i CloudFormation User Guide}.\n\
        \ "]
  tags : tags option; [@ocaml.doc "A list of [Tag]s that specify information about the stack.\n"]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that's associated with the stack. During a \
         stack operation, CloudFormation uses this role's credentials to make calls on your behalf.\n"]
  outputs : outputs option; [@ocaml.doc "A list of output structures.\n"]
  capabilities : capabilities option; [@ocaml.doc "The capabilities allowed in the stack.\n"]
  timeout_in_minutes : timeout_minutes option;
      [@ocaml.doc "The amount of time within which stack creation should complete.\n"]
  notification_ar_ns : notification_ar_ns option;
      [@ocaml.doc
        "Amazon SNS topic Amazon Resource Names (ARNs) to which stack related events are published.\n"]
  deployment_config : deployment_config option;
      [@ocaml.doc
        "The deployment configuration for the stack, including the deployment mode used for stack \
         operations.\n"]
  disable_rollback : disable_rollback option;
      [@ocaml.doc
        "Boolean to enable or disable rollback on stack creation failures:\n\n\
        \ {ul\n\
        \       {-   [true]: disable rollback.\n\
        \           \n\
        \            }\n\
        \       {-   [false]: enable rollback.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stack_status_reason : stack_status_reason option;
      [@ocaml.doc "Success/failure message associated with the stack status.\n"]
  stack_status : stack_status; [@ocaml.doc "Current status of the stack.\n"]
  rollback_configuration : rollback_configuration option;
      [@ocaml.doc
        "The rollback triggers for CloudFormation to monitor during stack creation and updating \
         operations, and for the specified monitoring period afterwards.\n"]
  last_updated_time : last_updated_time option;
      [@ocaml.doc
        "The time the stack was last updated. This field will only be returned if the stack has \
         been updated at least once.\n"]
  deletion_time : deletion_time option; [@ocaml.doc "The time the stack was deleted.\n"]
  creation_time : creation_time; [@ocaml.doc "The time at which the stack was created.\n"]
  parameters : parameters option; [@ocaml.doc "A list of [Parameter] structures.\n"]
  description : description option;
      [@ocaml.doc "A user-defined description associated with the stack.\n"]
  change_set_id : change_set_id option; [@ocaml.doc "The unique ID of the change set.\n"]
  stack_name : stack_name; [@ocaml.doc "The name associated with the stack.\n"]
  stack_id : stack_id option; [@ocaml.doc "Unique identifier of the stack.\n"]
}
[@@ocaml.doc "The [Stack] data type.\n"]

type nonrec stacks = stack list [@@ocaml.doc ""]

type nonrec stack_drift_information_summary = {
  last_check_timestamp : timestamp option;
      [@ocaml.doc
        "Most recent time when a drift detection operation was initiated on the stack, or any of \
         its individual resources that support drift detection.\n"]
  stack_drift_status : stack_drift_status;
      [@ocaml.doc
        "Status of the stack's actual configuration compared to its expected template \
         configuration.\n\n\
        \ {ul\n\
        \       {-   [DRIFTED]: The stack differs from its expected template configuration. A \
         stack is considered to have drifted if one or more of its resources have drifted.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation hasn't checked if the stack differs from its \
         expected template configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The stack's actual configuration matches its expected template \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN]: CloudFormation could not run drift detection for a resource in the \
         stack.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Contains information about whether the stack's actual configuration differs, or has {i \
   drifted}, from its expected configuration, as defined in the stack template and any values \
   specified as template parameters. A stack is considered to have drifted if one or more of its \
   resources have drifted.\n"]

type nonrec stack_summary = {
  last_operations : last_operations option;
      [@ocaml.doc "Information about the most recent operations performed on this stack.\n"]
  drift_information : stack_drift_information_summary option;
      [@ocaml.doc
        "Summarizes information about whether a stack's actual configuration differs, or has {i \
         drifted}, from its expected configuration, as defined in the stack template and any \
         values specified as template parameters. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
         unmanaged configuration changes to stacks and resources with drift detection}.\n"]
  root_id : stack_id option;
      [@ocaml.doc
        "For nested stacks, the stack ID of the top-level stack to which the nested stack \
         ultimately belongs.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html}Nested \
         stacks} in the {i CloudFormation User Guide}.\n\
        \ "]
  parent_id : stack_id option;
      [@ocaml.doc
        "For nested stacks, the stack ID of the direct parent of this stack. For the first level \
         of nested stacks, the root stack is also the parent stack.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html}Nested \
         stacks} in the {i CloudFormation User Guide}.\n\
        \ "]
  stack_status_reason : stack_status_reason option;
      [@ocaml.doc "Success/Failure message associated with the stack status.\n"]
  stack_status : stack_status; [@ocaml.doc "The current status of the stack.\n"]
  deletion_time : deletion_time option; [@ocaml.doc "The time the stack was deleted.\n"]
  last_updated_time : last_updated_time option;
      [@ocaml.doc
        "The time the stack was last updated. This field will only be returned if the stack has \
         been updated at least once.\n"]
  creation_time : creation_time; [@ocaml.doc "The time the stack was created.\n"]
  template_description : template_description option;
      [@ocaml.doc "The template description of the template used to create the stack.\n"]
  stack_name : stack_name; [@ocaml.doc "The name associated with the stack.\n"]
  stack_id : stack_id option; [@ocaml.doc "Unique stack identifier.\n"]
}
[@@ocaml.doc "The [StackSummary] Data Type\n"]

type nonrec stack_summaries = stack_summary list [@@ocaml.doc ""]

type nonrec stack_status_filter = stack_status list [@@ocaml.doc ""]

type nonrec stack_set_id = string [@@ocaml.doc ""]

type nonrec stack_set_status = DELETED [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec stack_set_summary = {
  managed_execution : managed_execution option;
      [@ocaml.doc
        "Describes whether StackSets performs non-conflicting operations concurrently and queues \
         conflicting operations.\n"]
  last_drift_check_timestamp : timestamp option;
      [@ocaml.doc
        "Most recent time when CloudFormation performed a drift detection operation on the \
         StackSet. This value will be [NULL] for any StackSet that drift detection hasn't yet been \
         performed on.\n"]
  drift_status : stack_drift_status option;
      [@ocaml.doc
        "Status of the StackSet's actual configuration compared to its expected template and \
         parameter configuration.\n\n\
        \ {ul\n\
        \       {-   [DRIFTED]: One or more of the stack instances belonging to the StackSet \
         differs from the expected template and parameter configuration. A stack instance is \
         considered to have drifted if one or more of the resources in the associated stack have \
         drifted.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation hasn't checked the StackSet for drift.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: All the stack instances belonging to the StackSet match the \
         expected template and parameter configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN]: This value is reserved for future use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  permission_model : permission_models option;
      [@ocaml.doc
        "Describes how the IAM roles required for StackSet operations are created.\n\n\
        \ {ul\n\
        \       {-  With [self-managed] permissions, you must create the administrator and \
         execution roles required to deploy to target accounts. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html}Grant \
         self-managed permissions}.\n\
        \           \n\
        \            }\n\
        \       {-  With [service-managed] permissions, StackSets automatically creates the IAM \
         roles required to deploy to accounts managed by Organizations. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html}Activate \
         trusted access for StackSets with Organizations}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  auto_deployment : auto_deployment option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Describes whether StackSets automatically deploys to \
         Organizations accounts that are added to a target organizational unit (OU).\n"]
  status : stack_set_status option; [@ocaml.doc "The status of the StackSet.\n"]
  description : description option;
      [@ocaml.doc
        "A description of the StackSet that you specify when the StackSet is created or updated.\n"]
  stack_set_id : stack_set_id option; [@ocaml.doc "The ID of the StackSet.\n"]
  stack_set_name : stack_set_name option; [@ocaml.doc "The name of the StackSet.\n"]
}
[@@ocaml.doc "The structures that contain summary information about the specified StackSet.\n"]

type nonrec stack_set_summaries = stack_set_summary list [@@ocaml.doc ""]

type nonrec stack_set_operation_action =
  | DETECT_DRIFT [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
  | UPDATE [@ocaml.doc ""]
  | CREATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_set_operation_status =
  | QUEUED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_set_operation_status_reason = string [@@ocaml.doc ""]

type nonrec failed_stack_instances_count = int [@@ocaml.doc ""]

type nonrec stack_set_operation_status_details = {
  failed_stack_instances_count : failed_stack_instances_count option;
      [@ocaml.doc "The number of stack instances for which the StackSet operation failed.\n"]
}
[@@ocaml.doc "Detailed information about the StackSet operation.\n"]

type nonrec stack_set_operation_summary = {
  operation_preferences : stack_set_operation_preferences option;
      [@ocaml.doc
        "The user-specified preferences for how CloudFormation performs a StackSet operation.\n\n\
        \ For more information about maximum concurrent accounts and failure tolerance, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options}StackSet \
         operation options}.\n\
        \ "]
  status_details : stack_set_operation_status_details option;
      [@ocaml.doc "Detailed information about the StackSet operation.\n"]
  status_reason : stack_set_operation_status_reason option;
      [@ocaml.doc "The status of the operation in details.\n"]
  end_timestamp : timestamp option;
      [@ocaml.doc
        "The time at which the StackSet operation ended, across all accounts and Regions \
         specified. Note that this doesn't necessarily mean that the StackSet operation was \
         successful, or even attempted, in each account or Region.\n"]
  creation_timestamp : timestamp option;
      [@ocaml.doc
        "The time at which the operation was initiated. Note that the creation times for the \
         StackSet operation might differ from the creation time of the individual stacks \
         themselves. This is because CloudFormation needs to perform preparatory work for the \
         operation, such as dispatching the work to the requested Regions, before actually \
         creating the first stacks.\n"]
  status : stack_set_operation_status option;
      [@ocaml.doc
        "The overall status of the operation.\n\n\
        \ {ul\n\
        \       {-   [FAILED]: The operation exceeded the specified failure tolerance. The failure \
         tolerance value that you've set for an operation is applied for each Region during stack \
         create and update operations. If the number of failed stacks within a Region exceeds the \
         failure tolerance, the status of the operation in the Region is set to [FAILED]. This in \
         turn sets the status of the operation as a whole to [FAILED], and CloudFormation cancels \
         the operation in any remaining Regions.\n\
        \           \n\
        \            }\n\
        \       {-   [QUEUED]: \\[Service-managed permissions\\] For automatic deployments that \
         require a sequence of operations, the operation is queued to be performed. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes}StackSet \
         status codes} in the {i CloudFormation User Guide}.\n\
        \           \n\
        \            }\n\
        \       {-   [RUNNING]: The operation is currently being performed.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED]: The user has canceled the operation.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPING]: The operation is in the process of stopping, at user request.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCEEDED]: The operation completed creating or updating all the specified \
         stacks without exceeding the failure tolerance for the operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  action : stack_set_operation_action option;
      [@ocaml.doc
        "The type of operation: [CREATE], [UPDATE], or [DELETE]. Create and delete operations \
         affect only the specified stack instances that are associated with the specified \
         StackSet. Update operations affect both the StackSet itself and {i all} associated \
         StackSet instances.\n"]
  operation_id : client_request_token option;
      [@ocaml.doc "The unique ID of the StackSet operation.\n"]
}
[@@ocaml.doc "The structures that contain summary information about the specified operation.\n"]

type nonrec stack_set_operation_summaries = stack_set_operation_summary list [@@ocaml.doc ""]

type nonrec stack_set_operation_result_status =
  | CANCELLED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reason = string [@@ocaml.doc ""]

type nonrec account_gate_status =
  | SKIPPED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_gate_status_reason = string [@@ocaml.doc ""]

type nonrec account_gate_result = {
  status_reason : account_gate_status_reason option;
      [@ocaml.doc
        "The reason for the account gate status assigned to this account and Region for the \
         StackSet operation.\n"]
  status : account_gate_status option;
      [@ocaml.doc
        "The status of the account gate function.\n\n\
        \ {ul\n\
        \       {-   [SUCCEEDED]: The account gate function has determined that the account and \
         Region passes any requirements for a StackSet operation to occur. CloudFormation proceeds \
         with the stack operation in that account and Region.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED]: The account gate function has determined that the account and \
         Region doesn't meet the requirements for a StackSet operation to occur. CloudFormation \
         cancels the StackSet operation in that account and Region, and sets the StackSet \
         operation result status for that account and Region to [FAILED].\n\
        \           \n\
        \            }\n\
        \       {-   [SKIPPED]: CloudFormation has skipped calling the account gate function for \
         this account and Region, for one of the following reasons:\n\
        \           \n\
        \            {ul\n\
        \                  {-  An account gate function hasn't been specified for the account and \
         Region. CloudFormation proceeds with the StackSet operation in this account and Region.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The [AWSCloudFormationStackSetExecutionRole] of the administration \
         account lacks permissions to invoke the function. CloudFormation proceeds with the \
         StackSet operation in this account and Region.\n\
        \                      \n\
        \                       }\n\
        \                  {-  Either no action is necessary, or no action is possible, on the \
         stack. CloudFormation skips the StackSet operation in this account and Region.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Structure that contains the results of the account gate function which CloudFormation invokes, \
   if present, before proceeding with a StackSet operation in an account and Region.\n\n\
  \ For each account and Region, CloudFormation lets you specify a Lambda function that \
   encapsulates any requirements that must be met before CloudFormation can proceed with a \
   StackSet operation in that account and Region. CloudFormation invokes the function each time a \
   StackSet operation is requested for that account and Region; if the function returns [FAILED], \
   CloudFormation cancels the operation in that account and Region, and sets the StackSet \
   operation result status for that account and Region to [FAILED].\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-account-gating.html}Prevent \
   failed StackSets deployments using target account gates} in the {i CloudFormation User Guide}.\n\
  \  "]

type nonrec stack_set_operation_result_summary = {
  organizational_unit_id : organizational_unit_id option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] The organization root ID or organizational unit (OU) \
         IDs that you specified for \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html}DeploymentTargets}.\n"]
  account_gate_result : account_gate_result option;
      [@ocaml.doc
        "The results of the account gate function CloudFormation invokes, if present, before \
         proceeding with StackSet operations in an account.\n"]
  status_reason : reason option; [@ocaml.doc "The reason for the assigned result status.\n"]
  status : stack_set_operation_result_status option;
      [@ocaml.doc
        "The result status of the StackSet operation for the given account in the given Region.\n\n\
        \ {ul\n\
        \       {-   [CANCELLED]: The operation in the specified account and Region has been \
         canceled. This is either because a user has stopped the StackSet operation, or because \
         the failure tolerance of the StackSet operation has been exceeded.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED]: The operation in the specified account and Region failed.\n\
        \           \n\
        \            If the StackSet operation fails in enough accounts within a Region, the \
         failure tolerance for the StackSet operation as a whole might be exceeded.\n\
        \            \n\
        \             }\n\
        \       {-   [RUNNING]: The operation in the specified account and Region is currently in \
         progress.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING]: The operation in the specified account and Region has yet to start.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCEEDED]: The operation in the specified account and Region completed \
         successfully.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  region : region option;
      [@ocaml.doc "The name of the Amazon Web Services Region for this operation result.\n"]
  account : account option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The name of the Amazon Web Services account for this \
         operation result.\n"]
}
[@@ocaml.doc
  "The structure that contains information about a specified operation's results for a given \
   account in a given Region.\n"]

type nonrec stack_set_operation_result_summaries = stack_set_operation_result_summary list
[@@ocaml.doc ""]

type nonrec retain_stacks_nullable = bool [@@ocaml.doc ""]

type nonrec stack_set_drift_status =
  | NOT_CHECKED [@ocaml.doc ""]
  | IN_SYNC [@ocaml.doc ""]
  | DRIFTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_set_drift_detection_status =
  | STOPPED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PARTIAL_SUCCESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec drifted_stack_instances_count = int [@@ocaml.doc ""]

type nonrec in_sync_stack_instances_count = int [@@ocaml.doc ""]

type nonrec in_progress_stack_instances_count = int [@@ocaml.doc ""]

type nonrec stack_set_drift_detection_details = {
  failed_stack_instances_count : failed_stack_instances_count option;
      [@ocaml.doc "The number of stack instances for which the drift detection operation failed.\n"]
  in_progress_stack_instances_count : in_progress_stack_instances_count option;
      [@ocaml.doc "The number of stack instances that are currently being checked for drift.\n"]
  in_sync_stack_instances_count : in_sync_stack_instances_count option;
      [@ocaml.doc
        "The number of stack instances which match the expected template and parameter \
         configuration of the StackSet.\n"]
  drifted_stack_instances_count : drifted_stack_instances_count option;
      [@ocaml.doc
        "The number of stack instances that have drifted from the expected template and parameter \
         configuration of the StackSet. A stack instance is considered to have drifted if one or \
         more of the resources in the associated stack don't match their expected configuration.\n"]
  total_stack_instances_count : total_stack_instances_count option;
      [@ocaml.doc
        "The total number of stack instances belonging to this StackSet.\n\n\
        \ The total number of stack instances is equal to the total of:\n\
        \ \n\
        \  {ul\n\
        \        {-  Stack instances that match the StackSet configuration.\n\
        \            \n\
        \             }\n\
        \        {-  Stack instances that have drifted from the StackSet configuration.\n\
        \            \n\
        \             }\n\
        \        {-  Stack instances where the drift detection operation has failed.\n\
        \            \n\
        \             }\n\
        \        {-  Stack instances currently being checked for drift.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  last_drift_check_timestamp : timestamp option;
      [@ocaml.doc
        "Most recent time when CloudFormation performed a drift detection operation on the \
         StackSet. This value will be [NULL] for any StackSet that drift detection hasn't yet been \
         performed on.\n"]
  drift_detection_status : stack_set_drift_detection_status option;
      [@ocaml.doc
        "The status of the StackSet drift detection operation.\n\n\
        \ {ul\n\
        \       {-   [COMPLETED]: The drift detection operation completed without failing on any \
         stack instances.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED]: The drift detection operation exceeded the specified failure \
         tolerance.\n\
        \           \n\
        \            }\n\
        \       {-   [PARTIAL_SUCCESS]: The drift detection operation completed without exceeding \
         the failure tolerance for the operation.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS]: The drift detection operation is currently being performed.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED]: The user has canceled the drift detection operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  drift_status : stack_set_drift_status option;
      [@ocaml.doc
        "Status of the StackSet's actual configuration compared to its expected template and \
         parameter configuration.\n\n\
        \ {ul\n\
        \       {-   [DRIFTED]: One or more of the stack instances belonging to the StackSet \
         differs from the expected template and parameter configuration. A stack instance is \
         considered to have drifted if one or more of the resources in the associated stack have \
         drifted.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation hasn't checked the StackSet for drift.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: All of the stack instances belonging to the StackSet stack match \
         the expected template and parameter configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Detailed information about the drift status of the StackSet.\n\n\
  \ For StackSets, contains information about the last {i completed} drift operation performed on \
   the StackSet. Information about drift operations in-progress isn't included.\n\
  \ \n\
  \  For StackSet operations, includes information about drift operations currently being \
   performed on the StackSet.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html}Performing \
   drift detection on CloudFormation StackSets} in the {i CloudFormation User Guide}.\n\
  \   "]

type nonrec stack_set_operation = {
  status_details : stack_set_operation_status_details option;
      [@ocaml.doc "Detailed information about the StackSet operation.\n"]
  status_reason : stack_set_operation_status_reason option;
      [@ocaml.doc "The status of the operation in details.\n"]
  stack_set_drift_detection_details : stack_set_drift_detection_details option;
      [@ocaml.doc
        "Detailed information about the drift status of the StackSet. This includes information \
         about drift operations currently being performed on the StackSet.\n\n\
        \ This information will only be present for StackSet operations whose [Action] type is \
         [DETECT_DRIFT].\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html}Performing \
         drift detection on CloudFormation StackSets} in the {i CloudFormation User Guide}.\n\
        \  "]
  deployment_targets : deployment_targets option;
      [@ocaml.doc
        "The Organizations accounts affected by the stack operation. Valid only if the StackSet \
         uses service-managed permissions.\n"]
  end_timestamp : timestamp option;
      [@ocaml.doc
        "The time at which the StackSet operation ended, across all accounts and Regions \
         specified. Note that this doesn't necessarily mean that the StackSet operation was \
         successful, or even attempted, in each account or Region.\n"]
  creation_timestamp : timestamp option;
      [@ocaml.doc
        "The time at which the operation was initiated. Note that the creation times for the stack \
         set operation might differ from the creation time of the individual stacks themselves. \
         This is because CloudFormation needs to perform preparatory work for the operation, such \
         as dispatching the work to the requested Regions, before actually creating the first \
         stacks.\n"]
  execution_role_name : execution_role_name option;
      [@ocaml.doc
        "The name of the IAM execution role used to create or update the StackSet.\n\n\
        \ Use customized execution roles to control which stack resources users and groups can \
         include in their StackSets.\n\
        \ "]
  administration_role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role used to perform this StackSet operation.\n\n\
        \ Use customized administrator roles to control which users or groups can manage specific \
         StackSets within the same administrator account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html}Grant \
         self-managed permissions} in the {i CloudFormation User Guide}.\n\
        \ "]
  retain_stacks : retain_stacks_nullable option;
      [@ocaml.doc
        "For StackSet operations of action type [DELETE], specifies whether to remove the stack \
         instances from the specified StackSet, but doesn't delete the stacks. You can't \
         re-associate a retained stack, or add an existing, saved stack to a new StackSet.\n"]
  operation_preferences : stack_set_operation_preferences option;
      [@ocaml.doc "The preferences for how CloudFormation performs this StackSet operation.\n"]
  status : stack_set_operation_status option;
      [@ocaml.doc
        "The status of the operation.\n\n\
        \ {ul\n\
        \       {-   [FAILED]: The operation exceeded the specified failure tolerance. The failure \
         tolerance value that you've set for an operation is applied for each Region during stack \
         create and update operations. If the number of failed stacks within a Region exceeds the \
         failure tolerance, the status of the operation in the Region is set to [FAILED]. This in \
         turn sets the status of the operation as a whole to [FAILED], and CloudFormation cancels \
         the operation in any remaining Regions.\n\
        \           \n\
        \            }\n\
        \       {-   [QUEUED]: \\[Service-managed permissions\\] For automatic deployments that \
         require a sequence of operations, the operation is queued to be performed. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes}StackSets \
         status codes} in the {i CloudFormation User Guide}.\n\
        \           \n\
        \            }\n\
        \       {-   [RUNNING]: The operation is currently being performed.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED]: The user has canceled the operation.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPING]: The operation is in the process of stopping, at user request.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCEEDED]: The operation completed creating or updating all the specified \
         stacks without exceeding the failure tolerance for the operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  action : stack_set_operation_action option;
      [@ocaml.doc
        "The type of StackSet operation: [CREATE], [UPDATE], or [DELETE]. Create and delete \
         operations affect only the specified stack instances that are associated with the \
         specified StackSet. Update operations affect both the StackSet itself, in addition to {i \
         all} associated stack instances.\n"]
  stack_set_id : stack_set_id option; [@ocaml.doc "The ID of the StackSet.\n"]
  operation_id : client_request_token option; [@ocaml.doc "The unique ID of a StackSet operation.\n"]
}
[@@ocaml.doc "The structure that contains information about a StackSet operation.\n"]

type nonrec stack_set_not_empty_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You can't yet delete this StackSet, because it still contains one or more stack instances. \
   Delete all stack instances from the StackSet before deleting the StackSet.\n"]

type nonrec stack_set_auto_deployment_target_summary = {
  regions : region_list option;
      [@ocaml.doc "The list of Regions targeted for this organization or OU.\n"]
  organizational_unit_id : organizational_unit_id option;
      [@ocaml.doc
        "The organization root ID or organizational unit (OU) IDs where the StackSet is targeted.\n"]
}
[@@ocaml.doc
  "One of the targets for the StackSet. Returned by the \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListStackSetAutoDeploymentTargets.html}ListStackSetAutoDeploymentTargets} \
   API operation.\n"]

type nonrec stack_set_auto_deployment_target_summaries =
  stack_set_auto_deployment_target_summary list
[@@ocaml.doc ""]

type nonrec stack_set = {
  regions : region_list option;
      [@ocaml.doc
        "Returns a list of all Amazon Web Services Regions the given StackSet has stack instances \
         deployed in. The Amazon Web Services Regions list output is in no particular order.\n"]
  managed_execution : managed_execution option;
      [@ocaml.doc
        "Describes whether StackSets performs non-conflicting operations concurrently and queues \
         conflicting operations.\n"]
  organizational_unit_ids : organizational_unit_id_list option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] The organization root ID or organizational unit (OU) \
         IDs that you specified for \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html}DeploymentTargets}.\n"]
  permission_model : permission_models option;
      [@ocaml.doc
        "Describes how the IAM roles required for StackSet operations are created.\n\n\
        \ {ul\n\
        \       {-  With [self-managed] permissions, you must create the administrator and \
         execution roles required to deploy to target accounts. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html}Grant \
         self-managed permissions}.\n\
        \           \n\
        \            }\n\
        \       {-  With [service-managed] permissions, StackSets automatically creates the IAM \
         roles required to deploy to accounts managed by Organizations. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html}Activate \
         trusted access for StackSets with Organizations}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  auto_deployment : auto_deployment option;
      [@ocaml.doc
        "Describes whether StackSets automatically deploys to Organizations accounts that are \
         added to a target organization or organizational unit (OU). Valid only if the StackSet \
         uses service-managed permissions.\n"]
  stack_set_drift_detection_details : stack_set_drift_detection_details option;
      [@ocaml.doc
        "Detailed information about the drift status of the StackSet.\n\n\
        \ For StackSets, contains information about the last {i completed} drift operation \
         performed on the StackSet. Information about drift operations currently in progress isn't \
         included.\n\
        \ "]
  execution_role_name : execution_role_name option;
      [@ocaml.doc
        "The name of the IAM execution role used to create or update the StackSet.\n\n\
        \ Use customized execution roles to control which stack resources users and groups can \
         include in their StackSets.\n\
        \ "]
  administration_role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role used to create or update the stack set.\n\n\
        \ Use customized administrator roles to control which users or groups can manage specific \
         StackSets within the same administrator account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html}Prerequisites \
         for using CloudFormation StackSets} in the {i CloudFormation User Guide}.\n\
        \ "]
  stack_set_ar_n : stack_set_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the StackSet.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of tags that specify information about the StackSet. A maximum number of 50 tags \
         can be specified.\n"]
  capabilities : capabilities option;
      [@ocaml.doc
        "The capabilities that are allowed in the StackSet. Some StackSet templates might include \
         resources that can affect permissions in your Amazon Web Services account\226\128\148for \
         example, by creating new Identity and Access Management (IAM) users. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities}Acknowledging \
         IAM resources in CloudFormation templates}.\n"]
  parameters : parameters option; [@ocaml.doc "A list of input parameters for a StackSet.\n"]
  template_body : template_body option;
      [@ocaml.doc
        "The structure that contains the body of the template that was used to create or update \
         the StackSet.\n"]
  status : stack_set_status option; [@ocaml.doc "The status of the StackSet.\n"]
  description : description option;
      [@ocaml.doc
        "A description of the StackSet that you specify when the StackSet is created or updated.\n"]
  stack_set_id : stack_set_id option; [@ocaml.doc "The ID of the StackSet.\n"]
  stack_set_name : stack_set_name option;
      [@ocaml.doc "The name that's associated with the StackSet.\n"]
}
[@@ocaml.doc
  "A structure that contains information about a StackSet. With StackSets, you can provision \
   stacks across Amazon Web Services accounts and Regions from a single CloudFormation template. \
   Each stack is based on the same CloudFormation template, but you can customize individual \
   stacks using parameters.\n"]

type nonrec physical_resource_id = string [@@ocaml.doc ""]

type nonrec resource_status =
  | ROLLBACK_FAILED [@ocaml.doc ""]
  | ROLLBACK_COMPLETE [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_ROLLBACK_FAILED [@ocaml.doc ""]
  | UPDATE_ROLLBACK_COMPLETE [@ocaml.doc ""]
  | UPDATE_ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | EXPORT_ROLLBACK_COMPLETE [@ocaml.doc ""]
  | EXPORT_ROLLBACK_FAILED [@ocaml.doc ""]
  | EXPORT_ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | EXPORT_IN_PROGRESS [@ocaml.doc ""]
  | EXPORT_COMPLETE [@ocaml.doc ""]
  | EXPORT_FAILED [@ocaml.doc ""]
  | IMPORT_ROLLBACK_COMPLETE [@ocaml.doc ""]
  | IMPORT_ROLLBACK_FAILED [@ocaml.doc ""]
  | IMPORT_ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | IMPORT_IN_PROGRESS [@ocaml.doc ""]
  | IMPORT_COMPLETE [@ocaml.doc ""]
  | IMPORT_FAILED [@ocaml.doc ""]
  | UPDATE_COMPLETE [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_SKIPPED [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_status_reason = string [@@ocaml.doc ""]

type nonrec stack_resource_drift_status =
  | UNSUPPORTED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | NOT_CHECKED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | MODIFIED [@ocaml.doc ""]
  | IN_SYNC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_resource_drift_information = {
  last_check_timestamp : timestamp option;
      [@ocaml.doc
        "When CloudFormation last checked if the resource had drifted from its expected \
         configuration.\n"]
  stack_resource_drift_status : stack_resource_drift_status;
      [@ocaml.doc
        "Status of the resource's actual configuration compared to its expected configuration\n\n\
        \ {ul\n\
        \       {-   [DELETED]: The resource differs from its expected configuration in that it \
         has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED]: The resource differs from its expected configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation has not checked if the resource differs from \
         its expected configuration.\n\
        \           \n\
        \            Any resources that do not currently support drift detection have a status of \
         [NOT_CHECKED]. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support for imports and drift detection}.\n\
        \            \n\
        \             }\n\
        \       {-   [IN_SYNC]: The resource's actual configuration matches its expected \
         configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Contains information about whether the resource's actual configuration differs, or has {i \
   drifted}, from its expected configuration.\n"]

type nonrec logical_id_hierarchy = string [@@ocaml.doc ""]

type nonrec module_info = {
  logical_id_hierarchy : logical_id_hierarchy option;
      [@ocaml.doc
        "A concatenated list of the logical IDs of the module or modules that contains the \
         resource. Modules are listed starting with the inner-most nested module, and separated by \
         [/].\n\n\
        \ In the following example, the resource was created from a module, [moduleA], that's \
         nested inside a parent module, [moduleB].\n\
        \ \n\
        \   [moduleA/moduleB] \n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/module-ref-resources.html}Reference \
         module resources in CloudFormation templates} in the {i CloudFormation User Guide}.\n\
        \   "]
  type_hierarchy : type_hierarchy option;
      [@ocaml.doc
        "A concatenated list of the module type or types that contains the resource. Module types \
         are listed starting with the inner-most nested module, and separated by [/].\n\n\
        \ In the following example, the resource was created from a module of type \
         [AWS::First::Example::MODULE], that's nested inside a parent module of type \
         [AWS::Second::Example::MODULE].\n\
        \ \n\
        \   [AWS::First::Example::MODULE/AWS::Second::Example::MODULE] \n\
        \  "]
}
[@@ocaml.doc
  "Contains information about the module from which the resource was created, if the resource was \
   created from a module included in the stack template.\n\n\
  \ For more information about modules, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/modules.html}Create reusable \
   resource configurations that can be included across templates with CloudFormation modules} in \
   the {i CloudFormation User Guide}.\n\
  \ "]

type nonrec stack_resource = {
  module_info : module_info option;
      [@ocaml.doc
        "Contains information about the module from which the resource was created, if the \
         resource was created from a module included in the stack template.\n"]
  drift_information : stack_resource_drift_information option;
      [@ocaml.doc
        "Information about whether the resource's actual configuration differs, or has {i \
         drifted}, from its expected configuration, as defined in the stack template and any \
         values specified as template parameters. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
         unmanaged configuration changes to stacks and resources with drift detection}.\n"]
  description : description option;
      [@ocaml.doc "User defined description associated with the resource.\n"]
  resource_status_reason : resource_status_reason option;
      [@ocaml.doc "Success/failure message associated with the resource.\n"]
  resource_status : resource_status; [@ocaml.doc "Current status of the resource.\n"]
  timestamp : timestamp; [@ocaml.doc "Time the status was updated.\n"]
  resource_type : resource_type;
      [@ocaml.doc
        "Type of resource. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon \
         Web Services resource and property types reference} in the {i CloudFormation User Guide}.\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier that corresponds to a physical instance ID of a resource \
         supported by CloudFormation.\n"]
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical name of the resource specified in the template.\n"]
  stack_id : stack_id option; [@ocaml.doc "Unique identifier of the stack.\n"]
  stack_name : stack_name option; [@ocaml.doc "The name associated with the stack.\n"]
}
[@@ocaml.doc "The [StackResource] data type.\n"]

type nonrec stack_resources = stack_resource list [@@ocaml.doc ""]

type nonrec stack_resource_drift_information_summary = {
  last_check_timestamp : timestamp option;
      [@ocaml.doc
        "When CloudFormation last checked if the resource had drifted from its expected \
         configuration.\n"]
  stack_resource_drift_status : stack_resource_drift_status;
      [@ocaml.doc
        "Status of the resource's actual configuration compared to its expected configuration.\n\n\
        \ {ul\n\
        \       {-   [DELETED]: The resource differs from its expected configuration in that it \
         has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED]: The resource differs from its expected configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation hasn't checked if the resource differs from its \
         expected configuration.\n\
        \           \n\
        \            Any resources that don't currently support drift detection have a status of \
         [NOT_CHECKED]. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support for imports and drift detection}. If you performed an \
         [ContinueUpdateRollback] operation on a stack, any resources included in \
         [ResourcesToSkip] will also have a status of [NOT_CHECKED]. For more information about \
         skipping resources during rollback operations, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html}Continue \
         rolling back an update} in the {i CloudFormation User Guide}.\n\
        \            \n\
        \             }\n\
        \       {-   [IN_SYNC]: The resource's actual configuration matches its expected \
         configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Summarizes information about whether the resource's actual configuration differs, or has {i \
   drifted}, from its expected configuration.\n"]

type nonrec stack_resource_summary = {
  module_info : module_info option;
      [@ocaml.doc
        "Contains information about the module from which the resource was created, if the \
         resource was created from a module included in the stack template.\n"]
  drift_information : stack_resource_drift_information_summary option;
      [@ocaml.doc
        "Information about whether the resource's actual configuration differs, or has {i \
         drifted}, from its expected configuration, as defined in the stack template and any \
         values specified as template parameters. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
         unmanaged configuration changes to stacks and resources with drift detection}.\n"]
  resource_status_reason : resource_status_reason option;
      [@ocaml.doc "Success/failure message associated with the resource.\n"]
  resource_status : resource_status; [@ocaml.doc "Current status of the resource.\n"]
  last_updated_timestamp : timestamp; [@ocaml.doc "Time the status was updated.\n"]
  resource_type : resource_type;
      [@ocaml.doc
        "Type of resource. (For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon \
         Web Services resource and property types reference} in the {i CloudFormation User Guide}.)\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier that corresponds to a physical instance ID of the resource.\n"]
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical name of the resource specified in the template.\n"]
}
[@@ocaml.doc "Contains high-level information about the specified stack resource.\n"]

type nonrec stack_resource_summaries = stack_resource_summary list [@@ocaml.doc ""]

type nonrec key = string [@@ocaml.doc ""]

type nonrec physical_resource_id_context_key_value_pair = {
  value : value; [@ocaml.doc "The resource context value.\n"]
  key : key; [@ocaml.doc "The resource context key.\n"]
}
[@@ocaml.doc
  "Context information that enables CloudFormation to uniquely identify a resource. CloudFormation \
   uses context key-value pairs in cases where a resource's logical and physical IDs aren't enough \
   to uniquely identify that resource. Each context key-value pair specifies a resource that \
   contains the targeted resource.\n"]

type nonrec physical_resource_id_context = physical_resource_id_context_key_value_pair list
[@@ocaml.doc ""]

type nonrec properties = string [@@ocaml.doc ""]

type nonrec property_value = string [@@ocaml.doc ""]

type nonrec difference_type =
  | NOT_EQUAL [@ocaml.doc ""]
  | REMOVE [@ocaml.doc ""]
  | ADD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec property_difference = {
  difference_type : difference_type;
      [@ocaml.doc
        "The type of property difference.\n\n\
        \ {ul\n\
        \       {-   [ADD]: A value has been added to a resource property that's an array or list \
         data type.\n\
        \           \n\
        \            }\n\
        \       {-   [REMOVE]: The property has been removed from the current resource \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_EQUAL]: The current property value differs from its expected value (as \
         defined in the stack template and any values specified as template parameters).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  actual_value : property_value;
      [@ocaml.doc "The actual property value of the resource property.\n"]
  expected_value : property_value;
      [@ocaml.doc
        "The expected property value of the resource property, as defined in the stack template \
         and any values specified as template parameters.\n"]
  property_path : property_path; [@ocaml.doc "The fully-qualified path to the resource property.\n"]
}
[@@ocaml.doc
  "Information about a resource property whose actual value differs from its expected value, as \
   defined in the stack template and any values specified as template parameters. These will be \
   present only for resources whose [StackResourceDriftStatus] is [MODIFIED]. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
   unmanaged configuration changes to stacks and resources with drift detection}.\n"]

type nonrec property_differences = property_difference list [@@ocaml.doc ""]

type nonrec stack_resource_drift_status_reason = string [@@ocaml.doc ""]

type nonrec stack_resource_drift = {
  drift_status_reason : stack_resource_drift_status_reason option;
      [@ocaml.doc "The reason for the drift status. \n"]
  module_info : module_info option;
      [@ocaml.doc
        "Contains information about the module from which the resource was created, if the \
         resource was created from a module included in the stack template.\n"]
  timestamp : timestamp;
      [@ocaml.doc "Time at which CloudFormation performed drift detection on the stack resource.\n"]
  stack_resource_drift_status : stack_resource_drift_status;
      [@ocaml.doc
        "Status of the resource's actual configuration compared to its expected configuration.\n\n\
        \ {ul\n\
        \       {-   [DELETED]: The resource differs from its expected template configuration \
         because the resource has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED]: One or more resource properties differ from their expected values \
         (as defined in the stack template and any values specified as template parameters).\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The resource's actual configuration matches its expected template \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation does not currently return this value.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN]: CloudFormation could not run drift detection for the resource. See \
         the [DriftStatusReason] for details.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  property_differences : property_differences option;
      [@ocaml.doc
        "A collection of the resource properties whose actual values differ from their expected \
         values. These will be present only for resources whose [StackResourceDriftStatus] is \
         [MODIFIED].\n"]
  actual_properties : properties option;
      [@ocaml.doc
        "A JSON structure that contains the actual property values of the stack resource.\n\n\
        \ For resources whose [StackResourceDriftStatus] is [DELETED], this structure will not be \
         present.\n\
        \ "]
  expected_properties : properties option;
      [@ocaml.doc
        "A JSON structure that contains the expected property values of the stack resource, as \
         defined in the stack template and any values specified as template parameters.\n\n\
        \ For resources whose [StackResourceDriftStatus] is [DELETED], this structure will not be \
         present.\n\
        \ "]
  resource_type : resource_type; [@ocaml.doc "The type of the resource.\n"]
  physical_resource_id_context : physical_resource_id_context option;
      [@ocaml.doc
        "Context information that enables CloudFormation to uniquely identify a resource. \
         CloudFormation uses context key-value pairs in cases where a resource's logical and \
         physical IDs aren't enough to uniquely identify that resource. Each context key-value \
         pair specifies a unique resource that contains the targeted resource.\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier that corresponds to a physical instance ID of a resource \
         supported by CloudFormation.\n"]
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical name of the resource specified in the template.\n"]
  stack_id : stack_id; [@ocaml.doc "The ID of the stack.\n"]
}
[@@ocaml.doc
  "Contains the drift information for a resource that has been checked for drift. This includes \
   actual and expected property values for resources in which CloudFormation has detected drift. \
   Only resource properties explicitly defined in the stack template are checked for drift. For \
   more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
   unmanaged configuration changes to stacks and resources with drift detection}.\n\n\
  \ Resources that don't currently support drift detection can't be checked. For a list of \
   resources that support drift detection, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
   type support for imports and drift detection}.\n\
  \ \n\
  \  Use [DetectStackResourceDrift] to detect drift on individual resources, or [DetectStackDrift] \
   to detect drift on all resources in a given stack that support drift detection.\n\
  \  "]

type nonrec stack_resource_drifts = stack_resource_drift list [@@ocaml.doc ""]

type nonrec stack_resource_drift_status_filters = stack_resource_drift_status list [@@ocaml.doc ""]

type nonrec metadata = string [@@ocaml.doc ""]

type nonrec stack_resource_detail = {
  module_info : module_info option;
      [@ocaml.doc
        "Contains information about the module from which the resource was created, if the \
         resource was created from a module included in the stack template.\n"]
  drift_information : stack_resource_drift_information option;
      [@ocaml.doc
        "Information about whether the resource's actual configuration differs, or has {i \
         drifted}, from its expected configuration, as defined in the stack template and any \
         values specified as template parameters. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
         unmanaged configuration changes to stacks and resources with drift detection}.\n"]
  metadata : metadata option;
      [@ocaml.doc
        "The content of the [Metadata] attribute declared for the resource. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-metadata.html}Metadata \
         attribute} in the {i CloudFormation User Guide}.\n"]
  description : description option;
      [@ocaml.doc "User defined description associated with the resource.\n"]
  resource_status_reason : resource_status_reason option;
      [@ocaml.doc "Success/failure message associated with the resource.\n"]
  resource_status : resource_status; [@ocaml.doc "Current status of the resource.\n"]
  last_updated_timestamp : timestamp; [@ocaml.doc "Time the status was updated.\n"]
  resource_type : resource_type;
      [@ocaml.doc
        "Type of resource. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon \
         Web Services resource and property types reference} in the {i CloudFormation User Guide}.\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier that corresponds to a physical instance ID of a resource \
         supported by CloudFormation.\n"]
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical name of the resource specified in the template.\n"]
  stack_id : stack_id option; [@ocaml.doc "Unique identifier of the stack.\n"]
  stack_name : stack_name option; [@ocaml.doc "The name associated with the stack.\n"]
}
[@@ocaml.doc "Contains detailed information about the specified stack resource.\n"]

type nonrec stack_refactor_untag_resources = tag_key list [@@ocaml.doc ""]

type nonrec stack_refactor_tag_resources = tag list [@@ocaml.doc ""]

type nonrec stack_refactor_id = string [@@ocaml.doc ""]

type nonrec stack_refactor_execution_status =
  | ROLLBACK_FAILED [@ocaml.doc ""]
  | ROLLBACK_COMPLETE [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | EXECUTE_FAILED [@ocaml.doc ""]
  | EXECUTE_COMPLETE [@ocaml.doc ""]
  | EXECUTE_IN_PROGRESS [@ocaml.doc ""]
  | OBSOLETE [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | UNAVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execution_status_reason = string [@@ocaml.doc ""]

type nonrec stack_refactor_status =
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_refactor_status_reason = string [@@ocaml.doc ""]

type nonrec stack_refactor_summary = {
  status_reason : stack_refactor_status_reason option;
      [@ocaml.doc "A detailed explanation for the stack refactor [Status].\n"]
  status : stack_refactor_status option;
      [@ocaml.doc
        "The stack refactor operation status that's provided after calling the \
         [CreateStackRefactor] action.\n"]
  execution_status_reason : execution_status_reason option;
      [@ocaml.doc "A detailed explanation for the stack refactor [ExecutionStatus].\n"]
  execution_status : stack_refactor_execution_status option;
      [@ocaml.doc
        "The operation status that's provided after calling the [ExecuteStackRefactor] action.\n"]
  description : description option;
      [@ocaml.doc "A description to help you identify the refactor.\n"]
  stack_refactor_id : stack_refactor_id option;
      [@ocaml.doc
        "The ID associated with the stack refactor created from the [CreateStackRefactor] action.\n"]
}
[@@ocaml.doc "The summary of a stack refactor operation.\n"]

type nonrec stack_refactor_summaries = stack_refactor_summary list [@@ocaml.doc ""]

type nonrec stack_refactor_resource_identifier = string [@@ocaml.doc ""]

type nonrec stack_refactor_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified stack refactor can't be found.\n"]

type nonrec stack_refactor_execution_status_filter = stack_refactor_execution_status list
[@@ocaml.doc ""]

type nonrec stack_refactor_detection = MANUAL [@ocaml.doc ""] | AUTO [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_refactor_action_type = CREATE [@ocaml.doc ""] | MOVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_refactor_action_entity = STACK [@ocaml.doc ""] | RESOURCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec detection_reason = string [@@ocaml.doc ""]

type nonrec resource_location = {
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical name of the resource specified in the template.\n"]
  stack_name : stack_name; [@ocaml.doc "The name associated with the stack.\n"]
}
[@@ocaml.doc "The location of the resource in a stack template.\n"]

type nonrec resource_mapping = {
  destination : resource_location;
      [@ocaml.doc
        "The destination stack [StackName] and [LogicalResourceId] for the resource being \
         refactored.\n"]
  source : resource_location;
      [@ocaml.doc
        "The source stack [StackName] and [LogicalResourceId] for the resource being refactored.\n"]
}
[@@ocaml.doc
  "Specifies the current source of the resource and the destination of where it will be moved to.\n"]

type nonrec stack_refactor_action = {
  resource_mapping : resource_mapping option;
      [@ocaml.doc "The mapping for the stack resource [Source] and stack resource [Destination].\n"]
  untag_resources : stack_refactor_untag_resources option;
      [@ocaml.doc "Removes one or more tags to specified resources.\n"]
  tag_resources : stack_refactor_tag_resources option;
      [@ocaml.doc "Assigns one or more tags to specified resources.\n"]
  detection_reason : detection_reason option;
      [@ocaml.doc "The description of the detection type.\n"]
  detection : stack_refactor_detection option;
      [@ocaml.doc
        "The detection type is one of the following:\n\n\
        \ {ul\n\
        \       {-  Auto: CloudFormation figured out the mapping on its own.\n\
        \           \n\
        \            }\n\
        \       {-  Manual: The customer provided the mapping in the [ResourceMapping] parameter.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  description : description option;
      [@ocaml.doc "A description to help you identify the refactor.\n"]
  resource_identifier : stack_refactor_resource_identifier option;
      [@ocaml.doc
        "A key-value pair that identifies the target resource. The key is an identifier property \
         (for example, [BucketName] for [AWS::S3::Bucket] resources) and the value is the actual \
         property value (for example, [MyS3Bucket]).\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier associated with the physical instance of the resource.\n"]
  entity : stack_refactor_action_entity option;
      [@ocaml.doc
        "The type that will be evaluated in the [StackRefactorAction]. The following are potential \
         [Entity] types:\n\n\
        \ {ul\n\
        \       {-   [Stack] \n\
        \           \n\
        \            }\n\
        \       {-   [Resource] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  action : stack_refactor_action_type option;
      [@ocaml.doc "The action that CloudFormation takes on the stack.\n"]
}
[@@ocaml.doc
  "Describes the stack and the action that CloudFormation will perform on it if you execute the \
   stack refactor.\n"]

type nonrec stack_refactor_actions = stack_refactor_action list [@@ocaml.doc ""]

type nonrec stack_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified stack ARN doesn't exist or stack doesn't exist corresponding to the ARN in input.\n"]

type nonrec stack_instance_status =
  | INOPERABLE [@ocaml.doc ""]
  | OUTDATED [@ocaml.doc ""]
  | CURRENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_instance_detailed_status =
  | FAILED_IMPORT [@ocaml.doc ""]
  | SKIPPED_SUSPENDED_ACCOUNT [@ocaml.doc ""]
  | INOPERABLE [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_instance_comprehensive_status = {
  detailed_status : stack_instance_detailed_status option;
      [@ocaml.doc
        "{ul\n\
        \      {-   [CANCELLED]: The operation in the specified account and Region has been \
         canceled. This is either because a user has stopped the StackSet operation, or because \
         the failure tolerance of the StackSet operation has been exceeded.\n\
        \          \n\
        \           }\n\
        \      {-   [FAILED]: The operation in the specified account and Region failed. If the \
         StackSet operation fails in enough accounts within a Region, the failure tolerance for \
         the StackSet operation as a whole might be exceeded.\n\
        \          \n\
        \           }\n\
        \      {-   [FAILED_IMPORT]: The import of the stack instance in the specified account and \
         Region failed and left the stack in an unstable state. Once the issues causing the \
         failure are fixed, the import operation can be retried. If enough StackSet operations \
         fail in enough accounts within a Region, the failure tolerance for the StackSet operation \
         as a whole might be exceeded.\n\
        \          \n\
        \           }\n\
        \      {-   [INOPERABLE]: A [DeleteStackInstances] operation has failed and left the stack \
         in an unstable state. Stacks in this state are excluded from further [UpdateStackSet] \
         operations. You might need to perform a [DeleteStackInstances] operation, with \
         [RetainStacks] set to [true], to delete the stack instance, and then delete the stack \
         manually.\n\
        \          \n\
        \           }\n\
        \      {-   [PENDING]: The operation in the specified account and Region has yet to start.\n\
        \          \n\
        \           }\n\
        \      {-   [RUNNING]: The operation in the specified account and Region is currently in \
         progress.\n\
        \          \n\
        \           }\n\
        \      {-   [SKIPPED_SUSPENDED_ACCOUNT]: The operation in the specified account and Region \
         has been skipped because the account was suspended at the time of the operation.\n\
        \          \n\
        \           }\n\
        \      {-   [SUCCEEDED]: The operation in the specified account and Region completed \
         successfully.\n\
        \          \n\
        \           }\n\
        \      }\n\
        \  "]
}
[@@ocaml.doc "The detailed status of the stack instance.\n"]

type nonrec stack_instance_summary = {
  last_operation_id : client_request_token option;
      [@ocaml.doc "The last unique ID of a StackSet operation performed on a stack instance.\n"]
  last_drift_check_timestamp : timestamp option;
      [@ocaml.doc
        "Most recent time when CloudFormation performed a drift detection operation on the stack \
         instance. This value will be [NULL] for any stack instance that drift detection hasn't \
         yet been performed on.\n"]
  drift_status : stack_drift_status option;
      [@ocaml.doc
        "Status of the stack instance's actual configuration compared to the expected template and \
         parameter configuration of the StackSet it belongs to.\n\n\
        \ {ul\n\
        \       {-   [DRIFTED]: The stack differs from the expected template and parameter \
         configuration of the StackSet it belongs to. A stack instance is considered to have \
         drifted if one or more of the resources in the associated stack have drifted.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation hasn't checked if the stack instance differs \
         from its expected StackSet configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The stack instance's actual configuration matches its expected \
         StackSet configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN]: This value is reserved for future use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  organizational_unit_id : organizational_unit_id option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] The organization root ID or organizational unit (OU) \
         IDs that you specified for \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html}DeploymentTargets}.\n"]
  stack_instance_status : stack_instance_comprehensive_status option;
      [@ocaml.doc "The detailed status of the stack instance.\n"]
  status_reason : reason option;
      [@ocaml.doc "The explanation for the specific status code assigned to this stack instance.\n"]
  status : stack_instance_status option;
      [@ocaml.doc
        "The status of the stack instance, in terms of its synchronization with its associated \
         stack set.\n\n\
        \ {ul\n\
        \       {-   [INOPERABLE]: A [DeleteStackInstances] operation has failed and left the \
         stack in an unstable state. Stacks in this state are excluded from further \
         [UpdateStackSet] operations. You might need to perform a [DeleteStackInstances] \
         operation, with [RetainStacks] set to [true], to delete the stack instance, and then \
         delete the stack manually. [INOPERABLE] can be returned here when the cause is a failed \
         import. If it's due to a failed import, the operation can be retried once the failures \
         are fixed. To see if this is due to a failed import, call the [DescribeStackInstance] API \
         operation, look at the [DetailedStatus] member returned in the [StackInstanceSummary] \
         member.\n\
        \           \n\
        \            }\n\
        \       {-   [OUTDATED]: The stack isn't currently up to date with the StackSet because:\n\
        \           \n\
        \            {ul\n\
        \                  {-  The associated stack failed during a [CreateStackSet] or \
         [UpdateStackSet] operation.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The stack was part of a [CreateStackSet] or [UpdateStackSet] \
         operation that failed or was stopped before the stack was created or updated.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [CURRENT]: The stack is currently up to date with the StackSet.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stack_id : stack_id option; [@ocaml.doc "The ID of the stack instance.\n"]
  account : account option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The name of the Amazon Web Services account that the stack \
         instance is associated with.\n"]
  region : region option;
      [@ocaml.doc
        "The name of the Amazon Web Services Region that the stack instance is associated with.\n"]
  stack_set_id : stack_set_id option;
      [@ocaml.doc
        "The name or unique ID of the StackSet that the stack instance is associated with.\n"]
}
[@@ocaml.doc "The structure that contains summary information about a stack instance.\n"]

type nonrec stack_instance_summaries = stack_instance_summary list [@@ocaml.doc ""]

type nonrec stack_instance_resource_drifts_summary = {
  timestamp : timestamp;
      [@ocaml.doc "Time at which the stack instance drift detection operation was initiated.\n"]
  stack_resource_drift_status : stack_resource_drift_status;
      [@ocaml.doc
        "The drift status of the resource in a stack instance.\n\n\
        \ {ul\n\
        \       {-   [DELETED]: The resource differs from its expected template configuration in \
         that the resource has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED]: One or more resource properties differ from their expected \
         template values.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The resource's actual configuration matches its expected template \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation doesn't currently return this value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  property_differences : property_differences option;
      [@ocaml.doc
        "Status of the actual configuration of the resource compared to its expected \
         configuration. These will be present only for resources whose \
         [StackInstanceResourceDriftStatus] is [MODIFIED]. \n"]
  resource_type : resource_type;
      [@ocaml.doc
        "Type of resource. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon \
         Web Services resource and property types reference} in the {i CloudFormation User Guide}.\n"]
  physical_resource_id_context : physical_resource_id_context option;
      [@ocaml.doc
        "Context information that enables CloudFormation to uniquely identify a resource. \
         CloudFormation uses context key-value pairs in cases where a resource's logical and \
         physical IDs aren't enough to uniquely identify that resource. Each context key-value \
         pair specifies a unique resource that contains the targeted resource.\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier that corresponds to a physical instance ID of a resource \
         supported by CloudFormation.\n"]
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical name of the resource specified in the template.\n"]
  stack_id : stack_id; [@ocaml.doc "The ID of the stack instance.\n"]
}
[@@ocaml.doc
  "The structure containing summary information about resource drifts for a stack instance.\n"]

type nonrec stack_instance_resource_drifts_summaries = stack_instance_resource_drifts_summary list
[@@ocaml.doc ""]

type nonrec stack_instance_filter_name =
  | DRIFT_STATUS [@ocaml.doc ""]
  | LAST_OPERATION_ID [@ocaml.doc ""]
  | DETAILED_STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_instance_filter_values = string [@@ocaml.doc ""]

type nonrec stack_instance_filter = {
  values : stack_instance_filter_values option; [@ocaml.doc "The status to filter by.\n"]
  name : stack_instance_filter_name option; [@ocaml.doc "The type of filter to apply.\n"]
}
[@@ocaml.doc "The filter to apply to stack instances\n"]

type nonrec stack_instance_filters = stack_instance_filter list [@@ocaml.doc ""]

type nonrec stack_instance = {
  last_operation_id : client_request_token option;
      [@ocaml.doc "The last unique ID of a StackSet operation performed on a stack instance.\n"]
  last_drift_check_timestamp : timestamp option;
      [@ocaml.doc
        "Most recent time when CloudFormation performed a drift detection operation on the stack \
         instance. This value will be [NULL] for any stack instance that drift detection hasn't \
         yet been performed on.\n"]
  drift_status : stack_drift_status option;
      [@ocaml.doc
        "Status of the stack instance's actual configuration compared to the expected template and \
         parameter configuration of the StackSet it belongs to.\n\n\
        \ {ul\n\
        \       {-   [DRIFTED]: The stack differs from the expected template and parameter \
         configuration of the StackSet it belongs to. A stack instance is considered to have \
         drifted if one or more of the resources in the associated stack have drifted.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation hasn't checked if the stack instance differs \
         from its expected StackSet configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The stack instance's actual configuration matches its expected \
         StackSset configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN]: This value is reserved for future use.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  organizational_unit_id : organizational_unit_id option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] The organization root ID or organizational unit (OU) \
         IDs that you specified for \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html}DeploymentTargets}.\n"]
  status_reason : reason option;
      [@ocaml.doc
        "The explanation for the specific status code that's assigned to this stack instance.\n"]
  stack_instance_status : stack_instance_comprehensive_status option;
      [@ocaml.doc "The detailed status of the stack instance.\n"]
  status : stack_instance_status option;
      [@ocaml.doc
        "The status of the stack instance, in terms of its synchronization with its associated \
         stack set.\n\n\
        \ {ul\n\
        \       {-   [INOPERABLE]: A [DeleteStackInstances] operation has failed and left the \
         stack in an unstable state. Stacks in this state are excluded from further \
         [UpdateStackSet] operations. You might need to perform a [DeleteStackInstances] \
         operation, with [RetainStacks] set to [true], to delete the stack instance, and then \
         delete the stack manually. [INOPERABLE] can be returned here when the cause is a failed \
         import. If it's due to a failed import, the operation can be retried once the failures \
         are fixed. To see if this is due to a failed import, look at the [DetailedStatus] member \
         in the [StackInstanceSummary] member that is a peer to this [Status] member.\n\
        \           \n\
        \            }\n\
        \       {-   [OUTDATED]: The stack isn't currently up to date with the StackSet because:\n\
        \           \n\
        \            {ul\n\
        \                  {-  The associated stack failed during a [CreateStackSet] or \
         [UpdateStackSet] operation.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The stack was part of a [CreateStackSet] or [UpdateStackSet] \
         operation that failed or was stopped before the stack was created or updated.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [CURRENT]: The stack is currently up to date with the StackSet.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  parameter_overrides : parameters option;
      [@ocaml.doc
        "A list of parameters from the StackSet template whose values have been overridden in this \
         stack instance.\n"]
  stack_id : stack_id option; [@ocaml.doc "The ID of the stack instance.\n"]
  account : account option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The name of the Amazon Web Services account that the stack \
         instance is associated with.\n"]
  region : region option;
      [@ocaml.doc
        "The name of the Amazon Web Services Region that the stack instance is associated with.\n"]
  stack_set_id : stack_set_id option;
      [@ocaml.doc
        "The name or unique ID of the StackSet that the stack instance is associated with.\n"]
}
[@@ocaml.doc
  "A CloudFormation stack, in a specific account and Region, that's part of a StackSet operation. \
   A stack instance is a reference to an attempted or actual stack in a given account within a \
   given Region. A stack instance can exist without a stack\226\128\148for example, if the stack \
   couldn't be created for some reason. A stack instance is associated with only one StackSet. \
   Each stack instance contains the ID of its associated StackSet, in addition to the ID of the \
   actual stack and the stack status.\n"]

type nonrec stack_ids_url = string [@@ocaml.doc ""]

type nonrec stack_ids = stack_id list [@@ocaml.doc ""]

type nonrec stack_id_list = stack_id list [@@ocaml.doc ""]

type nonrec event_id = string [@@ocaml.doc ""]

type nonrec resource_properties = string [@@ocaml.doc ""]

type nonrec hook_type = string [@@ocaml.doc ""]

type nonrec hook_status =
  | HOOK_FAILED [@ocaml.doc ""]
  | HOOK_COMPLETE_FAILED [@ocaml.doc ""]
  | HOOK_COMPLETE_SUCCEEDED [@ocaml.doc ""]
  | HOOK_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hook_status_reason = string [@@ocaml.doc ""]

type nonrec hook_invocation_point = PRE_PROVISION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec hook_invocation_id = string [@@ocaml.doc ""]

type nonrec hook_failure_mode = WARN [@ocaml.doc ""] | FAIL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec stack_event = {
  detailed_status : detailed_status option;
      [@ocaml.doc
        "An optional field that contains information about the detailed status of the stack event.\n\n\
        \ {ul\n\
        \       {-   [CONFIGURATION_COMPLETE] - all of the resources in the stack have reached \
         that event. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html}Understand \
         CloudFormation stack creation events} in the {i CloudFormation User Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   {ul\n\
        \         {-   [VALIDATION_FAILED] - template validation failed because of invalid \
         properties in the template. The [ResourceStatusReason] field shows what properties are \
         defined incorrectly.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  hook_failure_mode : hook_failure_mode option;
      [@ocaml.doc
        "Specify the Hook failure mode for non-compliant resources in the followings ways.\n\n\
        \ {ul\n\
        \       {-   [FAIL] Stops provisioning resources.\n\
        \           \n\
        \            }\n\
        \       {-   [WARN] Allows provisioning to continue with a warning message.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  hook_invocation_id : hook_invocation_id option;
      [@ocaml.doc "The unique identifier of the Hook invocation.\n"]
  hook_invocation_point : hook_invocation_point option;
      [@ocaml.doc "The specific point in the provisioning process where the Hook is invoked.\n"]
  hook_status_reason : hook_status_reason option;
      [@ocaml.doc "Provides the reason for the Hook status.\n"]
  hook_status : hook_status option; [@ocaml.doc "Provides the status of the change set Hook.\n"]
  hook_type : hook_type option; [@ocaml.doc "The name of the Hook.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "The token passed to the operation that generated this event.\n\n\
        \ All events triggered by a given stack operation are assigned the same client request \
         token, which you can use to track operations. For example, if you execute a [CreateStack] \
         operation with the token [token1], then all the [StackEvents] generated by that operation \
         will have [ClientRequestToken] set as [token1].\n\
        \ \n\
        \  In the console, stack operations display the client request token on the Events tab. \
         Stack operations that are initiated from the console use the token format {i \
         Console-StackOperation-ID}, which helps you easily identify the stack operation . For \
         example, if you create a stack using the console, each stack event would be assigned the \
         same token in the following format: \
         [Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002].\n\
        \  "]
  resource_properties : resource_properties option;
      [@ocaml.doc "BLOB of the properties used to create the resource.\n"]
  resource_status_reason : resource_status_reason option;
      [@ocaml.doc "Success/failure message associated with the resource.\n"]
  resource_status : resource_status option; [@ocaml.doc "Current status of the resource.\n"]
  timestamp : timestamp; [@ocaml.doc "Time the status was updated.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "Type of resource. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon \
         Web Services resource and property types reference} in the {i CloudFormation User Guide}.\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier associated with the physical instance of the resource.\n"]
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc "The logical name of the resource specified in the template.\n"]
  operation_id : operation_id option;
      [@ocaml.doc "The unique identifier of the operation that generated this stack event.\n"]
  stack_name : stack_name; [@ocaml.doc "The name associated with a stack.\n"]
  event_id : event_id; [@ocaml.doc "The unique identifier of this event.\n"]
  stack_id : stack_id; [@ocaml.doc "The unique ID name of the instance of the stack.\n"]
}
[@@ocaml.doc "The [StackEvent] data type.\n"]

type nonrec stack_events = stack_event list [@@ocaml.doc ""]

type nonrec stack_drift_detection_status_reason = string [@@ocaml.doc ""]

type nonrec stack_drift_detection_status =
  | DETECTION_COMPLETE [@ocaml.doc ""]
  | DETECTION_FAILED [@ocaml.doc ""]
  | DETECTION_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_drift_detection_id = string [@@ocaml.doc ""]

type nonrec stack_definition = {
  template_ur_l : template_ur_l option;
      [@ocaml.doc "The desired final state of the stack template.\n"]
  template_body : template_body option; [@ocaml.doc "The file path for the stack template file.\n"]
  stack_name : stack_name option; [@ocaml.doc "The name associated with the stack.\n"]
}
[@@ocaml.doc "Describes the stack and the template used by the stack.\n"]

type nonrec stack_definitions = stack_definition list [@@ocaml.doc ""]

type nonrec resource_signal_unique_id = string [@@ocaml.doc ""]

type nonrec resource_signal_status = FAILURE [@ocaml.doc ""] | SUCCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec signal_resource_input = {
  status : resource_signal_status;
      [@ocaml.doc
        "The status of the signal, which is either success or failure. A failure signal causes \
         CloudFormation to immediately fail the stack creation or update.\n"]
  unique_id : resource_signal_unique_id;
      [@ocaml.doc
        "A unique ID of the signal. When you signal Amazon EC2 instances or Auto Scaling groups, \
         specify the instance ID that you are signaling as the unique ID. If you send multiple \
         signals to a single resource (such as signaling a wait condition), each signal requires a \
         different unique ID.\n"]
  logical_resource_id : logical_resource_id;
      [@ocaml.doc
        "The logical ID of the resource that you want to signal. The logical ID is the name of the \
         resource that given in the template.\n"]
  stack_name : stack_name_or_id;
      [@ocaml.doc
        "The stack name or unique stack ID that includes the resource that you want to signal.\n"]
}
[@@ocaml.doc "The input for the [SignalResource] action.\n"]

type nonrec set_type_default_version_output = unit [@@ocaml.doc ""]

type nonrec private_type_arn = string [@@ocaml.doc ""]

type nonrec set_type_default_version_input = {
  version_id : type_version_id option;
      [@ocaml.doc
        "The ID of a specific version of the extension. The version ID is the value at the end of \
         the Amazon Resource Name (ARN) assigned to the extension version when it is registered.\n"]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  type_ : registry_type option;
      [@ocaml.doc
        "The kind of extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  arn : private_type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the extension for which you want version summary \
         information.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec set_type_configuration_output = {
  configuration_arn : type_configuration_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the configuration data in this account and Region.\n\n\
        \ Conditional: You must specify [ConfigurationArn], or [Type] and [TypeName].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec set_type_configuration_input = {
  type_ : third_party_type option;
      [@ocaml.doc
        "The type of extension.\n\n\
        \ Conditional: You must specify [ConfigurationArn], or [Type] and [TypeName].\n\
        \ "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ Conditional: You must specify [ConfigurationArn], or [Type] and [TypeName].\n\
        \ "]
  configuration_alias : type_configuration_alias option;
      [@ocaml.doc
        "An alias by which to refer to this extension configuration data.\n\n\
        \ Conditional: Specifying a configuration alias is required when setting a configuration \
         for a resource type extension.\n\
        \ "]
  configuration : type_configuration;
      [@ocaml.doc
        "The configuration data for the extension in this account and Region.\n\n\
        \ The configuration data must be formatted as JSON and validate against the extension's \
         schema returned in the [Schema] response element of \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html}DescribeType}.\n\
        \ "]
  type_arn : type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the extension in this account and Region.\n\n\
        \ For public extensions, this will be the ARN assigned when you call the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html}ActivateType} \
         API operation in this account and Region. For private extensions, this will be the ARN \
         assigned when you call the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType} \
         API operation in this account and Region.\n\
        \ \n\
        \  Do not include the extension versions suffix at the end of the ARN. You can set the \
         configuration for an extension, but not for a specific extension version.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec set_stack_policy_input = {
  stack_policy_ur_l : stack_policy_ur_l option;
      [@ocaml.doc
        "Location of a file that contains the stack policy. The URL must point to a policy \
         (maximum size: 16 KB) located in an Amazon S3 bucket in the same Amazon Web Services \
         Region as the stack. The location for an Amazon S3 bucket must start with [https://]. \
         URLs from S3 static websites are not supported.\n\n\
        \ You can specify either the [StackPolicyBody] or the [StackPolicyURL] parameter, but not \
         both.\n\
        \ "]
  stack_policy_body : stack_policy_body option;
      [@ocaml.doc
        "Structure that contains the stack policy body. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html}Prevent \
         updates to stack resources} in the {i CloudFormation User Guide}. You can specify either \
         the [StackPolicyBody] or the [StackPolicyURL] parameter, but not both.\n"]
  stack_name : stack_name;
      [@ocaml.doc "The name or unique stack ID that you want to associate a policy with.\n"]
}
[@@ocaml.doc "The input for the [SetStackPolicy] action.\n"]

type nonrec resource_attribute =
  | Tags [@ocaml.doc ""]
  | UpdateReplacePolicy [@ocaml.doc ""]
  | DeletionPolicy [@ocaml.doc ""]
  | UpdatePolicy [@ocaml.doc ""]
  | CreationPolicy [@ocaml.doc ""]
  | Metadata [@ocaml.doc ""]
  | Properties [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scope = resource_attribute list [@@ocaml.doc ""]

type nonrec jazz_resource_identifier_property_value = string [@@ocaml.doc ""]

type nonrec jazz_resource_identifier_property_key = string [@@ocaml.doc ""]

type nonrec jazz_resource_identifier_properties =
  (jazz_resource_identifier_property_key * jazz_resource_identifier_property_value) list
[@@ocaml.doc ""]

type nonrec managed_by_stack = bool [@@ocaml.doc ""]

type nonrec scanned_resource = {
  managed_by_stack : managed_by_stack option;
      [@ocaml.doc "If [true], the resource is managed by a CloudFormation stack.\n"]
  resource_identifier : jazz_resource_identifier_properties option;
      [@ocaml.doc
        "A list of up to 256 key-value pairs that identifies for the scanned resource. The key is \
         the name of one of the primary identifiers for the resource. (Primary identifiers are \
         specified in the [primaryIdentifier] list in the resource schema.) The value is the value \
         of that primary identifier. For example, for a [AWS::DynamoDB::Table] resource, the \
         primary identifiers is [TableName] so the key-value pair could be [\"TableName\":\n\
        \    \"MyDDBTable\"]. For more information, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier}primaryIdentifier} \
         in the {i CloudFormation Command Line Interface (CLI) User Guide}.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "The type of the resource, such as [AWS::DynamoDB::Table]. For the list of supported \
         resources, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support for imports and drift detection} In the {i CloudFormation User Guide} \n"]
}
[@@ocaml.doc
  "A scanned resource returned by [ListResourceScanResources] or [ListResourceScanRelatedResources].\n"]

type nonrec scanned_resources = scanned_resource list [@@ocaml.doc ""]

type nonrec scanned_resource_identifier = {
  resource_identifier : jazz_resource_identifier_properties;
      [@ocaml.doc
        "A list of up to 256 key-value pairs that identifies the scanned resource. The key is the \
         name of one of the primary identifiers for the resource. (Primary identifiers are \
         specified in the [primaryIdentifier] list in the resource schema.) The value is the value \
         of that primary identifier. For example, for a [AWS::DynamoDB::Table] resource, the \
         primary identifiers is [TableName] so the key-value pair could be [\"TableName\":\n\
        \    \"MyDDBTable\"]. For more information, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier}primaryIdentifier} \
         in the {i CloudFormation Command Line Interface (CLI) User Guide}.\n"]
  resource_type : resource_type;
      [@ocaml.doc
        "The type of the resource, such as [AWS::DynamoDB::Table]. For the list of supported \
         resources, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support for imports and drift detection} In the {i CloudFormation User Guide}.\n"]
}
[@@ocaml.doc
  "Identifies a scanned resource. This is used with the [ListResourceScanRelatedResources] API \
   action.\n"]

type nonrec scanned_resource_identifiers = scanned_resource_identifier list [@@ocaml.doc ""]

type nonrec scan_type = PARTIAL [@ocaml.doc ""] | FULL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec s3_url = string [@@ocaml.doc ""]

type nonrec rollback_stack_output = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A unique identifier for this rollback operation that can be used to track the operation's \
         progress and events.\n"]
  stack_id : stack_id option; [@ocaml.doc "Unique identifier of the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec rollback_stack_input = {
  deployment_config : deployment_config option;
      [@ocaml.doc
        "The deployment configuration for this stack operation, including the deployment mode.\n"]
  retain_except_on_create : retain_except_on_create option;
      [@ocaml.doc
        "When set to [true], newly created resources are deleted when the operation rolls back. \
         This includes newly created resources marked with a deletion policy of [Retain].\n\n\
        \ Default: [false] \n\
        \ "]
  client_request_token : client_request_token option;
      [@ocaml.doc "A unique identifier for this [RollbackStack] request.\n"]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to rollback the \
         stack.\n"]
  stack_name : stack_name_or_id; [@ocaml.doc "The name that's associated with the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec role_ar_n2 = string [@@ocaml.doc ""]

type nonrec retain_stacks = bool [@@ocaml.doc ""]

type nonrec retain_resources = logical_resource_id list [@@ocaml.doc ""]

type nonrec resource_to_skip = string [@@ocaml.doc ""]

type nonrec resources_to_skip = resource_to_skip list [@@ocaml.doc ""]

type nonrec resource_to_import = {
  resource_identifier : resource_identifier_properties;
      [@ocaml.doc
        "A key-value pair that identifies the target resource. The key is an identifier property \
         (for example, [BucketName] for [AWS::S3::Bucket] resources) and the value is the actual \
         property value (for example, [MyS3Bucket]).\n"]
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical ID of the target resource as specified in the template.\n"]
  resource_type : resource_type;
      [@ocaml.doc
        "The type of resource to import into your stack, such as [AWS::S3::Bucket]. For a list of \
         supported resource types, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support for imports and drift detection} in the {i CloudFormation User Guide}.\n"]
}
[@@ocaml.doc "Describes the target resource of an import operation.\n"]

type nonrec resources_to_import = resource_to_import list [@@ocaml.doc ""]

type nonrec resources_scanned = int [@@ocaml.doc ""]

type nonrec resources_read = int [@@ocaml.doc ""]

type nonrec resource_type_prefix = string [@@ocaml.doc ""]

type nonrec property_name = string [@@ocaml.doc ""]

type nonrec requires_recreation =
  | Always [@ocaml.doc ""]
  | Conditionally [@ocaml.doc ""]
  | Never [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_property_path = string [@@ocaml.doc ""]

type nonrec before_value = string [@@ocaml.doc ""]

type nonrec after_value = string [@@ocaml.doc ""]

type nonrec before_value_from =
  | ACTUAL_STATE [@ocaml.doc ""]
  | PREVIOUS_DEPLOYMENT_STATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec after_value_from = TEMPLATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec resource_drift_previous_value = string [@@ocaml.doc ""]

type nonrec resource_drift_actual_value = string [@@ocaml.doc ""]

type nonrec live_resource_drift = {
  drift_detection_timestamp : timestamp option;
      [@ocaml.doc "The timestamp when drift was detected for this resource property.\n"]
  actual_value : resource_drift_actual_value option;
      [@ocaml.doc "The current live configuration value of the resource property.\n"]
  previous_value : resource_drift_previous_value option;
      [@ocaml.doc "The configuration value from the previous CloudFormation deployment.\n"]
}
[@@ocaml.doc
  "Contains drift information for a resource property, including actual value, previous deployment \
   value, and drift detection timestamp.\n"]

type nonrec attribute_change_type =
  | SyncWithActual [@ocaml.doc ""]
  | Modify [@ocaml.doc ""]
  | Remove [@ocaml.doc ""]
  | Add [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_target_definition = {
  attribute_change_type : attribute_change_type option;
      [@ocaml.doc
        "The type of change to be made to the property if the change is executed.\n\n\
        \ {ul\n\
        \       {-   [Add] The item will be added.\n\
        \           \n\
        \            }\n\
        \       {-   [Remove] The item will be removed.\n\
        \           \n\
        \            }\n\
        \       {-   [Modify] The item will be modified.\n\
        \           \n\
        \            }\n\
        \       {-   [SyncWithActual] The drift status of this item will be reset but the item \
         will not be modified.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  drift : live_resource_drift option;
      [@ocaml.doc
        "Detailed drift information for the resource property, including actual values, previous \
         deployment values, and drift detection timestamps.\n"]
  after_value_from : after_value_from option;
      [@ocaml.doc
        "Indicates the source of the after value. Valid value:\n\n\
        \ {ul\n\
        \       {-   [TEMPLATE] \226\128\147 The after value comes from the new template.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Only present for drift-aware change sets.\n\
        \   "]
  before_value_from : before_value_from option;
      [@ocaml.doc
        "Indicates the source of the before value. Valid values:\n\n\
        \ {ul\n\
        \       {-   [ACTUAL_STATE] \226\128\147 The before value represents current actual state.\n\
        \           \n\
        \            }\n\
        \       {-   [PREVIOUS_DEPLOYMENT_STATE] \226\128\147 The before value represents the \
         previous CloudFormation deployment state.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Only present for drift-aware change sets.\n\
        \   "]
  after_value : after_value option;
      [@ocaml.doc
        "The value of the property after the change is executed. Large values can be truncated.\n"]
  before_value : before_value option;
      [@ocaml.doc
        "The value of the property before the change is executed. Large values can be truncated.\n"]
  path : resource_property_path option; [@ocaml.doc "The property path of the property.\n"]
  requires_recreation : requires_recreation option;
      [@ocaml.doc
        "If the [Attribute] value is [Properties], indicates whether a change to this property \
         causes the resource to be recreated. The value can be [Never], [Always], or \
         [Conditionally]. To determine the conditions for a [Conditionally] recreation, see the \
         update behavior for that property in the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon \
         Web Services resource and property types reference} in the {i CloudFormation User Guide}.\n"]
  name : property_name option;
      [@ocaml.doc
        "If the [Attribute] value is [Properties], the name of the property. For all other \
         attributes, the value is null.\n"]
  attribute : resource_attribute option;
      [@ocaml.doc
        "Indicates which resource attribute is triggering this update, such as a change in the \
         resource attribute's [Metadata], [Properties], or [Tags].\n"]
}
[@@ocaml.doc
  "The field that CloudFormation will change, such as the name of a resource's property, and \
   whether the resource will be recreated.\n"]

type nonrec resource_scanner_max_results = int [@@ocaml.doc ""]

type nonrec resource_scan_status =
  | EXPIRED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_scan_status_reason = string [@@ocaml.doc ""]

type nonrec percentage_completed = float [@@ocaml.doc ""]

type nonrec resource_scan_summary = {
  scan_type : scan_type option; [@ocaml.doc "The scan type that has been completed.\n"]
  percentage_completed : percentage_completed option;
      [@ocaml.doc "The percentage of the resource scan that has been completed.\n"]
  end_time : timestamp option; [@ocaml.doc "The time that the resource scan was finished.\n"]
  start_time : timestamp option; [@ocaml.doc "The time that the resource scan was started.\n"]
  status_reason : resource_scan_status_reason option;
      [@ocaml.doc
        "The reason for the resource scan status, providing more information if a failure happened.\n"]
  status : resource_scan_status option;
      [@ocaml.doc
        "Status of the resource scan.\n\n\
        \   IN_PROGRESS   The resource scan is still in progress.\n\
        \                 \n\
        \                    COMPLETE   The resource scan is complete.\n\
        \                               \n\
        \                                  EXPIRED   The resource scan has expired.\n\
        \                                            \n\
        \                                               FAILED   The resource scan has failed.\n\
        \                                                        \n\
        \                                                          "]
  resource_scan_id : resource_scan_id option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource scan.\n"]
}
[@@ocaml.doc
  "A summary of the resource scan. This is returned by the [ListResourceScan] API action.\n"]

type nonrec resource_scan_summaries = resource_scan_summary list [@@ocaml.doc ""]

type nonrec resource_scan_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource scan was not found.\n"]

type nonrec resource_model = string [@@ocaml.doc ""]

type nonrec resource_mappings = resource_mapping list [@@ocaml.doc ""]

type nonrec resource_identifiers = resource_identifier_property_key list [@@ocaml.doc ""]

type nonrec logical_resource_ids = logical_resource_id list [@@ocaml.doc ""]

type nonrec resource_identifier_summary = {
  resource_identifiers : resource_identifiers option;
      [@ocaml.doc
        "The resource properties you can provide during the import to identify your target \
         resources. For example, [BucketName] is a possible identifier property for \
         [AWS::S3::Bucket] resources.\n"]
  logical_resource_ids : logical_resource_ids option;
      [@ocaml.doc
        "The logical IDs of the target resources of the specified [ResourceType], as defined in \
         the import template.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "The template resource type of the target resources, such as [AWS::S3::Bucket].\n"]
}
[@@ocaml.doc
  "Describes the target resources of a specific type in your import template (for example, all \
   [AWS::S3::Bucket] resources) and the properties you can provide during the import to identify \
   resources of that type.\n"]

type nonrec resource_identifier_summaries = resource_identifier_summary list [@@ocaml.doc ""]

type nonrec resource_identifier = string [@@ocaml.doc ""]

type nonrec drift_ignored_reason =
  | WRITE_ONLY_PROPERTY [@ocaml.doc ""]
  | MANAGED_BY_AWS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_drift_ignored_attribute = {
  reason : drift_ignored_reason option;
      [@ocaml.doc
        "Reason why drift was ignored for the attribute, can have 2 possible values:\n\n\
        \ {ul\n\
        \       {-   [WRITE_ONLY_PROPERTY] - Property is not included in read response for the \
         resource\226\128\153s live state.\n\
        \           \n\
        \            }\n\
        \       {-   [MANAGED_BY_AWS] - Property is managed by an Amazon Web Services service and \
         is expected to be dynamically modified.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  path : resource_property_path option;
      [@ocaml.doc "Path of the resource attribute for which drift was ignored.\n"]
}
[@@ocaml.doc "The [ResourceDriftIgnoredAttribute] data type.\n"]

type nonrec resource_drift_ignored_attributes = resource_drift_ignored_attribute list
[@@ocaml.doc ""]

type nonrec generated_template_resource_status =
  | COMPLETE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_detail = {
  warnings : warning_details option; [@ocaml.doc "The warnings generated for this resource.\n"]
  resource_status_reason : resource_status_reason option;
      [@ocaml.doc
        "The reason for the resource detail, providing more information if a failure happened.\n"]
  resource_status : generated_template_resource_status option;
      [@ocaml.doc
        "Status of the processing of a resource in a generated template.\n\n\
        \   InProgress   The resource processing is still in progress.\n\
        \                \n\
        \                   Complete   The resource processing is complete.\n\
        \                              \n\
        \                                 Pending   The resource processing is pending.\n\
        \                                           \n\
        \                                              Failed   The resource processing has failed.\n\
        \                                                       \n\
        \                                                         "]
  resource_identifier : resource_identifier_properties option;
      [@ocaml.doc
        "A list of up to 256 key-value pairs that identifies the resource in the generated \
         template. The key is the name of one of the primary identifiers for the resource. \
         (Primary identifiers are specified in the [primaryIdentifier] list in the resource \
         schema.) The value is the value of that primary identifier. For example, for a \
         [AWS::DynamoDB::Table] resource, the primary identifiers is [TableName] so the key-value \
         pair could be [\"TableName\": \"MyDDBTable\"]. For more information, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html#schema-properties-primaryidentifier}primaryIdentifier} \
         in the {i CloudFormation Command Line Interface (CLI) User Guide}.\n"]
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc "The logical id for this resource in the final generated template.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "The type of the resource, such as [AWS::DynamoDB::Table]. For the list of supported \
         resources, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support for imports and drift detection} In the {i CloudFormation User Guide} \n"]
}
[@@ocaml.doc "Details about a resource in a generated template\n"]

type nonrec resource_details = resource_detail list [@@ocaml.doc ""]

type nonrec evaluation_type = Dynamic [@ocaml.doc ""] | Static [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec change_source =
  | NoModification [@ocaml.doc ""]
  | Automatic [@ocaml.doc ""]
  | DirectModification [@ocaml.doc ""]
  | ResourceAttribute [@ocaml.doc ""]
  | ParameterReference [@ocaml.doc ""]
  | ResourceReference [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec causing_entity = string [@@ocaml.doc ""]

type nonrec resource_change_detail = {
  causing_entity : causing_entity option;
      [@ocaml.doc
        "The identity of the entity that triggered this change. This entity is a member of the \
         group that's specified by the [ChangeSource] field. For example, if you modified the \
         value of the [KeyPairName] parameter, the [CausingEntity] is the name of the parameter \
         ([KeyPairName]).\n\n\
        \ If the [ChangeSource] value is [DirectModification], no value is given for \
         [CausingEntity].\n\
        \ "]
  change_source : change_source option;
      [@ocaml.doc
        "The group to which the [CausingEntity] value belongs. There are five entity groups:\n\n\
        \ {ul\n\
        \       {-   [ResourceReference] entities are [Ref] intrinsic functions that refer to \
         resources in the template, such as [{ \"Ref\" : \"MyEC2InstanceResource\" }].\n\
        \           \n\
        \            }\n\
        \       {-   [ParameterReference] entities are [Ref] intrinsic functions that get template \
         parameter values, such as [{ \"Ref\" : \"MyPasswordParameter\" }].\n\
        \           \n\
        \            }\n\
        \       {-   [ResourceAttribute] entities are [Fn::GetAtt] intrinsic functions that get \
         resource attribute values, such as [{ \"Fn::GetAtt\" : \\[ \"MyEC2InstanceResource\",\n\
        \      \"PublicDnsName\" \\] }].\n\
        \           \n\
        \            }\n\
        \       {-   [DirectModification] entities are changes that are made directly to the \
         template.\n\
        \           \n\
        \            }\n\
        \       {-   [Automatic] entities are [AWS::CloudFormation::Stack] resource types, which \
         are also known as nested stacks. If you made no changes to the \
         [AWS::CloudFormation::Stack] resource, CloudFormation sets the [ChangeSource] to \
         [Automatic] because the nested stack's template might have changed. Changes to a nested \
         stack's template aren't visible to CloudFormation until you run an update on the parent \
         stack.\n\
        \           \n\
        \            }\n\
        \       {-   [NoModification] entities are changes made to the template that matches the \
         actual state of the resource.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  evaluation : evaluation_type option;
      [@ocaml.doc
        "Indicates whether CloudFormation can determine the target value, and whether the target \
         value will change before you execute a change set.\n\n\
        \ For [Static] evaluations, CloudFormation can determine that the target value will \
         change, and its value. For example, if you directly modify the [InstanceType] property of \
         an EC2 instance, CloudFormation knows that this property value will change, and its \
         value, so this is a [Static] evaluation.\n\
        \ \n\
        \  For [Dynamic] evaluations, can't determine the target value because it depends on the \
         result of an intrinsic function, such as a [Ref] or [Fn::GetAtt] intrinsic function, when \
         the stack is updated. For example, if your template includes a reference to a resource \
         that's conditionally recreated, the value of the reference (the physical ID of the \
         resource) might change, depending on if the resource is recreated. If the resource is \
         recreated, it will have a new physical ID, so all references to that resource will also \
         be updated.\n\
        \  "]
  target : resource_target_definition option;
      [@ocaml.doc
        "A [ResourceTargetDefinition] structure that describes the field that CloudFormation will \
         change and whether the resource will be recreated.\n"]
}
[@@ocaml.doc
  "For a resource with [Modify] as the action, the [ResourceChange] structure describes the \
   changes CloudFormation will make to that resource.\n"]

type nonrec resource_change_details = resource_change_detail list [@@ocaml.doc ""]

type nonrec policy_action =
  | ReplaceAndSnapshot [@ocaml.doc ""]
  | ReplaceAndRetain [@ocaml.doc ""]
  | ReplaceAndDelete [@ocaml.doc ""]
  | Snapshot [@ocaml.doc ""]
  | Retain [@ocaml.doc ""]
  | Delete [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec change_action =
  | SyncWithActual [@ocaml.doc ""]
  | Dynamic [@ocaml.doc ""]
  | Import [@ocaml.doc ""]
  | Remove [@ocaml.doc ""]
  | Modify [@ocaml.doc ""]
  | Add [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replacement =
  | Conditional [@ocaml.doc ""]
  | False [@ocaml.doc ""]
  | True [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec before_context = string [@@ocaml.doc ""]

type nonrec after_context = string [@@ocaml.doc ""]

type nonrec previous_deployment_context = string [@@ocaml.doc ""]

type nonrec resource_change = {
  previous_deployment_context : previous_deployment_context option;
      [@ocaml.doc
        "Information about the resource's state from the previous CloudFormation deployment.\n"]
  after_context : after_context option;
      [@ocaml.doc
        "An encoded JSON string that contains the context of the resource after the change is \
         executed.\n"]
  before_context : before_context option;
      [@ocaml.doc
        "An encoded JSON string that contains the context of the resource before the change is \
         executed.\n"]
  module_info : module_info option;
      [@ocaml.doc
        "Contains information about the module from which the resource was created, if the \
         resource was created from a module included in the stack template.\n"]
  change_set_id : change_set_id option; [@ocaml.doc "The change set ID of the nested change set.\n"]
  details : resource_change_details option;
      [@ocaml.doc
        "For the [Modify] action, a list of [ResourceChangeDetail] structures that describes the \
         changes that CloudFormation will make to the resource.\n"]
  resource_drift_ignored_attributes : resource_drift_ignored_attributes option;
      [@ocaml.doc "List of resource attributes for which drift was ignored.\n"]
  resource_drift_status : stack_resource_drift_status option;
      [@ocaml.doc
        "The drift status of the resource. Valid values:\n\n\
        \ {ul\n\
        \       {-   [IN_SYNC] \226\128\147 The resource matches its template definition.\n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED] \226\128\147 Resource properties were modified outside \
         CloudFormation.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] \226\128\147 The resource was deleted outside CloudFormation.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED] \226\128\147 CloudFormation doesn\226\128\153t currently return \
         this value.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN] \226\128\147 Drift status could not be determined.\n\
        \           \n\
        \            }\n\
        \       {-   [UNSUPPORTED] \226\128\147 Resource type does not support actual state \
         comparison.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Only present for drift-aware change sets.\n\
        \   "]
  scope : scope option;
      [@ocaml.doc
        "For the [Modify] action, indicates which resource attribute is triggering this update, \
         such as a change in the resource attribute's [Metadata], [Properties], or [Tags].\n"]
  replacement : replacement option;
      [@ocaml.doc
        "For the [Modify] action, indicates whether CloudFormation will replace the resource by \
         creating a new one and deleting the old one. This value depends on the value of the \
         [RequiresRecreation] property in the [ResourceTargetDefinition] structure. For example, \
         if the [RequiresRecreation] field is [Always] and the [Evaluation] field is [Static], \
         [Replacement] is [True]. If the [RequiresRecreation] field is [Always] and the \
         [Evaluation] field is [Dynamic], [Replacement] is [Conditional].\n\n\
        \ If you have multiple changes with different [RequiresRecreation] values, the \
         [Replacement] value depends on the change with the most impact. A [RequiresRecreation] \
         value of [Always] has the most impact, followed by [Conditional], and then [Never].\n\
        \ "]
  resource_type : resource_type option;
      [@ocaml.doc "The type of CloudFormation resource, such as [AWS::S3::Bucket].\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The resource's physical ID (resource name). Resources that you are adding don't have \
         physical IDs because they haven't been created.\n"]
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc "The resource's logical ID, which is defined in the stack's template.\n"]
  action : change_action option;
      [@ocaml.doc
        "The action that CloudFormation takes on the resource, such as [Add] (adds a new \
         resource), [Modify] (changes a resource), [Remove] (deletes a resource), [Import] \
         (imports a resource), [Dynamic] (exact action for the resource can't be determined), or \
         [SyncWithActual] (resource will not be changed, only CloudFormation metadata will change).\n"]
  policy_action : policy_action option;
      [@ocaml.doc
        "The action that will be taken on the physical resource when the change set is executed.\n\n\
        \ {ul\n\
        \       {-   [Delete] The resource will be deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [Retain] The resource will be retained.\n\
        \           \n\
        \            }\n\
        \       {-   [Snapshot] The resource will have a snapshot taken.\n\
        \           \n\
        \            }\n\
        \       {-   [ReplaceAndDelete] The resource will be replaced and then deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [ReplaceAndRetain] The resource will be replaced and then retained.\n\
        \           \n\
        \            }\n\
        \       {-   [ReplaceAndSnapshot] The resource will be replaced and then have a snapshot \
         taken.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The [ResourceChange] structure describes the resource and the action that CloudFormation will \
   perform on it if you execute this change set.\n"]

type nonrec required_activated_type = {
  supported_major_versions : supported_major_versions option;
      [@ocaml.doc "A list of the major versions of the extension type that the macro supports.\n"]
  publisher_id : publisher_id option; [@ocaml.doc "The publisher ID of the extension publisher.\n"]
  original_type_name : type_name option;
      [@ocaml.doc
        "The type name of the public extension.\n\n\
        \ If you specified a [TypeNameAlias] when enabling the extension in this account and \
         Region, CloudFormation treats that alias as the extension's type name within the account \
         and Region, not the type name of the public extension. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-alias}Use \
         aliases to refer to extensions} in the {i CloudFormation User Guide}.\n\
        \ "]
  type_name_alias : type_name option;
      [@ocaml.doc
        "An alias assigned to the public extension, in this account and Region. If you specify an \
         alias for the extension, CloudFormation treats the alias as the extension type name \
         within this account and Region. You must use the alias to refer to the extension in your \
         templates, API calls, and CloudFormation console.\n"]
}
[@@ocaml.doc
  "For extensions that are modules, a public third-party extension that must be activated in your \
   account in order for the module itself to be activated.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/module-versioning.html#requirements-for-modules}Requirements \
   for activating third-party public modules} in the {i CloudFormation User Guide}.\n\
  \ "]

type nonrec required_activated_types = required_activated_type list [@@ocaml.doc ""]

type nonrec request_token = string [@@ocaml.doc ""]

type nonrec remediation_message_status_message = string [@@ocaml.doc ""]

type nonrec remediation_message_remediation_message = string [@@ocaml.doc ""]

type nonrec related_resources = scanned_resource list [@@ocaml.doc ""]

type nonrec registration_token = string [@@ocaml.doc ""]

type nonrec registration_token_list = registration_token list [@@ocaml.doc ""]

type nonrec registration_status =
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec register_type_output = {
  registration_token : registration_token option;
      [@ocaml.doc
        "The identifier for this registration request.\n\n\
        \ Use this registration token when calling [DescribeTypeRegistration], which returns \
         information about the status and IDs of the extension registration.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec log_group_name = string [@@ocaml.doc ""]

type nonrec logging_config = {
  log_group_name : log_group_name;
      [@ocaml.doc
        "The Amazon CloudWatch Logs group to which CloudFormation sends error logging information \
         when invoking the extension's handlers.\n"]
  log_role_arn : role_ar_n2;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role that CloudFormation should assume when sending \
         log entries to CloudWatch Logs.\n"]
}
[@@ocaml.doc "Contains logging configuration information for an extension.\n"]

type nonrec register_type_input = {
  client_request_token : request_token option;
      [@ocaml.doc
        "A unique identifier that acts as an idempotency key for this registration request. \
         Specifying a client request token prevents CloudFormation from generating more than one \
         version of an extension from the same registration request, even if the request is \
         submitted multiple times.\n"]
  execution_role_arn : role_ar_n2 option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role for CloudFormation to assume when invoking \
         the extension.\n\n\
        \ For CloudFormation to assume the specified execution role, the role must contain a trust \
         relationship with the CloudFormation service principal \
         ([resources.cloudformation.amazonaws.com]). For more information about adding trust \
         relationships, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-managingrole-editing-console.html#roles-managingrole_edit-trust-policy}Modifying \
         a role trust policy} in the {i Identity and Access Management User Guide}.\n\
        \ \n\
        \  If your extension calls Amazon Web Services APIs in any of its handlers, you must \
         create an {i  {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM \
         execution role} } that includes the necessary permissions to call those Amazon Web \
         Services APIs, and provision that execution role in your account. When CloudFormation \
         needs to invoke the resource type handler, CloudFormation assumes this execution role to \
         create a temporary session token, which it then passes to the resource type handler, \
         thereby supplying your resource type with the appropriate credentials.\n\
        \  "]
  logging_config : logging_config option;
      [@ocaml.doc "Specifies logging configuration information for an extension.\n"]
  schema_handler_package : s3_url;
      [@ocaml.doc
        "A URL to the S3 bucket that contains the extension project package that contains the \
         necessary files for the extension you want to register.\n\n\
        \ For information about generating a schema handler package for the extension you want to \
         register, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-cli-submit.html}submit} \
         in the {i CloudFormation Command Line Interface (CLI) User Guide}.\n\
        \ \n\
        \   The user registering the extension must be able to access the package in the S3 \
         bucket. That's, the user needs to have \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html}GetObject} \
         permissions for the schema handler package. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html}Actions, \
         Resources, and Condition Keys for Amazon S3} in the {i Identity and Access Management \
         User Guide}.\n\
        \   \n\
        \    "]
  type_name : type_name;
      [@ocaml.doc
        "The name of the extension being registered.\n\n\
        \ We suggest that extension names adhere to the following patterns:\n\
        \ \n\
        \  {ul\n\
        \        {-  For resource types, [company_or_organization::service::type].\n\
        \            \n\
        \             }\n\
        \        {-  For modules, [company_or_organization::service::type::MODULE].\n\
        \            \n\
        \             }\n\
        \        {-  For Hooks, [MyCompany::Testing::MyTestHook].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    The following organization namespaces are reserved and can't be used in your \
         extension names:\n\
        \    \n\
        \     {ul\n\
        \           {-   [Alexa] \n\
        \               \n\
        \                }\n\
        \           {-   [AMZN] \n\
        \               \n\
        \                }\n\
        \           {-   [Amazon] \n\
        \               \n\
        \                }\n\
        \           {-   [AWS] \n\
        \               \n\
        \                }\n\
        \           {-   [Custom] \n\
        \               \n\
        \                }\n\
        \           {-   [Dev] \n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
  type_ : registry_type option; [@ocaml.doc "The kind of extension.\n"]
}
[@@ocaml.doc ""]

type nonrec register_publisher_output = {
  publisher_id : publisher_id option;
      [@ocaml.doc "The ID assigned this account by CloudFormation for publishing extensions.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_terms_and_conditions = bool [@@ocaml.doc ""]

type nonrec connection_arn = string [@@ocaml.doc ""]

type nonrec register_publisher_input = {
  connection_arn : connection_arn option;
      [@ocaml.doc
        "If you are using a Bitbucket or GitHub account for identity verification, the Amazon \
         Resource Name (ARN) for your connection to that account.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-prereqs}Prerequisite: \
         Registering your account to publish CloudFormation extensions} in the {i CloudFormation \
         Command Line Interface (CLI) User Guide}.\n\
        \ "]
  accept_terms_and_conditions : accept_terms_and_conditions option;
      [@ocaml.doc
        "Whether you accept the \
         {{:https://cloudformation-registry-documents.s3.amazonaws.com/Terms_and_Conditions_for_AWS_CloudFormation_Registry_Publishers.pdf}Terms \
         and Conditions} for publishing extensions in the CloudFormation registry. You must accept \
         the terms and conditions in order to register to publish public extensions to the \
         CloudFormation registry.\n\n\
        \ The default is [false].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec record_handler_progress_output = unit [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec operation_status =
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec handler_error_code =
  | UnsupportedTarget [@ocaml.doc ""]
  | Unknown [@ocaml.doc ""]
  | NonCompliant [@ocaml.doc ""]
  | HandlerInternalFailure [@ocaml.doc ""]
  | InvalidTypeConfiguration [@ocaml.doc ""]
  | InternalFailure [@ocaml.doc ""]
  | NetworkFailure [@ocaml.doc ""]
  | ServiceInternalError [@ocaml.doc ""]
  | GeneralServiceException [@ocaml.doc ""]
  | ServiceTimeout [@ocaml.doc ""]
  | ServiceLimitExceeded [@ocaml.doc ""]
  | Throttling [@ocaml.doc ""]
  | ResourceConflict [@ocaml.doc ""]
  | NotFound [@ocaml.doc ""]
  | AlreadyExists [@ocaml.doc ""]
  | InvalidCredentials [@ocaml.doc ""]
  | AccessDenied [@ocaml.doc ""]
  | InvalidRequest [@ocaml.doc ""]
  | NotUpdatable [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec record_handler_progress_input = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Reserved for use by the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
         CLI}.\n"]
  resource_model : resource_model option;
      [@ocaml.doc
        "Reserved for use by the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
         CLI}.\n"]
  error_code : handler_error_code option;
      [@ocaml.doc
        "Reserved for use by the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
         CLI}.\n"]
  status_message : status_message option;
      [@ocaml.doc
        "Reserved for use by the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
         CLI}.\n"]
  current_operation_status : operation_status option;
      [@ocaml.doc
        "Reserved for use by the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
         CLI}.\n"]
  operation_status : operation_status;
      [@ocaml.doc
        "Reserved for use by the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
         CLI}.\n"]
  bearer_token : client_token;
      [@ocaml.doc
        "Reserved for use by the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
         CLI}.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_status_check_failed_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Error reserved for use by the \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
   CLI}. CloudFormation doesn't return this error to users.\n"]

type nonrec invalid_state_transition_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Error reserved for use by the \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
   CLI}. CloudFormation doesn't return this error to users.\n"]

type nonrec publisher_status = UNVERIFIED [@ocaml.doc ""] | VERIFIED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec publisher_profile = string [@@ocaml.doc ""]

type nonrec publish_type_output = {
  public_type_arn : type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) assigned to the public extension upon publication.\n"]
}
[@@ocaml.doc ""]

type nonrec publish_type_input = {
  public_version_number : public_version_number option;
      [@ocaml.doc
        "The version number to assign to this version of the extension.\n\n\
        \ Use the following format, and adhere to semantic versioning when assigning a version \
         number to your extension:\n\
        \ \n\
        \   [MAJOR.MINOR.PATCH] \n\
        \  \n\
        \   For more information, see {{:https://semver.org/}Semantic Versioning 2.0.0}.\n\
        \   \n\
        \    If you don't specify a version number, CloudFormation increments the version number \
         by one minor version release.\n\
        \    \n\
        \     You cannot specify a version number the first time you publish a type. \
         CloudFormation automatically sets the first version number to be [1.0.0].\n\
        \     "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ Conditional: You must specify [Arn], or [TypeName] and [Type].\n\
        \ "]
  arn : private_type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the extension.\n\n\
        \ Conditional: You must specify [Arn], or [TypeName] and [Type].\n\
        \ "]
  type_ : third_party_type option;
      [@ocaml.doc
        "The type of the extension.\n\n\
        \ Conditional: You must specify [Arn], or [TypeName] and [Type].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec provisioning_type =
  | FULLY_MUTABLE [@ocaml.doc ""]
  | IMMUTABLE [@ocaml.doc ""]
  | NON_PROVISIONABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parameter_type = string [@@ocaml.doc ""]

type nonrec allowed_value = string [@@ocaml.doc ""]

type nonrec allowed_values = allowed_value list [@@ocaml.doc ""]

type nonrec parameter_constraints = {
  allowed_values : allowed_values option;
      [@ocaml.doc "A list of values that are permitted for a parameter.\n"]
}
[@@ocaml.doc
  "A set of criteria that CloudFormation uses to validate parameter values. Although other \
   constraints might be defined in the stack template, CloudFormation returns only the \
   [AllowedValues] property.\n"]

type nonrec parameter_declaration = {
  parameter_constraints : parameter_constraints option;
      [@ocaml.doc "The criteria that CloudFormation uses to validate parameter values.\n"]
  description : description option;
      [@ocaml.doc "The description that's associate with the parameter.\n"]
  no_echo : no_echo option;
      [@ocaml.doc
        "Flag that indicates whether the parameter value is shown as plain text in logs and in the \
         Amazon Web Services Management Console.\n"]
  parameter_type : parameter_type option; [@ocaml.doc "The type of parameter.\n"]
  default_value : parameter_value option; [@ocaml.doc "The default value of the parameter.\n"]
  parameter_key : parameter_key option;
      [@ocaml.doc "The name that's associated with the parameter.\n"]
}
[@@ocaml.doc "The [ParameterDeclaration] data type.\n"]

type nonrec parameter_declarations = parameter_declaration list [@@ocaml.doc ""]

type nonrec organization_status =
  | DISABLED_PERMANENTLY [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec optional_secure_url = string [@@ocaml.doc ""]

type nonrec operation_result_filter_name = OPERATION_RESULT_STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation_result_filter_values = string [@@ocaml.doc ""]

type nonrec operation_result_filter = {
  values : operation_result_filter_values option; [@ocaml.doc "The value to filter by.\n"]
  name : operation_result_filter_name option; [@ocaml.doc "The type of filter to apply.\n"]
}
[@@ocaml.doc "The status that operation results are filtered by.\n"]

type nonrec operation_result_filters = operation_result_filter list [@@ocaml.doc ""]

type nonrec beacon_stack_operation_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_type =
  | HOOK_INVOCATION_ERROR [@ocaml.doc ""]
  | PROVISIONING_ERROR [@ocaml.doc ""]
  | VALIDATION_ERROR [@ocaml.doc ""]
  | PROGRESS_EVENT [@ocaml.doc ""]
  | STACK_EVENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation_event = {
  validation_path : validation_path option;
      [@ocaml.doc "The path within the resource where the validation was applied.\n"]
  validation_status_reason : validation_status_reason option;
      [@ocaml.doc "Additional information about the validation status.\n"]
  validation_status : validation_status option; [@ocaml.doc "The status of the validation.\n"]
  validation_name : validation_name option;
      [@ocaml.doc "The name of the validation that was performed.\n"]
  validation_failure_mode : hook_failure_mode option;
      [@ocaml.doc "Specifies how validation failures are handled.\n"]
  detailed_status : detailed_status option;
      [@ocaml.doc "Additional status information about the operation.\n"]
  hook_failure_mode : hook_failure_mode option;
      [@ocaml.doc "Specifies how Hook failures are handled.\n"]
  hook_invocation_point : hook_invocation_point option;
      [@ocaml.doc "The point in the operation lifecycle when the Hook was invoked.\n"]
  hook_status_reason : hook_status_reason option;
      [@ocaml.doc "Additional information about the Hook status.\n"]
  hook_status : hook_status option; [@ocaml.doc "The status of the Hook invocation. \n"]
  hook_type : hook_type option; [@ocaml.doc "The type name of the Hook that was invoked.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc "A unique identifier for the request that initiated this operation.\n"]
  resource_properties : resource_properties option;
      [@ocaml.doc "The properties used to create the resource.\n"]
  resource_status_reason : resource_status_reason option;
      [@ocaml.doc "Success or failure message associated with the resource.\n"]
  resource_status : resource_status option; [@ocaml.doc "Current status of the resource.\n"]
  end_time : timestamp option; [@ocaml.doc "The time when the event ended.\n"]
  start_time : timestamp option; [@ocaml.doc "The time when the event started.\n"]
  timestamp : timestamp option; [@ocaml.doc "Time the status was updated.\n"]
  resource_type : resource_type option; [@ocaml.doc "Type of resource.\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier that corresponds to a physical instance ID of a resource.\n"]
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc "The logical name of the resource as specified in the template.\n"]
  event_type : event_type option; [@ocaml.doc "The type of event.\n"]
  operation_status : beacon_stack_operation_status option;
      [@ocaml.doc "The current status of the operation.\n"]
  operation_type : operation_type option; [@ocaml.doc "The type of operation.\n"]
  operation_id : operation_id option;
      [@ocaml.doc "The unique identifier of the operation this event belongs to.\n"]
  stack_id : stack_id option; [@ocaml.doc "The unique ID name of the instance of the stack.\n"]
  event_id : event_id option; [@ocaml.doc "A unique identifier for this event.\n"]
}
[@@ocaml.doc
  "Contains detailed information about an event that occurred during a CloudFormation operation.\n"]

type nonrec operation_events = operation_event list [@@ocaml.doc ""]

type nonrec on_stack_failure =
  | DELETE [@ocaml.doc ""]
  | ROLLBACK [@ocaml.doc ""]
  | DO_NOTHING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec on_failure =
  | DELETE [@ocaml.doc ""]
  | ROLLBACK [@ocaml.doc ""]
  | DO_NOTHING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec name_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified name is already in use.\n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec major_version = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec list_types_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call this action again and assign that token to the \
         request object's [NextToken] parameter. If the request returns all results, [NextToken] \
         is set to [null].\n"]
  type_summaries : type_summaries option;
      [@ocaml.doc
        "A list of [TypeSummary] structures that contain information about the specified extensions.\n"]
}
[@@ocaml.doc ""]

type nonrec deprecated_status = DEPRECATED [@ocaml.doc ""] | LIVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_types_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  filters : type_filters option;
      [@ocaml.doc
        "Filter criteria to use in determining which extensions to return.\n\n\
        \ Filters must be compatible with [Visibility] to return valid results. For example, \
         specifying [AWS_TYPES] for [Category] and [PRIVATE] for [Visibility] returns an empty \
         list of types, but specifying [PUBLIC] for [Visibility] returns the desired list.\n\
        \ "]
  type_ : registry_type option; [@ocaml.doc "The type of extension.\n"]
  deprecated_status : deprecated_status option;
      [@ocaml.doc
        "The deprecation status of the extension that you want to get summary information about.\n\n\
        \ Valid values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [LIVE]: The extension is registered for use in CloudFormation operations.\n\
        \            \n\
        \             }\n\
        \        {-   [DEPRECATED]: The extension has been deregistered and can no longer be used \
         in CloudFormation operations.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  provisioning_type : provisioning_type option;
      [@ocaml.doc
        "For resource types, the provisioning behavior of the resource type. CloudFormation \
         determines the provisioning type during registration, based on the types of handlers in \
         the schema handler package submitted.\n\n\
        \ Valid values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [FULLY_MUTABLE]: The resource type includes an update handler to process \
         updates to the type during stack update operations.\n\
        \            \n\
        \             }\n\
        \        {-   [IMMUTABLE]: The resource type doesn't include an update handler, so the \
         type can't be updated and must instead be replaced during stack update operations.\n\
        \            \n\
        \             }\n\
        \        {-   [NON_PROVISIONABLE]: The resource type doesn't include create, read, and \
         delete handlers, and therefore can't actually be provisioned.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The default is [FULLY_MUTABLE].\n\
        \   "]
  visibility : visibility option;
      [@ocaml.doc
        "The scope at which the extensions are visible and usable in CloudFormation operations.\n\n\
        \ Valid values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [PRIVATE]: Extensions that are visible and usable within this account and \
         Region. This includes:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Private extensions you have registered in this account and Region.\n\
        \                       \n\
        \                        }\n\
        \                   {-  Public extensions that you have activated in this account and \
         Region.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [PUBLIC]: Extensions that are publicly visible and available to be activated \
         within any Amazon Web Services account. This includes extensions from Amazon Web Services \
         and third-party publishers.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The default is [PRIVATE].\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec list_type_versions_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all of the remaining results, [NextToken] is set to a \
         token. To retrieve the next set of results, call this action again and assign that token \
         to the request object's [NextToken] parameter. If the request returns all results, \
         [NextToken] is set to [null].\n"]
  type_version_summaries : type_version_summaries option;
      [@ocaml.doc
        "A list of [TypeVersionSummary] structures that contain information about the specified \
         extension's versions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_type_versions_input = {
  publisher_id : publisher_id option;
      [@ocaml.doc
        "The publisher ID of the extension publisher.\n\n\
        \ Extensions published by Amazon aren't assigned a publisher ID.\n\
        \ "]
  deprecated_status : deprecated_status option;
      [@ocaml.doc
        "The deprecation status of the extension versions that you want to get summary information \
         about.\n\n\
        \ Valid values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [LIVE]: The extension version is registered and can be used in \
         CloudFormation operations, dependent on its provisioning behavior and visibility scope.\n\
        \            \n\
        \             }\n\
        \        {-   [DEPRECATED]: The extension version has been deregistered and can no longer \
         be used in CloudFormation operations.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The default is [LIVE].\n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  arn : type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the extension for which you want version summary \
         information.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension for which you want version summary information.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  type_ : registry_type option;
      [@ocaml.doc
        "The kind of the extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_type_registrations_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call this action again and assign that token to the \
         request object's [NextToken] parameter. If the request returns all results, [NextToken] \
         is set to [null].\n"]
  registration_token_list : registration_token_list option;
      [@ocaml.doc
        "A list of extension registration tokens.\n\n\
        \ Use [DescribeTypeRegistration] to return detailed information about a type registration \
         request.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_type_registrations_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  registration_status_filter : registration_status option;
      [@ocaml.doc
        "The current status of the extension registration request.\n\n\
        \ The default is [IN_PROGRESS].\n\
        \ "]
  type_arn : type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  type_ : registry_type option;
      [@ocaml.doc
        "The kind of extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_stacks_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If \
         no additional page exists, this value is null.\n"]
  stack_summaries : stack_summaries option;
      [@ocaml.doc
        "A list of [StackSummary] structures that contains information about the specified stacks.\n"]
}
[@@ocaml.doc "The output for [ListStacks] action.\n"]

type nonrec list_stacks_input = {
  stack_status_filter : stack_status_filter option;
      [@ocaml.doc
        "Stack status to use as a filter. Specify one or more stack status codes to list only \
         stacks with the specified status codes. For a complete list of stack status codes, see \
         the [StackStatus] parameter of the [Stack] data type.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
}
[@@ocaml.doc "The input for [ListStacks] action.\n"]

type nonrec list_stack_sets_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all of the remaining results, [NextToken] is set to a \
         token. To retrieve the next set of results, call [ListStackInstances] again and assign \
         that token to the request object's [NextToken] parameter. If the request returns all \
         results, [NextToken] is set to [null].\n"]
  summaries : stack_set_summaries option;
      [@ocaml.doc
        "A list of [StackSetSummary] structures that contain information about the user's StackSets.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_sets_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the management account or as a delegated administrator in a member \
         account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  status : stack_set_status option;
      [@ocaml.doc "The status of the StackSets that you want to get summary information about.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_set_operations_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all results, [NextToken] is set to a token. To retrieve the \
         next set of results, call [ListOperationResults] again and assign that token to the \
         request object's [NextToken] parameter. If there are no remaining results, [NextToken] is \
         set to [null].\n"]
  summaries : stack_set_operation_summaries option;
      [@ocaml.doc
        "A list of [StackSetOperationSummary] structures that contain summary information about \
         operations for the specified StackSet.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_set_operations_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you want to get operation summaries for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_set_operation_results_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all results, [NextToken] is set to a token. To retrieve the \
         next set of results, call [ListOperationResults] again and assign that token to the \
         request object's [NextToken] parameter. If there are no remaining results, [NextToken] is \
         set to [null].\n"]
  summaries : stack_set_operation_result_summaries option;
      [@ocaml.doc
        "A list of [StackSetOperationResultSummary] structures that contain information about the \
         specified operation results, for accounts and Amazon Web Services Regions that are \
         included in the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_set_operation_results_input = {
  filters : operation_result_filters option;
      [@ocaml.doc "The filter to apply to operation results.\n"]
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  operation_id : client_request_token; [@ocaml.doc "The ID of the StackSet operation.\n"]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you want to get operation results for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_set_auto_deployment_targets_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListStackSetAutoDeploymentTargets.html}ListStackSetAutoDeploymentTargets} \
         again and use that value for the [NextToken] parameter. If the request returns all \
         results, [NextToken] is set to an empty string.\n"]
  summaries : stack_set_auto_deployment_target_summaries option;
      [@ocaml.doc "An array of summaries of the deployment targets for the StackSet.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_set_auto_deployment_targets_input = {
  call_as : call_as option;
      [@ocaml.doc
        "Specifies whether you are acting as an account administrator in the organization's \
         management account or as a delegated administrator in a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_set_name : stack_set_name_or_id;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you want to get automatic deployment targets \
         for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_resources_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the output exceeds 1 MB, a string that identifies the next page of stack resources. If \
         no additional page exists, this value is null.\n"]
  stack_resource_summaries : stack_resource_summaries option;
      [@ocaml.doc "A list of [StackResourceSummary] structures.\n"]
}
[@@ocaml.doc "The output for a [ListStackResources] action.\n"]

type nonrec list_stack_resources_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_name : stack_name;
      [@ocaml.doc
        "The name or the unique stack ID that is associated with the stack, which aren't always \
         interchangeable:\n\n\
        \ {ul\n\
        \       {-  Running stacks: You can specify either the stack's name or its unique stack ID.\n\
        \           \n\
        \            }\n\
        \       {-  Deleted stacks: You must specify the unique stack ID.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The input for the [ListStackResource] action.\n"]

type nonrec list_stack_refactors_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call this action again and assign that token to the \
         request object's [NextToken] parameter. If the request returns all results, [NextToken] \
         is set to [null].\n"]
  stack_refactor_summaries : stack_refactor_summaries;
      [@ocaml.doc
        "Provides a summary of a stack refactor, including the following:\n\n\
        \ {ul\n\
        \       {-   [StackRefactorId] \n\
        \           \n\
        \            }\n\
        \       {-   [Status] \n\
        \           \n\
        \            }\n\
        \       {-   [StatusReason] \n\
        \           \n\
        \            }\n\
        \       {-   [ExecutionStatus] \n\
        \           \n\
        \            }\n\
        \       {-   [ExecutionStatusReason] \n\
        \           \n\
        \            }\n\
        \       {-   [Description] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_stack_refactors_input = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  execution_status_filter : stack_refactor_execution_status_filter option;
      [@ocaml.doc
        "Execution status to use as a filter. Specify one or more execution status codes to list \
         only stack refactors with the specified execution status codes.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_refactor_actions_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call this action again and assign that token to the \
         request object's [NextToken] parameter. If the request returns all results, [NextToken] \
         is set to [null].\n"]
  stack_refactor_actions : stack_refactor_actions; [@ocaml.doc "The stack refactor actions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_refactor_actions_input = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_refactor_id : stack_refactor_id;
      [@ocaml.doc
        "The ID associated with the stack refactor created from the [CreateStackRefactor] action.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_instances_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call [ListStackInstances] again and assign that \
         token to the request object's [NextToken] parameter. If the request returns all results, \
         [NextToken] is set to [null].\n"]
  summaries : stack_instance_summaries option;
      [@ocaml.doc
        "A list of [StackInstanceSummary] structures that contain information about the specified \
         stack instances.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_instances_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  stack_instance_region : region option;
      [@ocaml.doc "The name of the Region where you want to list stack instances.\n"]
  stack_instance_account : account option;
      [@ocaml.doc
        "The name of the Amazon Web Services account that you want to list stack instances for.\n"]
  filters : stack_instance_filters option; [@ocaml.doc "The filter to apply to stack instances\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you want to list stack instances for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_instance_resource_drifts_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the previous paginated request didn't return all of the remaining results, the \
         response object's [NextToken] parameter value is set to a token. To retrieve the next set \
         of results, call this action again and assign that token to the request object's \
         [NextToken] parameter. If there are no remaining results, the previous response object's \
         [NextToken] parameter is set to [null].\n"]
  summaries : stack_instance_resource_drifts_summaries option;
      [@ocaml.doc
        "A list of [StackInstanceResourceDriftsSummary] structures that contain information about \
         the specified stack instances.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_instance_resource_drifts_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  operation_id : client_request_token; [@ocaml.doc "The unique ID of the drift operation.\n"]
  stack_instance_region : region;
      [@ocaml.doc "The name of the Region where you want to list resource drifts.\n"]
  stack_instance_account : account;
      [@ocaml.doc
        "The name of the Amazon Web Services account that you want to list resource drifts for.\n"]
  stack_instance_resource_drift_statuses : stack_resource_drift_status_filters option;
      [@ocaml.doc
        "The resource drift status of the stack instance. \n\n\
        \ {ul\n\
        \       {-   [DELETED]: The resource differs from its expected template configuration in \
         that the resource has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED]: One or more resource properties differ from their expected \
         template values.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The resource's actual configuration matches its expected template \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation doesn't currently return this value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_set_name : stack_set_name_or_id;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you want to list drifted resources for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_scans_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call [ListResourceScans] again and use that value \
         for the [NextToken] parameter. If the request returns all results, [NextToken] is set to \
         an empty string.\n"]
  resource_scan_summaries : resource_scan_summaries option;
      [@ocaml.doc "The list of scans returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_scans_input = {
  scan_type_filter : scan_type option;
      [@ocaml.doc
        "The scan type that you want to get summary information about. The default is [FULL].\n"]
  max_results : resource_scanner_max_results option;
      [@ocaml.doc
        "If the number of available results exceeds this maximum, the response includes a \
         [NextToken] value that you can use for the [NextToken] parameter to get the next set of \
         results. The default value is 10. The maximum value is 100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_scan_resources_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call [ListResourceScanResources] again and use that \
         value for the [NextToken] parameter. If the request returns all results, [NextToken] is \
         set to an empty string.\n"]
  resources : scanned_resources option;
      [@ocaml.doc
        "List of up to [MaxResults] resources in the specified resource scan that match all of the \
         specified filters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_scan_resources_input = {
  max_results : resource_scanner_max_results option;
      [@ocaml.doc
        "If the number of available results exceeds this maximum, the response includes a \
         [NextToken] value that you can use for the [NextToken] parameter to get the next set of \
         results. By default the [ListResourceScanResources] API action will return at most 100 \
         results in each response. The maximum value is 100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  tag_value : tag_value option;
      [@ocaml.doc "If specified, the returned resources will have a matching tag value.\n"]
  tag_key : tag_key option;
      [@ocaml.doc "If specified, the returned resources will have a matching tag key.\n"]
  resource_type_prefix : resource_type_prefix option;
      [@ocaml.doc
        "If specified, the returned resources will be of any of the resource types with the \
         specified prefix.\n"]
  resource_identifier : resource_identifier option;
      [@ocaml.doc
        "If specified, the returned resources will have the specified resource identifier (or one \
         of them in the case where the resource has multiple identifiers).\n"]
  resource_scan_id : resource_scan_id;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource scan.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_scan_related_resources_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call [ListResourceScanRelatedResources] again and \
         use that value for the [NextToken] parameter. If the request returns all results, \
         [NextToken] is set to an empty string.\n"]
  related_resources : related_resources option;
      [@ocaml.doc
        "List of up to [MaxResults] resources in the specified resource scan related to the \
         specified resources.\n"]
}
[@@ocaml.doc ""]

type nonrec boxed_max_results = int [@@ocaml.doc ""]

type nonrec list_resource_scan_related_resources_input = {
  max_results : boxed_max_results option;
      [@ocaml.doc
        "If the number of available results exceeds this maximum, the response includes a \
         [NextToken] value that you can use for the [NextToken] parameter to get the next set of \
         results. By default the [ListResourceScanRelatedResources] API action will return up to \
         100 results in each response. The maximum value is 100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  resources : scanned_resource_identifiers;
      [@ocaml.doc
        "The list of resources for which you want to get the related resources. Up to 100 \
         resources can be provided.\n"]
  resource_scan_id : resource_scan_id;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource scan.\n"]
}
[@@ocaml.doc ""]

type nonrec imports = stack_name list [@@ocaml.doc ""]

type nonrec list_imports_output = {
  next_token : next_token option;
      [@ocaml.doc
        "A string that identifies the next page of exports. If there is no additional page, this \
         value is null.\n"]
  imports : imports option;
      [@ocaml.doc "A list of stack names that are importing the specified exported output value.\n"]
}
[@@ocaml.doc ""]

type nonrec list_imports_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  export_name : export_name;
      [@ocaml.doc
        "The name of the exported output value. CloudFormation returns the stack names that are \
         importing this value.\n"]
}
[@@ocaml.doc ""]

type nonrec list_hook_results_target_type =
  | CLOUD_CONTROL [@ocaml.doc ""]
  | RESOURCE [@ocaml.doc ""]
  | STACK [@ocaml.doc ""]
  | CHANGE_SET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hook_result_id = string [@@ocaml.doc ""]

type nonrec hook_type_name = string [@@ocaml.doc ""]

type nonrec hook_type_version_id = string [@@ocaml.doc ""]

type nonrec hook_type_configuration_version_id = string [@@ocaml.doc ""]

type nonrec hook_type_arn = string [@@ocaml.doc ""]

type nonrec hook_result_summary = {
  hook_execution_target : hook_result_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target stack or request token of the Cloud Control \
         API operation.\n\n\
        \ Only shown in responses when the request does not specify [TargetType] and [TargetId] \
         filters.\n\
        \ "]
  type_arn : hook_type_arn option; [@ocaml.doc "The ARN of the Hook that was invoked.\n"]
  target_id : hook_result_id option;
      [@ocaml.doc "The unique identifier of the Hook invocation target.\n"]
  target_type : list_hook_results_target_type option;
      [@ocaml.doc "The target type that the Hook was invoked against.\n"]
  invoked_at : timestamp option;
      [@ocaml.doc
        "The timestamp when the Hook was invoked.\n\n\
        \ Only shown in responses when the request does not specify [TargetType] and [TargetId] \
         filters.\n\
        \ "]
  hook_status_reason : hook_status_reason option;
      [@ocaml.doc
        "A description of the Hook results status. For example, if the Hook result is in a failed \
         state, this may contain additional information for the failed state.\n"]
  status : hook_status option;
      [@ocaml.doc
        "The status of the Hook invocation. The following statuses are possible:\n\n\
        \ {ul\n\
        \       {-   [HOOK_IN_PROGRESS]: The Hook is currently running.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_COMPLETE_SUCCEEDED]: The Hook completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_COMPLETE_FAILED]: The Hook completed but failed validation.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_FAILED]: The Hook encountered an error during execution.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  type_configuration_version_id : hook_type_configuration_version_id option;
      [@ocaml.doc "The version of the Hook configuration.\n"]
  type_version_id : hook_type_version_id option;
      [@ocaml.doc "The version of the Hook that was invoked.\n"]
  type_name : hook_type_name option; [@ocaml.doc "The name of the Hook that was invoked.\n"]
  failure_mode : hook_failure_mode option; [@ocaml.doc "The failure mode of the invocation.\n"]
  invocation_point : hook_invocation_point option;
      [@ocaml.doc "The specific point in the provisioning process where the Hook is invoked.\n"]
  hook_result_id : hook_invocation_id option;
      [@ocaml.doc "The unique identifier for this Hook invocation result.\n"]
}
[@@ocaml.doc "A [ListHookResults] call returns a summary of a Hook invocation.\n"]

type nonrec hook_result_summaries = hook_result_summary list [@@ocaml.doc ""]

type nonrec list_hook_results_output = {
  next_token : next_token option;
      [@ocaml.doc "Pagination token, [null] or empty if no more results.\n"]
  hook_results : hook_result_summaries option;
      [@ocaml.doc
        "A list of [HookResultSummary] structures that provides the status and Hook status reason \
         for each Hook invocation for the specified target.\n"]
  target_id : hook_result_id option;
      [@ocaml.doc "The unique identifier of the Hook invocation target.\n"]
  target_type : list_hook_results_target_type option; [@ocaml.doc "The target type.\n"]
}
[@@ocaml.doc ""]

type nonrec list_hook_results_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  status : hook_status option;
      [@ocaml.doc
        "Filters results by the status of Hook invocations. Can only be used in combination with \
         [TypeArn]. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [HOOK_IN_PROGRESS]: The Hook is currently running.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_COMPLETE_SUCCEEDED]: The Hook completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_COMPLETE_FAILED]: The Hook completed but failed validation.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_FAILED]: The Hook encountered an error during execution.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  type_arn : hook_type_arn option;
      [@ocaml.doc
        "Filters results by the ARN of the Hook. Can be used alone or in combination with [Status].\n"]
  target_id : hook_result_id option;
      [@ocaml.doc
        "Filters results by the unique identifier of the target the Hook was invoked against.\n\n\
        \ For change sets, this is the change set ARN. When the target is a Cloud Control API \
         operation, this value must be the [HookRequestToken] returned by the Cloud Control API \
         request. For more information on the [HookRequestToken], see \
         {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_ProgressEvent.html}ProgressEvent}.\n\
        \ \n\
        \  Required when [TargetType] is specified and cannot be used otherwise.\n\
        \  "]
  target_type : list_hook_results_target_type option;
      [@ocaml.doc
        "Filters results by target type. Currently, only [CHANGE_SET] and [CLOUD_CONTROL] are \
         supported filter options.\n\n\
        \ Required when [TargetId] is specified and cannot be used otherwise.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec hook_result_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified target doesn't have any requested Hook invocations.\n"]

type nonrec list_generated_templates_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call [ListGeneratedTemplates] again and use that \
         value for the [NextToken] parameter. If the request returns all results, [NextToken] is \
         set to an empty string.\n"]
  summaries : template_summaries option;
      [@ocaml.doc "A list of summaries of the generated templates.\n"]
}
[@@ocaml.doc ""]

type nonrec list_generated_templates_input = {
  max_results : max_results option;
      [@ocaml.doc
        "If the number of available results exceeds this maximum, the response includes a \
         [NextToken] value that you can use for the [NextToken] parameter to get the next set of \
         results. By default the [ListGeneratedTemplates] API action will return at most 50 \
         results in each response. The maximum value is 100.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
}
[@@ocaml.doc ""]

type nonrec export_value = string [@@ocaml.doc ""]

type nonrec export_ = {
  value : export_value option;
      [@ocaml.doc
        "The value of the exported output, such as a resource physical ID. This value is defined \
         in the [Export] field in the associated stack's [Outputs] section.\n"]
  name : export_name option;
      [@ocaml.doc
        "The name of exported output value. Use this name and the [Fn::ImportValue] function to \
         import the associated value into other stacks. The name is defined in the [Export] field \
         in the associated stack's [Outputs] section.\n"]
  exporting_stack_id : stack_id option;
      [@ocaml.doc "The stack that contains the exported output name and value.\n"]
}
[@@ocaml.doc
  "The [Export] structure describes the exported output values for a stack.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html}Get \
   exported outputs from a deployed CloudFormation stack}.\n\
  \ "]

type nonrec exports = export_ list [@@ocaml.doc ""]

type nonrec list_exports_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the output exceeds 100 exported output values, a string that identifies the next page \
         of exports. If there is no additional page, this value is null.\n"]
  exports : exports option; [@ocaml.doc "The output for the [ListExports] action.\n"]
}
[@@ocaml.doc ""]

type nonrec list_exports_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
}
[@@ocaml.doc ""]

type nonrec change_set_name = string [@@ocaml.doc ""]

type nonrec execution_status =
  | OBSOLETE [@ocaml.doc ""]
  | EXECUTE_FAILED [@ocaml.doc ""]
  | EXECUTE_COMPLETE [@ocaml.doc ""]
  | EXECUTE_IN_PROGRESS [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | UNAVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec change_set_status =
  | FAILED [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_PENDING [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec change_set_status_reason = string [@@ocaml.doc ""]

type nonrec include_nested_stacks = bool [@@ocaml.doc ""]

type nonrec import_existing_resources = bool [@@ocaml.doc ""]

type nonrec change_set_summary = {
  import_existing_resources : import_existing_resources option;
      [@ocaml.doc "Indicates if the change set imports resources that already exist.\n"]
  root_change_set_id : change_set_id option; [@ocaml.doc "The root change set ID.\n"]
  parent_change_set_id : change_set_id option; [@ocaml.doc "The parent change set ID.\n"]
  include_nested_stacks : include_nested_stacks option;
      [@ocaml.doc "Specifies the current setting of [IncludeNestedStacks] for the change set.\n"]
  description : description option; [@ocaml.doc "Descriptive information about the change set.\n"]
  creation_time : creation_time option;
      [@ocaml.doc "The start time when the change set was created, in UTC.\n"]
  status_reason : change_set_status_reason option;
      [@ocaml.doc
        "A description of the change set's status. For example, if your change set is in the \
         [FAILED] state, CloudFormation shows the error message.\n"]
  status : change_set_status option;
      [@ocaml.doc
        "The state of the change set, such as [CREATE_PENDING], [CREATE_COMPLETE], or [FAILED].\n"]
  execution_status : execution_status option;
      [@ocaml.doc
        "If the change set execution status is [AVAILABLE], you can execute the change set. If you \
         can't execute the change set, the status indicates why. For example, a change set might \
         be in an [UNAVAILABLE] state because CloudFormation is still creating it or in an \
         [OBSOLETE] state because the stack was already updated.\n"]
  change_set_name : change_set_name option; [@ocaml.doc "The name of the change set.\n"]
  change_set_id : change_set_id option; [@ocaml.doc "The ID of the change set.\n"]
  stack_name : stack_name option;
      [@ocaml.doc "The name of the stack with which the change set is associated.\n"]
  stack_id : stack_id option;
      [@ocaml.doc "The ID of the stack with which the change set is associated.\n"]
}
[@@ocaml.doc
  "The [ChangeSetSummary] structure describes a change set, its status, and the stack with which \
   it's associated.\n"]

type nonrec change_set_summaries = change_set_summary list [@@ocaml.doc ""]

type nonrec list_change_sets_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the output exceeds 1 MB, a string that identifies the next page of change sets. If \
         there is no additional page, this value is [null].\n"]
  summaries : change_set_summaries option;
      [@ocaml.doc
        "A list of [ChangeSetSummary] structures that provides the ID and status of each change \
         set for the specified stack.\n"]
}
[@@ocaml.doc "The output for the [ListChangeSets] action.\n"]

type nonrec list_change_sets_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_name : stack_name_or_id;
      [@ocaml.doc
        "The name or the Amazon Resource Name (ARN) of the stack for which you want to list change \
         sets.\n"]
}
[@@ocaml.doc "The input for the [ListChangeSets] action.\n"]

type nonrec limit_value = int [@@ocaml.doc ""]

type nonrec limit_name = string [@@ocaml.doc ""]

type nonrec invalid_change_set_status_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified change set can't be used to update the stack. For example, the change set status \
   might be [CREATE_IN_PROGRESS], or the stack status might be [UPDATE_IN_PROGRESS].\n"]

type nonrec include_property_values = bool [@@ocaml.doc ""]

type nonrec import_stacks_to_stack_set_output = {
  operation_id : client_request_token option;
      [@ocaml.doc "The unique identifier for the StackSet operation.\n"]
}
[@@ocaml.doc ""]

type nonrec import_stacks_to_stack_set_input = {
  call_as : call_as option;
      [@ocaml.doc
        "By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\n\
        \ {ul\n\
        \       {-  If you are signed in to the management account, specify [SELF].\n\
        \           \n\
        \            }\n\
        \       {-  For service managed StackSets, specify [DELEGATED_ADMIN].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  operation_id : client_request_token option;
      [@ocaml.doc "A unique, user defined, identifier for the StackSet operation.\n"]
  operation_preferences : stack_set_operation_preferences option;
      [@ocaml.doc
        "The user-specified preferences for how CloudFormation performs a StackSet operation.\n\n\
        \ For more information about maximum concurrent accounts and failure tolerance, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options}StackSet \
         operation options}.\n\
        \ "]
  organizational_unit_ids : organizational_unit_id_list option;
      [@ocaml.doc
        "The list of OU ID's to which the imported stacks must be mapped as deployment targets.\n"]
  stack_ids_url : stack_ids_url option;
      [@ocaml.doc
        "The Amazon S3 URL which contains list of stack ids to be inputted.\n\n\
        \ Specify either [StackIds] or [StackIdsUrl].\n\
        \ "]
  stack_ids : stack_id_list option;
      [@ocaml.doc
        "The IDs of the stacks you are importing into a StackSet. You import up to 10 stacks per \
         StackSet at a time.\n\n\
        \ Specify either [StackIds] or [StackIdsUrl].\n\
        \ "]
  stack_set_name : stack_set_name_or_id;
      [@ocaml.doc
        "The name of the StackSet. The name must be unique in the Region where you create your \
         StackSet.\n"]
}
[@@ocaml.doc ""]

type nonrec hook_target_type_name = string [@@ocaml.doc ""]

type nonrec hook_target_type = RESOURCE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec hook_target_id = string [@@ocaml.doc ""]

type nonrec hook_target_action =
  | IMPORT [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
  | UPDATE [@ocaml.doc ""]
  | CREATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hook_target = {
  action : hook_target_action; [@ocaml.doc "The action that invoked the Hook.\n"]
  target_id : hook_target_id; [@ocaml.doc "The unique identifier of the Hook invocation target.\n"]
  target_type_name : hook_target_type_name;
      [@ocaml.doc "The target name, for example, [AWS::S3::Bucket].\n"]
  target_type : hook_target_type; [@ocaml.doc "The target type.\n"]
}
[@@ocaml.doc "The [HookTarget] data type.\n"]

type nonrec hook_invocation_count = int [@@ocaml.doc ""]

type nonrec get_template_summary_output = {
  warnings : warnings option; [@ocaml.doc "An object that contains any warnings returned.\n"]
  resource_identifier_summaries : resource_identifier_summaries option;
      [@ocaml.doc
        "A list of resource identifier summaries that describe the target resources of an import \
         operation and the properties you can provide during the import to identify the target \
         resources. For example, [BucketName] is a possible identifier property for an \
         [AWS::S3::Bucket] resource.\n"]
  declared_transforms : transforms_list option;
      [@ocaml.doc "A list of the transforms that are declared in the template.\n"]
  metadata : metadata option;
      [@ocaml.doc "The value that's defined for the [Metadata] property of the template.\n"]
  version : version option;
      [@ocaml.doc
        "The Amazon Web Services template format version, which identifies the capabilities of the \
         template.\n"]
  resource_types : resource_types option;
      [@ocaml.doc
        "A list of all the template resource types that are defined in the template, such as \
         [AWS::EC2::Instance], [AWS::Dynamo::Table], and [Custom::MyCustomInstance].\n"]
  capabilities_reason : capabilities_reason option;
      [@ocaml.doc
        "The list of resources that generated the values in the [Capabilities] response element.\n"]
  capabilities : capabilities option;
      [@ocaml.doc
        "The capabilities found within the template. If your template contains IAM resources, you \
         must specify the [CAPABILITY_IAM] or [CAPABILITY_NAMED_IAM] value for this parameter when \
         you use the [CreateStack] or [UpdateStack] actions with your template; otherwise, those \
         actions return an [InsufficientCapabilities] error.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities}Acknowledging \
         IAM resources in CloudFormation templates}.\n\
        \ "]
  description : description option;
      [@ocaml.doc "The value that's defined in the [Description] property of the template.\n"]
  parameters : parameter_declarations option;
      [@ocaml.doc
        "A list of parameter declarations that describe various properties for each parameter.\n"]
}
[@@ocaml.doc "The output for the [GetTemplateSummary] action.\n"]

type nonrec get_template_summary_input = {
  template_summary_config : template_summary_config option;
      [@ocaml.doc "Specifies options for the [GetTemplateSummary] API action.\n"]
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  stack_set_name : stack_set_name_or_id option;
      [@ocaml.doc
        "The name or unique ID of the StackSet from which the stack was created.\n\n\
        \ Conditional: You must specify only one of the following parameters: [StackName], \
         [StackSetName], [TemplateBody], or [TemplateURL].\n\
        \ "]
  stack_name : stack_name_or_id option;
      [@ocaml.doc
        "The name or the stack ID that's associated with the stack, which aren't always \
         interchangeable. For running stacks, you can specify either the stack's name or its \
         unique stack ID. For deleted stack, you must specify the unique stack ID.\n\n\
        \ Conditional: You must specify only one of the following parameters: [StackName], \
         [StackSetName], [TemplateBody], or [TemplateURL].\n\
        \ "]
  template_ur_l : template_ur_l option;
      [@ocaml.doc
        "The URL of a file that contains the template body. The URL must point to a template (max \
         size: 1 MB) that's located in an Amazon S3 bucket or a Systems Manager document. The \
         location for an Amazon S3 bucket must start with [https://].\n\n\
        \ Conditional: You must specify only one of the following parameters: [StackName], \
         [StackSetName], [TemplateBody], or [TemplateURL].\n\
        \ "]
  template_body : template_body option;
      [@ocaml.doc
        "Structure that contains the template body with a minimum length of 1 byte and a maximum \
         length of 51,200 bytes.\n\n\
        \ Conditional: You must specify only one of the following parameters: [StackName], \
         [StackSetName], [TemplateBody], or [TemplateURL].\n\
        \ "]
}
[@@ocaml.doc "The input for the [GetTemplateSummary] action.\n"]

type nonrec get_template_output = {
  stages_available : stage_list option;
      [@ocaml.doc
        "The stage of the template that you can retrieve. For stacks, the [Original] and \
         [Processed] templates are always available. For change sets, the [Original] template is \
         always available. After CloudFormation finishes creating the change set, the [Processed] \
         template becomes available.\n"]
  template_body : template_body option;
      [@ocaml.doc
        "Structure that contains the template body.\n\n\
        \ CloudFormation returns the same template that was used when the stack was created.\n\
        \ "]
}
[@@ocaml.doc "The output for [GetTemplate] action.\n"]

type nonrec change_set_name_or_id = string [@@ocaml.doc ""]

type nonrec get_template_input = {
  template_stage : template_stage option;
      [@ocaml.doc
        "For templates that include transforms, the stage of the template that CloudFormation \
         returns. To get the user-submitted template, specify [Original]. To get the template \
         after CloudFormation has processed all transforms, specify [Processed].\n\n\
        \ If the template doesn't include transforms, [Original] and [Processed] return the same \
         template. By default, CloudFormation specifies [Processed].\n\
        \ "]
  change_set_name : change_set_name_or_id option;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of a change set for which CloudFormation returns \
         the associated template. If you specify a name, you must also specify the [StackName].\n"]
  stack_name : stack_name option;
      [@ocaml.doc
        "The name or the unique stack ID that's associated with the stack, which aren't always \
         interchangeable:\n\n\
        \ {ul\n\
        \       {-  Running stacks: You can specify either the stack's name or its unique stack ID.\n\
        \           \n\
        \            }\n\
        \       {-  Deleted stacks: You must specify the unique stack ID.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The input for a [GetTemplate] action.\n"]

type nonrec change_set_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified change set name or ID doesn't exit. To view valid change sets for a stack, use \
   the [ListChangeSets] operation.\n"]

type nonrec get_stack_policy_output = {
  stack_policy_body : stack_policy_body option;
      [@ocaml.doc
        "Structure that contains the stack policy body. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html}Prevent \
         updates to stack resources} in the {i CloudFormation User Guide}.\n"]
}
[@@ocaml.doc "The output for the [GetStackPolicy] action.\n"]

type nonrec get_stack_policy_input = {
  stack_name : stack_name;
      [@ocaml.doc
        "The name or unique stack ID that's associated with the stack whose policy you want to get.\n"]
}
[@@ocaml.doc "The input for the [GetStackPolicy] action.\n"]

type nonrec annotation_name = string [@@ocaml.doc ""]

type nonrec annotation_status =
  | SKIPPED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | PASSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec annotation_remediation_link = string [@@ocaml.doc ""]

type nonrec annotation_severity_level =
  | CRITICAL [@ocaml.doc ""]
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | INFORMATIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec annotation = {
  severity_level : annotation_severity_level option;
      [@ocaml.doc "The relative risk associated with any violations of this type.\n"]
  remediation_link : annotation_remediation_link option;
      [@ocaml.doc "A URL that you can access for additional remediation guidance.\n"]
  remediation_message : remediation_message_remediation_message option;
      [@ocaml.doc
        "Suggests what to change if your Hook returns a [FAILED] status. For example, \"Block \
         public access to the bucket\".\n"]
  status_message : remediation_message_status_message option;
      [@ocaml.doc
        "The explanation for the specific status assigned to this Hook invocation. For example, \
         \"Bucket does not block public access\".\n"]
  status : annotation_status option;
      [@ocaml.doc "The status of the Hook invocation from the downstream service.\n"]
  annotation_name : annotation_name option;
      [@ocaml.doc
        "An identifier for the evaluation logic that was used when invoking the Hook. For Control \
         Tower, this is the control ID. For Guard, this is the rule ID. For Lambda and custom \
         Hooks, this is a user-defined identifier.\n"]
}
[@@ocaml.doc
  "The [Annotation] data type.\n\n\
  \ A [GetHookResult] call returns detailed information and remediation guidance from Control \
   Tower, Guard, Lambda, or custom Hooks for a Hook invocation result.\n\
  \ "]

type nonrec annotation_list = annotation list [@@ocaml.doc ""]

type nonrec get_hook_result_output = {
  annotations : annotation_list option;
      [@ocaml.doc
        "A list of objects with additional information and guidance that can help you resolve a \
         failed Hook invocation.\n"]
  target : hook_target option; [@ocaml.doc "Information about the target of the Hook invocation.\n"]
  invoked_at : timestamp option; [@ocaml.doc "The timestamp when the Hook was invoked.\n"]
  hook_status_reason : hook_status_reason option;
      [@ocaml.doc "A message that provides additional details about the Hook invocation status.\n"]
  status : hook_status option;
      [@ocaml.doc
        "The status of the Hook invocation. The following statuses are possible:\n\n\
        \ {ul\n\
        \       {-   [HOOK_IN_PROGRESS]: The Hook is currently running.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_COMPLETE_SUCCEEDED]: The Hook completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_COMPLETE_FAILED]: The Hook completed but failed validation.\n\
        \           \n\
        \            }\n\
        \       {-   [HOOK_FAILED]: The Hook encountered an error during execution.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  type_arn : hook_type_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the Hook.\n"]
  type_configuration_version_id : hook_type_configuration_version_id option;
      [@ocaml.doc
        "The version identifier of the Hook configuration data that was used during invocation.\n"]
  type_version_id : hook_type_version_id option;
      [@ocaml.doc "The version identifier of the Hook that was invoked.\n"]
  original_type_name : hook_type_name option;
      [@ocaml.doc
        "The original public type name of the Hook when an alias is used.\n\n\
        \ For example, if you activate [AWS::Hooks::GuardHook] with alias \
         [MyCompany::Custom::GuardHook], then [TypeName] will be [MyCompany::Custom::GuardHook] \
         and [OriginalTypeName] will be [AWS::Hooks::GuardHook]. \n\
        \ "]
  type_name : hook_type_name option; [@ocaml.doc "The name of the Hook that was invoked.\n"]
  failure_mode : hook_failure_mode option; [@ocaml.doc "The failure mode of the invocation.\n"]
  invocation_point : hook_invocation_point option;
      [@ocaml.doc "The specific point in the provisioning process where the Hook is invoked.\n"]
  hook_result_id : hook_invocation_id option;
      [@ocaml.doc "The unique identifier of the Hook result.\n"]
}
[@@ocaml.doc ""]

type nonrec get_hook_result_input = {
  hook_result_id : hook_invocation_id option;
      [@ocaml.doc
        "The unique identifier (ID) of the Hook invocation result that you want details about. You \
         can get the ID from the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListHookResults.html}ListHookResults} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_generated_template_output = {
  template_body : template_body option;
      [@ocaml.doc
        "The template body of the generated template, in the language specified by the [Language] \
         parameter.\n"]
  status : generated_template_status option;
      [@ocaml.doc
        "The status of the template generation. Supported values are:\n\n\
        \ {ul\n\
        \       {-   [CreatePending] - the creation of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [CreateInProgress] - the creation of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [DeletePending] - the deletion of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [DeleteInProgress] - the deletion of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [UpdatePending] - the update of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [UpdateInProgress] - the update of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed] - the template operation failed.\n\
        \           \n\
        \            }\n\
        \       {-   [Complete] - the template operation is complete.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_generated_template_input = {
  generated_template_name : generated_template_name;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the generated template. The format is \
         [arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}]. For \
         example, \n\
         {[\n\
         arn:aws:cloudformation:{i us-east-1}:{i 123456789012}:generatedtemplate/{i \
         2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc} \n\
         ]}\n\
         .\n"]
  format : template_format option;
      [@ocaml.doc
        "The language to use to retrieve for the generated template. Supported values are:\n\n\
        \ {ul\n\
        \       {-   [JSON] \n\
        \           \n\
        \            }\n\
        \       {-   [YAML] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec failed_events_filter = bool [@@ocaml.doc ""]

type nonrec execute_stack_refactor_input = {
  stack_refactor_id : stack_refactor_id;
      [@ocaml.doc
        "The ID associated with the stack refactor created from the [CreateStackRefactor] action.\n"]
}
[@@ocaml.doc ""]

type nonrec execute_change_set_output = unit [@@ocaml.doc ""]

type nonrec execute_change_set_input = {
  retain_except_on_create : retain_except_on_create option;
      [@ocaml.doc
        "When set to [true], newly created resources are deleted when the operation rolls back. \
         This includes newly created resources marked with a deletion policy of [Retain].\n\n\
        \ Default: [false] \n\
        \ "]
  disable_rollback : disable_rollback option;
      [@ocaml.doc
        "Preserves the state of previously provisioned resources when an operation fails. This \
         parameter can't be specified when the [OnStackFailure] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html}CreateChangeSet} \
         API operation was specified.\n\n\
        \ {ul\n\
        \       {-   [True] - if the stack creation fails, do nothing. This is equivalent to \
         specifying [DO_NOTHING] for the [OnStackFailure] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html}CreateChangeSet} \
         API operation.\n\
        \           \n\
        \            }\n\
        \       {-   [False] - if the stack creation fails, roll back the stack. This is \
         equivalent to specifying [ROLLBACK] for the [OnStackFailure] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateChangeSet.html}CreateChangeSet} \
         API operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default: [True] \n\
        \   "]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique identifier for this [ExecuteChangeSet] request. Specify this token if you plan \
         to retry requests so that CloudFormation knows that you're not attempting to execute a \
         change set to update a stack with the same name. You might retry [ExecuteChangeSet] \
         requests to ensure that CloudFormation successfully received them.\n"]
  stack_name : stack_name_or_id option;
      [@ocaml.doc
        "If you specified the name of a change set, specify the stack name or Amazon Resource Name \
         (ARN) that's associated with the change set you want to execute.\n"]
  change_set_name : change_set_name_or_id;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the change set that you want use to update the \
         specified stack.\n"]
}
[@@ocaml.doc "The input for the [ExecuteChangeSet] action.\n"]

type nonrec event_filter = {
  failed_events : failed_events_filter option;
      [@ocaml.doc
        "When set to true, only returns failed events within the operation. This helps quickly \
         identify root causes for a failed operation.\n"]
}
[@@ocaml.doc "Event filter allows you to focus on specific events in an operation.\n"]

type nonrec estimate_template_cost_output = {
  url : url option;
      [@ocaml.doc
        "An Amazon Web Services Simple Monthly Calculator URL with a query string that describes \
         the resources required to run the template.\n"]
}
[@@ocaml.doc "The output for a [EstimateTemplateCost] action.\n"]

type nonrec estimate_template_cost_input = {
  parameters : parameters option;
      [@ocaml.doc "A list of [Parameter] structures that specify input parameters.\n"]
  template_ur_l : template_ur_l option;
      [@ocaml.doc
        "The URL of a file that contains the template body. The URL must point to a template \
         that's located in an Amazon S3 bucket or a Systems Manager document. The location for an \
         Amazon S3 bucket must start with [https://]. URLs from S3 static websites are not \
         supported.\n\n\
        \ Conditional: You must pass [TemplateURL] or [TemplateBody]. If both are passed, only \
         [TemplateBody] is used.\n\
        \ "]
  template_body : template_body option;
      [@ocaml.doc
        "Structure that contains the template body with a minimum length of 1 byte and a maximum \
         length of 51,200 bytes.\n\n\
        \ Conditional: You must pass [TemplateBody] or [TemplateURL]. If both are passed, only \
         [TemplateBody] is used.\n\
        \ "]
}
[@@ocaml.doc "The input for an [EstimateTemplateCost] action.\n"]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec enable_stack_creation = bool [@@ocaml.doc ""]

type nonrec detect_stack_set_drift_output = {
  operation_id : client_request_token option;
      [@ocaml.doc
        "The ID of the drift detection StackSet operation.\n\n\
        \ You can use this operation ID with [DescribeStackSetOperation] to monitor the progress \
         of the drift detection operation.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec detect_stack_set_drift_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  operation_id : client_request_token option;
      [@ocaml.doc " {i The ID of the StackSet operation.} \n"]
  operation_preferences : stack_set_operation_preferences option;
      [@ocaml.doc
        "The user-specified preferences for how CloudFormation performs a StackSet operation.\n\n\
        \ For more information about maximum concurrent accounts and failure tolerance, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options}StackSet \
         operation options}.\n\
        \ "]
  stack_set_name : stack_set_name_or_id;
      [@ocaml.doc "The name of the StackSet on which to perform the drift detection operation.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_stack_resource_drift_output = {
  stack_resource_drift : stack_resource_drift;
      [@ocaml.doc
        "Information about whether the resource's actual configuration has drifted from its \
         expected template configuration, including actual and expected property values and any \
         differences detected.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_stack_resource_drift_input = {
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical name of the resource for which to return drift information.\n"]
  stack_name : stack_name_or_id;
      [@ocaml.doc "The name of the stack to which the resource belongs.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_stack_drift_output = {
  stack_drift_detection_id : stack_drift_detection_id;
      [@ocaml.doc
        "The ID of the drift detection results of this operation.\n\n\
        \ CloudFormation generates new results, with a new drift detection ID, each time this \
         operation is run. However, the number of drift results CloudFormation retains for any \
         given stack, and for how long, may vary.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec detect_stack_drift_input = {
  logical_resource_ids : logical_resource_ids option;
      [@ocaml.doc "The logical names of any resources you want to use as filters.\n"]
  stack_name : stack_name_or_id;
      [@ocaml.doc "The name of the stack for which you want to detect drift.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_type_registration_output = {
  type_version_arn : type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of this specific version of the extension being \
         registered.\n\n\
        \ For registration requests with a [ProgressStatus] of other than [COMPLETE], this will be \
         [null].\n\
        \ "]
  type_arn : type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the extension being registered.\n\n\
        \ For registration requests with a [ProgressStatus] of other than [COMPLETE], this will be \
         [null].\n\
        \ "]
  description : description option;
      [@ocaml.doc "The description of the extension registration request.\n"]
  progress_status : registration_status option;
      [@ocaml.doc "The current status of the extension registration request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_type_registration_input = {
  registration_token : registration_token;
      [@ocaml.doc
        "The identifier for this registration request.\n\n\
        \ This registration token is generated by CloudFormation when you initiate a registration \
         request using [RegisterType].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec configuration_schema = string [@@ocaml.doc ""]

type nonrec auto_update = bool [@@ocaml.doc ""]

type nonrec describe_type_output = {
  auto_update : auto_update option;
      [@ocaml.doc
        "Whether CloudFormation automatically updates the extension in this account and Region \
         when a new {i minor} version is published by the extension publisher. Major versions \
         released by the publisher must be manually updated. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-auto}Automatically \
         use new versions of extensions} in the {i CloudFormation User Guide}.\n"]
  is_activated : is_activated option;
      [@ocaml.doc
        "Whether the extension is activated in the account and Region.\n\n\
        \ This only applies to public third-party extensions. For all other extensions, \
         CloudFormation returns [null].\n\
        \ "]
  latest_public_version : public_version_number option;
      [@ocaml.doc
        "The latest version of a public extension {i that is available} for use.\n\n\
        \ This only applies if you specify a public extension, and you don't specify a version. \
         For all other requests, CloudFormation returns [null].\n\
        \ "]
  public_version_number : public_version_number option;
      [@ocaml.doc
        "The version number of a public third-party extension.\n\n\
        \ This applies only if you specify a public extension you have activated in your account, \
         or specify a public extension without specifying a version. For all other extensions, \
         CloudFormation returns [null].\n\
        \ "]
  original_type_arn : type_arn option;
      [@ocaml.doc
        "For public extensions that have been activated for this account and Region, the Amazon \
         Resource Name (ARN) of the public extension.\n"]
  original_type_name : type_name option;
      [@ocaml.doc
        "For public extensions that have been activated for this account and Region, the type name \
         of the public extension.\n\n\
        \ If you specified a [TypeNameAlias] when enabling the extension in this account and \
         Region, CloudFormation treats that alias as the extension's type name within the account \
         and Region, not the type name of the public extension. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html#registry-public-enable-alias}Use \
         aliases to refer to extensions} in the {i CloudFormation User Guide}.\n\
        \ "]
  publisher_id : publisher_id option;
      [@ocaml.doc
        "The publisher ID of the extension publisher.\n\n\
        \ This applies only to public third-party extensions. For private registered extensions, \
         and extensions provided by Amazon Web Services, CloudFormation returns [null].\n\
        \ "]
  configuration_schema : configuration_schema option;
      [@ocaml.doc
        "A JSON string that represent the current configuration data for the extension in this \
         account and Region.\n\n\
        \ To set the configuration data for an extension, use \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html}SetTypeConfiguration}.\n\
        \ "]
  time_created : timestamp option;
      [@ocaml.doc
        "When the specified private extension version was registered or activated in your account.\n"]
  last_updated : timestamp option;
      [@ocaml.doc
        "When the specified extension version was registered. This applies only to:\n\n\
        \ {ul\n\
        \       {-  Private extensions you have registered in your account. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType}.\n\
        \           \n\
        \            }\n\
        \       {-  Public extensions you have activated in your account with auto-update \
         specified. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html}ActivateType}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  documentation_url : optional_secure_url option;
      [@ocaml.doc "The URL of a page providing detailed documentation for this extension.\n"]
  source_url : optional_secure_url option;
      [@ocaml.doc "The URL of the source code for the extension.\n"]
  visibility : visibility option;
      [@ocaml.doc
        "The scope at which the extension is visible and usable in CloudFormation operations.\n\n\
        \ Valid values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [PRIVATE]: The extension is only visible and usable within the account in \
         which it is registered. CloudFormation marks any extensions you register as [PRIVATE].\n\
        \            \n\
        \             }\n\
        \        {-   [PUBLIC]: The extension is publicly visible and usable within any Amazon Web \
         Services account.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  execution_role_arn : role_ar_n2 option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM execution role used to register the extension. \
         This applies only to private extensions you have registered in your account. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType}.\n\n\
        \ If the registered extension calls any Amazon Web Services APIs, you must create an {i  \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM execution role} } \
         that includes the necessary permissions to call those Amazon Web Services APIs, and \
         provision that execution role in your account. CloudFormation then assumes that execution \
         role to provide your extension with the appropriate credentials.\n\
        \ "]
  required_activated_types : required_activated_types option;
      [@ocaml.doc
        "For extensions that are modules, the public third-party extensions that must be activated \
         in your account in order for the module itself to be activated.\n"]
  logging_config : logging_config option;
      [@ocaml.doc
        "Contains logging configuration information for private extensions. This applies only to \
         private extensions you have registered in your account. For public extensions, both those \
         provided by Amazon Web Services and published by third parties, CloudFormation returns \
         [null]. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType}.\n"]
  deprecated_status : deprecated_status option;
      [@ocaml.doc
        "The deprecation status of the extension version.\n\n\
        \ Valid values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [LIVE]: The extension is activated or registered and can be used in \
         CloudFormation operations, dependent on its provisioning behavior and visibility scope.\n\
        \            \n\
        \             }\n\
        \        {-   [DEPRECATED]: The extension has been deactivated or deregistered and can no \
         longer be used in CloudFormation operations.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For public third-party extensions, CloudFormation returns [null].\n\
        \   "]
  provisioning_type : provisioning_type option;
      [@ocaml.doc
        "For resource type extensions, the provisioning behavior of the resource type. \
         CloudFormation determines the provisioning type during registration, based on the types \
         of handlers in the schema handler package submitted.\n\n\
        \ Valid values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [FULLY_MUTABLE]: The resource type includes an update handler to process \
         updates to the type during stack update operations.\n\
        \            \n\
        \             }\n\
        \        {-   [IMMUTABLE]: The resource type doesn't include an update handler, so the \
         type can't be updated and must instead be replaced during stack update operations.\n\
        \            \n\
        \             }\n\
        \        {-   [NON_PROVISIONABLE]: The resource type doesn't include all the following \
         handlers, and therefore can't actually be provisioned.\n\
        \            \n\
        \             {ul\n\
        \                   {-  create\n\
        \                       \n\
        \                        }\n\
        \                   {-  read\n\
        \                       \n\
        \                        }\n\
        \                   {-  delete\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \  "]
  schema : type_schema option;
      [@ocaml.doc
        "The schema that defines the extension.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}Resource \
         type schema} in the {i CloudFormation Command Line Interface (CLI) User Guide} and the \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/what-is-cloudformation-hooks.html}CloudFormation \
         Hooks User Guide}.\n\
        \ "]
  description : description option; [@ocaml.doc "The description of the extension.\n"]
  type_tests_status_description : type_tests_status_description option;
      [@ocaml.doc
        "The description of the test status. To return the extension test status of a specific \
         extension version, you must specify [VersionId].\n\n\
        \ This applies only to registered private extension versions. CloudFormation doesn't \
         return this information for public extensions, whether they are activated in your account.\n\
        \ "]
  type_tests_status : type_tests_status option;
      [@ocaml.doc
        "The contract test status of the registered extension version. To return the extension \
         test status of a specific extension version, you must specify [VersionId].\n\n\
        \ This applies only to registered private extension versions. CloudFormation doesn't \
         return this information for public extensions, whether they are activated in your account.\n\
        \ \n\
        \  {ul\n\
        \        {-   [PASSED]: The extension has passed all its contract tests.\n\
        \            \n\
        \             An extension must have a test status of [PASSED] before it can be published. \
         For more information, see \
         {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-publish.html}Publishing \
         extensions to make them available for public use} in the {i CloudFormation Command Line \
         Interface (CLI) User Guide}.\n\
        \             \n\
        \              }\n\
        \        {-   [FAILED]: The extension has failed one or more contract tests.\n\
        \            \n\
        \             }\n\
        \        {-   [IN_PROGRESS]: Contract tests are currently being performed on the extension.\n\
        \            \n\
        \             }\n\
        \        {-   [NOT_TESTED]: Contract tests haven't been performed on the extension.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  is_default_version : is_default_version option;
      [@ocaml.doc
        "Whether the specified extension version is set as the default version.\n\n\
        \ This applies only to private extensions you have registered in your account, and \
         extensions published by Amazon Web Services. For public third-party extensions, whether \
         they are activated in your account, CloudFormation returns [null].\n\
        \ "]
  default_version_id : type_version_id option;
      [@ocaml.doc
        "The ID of the default version of the extension. The default version is used when the \
         extension version isn't specified.\n\n\
        \ This applies only to private extensions you have registered in your account. For public \
         extensions, both those provided by Amazon Web Services and published by third parties, \
         CloudFormation returns [null]. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType}.\n\
        \ \n\
        \  To set the default version of an extension, use [SetTypeDefaultVersion].\n\
        \  "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ If the extension is a public third-party type you have activated with a type name alias, \
         CloudFormation returns the type name alias. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ActivateType.html}ActivateType}.\n\
        \ "]
  type_ : registry_type option; [@ocaml.doc "The kind of extension.\n"]
  arn : type_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the extension.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_type_input = {
  public_version_number : public_version_number option;
      [@ocaml.doc "The version number of a public third-party extension.\n"]
  publisher_id : publisher_id option;
      [@ocaml.doc
        "The publisher ID of the extension publisher.\n\n\
        \ Extensions provided by Amazon Web Services are not assigned a publisher ID.\n\
        \ "]
  version_id : type_version_id option;
      [@ocaml.doc
        "The ID of a specific version of the extension. The version ID is the value at the end of \
         the Amazon Resource Name (ARN) assigned to the extension version when it is registered.\n\n\
        \ If you specify a [VersionId], [DescribeType] returns information about that specific \
         extension version. Otherwise, it returns information about the default extension version.\n\
        \ "]
  arn : type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  type_ : registry_type option;
      [@ocaml.doc
        "The kind of extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_stacks_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If \
         no additional page exists, this value is null.\n"]
  stacks : stacks option; [@ocaml.doc "A list of stack structures.\n"]
}
[@@ocaml.doc "The output for a [DescribeStacks] action.\n"]

type nonrec describe_stacks_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_name : stack_name option;
      [@ocaml.doc
        " If you don't pass a parameter to [StackName], the API returns a response that describes \
         all resources in the account, which can impact performance. This requires [ListStacks] \
         and [DescribeStacks] permissions.\n\
        \ \n\
        \  Consider using the [ListStacks] API if you're not passing a parameter to [StackName].\n\
        \  \n\
        \   The IAM policy below can be added to IAM policies when you want to limit \
         resource-level permissions and avoid returning a response when no parameter is sent in \
         the request:\n\
        \   \n\
        \    \\{ \"Version\": \"2012-10-17\", \"Statement\": \\[\\{ \"Effect\": \"Deny\", \
         \"Action\": \"cloudformation:DescribeStacks\", \"NotResource\": \
         \"arn:aws:cloudformation:*:*:stack/*/*\" \\}\\] \\}\n\
        \    \n\
        \      The name or the unique stack ID that's associated with the stack, which aren't \
         always interchangeable:\n\
        \      \n\
        \       {ul\n\
        \             {-  Running stacks: You can specify either the stack's name or its unique \
         stack ID.\n\
        \                 \n\
        \                  }\n\
        \             {-  Deleted stacks: You must specify the unique stack ID.\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \  "]
}
[@@ocaml.doc "The input for [DescribeStacks] action.\n"]

type nonrec describe_stack_set_output = {
  stack_set : stack_set option; [@ocaml.doc "The specified StackSet.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_set_operation_output = {
  stack_set_operation : stack_set_operation option;
      [@ocaml.doc "The specified StackSet operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_set_operation_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  operation_id : client_request_token; [@ocaml.doc "The unique ID of the StackSet operation.\n"]
  stack_set_name : stack_set_name;
      [@ocaml.doc "The name or the unique stack ID of the StackSet for the stack operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_set_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  stack_set_name : stack_set_name;
      [@ocaml.doc "The name or unique ID of the StackSet whose description you want.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_resources_output = {
  stack_resources : stack_resources option; [@ocaml.doc "A list of [StackResource] structures.\n"]
}
[@@ocaml.doc "The output for a [DescribeStackResources] action.\n"]

type nonrec describe_stack_resources_input = {
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc
        "The name or unique identifier that corresponds to a physical instance ID of a resource \
         supported by CloudFormation.\n\n\
        \ For example, for an Amazon Elastic Compute Cloud (EC2) instance, [PhysicalResourceId] \
         corresponds to the [InstanceId]. You can pass the EC2 [InstanceId] to \
         [DescribeStackResources] to find which stack the instance belongs to and what other \
         resources are part of the stack.\n\
        \ \n\
        \  Required: Conditional. If you don't specify [PhysicalResourceId], you must specify \
         [StackName].\n\
        \  "]
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc "The logical name of the resource as specified in the template.\n"]
  stack_name : stack_name option;
      [@ocaml.doc
        "The name or the unique stack ID that is associated with the stack, which aren't always \
         interchangeable:\n\n\
        \ {ul\n\
        \       {-  Running stacks: You can specify either the stack's name or its unique stack ID.\n\
        \           \n\
        \            }\n\
        \       {-  Deleted stacks: You must specify the unique stack ID.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Required: Conditional. If you don't specify [StackName], you must specify \
         [PhysicalResourceId].\n\
        \   "]
}
[@@ocaml.doc "The input for [DescribeStackResources] action.\n"]

type nonrec describe_stack_resource_output = {
  stack_resource_detail : stack_resource_detail option;
      [@ocaml.doc
        "A [StackResourceDetail] structure that contains the description of the specified resource \
         in the specified stack.\n"]
}
[@@ocaml.doc "The output for a [DescribeStackResource] action.\n"]

type nonrec describe_stack_resource_input = {
  logical_resource_id : logical_resource_id;
      [@ocaml.doc "The logical name of the resource as specified in the template.\n"]
  stack_name : stack_name;
      [@ocaml.doc
        "The name or the unique stack ID that's associated with the stack, which aren't always \
         interchangeable:\n\n\
        \ {ul\n\
        \       {-  Running stacks: You can specify either the stack's name or its unique stack ID.\n\
        \           \n\
        \            }\n\
        \       {-  Deleted stacks: You must specify the unique stack ID.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The input for [DescribeStackResource] action.\n"]

type nonrec describe_stack_resource_drifts_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call [DescribeStackResourceDrifts] again and assign \
         that token to the request object's [NextToken] parameter. If the request returns all \
         results, [NextToken] is set to [null].\n"]
  stack_resource_drifts : stack_resource_drifts;
      [@ocaml.doc
        "Drift information for the resources that have been checked for drift in the specified \
         stack. This includes actual and expected configuration values for resources where \
         CloudFormation detects drift.\n\n\
        \ For a given stack, there will be one [StackResourceDrift] for each stack resource that \
         has been checked for drift. Resources that haven't yet been checked for drift aren't \
         included. Resources that do not currently support drift detection aren't checked, and so \
         not included. For a list of resources that support drift detection, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
         type support for imports and drift detection}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_stack_resource_drifts_input = {
  max_results : boxed_max_results option;
      [@ocaml.doc
        "The maximum number of results to be returned with a single call. If the number of \
         available results exceeds this maximum, the response includes a [NextToken] value that \
         you can assign to the [NextToken] request parameter to get the next set of results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_resource_drift_status_filters : stack_resource_drift_status_filters option;
      [@ocaml.doc
        "The resource drift status values to use as filters for the resource drift results \
         returned.\n\n\
        \ {ul\n\
        \       {-   [DELETED]: The resource differs from its expected template configuration in \
         that the resource has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [MODIFIED]: One or more resource properties differ from their expected \
         template values.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The resource's actual configuration matches its expected template \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation doesn't currently return this value.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN]: CloudFormation could not run drift detection for the resource.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stack_name : stack_name_or_id;
      [@ocaml.doc "The name of the stack for which you want drift information.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_refactor_output = {
  status_reason : stack_refactor_status_reason option;
      [@ocaml.doc "A detailed explanation for the stack refactor operation [Status].\n"]
  status : stack_refactor_status option;
      [@ocaml.doc
        "The stack refactor operation status that's provided after calling the \
         [CreateStackRefactor] action.\n"]
  execution_status_reason : execution_status_reason option;
      [@ocaml.doc "A detailed explanation for the stack refactor [ExecutionStatus].\n"]
  execution_status : stack_refactor_execution_status option;
      [@ocaml.doc
        "The stack refactor execution operation status that's provided after calling the \
         [ExecuteStackRefactor] action.\n"]
  stack_ids : stack_ids option; [@ocaml.doc "The unique ID for each stack.\n"]
  stack_refactor_id : stack_refactor_id option;
      [@ocaml.doc
        "The ID associated with the stack refactor created from the [CreateStackRefactor] action.\n"]
  description : description option; [@ocaml.doc "A description to help you identify the refactor.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_refactor_input = {
  stack_refactor_id : stack_refactor_id;
      [@ocaml.doc
        "The ID associated with the stack refactor created from the [CreateStackRefactor] action.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_instance_output = {
  stack_instance : stack_instance option;
      [@ocaml.doc "The stack instance that matches the specified request parameters.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_instance_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  stack_instance_region : region;
      [@ocaml.doc "The name of a Region that's associated with this stack instance.\n"]
  stack_instance_account : account;
      [@ocaml.doc
        "The ID of an Amazon Web Services account that's associated with this stack instance.\n"]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name or the unique stack ID of the StackSet that you want to get stack instance \
         information for.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_events_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the output exceeds 1 MB in size, a string that identifies the next page of events. If \
         no additional page exists, this value is null.\n"]
  stack_events : stack_events option; [@ocaml.doc "A list of [StackEvents] structures.\n"]
}
[@@ocaml.doc "The output for a [DescribeStackEvents] action.\n"]

type nonrec describe_stack_events_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_name : stack_name;
      [@ocaml.doc
        "The name or the unique stack ID that's associated with the stack, which aren't always \
         interchangeable:\n\n\
        \ {ul\n\
        \       {-  Running stacks: You can specify either the stack's name or its unique stack ID.\n\
        \           \n\
        \            }\n\
        \       {-  Deleted stacks: You must specify the unique stack ID.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The input for [DescribeStackEvents] action.\n"]

type nonrec boxed_integer = int [@@ocaml.doc ""]

type nonrec describe_stack_drift_detection_status_output = {
  timestamp : timestamp;
      [@ocaml.doc "Time at which the stack drift detection operation was initiated.\n"]
  drifted_stack_resource_count : boxed_integer option;
      [@ocaml.doc
        "Total number of stack resources that have drifted. This is NULL until the drift detection \
         operation reaches a status of [DETECTION_COMPLETE]. This value will be 0 for stacks whose \
         drift status is [IN_SYNC].\n"]
  detection_status_reason : stack_drift_detection_status_reason option;
      [@ocaml.doc "The reason the stack drift detection operation has its current status.\n"]
  detection_status : stack_drift_detection_status;
      [@ocaml.doc
        "The status of the stack drift detection operation.\n\n\
        \ {ul\n\
        \       {-   [DETECTION_COMPLETE]: The stack drift detection operation has successfully \
         completed for all resources in the stack that support drift detection. (Resources that \
         don't currently support stack detection remain unchecked.)\n\
        \           \n\
        \            If you specified logical resource IDs for CloudFormation to use as a filter \
         for the stack drift detection operation, only the resources with those logical IDs are \
         checked for drift.\n\
        \            \n\
        \             }\n\
        \       {-   [DETECTION_FAILED]: The stack drift detection operation has failed for at \
         least one resource in the stack. Results will be available for resources on which \
         CloudFormation successfully completed drift detection.\n\
        \           \n\
        \            }\n\
        \       {-   [DETECTION_IN_PROGRESS]: The stack drift detection operation is currently in \
         progress.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stack_drift_status : stack_drift_status option;
      [@ocaml.doc
        "Status of the stack's actual configuration compared to its expected configuration.\n\n\
        \ {ul\n\
        \       {-   [DRIFTED]: The stack differs from its expected template configuration. A \
         stack is considered to have drifted if one or more of its resources have drifted.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED]: CloudFormation hasn't checked if the stack differs from its \
         expected template configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC]: The stack's actual configuration matches its expected template \
         configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN]: CloudFormation could not run drift detection for a resource in the \
         stack. See the [DetectionStatusReason] for details.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stack_drift_detection_id : stack_drift_detection_id;
      [@ocaml.doc
        "The ID of the drift detection results of this operation.\n\n\
        \ CloudFormation generates new results, with a new drift detection ID, each time this \
         operation is run. However, the number of reports CloudFormation retains for any given \
         stack, and for how long, may vary.\n\
        \ "]
  stack_id : stack_id; [@ocaml.doc "The ID of the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stack_drift_detection_status_input = {
  stack_drift_detection_id : stack_drift_detection_id;
      [@ocaml.doc
        "The ID of the drift detection results of this operation.\n\n\
        \ CloudFormation generates new results, with a new drift detection ID, each time this \
         operation is run. However, the number of drift results CloudFormation retains for any \
         given stack, and for how long, may vary.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_resource_scan_output = {
  scan_filters : scan_filters option; [@ocaml.doc "The scan filters that were used.\n"]
  resources_read : resources_read option;
      [@ocaml.doc
        "The number of resources that were read. This is only available for scans with a [Status] \
         set to [COMPLETE], [EXPIRED], or [FAILED].\n\n\
        \  This field may be 0 if the resource scan failed with a \
         [ResourceScanLimitExceededException].\n\
        \  \n\
        \   "]
  resources_scanned : resources_scanned option;
      [@ocaml.doc
        "The number of resources that were listed. This is only available for scans with a \
         [Status] set to [COMPLETE], [EXPIRED], or [FAILED\n\
        \      ].\n"]
  resource_types : resource_types option;
      [@ocaml.doc
        "The list of resource types for the specified scan. Resource types are only available for \
         scans with a [Status] set to [COMPLETE] or [FAILED ].\n"]
  percentage_completed : percentage_completed option;
      [@ocaml.doc "The percentage of the resource scan that has been completed.\n"]
  end_time : timestamp option; [@ocaml.doc "The time that the resource scan was finished.\n"]
  start_time : timestamp option; [@ocaml.doc "The time that the resource scan was started.\n"]
  status_reason : resource_scan_status_reason option;
      [@ocaml.doc
        "The reason for the resource scan status, providing more information if a failure happened.\n"]
  status : resource_scan_status option;
      [@ocaml.doc
        "Status of the resource scan.\n\n\
        \   IN_PROGRESS   The resource scan is still in progress.\n\
        \                 \n\
        \                    COMPLETE   The resource scan is complete.\n\
        \                               \n\
        \                                  EXPIRED   The resource scan has expired.\n\
        \                                            \n\
        \                                               FAILED   The resource scan has failed.\n\
        \                                                        \n\
        \                                                          "]
  resource_scan_id : resource_scan_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource scan. The format is \
         [arn:${Partition}:cloudformation:${Region}:${Account}:resourceScan/${Id}]. An example is \n\
         {[\n\
         arn:aws:cloudformation:{i us-east-1}:{i 123456789012}:resourceScan/{i \
         f5b490f7-7ed4-428a-aa06-31ff25db0772} \n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_scan_input = {
  resource_scan_id : resource_scan_id;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource scan.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_publisher_output = {
  publisher_profile : publisher_profile option;
      [@ocaml.doc "The URL to the publisher's profile with the identity provider.\n"]
  identity_provider : identity_provider option;
      [@ocaml.doc
        "The type of account used as the identity provider when registering this publisher with \
         CloudFormation.\n"]
  publisher_status : publisher_status option;
      [@ocaml.doc
        "Whether the publisher is verified. Currently, all registered publishers are verified.\n"]
  publisher_id : publisher_id option; [@ocaml.doc "The ID of the extension publisher.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_publisher_input = {
  publisher_id : publisher_id option;
      [@ocaml.doc
        "The ID of the extension publisher.\n\n\
        \ If you don't supply a [PublisherId], and you have registered as an extension publisher, \
         [DescribePublisher] returns information about your own publisher account.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_organizations_access_output = {
  status : organization_status option;
      [@ocaml.doc "Presents the status of the [OrganizationAccess].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_organizations_access_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_generated_template_output = {
  total_warnings : total_warnings option;
      [@ocaml.doc
        "The number of warnings generated for this template. The warnings are found in the details \
         of each of the resources in the template.\n"]
  template_configuration : template_configuration option;
      [@ocaml.doc
        "The configuration details of the generated template, including the [DeletionPolicy] and \
         [UpdateReplacePolicy].\n"]
  stack_id : stack_id option;
      [@ocaml.doc
        "The stack ARN of the base stack if a base stack was provided when generating the template.\n"]
  progress : template_progress option;
      [@ocaml.doc "An object describing the progress of the template generation.\n"]
  last_updated_time : last_updated_time option;
      [@ocaml.doc "The time the generated template was last updated.\n"]
  creation_time : creation_time option;
      [@ocaml.doc "The time the generated template was created.\n"]
  status_reason : template_status_reason option;
      [@ocaml.doc
        "The reason for the current template generation status. This will provide more details if \
         a failure happened.\n"]
  status : generated_template_status option;
      [@ocaml.doc
        "The status of the template generation. Supported values are:\n\n\
        \ {ul\n\
        \       {-   [CreatePending] - the creation of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [CreateInProgress] - the creation of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [DeletePending] - the deletion of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [DeleteInProgress] - the deletion of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [UpdatePending] - the update of the template is pending.\n\
        \           \n\
        \            }\n\
        \       {-   [UpdateInProgress] - the update of the template is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed] - the template operation failed.\n\
        \           \n\
        \            }\n\
        \       {-   [Complete] - the template operation is complete.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resources : resource_details option;
      [@ocaml.doc
        "A list of objects describing the details of the resources in the template generation.\n"]
  generated_template_name : generated_template_name option;
      [@ocaml.doc "The name of the generated template.\n"]
  generated_template_id : generated_template_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the generated template. The format is \
         [arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}]. For \
         example, \n\
         {[\n\
         arn:aws:cloudformation:{i us-east-1}:{i 123456789012}:generatedtemplate/{i \
         2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc} \n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec describe_generated_template_input = {
  generated_template_name : generated_template_name;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) of a generated template.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_events_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the request doesn't return all the remaining results, [NextToken] is set to a token. \
         To retrieve the next set of results, call [DescribeEvents] again and assign that token to \
         the request object's [NextToken] parameter. If the request returns all results, \
         [NextToken] is set to [null].\n"]
  operation_events : operation_events option;
      [@ocaml.doc "A list of operation events that match the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_events_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  filters : event_filter option; [@ocaml.doc "Filters to apply when retrieving events.\n"]
  operation_id : operation_id option;
      [@ocaml.doc "The unique identifier of the operation for which you want to retrieve events.\n"]
  change_set_name : change_set_name_or_id option;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the change set for which you want to retrieve \
         events.\n"]
  stack_name : stack_name_or_id option;
      [@ocaml.doc
        "The name or unique stack ID for which you want to retrieve events. If you specified the \
         name of a change set, specify the stack name or ID (ARN) of the change set you want to \
         describe.\n"]
}
[@@ocaml.doc ""]

type nonrec change_type = Resource [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec change = {
  resource_change : resource_change option;
      [@ocaml.doc
        "A [ResourceChange] structure that describes the resource and action that CloudFormation \
         will perform.\n"]
  hook_invocation_count : hook_invocation_count option;
      [@ocaml.doc
        "Is either [null], if no Hooks invoke for the resource, or contains the number of Hooks \
         that will invoke for the resource.\n"]
  type_ : change_type option;
      [@ocaml.doc
        "The type of entity that CloudFormation changes.\n\n\
        \ {ul\n\
        \       {-   [Resource] This change is for a resource.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The [Change] structure describes the changes CloudFormation will perform if you execute the \
   change set.\n"]

type nonrec changes = change list [@@ocaml.doc ""]

type nonrec deployment_mode = REVERT_DRIFT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec describe_change_set_output = {
  deployment_config : deployment_config option;
      [@ocaml.doc "The deployment configuration specified when the change set was created.\n"]
  deployment_mode : deployment_mode option;
      [@ocaml.doc
        "The deployment mode specified when the change set was created. Valid value is \
         [REVERT_DRIFT]. Only present for drift-aware change sets.\n"]
  import_existing_resources : import_existing_resources option;
      [@ocaml.doc
        "Indicates if the change set imports resources that already exist.\n\n\
        \  This parameter can only import resources that have \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-properties-name.html}custom \
         names} in templates. To import resources that do not accept custom names, such as EC2 \
         instances, use the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import.html}resource \
         import} feature instead.\n\
        \  \n\
        \   "]
  on_stack_failure : on_stack_failure option;
      [@ocaml.doc
        "Determines what action will be taken if stack creation fails. When this parameter is \
         specified, the [DisableRollback] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html}ExecuteChangeSet} \
         API operation must not be specified. This must be one of these values:\n\n\
        \ {ul\n\
        \       {-   [DELETE] - Deletes the change set if the stack creation fails. This is only \
         valid when the [ChangeSetType] parameter is set to [CREATE]. If the deletion of the stack \
         fails, the status of the stack is [DELETE_FAILED].\n\
        \           \n\
        \            }\n\
        \       {-   [DO_NOTHING] - if the stack creation fails, do nothing. This is equivalent to \
         specifying [true] for the [DisableRollback] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html}ExecuteChangeSet} \
         API operation.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLLBACK] - if the stack creation fails, roll back the stack. This is \
         equivalent to specifying [false] for the [DisableRollback] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html}ExecuteChangeSet} \
         API operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  root_change_set_id : change_set_id option;
      [@ocaml.doc
        "Specifies the change set ID of the root change set in the current nested change set \
         hierarchy.\n"]
  parent_change_set_id : change_set_id option;
      [@ocaml.doc
        "Specifies the change set ID of the parent change set in the current nested change set \
         hierarchy.\n"]
  include_nested_stacks : include_nested_stacks option;
      [@ocaml.doc "Verifies if [IncludeNestedStacks] is set to [True].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the output exceeds 1 MB, a string that identifies the next page of changes. If there \
         is no additional page, this value is null.\n"]
  changes : changes option;
      [@ocaml.doc
        "A list of [Change] structures that describes the resources CloudFormation changes if you \
         execute the change set.\n"]
  tags : tags option;
      [@ocaml.doc
        "If you execute the change set, the tags that will be associated with the stack.\n"]
  capabilities : capabilities option;
      [@ocaml.doc
        "If you execute the change set, the list of capabilities that were explicitly acknowledged \
         when the change set was created.\n"]
  rollback_configuration : rollback_configuration option;
      [@ocaml.doc
        "The rollback triggers for CloudFormation to monitor during stack creation and updating \
         operations, and for the specified monitoring period afterwards.\n"]
  notification_ar_ns : notification_ar_ns option;
      [@ocaml.doc
        "The ARNs of the Amazon SNS topics that will be associated with the stack if you execute \
         the change set.\n"]
  stack_drift_status : stack_drift_status option;
      [@ocaml.doc
        "The drift status of the stack when the change set was created. Valid values:\n\n\
        \ {ul\n\
        \       {-   [DRIFTED] \226\128\147 The stack has drifted from its last deployment.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_SYNC] \226\128\147 The stack is in sync with its last deployment.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT_CHECKED] \226\128\147 CloudFormation doesn\226\128\153t currently return \
         this value.\n\
        \           \n\
        \            }\n\
        \       {-   [UNKNOWN] \226\128\147 The drift status could not be determined.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Only present for drift-aware change sets.\n\
        \   "]
  status_reason : change_set_status_reason option;
      [@ocaml.doc
        "A description of the change set's status. For example, if your attempt to create a change \
         set failed, CloudFormation shows the error message.\n"]
  status : change_set_status option;
      [@ocaml.doc
        "The current status of the change set, such as [CREATE_PENDING], [CREATE_COMPLETE], or \
         [FAILED].\n"]
  execution_status : execution_status option;
      [@ocaml.doc
        "If the change set execution status is [AVAILABLE], you can execute the change set. If you \
         can't execute the change set, the status indicates why. For example, a change set might \
         be in an [UNAVAILABLE] state because CloudFormation is still creating it or in an \
         [OBSOLETE] state because the stack was already updated.\n"]
  creation_time : creation_time option;
      [@ocaml.doc "The start time when the change set was created, in UTC.\n"]
  parameters : parameters option;
      [@ocaml.doc
        "A list of [Parameter] structures that describes the input parameters and their values \
         used to create the change set. For more information, see the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html}Parameter} \
         data type.\n"]
  description : description option; [@ocaml.doc "Information about the change set.\n"]
  stack_name : stack_name option;
      [@ocaml.doc "The name of the stack that's associated with the change set.\n"]
  stack_id : stack_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the stack that's associated with the change set.\n"]
  change_set_id : change_set_id option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the change set.\n"]
  change_set_name : change_set_name option; [@ocaml.doc "The name of the change set.\n"]
}
[@@ocaml.doc "The output for the [DescribeChangeSet] action.\n"]

type nonrec describe_change_set_input = {
  include_property_values : include_property_values option;
      [@ocaml.doc
        "If [true], the returned changes include detailed changes in the property values.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_name : stack_name_or_id option;
      [@ocaml.doc
        "If you specified the name of a change set, specify the stack name or ID (ARN) of the \
         change set you want to describe.\n"]
  change_set_name : change_set_name_or_id;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the change set that you want to describe.\n"]
}
[@@ocaml.doc "The input for the [DescribeChangeSet] action.\n"]

type nonrec change_set_hook_resource_target_details = {
  resource_action : change_action option; [@ocaml.doc "Specifies the action of the resource.\n"]
  resource_type : hook_target_type_name option;
      [@ocaml.doc "The type of CloudFormation resource, such as [AWS::S3::Bucket].\n"]
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc "The resource's logical ID, which is defined in the stack's template.\n"]
}
[@@ocaml.doc "Specifies [RESOURCE] type target details for activated Hooks.\n"]

type nonrec change_set_hook_target_details = {
  resource_target_details : change_set_hook_resource_target_details option;
      [@ocaml.doc "Required if [TargetType] is [RESOURCE].\n"]
  target_type : hook_target_type option; [@ocaml.doc "The Hook target type.\n"]
}
[@@ocaml.doc "Specifies target details for an activated Hook.\n"]

type nonrec change_set_hook = {
  target_details : change_set_hook_target_details option;
      [@ocaml.doc "Specifies details about the target that the Hook will run against.\n"]
  type_configuration_version_id : hook_type_configuration_version_id option;
      [@ocaml.doc "The version ID of the type configuration.\n"]
  type_version_id : hook_type_version_id option;
      [@ocaml.doc "The version ID of the type specified.\n"]
  type_name : hook_type_name option;
      [@ocaml.doc
        "The unique name for your Hook. Specifies a three-part namespace for your Hook, with a \
         recommended pattern of [Organization::Service::Hook].\n\n\
        \  The following organization namespaces are reserved and can't be used in your Hook type \
         names:\n\
        \  \n\
        \   {ul\n\
        \         {-   [Alexa] \n\
        \             \n\
        \              }\n\
        \         {-   [AMZN] \n\
        \             \n\
        \              }\n\
        \         {-   [Amazon] \n\
        \             \n\
        \              }\n\
        \         {-   [ASK] \n\
        \             \n\
        \              }\n\
        \         {-   [AWS] \n\
        \             \n\
        \              }\n\
        \         {-   [Custom] \n\
        \             \n\
        \              }\n\
        \         {-   [Dev] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  failure_mode : hook_failure_mode option;
      [@ocaml.doc
        "Specify the Hook failure mode for non-compliant resources in the followings ways.\n\n\
        \ {ul\n\
        \       {-   [FAIL] Stops provisioning resources.\n\
        \           \n\
        \            }\n\
        \       {-   [WARN] Allows provisioning to continue with a warning message.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  invocation_point : hook_invocation_point option;
      [@ocaml.doc "The specific point in the provisioning process where the Hook is invoked.\n"]
}
[@@ocaml.doc "Specifies the resource, the Hook, and the Hook version to be invoked.\n"]

type nonrec change_set_hooks = change_set_hook list [@@ocaml.doc ""]

type nonrec change_set_hooks_status =
  | UNAVAILABLE [@ocaml.doc ""]
  | PLANNED [@ocaml.doc ""]
  | PLANNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_change_set_hooks_output = {
  stack_name : stack_name option; [@ocaml.doc "The stack name.\n"]
  stack_id : stack_id option; [@ocaml.doc "The stack identifier (stack ID).\n"]
  next_token : next_token option;
      [@ocaml.doc "Pagination token, [null] or empty if no more results.\n"]
  status : change_set_hooks_status option;
      [@ocaml.doc "Provides the status of the change set Hook.\n"]
  hooks : change_set_hooks option; [@ocaml.doc "List of Hook objects.\n"]
  change_set_name : change_set_name option; [@ocaml.doc "The change set name.\n"]
  change_set_id : change_set_id option; [@ocaml.doc "The change set identifier (stack ID).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_change_set_hooks_input = {
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc
        "If specified, lists only the Hooks related to the specified [LogicalResourceId].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  stack_name : stack_name_or_id option;
      [@ocaml.doc
        "If you specified the name of a change set, specify the stack name or stack ID (ARN) of \
         the change set you want to describe.\n"]
  change_set_name : change_set_name_or_id;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the change set that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec account_limit = {
  value : limit_value option;
      [@ocaml.doc "The value that's associated with the account limit name.\n"]
  name : limit_name option;
      [@ocaml.doc
        "The name of the account limit.\n\n\
        \ Values: [ConcurrentResourcesLimit] | [StackLimit] | [StackOutputsLimit] \n\
        \ "]
}
[@@ocaml.doc
  "Describes the current CloudFormation limits for your account.\n\n\
  \ CloudFormation has the following limits per account:\n\
  \ \n\
  \  {ul\n\
  \        {-  Number of concurrent resources\n\
  \            \n\
  \             }\n\
  \        {-  Number of stacks\n\
  \            \n\
  \             }\n\
  \        {-  Number of stack outputs\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html}Understand \
   CloudFormation quotas} in the {i CloudFormation User Guide}.\n\
  \   "]

type nonrec account_limit_list = account_limit list [@@ocaml.doc ""]

type nonrec describe_account_limits_output = {
  next_token : next_token option;
      [@ocaml.doc
        "If the output exceeds 1 MB in size, a string that identifies the next page of limits. If \
         no additional page exists, this value is null.\n"]
  account_limits : account_limit_list option;
      [@ocaml.doc
        "An account limit structure that contain a list of CloudFormation account limits and their \
         values.\n"]
}
[@@ocaml.doc "The output for the [DescribeAccountLimits] action.\n"]

type nonrec describe_account_limits_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
}
[@@ocaml.doc "The input for the [DescribeAccountLimits] action.\n"]

type nonrec deregister_type_output = unit [@@ocaml.doc ""]

type nonrec deregister_type_input = {
  version_id : type_version_id option;
      [@ocaml.doc
        "The ID of a specific version of the extension. The version ID is the value at the end of \
         the Amazon Resource Name (ARN) assigned to the extension version when it is registered.\n"]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  type_ : registry_type option;
      [@ocaml.doc
        "The kind of extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
  arn : private_type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the extension.\n\n\
        \ Conditional: You must specify either [TypeName] and [Type], or [Arn].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_stack_set_output = unit [@@ocaml.doc ""]

type nonrec delete_stack_set_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you're deleting. You can obtain this value by \
         running [ListStackSets].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_stack_instances_output = {
  operation_id : client_request_token option;
      [@ocaml.doc "The unique identifier for this StackSet operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_stack_instances_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  operation_id : client_request_token option;
      [@ocaml.doc
        "The unique identifier for this StackSet operation.\n\n\
        \ If you don't specify an operation ID, the SDK generates one automatically.\n\
        \ \n\
        \  The operation ID also functions as an idempotency token, to ensure that CloudFormation \
         performs the StackSet operation only once, even if you retry the request multiple times. \
         You can retry StackSet operation requests to ensure that CloudFormation successfully \
         received them.\n\
        \  \n\
        \   Repeating this StackSet operation with a new operation ID retries all stack instances \
         whose status is [OUTDATED].\n\
        \   "]
  retain_stacks : retain_stacks;
      [@ocaml.doc
        "Removes the stack instances from the specified StackSet, but doesn't delete the stacks. \
         You can't reassociate a retained stack or add an existing, saved stack to a new stack \
         set.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options}StackSet \
         operation options}.\n\
        \ "]
  operation_preferences : stack_set_operation_preferences option;
      [@ocaml.doc "Preferences for how CloudFormation performs this StackSet operation.\n"]
  regions : region_list;
      [@ocaml.doc "The Amazon Web Services Regions where you want to delete StackSet instances.\n"]
  deployment_targets : deployment_targets option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] The Organizations accounts from which to delete stack \
         instances.\n\n\
        \ You can specify [Accounts] or [DeploymentTargets], but not both.\n\
        \ "]
  accounts : account_list option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The account IDs of the Amazon Web Services accounts that \
         you want to delete stack instances for.\n\n\
        \ You can specify [Accounts] or [DeploymentTargets], but not both.\n\
        \ "]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you want to delete stack instances for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_stack_input = {
  deployment_config : deployment_config option;
      [@ocaml.doc
        "The deployment configuration for this stack operation, including the deployment mode.\n"]
  deletion_mode : deletion_mode option;
      [@ocaml.doc
        "Specifies the deletion mode for the stack. Possible values are:\n\n\
        \ {ul\n\
        \       {-   [STANDARD] - Use the standard behavior. Specifying this value is the same as \
         not specifying this parameter.\n\
        \           \n\
        \            }\n\
        \       {-   [FORCE_DELETE_STACK] - Delete the stack if it's stuck in a [DELETE_FAILED] \
         state due to resource deletion failure.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique identifier for this [DeleteStack] request. Specify this token if you plan to \
         retry requests so that CloudFormation knows that you're not attempting to delete a stack \
         with the same name. You might retry [DeleteStack] requests to ensure that CloudFormation \
         successfully received them.\n\n\
        \ All events initiated by a given stack operation are assigned the same client request \
         token, which you can use to track operations. For example, if you execute a [CreateStack] \
         operation with the token [token1], then all the [StackEvents] generated by that operation \
         will have [ClientRequestToken] set as [token1].\n\
        \ \n\
        \  In the console, stack operations display the client request token on the Events tab. \
         Stack operations that are initiated from the console use the token format {i \
         Console-StackOperation-ID}, which helps you easily identify the stack operation . For \
         example, if you create a stack using the console, each stack event would be assigned the \
         same token in the following format: \
         [Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002].\n\
        \  "]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to delete the \
         stack. CloudFormation uses the role's credentials to make calls on your behalf.\n\n\
        \ If you don't specify a value, CloudFormation uses the role that was previously \
         associated with the stack. If no role is available, CloudFormation uses a temporary \
         session that's generated from your user credentials.\n\
        \ "]
  retain_resources : retain_resources option;
      [@ocaml.doc
        "For stacks in the [DELETE_FAILED] state, a list of resource logical IDs that are \
         associated with the resources you want to retain. During deletion, CloudFormation deletes \
         the stack but doesn't delete the retained resources.\n\n\
        \ Retaining resources is useful when you can't delete a resource, such as a non-empty S3 \
         bucket, but you want to delete the stack.\n\
        \ "]
  stack_name : stack_name;
      [@ocaml.doc "The name or the unique stack ID that's associated with the stack.\n"]
}
[@@ocaml.doc "The input for [DeleteStack] action.\n"]

type nonrec delete_generated_template_input = {
  generated_template_name : generated_template_name;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) of a generated template.\n"]
}
[@@ocaml.doc ""]

type nonrec concurrent_resources_limit_exceeded_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "No more than 5 generated templates can be in an [InProgress] or [Pending] status at one time. \
   This error is also returned if a generated template that is in an [InProgress] or [Pending] \
   status is attempted to be updated or deleted.\n"]

type nonrec delete_change_set_output = unit [@@ocaml.doc ""]

type nonrec delete_change_set_input = {
  stack_name : stack_name_or_id option;
      [@ocaml.doc
        "If you specified the name of a change set to delete, specify the stack name or Amazon \
         Resource Name (ARN) that's associated with it.\n"]
  change_set_name : change_set_name_or_id;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) of the change set that you want to delete.\n"]
}
[@@ocaml.doc "The input for the [DeleteChangeSet] action.\n"]

type nonrec deactivate_type_output = unit [@@ocaml.doc ""]

type nonrec deactivate_type_input = {
  arn : private_type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the extension in this account and Region.\n\n\
        \ Conditional: You must specify either [Arn], or [TypeName] and [Type].\n\
        \ "]
  type_ : third_party_type option;
      [@ocaml.doc
        "The extension type.\n\n\
        \ Conditional: You must specify either [Arn], or [TypeName] and [Type].\n\
        \ "]
  type_name : type_name option;
      [@ocaml.doc
        "The type name of the extension in this account and Region. If you specified a type name \
         alias when enabling the extension, use the type name alias.\n\n\
        \ Conditional: You must specify either [Arn], or [TypeName] and [Type].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec deactivate_organizations_access_output = unit [@@ocaml.doc ""]

type nonrec deactivate_organizations_access_input = unit [@@ocaml.doc ""]

type nonrec created_but_modified_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource exists, but has been changed.\n"]

type nonrec create_stack_set_output = {
  stack_set_id : stack_set_id option; [@ocaml.doc "The ID of the StackSet that you're creating.\n"]
}
[@@ocaml.doc ""]

type nonrec create_stack_set_input = {
  managed_execution : managed_execution option;
      [@ocaml.doc
        "Describes whether CloudFormation performs non-conflicting operations concurrently and \
         queues conflicting operations.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique identifier for this [CreateStackSet] request. Specify this token if you plan to \
         retry requests so that CloudFormation knows that you're not attempting to create another \
         StackSet with the same name. You might retry [CreateStackSet] requests to ensure that \
         CloudFormation successfully received them.\n\n\
        \ If you don't specify an operation ID, the SDK generates one automatically.\n\
        \ "]
  call_as : call_as option;
      [@ocaml.doc
        "Specifies whether you are acting as an account administrator in the organization's \
         management account or as a delegated administrator in a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  To create a StackSet with service-managed permissions while signed in to the \
         management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  To create a StackSet with service-managed permissions while signed in to a \
         delegated administrator account, specify [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated admin in \
         the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \   StackSets with service-managed permissions are created in the management account, \
         including StackSets that are created by delegated administrators.\n\
        \   \n\
        \    Valid only if the permissions model is [SERVICE_MANAGED].\n\
        \    "]
  auto_deployment : auto_deployment option;
      [@ocaml.doc
        "Describes whether StackSets automatically deploys to Organizations accounts that are \
         added to the target organization or organizational unit (OU). For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-manage-auto-deployment.html}Enable \
         or disable automatic deployments for StackSets in Organizations} in the {i CloudFormation \
         User Guide}.\n\n\
        \ Required if the permissions model is [SERVICE_MANAGED]. (Not used with self-managed \
         permissions.)\n\
        \ "]
  permission_model : permission_models option;
      [@ocaml.doc
        "Describes how the IAM roles required for StackSet operations are created. By default, \
         [SELF-MANAGED] is specified.\n\n\
        \ {ul\n\
        \       {-  With [self-managed] permissions, you must create the administrator and \
         execution roles required to deploy to target accounts. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html}Grant \
         self-managed permissions}.\n\
        \           \n\
        \            }\n\
        \       {-  With [service-managed] permissions, StackSets automatically creates the IAM \
         roles required to deploy to accounts managed by Organizations. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html}Activate \
         trusted access for StackSets with Organizations}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  execution_role_name : execution_role_name option;
      [@ocaml.doc
        "The name of the IAM execution role to use to create the StackSet. If you do not specify \
         an execution role, CloudFormation uses the [AWSCloudFormationStackSetExecutionRole] role \
         for the StackSet operation.\n\n\
        \ Specify an IAM role only if you are using customized execution roles to control which \
         stack resources users and groups can include in their StackSets.\n\
        \ \n\
        \  Valid only if the permissions model is [SELF_MANAGED].\n\
        \  "]
  administration_role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to use to create this StackSet.\n\n\
        \ Specify an IAM role only if you are using customized administrator roles to control \
         which users or groups can manage specific StackSets within the same administrator \
         account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html}Grant \
         self-managed permissions} in the {i CloudFormation User Guide}.\n\
        \ \n\
        \  Valid only if the permissions model is [SELF_MANAGED].\n\
        \  "]
  tags : tags option;
      [@ocaml.doc
        "The key-value pairs to associate with this StackSet and the stacks created from it. \
         CloudFormation also propagates these tags to supported resources that are created in the \
         stacks. A maximum number of 50 tags can be specified.\n\n\
        \ If you specify tags as part of a [CreateStackSet] action, CloudFormation checks to see \
         if you have the required IAM permission to tag resources. If you don't, the entire \
         [CreateStackSet] action fails with an [access denied] error, and the StackSet is not \
         created.\n\
        \ "]
  capabilities : capabilities option;
      [@ocaml.doc
        "In some cases, you must explicitly acknowledge that your StackSet template contains \
         certain capabilities in order for CloudFormation to create the StackSet and related stack \
         instances.\n\n\
        \ {ul\n\
        \       {-   [CAPABILITY_IAM] and [CAPABILITY_NAMED_IAM] \n\
        \           \n\
        \            Some stack templates might include resources that can affect permissions in \
         your Amazon Web Services account; for example, by creating new IAM users. For those \
         StackSets, you must explicitly acknowledge this by specifying one of these capabilities.\n\
        \            \n\
        \             The following IAM resources require you to specify either the \
         [CAPABILITY_IAM] or [CAPABILITY_NAMED_IAM] capability.\n\
        \             \n\
        \              {ul\n\
        \                    {-  If you have IAM resources, you can specify either capability.\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you have IAM resources with custom names, you {i must} specify \
         [CAPABILITY_NAMED_IAM].\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you don't specify either of these capabilities, CloudFormation \
         returns an [InsufficientCapabilities] error.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \        }\n\
        \         If your stack template contains these resources, we recommend that you review \
         all permissions associated with them and edit their permissions if necessary.\n\
        \         \n\
        \          {ul\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-accesskey.html}AWS::IAM::AccessKey} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-group.html}AWS::IAM::Group} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-instanceprofile.html}AWS::IAM::InstanceProfile} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-policy.html}AWS::IAM::Policy} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-role.html}AWS::IAM::Role} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-user.html}AWS::IAM::User} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-usertogroupaddition.html}AWS::IAM::UserToGroupAddition} \n\
        \                    \n\
        \                     }\n\
        \                \n\
        \        }\n\
        \         For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities}Acknowledging \
         IAM resources in CloudFormation templates}.\n\
        \         \n\
        \          }\n\
        \       {-   [CAPABILITY_AUTO_EXPAND] \n\
        \           \n\
        \            Some templates reference macros. If your StackSet template references one or \
         more macros, you must create the StackSet directly from the processed template, without \
         first reviewing the resulting changes in a change set. To create the StackSet directly, \
         you must acknowledge this capability. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html}Perform \
         custom processing on CloudFormation templates with template macros}.\n\
        \            \n\
        \              StackSets with service-managed permissions don't currently support the use \
         of macros in templates. (This includes the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-include.html}AWS::Include} \
         and \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html}AWS::Serverless} \
         transforms, which are macros hosted by CloudFormation.) Even if you specify this \
         capability for a StackSet with service-managed permissions, if you reference a macro in \
         your template the StackSet operation will fail.\n\
        \              \n\
        \                }\n\
        \       }\n\
        \  "]
  parameters : parameters option; [@ocaml.doc "The input parameters for the StackSet template.\n"]
  stack_id : stack_id option;
      [@ocaml.doc
        "The stack ID you are importing into a new StackSet. Specify the Amazon Resource Name \
         (ARN) of the stack.\n"]
  template_ur_l : template_ur_l option;
      [@ocaml.doc
        "The URL of a file that contains the template body. The URL must point to a template \
         (maximum size: 1 MB) that's located in an Amazon S3 bucket or a Systems Manager document. \
         The location for an Amazon S3 bucket must start with [https://]. S3 static website URLs \
         are not supported.\n\n\
        \ Conditional: You must specify either the [TemplateBody] or the [TemplateURL] parameter, \
         but not both.\n\
        \ "]
  template_body : template_body option;
      [@ocaml.doc
        "The structure that contains the template body, with a minimum length of 1 byte and a \
         maximum length of 51,200 bytes.\n\n\
        \ Conditional: You must specify either the [TemplateBody] or the [TemplateURL] parameter, \
         but not both.\n\
        \ "]
  description : description option;
      [@ocaml.doc
        "A description of the StackSet. You can use the description to identify the StackSet's \
         purpose or other important information.\n"]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name to associate with the StackSet. The name must be unique in the Region where you \
         create your StackSet.\n\n\
        \  A stack name can contain only alphanumeric characters (case-sensitive) and hyphens. It \
         must start with an alphabetic character and can't be longer than 128 characters.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_stack_refactor_output = {
  stack_refactor_id : stack_refactor_id;
      [@ocaml.doc
        "The ID associated with the stack refactor created from the [CreateStackRefactor] action.\n"]
}
[@@ocaml.doc ""]

type nonrec create_stack_refactor_input = {
  stack_definitions : stack_definitions; [@ocaml.doc "The stacks being refactored.\n"]
  resource_mappings : resource_mappings option;
      [@ocaml.doc
        "The mappings for the stack resource [Source] and stack resource [Destination].\n"]
  enable_stack_creation : enable_stack_creation option;
      [@ocaml.doc "Determines if a new stack is created with the refactor.\n"]
  description : description option;
      [@ocaml.doc "A description to help you identify the stack refactor.\n"]
}
[@@ocaml.doc ""]

type nonrec create_stack_output = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A unique identifier for this stack operation that can be used to track the operation's \
         progress and events.\n"]
  stack_id : stack_id option; [@ocaml.doc "Unique identifier of the stack.\n"]
}
[@@ocaml.doc "The output for a [CreateStack] action.\n"]

type nonrec create_stack_instances_output = {
  operation_id : client_request_token option;
      [@ocaml.doc "The unique identifier for this StackSet operation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_stack_instances_input = {
  call_as : call_as option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] Specifies whether you are acting as an account \
         administrator in the organization's management account or as a delegated administrator in \
         a member account.\n\n\
        \ By default, [SELF] is specified. Use [SELF] for StackSets with self-managed permissions.\n\
        \ \n\
        \  {ul\n\
        \        {-  If you are signed in to the management account, specify [SELF].\n\
        \            \n\
        \             }\n\
        \        {-  If you are signed in to a delegated administrator account, specify \
         [DELEGATED_ADMIN].\n\
        \            \n\
        \             Your Amazon Web Services account must be registered as a delegated \
         administrator in the management account. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html}Register \
         a delegated administrator} in the {i CloudFormation User Guide}.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  operation_id : client_request_token option;
      [@ocaml.doc
        "The unique identifier for this StackSet operation.\n\n\
        \ The operation ID also functions as an idempotency token, to ensure that CloudFormation \
         performs the StackSet operation only once, even if you retry the request multiple times. \
         You might retry StackSet operation requests to ensure that CloudFormation successfully \
         received them.\n\
        \ \n\
        \  If you don't specify an operation ID, the SDK generates one automatically.\n\
        \  \n\
        \   Repeating this StackSet operation with a new operation ID retries all stack instances \
         whose status is [OUTDATED].\n\
        \   "]
  operation_preferences : stack_set_operation_preferences option;
      [@ocaml.doc "Preferences for how CloudFormation performs this StackSet operation.\n"]
  parameter_overrides : parameters option;
      [@ocaml.doc
        "A list of StackSet parameters whose values you want to override in the selected stack \
         instances.\n\n\
        \ Any overridden parameter values will be applied to all stack instances in the specified \
         accounts and Amazon Web Services Regions. When specifying parameters and their values, be \
         aware of how CloudFormation sets parameter values during stack instance operations:\n\
        \ \n\
        \  {ul\n\
        \        {-  To override the current value for a parameter, include the parameter and \
         specify its value.\n\
        \            \n\
        \             }\n\
        \        {-  To leave an overridden parameter set to its present value, include the \
         parameter and specify [UsePreviousValue] as [true]. (You can't specify both a value and \
         set [UsePreviousValue] to [true].)\n\
        \            \n\
        \             }\n\
        \        {-  To set an overridden parameter back to the value specified in the StackSet, \
         specify a parameter list but don't include the parameter in the list.\n\
        \            \n\
        \             }\n\
        \        {-  To leave all parameters set to their present values, don't specify this \
         property at all.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   During StackSet updates, any parameter values overridden for a stack instance aren't \
         updated, but retain their overridden value.\n\
        \   \n\
        \    You can only override the parameter {i values} that are specified in the StackSet; to \
         add or delete a parameter itself, use \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html}UpdateStackSet} \
         to update the StackSet template.\n\
        \    "]
  regions : region_list;
      [@ocaml.doc
        "The names of one or more Amazon Web Services Regions where you want to create stack \
         instances using the specified Amazon Web Services accounts.\n"]
  deployment_targets : deployment_targets option;
      [@ocaml.doc
        "\\[Service-managed permissions\\] The Organizations accounts in which to create stack \
         instances in the specified Amazon Web Services Regions.\n\n\
        \ You can specify [Accounts] or [DeploymentTargets], but not both.\n\
        \ "]
  accounts : account_list option;
      [@ocaml.doc
        "\\[Self-managed permissions\\] The account IDs of one or more Amazon Web Services \
         accounts that you want to create stack instances in the specified Region(s) for.\n\n\
        \ You can specify [Accounts] or [DeploymentTargets], but not both.\n\
        \ "]
  stack_set_name : stack_set_name;
      [@ocaml.doc
        "The name or unique ID of the StackSet that you want to create stack instances from.\n"]
}
[@@ocaml.doc ""]

type nonrec create_stack_input = {
  disable_validation : disable_validation option;
      [@ocaml.doc
        " Set to [true] to disable pre-deployment validations in changeset or stack operations. \n\n\
        \  Default: [false] \n\
        \ "]
  deployment_config : deployment_config option;
      [@ocaml.doc
        "The deployment configuration for this stack operation, including the deployment mode.\n"]
  retain_except_on_create : retain_except_on_create option;
      [@ocaml.doc
        "When set to [true], newly created resources are deleted when the operation rolls back. \
         This includes newly created resources marked with a deletion policy of [Retain].\n\n\
        \ Default: [false] \n\
        \ "]
  enable_termination_protection : enable_termination_protection option;
      [@ocaml.doc
        "Whether to enable termination protection on the specified stack. If a user attempts to \
         delete a stack with termination protection enabled, the operation fails and the stack \
         remains unchanged. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html}Protect \
         CloudFormation stacks from being deleted} in the {i CloudFormation User Guide}. \
         Termination protection is deactivated on stacks by default.\n\n\
        \ For \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html}nested \
         stacks}, termination protection is set on the root stack and can't be changed directly on \
         the nested stack.\n\
        \ "]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique identifier for this [CreateStack] request. Specify this token if you plan to \
         retry requests so that CloudFormation knows that you're not attempting to create a stack \
         with the same name. You might retry [CreateStack] requests to ensure that CloudFormation \
         successfully received them.\n\n\
        \ All events initiated by a given stack operation are assigned the same client request \
         token, which you can use to track operations. For example, if you execute a [CreateStack] \
         operation with the token [token1], then all the [StackEvents] generated by that operation \
         will have [ClientRequestToken] set as [token1].\n\
        \ \n\
        \  In the console, stack operations display the client request token on the Events tab. \
         Stack operations that are initiated from the console use the token format {i \
         Console-StackOperation-ID}, which helps you easily identify the stack operation . For \
         example, if you create a stack using the console, each stack event would be assigned the \
         same token in the following format: \
         [Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002].\n\
        \  "]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs to associate with this stack. CloudFormation also propagates these tags \
         to the resources created in the stack. A maximum number of 50 tags can be specified.\n"]
  stack_policy_ur_l : stack_policy_ur_l option;
      [@ocaml.doc
        "Location of a file that contains the stack policy. The URL must point to a policy \
         (maximum size: 16 KB) located in an S3 bucket in the same Region as the stack. The \
         location for an Amazon S3 bucket must start with [https://]. URLs from S3 static websites \
         are not supported.\n\n\
        \ You can specify either the [StackPolicyBody] or the [StackPolicyURL] parameter, but not \
         both.\n\
        \ "]
  stack_policy_body : stack_policy_body option;
      [@ocaml.doc
        "Structure that contains the stack policy body. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html}Prevent \
         updates to stack resources} in the {i CloudFormation User Guide}. You can specify either \
         the [StackPolicyBody] or the [StackPolicyURL] parameter, but not both.\n"]
  on_failure : on_failure option;
      [@ocaml.doc
        "Determines what action will be taken if stack creation fails. This must be one of: \
         [DO_NOTHING], [ROLLBACK], or [DELETE]. You can specify either [OnFailure] or \
         [DisableRollback], but not both.\n\n\
        \  Although the default setting is [ROLLBACK], there is one exception. This exception \
         occurs when a StackSet attempts to deploy a stack instance and the stack instance fails \
         to create successfully. In this case, the [CreateStack] call overrides the default \
         setting and sets the value of [OnFailure] to [DELETE].\n\
        \  \n\
        \    Default: [ROLLBACK] \n\
        \    "]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to create the \
         stack. CloudFormation uses the role's credentials to make calls on your behalf. \
         CloudFormation always uses this role for all future operations on the stack. Provided \
         that users have permission to operate on the stack, CloudFormation uses this role even if \
         the users don't have permission to pass it. Ensure that the role grants least privilege.\n\n\
        \ If you don't specify a value, CloudFormation uses the role that was previously \
         associated with the stack. If no role is available, CloudFormation uses a temporary \
         session that's generated from your user credentials.\n\
        \ "]
  resource_types : resource_types option;
      [@ocaml.doc
        "Specifies which resource types you can work with, such as [AWS::EC2::Instance] or \
         [Custom::MyCustomInstance].\n\n\
        \ If the list of resource types doesn't include a resource that you're creating, the stack \
         creation fails. By default, CloudFormation grants permissions to all resource types. IAM \
         uses this parameter for CloudFormation-specific condition keys in IAM policies. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html}Control \
         CloudFormation access with Identity and Access Management}.\n\
        \ \n\
        \   Only one of the [Capabilities] and [ResourceType] parameters can be specified.\n\
        \   \n\
        \    "]
  capabilities : capabilities option;
      [@ocaml.doc
        "In some cases, you must explicitly acknowledge that your stack template contains certain \
         capabilities in order for CloudFormation to create the stack.\n\n\
        \ {ul\n\
        \       {-   [CAPABILITY_IAM] and [CAPABILITY_NAMED_IAM] \n\
        \           \n\
        \            Some stack templates might include resources that can affect permissions in \
         your Amazon Web Services account; for example, by creating new IAM users. For those \
         stacks, you must explicitly acknowledge this by specifying one of these capabilities.\n\
        \            \n\
        \             The following IAM resources require you to specify either the \
         [CAPABILITY_IAM] or [CAPABILITY_NAMED_IAM] capability.\n\
        \             \n\
        \              {ul\n\
        \                    {-  If you have IAM resources, you can specify either capability.\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you have IAM resources with custom names, you {i must} specify \
         [CAPABILITY_NAMED_IAM].\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you don't specify either of these capabilities, CloudFormation \
         returns an [InsufficientCapabilities] error.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \        }\n\
        \         If your stack template contains these resources, we recommend that you review \
         all permissions associated with them and edit their permissions if necessary.\n\
        \         \n\
        \          {ul\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-accesskey.html}AWS::IAM::AccessKey} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-group.html}AWS::IAM::Group} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-instanceprofile.html}AWS::IAM::InstanceProfile} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-managedpolicy.html} \
         AWS::IAM::ManagedPolicy} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-policy.html}AWS::IAM::Policy} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-role.html}AWS::IAM::Role} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-user.html}AWS::IAM::User} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-usertogroupaddition.html}AWS::IAM::UserToGroupAddition} \n\
        \                    \n\
        \                     }\n\
        \                \n\
        \        }\n\
        \         For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities}Acknowledging \
         IAM resources in CloudFormation templates}.\n\
        \         \n\
        \          }\n\
        \       {-   [CAPABILITY_AUTO_EXPAND] \n\
        \           \n\
        \            Some template contain macros. Macros perform custom processing on templates; \
         this can include simple actions like find-and-replace operations, all the way to \
         extensive transformations of entire templates. Because of this, users typically create a \
         change set from the processed template, so that they can review the changes resulting \
         from the macros before actually creating the stack. If your stack template contains one \
         or more macros, and you choose to create a stack directly from the processed template, \
         without first reviewing the resulting changes in a change set, you must acknowledge this \
         capability. This includes the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-include.html}AWS::Include} \
         and \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html}AWS::Serverless} \
         transforms, which are macros hosted by CloudFormation.\n\
        \            \n\
        \             If you want to create a stack from a stack template that contains macros {i \
         and} nested stacks, you must create the stack directly from the template using this \
         capability.\n\
        \             \n\
        \               You should only create stacks directly from a stack template that contains \
         macros if you know what processing the macro performs.\n\
        \               \n\
        \                Each macro relies on an underlying Lambda service function for processing \
         stack templates. Be aware that the Lambda function owner can update the function \
         operation without CloudFormation being notified.\n\
        \                \n\
        \                  For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html}Perform \
         custom processing on CloudFormation templates with template macros}.\n\
        \                  \n\
        \                   }\n\
        \       }\n\
        \    Only one of the [Capabilities] and [ResourceType] parameters can be specified.\n\
        \    \n\
        \     "]
  notification_ar_ns : notification_ar_ns option;
      [@ocaml.doc
        "The Amazon SNS topic ARNs to publish stack related events. You can find your Amazon SNS \
         topic ARNs using the Amazon SNS console or your Command Line Interface (CLI).\n"]
  timeout_in_minutes : timeout_minutes option;
      [@ocaml.doc
        "The amount of time that can pass before the stack status becomes [CREATE_FAILED]; if \
         [DisableRollback] is not set or is set to [false], the stack will be rolled back.\n"]
  rollback_configuration : rollback_configuration option;
      [@ocaml.doc
        "The rollback triggers for CloudFormation to monitor during stack creation and updating \
         operations, and for the specified monitoring period afterwards.\n"]
  disable_rollback : disable_rollback option;
      [@ocaml.doc
        "Set to [true] to disable rollback of the stack if stack creation failed. You can specify \
         either [DisableRollback] or [OnFailure], but not both.\n\n\
        \ Default: [false] \n\
        \ "]
  parameters : parameters option;
      [@ocaml.doc
        "A list of [Parameter] structures that specify input parameters for the stack. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html}Parameter} \
         data type.\n"]
  template_ur_l : template_ur_l option;
      [@ocaml.doc
        "The URL of a file that contains the template body. The URL must point to a template (max \
         size: 1 MB) that's located in an Amazon S3 bucket or a Systems Manager document. The \
         location for an Amazon S3 bucket must start with [https://]. URLs from S3 static websites \
         are not supported.\n\n\
        \ Conditional: You must specify either the [TemplateBody] or the [TemplateURL] parameter, \
         but not both.\n\
        \ "]
  template_body : template_body option;
      [@ocaml.doc
        "Structure that contains the template body with a minimum length of 1 byte and a maximum \
         length of 51,200 bytes.\n\n\
        \ Conditional: You must specify either [TemplateBody] or [TemplateURL], but not both.\n\
        \ "]
  stack_name : stack_name;
      [@ocaml.doc
        "The name that's associated with the stack. The name must be unique in the Region in which \
         you are creating the stack.\n\n\
        \  A stack name can contain only alphanumeric characters (case sensitive) and hyphens. It \
         must start with an alphabetical character and can't be longer than 128 characters.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "The input for [CreateStack] action.\n"]

type nonrec create_generated_template_output = {
  generated_template_id : generated_template_id option;
      [@ocaml.doc "The ID of the generated template.\n"]
}
[@@ocaml.doc ""]

type nonrec create_generated_template_input = {
  template_configuration : template_configuration option;
      [@ocaml.doc
        "The configuration details of the generated template, including the [DeletionPolicy] and \
         [UpdateReplacePolicy].\n"]
  stack_name : stack_name option;
      [@ocaml.doc
        "An optional name or ARN of a stack to use as the base stack for the generated template.\n"]
  generated_template_name : generated_template_name;
      [@ocaml.doc "The name assigned to the generated template.\n"]
  resources : resource_definitions option;
      [@ocaml.doc
        "An optional list of resources to be included in the generated template.\n\n\
        \ If no resources are specified,the template will be created without any resources. \
         Resources can be added to the template using the [UpdateGeneratedTemplate] API action.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_change_set_output = {
  stack_id : stack_id option; [@ocaml.doc "The unique ID of the stack.\n"]
  id : change_set_id option; [@ocaml.doc "The Amazon Resource Name (ARN) of the change set.\n"]
}
[@@ocaml.doc "The output for the [CreateChangeSet] action.\n"]

type nonrec change_set_type =
  | IMPORT [@ocaml.doc ""]
  | UPDATE [@ocaml.doc ""]
  | CREATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_change_set_input = {
  disable_validation : disable_validation option;
      [@ocaml.doc
        " Set to [true] to disable pre-deployment validations in changeset or stack operations. \n\n\
        \  Default: [false] \n\
        \ "]
  deployment_config : deployment_config option;
      [@ocaml.doc
        "The deployment configuration for this stack operation, including the deployment mode.\n"]
  deployment_mode : deployment_mode option;
      [@ocaml.doc
        "Determines how CloudFormation handles configuration drift during deployment.\n\n\
        \ {ul\n\
        \       {-   [REVERT_DRIFT] \226\128\147 Creates a drift-aware change set that brings \
         actual resource states in line with template definitions. Provides a three-way comparison \
         between actual state, previous deployment state, and desired state.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/drift-aware-change-sets.html}Using \
         drift-aware change sets} in the {i CloudFormation User Guide}.\n\
        \   "]
  import_existing_resources : import_existing_resources option;
      [@ocaml.doc
        "Indicates if the change set auto-imports resources that already exist. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/import-resources-automatically.html}Import \
         Amazon Web Services resources into a CloudFormation stack automatically} in the {i \
         CloudFormation User Guide}.\n\n\
        \  This parameter can only import resources that have custom names in templates. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-properties-name.html}name \
         type} in the {i CloudFormation User Guide}. To import resources that do not accept custom \
         names, such as EC2 instances, use the [ResourcesToImport] parameter instead.\n\
        \  \n\
        \   "]
  on_stack_failure : on_stack_failure option;
      [@ocaml.doc
        "Determines what action will be taken if stack creation fails. If this parameter is \
         specified, the [DisableRollback] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html}ExecuteChangeSet} \
         API operation must not be specified. This must be one of these values:\n\n\
        \ {ul\n\
        \       {-   [DELETE] - Deletes the change set if the stack creation fails. This is only \
         valid when the [ChangeSetType] parameter is set to [CREATE]. If the deletion of the stack \
         fails, the status of the stack is [DELETE_FAILED].\n\
        \           \n\
        \            }\n\
        \       {-   [DO_NOTHING] - if the stack creation fails, do nothing. This is equivalent to \
         specifying [true] for the [DisableRollback] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html}ExecuteChangeSet} \
         API operation.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLLBACK] - if the stack creation fails, roll back the stack. This is \
         equivalent to specifying [false] for the [DisableRollback] parameter to the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html}ExecuteChangeSet} \
         API operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For nested stacks, when the [OnStackFailure] parameter is set to [DELETE] for the \
         change set for the parent stack, any failure in a child stack will cause the parent stack \
         creation to fail and all stacks to be deleted.\n\
        \   "]
  include_nested_stacks : include_nested_stacks option;
      [@ocaml.doc
        "Creates a change set for the all nested stacks specified in the template. The default \
         behavior of this action is set to [False]. To include nested sets in a change set, \
         specify [True].\n"]
  resources_to_import : resources_to_import option;
      [@ocaml.doc "The resources to import into your stack.\n"]
  change_set_type : change_set_type option;
      [@ocaml.doc
        "The type of change set operation. To create a change set for a new stack, specify \
         [CREATE]. To create a change set for an existing stack, specify [UPDATE]. To create a \
         change set for an import operation, specify [IMPORT].\n\n\
        \ If you create a change set for a new stack, CloudFormation creates a stack with a unique \
         stack ID, but no template or resources. The stack will be in the [REVIEW_IN_PROGRESS] \
         state until you execute the change set.\n\
        \ \n\
        \  By default, CloudFormation specifies [UPDATE]. You can't use the [UPDATE] type to \
         create a change set for a new stack or the [CREATE] type to create a change set for an \
         existing stack.\n\
        \  "]
  description : description option;
      [@ocaml.doc "A description to help you identify this change set.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique identifier for this [CreateChangeSet] request. Specify this token if you plan to \
         retry requests so that CloudFormation knows that you're not attempting to create another \
         change set with the same name. You might retry [CreateChangeSet] requests to ensure that \
         CloudFormation successfully received them.\n"]
  change_set_name : change_set_name;
      [@ocaml.doc
        "The name of the change set. The name must be unique among all change sets that are \
         associated with the specified stack.\n\n\
        \ A change set name can contain only alphanumeric, case sensitive characters, and hyphens. \
         It must start with an alphabetical character and can't exceed 128 characters.\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "Key-value pairs to associate with this stack. CloudFormation also propagates these tags \
         to resources in the stack. You can specify a maximum of 50 tags.\n"]
  notification_ar_ns : notification_ar_ns option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of Amazon SNS topics that CloudFormation associates with \
         the stack. To remove all associated notification topics, specify an empty list.\n"]
  rollback_configuration : rollback_configuration option;
      [@ocaml.doc
        "The rollback triggers for CloudFormation to monitor during stack creation and updating \
         operations, and for the specified monitoring period afterwards.\n"]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes when executing \
         the change set. CloudFormation uses the role's credentials to make calls on your behalf. \
         CloudFormation uses this role for all future operations on the stack. Provided that users \
         have permission to operate on the stack, CloudFormation uses this role even if the users \
         don't have permission to pass it. Ensure that the role grants least permission.\n\n\
        \ If you don't specify a value, CloudFormation uses the role that was previously \
         associated with the stack. If no role is available, CloudFormation uses a temporary \
         session that is generated from your user credentials.\n\
        \ "]
  resource_types : resource_types option;
      [@ocaml.doc
        "Specifies which resource types you can work with, such as [AWS::EC2::Instance] or \
         [Custom::MyCustomInstance].\n\n\
        \ If the list of resource types doesn't include a resource type that you're updating, the \
         stack update fails. By default, CloudFormation grants permissions to all resource types. \
         IAM uses this parameter for condition keys in IAM policies for CloudFormation. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html}Control \
         CloudFormation access with Identity and Access Management} in the {i CloudFormation User \
         Guide}.\n\
        \ \n\
        \   Only one of the [Capabilities] and [ResourceType] parameters can be specified.\n\
        \   \n\
        \    "]
  capabilities : capabilities option;
      [@ocaml.doc
        "In some cases, you must explicitly acknowledge that your stack template contains certain \
         capabilities in order for CloudFormation to create the stack.\n\n\
        \ {ul\n\
        \       {-   [CAPABILITY_IAM] and [CAPABILITY_NAMED_IAM] \n\
        \           \n\
        \            Some stack templates might include resources that can affect permissions in \
         your Amazon Web Services account, for example, by creating new IAM users. For those \
         stacks, you must explicitly acknowledge this by specifying one of these capabilities.\n\
        \            \n\
        \             The following IAM resources require you to specify either the \
         [CAPABILITY_IAM] or [CAPABILITY_NAMED_IAM] capability.\n\
        \             \n\
        \              {ul\n\
        \                    {-  If you have IAM resources, you can specify either capability.\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you have IAM resources with custom names, you {i must} specify \
         [CAPABILITY_NAMED_IAM].\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you don't specify either of these capabilities, CloudFormation \
         returns an [InsufficientCapabilities] error.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \        }\n\
        \         If your stack template contains these resources, we suggest that you review all \
         permissions associated with them and edit their permissions if necessary.\n\
        \         \n\
        \          {ul\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-accesskey.html} \
         AWS::IAM::AccessKey} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-group.html} \
         AWS::IAM::Group} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-instanceprofile.html}AWS::IAM::InstanceProfile} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-managedpolicy.html} \
         AWS::IAM::ManagedPolicy} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-policy.html} \
         AWS::IAM::Policy} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-role.html} \
         AWS::IAM::Role} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-user.html} \
         AWS::IAM::User} \n\
        \                    \n\
        \                     }\n\
        \                {-   \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-usertogroupaddition.html}AWS::IAM::UserToGroupAddition} \n\
        \                    \n\
        \                     }\n\
        \                \n\
        \        }\n\
        \         For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities}Acknowledging \
         IAM resources in CloudFormation templates}.\n\
        \         \n\
        \          }\n\
        \       {-   [CAPABILITY_AUTO_EXPAND] \n\
        \           \n\
        \            Some template contain macros. Macros perform custom processing on templates; \
         this can include simple actions like find-and-replace operations, all the way to \
         extensive transformations of entire templates. Because of this, users typically create a \
         change set from the processed template, so that they can review the changes resulting \
         from the macros before actually creating the stack. If your stack template contains one \
         or more macros, and you choose to create a stack directly from the processed template, \
         without first reviewing the resulting changes in a change set, you must acknowledge this \
         capability. This includes the \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-include.html}AWS::Include} \
         and \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html}AWS::Serverless} \
         transforms, which are macros hosted by CloudFormation.\n\
        \            \n\
        \              This capacity doesn't apply to creating change sets, and specifying it when \
         creating change sets has no effect.\n\
        \              \n\
        \               If you want to create a stack from a stack template that contains macros \
         {i and} nested stacks, you must create or update the stack directly from the template \
         using the [CreateStack] or [UpdateStack] action, and specifying this capability.\n\
        \               \n\
        \                 For more information about macros, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html}Perform \
         custom processing on CloudFormation templates with template macros}.\n\
        \                 \n\
        \                  }\n\
        \       }\n\
        \    Only one of the [Capabilities] and [ResourceType] parameters can be specified.\n\
        \    \n\
        \     "]
  parameters : parameters option;
      [@ocaml.doc
        "A list of [Parameter] structures that specify input parameters for the change set. For \
         more information, see the [Parameter] data type.\n"]
  use_previous_template : use_previous_template option;
      [@ocaml.doc
        "Whether to reuse the template that's associated with the stack to create the change set.\n\n\
        \ When using templates with the [AWS::LanguageExtensions] transform, provide the template \
         instead of using [UsePreviousTemplate] to ensure new parameter values and Systems Manager \
         parameter updates are applied correctly. For more information, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/transform-aws-languageextensions.html}AWS::LanguageExtensions \
         transform}.\n\
        \ \n\
        \  Conditional: You must specify only one of the following parameters: [TemplateBody], \
         [TemplateURL], or set the [UsePreviousTemplate] to [true].\n\
        \  "]
  template_ur_l : template_ur_l option;
      [@ocaml.doc
        "The URL of the file that contains the revised template. The URL must point to a template \
         (max size: 1 MB) that's located in an Amazon S3 bucket or a Systems Manager document. \
         CloudFormation generates the change set by comparing this template with the stack that \
         you specified. The location for an Amazon S3 bucket must start with [https://]. URLs from \
         S3 static websites are not supported.\n\n\
        \ Conditional: You must specify only one of the following parameters: [TemplateBody], \
         [TemplateURL], or set the [UsePreviousTemplate] to [true].\n\
        \ "]
  template_body : template_body option;
      [@ocaml.doc
        "A structure that contains the body of the revised template, with a minimum length of 1 \
         byte and a maximum length of 51,200 bytes. CloudFormation generates the change set by \
         comparing this template with the template of the stack that you specified.\n\n\
        \ Conditional: You must specify only one of the following parameters: [TemplateBody], \
         [TemplateURL], or set the [UsePreviousTemplate] to [true].\n\
        \ "]
  stack_name : stack_name_or_id;
      [@ocaml.doc
        "The name or the unique ID of the stack for which you are creating a change set. \
         CloudFormation generates the change set by comparing this stack's information with the \
         information that you submit, such as a modified template or different parameter input \
         values.\n"]
}
[@@ocaml.doc "The input for the [CreateChangeSet] action.\n"]

type nonrec continue_update_rollback_output = unit [@@ocaml.doc ""]

type nonrec continue_update_rollback_input = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique identifier for this [ContinueUpdateRollback] request. Specify this token if you \
         plan to retry requests so that CloudFormation knows that you're not attempting to \
         continue the rollback to a stack with the same name. You might retry \
         [ContinueUpdateRollback] requests to ensure that CloudFormation successfully received \
         them.\n"]
  resources_to_skip : resources_to_skip option;
      [@ocaml.doc
        "A list of the logical IDs of the resources that CloudFormation skips during the continue \
         update rollback operation. You can specify only resources that are in the [UPDATE_FAILED] \
         state because a rollback failed. You can't specify resources that are in the \
         [UPDATE_FAILED] state for other reasons, for example, because an update was canceled. To \
         check why a resource update failed, use the [DescribeStackResources] action, and view the \
         resource status reason.\n\n\
        \  Specify this property to skip rolling back resources that CloudFormation can't \
         successfully roll back. We recommend that you \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed} \
         troubleshoot} resources before skipping them. CloudFormation sets the status of the \
         specified resources to [UPDATE_COMPLETE] and continues to roll back the stack. After the \
         rollback is complete, the state of the skipped resources will be inconsistent with the \
         state of the resources in the stack template. Before performing another stack update, you \
         must update the stack or resources to be consistent with each other. If you don't, \
         subsequent stack updates might fail, and the stack will become unrecoverable.\n\
        \  \n\
        \    Specify the minimum number of resources required to successfully roll back your \
         stack. For example, a failed resource update might cause dependent resources to fail. In \
         this case, it might not be necessary to skip the dependent resources.\n\
        \    \n\
        \     To skip resources that are part of nested stacks, use the following format: \
         [NestedStackName.ResourceLogicalID]. If you want to specify the logical ID of a stack \
         resource ([Type: AWS::CloudFormation::Stack]) in the [ResourcesToSkip] list, then its \
         corresponding embedded stack must be in one of the following states: \
         [DELETE_IN_PROGRESS], [DELETE_COMPLETE], or [DELETE_FAILED].\n\
        \     \n\
        \       Don't confuse a child stack's name with its corresponding logical ID defined in \
         the parent stack. For an example of a continue update rollback operation with nested \
         stacks, see \
         {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html#nested-stacks}Continue \
         rolling back from failed nested stack updates}.\n\
        \       \n\
        \        "]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to roll back \
         the stack. CloudFormation uses the role's credentials to make calls on your behalf. \
         CloudFormation always uses this role for all future operations on the stack. Provided \
         that users have permission to operate on the stack, CloudFormation uses this role even if \
         the users don't have permission to pass it. Ensure that the role grants least \
         permission.\n\n\
        \ If you don't specify a value, CloudFormation uses the role that was previously \
         associated with the stack. If no role is available, CloudFormation uses a temporary \
         session that's generated from your user credentials.\n\
        \ "]
  stack_name : stack_name_or_id;
      [@ocaml.doc
        "The name or the unique ID of the stack that you want to continue rolling back.\n\n\
        \  Don't specify the name of a nested stack (a stack that was created by using the \
         [AWS::CloudFormation::Stack] resource). Instead, use this operation on the parent stack \
         (the stack that contains the [AWS::CloudFormation::Stack] resource).\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "The input for the [ContinueUpdateRollback] action.\n"]

type nonrec cancel_update_stack_input = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique identifier for this [CancelUpdateStack] request. Specify this token if you plan \
         to retry requests so that CloudFormation knows that you're not attempting to cancel an \
         update on a stack with the same name. You might retry [CancelUpdateStack] requests to \
         ensure that CloudFormation successfully received them.\n"]
  stack_name : stack_name;
      [@ocaml.doc
        " If you don't pass a parameter to [StackName], the API returns a response that describes \
         all resources in the account.\n\
        \ \n\
        \  The IAM policy below can be added to IAM policies when you want to limit resource-level \
         permissions and avoid returning a response when no parameter is sent in the request:\n\
        \  \n\
        \    [{ \"Version\": \"2012-10-17\",\t\t \t \t  \"Statement\": \\[{ \"Effect\": \"Deny\",\n\
        \          \"Action\": \"cloudformation:DescribeStacks\", \"NotResource\":\n\
        \          \"arn:aws:cloudformation:*:*:stack/*/*\" }\\] }] \n\
        \   \n\
        \     The name or the unique stack ID that's associated with the stack.\n\
        \     "]
}
[@@ocaml.doc "The input for the [CancelUpdateStack] action.\n"]

type nonrec batch_describe_type_configurations_error = {
  type_configuration_identifier : type_configuration_identifier option;
      [@ocaml.doc "Identifying information for the configuration of a CloudFormation extension.\n"]
  error_message : error_message option; [@ocaml.doc "The error message.\n"]
  error_code : error_code option; [@ocaml.doc "The error code.\n"]
}
[@@ocaml.doc
  "Detailed information concerning an error generated during the setting of configuration data for \
   a CloudFormation extension.\n"]

type nonrec batch_describe_type_configurations_errors =
  batch_describe_type_configurations_error list
[@@ocaml.doc ""]

type nonrec batch_describe_type_configurations_output = {
  type_configurations : type_configuration_details_list option;
      [@ocaml.doc
        "A list of any of the specified extension configurations from the CloudFormation registry.\n"]
  unprocessed_type_configurations : unprocessed_type_configurations option;
      [@ocaml.doc
        "A list of any of the specified extension configurations that CloudFormation could not \
         process for any reason.\n"]
  errors : batch_describe_type_configurations_errors option;
      [@ocaml.doc
        "A list of information concerning any errors generated during the setting of the specified \
         configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_describe_type_configurations_input = {
  type_configuration_identifiers : type_configuration_identifiers;
      [@ocaml.doc "The list of identifiers for the desired extension configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec activate_type_output = {
  arn : private_type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the activated extension in this account and Region.\n"]
}
[@@ocaml.doc ""]

type nonrec activate_type_input = {
  major_version : major_version option;
      [@ocaml.doc
        "The major version of this extension you want to activate, if multiple major versions are \
         available. The default is the latest major version. CloudFormation uses the latest \
         available {i minor} version of the major version selected.\n\n\
        \ You can specify [MajorVersion] or [VersionBump], but not both.\n\
        \ "]
  version_bump : version_bump option;
      [@ocaml.doc
        "Manually updates a previously-activated type to a new major or minor version, if \
         available. You can also use this parameter to update the value of [AutoUpdate].\n\n\
        \ {ul\n\
        \       {-   [MAJOR]: CloudFormation updates the extension to the newest major version, if \
         one is available.\n\
        \           \n\
        \            }\n\
        \       {-   [MINOR]: CloudFormation updates the extension to the newest minor version, if \
         one is available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  execution_role_arn : role_ar_n2 option;
      [@ocaml.doc "The name of the IAM execution role to use to activate the extension.\n"]
  logging_config : logging_config option;
      [@ocaml.doc "Contains logging configuration information for an extension.\n"]
  auto_update : auto_update option;
      [@ocaml.doc
        "Whether to automatically update the extension in this account and Region when a new {i \
         minor} version is published by the extension publisher. Major versions released by the \
         publisher must be manually updated.\n\n\
        \ The default is [true].\n\
        \ "]
  type_name_alias : type_name option;
      [@ocaml.doc
        "An alias to assign to the public extension in this account and Region. If you specify an \
         alias for the extension, CloudFormation treats the alias as the extension type name \
         within this account and Region. You must use the alias to refer to the extension in your \
         templates, API calls, and CloudFormation console.\n\n\
        \ An extension alias must be unique within a given account and Region. You can activate \
         the same public resource multiple times in the same account and Region, using different \
         type name aliases.\n\
        \ "]
  type_name : type_name option;
      [@ocaml.doc
        "The name of the extension.\n\n\
        \ Conditional: You must specify [PublicTypeArn], or [TypeName], [Type], and [PublisherId].\n\
        \ "]
  publisher_id : publisher_id option;
      [@ocaml.doc
        "The ID of the extension publisher.\n\n\
        \ Conditional: You must specify [PublicTypeArn], or [TypeName], [Type], and [PublisherId].\n\
        \ "]
  public_type_arn : third_party_type_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the public extension.\n\n\
        \ Conditional: You must specify [PublicTypeArn], or [TypeName], [Type], and [PublisherId].\n\
        \ "]
  type_ : third_party_type option;
      [@ocaml.doc
        "The extension type.\n\n\
        \ Conditional: You must specify [PublicTypeArn], or [TypeName], [Type], and [PublisherId].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec activate_organizations_access_output = unit [@@ocaml.doc ""]

type nonrec activate_organizations_access_input = unit [@@ocaml.doc ""]
