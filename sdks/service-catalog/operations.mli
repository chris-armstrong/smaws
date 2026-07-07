open Types

module AcceptPortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_portfolio_share_input ->
    ( accept_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_portfolio_share_input ->
    ( accept_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Accepts an offer to share the specified portfolio.\n"]

module AssociateBudgetWithResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_budget_with_resource_input ->
    ( associate_budget_with_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_budget_with_resource_input ->
    ( associate_budget_with_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the specified budget with the specified resource.\n"]

module AssociatePrincipalWithPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_principal_with_portfolio_input ->
    ( associate_principal_with_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_principal_with_portfolio_input ->
    ( associate_principal_with_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified principal ARN with the specified portfolio.\n\n\
  \ If you share the portfolio with principal name sharing enabled, the [PrincipalARN] association \
   is included in the share. \n\
  \ \n\
  \  The [PortfolioID], [PrincipalARN], and [PrincipalType] parameters are required. \n\
  \  \n\
  \   You can associate a maximum of 10 Principals with a portfolio using [PrincipalType] as \
   [IAM_PATTERN]. \n\
  \   \n\
  \     When you associate a principal with portfolio, a potential privilege escalation path may \
   occur when that portfolio is then shared with other accounts. For a user in a recipient account \
   who is {i not} an Service Catalog Admin, but still has the ability to create Principals \
   (Users/Groups/Roles), that user could create a role that matches a principal name association \
   for the portfolio. Although this user may not know which principal names are associated through \
   Service Catalog, they may be able to guess the user. If this potential escalation path is a \
   concern, then Service Catalog recommends using [PrincipalType] as [IAM]. With this \
   configuration, the [PrincipalARN] must already exist in the recipient account before it can be \
   associated. \n\
  \     \n\
  \      "]

module AssociateProductWithPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_product_with_portfolio_input ->
    ( associate_product_with_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_product_with_portfolio_input ->
    ( associate_product_with_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified product with the specified portfolio.\n\n\
  \ A delegated admin is authorized to invoke this command.\n\
  \ "]

module AssociateServiceActionWithProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_service_action_with_provisioning_artifact_input ->
    ( associate_service_action_with_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_service_action_with_provisioning_artifact_input ->
    ( associate_service_action_with_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates a self-service action with a provisioning artifact.\n"]

module AssociateTagOptionWithResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_tag_option_with_resource_input ->
    ( associate_tag_option_with_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_tag_option_with_resource_input ->
    ( associate_tag_option_with_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associate the specified TagOption with the specified portfolio or product.\n"]

module BatchAssociateServiceActionWithProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_service_action_with_provisioning_artifact_input ->
    ( batch_associate_service_action_with_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_service_action_with_provisioning_artifact_input ->
    ( batch_associate_service_action_with_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates multiple self-service actions with provisioning artifacts.\n"]

module BatchDisassociateServiceActionFromProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_service_action_from_provisioning_artifact_input ->
    ( batch_disassociate_service_action_from_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_service_action_from_provisioning_artifact_input ->
    ( batch_disassociate_service_action_from_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a batch of self-service actions from the specified provisioning artifact.\n"]

module CopyProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_product_input ->
    ( copy_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_product_input ->
    ( copy_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the specified source product to the specified target product or a new product.\n\n\
  \ You can copy a product to the same account or another account. You can copy a product to the \
   same Region or another Region. If you copy a product to another account, you must first share \
   the product in a portfolio using [CreatePortfolioShare].\n\
  \ \n\
  \  This operation is performed asynchronously. To track the progress of the operation, use \
   [DescribeCopyProductStatus].\n\
  \  "]

module CreateConstraint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_constraint_input ->
    ( create_constraint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_constraint_input ->
    ( create_constraint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a constraint.\n\n A delegated admin is authorized to invoke this command.\n "]

module CreatePortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_portfolio_input ->
    ( create_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_portfolio_input ->
    ( create_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a portfolio.\n\n A delegated admin is authorized to invoke this command.\n "]

module CreatePortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_portfolio_share_input ->
    ( create_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_portfolio_share_input ->
    ( create_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shares the specified portfolio with the specified account or organization node. Shares to an \
   organization node can only be created by the management account of an organization or by a \
   delegated administrator. You can share portfolios to an organization, an organizational unit, \
   or a specific account.\n\n\
  \ Note that if a delegated admin is de-registered, they can no longer create portfolio shares.\n\
  \ \n\
  \   [AWSOrganizationsAccess] must be enabled in order to create a portfolio share to an \
   organization node.\n\
  \  \n\
  \   You can't share a shared resource, including portfolios that contain a shared product.\n\
  \   \n\
  \    If the portfolio share with the specified account or organization node already exists, this \
   action will have no effect and will not return an error. To update an existing share, you must \
   use the [ UpdatePortfolioShare] API instead. \n\
  \    \n\
  \      When you associate a principal with portfolio, a potential privilege escalation path may \
   occur when that portfolio is then shared with other accounts. For a user in a recipient account \
   who is {i not} an Service Catalog Admin, but still has the ability to create Principals \
   (Users/Groups/Roles), that user could create a role that matches a principal name association \
   for the portfolio. Although this user may not know which principal names are associated through \
   Service Catalog, they may be able to guess the user. If this potential escalation path is a \
   concern, then Service Catalog recommends using [PrincipalType] as [IAM]. With this \
   configuration, the [PrincipalARN] must already exist in the recipient account before it can be \
   associated. \n\
  \      \n\
  \       "]

module CreateProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_product_input ->
    ( create_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_product_input ->
    ( create_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a product.\n\n\
  \ A delegated admin is authorized to invoke this command.\n\
  \ \n\
  \  The user or role that performs this operation must have the [cloudformation:GetTemplate] IAM \
   policy permission. This policy permission is required when using the [ImportFromPhysicalId] \
   template source in the information data section.\n\
  \  "]

module CreateProvisionedProductPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_provisioned_product_plan_input ->
    ( create_provisioned_product_plan_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_provisioned_product_plan_input ->
    ( create_provisioned_product_plan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a plan.\n\n\
  \ A plan includes the list of resources to be created (when provisioning a new product) or \
   modified (when updating a provisioned product) when the plan is executed.\n\
  \ \n\
  \  You can create one plan for each provisioned product. To create a plan for an existing \
   provisioned product, the product status must be AVAILABLE or TAINTED.\n\
  \  \n\
  \   To view the resource changes in the change set, use [DescribeProvisionedProductPlan]. To \
   create or modify the provisioned product, use [ExecuteProvisionedProductPlan].\n\
  \   "]

module CreateProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_provisioning_artifact_input ->
    ( create_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_provisioning_artifact_input ->
    ( create_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a provisioning artifact (also known as a version) for the specified product.\n\n\
  \ You cannot create a provisioning artifact for a product that was shared with you.\n\
  \ \n\
  \  The user or role that performs this operation must have the [cloudformation:GetTemplate] IAM \
   policy permission. This policy permission is required when using the [ImportFromPhysicalId] \
   template source in the information data section.\n\
  \  "]

module CreateServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_action_input ->
    ( create_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_service_action_input ->
    ( create_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a self-service action.\n"]

module CreateTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tag_option_input ->
    ( create_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tag_option_input ->
    ( create_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a TagOption.\n"]

module DeleteConstraint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_constraint_input ->
    ( delete_constraint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_constraint_input ->
    ( delete_constraint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified constraint.\n\n A delegated admin is authorized to invoke this command.\n "]

module DeletePortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_portfolio_input ->
    ( delete_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_portfolio_input ->
    ( delete_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified portfolio.\n\n\
  \ You cannot delete a portfolio if it was shared with you or if it has associated products, \
   users, constraints, or shared accounts.\n\
  \ \n\
  \  A delegated admin is authorized to invoke this command.\n\
  \  "]

module DeletePortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_portfolio_share_input ->
    ( delete_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_portfolio_share_input ->
    ( delete_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops sharing the specified portfolio with the specified account or organization node. Shares \
   to an organization node can only be deleted by the management account of an organization or by \
   a delegated administrator.\n\n\
  \ Note that if a delegated admin is de-registered, portfolio shares created from that account \
   are removed.\n\
  \ "]

module DeleteProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_product_input ->
    ( delete_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_product_input ->
    ( delete_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified product.\n\n\
  \ You cannot delete a product if it was shared with you or is associated with a portfolio.\n\
  \ \n\
  \  A delegated admin is authorized to invoke this command.\n\
  \  "]

module DeleteProvisionedProductPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_provisioned_product_plan_input ->
    ( delete_provisioned_product_plan_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_provisioned_product_plan_input ->
    ( delete_provisioned_product_plan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified plan.\n"]

module DeleteProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_provisioning_artifact_input ->
    ( delete_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_provisioning_artifact_input ->
    ( delete_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified provisioning artifact (also known as a version) for the specified \
   product.\n\n\
  \ You cannot delete a provisioning artifact associated with a product that was shared with you. \
   You cannot delete the last provisioning artifact for a product, because a product must have at \
   least one provisioning artifact.\n\
  \ "]

module DeleteServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_action_input ->
    ( delete_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_service_action_input ->
    ( delete_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a self-service action.\n"]

module DeleteTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tag_option_input ->
    ( delete_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tag_option_input ->
    ( delete_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified TagOption.\n\n\
  \ You cannot delete a TagOption if it is associated with a product or portfolio.\n\
  \ "]

module DescribeConstraint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_constraint_input ->
    ( describe_constraint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_constraint_input ->
    ( describe_constraint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified constraint.\n"]

module DescribeCopyProductStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_copy_product_status_input ->
    ( describe_copy_product_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_copy_product_status_input ->
    ( describe_copy_product_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the status of the specified copy product operation.\n"]

module DescribePortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_input ->
    ( describe_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_input ->
    ( describe_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified portfolio.\n\n\
  \ A delegated admin is authorized to invoke this command.\n\
  \ "]

module DescribePortfolioShareStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_share_status_input ->
    ( describe_portfolio_share_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_share_status_input ->
    ( describe_portfolio_share_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the status of the specified portfolio share operation. This API can only be called by the \
   management account in the organization or by a delegated admin.\n"]

module DescribePortfolioShares : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_shares_input ->
    ( describe_portfolio_shares_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_shares_input ->
    ( describe_portfolio_shares_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a summary of each of the portfolio shares that were created for the specified \
   portfolio.\n\n\
  \ You can use this API to determine which accounts or organizational nodes this portfolio have \
   been shared, whether the recipient entity has imported the share, and whether TagOptions are \
   included with the share.\n\
  \ \n\
  \  The [PortfolioId] and [Type] parameters are both required.\n\
  \  "]

module DescribeProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_product_input ->
    ( describe_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_product_input ->
    ( describe_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified product.\n\n\
  \   Running this operation with administrator access results in a failure. \
   [DescribeProductAsAdmin] should be used instead. \n\
  \  \n\
  \   "]

module DescribeProductAsAdmin : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_product_as_admin_input ->
    ( describe_product_as_admin_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_product_as_admin_input ->
    ( describe_product_as_admin_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified product. This operation is run with administrator access.\n"]

module DescribeProductView : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_product_view_input ->
    ( describe_product_view_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_product_view_input ->
    ( describe_product_view_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified product.\n"]

module DescribeProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioned_product_input ->
    ( describe_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioned_product_input ->
    ( describe_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified provisioned product.\n"]

module DescribeProvisionedProductPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioned_product_plan_input ->
    ( describe_provisioned_product_plan_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioned_product_plan_input ->
    ( describe_provisioned_product_plan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the resource changes for the specified plan.\n"]

module DescribeProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioning_artifact_input ->
    ( describe_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioning_artifact_input ->
    ( describe_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified provisioning artifact (also known as a version) for the \
   specified product.\n"]

module DescribeProvisioningParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioning_parameters_input ->
    ( describe_provisioning_parameters_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioning_parameters_input ->
    ( describe_provisioning_parameters_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the configuration required to provision the specified product using the \
   specified provisioning artifact.\n\n\
  \ If the output contains a TagOption key with an empty list of values, there is a TagOption \
   conflict for that key. The end user cannot take action to fix the conflict, and launch is not \
   blocked. In subsequent calls to [ProvisionProduct], do not include conflicted TagOption keys as \
   tags, or this causes the error \"Parameter validation failed: Missing required parameter in \
   Tags\\[{i N}\\]:{i Value}\". Tag the provisioned product with the value \
   [sc-tagoption-conflict-portfolioId-productId].\n\
  \ "]

module DescribeRecord : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_record_input ->
    ( describe_record_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_record_input ->
    ( describe_record_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified request operation.\n\n\
  \ Use this operation after calling a request operation (for example, [ProvisionProduct], \
   [TerminateProvisionedProduct], or [UpdateProvisionedProduct]). \n\
  \ \n\
  \   If a provisioned product was transferred to a new owner using \
   [UpdateProvisionedProductProperties], the new owner will be able to describe all past records \
   for that product. The previous owner will no longer be able to describe the records, but will \
   be able to use [ListRecordHistory] to see the product's history from when he was the owner.\n\
  \   \n\
  \    "]

module DescribeServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_action_input ->
    ( describe_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_action_input ->
    ( describe_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a self-service action.\n"]

module DescribeServiceActionExecutionParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_action_execution_parameters_input ->
    ( describe_service_action_execution_parameters_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_action_execution_parameters_input ->
    ( describe_service_action_execution_parameters_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Finds the default parameters for a specific self-service action on a specific provisioned \
   product and returns a map of the results to the user.\n"]

module DescribeTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tag_option_input ->
    ( describe_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tag_option_input ->
    ( describe_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified TagOption.\n"]

module DisableAWSOrganizationsAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidStateException of invalid_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_aws_organizations_access_input ->
    ( disable_aws_organizations_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_aws_organizations_access_input ->
    ( disable_aws_organizations_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disable portfolio sharing through the Organizations service. This command will not delete your \
   current shares, but prevents you from creating new shares throughout your organization. Current \
   shares are not kept in sync with your organization structure if the structure changes after \
   calling this API. Only the management account in the organization can call this API.\n\n\
  \ You cannot call this API if there are active delegated administrators in the organization.\n\
  \ \n\
  \  Note that a delegated administrator is not authorized to invoke \
   [DisableAWSOrganizationsAccess].\n\
  \  \n\
  \    If you share an Service Catalog portfolio in an organization within Organizations, and then \
   disable Organizations access for Service Catalog, the portfolio access permissions will not \
   sync with the latest changes to the organization structure. Specifically, accounts that you \
   removed from the organization after disabling Service Catalog access will retain access to the \
   previously shared portfolio.\n\
  \    \n\
  \     "]

module DisassociateBudgetFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_budget_from_resource_input ->
    ( disassociate_budget_from_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_budget_from_resource_input ->
    ( disassociate_budget_from_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified budget from the specified resource.\n"]

module DisassociatePrincipalFromPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_principal_from_portfolio_input ->
    ( disassociate_principal_from_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_principal_from_portfolio_input ->
    ( disassociate_principal_from_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a previously associated principal ARN from a specified portfolio.\n\n\
  \ The [PrincipalType] and [PrincipalARN] must match the [AssociatePrincipalWithPortfolio] call \
   request details. For example, to disassociate an association created with a [PrincipalARN] of \
   [PrincipalType] IAM you must use the [PrincipalType] IAM when calling \
   [DisassociatePrincipalFromPortfolio]. \n\
  \ \n\
  \  For portfolios that have been shared with principal name sharing enabled: after \
   disassociating a principal, share recipient accounts will no longer be able to provision \
   products in this portfolio using a role matching the name of the associated principal. \n\
  \  \n\
  \   For more information, review \
   {{:https://docs.aws.amazon.com/cli/latest/reference/servicecatalog/associate-principal-with-portfolio.html#options}associate-principal-with-portfolio} \
   in the Amazon Web Services CLI Command Reference. \n\
  \   \n\
  \     If you disassociate a principal from a portfolio, with PrincipalType as [IAM], the same \
   principal will still have access to the portfolio if it matches one of the associated \
   principals of type [IAM_PATTERN]. To fully remove access for a principal, verify all the \
   associated Principals of type [IAM_PATTERN], and then ensure you disassociate any [IAM_PATTERN] \
   principals that match the principal whose access you are removing.\n\
  \     \n\
  \      "]

module DisassociateProductFromPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_product_from_portfolio_input ->
    ( disassociate_product_from_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_product_from_portfolio_input ->
    ( disassociate_product_from_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates the specified product from the specified portfolio. \n\n\
  \ A delegated admin is authorized to invoke this command.\n\
  \ "]

module DisassociateServiceActionFromProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_service_action_from_provisioning_artifact_input ->
    ( disassociate_service_action_from_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_service_action_from_provisioning_artifact_input ->
    ( disassociate_service_action_from_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates the specified self-service action association from the specified provisioning \
   artifact.\n"]

module DisassociateTagOptionFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_tag_option_from_resource_input ->
    ( disassociate_tag_option_from_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_tag_option_from_resource_input ->
    ( disassociate_tag_option_from_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified TagOption from the specified resource.\n"]

module EnableAWSOrganizationsAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidStateException of invalid_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_aws_organizations_access_input ->
    ( enable_aws_organizations_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_aws_organizations_access_input ->
    ( enable_aws_organizations_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enable portfolio sharing feature through Organizations. This API will allow Service Catalog to \
   receive updates on your organization in order to sync your shares with the current structure. \
   This API can only be called by the management account in the organization.\n\n\
  \ When you call this API, Service Catalog calls [organizations:EnableAWSServiceAccess] on your \
   behalf so that your shares stay in sync with any changes in your Organizations structure.\n\
  \ \n\
  \  Note that a delegated administrator is not authorized to invoke [EnableAWSOrganizationsAccess].\n\
  \  \n\
  \    If you have previously disabled Organizations access for Service Catalog, and then enable \
   access again, the portfolio access permissions might not sync with the latest changes to the \
   organization structure. Specifically, accounts that you removed from the organization after \
   disabling Service Catalog access, and before you enabled access again, can retain access to the \
   previously shared portfolio. As a result, an account that has been removed from the \
   organization might still be able to create or manage Amazon Web Services resources when it is \
   no longer authorized to do so. Amazon Web Services is working to resolve this issue.\n\
  \    \n\
  \     "]

module ExecuteProvisionedProductPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_provisioned_product_plan_input ->
    ( execute_provisioned_product_plan_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_provisioned_product_plan_input ->
    ( execute_provisioned_product_plan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions or modifies a product based on the resource changes for the specified plan.\n"]

module ExecuteProvisionedProductServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_provisioned_product_service_action_input ->
    ( execute_provisioned_product_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_provisioned_product_service_action_input ->
    ( execute_provisioned_product_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Executes a self-service action against a provisioned product.\n"]

module GetAWSOrganizationsAccessStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_aws_organizations_access_status_input ->
    ( get_aws_organizations_access_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_aws_organizations_access_status_input ->
    ( get_aws_organizations_access_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get the Access Status for Organizations portfolio share feature. This API can only be called by \
   the management account in the organization or by a delegated admin.\n"]

module GetProvisionedProductOutputs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_provisioned_product_outputs_input ->
    ( get_provisioned_product_outputs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_provisioned_product_outputs_input ->
    ( get_provisioned_product_outputs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API takes either a [ProvisonedProductId] or a [ProvisionedProductName], along with a list \
   of one or more output keys, and responds with the key/value pairs of those outputs.\n"]

module ImportAsProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_as_provisioned_product_input ->
    ( import_as_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_as_provisioned_product_input ->
    ( import_as_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Requests the import of a resource as an Service Catalog provisioned product that is associated \
   to an Service Catalog product and provisioning artifact. Once imported, all supported \
   governance actions are supported on the provisioned product. \n\n\
  \  Resource import only supports CloudFormation stack ARNs. CloudFormation StackSets, and \
   non-root nested stacks, are not supported. \n\
  \ \n\
  \   The CloudFormation stack must have one of the following statuses to be imported: \
   [CREATE_COMPLETE], [UPDATE_COMPLETE], [UPDATE_ROLLBACK_COMPLETE], [IMPORT_COMPLETE], and \
   [IMPORT_ROLLBACK_COMPLETE]. \n\
  \  \n\
  \    Import of the resource requires that the CloudFormation stack template matches the \
   associated Service Catalog product provisioning artifact. \n\
  \   \n\
  \      When you import an existing CloudFormation stack into a portfolio, Service Catalog does \
   not apply the product's associated constraints during the import process. Service Catalog \
   applies the constraints after you call [UpdateProvisionedProduct] for the provisioned product. \n\
  \     \n\
  \        The user or role that performs this operation must have the \
   [cloudformation:GetTemplate] and [cloudformation:DescribeStacks] IAM policy permissions. \n\
  \       \n\
  \        You can only import one provisioned product at a time. The product's CloudFormation \
   stack must have the [IMPORT_COMPLETE] status before you import another. \n\
  \        "]

module ListAcceptedPortfolioShares : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `OperationNotSupportedException of operation_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accepted_portfolio_shares_input ->
    ( list_accepted_portfolio_shares_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accepted_portfolio_shares_input ->
    ( list_accepted_portfolio_shares_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all imported portfolios for which account-to-account shares were accepted by this \
   account. By specifying the [PortfolioShareType], you can list portfolios for which \
   organizational shares were accepted by this account.\n"]

module ListBudgetsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_budgets_for_resource_input ->
    ( list_budgets_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_budgets_for_resource_input ->
    ( list_budgets_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the budgets associated to the specified resource.\n"]

module ListConstraintsForPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_constraints_for_portfolio_input ->
    ( list_constraints_for_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_constraints_for_portfolio_input ->
    ( list_constraints_for_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the constraints for the specified portfolio and product.\n"]

module ListLaunchPaths : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_launch_paths_input ->
    ( list_launch_paths_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_launch_paths_input ->
    ( list_launch_paths_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists the paths to the specified product. A path describes how the user gets access to a \
   specified product and is necessary when provisioning a product. A path also determines the \
   constraints that are put on a product. A path is dependent on a specific product, porfolio, and \
   principal. \n\n\
  \   When provisioning a product that's been added to a portfolio, you must grant your user, \
   group, or role access to the portfolio. For more information, see \
   {{:https://docs.aws.amazon.com/servicecatalog/latest/adminguide/catalogs_portfolios_users.html}Granting \
   users access} in the {i Service Catalog User Guide}. \n\
  \  \n\
  \   "]

module ListOrganizationPortfolioAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_organization_portfolio_access_input ->
    ( list_organization_portfolio_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_organization_portfolio_access_input ->
    ( list_organization_portfolio_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the organization nodes that have access to the specified portfolio. This API can only be \
   called by the management account in the organization or by a delegated admin.\n\n\
  \ If a delegated admin is de-registered, they can no longer perform this operation.\n\
  \ "]

module ListPortfolioAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_portfolio_access_input ->
    ( list_portfolio_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_portfolio_access_input ->
    ( list_portfolio_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the account IDs that have access to the specified portfolio.\n\n\
  \ A delegated admin can list the accounts that have access to the shared portfolio. Note that if \
   a delegated admin is de-registered, they can no longer perform this operation.\n\
  \ "]

module ListPortfolios : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_portfolios_input ->
    ( list_portfolios_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_portfolios_input ->
    ( list_portfolios_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all portfolios in the catalog.\n"]

module ListPortfoliosForProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_portfolios_for_product_input ->
    ( list_portfolios_for_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_portfolios_for_product_input ->
    ( list_portfolios_for_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all portfolios that the specified product is associated with.\n"]

module ListPrincipalsForPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_principals_for_portfolio_input ->
    ( list_principals_for_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_principals_for_portfolio_input ->
    ( list_principals_for_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all [PrincipalARN]s and corresponding [PrincipalType]s associated with the specified \
   portfolio.\n"]

module ListProvisionedProductPlans : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_provisioned_product_plans_input ->
    ( list_provisioned_product_plans_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_provisioned_product_plans_input ->
    ( list_provisioned_product_plans_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the plans for the specified provisioned product or all plans to which the user has access.\n"]

module ListProvisioningArtifacts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_provisioning_artifacts_input ->
    ( list_provisioning_artifacts_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_provisioning_artifacts_input ->
    ( list_provisioning_artifacts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all provisioning artifacts (also known as versions) for the specified product.\n"]

module ListProvisioningArtifactsForServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_provisioning_artifacts_for_service_action_input ->
    ( list_provisioning_artifacts_for_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_provisioning_artifacts_for_service_action_input ->
    ( list_provisioning_artifacts_for_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all provisioning artifacts (also known as versions) for the specified self-service action.\n"]

module ListRecordHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_record_history_input ->
    ( list_record_history_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_record_history_input ->
    ( list_record_history_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the specified requests or all performed requests.\n"]

module ListResourcesForTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resources_for_tag_option_input ->
    ( list_resources_for_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resources_for_tag_option_input ->
    ( list_resources_for_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the resources associated with the specified TagOption.\n"]

module ListServiceActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_actions_input ->
    ( list_service_actions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_service_actions_input ->
    ( list_service_actions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all self-service actions.\n"]

module ListServiceActionsForProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_actions_for_provisioning_artifact_input ->
    ( list_service_actions_for_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_service_actions_for_provisioning_artifact_input ->
    ( list_service_actions_for_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of self-service actions associated with the specified Product ID and \
   Provisioning Artifact ID.\n"]

module ListStackInstancesForProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_instances_for_provisioned_product_input ->
    ( list_stack_instances_for_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_instances_for_provisioned_product_input ->
    ( list_stack_instances_for_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns summary information about stack instances that are associated with the specified \
   [CFN_STACKSET] type provisioned product. You can filter for stack instances that are associated \
   with a specific Amazon Web Services account name or Region. \n"]

module ListTagOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tag_options_input ->
    ( list_tag_options_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tag_options_input ->
    ( list_tag_options_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the specified TagOptions or all TagOptions.\n"]

module NotifyProvisionProductEngineWorkflowResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_provision_product_engine_workflow_result_input ->
    ( notify_provision_product_engine_workflow_result_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    notify_provision_product_engine_workflow_result_input ->
    ( notify_provision_product_engine_workflow_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Notifies the result of the provisioning engine execution. \n"]

module NotifyTerminateProvisionedProductEngineWorkflowResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_terminate_provisioned_product_engine_workflow_result_input ->
    ( notify_terminate_provisioned_product_engine_workflow_result_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    notify_terminate_provisioned_product_engine_workflow_result_input ->
    ( notify_terminate_provisioned_product_engine_workflow_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Notifies the result of the terminate engine execution. \n"]

module NotifyUpdateProvisionedProductEngineWorkflowResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_update_provisioned_product_engine_workflow_result_input ->
    ( notify_update_provisioned_product_engine_workflow_result_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    notify_update_provisioned_product_engine_workflow_result_input ->
    ( notify_update_provisioned_product_engine_workflow_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Notifies the result of the update engine execution. \n"]

module ProvisionProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    provision_product_input ->
    ( provision_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    provision_product_input ->
    ( provision_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Provisions the specified product. \n\n\
  \  A provisioned product is a resourced instance of a product. For example, provisioning a \
   product that's based on an CloudFormation template launches an CloudFormation stack and its \
   underlying resources. You can check the status of this request using [DescribeRecord]. \n\
  \ \n\
  \   If the request contains a tag key with an empty list of values, there's a tag conflict for \
   that key. Don't include conflicted keys as tags, or this will cause the error \"Parameter \
   validation failed: Missing required parameter in Tags\\[{i N}\\]:{i Value}\". \n\
  \  \n\
  \     When provisioning a product that's been added to a portfolio, you must grant your user, \
   group, or role access to the portfolio. For more information, see \
   {{:https://docs.aws.amazon.com/servicecatalog/latest/adminguide/catalogs_portfolios_users.html}Granting \
   users access} in the {i Service Catalog User Guide}. \n\
  \    \n\
  \     "]

module RejectPortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_portfolio_share_input ->
    ( reject_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_portfolio_share_input ->
    ( reject_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rejects an offer to share the specified portfolio.\n"]

module ScanProvisionedProducts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    scan_provisioned_products_input ->
    ( scan_provisioned_products_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    scan_provisioned_products_input ->
    ( scan_provisioned_products_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the provisioned products that are available (not terminated).\n\n\
  \ To use additional filtering, see [SearchProvisionedProducts].\n\
  \ "]

module SearchProducts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_products_input ->
    ( search_products_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_products_input ->
    ( search_products_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the products to which the caller has access.\n"]

module SearchProductsAsAdmin : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_products_as_admin_input ->
    ( search_products_as_admin_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_products_as_admin_input ->
    ( search_products_as_admin_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the products for the specified portfolio or all products.\n"]

module SearchProvisionedProducts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_provisioned_products_input ->
    ( search_provisioned_products_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_provisioned_products_input ->
    ( search_provisioned_products_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the provisioned products that meet the specified criteria.\n"]

module TerminateProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_provisioned_product_input ->
    ( terminate_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_provisioned_product_input ->
    ( terminate_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates the specified provisioned product.\n\n\
  \ This operation does not delete any records associated with the provisioned product.\n\
  \ \n\
  \  You can check the status of this request using [DescribeRecord].\n\
  \  "]

module UpdateConstraint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_constraint_input ->
    ( update_constraint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_constraint_input ->
    ( update_constraint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified constraint.\n"]

module UpdatePortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_portfolio_input ->
    ( update_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_portfolio_input ->
    ( update_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified portfolio.\n\n You cannot update a product that was shared with you.\n "]

module UpdatePortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_portfolio_share_input ->
    ( update_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_portfolio_share_input ->
    ( update_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified portfolio share. You can use this API to enable or disable [TagOptions] \
   sharing or Principal sharing for an existing portfolio share. \n\n\
  \ The portfolio share cannot be updated if the [CreatePortfolioShare] operation is \
   [IN_PROGRESS], as the share is not available to recipient entities. In this case, you must wait \
   for the portfolio share to be completed.\n\
  \ \n\
  \  You must provide the [accountId] or organization node in the input, but not both.\n\
  \  \n\
  \   If the portfolio is shared to both an external account and an organization node, and both \
   shares need to be updated, you must invoke [UpdatePortfolioShare] separately for each share \
   type. \n\
  \   \n\
  \    This API cannot be used for removing the portfolio share. You must use \
   [DeletePortfolioShare] API for that action. \n\
  \    \n\
  \      When you associate a principal with portfolio, a potential privilege escalation path may \
   occur when that portfolio is then shared with other accounts. For a user in a recipient account \
   who is {i not} an Service Catalog Admin, but still has the ability to create Principals \
   (Users/Groups/Roles), that user could create a role that matches a principal name association \
   for the portfolio. Although this user may not know which principal names are associated through \
   Service Catalog, they may be able to guess the user. If this potential escalation path is a \
   concern, then Service Catalog recommends using [PrincipalType] as [IAM]. With this \
   configuration, the [PrincipalARN] must already exist in the recipient account before it can be \
   associated. \n\
  \      \n\
  \       "]

module UpdateProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_product_input ->
    ( update_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_product_input ->
    ( update_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified product.\n"]

module UpdateProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_product_input ->
    ( update_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_product_input ->
    ( update_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests updates to the configuration of the specified provisioned product.\n\n\
  \ If there are tags associated with the object, they cannot be updated or added. Depending on \
   the specific updates requested, this operation can update with no interruption, with some \
   interruption, or replace the provisioned product entirely.\n\
  \ \n\
  \  You can check the status of this request using [DescribeRecord].\n\
  \  "]

module UpdateProvisionedProductProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_product_properties_input ->
    ( update_provisioned_product_properties_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_product_properties_input ->
    ( update_provisioned_product_properties_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Requests updates to the properties of the specified provisioned product.\n"]

module UpdateProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_provisioning_artifact_input ->
    ( update_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_provisioning_artifact_input ->
    ( update_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified provisioning artifact (also known as a version) for the specified \
   product.\n\n\
  \ You cannot update a provisioning artifact for a product that was shared with you.\n\
  \ "]

module UpdateServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_action_input ->
    ( update_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_action_input ->
    ( update_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a self-service action.\n"]

module UpdateTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_tag_option_input ->
    ( update_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_tag_option_input ->
    ( update_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified TagOption.\n"]
