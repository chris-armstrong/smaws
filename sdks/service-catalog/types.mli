type nonrec verbose = bool [@@ocaml.doc ""]

type nonrec user_arn_session = string [@@ocaml.doc ""]

type nonrec user_arn = string [@@ocaml.doc ""]

type nonrec use_previous_value = bool [@@ocaml.doc ""]

type nonrec instruction_type = string [@@ocaml.doc ""]

type nonrec instruction_value = string [@@ocaml.doc ""]

type nonrec usage_instruction = {
  value : instruction_value option; [@ocaml.doc "The usage instruction value for this type.\n"]
  type_ : instruction_type option; [@ocaml.doc "The usage instruction type for the value.\n"]
}
[@@ocaml.doc "Additional information provided by the administrator.\n"]

type nonrec usage_instructions = usage_instruction list [@@ocaml.doc ""]

type nonrec updated_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec tag_option_key = string [@@ocaml.doc ""]

type nonrec tag_option_value = string [@@ocaml.doc ""]

type nonrec tag_option_active = bool [@@ocaml.doc ""]

type nonrec tag_option_id = string [@@ocaml.doc ""]

type nonrec owner = string [@@ocaml.doc ""]

type nonrec tag_option_detail = {
  owner : owner option;
      [@ocaml.doc
        "The Amazon Web Services account Id of the owner account that created the TagOption.\n"]
  id : tag_option_id option; [@ocaml.doc "The TagOption identifier.\n"]
  active : tag_option_active option; [@ocaml.doc "The TagOption active state.\n"]
  value : tag_option_value option; [@ocaml.doc "The TagOption value.\n"]
  key : tag_option_key option; [@ocaml.doc "The TagOption key.\n"]
}
[@@ocaml.doc "Information about a TagOption.\n"]

type nonrec update_tag_option_output = {
  tag_option_detail : tag_option_detail option; [@ocaml.doc "Information about the TagOption.\n"]
}
[@@ocaml.doc ""]

type nonrec update_tag_option_input = {
  active : tag_option_active option; [@ocaml.doc "The updated active state.\n"]
  value : tag_option_value option; [@ocaml.doc "The updated value.\n"]
  id : tag_option_id; [@ocaml.doc "The TagOption identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec tag_option_not_migrated_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An operation requiring TagOptions failed because the TagOptions migration process has not been \
   performed for this account. Use the Amazon Web Services Management Console to perform the \
   migration process before retrying the operation.\n"]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource was not found.\n"]

type nonrec invalid_parameters_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "One or more parameters provided to the operation are not valid.\n"]

type nonrec duplicate_resource_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource is a duplicate.\n"]

type nonrec id = string [@@ocaml.doc ""]

type nonrec service_action_name = string [@@ocaml.doc ""]

type nonrec service_action_description = string [@@ocaml.doc ""]

type nonrec service_action_definition_type = SsmAutomation [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec service_action_summary = {
  definition_type : service_action_definition_type option;
      [@ocaml.doc "The self-service action definition type. For example, [SSM_AUTOMATION].\n"]
  description : service_action_description option;
      [@ocaml.doc "The self-service action description.\n"]
  name : service_action_name option; [@ocaml.doc "The self-service action name.\n"]
  id : id option; [@ocaml.doc "The self-service action identifier.\n"]
}
[@@ocaml.doc "Detailed information about the self-service action.\n"]

type nonrec service_action_definition_value = string [@@ocaml.doc ""]

type nonrec service_action_definition_key =
  | Parameters [@ocaml.doc ""]
  | AssumeRole [@ocaml.doc ""]
  | Version [@ocaml.doc ""]
  | Name [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_action_definition_map =
  (service_action_definition_key * service_action_definition_value) list
[@@ocaml.doc ""]

type nonrec service_action_detail = {
  definition : service_action_definition_map option;
      [@ocaml.doc "A map that defines the self-service action.\n"]
  service_action_summary : service_action_summary option;
      [@ocaml.doc "Summary information about the self-service action.\n"]
}
[@@ocaml.doc "An object containing detailed information about the self-service action.\n"]

type nonrec update_service_action_output = {
  service_action_detail : service_action_detail option;
      [@ocaml.doc "Detailed information about the self-service action.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_language = string [@@ocaml.doc ""]

type nonrec update_service_action_input = {
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  description : service_action_description option;
      [@ocaml.doc "The self-service action description.\n"]
  definition : service_action_definition_map option;
      [@ocaml.doc "A map that defines the self-service action.\n"]
  name : service_action_name option; [@ocaml.doc "The self-service action name.\n"]
  id : id; [@ocaml.doc "The self-service action identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec stack_set_accounts = account_id list [@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec stack_set_regions = region list [@@ocaml.doc ""]

type nonrec stack_set_failure_tolerance_count = int [@@ocaml.doc ""]

type nonrec stack_set_failure_tolerance_percentage = int [@@ocaml.doc ""]

type nonrec stack_set_max_concurrency_count = int [@@ocaml.doc ""]

type nonrec stack_set_max_concurrency_percentage = int [@@ocaml.doc ""]

type nonrec stack_set_operation_type =
  | DELETE [@ocaml.doc ""]
  | UPDATE [@ocaml.doc ""]
  | CREATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_provisioning_preferences = {
  stack_set_operation_type : stack_set_operation_type option;
      [@ocaml.doc
        "Determines what action Service Catalog performs to a stack set or a stack instance \
         represented by the provisioned product. The default value is [UPDATE] if nothing is \
         specified.\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ \n\
        \   CREATE  Creates a new stack instance in the stack set represented by the provisioned \
         product. In this case, only new stack instances are created based on accounts and \
         Regions; if new ProductId or ProvisioningArtifactID are passed, they will be ignored.\n\
        \           \n\
        \             UPDATE  Updates the stack set represented by the provisioned product and \
         also its stack instances.\n\
        \                     \n\
        \                       DELETE  Deletes a stack instance in the stack set represented by \
         the provisioned product.\n\
        \                               \n\
        \                                 "]
  stack_set_max_concurrency_percentage : stack_set_max_concurrency_percentage option;
      [@ocaml.doc
        "The maximum percentage of accounts in which to perform this operation at one time.\n\n\
        \ When calculating the number of accounts based on the specified percentage, Service \
         Catalog rounds down to the next whole number. This is true except in cases where rounding \
         down would result is zero. In this case, Service Catalog sets the number as [1] instead.\n\
        \ \n\
        \  Note that this setting lets you specify the maximum for operations. For large \
         deployments, under certain circumstances the actual number of accounts acted upon \
         concurrently may be lower due to service throttling.\n\
        \  \n\
        \   Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \   \n\
        \    Conditional: You must specify either [StackSetMaxConcurrentCount] or \
         [StackSetMaxConcurrentPercentage], but not both.\n\
        \    "]
  stack_set_max_concurrency_count : stack_set_max_concurrency_count option;
      [@ocaml.doc
        "The maximum number of accounts in which to perform this operation at one time. This is \
         dependent on the value of [StackSetFailureToleranceCount]. [StackSetMaxConcurrentCount] \
         is at most one more than the [StackSetFailureToleranceCount].\n\n\
        \ Note that this setting lets you specify the maximum for operations. For large \
         deployments, under certain circumstances the actual number of accounts acted upon \
         concurrently may be lower due to service throttling.\n\
        \ \n\
        \  Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \  \n\
        \   Conditional: You must specify either [StackSetMaxConcurrentCount] or \
         [StackSetMaxConcurrentPercentage], but not both.\n\
        \   "]
  stack_set_failure_tolerance_percentage : stack_set_failure_tolerance_percentage option;
      [@ocaml.doc
        "The percentage of accounts, per Region, for which this stack operation can fail before \
         Service Catalog stops the operation in that Region. If the operation is stopped in a \
         Region, Service Catalog doesn't attempt the operation in any subsequent Regions.\n\n\
        \ When calculating the number of accounts based on the specified percentage, Service \
         Catalog rounds down to the next whole number.\n\
        \ \n\
        \  Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \  \n\
        \   Conditional: You must specify either [StackSetFailureToleranceCount] or \
         [StackSetFailureTolerancePercentage], but not both.\n\
        \   "]
  stack_set_failure_tolerance_count : stack_set_failure_tolerance_count option;
      [@ocaml.doc
        "The number of accounts, per Region, for which this operation can fail before Service \
         Catalog stops the operation in that Region. If the operation is stopped in a Region, \
         Service Catalog doesn't attempt the operation in any subsequent Regions.\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ \n\
        \  Conditional: You must specify either [StackSetFailureToleranceCount] or \
         [StackSetFailureTolerancePercentage], but not both.\n\
        \  \n\
        \   The default value is [0] if no value is specified.\n\
        \   "]
  stack_set_regions : stack_set_regions option;
      [@ocaml.doc
        "One or more Amazon Web Services Regions where the provisioned product will be available.\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ \n\
        \  The specified Regions should be within the list of Regions from the [STACKSET] \
         constraint. To get the list of Regions in the [STACKSET] constraint, use the \
         [DescribeProvisioningParameters] operation.\n\
        \  \n\
        \   If no values are specified, the default value is all Regions from the [STACKSET] \
         constraint.\n\
        \   "]
  stack_set_accounts : stack_set_accounts option;
      [@ocaml.doc
        "One or more Amazon Web Services accounts that will have access to the provisioned \
         product.\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ \n\
        \  The Amazon Web Services accounts specified should be within the list of accounts in the \
         [STACKSET] constraint. To get the list of accounts in the [STACKSET] constraint, use the \
         [DescribeProvisioningParameters] operation.\n\
        \  \n\
        \   If no values are specified, the default value is all accounts from the [STACKSET] \
         constraint.\n\
        \   "]
}
[@@ocaml.doc
  "The user-defined preferences that will be applied when updating a provisioned product. Not all \
   preferences are applicable to all provisioned product types.\n"]

type nonrec parameter_key = string [@@ocaml.doc ""]

type nonrec parameter_value = string [@@ocaml.doc ""]

type nonrec update_provisioning_parameter = {
  use_previous_value : use_previous_value option;
      [@ocaml.doc "If set to true, [Value] is ignored and the previous parameter value is kept.\n"]
  value : parameter_value option; [@ocaml.doc "The parameter value.\n"]
  key : parameter_key option; [@ocaml.doc "The parameter key.\n"]
}
[@@ocaml.doc "The parameter key-value pair used to update a provisioned product.\n"]

type nonrec update_provisioning_parameters = update_provisioning_parameter list [@@ocaml.doc ""]

type nonrec provisioning_artifact_name = string [@@ocaml.doc ""]

type nonrec provisioning_artifact_type =
  | EXTERNAL [@ocaml.doc ""]
  | TERRAFORM_CLOUD [@ocaml.doc ""]
  | TERRAFORM_OPEN_SOURCE [@ocaml.doc ""]
  | MARKETPLACE_CAR [@ocaml.doc ""]
  | MARKETPLACE_AMI [@ocaml.doc ""]
  | CLOUD_FORMATION_TEMPLATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec creation_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec provisioning_artifact_active = bool [@@ocaml.doc ""]

type nonrec provisioning_artifact_guidance = DEPRECATED [@ocaml.doc ""] | DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec source_revision = string [@@ocaml.doc ""]

type nonrec provisioning_artifact_detail = {
  source_revision : source_revision option;
      [@ocaml.doc
        "Specifies the revision of the external artifact that was used to automatically sync the \
         Service Catalog product and create the provisioning artifact. Service Catalog includes \
         this response parameter as a high level field to the existing \
         [ProvisioningArtifactDetail] type, which is returned as part of the response for \
         [CreateProduct], [UpdateProduct], [DescribeProductAsAdmin], \
         [DescribeProvisioningArtifact], [ListProvisioningArtifact], and \
         [UpdateProvisioningArticat] APIs. \n\n\
        \ This field only exists for Repo-Synced products. \n\
        \ "]
  guidance : provisioning_artifact_guidance option;
      [@ocaml.doc
        "Information set by the administrator to provide guidance to end users about which \
         provisioning artifacts to use.\n"]
  active : provisioning_artifact_active option;
      [@ocaml.doc "Indicates whether the product version is active.\n"]
  created_time : creation_time option; [@ocaml.doc "The UTC time stamp of the creation time.\n"]
  type_ : provisioning_artifact_type option;
      [@ocaml.doc
        "The type of provisioning artifact.\n\n\
        \ {ul\n\
        \       {-   [CLOUD_FORMATION_TEMPLATE] - CloudFormation template\n\
        \           \n\
        \            }\n\
        \       {-   [TERRAFORM_OPEN_SOURCE] - Terraform Open Source configuration file\n\
        \           \n\
        \            }\n\
        \       {-   [TERRAFORM_CLOUD] - Terraform Cloud configuration file\n\
        \           \n\
        \            }\n\
        \       {-   [EXTERNAL] - External configuration file\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  description : provisioning_artifact_name option;
      [@ocaml.doc "The description of the provisioning artifact.\n"]
  name : provisioning_artifact_name option; [@ocaml.doc "The name of the provisioning artifact.\n"]
  id : id option; [@ocaml.doc "The identifier of the provisioning artifact.\n"]
}
[@@ocaml.doc "Information about a provisioning artifact (also known as a version) for a product.\n"]

type nonrec provisioning_artifact_info_value = string [@@ocaml.doc ""]

type nonrec provisioning_artifact_info_key = string [@@ocaml.doc ""]

type nonrec provisioning_artifact_info =
  (provisioning_artifact_info_key * provisioning_artifact_info_value) list
[@@ocaml.doc ""]

type nonrec status = FAILED [@ocaml.doc ""] | CREATING [@ocaml.doc ""] | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_provisioning_artifact_output = {
  status : status option; [@ocaml.doc "The status of the current request.\n"]
  info : provisioning_artifact_info option;
      [@ocaml.doc "The URL of the CloudFormation template in Amazon S3 or GitHub in JSON format.\n"]
  provisioning_artifact_detail : provisioning_artifact_detail option;
      [@ocaml.doc "Information about the provisioning artifact.\n"]
}
[@@ocaml.doc ""]

type nonrec provisioning_artifact_description = string [@@ocaml.doc ""]

type nonrec update_provisioning_artifact_input = {
  guidance : provisioning_artifact_guidance option;
      [@ocaml.doc
        "Information set by the administrator to provide guidance to end users about which \
         provisioning artifacts to use.\n\n\
        \ The [DEFAULT] value indicates that the product version is active.\n\
        \ \n\
        \  The administrator can set the guidance to [DEPRECATED] to inform users that the product \
         version is deprecated. Users are able to make updates to a provisioned product of a \
         deprecated version but cannot launch new provisioned products using a deprecated version.\n\
        \  "]
  active : provisioning_artifact_active option;
      [@ocaml.doc
        "Indicates whether the product version is active.\n\n\
        \ Inactive provisioning artifacts are invisible to end users. End users cannot launch or \
         update a provisioned product from an inactive provisioning artifact.\n\
        \ "]
  description : provisioning_artifact_description option;
      [@ocaml.doc "The updated description of the provisioning artifact.\n"]
  name : provisioning_artifact_name option;
      [@ocaml.doc "The updated name of the provisioning artifact.\n"]
  provisioning_artifact_id : id; [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec property_value = string [@@ocaml.doc ""]

type nonrec property_key = LaunchRole [@ocaml.doc ""] | Owner [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec provisioned_product_properties = (property_key * property_value) list [@@ocaml.doc ""]

type nonrec record_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS_IN_ERROR [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_provisioned_product_properties_output = {
  status : record_status option; [@ocaml.doc "The status of the request.\n"]
  record_id : id option; [@ocaml.doc "The identifier of the record.\n"]
  provisioned_product_properties : provisioned_product_properties option;
      [@ocaml.doc "A map that contains the properties updated.\n"]
  provisioned_product_id : id option; [@ocaml.doc "The provisioned product identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec update_provisioned_product_properties_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "The idempotency token that uniquely identifies the provisioning product update request.\n"]
  provisioned_product_properties : provisioned_product_properties;
      [@ocaml.doc
        "A map that contains the provisioned product properties to be updated.\n\n\
        \ The [LAUNCH_ROLE] key accepts role ARNs. This key allows an administrator to call \
         [UpdateProvisionedProductProperties] to update the launch role that is associated with a \
         provisioned product. This role is used when an end user calls a provisioning operation \
         such as [UpdateProvisionedProduct], [TerminateProvisionedProduct], or \
         [ExecuteProvisionedProductServiceAction]. Only a role ARN is valid. A user ARN is \
         invalid. \n\
        \ \n\
        \  The [OWNER] key accepts user ARNs, IAM role ARNs, and STS assumed-role ARNs. The owner \
         is the user that has permission to see, update, terminate, and execute service actions in \
         the provisioned product.\n\
        \  \n\
        \   The administrator can change the owner of a provisioned product to another IAM or STS \
         entity within the same account. Both end user owners and administrators can see ownership \
         history of the provisioned product using the [ListRecordHistory] API. The new owner can \
         describe all past records for the provisioned product using the [DescribeRecord] API. The \
         previous owner can no longer use [DescribeRecord], but can still see the product's \
         history from when he was an owner using [ListRecordHistory].\n\
        \   \n\
        \    If a provisioned product ownership is assigned to an end user, they can see and \
         perform any action through the API or Service Catalog console such as update, terminate, \
         and execute service actions. If an end user provisions a product and the owner is updated \
         to someone else, they will no longer be able to see or perform any actions through API or \
         the Service Catalog console on that provisioned product.\n\
        \    "]
  provisioned_product_id : id; [@ocaml.doc "The identifier of the provisioned product.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec invalid_state_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An attempt was made to modify a resource that is in a state that is not valid. Check your \
   resources to ensure that they are in valid states before retrying the operation.\n"]

type nonrec provisioned_product_name = string [@@ocaml.doc ""]

type nonrec created_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec provisioned_product_type = string [@@ocaml.doc ""]

type nonrec record_type = string [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec error_description = string [@@ocaml.doc ""]

type nonrec record_error = {
  description : error_description option; [@ocaml.doc "The description of the error.\n"]
  code : error_code option; [@ocaml.doc "The numeric value of the error.\n"]
}
[@@ocaml.doc "The error code and description resulting from an operation.\n"]

type nonrec record_errors = record_error list [@@ocaml.doc ""]

type nonrec record_tag_key = string [@@ocaml.doc ""]

type nonrec record_tag_value = string [@@ocaml.doc ""]

type nonrec record_tag = {
  value : record_tag_value option; [@ocaml.doc "The value for this tag.\n"]
  key : record_tag_key option; [@ocaml.doc "The key for this tag.\n"]
}
[@@ocaml.doc "Information about a tag, which is a key-value pair.\n"]

type nonrec record_tags = record_tag list [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec record_detail = {
  launch_role_arn : role_arn option;
      [@ocaml.doc "The ARN of the launch role associated with the provisioned product.\n"]
  record_tags : record_tags option; [@ocaml.doc "One or more tags.\n"]
  record_errors : record_errors option; [@ocaml.doc "The errors that occurred.\n"]
  path_id : id option; [@ocaml.doc "The path identifier.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  product_id : id option; [@ocaml.doc "The product identifier.\n"]
  provisioned_product_id : id option; [@ocaml.doc "The identifier of the provisioned product.\n"]
  record_type : record_type option;
      [@ocaml.doc
        "The record type.\n\n\
        \ {ul\n\
        \       {-   [PROVISION_PRODUCT] \n\
        \           \n\
        \            }\n\
        \       {-   [UPDATE_PROVISIONED_PRODUCT] \n\
        \           \n\
        \            }\n\
        \       {-   [TERMINATE_PROVISIONED_PRODUCT] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  provisioned_product_type : provisioned_product_type option;
      [@ocaml.doc
        "The type of provisioned product. The supported values are [CFN_STACK], [CFN_STACKSET], \
         [TERRAFORM_OPEN_SOURCE], [TERRAFORM_CLOUD], and [EXTERNAL].\n"]
  updated_time : updated_time option; [@ocaml.doc "The time when the record was last updated.\n"]
  created_time : created_time option; [@ocaml.doc "The UTC time stamp of the creation time.\n"]
  status : record_status option;
      [@ocaml.doc
        "The status of the provisioned product.\n\n\
        \ {ul\n\
        \       {-   [CREATED] - The request was created but the operation has not started.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS] - The requested operation is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS_IN_ERROR] - The provisioned product is under change but the \
         requested operation failed and some remediation is occurring. For example, a rollback.\n\
        \           \n\
        \            }\n\
        \       {-   [SUCCEEDED] - The requested operation has successfully completed.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The requested operation has unsuccessfully completed. Investigate \
         using the error messages returned.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  provisioned_product_name : provisioned_product_name option;
      [@ocaml.doc "The user-friendly name of the provisioned product.\n"]
  record_id : id option; [@ocaml.doc "The identifier of the record.\n"]
}
[@@ocaml.doc "Information about a request operation.\n"]

type nonrec update_provisioned_product_output = {
  record_detail : record_detail option; [@ocaml.doc "Information about the result of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec provisioned_product_name_or_arn = string [@@ocaml.doc ""]

type nonrec product_view_name = string [@@ocaml.doc ""]

type nonrec portfolio_display_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "The value for this key.\n"]
  key : tag_key; [@ocaml.doc "The tag key.\n"]
}
[@@ocaml.doc
  "Information about a tag. A tag is a key-value pair. Tags are propagated to the resources \
   created when provisioning a product.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec update_provisioned_product_input = {
  update_token : idempotency_token;
      [@ocaml.doc
        "The idempotency token that uniquely identifies the provisioning update request.\n"]
  tags : tags option;
      [@ocaml.doc
        "One or more tags. Requires the product to have [RESOURCE_UPDATE] constraint with \
         [TagUpdatesOnProvisionedProduct] set to [ALLOWED] to allow tag updates.\n"]
  provisioning_preferences : update_provisioning_preferences option;
      [@ocaml.doc
        "An object that contains information about the provisioning preferences for a stack set.\n"]
  provisioning_parameters : update_provisioning_parameters option;
      [@ocaml.doc "The new parameters.\n"]
  path_name : portfolio_display_name option;
      [@ocaml.doc "The name of the path. You must provide the name or ID, but not both.\n"]
  path_id : id option;
      [@ocaml.doc
        "The path identifier. This value is optional if the product has a default path, and \
         required if the product has more than one path. You must provide the name or ID, but not \
         both.\n"]
  provisioning_artifact_name : provisioning_artifact_name option;
      [@ocaml.doc
        "The name of the provisioning artifact. You must provide the name or ID, but not both.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  product_name : product_view_name option;
      [@ocaml.doc "The name of the product. You must provide the name or ID, but not both.\n"]
  product_id : id option;
      [@ocaml.doc "The identifier of the product. You must provide the name or ID, but not both.\n"]
  provisioned_product_id : id option;
      [@ocaml.doc
        "The identifier of the provisioned product. You must provide the name or ID, but not both.\n"]
  provisioned_product_name : provisioned_product_name_or_arn option;
      [@ocaml.doc
        "The name of the provisioned product. You cannot specify both [ProvisionedProductName] and \
         [ProvisionedProductId].\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec product_view_owner = string [@@ocaml.doc ""]

type nonrec product_view_short_description = string [@@ocaml.doc ""]

type nonrec product_type =
  | EXTERNAL [@ocaml.doc ""]
  | TERRAFORM_CLOUD [@ocaml.doc ""]
  | TERRAFORM_OPEN_SOURCE [@ocaml.doc ""]
  | MARKETPLACE [@ocaml.doc ""]
  | CLOUD_FORMATION_TEMPLATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec product_view_distributor = string [@@ocaml.doc ""]

type nonrec has_default_path = bool [@@ocaml.doc ""]

type nonrec support_email = string [@@ocaml.doc ""]

type nonrec support_description = string [@@ocaml.doc ""]

type nonrec support_url = string [@@ocaml.doc ""]

type nonrec product_view_summary = {
  support_url : support_url option;
      [@ocaml.doc "The URL information to obtain support for this Product.\n"]
  support_description : support_description option;
      [@ocaml.doc "The description of the support for this Product.\n"]
  support_email : support_email option;
      [@ocaml.doc "The email contact information to obtain support for this Product.\n"]
  has_default_path : has_default_path option;
      [@ocaml.doc
        "Indicates whether the product has a default path. If the product does not have a default \
         path, call [ListLaunchPaths] to disambiguate between paths. Otherwise, [ListLaunchPaths] \
         is not required, and the output of [ProductViewSummary] can be used directly with \
         [DescribeProvisioningParameters].\n"]
  distributor : product_view_distributor option;
      [@ocaml.doc
        "The distributor of the product. Contact the product administrator for the significance of \
         this value.\n"]
  type_ : product_type option;
      [@ocaml.doc
        "The product type. Contact the product administrator for the significance of this value. \
         If this value is [MARKETPLACE], the product was created by Amazon Web Services \
         Marketplace.\n"]
  short_description : product_view_short_description option;
      [@ocaml.doc "Short description of the product.\n"]
  owner : product_view_owner option;
      [@ocaml.doc
        "The owner of the product. Contact the product administrator for the significance of this \
         value.\n"]
  name : product_view_name option; [@ocaml.doc "The name of the product.\n"]
  product_id : id option; [@ocaml.doc "The product identifier.\n"]
  id : id option; [@ocaml.doc "The product view identifier.\n"]
}
[@@ocaml.doc "Summary information about a product view.\n"]

type nonrec resource_ar_n = string [@@ocaml.doc ""]

type nonrec source_type = CODESTAR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec code_star_connection_arn = string [@@ocaml.doc ""]

type nonrec repository = string [@@ocaml.doc ""]

type nonrec repository_branch = string [@@ocaml.doc ""]

type nonrec repository_artifact_path = string [@@ocaml.doc ""]

type nonrec code_star_parameters = {
  artifact_path : repository_artifact_path;
      [@ocaml.doc
        "The absolute path wehre the artifact resides within the repo and branch, formatted as \
         \"folder/file.json.\" \n"]
  branch : repository_branch; [@ocaml.doc "The specific branch where the artifact resides. \n"]
  repository : repository;
      [@ocaml.doc
        "The specific repository where the product\226\128\153s artifact-to-be-synced resides, \
         formatted as \"Account/Repo.\" \n"]
  connection_arn : code_star_connection_arn;
      [@ocaml.doc
        "The CodeStar ARN, which is the connection between Service Catalog and the external \
         repository.\n"]
}
[@@ocaml.doc "The subtype containing details about the Codestar connection [Type]. \n"]

type nonrec source_connection_parameters = {
  code_star : code_star_parameters option; [@ocaml.doc "Provides [ConnectionType] details.\n"]
}
[@@ocaml.doc "Provides connection details.\n"]

type nonrec last_sync_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec last_sync_status = FAILED [@ocaml.doc ""] | SUCCEEDED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec last_sync_status_message = string [@@ocaml.doc ""]

type nonrec last_successful_sync_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec last_sync = {
  last_successful_sync_provisioning_artifact_id : id option;
      [@ocaml.doc
        "The ProvisioningArtifactID of the ProvisioningArtifact created from the latest successful \
         sync. \n"]
  last_successful_sync_time : last_successful_sync_time option;
      [@ocaml.doc
        "The time of the latest successful sync from the source repo artifact to the Service \
         Catalog product.\n"]
  last_sync_status_message : last_sync_status_message option;
      [@ocaml.doc "The sync's status message. \n"]
  last_sync_status : last_sync_status option;
      [@ocaml.doc "The current status of the sync. Responses include [SUCCEEDED] or [FAILED]. \n"]
  last_sync_time : last_sync_time option;
      [@ocaml.doc
        "The time of the last attempted sync from the repository to the Service Catalog product. \n"]
}
[@@ocaml.doc
  "Provides details about the product's connection sync and contains the following sub-fields. \n\n\
  \ {ul\n\
  \       {-   [LastSyncTime] \n\
  \           \n\
  \            }\n\
  \       {-   [LastSyncStatus] \n\
  \           \n\
  \            }\n\
  \       {-   [LastSyncStatusMessage] \n\
  \           \n\
  \            }\n\
  \       {-   [LastSuccessfulSyncTime] \n\
  \           \n\
  \            }\n\
  \       {-   [LastSuccessfulSyncProvisioningArtifactID] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec source_connection_detail = {
  last_sync : last_sync option;
      [@ocaml.doc
        "Provides details about the product's connection sync and contains the following \
         sub-fields. \n\n\
        \ {ul\n\
        \       {-   [LastSyncTime] \n\
        \           \n\
        \            }\n\
        \       {-   [LastSyncStatus] \n\
        \           \n\
        \            }\n\
        \       {-   [LastSyncStatusMessage] \n\
        \           \n\
        \            }\n\
        \       {-   [LastSuccessfulSyncTime] \n\
        \           \n\
        \            }\n\
        \       {-   [LastSuccessfulSyncProvisioningArtifactID] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  connection_parameters : source_connection_parameters option;
      [@ocaml.doc "The connection details based on the connection [Type].\n"]
  type_ : source_type option;
      [@ocaml.doc "The only supported [SourceConnection] type is Codestar.\n"]
}
[@@ocaml.doc "Provides details about the configured [SourceConnection]. \n"]

type nonrec product_view_detail = {
  source_connection : source_connection_detail option;
      [@ocaml.doc
        "A top level [ProductViewDetail] response containing details about the \
         product\226\128\153s connection. Service Catalog returns this field for the \
         [CreateProduct], [UpdateProduct], [DescribeProductAsAdmin], and [SearchProductAsAdmin] \
         APIs. This response contains the same fields as the [ConnectionParameters] request, with \
         the addition of the [LastSync] response.\n"]
  created_time : created_time option; [@ocaml.doc "The UTC time stamp of the creation time.\n"]
  product_ar_n : resource_ar_n option; [@ocaml.doc "The ARN of the product.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the product.\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - The product is ready for use.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] - Product creation has started; the product is not ready for use.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - An action failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  product_view_summary : product_view_summary option;
      [@ocaml.doc "Summary information about the product view.\n"]
}
[@@ocaml.doc "Information about a product view.\n"]

type nonrec update_product_output = {
  tags : tags option; [@ocaml.doc "Information about the tags associated with the product.\n"]
  product_view_detail : product_view_detail option;
      [@ocaml.doc "Information about the product view.\n"]
}
[@@ocaml.doc ""]

type nonrec add_tags = tag list [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec source_connection = {
  connection_parameters : source_connection_parameters;
      [@ocaml.doc "The connection details based on the connection [Type]. \n"]
  type_ : source_type option;
      [@ocaml.doc "The only supported [SourceConnection] type is Codestar. \n"]
}
[@@ocaml.doc
  "A top level [ProductViewDetail] response containing details about the product\226\128\153s \
   connection. Service Catalog returns this field for the [CreateProduct], [UpdateProduct], \
   [DescribeProductAsAdmin], and [SearchProductAsAdmin] APIs. This response contains the same \
   fields as the [ConnectionParameters] request, with the addition of the [LastSync] response.\n"]

type nonrec update_product_input = {
  source_connection : source_connection option;
      [@ocaml.doc
        "Specifies connection details for the updated product and syncs the product to the \
         connection source artifact. This automatically manages the product's artifacts based on \
         changes to the source. The [SourceConnection] parameter consists of the following \
         sub-fields.\n\n\
        \ {ul\n\
        \       {-   [Type] \n\
        \           \n\
        \            }\n\
        \       {-   [ConnectionParamters] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  remove_tags : tag_keys option; [@ocaml.doc "The tags to remove from the product.\n"]
  add_tags : add_tags option; [@ocaml.doc "The tags to add to the product.\n"]
  support_url : support_url option; [@ocaml.doc "The updated support URL for the product.\n"]
  support_email : support_email option; [@ocaml.doc "The updated support email for the product.\n"]
  support_description : support_description option;
      [@ocaml.doc "The updated support description for the product.\n"]
  distributor : product_view_owner option; [@ocaml.doc "The updated distributor of the product.\n"]
  description : product_view_short_description option;
      [@ocaml.doc "The updated description of the product.\n"]
  owner : product_view_owner option; [@ocaml.doc "The updated owner of the product.\n"]
  name : product_view_name option; [@ocaml.doc "The updated product name.\n"]
  id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec share_status =
  | ERROR [@ocaml.doc ""]
  | COMPLETED_WITH_ERRORS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | NOT_STARTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_portfolio_share_output = {
  status : share_status option;
      [@ocaml.doc
        "The status of [UpdatePortfolioShare] operation. You can also obtain the operation status \
         using [DescribePortfolioShareStatus] API. \n"]
  portfolio_share_token : id option;
      [@ocaml.doc
        "The token that tracks the status of the [UpdatePortfolioShare] operation for external \
         account to account or organizational type sharing.\n"]
}
[@@ocaml.doc ""]

type nonrec organization_node_type =
  | ACCOUNT [@ocaml.doc ""]
  | ORGANIZATIONAL_UNIT [@ocaml.doc ""]
  | ORGANIZATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec organization_node_value = string [@@ocaml.doc ""]

type nonrec organization_node = {
  value : organization_node_value option; [@ocaml.doc "The identifier of the organization node.\n"]
  type_ : organization_node_type option; [@ocaml.doc "The organization node type.\n"]
}
[@@ocaml.doc "Information about the organization node.\n"]

type nonrec nullable_boolean = bool [@@ocaml.doc ""]

type nonrec update_portfolio_share_input = {
  share_principals : nullable_boolean option;
      [@ocaml.doc
        "A flag to enables or disables [Principals] sharing in the portfolio. If this field is not \
         provided, the current state of the [Principals] sharing on the portfolio share will not \
         be modified. \n"]
  share_tag_options : nullable_boolean option;
      [@ocaml.doc
        "Enables or disables [TagOptions] sharing for the portfolio share. If this field is not \
         provided, the current state of TagOptions sharing on the portfolio share will not be \
         modified.\n"]
  organization_node : organization_node option; [@ocaml.doc ""]
  account_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account Id of the recipient account. This field is required when \
         updating an external account to account type share.\n"]
  portfolio_id : id;
      [@ocaml.doc "The unique identifier of the portfolio for which the share will be updated.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec operation_not_supported_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The operation is not supported.\n"]

type nonrec portfolio_description = string [@@ocaml.doc ""]

type nonrec provider_name = string [@@ocaml.doc ""]

type nonrec portfolio_detail = {
  provider_name : provider_name option; [@ocaml.doc "The name of the portfolio provider.\n"]
  created_time : creation_time option; [@ocaml.doc "The UTC time stamp of the creation time.\n"]
  description : portfolio_description option; [@ocaml.doc "The description of the portfolio.\n"]
  display_name : portfolio_display_name option;
      [@ocaml.doc "The name to use for display purposes.\n"]
  ar_n : resource_ar_n option; [@ocaml.doc "The ARN assigned to the portfolio.\n"]
  id : id option; [@ocaml.doc "The portfolio identifier.\n"]
}
[@@ocaml.doc "Information about a portfolio.\n"]

type nonrec update_portfolio_output = {
  tags : tags option; [@ocaml.doc "Information about the tags associated with the portfolio.\n"]
  portfolio_detail : portfolio_detail option; [@ocaml.doc "Information about the portfolio.\n"]
}
[@@ocaml.doc ""]

type nonrec update_portfolio_input = {
  remove_tags : tag_keys option; [@ocaml.doc "The tags to remove.\n"]
  add_tags : add_tags option; [@ocaml.doc "The tags to add.\n"]
  provider_name : provider_name option; [@ocaml.doc "The updated name of the portfolio provider.\n"]
  description : portfolio_description option;
      [@ocaml.doc "The updated description of the portfolio.\n"]
  display_name : portfolio_display_name option;
      [@ocaml.doc "The name to use for display purposes.\n"]
  id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The current limits of the service would have been exceeded by this operation. Decrease your \
   resource use or increase your service limits and retry the operation.\n"]

type nonrec constraint_type = string [@@ocaml.doc ""]

type nonrec constraint_description = string [@@ocaml.doc ""]

type nonrec constraint_detail = {
  portfolio_id : id option;
      [@ocaml.doc
        "The identifier of the portfolio the product resides in. The constraint applies only to \
         the instance of the product that lives within this portfolio.\n"]
  product_id : id option;
      [@ocaml.doc
        "The identifier of the product the constraint applies to. Note that a constraint applies \
         to a specific instance of a product within a certain portfolio.\n"]
  owner : account_id option; [@ocaml.doc "The owner of the constraint.\n"]
  description : constraint_description option; [@ocaml.doc "The description of the constraint.\n"]
  type_ : constraint_type option;
      [@ocaml.doc
        "The type of constraint.\n\n\
        \ {ul\n\
        \       {-   [LAUNCH] \n\
        \           \n\
        \            }\n\
        \       {-   [NOTIFICATION] \n\
        \           \n\
        \            }\n\
        \       {-  STACKSET\n\
        \           \n\
        \            }\n\
        \       {-   [TEMPLATE] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  constraint_id : id option; [@ocaml.doc "The identifier of the constraint.\n"]
}
[@@ocaml.doc "Information about a constraint.\n"]

type nonrec constraint_parameters = string [@@ocaml.doc ""]

type nonrec update_constraint_output = {
  status : status option; [@ocaml.doc "The status of the current request.\n"]
  constraint_parameters : constraint_parameters option; [@ocaml.doc "The constraint parameters.\n"]
  constraint_detail : constraint_detail option; [@ocaml.doc "Information about the constraint.\n"]
}
[@@ocaml.doc ""]

type nonrec update_constraint_input = {
  parameters : constraint_parameters option;
      [@ocaml.doc
        "The constraint parameters, in JSON format. The syntax depends on the constraint type as \
         follows:\n\n\
        \  LAUNCH  You are required to specify either the [RoleArn] or the [LocalRoleName] but \
         can't use both.\n\
        \          \n\
        \           Specify the [RoleArn] property as follows:\n\
        \           \n\
        \             [{\"RoleArn\" : \"arn:aws:iam::123456789012:role/LaunchRole\"}] \n\
        \            \n\
        \             Specify the [LocalRoleName] property as follows:\n\
        \             \n\
        \               [{\"LocalRoleName\": \"SCBasicLaunchRole\"}] \n\
        \              \n\
        \               If you specify the [LocalRoleName] property, when an account uses the \
         launch constraint, the IAM role with that name in the account will be used. This allows \
         launch-role constraints to be account-agnostic so the administrator can create fewer \
         resources per shared account.\n\
        \               \n\
        \                 The given role name must exist in the account used to create the launch \
         constraint and the account of the user who launches a product with this launch constraint.\n\
        \                 \n\
        \                   You cannot have both a [LAUNCH] and a [STACKSET] constraint.\n\
        \                   \n\
        \                    You also cannot have more than one [LAUNCH] constraint on a product \
         and portfolio.\n\
        \                    \n\
        \                      NOTIFICATION  Specify the [NotificationArns] property as follows:\n\
        \                                    \n\
        \                                      [{\"NotificationArns\" : \
         \\[\"arn:aws:sns:us-east-1:123456789012:Topic\"\\]}] \n\
        \                                     \n\
        \                                       RESOURCE_UPDATE  Specify the \
         [TagUpdatesOnProvisionedProduct] property as follows:\n\
        \                                                        \n\
        \                                                          \
         [{\"Version\":\"2.0\",\"Properties\":{\"TagUpdateOnProvisionedProduct\":\"String\"}}] \n\
        \                                                         \n\
        \                                                          The \
         [TagUpdatesOnProvisionedProduct] property accepts a string value of [ALLOWED] or \
         [NOT_ALLOWED].\n\
        \                                                          \n\
        \                                                            STACKSET  Specify the \
         [Parameters] property as follows:\n\
        \                                                                      \n\
        \                                                                        [{\"Version\": \
         \"String\", \"Properties\": {\"AccountList\": \\[ \"String\" \\], \"RegionList\": \\[ \
         \"String\" \\], \"AdminRole\": \"String\", \"ExecutionRole\": \"String\"}}] \n\
        \                                                                       \n\
        \                                                                        You cannot have \
         both a [LAUNCH] and a [STACKSET] constraint.\n\
        \                                                                        \n\
        \                                                                         You also cannot \
         have more than one [STACKSET] constraint on a product and portfolio.\n\
        \                                                                         \n\
        \                                                                          Products with a \
         [STACKSET] constraint will launch an CloudFormation stack set.\n\
        \                                                                          \n\
        \                                                                            TEMPLATE  \n\
         Specify the [Rules] property. For more information, see \
         {{:http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html}Template \
         Constraint Rules}.\n\n\
        \  "]
  description : constraint_description option;
      [@ocaml.doc "The updated description of the constraint.\n"]
  id : id; [@ocaml.doc "The identifier of the constraint.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec unique_tag_value = string [@@ocaml.doc ""]

type nonrec unique_tag_key = string [@@ocaml.doc ""]

type nonrec unique_tag_resource_identifier = {
  value : unique_tag_value option; [@ocaml.doc " A unique value that's attached to a resource. \n"]
  key : unique_tag_key option; [@ocaml.doc " A unique key that's attached to a resource. \n"]
}
[@@ocaml.doc
  " The unique key-value pair for a tag that identifies provisioned product resources. \n"]

type nonrec total_results_count = int [@@ocaml.doc ""]

type nonrec terminate_provisioned_product_output = {
  record_detail : record_detail option;
      [@ocaml.doc "Information about the result of this request.\n"]
}
[@@ocaml.doc ""]

type nonrec ignore_errors = bool [@@ocaml.doc ""]

type nonrec retain_physical_resources = bool [@@ocaml.doc ""]

type nonrec terminate_provisioned_product_input = {
  retain_physical_resources : retain_physical_resources option;
      [@ocaml.doc
        "When this boolean parameter is set to true, the [TerminateProvisionedProduct] API deletes \
         the Service Catalog provisioned product. However, it does not remove the CloudFormation \
         stack, stack set, or the underlying resources of the deleted provisioned product. The \
         default value is false.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  ignore_errors : ignore_errors option;
      [@ocaml.doc
        "If set to true, Service Catalog stops managing the specified provisioned product even if \
         it cannot delete the underlying resources.\n"]
  terminate_token : idempotency_token;
      [@ocaml.doc
        "An idempotency token that uniquely identifies the termination request. This token is only \
         valid during the termination process. After the provisioned product is terminated, \
         subsequent requests to terminate the same provisioned product always return {b \
         ResourceNotFound}.\n"]
  provisioned_product_id : id option;
      [@ocaml.doc
        "The identifier of the provisioned product. You cannot specify both \
         [ProvisionedProductName] and [ProvisionedProductId].\n"]
  provisioned_product_name : provisioned_product_name_or_arn option;
      [@ocaml.doc
        "The name of the provisioned product. You cannot specify both [ProvisionedProductName] and \
         [ProvisionedProductId].\n"]
}
[@@ocaml.doc ""]

type nonrec tag_option_values = tag_option_value list [@@ocaml.doc ""]

type nonrec tag_option_summary = {
  values : tag_option_values option; [@ocaml.doc "The TagOption value.\n"]
  key : tag_option_key option; [@ocaml.doc "The TagOption key.\n"]
}
[@@ocaml.doc "Summary information about a TagOption.\n"]

type nonrec tag_option_summaries = tag_option_summary list [@@ocaml.doc ""]

type nonrec tag_option_details = tag_option_detail list [@@ocaml.doc ""]

type nonrec successful_shares = account_id list [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec status_message = string [@@ocaml.doc ""]

type nonrec status_detail = string [@@ocaml.doc ""]

type nonrec stack_instance_status =
  | INOPERABLE [@ocaml.doc ""]
  | OUTDATED [@ocaml.doc ""]
  | CURRENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_instance = {
  stack_instance_status : stack_instance_status option;
      [@ocaml.doc
        "The status of the stack instance, in terms of its synchronization with its associated \
         stack set. \n\n\
        \ {ul\n\
        \       {-   [INOPERABLE]: A [DeleteStackInstances] operation has failed and left the \
         stack in an unstable state. Stacks in this state are excluded from further \
         [UpdateStackSet] operations. You might need to perform a [DeleteStackInstances] \
         operation, with [RetainStacks] set to true, to delete the stack instance, and then delete \
         the stack manually. \n\
        \           \n\
        \            }\n\
        \       {-   [OUTDATED]: The stack isn't currently up to date with the stack set because \
         either the associated stack failed during a [CreateStackSet] or [UpdateStackSet] \
         operation, or the stack was part of a [CreateStackSet] or [UpdateStackSet] operation that \
         failed or was stopped before the stack was created or updated.\n\
        \           \n\
        \            }\n\
        \       {-   [CURRENT]: The stack is currently up to date with the stack set.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  region : region option;
      [@ocaml.doc
        "The name of the Amazon Web Services Region that the stack instance is associated with.\n"]
  account : account_id option;
      [@ocaml.doc
        "The name of the Amazon Web Services account that the stack instance is associated with.\n"]
}
[@@ocaml.doc
  "An CloudFormation stack, in a specific account and Region, that's part of a stack set \
   operation. A stack instance is a reference to an attempted or actual stack in a given account \
   within a given Region. A stack instance can exist without a stack\226\128\148for example, if \
   the stack couldn't be created for some reason. A stack instance is associated with only one \
   stack set. Each stack instance contains the ID of its associated stack set, as well as the ID \
   of the actual stack and the stack status. \n"]

type nonrec stack_instances = stack_instance list [@@ocaml.doc ""]

type nonrec provisioning_artifact_property_value = string [@@ocaml.doc ""]

type nonrec provisioning_artifact_property_name = Id [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec source_provisioning_artifact_properties_map =
  (provisioning_artifact_property_name * provisioning_artifact_property_value) list
[@@ocaml.doc ""]

type nonrec source_provisioning_artifact_properties =
  source_provisioning_artifact_properties_map list
[@@ocaml.doc ""]

type nonrec sort_order = DESCENDING [@ocaml.doc ""] | ASCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sort_field = string [@@ocaml.doc ""]

type nonrec namespaces = account_id list [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec error = string [@@ocaml.doc ""]

type nonrec share_error = {
  error : error option; [@ocaml.doc "Error type that happened when processing the operation.\n"]
  message : message option; [@ocaml.doc "Information about the error.\n"]
  accounts : namespaces option; [@ocaml.doc "List of accounts impacted by the error.\n"]
}
[@@ocaml.doc "Errors that occurred during the portfolio share operation.\n"]

type nonrec share_errors = share_error list [@@ocaml.doc ""]

type nonrec share_details = {
  share_errors : share_errors option; [@ocaml.doc "List of errors.\n"]
  successful_shares : successful_shares option;
      [@ocaml.doc "List of accounts for whom the operation succeeded.\n"]
}
[@@ocaml.doc "Information about the portfolio share operation.\n"]

type nonrec service_action_summaries = service_action_summary list [@@ocaml.doc ""]

type nonrec service_action_association = {
  provisioning_artifact_id : id;
      [@ocaml.doc "The identifier of the provisioning artifact. For example, [pa-4abcdjnxjj6ne].\n"]
  product_id : id; [@ocaml.doc "The product identifier. For example, [prod-abcdzk7xy33qa].\n"]
  service_action_id : id;
      [@ocaml.doc "The self-service action identifier. For example, [act-fs7abcd89wxyz].\n"]
}
[@@ocaml.doc
  "A self-service action association consisting of the Action ID, the Product ID, and the \
   Provisioning Artifact ID.\n"]

type nonrec service_action_associations = service_action_association list [@@ocaml.doc ""]

type nonrec service_action_association_error_message = string [@@ocaml.doc ""]

type nonrec service_action_association_error_code =
  | InvalidParameterException [@ocaml.doc ""]
  | ThrottlingException [@ocaml.doc ""]
  | ResourceNotFoundException [@ocaml.doc ""]
  | LimitExceededException [@ocaml.doc ""]
  | InternalFailure [@ocaml.doc ""]
  | DuplicateResourceException [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec search_provisioned_products_page_size = int [@@ocaml.doc ""]

type nonrec provisioned_product_status =
  | PLAN_IN_PROGRESS [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | TAINTED [@ocaml.doc ""]
  | UNDER_CHANGE [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec provisioned_product_status_message = string [@@ocaml.doc ""]

type nonrec physical_id = string [@@ocaml.doc ""]

type nonrec provisioned_product_attribute = {
  user_arn_session : user_arn_session option;
      [@ocaml.doc "The ARN of the user in the session. This ARN might contain a session ID.\n"]
  user_arn : user_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the user.\n"]
  provisioning_artifact_name : provisioning_artifact_name option;
      [@ocaml.doc "The name of the provisioning artifact.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  product_name : product_view_name option; [@ocaml.doc "The name of the product.\n"]
  product_id : id option; [@ocaml.doc "The product identifier.\n"]
  physical_id : physical_id option;
      [@ocaml.doc
        "The assigned identifier for the resource, such as an EC2 instance ID or an S3 bucket name.\n"]
  tags : tags option; [@ocaml.doc "One or more tags.\n"]
  last_successful_provisioning_record_id : id option;
      [@ocaml.doc
        "The record identifier of the last successful request performed on this provisioned \
         product of the following types:\n\n\
        \ {ul\n\
        \       {-   ProvisionProduct \n\
        \           \n\
        \            }\n\
        \       {-   UpdateProvisionedProduct \n\
        \           \n\
        \            }\n\
        \       {-   ExecuteProvisionedProductPlan \n\
        \           \n\
        \            }\n\
        \       {-   TerminateProvisionedProduct \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_provisioning_record_id : id option;
      [@ocaml.doc
        "The record identifier of the last request performed on this provisioned product of the \
         following types:\n\n\
        \ {ul\n\
        \       {-   ProvisionProduct \n\
        \           \n\
        \            }\n\
        \       {-   UpdateProvisionedProduct \n\
        \           \n\
        \            }\n\
        \       {-   ExecuteProvisionedProductPlan \n\
        \           \n\
        \            }\n\
        \       {-   TerminateProvisionedProduct \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_record_id : id option;
      [@ocaml.doc
        "The record identifier of the last request performed on this provisioned product.\n"]
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  created_time : created_time option; [@ocaml.doc "The UTC time stamp of the creation time.\n"]
  status_message : provisioned_product_status_message option;
      [@ocaml.doc "The current status message of the provisioned product.\n"]
  status : provisioned_product_status option;
      [@ocaml.doc
        "The current status of the provisioned product.\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - Stable state, ready to perform any operation. The most recent \
         operation succeeded and completed.\n\
        \           \n\
        \            }\n\
        \       {-   [UNDER_CHANGE] - Transitive state. Operations performed might not have valid \
         results. Wait for an [AVAILABLE] status before performing operations.\n\
        \           \n\
        \            }\n\
        \       {-   [TAINTED] - Stable state, ready to perform any operation. The stack has \
         completed the requested operation but is not exactly what was requested. For example, a \
         request to update to a new version failed and the stack rolled back to the current \
         version.\n\
        \           \n\
        \            }\n\
        \       {-   [ERROR] - An unexpected error occurred. The provisioned product exists but \
         the stack is not running. For example, CloudFormation received a parameter value that was \
         not valid and could not launch the stack.\n\
        \           \n\
        \            }\n\
        \       {-   [PLAN_IN_PROGRESS] - Transitive state. The plan operations were performed to \
         provision a new product, but resources have not yet been created. After reviewing the \
         list of resources to be created, execute the plan. Wait for an [AVAILABLE] status before \
         performing operations.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  id : id option; [@ocaml.doc "The identifier of the provisioned product.\n"]
  type_ : provisioned_product_type option;
      [@ocaml.doc
        "The type of provisioned product. The supported values are [CFN_STACK], [CFN_STACKSET], \
         [TERRAFORM_OPEN_SOURCE], [TERRAFORM_CLOUD], and [EXTERNAL].\n"]
  arn : provisioned_product_name_or_arn option; [@ocaml.doc "The ARN of the provisioned product.\n"]
  name : provisioned_product_name_or_arn option;
      [@ocaml.doc "The user-friendly name of the provisioned product.\n"]
}
[@@ocaml.doc "Information about a provisioned product.\n"]

type nonrec provisioned_product_attributes = provisioned_product_attribute list [@@ocaml.doc ""]

type nonrec page_token = string [@@ocaml.doc ""]

type nonrec search_provisioned_products_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  total_results_count : total_results_count option;
      [@ocaml.doc "The number of provisioned products found.\n"]
  provisioned_products : provisioned_product_attributes option;
      [@ocaml.doc "Information about the provisioned products.\n"]
}
[@@ocaml.doc ""]

type nonrec access_level_filter_key =
  | USER [@ocaml.doc ""]
  | ROLE [@ocaml.doc ""]
  | ACCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_level_filter_value = string [@@ocaml.doc ""]

type nonrec access_level_filter = {
  value : access_level_filter_value option;
      [@ocaml.doc
        "The user to which the access level applies. The only supported value is [self].\n"]
  key : access_level_filter_key option;
      [@ocaml.doc
        "The access level.\n\n\
        \ {ul\n\
        \       {-   [Account] - Filter results based on the account.\n\
        \           \n\
        \            }\n\
        \       {-   [Role] - Filter results based on the federated role of the specified user.\n\
        \           \n\
        \            }\n\
        \       {-   [User] - Filter results based on the specified user.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The access level to use to filter results.\n"]

type nonrec provisioned_product_view_filter_value = string [@@ocaml.doc ""]

type nonrec provisioned_product_view_filter_values = provisioned_product_view_filter_value list
[@@ocaml.doc ""]

type nonrec provisioned_product_view_filter_by = SearchQuery [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec provisioned_product_filters =
  (provisioned_product_view_filter_by * provisioned_product_view_filter_values) list
[@@ocaml.doc ""]

type nonrec search_provisioned_products_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : search_provisioned_products_page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  sort_order : sort_order option;
      [@ocaml.doc "The sort order. If no value is specified, the results are not sorted.\n"]
  sort_by : sort_field option;
      [@ocaml.doc
        "The sort field. If no value is specified, the results are not sorted. The valid values \
         are [arn], [id], [name], and [lastRecordId].\n"]
  filters : provisioned_product_filters option;
      [@ocaml.doc
        "The search filters.\n\n\
        \ When the key is [SearchQuery], the searchable fields are [arn], [createdTime], [id], \
         [lastRecordId], [idempotencyToken], [name], [physicalId], [productId], \
         [provisioningArtifactId], [type], [status], [tags], [userArn], [userArnSession], \
         [lastProvisioningRecordId], [lastSuccessfulProvisioningRecordId], [productName], and \
         [provisioningArtifactName].\n\
        \ \n\
        \  Example: [\"SearchQuery\":\\[\"status:AVAILABLE\"\\]] \n\
        \  "]
  access_level_filter : access_level_filter option;
      [@ocaml.doc "The access level to use to obtain results. The default is [Account].\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec product_view_summaries = product_view_summary list [@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec approximate_count = int [@@ocaml.doc ""]

type nonrec product_view_aggregation_value = {
  approximate_count : approximate_count option;
      [@ocaml.doc "An approximate count of the products that match the value.\n"]
  value : attribute_value option; [@ocaml.doc "The value of the product view aggregation.\n"]
}
[@@ocaml.doc
  "A single product view aggregation value/count pair, containing metadata about each product to \
   which the calling user has access.\n"]

type nonrec product_view_aggregation_values = product_view_aggregation_value list [@@ocaml.doc ""]

type nonrec product_view_aggregation_type = string [@@ocaml.doc ""]

type nonrec product_view_aggregations =
  (product_view_aggregation_type * product_view_aggregation_values) list
[@@ocaml.doc ""]

type nonrec search_products_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  product_view_aggregations : product_view_aggregations option;
      [@ocaml.doc "The product view aggregations.\n"]
  product_view_summaries : product_view_summaries option;
      [@ocaml.doc "Information about the product views.\n"]
}
[@@ocaml.doc ""]

type nonrec product_view_filter_value = string [@@ocaml.doc ""]

type nonrec product_view_filter_values = product_view_filter_value list [@@ocaml.doc ""]

type nonrec product_view_filter_by =
  | SourceProductId [@ocaml.doc ""]
  | ProductType [@ocaml.doc ""]
  | Owner [@ocaml.doc ""]
  | FullTextSearch [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec product_view_filters = (product_view_filter_by * product_view_filter_values) list
[@@ocaml.doc ""]

type nonrec page_size_max100 = int [@@ocaml.doc ""]

type nonrec product_view_sort_by =
  | CreationDate [@ocaml.doc ""]
  | VersionCount [@ocaml.doc ""]
  | Title [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec search_products_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  sort_order : sort_order option;
      [@ocaml.doc "The sort order. If no value is specified, the results are not sorted.\n"]
  sort_by : product_view_sort_by option;
      [@ocaml.doc "The sort field. If no value is specified, the results are not sorted.\n"]
  page_size : page_size_max100 option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  filters : product_view_filters option;
      [@ocaml.doc
        "The search filters. If no search filters are specified, the output includes all products \
         to which the caller has access.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec product_view_details = product_view_detail list [@@ocaml.doc ""]

type nonrec search_products_as_admin_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  product_view_details : product_view_details option;
      [@ocaml.doc "Information about the product views.\n"]
}
[@@ocaml.doc ""]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec product_source = ACCOUNT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec search_products_as_admin_input = {
  product_source : product_source option;
      [@ocaml.doc "Access level of the source of the product.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  sort_order : sort_order option;
      [@ocaml.doc "The sort order. If no value is specified, the results are not sorted.\n"]
  sort_by : product_view_sort_by option;
      [@ocaml.doc "The sort field. If no value is specified, the results are not sorted.\n"]
  filters : product_view_filters option;
      [@ocaml.doc
        "The search filters. If no search filters are specified, the output includes all products \
         to which the administrator has access.\n"]
  portfolio_id : id option; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec search_filter_value = string [@@ocaml.doc ""]

type nonrec search_filter_key = string [@@ocaml.doc ""]

type nonrec resource_attribute =
  | TAGS [@ocaml.doc ""]
  | DELETIONPOLICY [@ocaml.doc ""]
  | UPDATEPOLICY [@ocaml.doc ""]
  | CREATIONPOLICY [@ocaml.doc ""]
  | METADATA [@ocaml.doc ""]
  | PROPERTIES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scope = resource_attribute list [@@ocaml.doc ""]

type nonrec provisioned_product_id = string [@@ocaml.doc ""]

type nonrec last_request_id = string [@@ocaml.doc ""]

type nonrec provisioned_product_detail = {
  launch_role_arn : role_arn option;
      [@ocaml.doc "The ARN of the launch role associated with the provisioned product.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact. For example, [pa-4abcdjnxjj6ne].\n"]
  product_id : id option;
      [@ocaml.doc "The product identifier. For example, [prod-abcdzk7xy33qa].\n"]
  last_successful_provisioning_record_id : id option;
      [@ocaml.doc
        "The record identifier of the last successful request performed on this provisioned \
         product of the following types:\n\n\
        \ {ul\n\
        \       {-   ProvisionProduct \n\
        \           \n\
        \            }\n\
        \       {-   UpdateProvisionedProduct \n\
        \           \n\
        \            }\n\
        \       {-   ExecuteProvisionedProductPlan \n\
        \           \n\
        \            }\n\
        \       {-   TerminateProvisionedProduct \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_provisioning_record_id : id option;
      [@ocaml.doc
        "The record identifier of the last request performed on this provisioned product of the \
         following types:\n\n\
        \ {ul\n\
        \       {-   ProvisionProduct \n\
        \           \n\
        \            }\n\
        \       {-   UpdateProvisionedProduct \n\
        \           \n\
        \            }\n\
        \       {-   ExecuteProvisionedProductPlan \n\
        \           \n\
        \            }\n\
        \       {-   TerminateProvisionedProduct \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_record_id : last_request_id option;
      [@ocaml.doc
        "The record identifier of the last request performed on this provisioned product.\n"]
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  created_time : created_time option; [@ocaml.doc "The UTC time stamp of the creation time.\n"]
  status_message : provisioned_product_status_message option;
      [@ocaml.doc "The current status message of the provisioned product.\n"]
  status : provisioned_product_status option;
      [@ocaml.doc
        "The current status of the provisioned product.\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - Stable state, ready to perform any operation. The most recent \
         operation succeeded and completed.\n\
        \           \n\
        \            }\n\
        \       {-   [UNDER_CHANGE] - Transitive state. Operations performed might not have valid \
         results. Wait for an [AVAILABLE] status before performing operations.\n\
        \           \n\
        \            }\n\
        \       {-   [TAINTED] - Stable state, ready to perform any operation. The stack has \
         completed the requested operation but is not exactly what was requested. For example, a \
         request to update to a new version failed and the stack rolled back to the current \
         version.\n\
        \           \n\
        \            }\n\
        \       {-   [ERROR] - An unexpected error occurred. The provisioned product exists but \
         the stack is not running. For example, CloudFormation received a parameter value that was \
         not valid and could not launch the stack.\n\
        \           \n\
        \            }\n\
        \       {-   [PLAN_IN_PROGRESS] - Transitive state. The plan operations were performed to \
         provision a new product, but resources have not yet been created. After reviewing the \
         list of resources to be created, execute the plan. Wait for an [AVAILABLE] status before \
         performing operations.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  id : provisioned_product_id option; [@ocaml.doc "The identifier of the provisioned product.\n"]
  type_ : provisioned_product_type option;
      [@ocaml.doc
        "The type of provisioned product. The supported values are [CFN_STACK], [CFN_STACKSET], \
         [TERRAFORM_OPEN_SOURCE], [TERRAFORM_CLOUD], and [EXTERNAL].\n"]
  arn : provisioned_product_name_or_arn option; [@ocaml.doc "The ARN of the provisioned product.\n"]
  name : provisioned_product_name_or_arn option;
      [@ocaml.doc "The user-friendly name of the provisioned product.\n"]
}
[@@ocaml.doc "Information about a provisioned product.\n"]

type nonrec provisioned_product_details = provisioned_product_detail list [@@ocaml.doc ""]

type nonrec scan_provisioned_products_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  provisioned_products : provisioned_product_details option;
      [@ocaml.doc "Information about the provisioned products.\n"]
}
[@@ocaml.doc ""]

type nonrec scan_provisioned_products_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  access_level_filter : access_level_filter option;
      [@ocaml.doc "The access level to use to obtain results. The default is [User].\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec resource_type = string [@@ocaml.doc ""]

type nonrec property_name = string [@@ocaml.doc ""]

type nonrec requires_recreation =
  | ALWAYS [@ocaml.doc ""]
  | CONDITIONALLY [@ocaml.doc ""]
  | NEVER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_target_definition = {
  requires_recreation : requires_recreation option;
      [@ocaml.doc
        "If the attribute is [Properties], indicates whether a change to this property causes the \
         resource to be re-created.\n"]
  name : property_name option;
      [@ocaml.doc
        "If the attribute is [Properties], the value is the name of the property. Otherwise, the \
         value is null.\n"]
  attribute : resource_attribute option; [@ocaml.doc "The attribute to be changed.\n"]
}
[@@ocaml.doc "Information about a change to a resource attribute.\n"]

type nonrec resource_in_use_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "A resource that is currently in use. Ensure that the resource is not in use and retry the \
   operation.\n"]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec resource_detail_id = string [@@ocaml.doc ""]

type nonrec resource_detail_ar_n = string [@@ocaml.doc ""]

type nonrec resource_detail_name = string [@@ocaml.doc ""]

type nonrec resource_detail_description = string [@@ocaml.doc ""]

type nonrec resource_detail_created_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec resource_detail = {
  created_time : resource_detail_created_time option;
      [@ocaml.doc "The creation time of the resource.\n"]
  description : resource_detail_description option;
      [@ocaml.doc "The description of the resource.\n"]
  name : resource_detail_name option; [@ocaml.doc "The name of the resource.\n"]
  ar_n : resource_detail_ar_n option; [@ocaml.doc "The ARN of the resource.\n"]
  id : resource_detail_id option; [@ocaml.doc "The identifier of the resource.\n"]
}
[@@ocaml.doc "Information about a resource.\n"]

type nonrec resource_details = resource_detail list [@@ocaml.doc ""]

type nonrec change_action = REMOVE [@ocaml.doc ""] | MODIFY [@ocaml.doc ""] | ADD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec logical_resource_id = string [@@ocaml.doc ""]

type nonrec physical_resource_id = string [@@ocaml.doc ""]

type nonrec plan_resource_type = string [@@ocaml.doc ""]

type nonrec replacement =
  | CONDITIONAL [@ocaml.doc ""]
  | FALSE [@ocaml.doc ""]
  | TRUE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec evaluation_type = DYNAMIC [@ocaml.doc ""] | STATIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec causing_entity = string [@@ocaml.doc ""]

type nonrec resource_change_detail = {
  causing_entity : causing_entity option;
      [@ocaml.doc "The ID of the entity that caused the change.\n"]
  evaluation : evaluation_type option;
      [@ocaml.doc
        "For static evaluations, the value of the resource attribute will change and the new value \
         is known. For dynamic evaluations, the value might change, and any new value will be \
         determined when the plan is updated.\n"]
  target : resource_target_definition option;
      [@ocaml.doc "Information about the resource attribute to be modified.\n"]
}
[@@ocaml.doc "Information about a change to a resource attribute.\n"]

type nonrec resource_change_details = resource_change_detail list [@@ocaml.doc ""]

type nonrec resource_change = {
  details : resource_change_details option; [@ocaml.doc "Information about the resource changes.\n"]
  scope : scope option; [@ocaml.doc "The change scope.\n"]
  replacement : replacement option;
      [@ocaml.doc
        "If the change type is [Modify], indicates whether the existing resource is deleted and \
         replaced with a new one.\n"]
  resource_type : plan_resource_type option; [@ocaml.doc "The type of resource.\n"]
  physical_resource_id : physical_resource_id option;
      [@ocaml.doc "The ID of the resource, if it was already created.\n"]
  logical_resource_id : logical_resource_id option;
      [@ocaml.doc "The ID of the resource, as defined in the CloudFormation template.\n"]
  action : change_action option; [@ocaml.doc "The change action.\n"]
}
[@@ocaml.doc "Information about a resource change that will occur when a plan is executed.\n"]

type nonrec resource_changes = resource_change list [@@ocaml.doc ""]

type nonrec reject_portfolio_share_output = unit [@@ocaml.doc ""]

type nonrec portfolio_share_type =
  | AWS_ORGANIZATIONS [@ocaml.doc ""]
  | AWS_SERVICECATALOG [@ocaml.doc ""]
  | IMPORTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reject_portfolio_share_input = {
  portfolio_share_type : portfolio_share_type option;
      [@ocaml.doc
        "The type of shared portfolios to reject. The default is to reject imported portfolios.\n\n\
        \ {ul\n\
        \       {-   [AWS_ORGANIZATIONS] - Reject portfolios shared by the management account of \
         your organization.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPORTED] - Reject imported portfolios.\n\
        \           \n\
        \            }\n\
        \       {-   [AWS_SERVICECATALOG] - Not supported. (Throws ResourceNotFoundException.)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For example, [aws servicecatalog reject-portfolio-share --portfolio-id \
         \"port-2qwzkwxt3y5fk\" --portfolio-share-type AWS_ORGANIZATIONS] \n\
        \   "]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec output_key = string [@@ocaml.doc ""]

type nonrec output_value = string [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec record_output = {
  description : description option; [@ocaml.doc "The description of the output.\n"]
  output_value : output_value option; [@ocaml.doc "The output value.\n"]
  output_key : output_key option; [@ocaml.doc "The output key.\n"]
}
[@@ocaml.doc
  "The output for the product created as the result of a request. For example, the output for a \
   CloudFormation-backed product that creates an S3 bucket would include the S3 bucket URL.\n"]

type nonrec record_outputs = record_output list [@@ocaml.doc ""]

type nonrec record_details = record_detail list [@@ocaml.doc ""]

type nonrec provisioning_preferences = {
  stack_set_max_concurrency_percentage : stack_set_max_concurrency_percentage option;
      [@ocaml.doc
        "The maximum percentage of accounts in which to perform this operation at one time.\n\n\
        \ When calculating the number of accounts based on the specified percentage, Service \
         Catalog rounds down to the next whole number. This is true except in cases where rounding \
         down would result is zero. In this case, Service Catalog sets the number as [1] instead.\n\
        \ \n\
        \  Note that this setting lets you specify the maximum for operations. For large \
         deployments, under certain circumstances the actual number of accounts acted upon \
         concurrently may be lower due to service throttling.\n\
        \  \n\
        \   Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \   \n\
        \    Conditional: You must specify either [StackSetMaxConcurrentCount] or \
         [StackSetMaxConcurrentPercentage], but not both.\n\
        \    "]
  stack_set_max_concurrency_count : stack_set_max_concurrency_count option;
      [@ocaml.doc
        "The maximum number of accounts in which to perform this operation at one time. This is \
         dependent on the value of [StackSetFailureToleranceCount]. [StackSetMaxConcurrentCount] \
         is at most one more than the [StackSetFailureToleranceCount].\n\n\
        \ Note that this setting lets you specify the maximum for operations. For large \
         deployments, under certain circumstances the actual number of accounts acted upon \
         concurrently may be lower due to service throttling.\n\
        \ \n\
        \  Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \  \n\
        \   Conditional: You must specify either [StackSetMaxConcurrentCount] or \
         [StackSetMaxConcurrentPercentage], but not both.\n\
        \   "]
  stack_set_failure_tolerance_percentage : stack_set_failure_tolerance_percentage option;
      [@ocaml.doc
        "The percentage of accounts, per Region, for which this stack operation can fail before \
         Service Catalog stops the operation in that Region. If the operation is stopped in a \
         Region, Service Catalog doesn't attempt the operation in any subsequent Regions.\n\n\
        \ When calculating the number of accounts based on the specified percentage, Service \
         Catalog rounds down to the next whole number.\n\
        \ \n\
        \  Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \  \n\
        \   Conditional: You must specify either [StackSetFailureToleranceCount] or \
         [StackSetFailureTolerancePercentage], but not both.\n\
        \   "]
  stack_set_failure_tolerance_count : stack_set_failure_tolerance_count option;
      [@ocaml.doc
        "The number of accounts, per Region, for which this operation can fail before Service \
         Catalog stops the operation in that Region. If the operation is stopped in a Region, \
         Service Catalog doesn't attempt the operation in any subsequent Regions.\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ \n\
        \  Conditional: You must specify either [StackSetFailureToleranceCount] or \
         [StackSetFailureTolerancePercentage], but not both.\n\
        \  \n\
        \   The default value is [0] if no value is specified.\n\
        \   "]
  stack_set_regions : stack_set_regions option;
      [@ocaml.doc
        "One or more Amazon Web Services Regions where the provisioned product will be available.\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ \n\
        \  The specified Regions should be within the list of Regions from the [STACKSET] \
         constraint. To get the list of Regions in the [STACKSET] constraint, use the \
         [DescribeProvisioningParameters] operation.\n\
        \  \n\
        \   If no values are specified, the default value is all Regions from the [STACKSET] \
         constraint.\n\
        \   "]
  stack_set_accounts : stack_set_accounts option;
      [@ocaml.doc
        "One or more Amazon Web Services accounts where the provisioned product will be available.\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ \n\
        \  The specified accounts should be within the list of accounts from the [STACKSET] \
         constraint. To get the list of accounts in the [STACKSET] constraint, use the \
         [DescribeProvisioningParameters] operation.\n\
        \  \n\
        \   If no values are specified, the default value is all acounts from the [STACKSET] \
         constraint.\n\
        \   "]
}
[@@ocaml.doc
  "The user-defined preferences that will be applied when updating a provisioned product. Not all \
   preferences are applicable to all provisioned product type\n\n\
  \ One or more Amazon Web Services accounts that will have access to the provisioned product.\n\
  \ \n\
  \  Applicable only to a [CFN_STACKSET] provisioned product type.\n\
  \  \n\
  \   The Amazon Web Services accounts specified should be within the list of accounts in the \
   [STACKSET] constraint. To get the list of accounts in the [STACKSET] constraint, use the \
   [DescribeProvisioningParameters] operation.\n\
  \   \n\
  \    If no values are specified, the default value is all accounts from the [STACKSET] constraint.\n\
  \    "]

type nonrec provisioning_parameter = {
  value : parameter_value option; [@ocaml.doc "The parameter value.\n"]
  key : parameter_key option; [@ocaml.doc "The parameter key.\n"]
}
[@@ocaml.doc "Information about a parameter used to provision a product.\n"]

type nonrec provisioning_parameters = provisioning_parameter list [@@ocaml.doc ""]

type nonrec provisioning_artifact_created_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec provisioning_artifact = {
  guidance : provisioning_artifact_guidance option;
      [@ocaml.doc
        "Information set by the administrator to provide guidance to end users about which \
         provisioning artifacts to use.\n"]
  created_time : provisioning_artifact_created_time option;
      [@ocaml.doc "The UTC time stamp of the creation time.\n"]
  description : provisioning_artifact_description option;
      [@ocaml.doc "The description of the provisioning artifact.\n"]
  name : provisioning_artifact_name option; [@ocaml.doc "The name of the provisioning artifact.\n"]
  id : id option; [@ocaml.doc "The identifier of the provisioning artifact.\n"]
}
[@@ocaml.doc
  "Information about a provisioning artifact. A provisioning artifact is also known as a product \
   version.\n"]

type nonrec provisioning_artifacts = provisioning_artifact list [@@ocaml.doc ""]

type nonrec provisioning_artifact_view = {
  provisioning_artifact : provisioning_artifact option;
      [@ocaml.doc
        "Information about a provisioning artifact. A provisioning artifact is also known as a \
         product version.\n"]
  product_view_summary : product_view_summary option;
      [@ocaml.doc "Summary information about a product view.\n"]
}
[@@ocaml.doc
  "An object that contains summary information about a product view and a provisioning artifact.\n"]

type nonrec provisioning_artifact_views = provisioning_artifact_view list [@@ocaml.doc ""]

type nonrec provisioning_artifact_summary = {
  provisioning_artifact_metadata : provisioning_artifact_info option;
      [@ocaml.doc
        "The metadata for the provisioning artifact. This is used with Amazon Web Services \
         Marketplace products.\n"]
  created_time : provisioning_artifact_created_time option;
      [@ocaml.doc "The UTC time stamp of the creation time.\n"]
  description : provisioning_artifact_description option;
      [@ocaml.doc "The description of the provisioning artifact.\n"]
  name : provisioning_artifact_name option; [@ocaml.doc "The name of the provisioning artifact.\n"]
  id : id option; [@ocaml.doc "The identifier of the provisioning artifact.\n"]
}
[@@ocaml.doc
  "Summary information about a provisioning artifact (also known as a version) for a product.\n"]

type nonrec provisioning_artifact_summaries = provisioning_artifact_summary list [@@ocaml.doc ""]

type nonrec disable_template_validation = bool [@@ocaml.doc ""]

type nonrec provisioning_artifact_properties = {
  disable_template_validation : disable_template_validation option;
      [@ocaml.doc
        "If set to true, Service Catalog stops validating the specified provisioning artifact even \
         if it is invalid. \n\n\
        \ Service Catalog does not support template validation for the [TERRAFORM_OS] product type. \n\
        \ "]
  type_ : provisioning_artifact_type option;
      [@ocaml.doc
        "The type of provisioning artifact.\n\n\
        \ {ul\n\
        \       {-   [CLOUD_FORMATION_TEMPLATE] - CloudFormation template\n\
        \           \n\
        \            }\n\
        \       {-   [TERRAFORM_OPEN_SOURCE] - Terraform Open Source configuration file\n\
        \           \n\
        \            }\n\
        \       {-   [TERRAFORM_CLOUD] - Terraform Cloud configuration file\n\
        \           \n\
        \            }\n\
        \       {-   [EXTERNAL] - External configuration file\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  info : provisioning_artifact_info option;
      [@ocaml.doc
        "Specify the template source with one of the following options, but not both. Keys \
         accepted: \\[ [LoadTemplateFromURL], [ImportFromPhysicalId] \\]\n\n\
        \ The URL of the CloudFormation template in Amazon S3 or GitHub in JSON format. Specify \
         the URL in JSON format as follows:\n\
        \ \n\
        \   [\"LoadTemplateFromURL\": \
         \"https://s3.amazonaws.com/cf-templates-ozkq9d3hgiq2-us-east-1/...\"] \n\
        \  \n\
        \    [ImportFromPhysicalId]: The physical id of the resource that contains the template. \
         Currently only supports CloudFormation stack arn. Specify the physical id in JSON format \
         as follows: [ImportFromPhysicalId: \
         \226\128\156arn:aws:cloudformation:\\[us-east-1\\]:\\[accountId\\]:stack/\\[StackName\\]/\\[resourceId\\]] \n\
        \   "]
  description : provisioning_artifact_description option;
      [@ocaml.doc
        "The description of the provisioning artifact, including how it differs from the previous \
         provisioning artifact.\n"]
  name : provisioning_artifact_name option;
      [@ocaml.doc
        "The name of the provisioning artifact (for example, v1 v2beta). No spaces are allowed.\n"]
}
[@@ocaml.doc "Information about a provisioning artifact (also known as a version) for a product.\n"]

type nonrec provisioning_artifact_preferences = {
  stack_set_regions : stack_set_regions option;
      [@ocaml.doc
        "One or more Amazon Web Services Regions where stack instances are deployed from the stack \
         set. These Regions can be scoped in [ProvisioningPreferences$StackSetRegions] and \
         [UpdateProvisioningPreferences$StackSetRegions].\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ "]
  stack_set_accounts : stack_set_accounts option;
      [@ocaml.doc
        "One or more Amazon Web Services accounts where stack instances are deployed from the \
         stack set. These accounts can be scoped in [ProvisioningPreferences$StackSetAccounts] and \
         [UpdateProvisioningPreferences$StackSetAccounts].\n\n\
        \ Applicable only to a [CFN_STACKSET] provisioned product type.\n\
        \ "]
}
[@@ocaml.doc
  "The user-defined preferences that will be applied during product provisioning, unless \
   overridden by [ProvisioningPreferences] or [UpdateProvisioningPreferences].\n\n\
  \ For more information on maximum concurrent accounts and failure tolerance, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options}Stack \
   set operation options} in the {i CloudFormation User Guide}.\n\
  \ "]

type nonrec default_value = string [@@ocaml.doc ""]

type nonrec parameter_type = string [@@ocaml.doc ""]

type nonrec no_echo = bool [@@ocaml.doc ""]

type nonrec allowed_values = string_ list [@@ocaml.doc ""]

type nonrec parameter_constraints = {
  min_value : string_ option;
      [@ocaml.doc
        "A numeric value that determines the smallest numeric value you want to allow for [Number] \
         types. \n"]
  max_value : string_ option;
      [@ocaml.doc
        "A numeric value that determines the largest numeric value you want to allow for [Number] \
         types.\n"]
  min_length : string_ option;
      [@ocaml.doc
        "An integer value that determines the smallest number of characters you want to allow for \
         [String] types.\n"]
  max_length : string_ option;
      [@ocaml.doc
        "An integer value that determines the largest number of characters you want to allow for \
         [String] types. \n"]
  constraint_description : string_ option;
      [@ocaml.doc
        "A string that explains a constraint when the constraint is violated. For example, without \
         a constraint description, a parameter that has an allowed pattern of [\\[A-Za-z0-9\\]+] \
         displays the following error message when the user specifies an invalid value:\n\n\
        \  [Malformed input-Parameter MyParameter must match pattern \\[A-Za-z0-9\\]+] \n\
        \ \n\
        \  By adding a constraint description, such as must only contain letters (uppercase and \
         lowercase) and numbers, you can display the following customized error message:\n\
        \  \n\
        \    [Malformed input-Parameter MyParameter must only contain uppercase and lowercase \
         letters and numbers.] \n\
        \   "]
  allowed_pattern : string_ option;
      [@ocaml.doc
        "A regular expression that represents the patterns that allow for [String] types. The \
         pattern must match the entire parameter value provided.\n"]
  allowed_values : allowed_values option;
      [@ocaml.doc "The values that the administrator has allowed for the parameter.\n"]
}
[@@ocaml.doc "The constraints that the administrator has put on the parameter.\n"]

type nonrec provisioning_artifact_parameter = {
  parameter_constraints : parameter_constraints option;
      [@ocaml.doc "Constraints that the administrator has put on a parameter.\n"]
  description : description option; [@ocaml.doc "The description of the parameter.\n"]
  is_no_echo : no_echo option;
      [@ocaml.doc
        "If this value is true, the value for this parameter is obfuscated from view when the \
         parameter is retrieved. This parameter is used to hide sensitive information.\n"]
  parameter_type : parameter_type option; [@ocaml.doc "The parameter type.\n"]
  default_value : default_value option; [@ocaml.doc "The default value.\n"]
  parameter_key : parameter_key option; [@ocaml.doc "The parameter key.\n"]
}
[@@ocaml.doc "Information about a parameter used to provision a product.\n"]

type nonrec provisioning_artifact_parameters = provisioning_artifact_parameter list [@@ocaml.doc ""]

type nonrec provisioning_artifact_output_key = string [@@ocaml.doc ""]

type nonrec output_description = string [@@ocaml.doc ""]

type nonrec provisioning_artifact_output = {
  description : output_description option;
      [@ocaml.doc "Description of the provisioning artifact output key.\n"]
  key : provisioning_artifact_output_key option;
      [@ocaml.doc "The provisioning artifact output key.\n"]
}
[@@ocaml.doc "Provisioning artifact output.\n"]

type nonrec provisioning_artifact_outputs = provisioning_artifact_output list [@@ocaml.doc ""]

type nonrec provisioning_artifact_details = provisioning_artifact_detail list [@@ocaml.doc ""]

type nonrec provisioned_product_plan_name = string [@@ocaml.doc ""]

type nonrec provisioned_product_plan_type = CLOUDFORMATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec provisioned_product_plan_summary = {
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  plan_type : provisioned_product_plan_type option; [@ocaml.doc "The plan type.\n"]
  provision_product_name : provisioned_product_name option;
      [@ocaml.doc "The user-friendly name of the provisioned product.\n"]
  provision_product_id : id option; [@ocaml.doc "The product identifier.\n"]
  plan_id : id option; [@ocaml.doc "The plan identifier.\n"]
  plan_name : provisioned_product_plan_name option; [@ocaml.doc "The name of the plan.\n"]
}
[@@ocaml.doc "Summary information about a plan.\n"]

type nonrec provisioned_product_plans = provisioned_product_plan_summary list [@@ocaml.doc ""]

type nonrec provisioned_product_plan_status =
  | EXECUTE_FAILED [@ocaml.doc ""]
  | EXECUTE_SUCCESS [@ocaml.doc ""]
  | EXECUTE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_SUCCESS [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notification_arn = string [@@ocaml.doc ""]

type nonrec notification_arns = notification_arn list [@@ocaml.doc ""]

type nonrec provisioned_product_plan_details = {
  status_message : status_message option; [@ocaml.doc "The status message.\n"]
  tags : tags option; [@ocaml.doc "One or more tags.\n"]
  provisioning_parameters : update_provisioning_parameters option;
      [@ocaml.doc
        "Parameters specified by the administrator that are required for provisioning the product.\n"]
  notification_arns : notification_arns option;
      [@ocaml.doc
        "Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.\n"]
  updated_time : updated_time option;
      [@ocaml.doc "The UTC time stamp when the plan was last updated.\n"]
  status : provisioned_product_plan_status option; [@ocaml.doc "The status.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  plan_type : provisioned_product_plan_type option; [@ocaml.doc "The plan type.\n"]
  provision_product_name : provisioned_product_name option;
      [@ocaml.doc "The user-friendly name of the provisioned product.\n"]
  provision_product_id : id option; [@ocaml.doc "The product identifier.\n"]
  plan_id : id option; [@ocaml.doc "The plan identifier.\n"]
  plan_name : provisioned_product_plan_name option; [@ocaml.doc "The name of the plan.\n"]
  product_id : id option; [@ocaml.doc "The product identifier.\n"]
  path_id : id option;
      [@ocaml.doc
        "The path identifier of the product. This value is optional if the product has a default \
         path, and required if the product has more than one path. To list the paths for a \
         product, use [ListLaunchPaths].\n"]
  created_time : created_time option; [@ocaml.doc "The UTC time stamp of the creation time.\n"]
}
[@@ocaml.doc "Information about a plan.\n"]

type nonrec provision_product_output = {
  record_detail : record_detail option;
      [@ocaml.doc "Information about the result of provisioning the product.\n"]
}
[@@ocaml.doc ""]

type nonrec provision_product_input = {
  provision_token : idempotency_token;
      [@ocaml.doc "An idempotency token that uniquely identifies the provisioning request.\n"]
  notification_arns : notification_arns option;
      [@ocaml.doc
        "Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.\n"]
  tags : tags option; [@ocaml.doc "One or more tags.\n"]
  provisioning_preferences : provisioning_preferences option;
      [@ocaml.doc
        "An object that contains information about the provisioning preferences for a stack set.\n"]
  provisioning_parameters : provisioning_parameters option;
      [@ocaml.doc
        "Parameters specified by the administrator that are required for provisioning the product.\n"]
  provisioned_product_name : provisioned_product_name;
      [@ocaml.doc
        "A user-friendly name for the provisioned product. This value must be unique for the \
         Amazon Web Services account and cannot be updated after the product is provisioned.\n"]
  path_name : portfolio_display_name option;
      [@ocaml.doc "The name of the path. You must provide the name or ID, but not both.\n"]
  path_id : id option;
      [@ocaml.doc
        "The path identifier of the product. This value is optional if the product has a default \
         path, and required if the product has more than one path. To list the paths for a \
         product, use [ListLaunchPaths]. You must provide the name or ID, but not both.\n"]
  provisioning_artifact_name : provisioning_artifact_name option;
      [@ocaml.doc
        "The name of the provisioning artifact. You must provide the name or ID, but not both.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc
        "The identifier of the provisioning artifact. You must provide the name or ID, but not both.\n"]
  product_name : product_view_name option;
      [@ocaml.doc "The name of the product. You must provide the name or ID, but not both.\n"]
  product_id : id option;
      [@ocaml.doc "The product identifier. You must provide the name or ID, but not both.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec product_arn = string [@@ocaml.doc ""]

type nonrec principal_ar_n = string [@@ocaml.doc ""]

type nonrec principal_type = IAM_PATTERN [@ocaml.doc ""] | IAM [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec principal = {
  principal_type : principal_type option;
      [@ocaml.doc
        "The principal type. The supported value is [IAM] if you use a fully defined ARN, or \
         [IAM_PATTERN] if you use an ARN with no [accountID], with or without wildcard characters. \n"]
  principal_ar_n : principal_ar_n option;
      [@ocaml.doc
        "The ARN of the principal (user, role, or group). This field allows for an ARN with no \
         [accountID], with or without wildcard characters if the [PrincipalType] is an \
         [IAM_PATTERN]. \n\n\
        \ For more information, review \
         {{:https://docs.aws.amazon.com/cli/latest/reference/servicecatalog/associate-principal-with-portfolio.html#options}associate-principal-with-portfolio} \
         in the Amazon Web Services CLI Command Reference. \n\
        \ "]
}
[@@ocaml.doc "Information about a principal.\n"]

type nonrec principals = principal list [@@ocaml.doc ""]

type nonrec describe_portfolio_share_type =
  | ORGANIZATION_MEMBER_ACCOUNT [@ocaml.doc ""]
  | ORGANIZATIONAL_UNIT [@ocaml.doc ""]
  | ORGANIZATION [@ocaml.doc ""]
  | ACCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec portfolio_share_detail = {
  share_principals : boolean_ option;
      [@ocaml.doc
        "Indicates if [Principal] sharing is enabled or disabled for the portfolio share. \n"]
  share_tag_options : boolean_ option;
      [@ocaml.doc
        "Indicates whether TagOptions sharing is enabled or disabled for the portfolio share.\n"]
  accepted : boolean_ option;
      [@ocaml.doc
        "Indicates whether the shared portfolio is imported by the recipient account. If the \
         recipient is in an organization node, the share is automatically imported, and the field \
         is always set to true.\n"]
  type_ : describe_portfolio_share_type option; [@ocaml.doc "The type of the portfolio share.\n"]
  principal_id : id option;
      [@ocaml.doc
        "The identifier of the recipient entity that received the portfolio share. The recipient \
         entity can be one of the following:\n\n\
        \ 1. An external account.\n\
        \ \n\
        \  2. An organziation member account.\n\
        \  \n\
        \   3. An organzational unit (OU).\n\
        \   \n\
        \    4. The organization itself. (This shares with every account in the organization).\n\
        \    "]
}
[@@ocaml.doc "Information about the portfolio share.\n"]

type nonrec portfolio_share_details = portfolio_share_detail list [@@ocaml.doc ""]

type nonrec portfolio_name = string [@@ocaml.doc ""]

type nonrec portfolio_details = portfolio_detail list [@@ocaml.doc ""]

type nonrec output_keys = output_key list [@@ocaml.doc ""]

type nonrec organization_nodes = organization_node list [@@ocaml.doc ""]

type nonrec notify_update_provisioned_product_engine_workflow_result_output = unit [@@ocaml.doc ""]

type nonrec engine_workflow_token = string [@@ocaml.doc ""]

type nonrec engine_workflow_status = FAILED [@ocaml.doc ""] | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec engine_workflow_failure_reason = string [@@ocaml.doc ""]

type nonrec notify_update_provisioned_product_engine_workflow_result_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc " The idempotency token that identifies the update engine execution. \n"]
  outputs : record_outputs option; [@ocaml.doc " The output of the update engine execution. \n"]
  failure_reason : engine_workflow_failure_reason option;
      [@ocaml.doc " The reason why the update engine execution failed. \n"]
  status : engine_workflow_status; [@ocaml.doc " The status of the update engine execution. \n"]
  record_id : id; [@ocaml.doc " The identifier of the record. \n"]
  workflow_token : engine_workflow_token;
      [@ocaml.doc
        " The encrypted contents of the update engine execution payload that Service Catalog sends \
         after the Terraform product update workflow starts. \n"]
}
[@@ocaml.doc ""]

type nonrec notify_terminate_provisioned_product_engine_workflow_result_output = unit
[@@ocaml.doc ""]

type nonrec notify_terminate_provisioned_product_engine_workflow_result_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc " The idempotency token that identifies the terminate engine execution. \n"]
  failure_reason : engine_workflow_failure_reason option;
      [@ocaml.doc " The reason why the terminate engine execution failed. \n"]
  status : engine_workflow_status; [@ocaml.doc " The status of the terminate engine execution. \n"]
  record_id : id; [@ocaml.doc " The identifier of the record. \n"]
  workflow_token : engine_workflow_token;
      [@ocaml.doc
        " The encrypted contents of the terminate engine execution payload that Service Catalog \
         sends after the Terraform product terminate workflow starts. \n"]
}
[@@ocaml.doc ""]

type nonrec notify_provision_product_engine_workflow_result_output = unit [@@ocaml.doc ""]

type nonrec engine_workflow_resource_identifier = {
  unique_tag : unique_tag_resource_identifier option;
      [@ocaml.doc
        " The unique key-value pair for a tag that identifies provisioned product resources. \n"]
}
[@@ocaml.doc " The ID for the provisioned product resources that are part of a resource group. \n"]

type nonrec notify_provision_product_engine_workflow_result_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc " The idempotency token that identifies the provisioning engine execution. \n"]
  outputs : record_outputs option;
      [@ocaml.doc " The output of the provisioning engine execution. \n"]
  resource_identifier : engine_workflow_resource_identifier option;
      [@ocaml.doc
        " The ID for the provisioned product resources that are part of a resource group. \n"]
  failure_reason : engine_workflow_failure_reason option;
      [@ocaml.doc " The reason why the provisioning engine execution failed. \n"]
  status : engine_workflow_status;
      [@ocaml.doc " The status of the provisioning engine execution. \n"]
  record_id : id; [@ocaml.doc " The identifier of the record. \n"]
  workflow_token : engine_workflow_token;
      [@ocaml.doc
        " The encrypted contents of the provisioning engine execution payload that Service Catalog \
         sends after the Terraform product provisioning workflow starts. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tag_options_output = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  tag_option_details : tag_option_details option; [@ocaml.doc "Information about the TagOptions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tag_options_filters = {
  active : tag_option_active option; [@ocaml.doc "The active state.\n"]
  value : tag_option_value option; [@ocaml.doc "The TagOption value.\n"]
  key : tag_option_key option; [@ocaml.doc "The TagOption key.\n"]
}
[@@ocaml.doc "Filters to use when listing TagOptions.\n"]

type nonrec list_tag_options_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  filters : list_tag_options_filters option;
      [@ocaml.doc
        "The search filters. If no search filters are specified, the output includes all TagOptions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_instances_for_provisioned_product_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  stack_instances : stack_instances option; [@ocaml.doc "List of stack instances.\n"]
}
[@@ocaml.doc ""]

type nonrec list_stack_instances_for_provisioned_product_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  provisioned_product_id : id; [@ocaml.doc "The identifier of the provisioned product.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_service_actions_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  service_action_summaries : service_action_summaries option;
      [@ocaml.doc
        "An object containing information about the service actions associated with the \
         provisioning artifact.\n"]
}
[@@ocaml.doc ""]

type nonrec list_service_actions_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_service_actions_for_provisioning_artifact_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  service_action_summaries : service_action_summaries option;
      [@ocaml.doc
        "An object containing information about the self-service actions associated with the \
         provisioning artifact.\n"]
}
[@@ocaml.doc ""]

type nonrec list_service_actions_for_provisioning_artifact_input = {
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  provisioning_artifact_id : id;
      [@ocaml.doc "The identifier of the provisioning artifact. For example, [pa-4abcdjnxjj6ne].\n"]
  product_id : id; [@ocaml.doc "The product identifier. For example, [prod-abcdzk7xy33qa].\n"]
}
[@@ocaml.doc ""]

type nonrec list_resources_for_tag_option_output = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  resource_details : resource_details option; [@ocaml.doc "Information about the resources.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resources_for_tag_option_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "The resource type.\n\n\
        \ {ul\n\
        \       {-   [Portfolio] \n\
        \           \n\
        \            }\n\
        \       {-   [Product] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tag_option_id : tag_option_id; [@ocaml.doc "The TagOption identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec list_record_history_search_filter = {
  value : search_filter_value option; [@ocaml.doc "The filter value.\n"]
  key : search_filter_key option;
      [@ocaml.doc
        "The filter key.\n\n\
        \ {ul\n\
        \       {-   [product] - Filter results based on the specified product identifier.\n\
        \           \n\
        \            }\n\
        \       {-   [provisionedproduct] - Filter results based on the provisioned product \
         identifier.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The search filter to use when listing history records.\n"]

type nonrec list_record_history_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  record_details : record_details option;
      [@ocaml.doc "The records, in reverse chronological order.\n"]
}
[@@ocaml.doc ""]

type nonrec list_record_history_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  search_filter : list_record_history_search_filter option;
      [@ocaml.doc "The search filter to scope the results.\n"]
  access_level_filter : access_level_filter option;
      [@ocaml.doc "The access level to use to obtain results. The default is [User].\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_provisioning_artifacts_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  provisioning_artifact_details : provisioning_artifact_details option;
      [@ocaml.doc "Information about the provisioning artifacts.\n"]
}
[@@ocaml.doc ""]

type nonrec list_provisioning_artifacts_input = {
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_provisioning_artifacts_for_service_action_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  provisioning_artifact_views : provisioning_artifact_views option;
      [@ocaml.doc
        "An array of objects with information about product views and provisioning artifacts.\n"]
}
[@@ocaml.doc ""]

type nonrec list_provisioning_artifacts_for_service_action_input = {
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  service_action_id : id;
      [@ocaml.doc "The self-service action identifier. For example, [act-fs7abcd89wxyz].\n"]
}
[@@ocaml.doc ""]

type nonrec list_provisioned_product_plans_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  provisioned_product_plans : provisioned_product_plans option;
      [@ocaml.doc "Information about the plans.\n"]
}
[@@ocaml.doc ""]

type nonrec list_provisioned_product_plans_input = {
  access_level_filter : access_level_filter option;
      [@ocaml.doc "The access level to use to obtain results. The default is [User].\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  provision_product_id : id option; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_principals_for_portfolio_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  principals : principals option;
      [@ocaml.doc
        "The [PrincipalARN]s and corresponding [PrincipalType]s associated with the portfolio.\n"]
}
[@@ocaml.doc ""]

type nonrec list_principals_for_portfolio_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_portfolios_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  portfolio_details : portfolio_details option; [@ocaml.doc "Information about the portfolios.\n"]
}
[@@ocaml.doc ""]

type nonrec list_portfolios_input = {
  page_size : page_size_max100 option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_portfolios_for_product_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  portfolio_details : portfolio_details option; [@ocaml.doc "Information about the portfolios.\n"]
}
[@@ocaml.doc ""]

type nonrec list_portfolios_for_product_input = {
  page_size : page_size_max100 option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec account_ids = account_id list [@@ocaml.doc ""]

type nonrec list_portfolio_access_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "Information about the Amazon Web Services accounts with access to the portfolio.\n"]
}
[@@ocaml.doc ""]

type nonrec list_portfolio_access_input = {
  page_size : page_size_max100 option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  organization_parent_id : id option;
      [@ocaml.doc
        "The ID of an organization node the portfolio is shared with. All children of this node \
         with an inherited portfolio share will be returned.\n"]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_organization_portfolio_access_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  organization_nodes : organization_nodes option;
      [@ocaml.doc "Displays information about the organization nodes.\n"]
}
[@@ocaml.doc ""]

type nonrec list_organization_portfolio_access_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  organization_node_type : organization_node_type;
      [@ocaml.doc
        "The organization node type that will be returned in the output.\n\n\
        \ {ul\n\
        \       {-   [ORGANIZATION] - Organization that has access to the portfolio. \n\
        \           \n\
        \            }\n\
        \       {-   [ORGANIZATIONAL_UNIT] - Organizational unit that has access to the portfolio \
         within your organization.\n\
        \           \n\
        \            }\n\
        \       {-   [ACCOUNT] - Account that has access to the portfolio within your organization.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier. For example, [port-2abcdext3y5fk].\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec constraint_summary = {
  description : constraint_description option; [@ocaml.doc "The description of the constraint.\n"]
  type_ : constraint_type option;
      [@ocaml.doc
        "The type of constraint.\n\n\
        \ {ul\n\
        \       {-   [LAUNCH] \n\
        \           \n\
        \            }\n\
        \       {-   [NOTIFICATION] \n\
        \           \n\
        \            }\n\
        \       {-  STACKSET\n\
        \           \n\
        \            }\n\
        \       {-   [TEMPLATE] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Summary information about a constraint.\n"]

type nonrec constraint_summaries = constraint_summary list [@@ocaml.doc ""]

type nonrec launch_path_summary = {
  name : portfolio_name option;
      [@ocaml.doc "The name of the portfolio that contains the product. \n"]
  tags : tags option; [@ocaml.doc "The tags associated with this product path.\n"]
  constraint_summaries : constraint_summaries option;
      [@ocaml.doc "The constraints on the portfolio-product relationship.\n"]
  id : id option; [@ocaml.doc "The identifier of the product path.\n"]
}
[@@ocaml.doc "Summary information about a product path for a user.\n"]

type nonrec launch_path_summaries = launch_path_summary list [@@ocaml.doc ""]

type nonrec list_launch_paths_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  launch_path_summaries : launch_path_summaries option;
      [@ocaml.doc "Information about the launch path.\n"]
}
[@@ocaml.doc ""]

type nonrec list_launch_paths_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec constraint_details = constraint_detail list [@@ocaml.doc ""]

type nonrec list_constraints_for_portfolio_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  constraint_details : constraint_details option; [@ocaml.doc "Information about the constraints.\n"]
}
[@@ocaml.doc ""]

type nonrec list_constraints_for_portfolio_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  product_id : id option; [@ocaml.doc "The product identifier.\n"]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec budget_name = string [@@ocaml.doc ""]

type nonrec budget_detail = {
  budget_name : budget_name option; [@ocaml.doc "Name of the associated budget.\n"]
}
[@@ocaml.doc "Information about a budget.\n"]

type nonrec budgets = budget_detail list [@@ocaml.doc ""]

type nonrec list_budgets_for_resource_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  budgets : budgets option; [@ocaml.doc "Information about the associated budgets.\n"]
}
[@@ocaml.doc ""]

type nonrec list_budgets_for_resource_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  resource_id : id; [@ocaml.doc "The resource identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_accepted_portfolio_shares_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  portfolio_details : portfolio_details option; [@ocaml.doc "Information about the portfolios.\n"]
}
[@@ocaml.doc ""]

type nonrec list_accepted_portfolio_shares_input = {
  portfolio_share_type : portfolio_share_type option;
      [@ocaml.doc
        "The type of shared portfolios to list. The default is to list imported portfolios.\n\n\
        \ {ul\n\
        \       {-   [AWS_ORGANIZATIONS] - List portfolios accepted and shared via organizational \
         sharing by the management account or delegated administrator of your organization.\n\
        \           \n\
        \            }\n\
        \       {-   [AWS_SERVICECATALOG] - Deprecated type.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPORTED] - List imported portfolios that have been accepted and shared \
         through account-to-account sharing.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  page_size : page_size_max100 option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec launch_path = {
  name : portfolio_name option; [@ocaml.doc "The name of the launch path.\n"]
  id : id option; [@ocaml.doc "The identifier of the launch path.\n"]
}
[@@ocaml.doc "A launch path object.\n"]

type nonrec launch_paths = launch_path list [@@ocaml.doc ""]

type nonrec import_as_provisioned_product_output = {
  record_detail : record_detail option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec import_as_provisioned_product_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  physical_id : physical_id;
      [@ocaml.doc
        "The unique identifier of the resource to be imported. It only currently supports \
         CloudFormation stack IDs.\n"]
  provisioned_product_name : provisioned_product_name;
      [@ocaml.doc
        "The user-friendly name of the provisioned product. The value must be unique for the \
         Amazon Web Services account. The name cannot be updated after the product is provisioned. \n"]
  provisioning_artifact_id : id; [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_provisioned_product_outputs_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  outputs : record_outputs option;
      [@ocaml.doc
        "Information about the product created as the result of a request. For example, the output \
         for a CloudFormation-backed product that creates an S3 bucket would include the S3 bucket \
         URL. \n"]
}
[@@ocaml.doc ""]

type nonrec get_provisioned_product_outputs_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  output_keys : output_keys option;
      [@ocaml.doc
        "The list of keys that the API should return with their values. If none are provided, the \
         API will return all outputs of the provisioned product.\n"]
  provisioned_product_name : provisioned_product_name option;
      [@ocaml.doc "The name of the provisioned product that you want the outputs from.\n"]
  provisioned_product_id : id option;
      [@ocaml.doc "The identifier of the provisioned product that you want the outputs from.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec access_status =
  | DISABLED [@ocaml.doc ""]
  | UNDER_CHANGE [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_aws_organizations_access_status_output = {
  access_status : access_status option; [@ocaml.doc "The status of the portfolio share feature.\n"]
}
[@@ocaml.doc ""]

type nonrec get_aws_organizations_access_status_input = unit [@@ocaml.doc ""]

type nonrec failed_service_action_association = {
  error_message : service_action_association_error_message option;
      [@ocaml.doc "A text description of the error.\n"]
  error_code : service_action_association_error_code option;
      [@ocaml.doc "The error code. Valid values are listed below.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact. For example, [pa-4abcdjnxjj6ne].\n"]
  product_id : id option;
      [@ocaml.doc "The product identifier. For example, [prod-abcdzk7xy33qa].\n"]
  service_action_id : id option;
      [@ocaml.doc "The self-service action identifier. For example, [act-fs7abcd89wxyz].\n"]
}
[@@ocaml.doc
  "An object containing information about the error, along with identifying information about the \
   self-service action and its associations.\n"]

type nonrec failed_service_action_associations = failed_service_action_association list
[@@ocaml.doc ""]

type nonrec execution_parameter_key = string [@@ocaml.doc ""]

type nonrec execution_parameter_type = string [@@ocaml.doc ""]

type nonrec execution_parameter_value = string [@@ocaml.doc ""]

type nonrec execution_parameter_value_list = execution_parameter_value list [@@ocaml.doc ""]

type nonrec execution_parameter = {
  default_values : execution_parameter_value_list option;
      [@ocaml.doc "The default values for the execution parameter.\n"]
  type_ : execution_parameter_type option; [@ocaml.doc "The execution parameter type.\n"]
  name : execution_parameter_key option; [@ocaml.doc "The name of the execution parameter.\n"]
}
[@@ocaml.doc
  "Details of an execution parameter value that is passed to a self-service action when executed \
   on a provisioned product.\n"]

type nonrec execution_parameters = execution_parameter list [@@ocaml.doc ""]

type nonrec execution_parameter_map =
  (execution_parameter_key * execution_parameter_value_list) list
[@@ocaml.doc ""]

type nonrec execute_provisioned_product_service_action_output = {
  record_detail : record_detail option;
      [@ocaml.doc
        "An object containing detailed information about the result of provisioning the product.\n"]
}
[@@ocaml.doc ""]

type nonrec execute_provisioned_product_service_action_input = {
  parameters : execution_parameter_map option;
      [@ocaml.doc
        "A map of all self-service action parameters and their values. If a provided parameter is \
         of a special type, such as [TARGET], the provided value will override the default value \
         generated by Service Catalog. If the parameters field is not provided, no additional \
         parameters are passed and default values will be used for any special parameters such as \
         [TARGET].\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  execute_token : idempotency_token;
      [@ocaml.doc "An idempotency token that uniquely identifies the execute request.\n"]
  service_action_id : id;
      [@ocaml.doc "The self-service action identifier. For example, [act-fs7abcd89wxyz].\n"]
  provisioned_product_id : id; [@ocaml.doc "The identifier of the provisioned product.\n"]
}
[@@ocaml.doc ""]

type nonrec execute_provisioned_product_plan_output = {
  record_detail : record_detail option;
      [@ocaml.doc "Information about the result of provisioning the product.\n"]
}
[@@ocaml.doc ""]

type nonrec execute_provisioned_product_plan_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  plan_id : id; [@ocaml.doc "The plan identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec enable_aws_organizations_access_output = unit [@@ocaml.doc ""]

type nonrec enable_aws_organizations_access_input = unit [@@ocaml.doc ""]

type nonrec disassociate_tag_option_from_resource_output = unit [@@ocaml.doc ""]

type nonrec disassociate_tag_option_from_resource_input = {
  tag_option_id : tag_option_id; [@ocaml.doc "The TagOption identifier.\n"]
  resource_id : resource_id; [@ocaml.doc "The resource identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_service_action_from_provisioning_artifact_output = unit [@@ocaml.doc ""]

type nonrec disassociate_service_action_from_provisioning_artifact_input = {
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests from the \
         same Amazon Web Services account use the same idempotency token, the same response is \
         returned for each repeated request. \n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_action_id : id;
      [@ocaml.doc "The self-service action identifier. For example, [act-fs7abcd89wxyz].\n"]
  provisioning_artifact_id : id;
      [@ocaml.doc "The identifier of the provisioning artifact. For example, [pa-4abcdjnxjj6ne].\n"]
  product_id : id; [@ocaml.doc "The product identifier. For example, [prod-abcdzk7xy33qa].\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_product_from_portfolio_output = unit [@@ocaml.doc ""]

type nonrec disassociate_product_from_portfolio_input = {
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec disassociate_principal_from_portfolio_output = unit [@@ocaml.doc ""]

type nonrec disassociate_principal_from_portfolio_input = {
  principal_type : principal_type option;
      [@ocaml.doc
        "The supported value is [IAM] if you use a fully defined ARN, or [IAM_PATTERN] if you \
         specify an [IAM] ARN with no AccountId, with or without wildcard characters. \n"]
  principal_ar_n : principal_ar_n;
      [@ocaml.doc
        "The ARN of the principal (user, role, or group). This field allows an ARN with no \
         [accountID] with or without wildcard characters if [PrincipalType] is [IAM_PATTERN].\n"]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec disassociate_budget_from_resource_output = unit [@@ocaml.doc ""]

type nonrec disassociate_budget_from_resource_input = {
  resource_id : id;
      [@ocaml.doc
        "The resource identifier you want to disassociate from. Either a portfolio-id or a \
         product-id.\n"]
  budget_name : budget_name; [@ocaml.doc "The name of the budget you want to disassociate.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_aws_organizations_access_output = unit [@@ocaml.doc ""]

type nonrec disable_aws_organizations_access_input = unit [@@ocaml.doc ""]

type nonrec describe_tag_option_output = {
  tag_option_detail : tag_option_detail option; [@ocaml.doc "Information about the TagOption.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tag_option_input = {
  id : tag_option_id; [@ocaml.doc "The TagOption identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_action_output = {
  service_action_detail : service_action_detail option;
      [@ocaml.doc "Detailed information about the self-service action.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_action_input = {
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  id : id; [@ocaml.doc "The self-service action identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_action_execution_parameters_output = {
  service_action_parameters : execution_parameters option;
      [@ocaml.doc "The parameters of the self-service action.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_action_execution_parameters_input = {
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_action_id : id; [@ocaml.doc "The self-service action identifier.\n"]
  provisioned_product_id : id; [@ocaml.doc "The identifier of the provisioned product.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_record_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  record_outputs : record_outputs option;
      [@ocaml.doc
        "Information about the product created as the result of a request. For example, the output \
         for a CloudFormation-backed product that creates an S3 bucket would include the S3 bucket \
         URL.\n"]
  record_detail : record_detail option; [@ocaml.doc "Information about the product.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_record_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  id : id;
      [@ocaml.doc
        "The record identifier of the provisioned product. This identifier is returned by the \
         request operation.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_provisioning_parameters_output = {
  provisioning_artifact_output_keys : provisioning_artifact_outputs option;
      [@ocaml.doc
        "A list of the keys and descriptions of the outputs. These outputs can be referenced from \
         a provisioned product launched from this provisioning artifact.\n"]
  provisioning_artifact_outputs : provisioning_artifact_outputs option;
      [@ocaml.doc "The output of the provisioning artifact.\n"]
  provisioning_artifact_preferences : provisioning_artifact_preferences option;
      [@ocaml.doc
        "An object that contains information about preferences, such as Regions and accounts, for \
         the provisioning artifact.\n"]
  tag_options : tag_option_summaries option;
      [@ocaml.doc "Information about the TagOptions associated with the resource.\n"]
  usage_instructions : usage_instructions option;
      [@ocaml.doc
        "Any additional metadata specifically related to the provisioning of the product. For \
         example, see the [Version] field of the CloudFormation template.\n"]
  constraint_summaries : constraint_summaries option;
      [@ocaml.doc "Information about the constraints used to provision the product.\n"]
  provisioning_artifact_parameters : provisioning_artifact_parameters option;
      [@ocaml.doc "Information about the parameters used to provision the product.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_provisioning_parameters_input = {
  path_name : portfolio_display_name option;
      [@ocaml.doc "The name of the path. You must provide the name or ID, but not both.\n"]
  path_id : id option;
      [@ocaml.doc
        "The path identifier of the product. This value is optional if the product has a default \
         path, and required if the product has more than one path. To list the paths for a \
         product, use [ListLaunchPaths]. You must provide the name or ID, but not both.\n"]
  provisioning_artifact_name : provisioning_artifact_name option;
      [@ocaml.doc
        "The name of the provisioning artifact. You must provide the name or ID, but not both.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc
        "The identifier of the provisioning artifact. You must provide the name or ID, but not both.\n"]
  product_name : product_view_name option;
      [@ocaml.doc "The name of the product. You must provide the name or ID, but not both.\n"]
  product_id : id option;
      [@ocaml.doc
        "The product identifier. You must provide the product name or ID, but not both.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_provisioning_artifact_output = {
  provisioning_artifact_parameters : provisioning_artifact_parameters option;
      [@ocaml.doc "Information about the parameters used to provision the product. \n"]
  status : status option; [@ocaml.doc "The status of the current request.\n"]
  info : provisioning_artifact_info option;
      [@ocaml.doc "The URL of the CloudFormation template in Amazon S3 or GitHub in JSON format.\n"]
  provisioning_artifact_detail : provisioning_artifact_detail option;
      [@ocaml.doc "Information about the provisioning artifact.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_provisioning_artifact_input = {
  include_provisioning_artifact_parameters : boolean_ option;
      [@ocaml.doc
        "Indicates if the API call response does or does not include additional details about the \
         provisioning parameters. \n"]
  verbose : verbose option; [@ocaml.doc "Indicates whether a verbose level of detail is enabled.\n"]
  product_name : product_view_name option; [@ocaml.doc "The product name.\n"]
  provisioning_artifact_name : provisioning_artifact_name option;
      [@ocaml.doc "The provisioning artifact name.\n"]
  product_id : id option; [@ocaml.doc "The product identifier.\n"]
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_provisioned_product_plan_output = {
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
  resource_changes : resource_changes option;
      [@ocaml.doc
        "Information about the resource changes that will occur when the plan is executed.\n"]
  provisioned_product_plan_details : provisioned_product_plan_details option;
      [@ocaml.doc "Information about the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_provisioned_product_plan_input = {
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  plan_id : id; [@ocaml.doc "The plan identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec cloud_watch_dashboard_name = string [@@ocaml.doc ""]

type nonrec cloud_watch_dashboard = {
  name : cloud_watch_dashboard_name option; [@ocaml.doc "The name of the CloudWatch dashboard.\n"]
}
[@@ocaml.doc "Information about a CloudWatch dashboard.\n"]

type nonrec cloud_watch_dashboards = cloud_watch_dashboard list [@@ocaml.doc ""]

type nonrec describe_provisioned_product_output = {
  cloud_watch_dashboards : cloud_watch_dashboards option;
      [@ocaml.doc "Any CloudWatch dashboards that were created when provisioning the product.\n"]
  provisioned_product_detail : provisioned_product_detail option;
      [@ocaml.doc "Information about the provisioned product.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_provisioned_product_input = {
  name : provisioned_product_name option;
      [@ocaml.doc
        "The name of the provisioned product. You must provide the name or ID, but not both.\n\n\
        \ If you do not provide a name or ID, or you provide both name and ID, an \
         [InvalidParametersException] will occur.\n\
        \ "]
  id : id option;
      [@ocaml.doc
        "The provisioned product identifier. You must provide the name or ID, but not both.\n\n\
        \ If you do not provide a name or ID, or you provide both name and ID, an \
         [InvalidParametersException] will occur.\n\
        \ "]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "DescribeProvisionedProductAPI input structure. AcceptLanguage - \\[Optional\\] The language \
   code for localization. Id - \\[Optional\\] The provisioned product identifier. Name - \
   \\[Optional\\] Another provisioned product identifier. Customers must provide either Id or \
   Name."]

type nonrec describe_product_view_output = {
  provisioning_artifacts : provisioning_artifacts option;
      [@ocaml.doc "Information about the provisioning artifacts for the product.\n"]
  product_view_summary : product_view_summary option;
      [@ocaml.doc "Summary information about the product.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_product_view_input = {
  id : id; [@ocaml.doc "The product view identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_product_output = {
  launch_paths : launch_paths option;
      [@ocaml.doc "Information about the associated launch paths.\n"]
  budgets : budgets option; [@ocaml.doc "Information about the associated budgets.\n"]
  provisioning_artifacts : provisioning_artifacts option;
      [@ocaml.doc "Information about the provisioning artifacts for the specified product.\n"]
  product_view_summary : product_view_summary option;
      [@ocaml.doc "Summary information about the product view.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_product_input = {
  name : product_view_name option; [@ocaml.doc "The product name.\n"]
  id : id option; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_product_as_admin_output = {
  budgets : budgets option; [@ocaml.doc "Information about the associated budgets.\n"]
  tag_options : tag_option_details option;
      [@ocaml.doc "Information about the TagOptions associated with the product.\n"]
  tags : tags option; [@ocaml.doc "Information about the tags associated with the product.\n"]
  provisioning_artifact_summaries : provisioning_artifact_summaries option;
      [@ocaml.doc
        "Information about the provisioning artifacts (also known as versions) for the specified \
         product.\n"]
  product_view_detail : product_view_detail option;
      [@ocaml.doc "Information about the product view.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_product_as_admin_input = {
  source_portfolio_id : id option;
      [@ocaml.doc
        "The unique identifier of the shared portfolio that the specified product is associated \
         with.\n\n\
        \ You can provide this parameter to retrieve the shared TagOptions associated with the \
         product. If this parameter is provided and if TagOptions sharing is enabled in the \
         portfolio share, the API returns both local and shared TagOptions associated with the \
         product. Otherwise only local TagOptions will be returned. \n\
        \ "]
  name : product_view_name option; [@ocaml.doc "The product name.\n"]
  id : id option; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_portfolio_shares_output = {
  portfolio_share_details : portfolio_share_details option;
      [@ocaml.doc "Summaries about each of the portfolio shares.\n"]
  next_page_token : page_token option;
      [@ocaml.doc
        "The page token to use to retrieve the next set of results. If there are no additional \
         results, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_portfolio_shares_input = {
  page_size : page_size_max100 option;
      [@ocaml.doc "The maximum number of items to return with this call.\n"]
  page_token : page_token option;
      [@ocaml.doc
        "The page token for the next set of results. To retrieve the first set of results, use null.\n"]
  type_ : describe_portfolio_share_type;
      [@ocaml.doc
        "The type of portfolio share to summarize. This field acts as a filter on the type of \
         portfolio share, which can be one of the following:\n\n\
        \ 1. [ACCOUNT] - Represents an external account to account share.\n\
        \ \n\
        \  2. [ORGANIZATION] - Represents a share to an organization. This share is available to \
         every account in the organization.\n\
        \  \n\
        \   3. [ORGANIZATIONAL_UNIT] - Represents a share to an organizational unit.\n\
        \   \n\
        \    4. [ORGANIZATION_MEMBER_ACCOUNT] - Represents a share to an account in the \
         organization.\n\
        \    "]
  portfolio_id : id;
      [@ocaml.doc "The unique identifier of the portfolio for which shares will be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_portfolio_share_status_output = {
  share_details : share_details option;
      [@ocaml.doc "Information about the portfolio share operation.\n"]
  status : share_status option; [@ocaml.doc "Status of the portfolio share operation.\n"]
  organization_node_value : organization_node_value option;
      [@ocaml.doc
        "Organization node identifier. It can be either account id, organizational unit id or \
         organization id.\n"]
  portfolio_id : id option; [@ocaml.doc "The portfolio identifier.\n"]
  portfolio_share_token : id option;
      [@ocaml.doc
        "The token for the portfolio share operation. For example, [share-6v24abcdefghi].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_portfolio_share_status_input = {
  portfolio_share_token : id;
      [@ocaml.doc
        "The token for the portfolio share operation. This token is returned either by \
         CreatePortfolioShare or by DeletePortfolioShare.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_portfolio_output = {
  budgets : budgets option; [@ocaml.doc "Information about the associated budgets.\n"]
  tag_options : tag_option_details option;
      [@ocaml.doc "Information about the TagOptions associated with the portfolio.\n"]
  tags : tags option; [@ocaml.doc "Information about the tags associated with the portfolio.\n"]
  portfolio_detail : portfolio_detail option; [@ocaml.doc "Information about the portfolio.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_portfolio_input = {
  id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec copy_product_status =
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_copy_product_status_output = {
  status_detail : status_detail option; [@ocaml.doc "The status message.\n"]
  target_product_id : id option; [@ocaml.doc "The identifier of the copied product.\n"]
  copy_product_status : copy_product_status option;
      [@ocaml.doc "The status of the copy product operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_copy_product_status_input = {
  copy_product_token : id;
      [@ocaml.doc
        "The token for the copy product operation. This token is returned by [CopyProduct].\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_constraint_output = {
  status : status option; [@ocaml.doc "The status of the current request.\n"]
  constraint_parameters : constraint_parameters option; [@ocaml.doc "The constraint parameters.\n"]
  constraint_detail : constraint_detail option; [@ocaml.doc "Information about the constraint.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_constraint_input = {
  id : id; [@ocaml.doc "The identifier of the constraint.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_tag_option_output = unit [@@ocaml.doc ""]

type nonrec delete_tag_option_input = {
  id : tag_option_id; [@ocaml.doc "The TagOption identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_service_action_output = unit [@@ocaml.doc ""]

type nonrec delete_service_action_input = {
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests from the \
         same Amazon Web Services account use the same idempotency token, the same response is \
         returned for each repeated request. \n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  id : id; [@ocaml.doc "The self-service action identifier. For example, [act-fs7abcd89wxyz].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_provisioning_artifact_output = unit [@@ocaml.doc ""]

type nonrec delete_provisioning_artifact_input = {
  provisioning_artifact_id : id; [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_provisioned_product_plan_output = unit [@@ocaml.doc ""]

type nonrec delete_provisioned_product_plan_input = {
  ignore_errors : ignore_errors option;
      [@ocaml.doc
        "If set to true, Service Catalog stops managing the specified provisioned product even if \
         it cannot delete the underlying resources.\n"]
  plan_id : id; [@ocaml.doc "The plan identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_product_output = unit [@@ocaml.doc ""]

type nonrec delete_product_input = {
  id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_portfolio_share_output = {
  portfolio_share_token : id option;
      [@ocaml.doc
        "The portfolio share unique identifier. This will only be returned if delete is made to an \
         organization node.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_portfolio_share_input = {
  organization_node : organization_node option;
      [@ocaml.doc "The organization node to whom you are going to stop sharing.\n"]
  account_id : account_id option; [@ocaml.doc "The Amazon Web Services account ID.\n"]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_portfolio_output = unit [@@ocaml.doc ""]

type nonrec delete_portfolio_input = {
  id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_constraint_output = unit [@@ocaml.doc ""]

type nonrec delete_constraint_input = {
  id : id; [@ocaml.doc "The identifier of the constraint.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_tag_option_output = {
  tag_option_detail : tag_option_detail option; [@ocaml.doc "Information about the TagOption.\n"]
}
[@@ocaml.doc ""]

type nonrec create_tag_option_input = {
  value : tag_option_value; [@ocaml.doc "The TagOption value.\n"]
  key : tag_option_key; [@ocaml.doc "The TagOption key.\n"]
}
[@@ocaml.doc ""]

type nonrec create_service_action_output = {
  service_action_detail : service_action_detail option;
      [@ocaml.doc "An object containing information about the self-service action.\n"]
}
[@@ocaml.doc ""]

type nonrec create_service_action_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  description : service_action_description option;
      [@ocaml.doc "The self-service action description.\n"]
  definition : service_action_definition_map;
      [@ocaml.doc
        "The self-service action definition. Can be one of the following:\n\n\
        \  Name  The name of the Amazon Web Services Systems Manager document (SSM document). For \
         example, [AWS-RestartEC2Instance].\n\
        \        \n\
        \         If you are using a shared SSM document, you must provide the ARN instead of the \
         name.\n\
        \         \n\
        \           Version  The Amazon Web Services Systems Manager automation document version. \
         For example, [\"Version\": \"1\"] \n\
        \                    \n\
        \                      AssumeRole  The Amazon Resource Name (ARN) of the role that \
         performs the self-service actions on your behalf. For example, [\"AssumeRole\": \
         \"arn:aws:iam::12345678910:role/ActionRole\"].\n\
        \                                  \n\
        \                                   To reuse the provisioned product launch role, set to \
         [\"AssumeRole\": \"LAUNCH_ROLE\"].\n\
        \                                   \n\
        \                                     Parameters  The list of parameters in JSON format.\n\
        \                                                 \n\
        \                                                  For example: \
         [\\[{\\\"Name\\\":\\\"InstanceId\\\",\\\"Type\\\":\\\"TARGET\\\"}\\]] or \
         [\\[{\\\"Name\\\":\\\"InstanceId\\\",\\\"Type\\\":\\\"TEXT_VALUE\\\"}\\]].\n\
        \                                                  \n\
        \                                                    "]
  definition_type : service_action_definition_type;
      [@ocaml.doc "The service action definition type. For example, [SSM_AUTOMATION].\n"]
  name : service_action_name; [@ocaml.doc "The self-service action name.\n"]
}
[@@ocaml.doc ""]

type nonrec create_provisioning_artifact_output = {
  status : status option; [@ocaml.doc "The status of the current request.\n"]
  info : provisioning_artifact_info option;
      [@ocaml.doc
        "Specify the template source with one of the following options, but not both. Keys \
         accepted: \\[ [LoadTemplateFromURL], [ImportFromPhysicalId] \\].\n\n\
        \ Use the URL of the CloudFormation template in Amazon S3 or GitHub in JSON format. \n\
        \ \n\
        \   [LoadTemplateFromURL] \n\
        \  \n\
        \   Use the URL of the CloudFormation template in Amazon S3 or GitHub in JSON format.\n\
        \   \n\
        \     [ImportFromPhysicalId] \n\
        \    \n\
        \     Use the physical id of the resource that contains the template; currently supports \
         CloudFormation stack ARN.\n\
        \     "]
  provisioning_artifact_detail : provisioning_artifact_detail option;
      [@ocaml.doc "Information about the provisioning artifact.\n"]
}
[@@ocaml.doc ""]

type nonrec create_provisioning_artifact_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  parameters : provisioning_artifact_properties;
      [@ocaml.doc "The configuration for the provisioning artifact.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_provisioned_product_plan_output = {
  provisioning_artifact_id : id option;
      [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  provisioned_product_name : provisioned_product_name option;
      [@ocaml.doc "The user-friendly name of the provisioned product.\n"]
  provision_product_id : id option; [@ocaml.doc "The product identifier.\n"]
  plan_id : id option; [@ocaml.doc "The plan identifier.\n"]
  plan_name : provisioned_product_plan_name option; [@ocaml.doc "The name of the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec create_provisioned_product_plan_input = {
  tags : tags option;
      [@ocaml.doc
        "One or more tags.\n\n\
        \ If the plan is for an existing provisioned product, the product must have a \
         [RESOURCE_UPDATE] constraint with [TagUpdatesOnProvisionedProduct] set to [ALLOWED] to \
         allow tag updates.\n\
        \ "]
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  provisioning_parameters : update_provisioning_parameters option;
      [@ocaml.doc
        "Parameters specified by the administrator that are required for provisioning the product.\n"]
  provisioning_artifact_id : id; [@ocaml.doc "The identifier of the provisioning artifact.\n"]
  provisioned_product_name : provisioned_product_name;
      [@ocaml.doc
        "A user-friendly name for the provisioned product. This value must be unique for the \
         Amazon Web Services account and cannot be updated after the product is provisioned.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  path_id : id option;
      [@ocaml.doc
        "The path identifier of the product. This value is optional if the product has a default \
         path, and required if the product has more than one path. To list the paths for a \
         product, use [ListLaunchPaths].\n"]
  notification_arns : notification_arns option;
      [@ocaml.doc
        "Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.\n"]
  plan_type : provisioned_product_plan_type; [@ocaml.doc "The plan type.\n"]
  plan_name : provisioned_product_plan_name; [@ocaml.doc "The name of the plan.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_product_output = {
  tags : tags option; [@ocaml.doc "Information about the tags associated with the product.\n"]
  provisioning_artifact_detail : provisioning_artifact_detail option;
      [@ocaml.doc "Information about the provisioning artifact. \n"]
  product_view_detail : product_view_detail option;
      [@ocaml.doc "Information about the product view.\n"]
}
[@@ocaml.doc ""]

type nonrec create_product_input = {
  source_connection : source_connection option;
      [@ocaml.doc
        "Specifies connection details for the created product and syncs the product to the \
         connection source artifact. This automatically manages the product's artifacts based on \
         changes to the source. The [SourceConnection] parameter consists of the following \
         sub-fields.\n\n\
        \ {ul\n\
        \       {-   [Type] \n\
        \           \n\
        \            }\n\
        \       {-   [ConnectionParamters] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  provisioning_artifact_parameters : provisioning_artifact_properties option;
      [@ocaml.doc "The configuration of the provisioning artifact. \n"]
  tags : add_tags option; [@ocaml.doc "One or more tags.\n"]
  product_type : product_type; [@ocaml.doc "The type of product.\n"]
  support_url : support_url option;
      [@ocaml.doc
        "The contact URL for product support.\n\n\
        \  [^https?:\\/\\// ]/ is the pattern used to validate SupportUrl.\n\
        \ "]
  support_email : support_email option; [@ocaml.doc "The contact email for product support.\n"]
  support_description : support_description option;
      [@ocaml.doc "The support information about the product.\n"]
  distributor : product_view_owner option; [@ocaml.doc "The distributor of the product.\n"]
  description : product_view_short_description option;
      [@ocaml.doc "The description of the product.\n"]
  owner : product_view_owner; [@ocaml.doc "The owner of the product.\n"]
  name : product_view_name; [@ocaml.doc "The name of the product.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_portfolio_share_output = {
  portfolio_share_token : id option;
      [@ocaml.doc
        "The portfolio shares a unique identifier that only returns if the portfolio is shared to \
         an organization node.\n"]
}
[@@ocaml.doc ""]

type nonrec create_portfolio_share_input = {
  share_principals : boolean_ option;
      [@ocaml.doc
        "This parameter is only supported for portfolios with an {b OrganizationalNode} Type of \
         [ORGANIZATION] or [ORGANIZATIONAL_UNIT]. \n\n\
        \ Enables or disables [Principal] sharing when creating the portfolio share. If you do {b \
         not} provide this flag, principal sharing is disabled. \n\
        \ \n\
        \  When you enable Principal Name Sharing for a portfolio share, the share recipient \
         account end users with a principal that matches any of the associated IAM patterns can \
         provision products from the portfolio. Once shared, the share recipient can view \
         associations of [PrincipalType]: [IAM_PATTERN] on their portfolio. You can create the \
         principals in the recipient account before or after creating the share. \n\
        \  "]
  share_tag_options : boolean_ option;
      [@ocaml.doc
        "Enables or disables [TagOptions ] sharing when creating the portfolio share. If this flag \
         is not provided, TagOptions sharing is disabled.\n"]
  organization_node : organization_node option;
      [@ocaml.doc
        "The organization node to whom you are going to share. When you pass [OrganizationNode], \
         it creates [PortfolioShare] for all of the Amazon Web Services accounts that are \
         associated to the [OrganizationNode]. The output returns a [PortfolioShareToken], which \
         enables the administrator to monitor the status of the [PortfolioShare] creation process.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID. For example, [123456789012].\n"]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_portfolio_output = {
  tags : tags option; [@ocaml.doc "Information about the tags associated with the portfolio.\n"]
  portfolio_detail : portfolio_detail option; [@ocaml.doc "Information about the portfolio.\n"]
}
[@@ocaml.doc ""]

type nonrec create_portfolio_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  tags : add_tags option; [@ocaml.doc "One or more tags.\n"]
  provider_name : provider_name; [@ocaml.doc "The name of the portfolio provider.\n"]
  description : portfolio_description option; [@ocaml.doc "The description of the portfolio.\n"]
  display_name : portfolio_display_name; [@ocaml.doc "The name to use for display purposes.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_constraint_output = {
  status : status option; [@ocaml.doc "The status of the current request.\n"]
  constraint_parameters : constraint_parameters option; [@ocaml.doc "The constraint parameters.\n"]
  constraint_detail : constraint_detail option; [@ocaml.doc "Information about the constraint.\n"]
}
[@@ocaml.doc ""]

type nonrec create_constraint_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request.\n"]
  description : constraint_description option; [@ocaml.doc "The description of the constraint.\n"]
  type_ : constraint_type;
      [@ocaml.doc
        "The type of constraint.\n\n\
        \ {ul\n\
        \       {-   [LAUNCH] \n\
        \           \n\
        \            }\n\
        \       {-   [NOTIFICATION] \n\
        \           \n\
        \            }\n\
        \       {-   [RESOURCE_UPDATE] \n\
        \           \n\
        \            }\n\
        \       {-   [STACKSET] \n\
        \           \n\
        \            }\n\
        \       {-   [TEMPLATE] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  parameters : constraint_parameters;
      [@ocaml.doc
        "The constraint parameters, in JSON format. The syntax depends on the constraint type as \
         follows:\n\n\
        \  LAUNCH  You are required to specify either the [RoleArn] or the [LocalRoleName] but \
         can't use both.\n\
        \          \n\
        \           Specify the [RoleArn] property as follows:\n\
        \           \n\
        \             [{\"RoleArn\" : \"arn:aws:iam::123456789012:role/LaunchRole\"}] \n\
        \            \n\
        \             Specify the [LocalRoleName] property as follows:\n\
        \             \n\
        \               [{\"LocalRoleName\": \"SCBasicLaunchRole\"}] \n\
        \              \n\
        \               If you specify the [LocalRoleName] property, when an account uses the \
         launch constraint, the IAM role with that name in the account will be used. This allows \
         launch-role constraints to be account-agnostic so the administrator can create fewer \
         resources per shared account.\n\
        \               \n\
        \                 The given role name must exist in the account used to create the launch \
         constraint and the account of the user who launches a product with this launch constraint.\n\
        \                 \n\
        \                   You cannot have both a [LAUNCH] and a [STACKSET] constraint.\n\
        \                   \n\
        \                    You also cannot have more than one [LAUNCH] constraint on a product \
         and portfolio.\n\
        \                    \n\
        \                      NOTIFICATION  Specify the [NotificationArns] property as follows:\n\
        \                                    \n\
        \                                      [{\"NotificationArns\" : \
         \\[\"arn:aws:sns:us-east-1:123456789012:Topic\"\\]}] \n\
        \                                     \n\
        \                                       RESOURCE_UPDATE  Specify the \
         [TagUpdatesOnProvisionedProduct] property as follows:\n\
        \                                                        \n\
        \                                                          \
         [{\"Version\":\"2.0\",\"Properties\":{\"TagUpdateOnProvisionedProduct\":\"String\"}}] \n\
        \                                                         \n\
        \                                                          The \
         [TagUpdatesOnProvisionedProduct] property accepts a string value of [ALLOWED] or \
         [NOT_ALLOWED].\n\
        \                                                          \n\
        \                                                            STACKSET  Specify the \
         [Parameters] property as follows:\n\
        \                                                                      \n\
        \                                                                        [{\"Version\": \
         \"String\", \"Properties\": {\"AccountList\": \\[ \"String\" \\], \"RegionList\": \\[ \
         \"String\" \\], \"AdminRole\": \"String\", \"ExecutionRole\": \"String\"}}] \n\
        \                                                                       \n\
        \                                                                        You cannot have \
         both a [LAUNCH] and a [STACKSET] constraint.\n\
        \                                                                        \n\
        \                                                                         You also cannot \
         have more than one [STACKSET] constraint on a product and portfolio.\n\
        \                                                                         \n\
        \                                                                          Products with a \
         [STACKSET] constraint will launch an CloudFormation stack set.\n\
        \                                                                          \n\
        \                                                                            TEMPLATE  \n\
         Specify the [Rules] property. For more information, see \
         {{:http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html}Template \
         Constraint Rules}.\n\n\
        \  "]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec copy_product_output = {
  copy_product_token : id option;
      [@ocaml.doc "The token to use to track the progress of the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec copy_option = CopyTags [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec copy_options = copy_option list [@@ocaml.doc ""]

type nonrec copy_product_input = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        " A unique identifier that you provide to ensure idempotency. If multiple requests differ \
         only by the idempotency token, the same response is returned for each repeated request. \n"]
  copy_options : copy_options option;
      [@ocaml.doc
        "The copy options. If the value is [CopyTags], the tags from the source product are copied \
         to the target product.\n"]
  source_provisioning_artifact_identifiers : source_provisioning_artifact_properties option;
      [@ocaml.doc
        "The identifiers of the provisioning artifacts (also known as versions) of the product to \
         copy. By default, all provisioning artifacts are copied.\n"]
  target_product_name : product_view_name option;
      [@ocaml.doc "A name for the target product. The default is the name of the source product.\n"]
  target_product_id : id option;
      [@ocaml.doc "The identifier of the target product. By default, a new product is created.\n"]
  source_product_arn : product_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the source product.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec batch_disassociate_service_action_from_provisioning_artifact_output = {
  failed_service_action_associations : failed_service_action_associations option;
      [@ocaml.doc
        "An object that contains a list of errors, along with information to help you identify the \
         self-service action.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_disassociate_service_action_from_provisioning_artifact_input = {
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_action_associations : service_action_associations;
      [@ocaml.doc
        "One or more associations, each consisting of the Action ID, the Product ID, and the \
         Provisioning Artifact ID.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_associate_service_action_with_provisioning_artifact_output = {
  failed_service_action_associations : failed_service_action_associations option;
      [@ocaml.doc
        "An object that contains a list of errors, along with information to help you identify the \
         self-service action.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_associate_service_action_with_provisioning_artifact_input = {
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_action_associations : service_action_associations;
      [@ocaml.doc
        "One or more associations, each consisting of the Action ID, the Product ID, and the \
         Provisioning Artifact ID.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_tag_option_with_resource_output = unit [@@ocaml.doc ""]

type nonrec associate_tag_option_with_resource_input = {
  tag_option_id : tag_option_id; [@ocaml.doc "The TagOption identifier.\n"]
  resource_id : resource_id; [@ocaml.doc "The resource identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_service_action_with_provisioning_artifact_output = unit [@@ocaml.doc ""]

type nonrec associate_service_action_with_provisioning_artifact_input = {
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A unique identifier that you provide to ensure idempotency. If multiple requests from the \
         same Amazon Web Services account use the same idempotency token, the same response is \
         returned for each repeated request. \n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_action_id : id;
      [@ocaml.doc "The self-service action identifier. For example, [act-fs7abcd89wxyz].\n"]
  provisioning_artifact_id : id;
      [@ocaml.doc "The identifier of the provisioning artifact. For example, [pa-4abcdjnxjj6ne].\n"]
  product_id : id; [@ocaml.doc "The product identifier. For example, [prod-abcdzk7xy33qa].\n"]
}
[@@ocaml.doc ""]

type nonrec associate_product_with_portfolio_output = unit [@@ocaml.doc ""]

type nonrec associate_product_with_portfolio_input = {
  source_portfolio_id : id option; [@ocaml.doc "The identifier of the source portfolio.\n"]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  product_id : id; [@ocaml.doc "The product identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec associate_principal_with_portfolio_output = unit [@@ocaml.doc ""]

type nonrec associate_principal_with_portfolio_input = {
  principal_type : principal_type;
      [@ocaml.doc
        "The principal type. The supported value is [IAM] if you use a fully defined Amazon \
         Resource Name (ARN), or [IAM_PATTERN] if you use an ARN with no [accountID], with or \
         without wildcard characters. \n"]
  principal_ar_n : principal_ar_n;
      [@ocaml.doc
        "The ARN of the principal (user, role, or group). If the [PrincipalType] is [IAM], the \
         supported value is a fully defined \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM \
         Amazon Resource Name (ARN)}. If the [PrincipalType] is [IAM_PATTERN], the supported value \
         is an [IAM] ARN {i without an AccountID} in the following format:\n\n\
        \  {i arn:partition:iam:::resource-type/resource-id} \n\
        \ \n\
        \  The ARN resource-id can be either:\n\
        \  \n\
        \   {ul\n\
        \         {-  A fully formed resource-id. For example, {i \
         arn:aws:iam:::role/resource-name} or {i arn:aws:iam:::role/resource-path/resource-name} \n\
        \             \n\
        \              }\n\
        \         {-  A wildcard ARN. The wildcard ARN accepts [IAM_PATTERN] values with a \"*\" \
         or \"?\" in the resource-id segment of the ARN. For example {i \
         arn:partition:service:::resource-type/resource-path/resource-name}. The new symbols are \
         exclusive to the {b resource-path} and {b resource-name} and cannot replace the {b \
         resource-type} or other ARN values. \n\
        \             \n\
        \              The ARN path and principal name allow unlimited wildcard characters.\n\
        \              \n\
        \               }\n\
        \         }\n\
        \   Examples of an {b acceptable} wildcard ARN:\n\
        \   \n\
        \    {ul\n\
        \          {-  arn:aws:iam:::role/ResourceName_*\n\
        \              \n\
        \               }\n\
        \          {-  arn:aws:iam:::role/*/ResourceName_?\n\
        \              \n\
        \               }\n\
        \          } Examples of an {b unacceptable} wildcard ARN:\n\
        \            \n\
        \             {ul\n\
        \                   {-  arn:aws:iam:::*/ResourceName\n\
        \                       \n\
        \                        }\n\
        \                   }\n\
        \   You can associate multiple [IAM_PATTERN]s even if the account has no principal with \
         that name. \n\
        \   \n\
        \    The \"?\" wildcard character matches zero or one of any character. This is similar to \
         \".?\" in regular regex context. The \"*\" wildcard character matches any number of any \
         characters. This is similar to \".*\" in regular regex context.\n\
        \    \n\
        \     In the IAM Principal ARN format ({i \
         arn:partition:iam:::resource-type/resource-path/resource-name}), valid resource-type \
         values include {b user/}, {b group/}, or {b role/}. The \"?\" and \"*\" characters are \
         allowed only after the resource-type in the resource-id segment. You can use special \
         characters anywhere within the resource-id. \n\
        \     \n\
        \      The \"*\" character also matches the \"/\" character, allowing paths to be formed \
         {i within} the resource-id. For example, {i arn:aws:iam:::role/{b *}/ResourceName_?} \
         matches both {i arn:aws:iam:::role/pathA/pathB/ResourceName_1} and {i \
         arn:aws:iam:::role/pathA/ResourceName_1}. \n\
        \      "]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec associate_budget_with_resource_output = unit [@@ocaml.doc ""]

type nonrec associate_budget_with_resource_input = {
  resource_id : id;
      [@ocaml.doc " The resource identifier. Either a portfolio-id or a product-id.\n"]
  budget_name : budget_name; [@ocaml.doc "The name of the budget you want to associate.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_portfolio_share_output = unit [@@ocaml.doc ""]

type nonrec accept_portfolio_share_input = {
  portfolio_share_type : portfolio_share_type option;
      [@ocaml.doc
        "The type of shared portfolios to accept. The default is to accept imported portfolios.\n\n\
        \ {ul\n\
        \       {-   [AWS_ORGANIZATIONS] - Accept portfolios shared by the management account of \
         your organization.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPORTED] - Accept imported portfolios.\n\
        \           \n\
        \            }\n\
        \       {-   [AWS_SERVICECATALOG] - Not supported. (Throws ResourceNotFoundException.)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For example, [aws servicecatalog accept-portfolio-share --portfolio-id \
         \"port-2qwzkwxt3y5fk\" --portfolio-share-type AWS_ORGANIZATIONS] \n\
        \   "]
  portfolio_id : id; [@ocaml.doc "The portfolio identifier.\n"]
  accept_language : accept_language option;
      [@ocaml.doc
        "The language code.\n\n\
        \ {ul\n\
        \       {-   [jp] - Japanese\n\
        \           \n\
        \            }\n\
        \       {-   [zh] - Chinese\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]
