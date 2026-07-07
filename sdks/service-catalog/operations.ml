open Types
open Service_metadata

module AcceptPortfolioShare = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_portfolio_share_input) =
    let input = Json_serializers.accept_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.AcceptPortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_portfolio_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_portfolio_share_input) =
    let input = Json_serializers.accept_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.AcceptPortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_portfolio_share_output_of_yojson
      ~error_deserializer
end

module AssociateBudgetWithResource = struct
  let error_to_string = function
    | `DuplicateResourceException _ -> "com.amazonaws.servicecatalog#DuplicateResourceException"
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateResourceException" ->
          `DuplicateResourceException
            (Json_deserializers.duplicate_resource_exception_of_yojson tree path)
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_budget_with_resource_input) =
    let input = Json_serializers.associate_budget_with_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.AssociateBudgetWithResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_budget_with_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_budget_with_resource_input) =
    let input = Json_serializers.associate_budget_with_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.AssociateBudgetWithResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_budget_with_resource_output_of_yojson
      ~error_deserializer
end

module AssociatePrincipalWithPortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_principal_with_portfolio_input) =
    let input = Json_serializers.associate_principal_with_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.AssociatePrincipalWithPortfolio" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_principal_with_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_principal_with_portfolio_input) =
    let input = Json_serializers.associate_principal_with_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.AssociatePrincipalWithPortfolio" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_principal_with_portfolio_output_of_yojson
      ~error_deserializer
end

module AssociateProductWithPortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_product_with_portfolio_input) =
    let input = Json_serializers.associate_product_with_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.AssociateProductWithPortfolio" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_product_with_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_product_with_portfolio_input) =
    let input = Json_serializers.associate_product_with_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.AssociateProductWithPortfolio" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_product_with_portfolio_output_of_yojson
      ~error_deserializer
end

module AssociateServiceActionWithProvisioningArtifact = struct
  let error_to_string = function
    | `DuplicateResourceException _ -> "com.amazonaws.servicecatalog#DuplicateResourceException"
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateResourceException" ->
          `DuplicateResourceException
            (Json_deserializers.duplicate_resource_exception_of_yojson tree path)
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_service_action_with_provisioning_artifact_input) =
    let input =
      Json_serializers.associate_service_action_with_provisioning_artifact_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.AssociateServiceActionWithProvisioningArtifact"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_service_action_with_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : associate_service_action_with_provisioning_artifact_input) =
    let input =
      Json_serializers.associate_service_action_with_provisioning_artifact_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.AssociateServiceActionWithProvisioningArtifact"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_service_action_with_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module AssociateTagOptionWithResource = struct
  let error_to_string = function
    | `DuplicateResourceException _ -> "com.amazonaws.servicecatalog#DuplicateResourceException"
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateResourceException" ->
          `DuplicateResourceException
            (Json_deserializers.duplicate_resource_exception_of_yojson tree path)
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_tag_option_with_resource_input) =
    let input = Json_serializers.associate_tag_option_with_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.AssociateTagOptionWithResource" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_tag_option_with_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_tag_option_with_resource_input) =
    let input = Json_serializers.associate_tag_option_with_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.AssociateTagOptionWithResource" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_tag_option_with_resource_output_of_yojson
      ~error_deserializer
end

module BatchAssociateServiceActionWithProvisioningArtifact = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_associate_service_action_with_provisioning_artifact_input) =
    let input =
      Json_serializers.batch_associate_service_action_with_provisioning_artifact_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.BatchAssociateServiceActionWithProvisioningArtifact"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .batch_associate_service_action_with_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_associate_service_action_with_provisioning_artifact_input) =
    let input =
      Json_serializers.batch_associate_service_action_with_provisioning_artifact_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.BatchAssociateServiceActionWithProvisioningArtifact"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .batch_associate_service_action_with_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module BatchDisassociateServiceActionFromProvisioningArtifact = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_disassociate_service_action_from_provisioning_artifact_input)
      =
    let input =
      Json_serializers.batch_disassociate_service_action_from_provisioning_artifact_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:
        "AWS242ServiceCatalogService.BatchDisassociateServiceActionFromProvisioningArtifact"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .batch_disassociate_service_action_from_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_disassociate_service_action_from_provisioning_artifact_input) =
    let input =
      Json_serializers.batch_disassociate_service_action_from_provisioning_artifact_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:
        "AWS242ServiceCatalogService.BatchDisassociateServiceActionFromProvisioningArtifact"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .batch_disassociate_service_action_from_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module CopyProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_product_input) =
    let input = Json_serializers.copy_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.CopyProduct"
      ~service ~context ~input ~output_deserializer:Json_deserializers.copy_product_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : copy_product_input) =
    let input = Json_serializers.copy_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CopyProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.copy_product_output_of_yojson ~error_deserializer
end

module CreateConstraint = struct
  let error_to_string = function
    | `DuplicateResourceException _ -> "com.amazonaws.servicecatalog#DuplicateResourceException"
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateResourceException" ->
          `DuplicateResourceException
            (Json_deserializers.duplicate_resource_exception_of_yojson tree path)
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_constraint_input) =
    let input = Json_serializers.create_constraint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.CreateConstraint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_constraint_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_constraint_input) =
    let input = Json_serializers.create_constraint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CreateConstraint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_constraint_output_of_yojson ~error_deserializer
end

module CreatePortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_portfolio_input) =
    let input = Json_serializers.create_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.CreatePortfolio"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_portfolio_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_portfolio_input) =
    let input = Json_serializers.create_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CreatePortfolio" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_portfolio_output_of_yojson ~error_deserializer
end

module CreatePortfolioShare = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_portfolio_share_input) =
    let input = Json_serializers.create_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.CreatePortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_portfolio_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_portfolio_share_input) =
    let input = Json_serializers.create_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CreatePortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_portfolio_share_output_of_yojson
      ~error_deserializer
end

module CreateProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_product_input) =
    let input = Json_serializers.create_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.CreateProduct"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_product_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_product_input) =
    let input = Json_serializers.create_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CreateProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_product_output_of_yojson ~error_deserializer
end

module CreateProvisionedProductPlan = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_provisioned_product_plan_input) =
    let input = Json_serializers.create_provisioned_product_plan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.CreateProvisionedProductPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_provisioned_product_plan_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_provisioned_product_plan_input) =
    let input = Json_serializers.create_provisioned_product_plan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CreateProvisionedProductPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_provisioned_product_plan_output_of_yojson
      ~error_deserializer
end

module CreateProvisioningArtifact = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_provisioning_artifact_input) =
    let input = Json_serializers.create_provisioning_artifact_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.CreateProvisioningArtifact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_provisioning_artifact_input) =
    let input = Json_serializers.create_provisioning_artifact_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CreateProvisioningArtifact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module CreateServiceAction = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_action_input) =
    let input = Json_serializers.create_service_action_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.CreateServiceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_action_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_service_action_input) =
    let input = Json_serializers.create_service_action_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CreateServiceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_action_output_of_yojson
      ~error_deserializer
end

module CreateTagOption = struct
  let error_to_string = function
    | `DuplicateResourceException _ -> "com.amazonaws.servicecatalog#DuplicateResourceException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateResourceException" ->
          `DuplicateResourceException
            (Json_deserializers.duplicate_resource_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_tag_option_input) =
    let input = Json_serializers.create_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.CreateTagOption"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tag_option_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_tag_option_input) =
    let input = Json_serializers.create_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.CreateTagOption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tag_option_output_of_yojson ~error_deserializer
end

module DeleteConstraint = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_constraint_input) =
    let input = Json_serializers.delete_constraint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DeleteConstraint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_constraint_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_constraint_input) =
    let input = Json_serializers.delete_constraint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DeleteConstraint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_constraint_output_of_yojson ~error_deserializer
end

module DeletePortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceInUseException _ -> "com.amazonaws.servicecatalog#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_portfolio_input) =
    let input = Json_serializers.delete_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DeletePortfolio"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_portfolio_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_portfolio_input) =
    let input = Json_serializers.delete_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DeletePortfolio" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_portfolio_output_of_yojson ~error_deserializer
end

module DeletePortfolioShare = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_portfolio_share_input) =
    let input = Json_serializers.delete_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DeletePortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_portfolio_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_portfolio_share_input) =
    let input = Json_serializers.delete_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DeletePortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_portfolio_share_output_of_yojson
      ~error_deserializer
end

module DeleteProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceInUseException _ -> "com.amazonaws.servicecatalog#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_product_input) =
    let input = Json_serializers.delete_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DeleteProduct"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_product_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_product_input) =
    let input = Json_serializers.delete_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DeleteProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_product_output_of_yojson ~error_deserializer
end

module DeleteProvisionedProductPlan = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_provisioned_product_plan_input) =
    let input = Json_serializers.delete_provisioned_product_plan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DeleteProvisionedProductPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_provisioned_product_plan_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_provisioned_product_plan_input) =
    let input = Json_serializers.delete_provisioned_product_plan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DeleteProvisionedProductPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_provisioned_product_plan_output_of_yojson
      ~error_deserializer
end

module DeleteProvisioningArtifact = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceInUseException _ -> "com.amazonaws.servicecatalog#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_provisioning_artifact_input) =
    let input = Json_serializers.delete_provisioning_artifact_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DeleteProvisioningArtifact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_provisioning_artifact_input) =
    let input = Json_serializers.delete_provisioning_artifact_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DeleteProvisioningArtifact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module DeleteServiceAction = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceInUseException _ -> "com.amazonaws.servicecatalog#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_action_input) =
    let input = Json_serializers.delete_service_action_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DeleteServiceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_action_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_service_action_input) =
    let input = Json_serializers.delete_service_action_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DeleteServiceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_action_output_of_yojson
      ~error_deserializer
end

module DeleteTagOption = struct
  let error_to_string = function
    | `ResourceInUseException _ -> "com.amazonaws.servicecatalog#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tag_option_input) =
    let input = Json_serializers.delete_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DeleteTagOption"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tag_option_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_tag_option_input) =
    let input = Json_serializers.delete_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DeleteTagOption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tag_option_output_of_yojson ~error_deserializer
end

module DescribeConstraint = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_constraint_input) =
    let input = Json_serializers.describe_constraint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DescribeConstraint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_constraint_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_constraint_input) =
    let input = Json_serializers.describe_constraint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeConstraint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_constraint_output_of_yojson
      ~error_deserializer
end

module DescribeCopyProductStatus = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_copy_product_status_input) =
    let input = Json_serializers.describe_copy_product_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeCopyProductStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_copy_product_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_copy_product_status_input) =
    let input = Json_serializers.describe_copy_product_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeCopyProductStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_copy_product_status_output_of_yojson
      ~error_deserializer
end

module DescribePortfolio = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_portfolio_input) =
    let input = Json_serializers.describe_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DescribePortfolio"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_portfolio_input) =
    let input = Json_serializers.describe_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribePortfolio" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_portfolio_output_of_yojson
      ~error_deserializer
end

module DescribePortfolioShareStatus = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_portfolio_share_status_input) =
    let input = Json_serializers.describe_portfolio_share_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribePortfolioShareStatus" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_portfolio_share_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_portfolio_share_status_input) =
    let input = Json_serializers.describe_portfolio_share_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribePortfolioShareStatus" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_portfolio_share_status_output_of_yojson
      ~error_deserializer
end

module DescribePortfolioShares = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_portfolio_shares_input) =
    let input = Json_serializers.describe_portfolio_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribePortfolioShares" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_portfolio_shares_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_portfolio_shares_input) =
    let input = Json_serializers.describe_portfolio_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribePortfolioShares" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_portfolio_shares_output_of_yojson
      ~error_deserializer
end

module DescribeProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_product_input) =
    let input = Json_serializers.describe_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DescribeProduct"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_product_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_product_input) =
    let input = Json_serializers.describe_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_product_output_of_yojson ~error_deserializer
end

module DescribeProductAsAdmin = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_product_as_admin_input) =
    let input = Json_serializers.describe_product_as_admin_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeProductAsAdmin" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_product_as_admin_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_product_as_admin_input) =
    let input = Json_serializers.describe_product_as_admin_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeProductAsAdmin" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_product_as_admin_output_of_yojson
      ~error_deserializer
end

module DescribeProductView = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_product_view_input) =
    let input = Json_serializers.describe_product_view_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeProductView" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_product_view_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_product_view_input) =
    let input = Json_serializers.describe_product_view_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeProductView" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_product_view_output_of_yojson
      ~error_deserializer
end

module DescribeProvisionedProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_provisioned_product_input) =
    let input = Json_serializers.describe_provisioned_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeProvisionedProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_provisioned_product_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_provisioned_product_input) =
    let input = Json_serializers.describe_provisioned_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeProvisionedProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_provisioned_product_output_of_yojson
      ~error_deserializer
end

module DescribeProvisionedProductPlan = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_provisioned_product_plan_input) =
    let input = Json_serializers.describe_provisioned_product_plan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeProvisionedProductPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_provisioned_product_plan_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_provisioned_product_plan_input) =
    let input = Json_serializers.describe_provisioned_product_plan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeProvisionedProductPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_provisioned_product_plan_output_of_yojson
      ~error_deserializer
end

module DescribeProvisioningArtifact = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_provisioning_artifact_input) =
    let input = Json_serializers.describe_provisioning_artifact_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeProvisioningArtifact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_provisioning_artifact_input) =
    let input = Json_serializers.describe_provisioning_artifact_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeProvisioningArtifact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module DescribeProvisioningParameters = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_provisioning_parameters_input) =
    let input = Json_serializers.describe_provisioning_parameters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeProvisioningParameters" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_provisioning_parameters_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_provisioning_parameters_input) =
    let input = Json_serializers.describe_provisioning_parameters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeProvisioningParameters" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_provisioning_parameters_output_of_yojson
      ~error_deserializer
end

module DescribeRecord = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_record_input) =
    let input = Json_serializers.describe_record_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DescribeRecord"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_record_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_record_input) =
    let input = Json_serializers.describe_record_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeRecord" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_record_output_of_yojson ~error_deserializer
end

module DescribeServiceAction = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_service_action_input) =
    let input = Json_serializers.describe_service_action_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeServiceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_service_action_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_service_action_input) =
    let input = Json_serializers.describe_service_action_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeServiceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_service_action_output_of_yojson
      ~error_deserializer
end

module DescribeServiceActionExecutionParameters = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_service_action_execution_parameters_input) =
    let input =
      Json_serializers.describe_service_action_execution_parameters_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DescribeServiceActionExecutionParameters" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_service_action_execution_parameters_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_service_action_execution_parameters_input) =
    let input =
      Json_serializers.describe_service_action_execution_parameters_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeServiceActionExecutionParameters" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_service_action_execution_parameters_output_of_yojson
      ~error_deserializer
end

module DescribeTagOption = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tag_option_input) =
    let input = Json_serializers.describe_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.DescribeTagOption"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tag_option_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tag_option_input) =
    let input = Json_serializers.describe_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DescribeTagOption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tag_option_output_of_yojson
      ~error_deserializer
end

module DisableAWSOrganizationsAccess = struct
  let error_to_string = function
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_aws_organizations_access_input) =
    let input = Json_serializers.disable_aws_organizations_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DisableAWSOrganizationsAccess" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disable_aws_organizations_access_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_aws_organizations_access_input) =
    let input = Json_serializers.disable_aws_organizations_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DisableAWSOrganizationsAccess" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disable_aws_organizations_access_output_of_yojson
      ~error_deserializer
end

module DisassociateBudgetFromResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_budget_from_resource_input) =
    let input = Json_serializers.disassociate_budget_from_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DisassociateBudgetFromResource" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_budget_from_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_budget_from_resource_input) =
    let input = Json_serializers.disassociate_budget_from_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DisassociateBudgetFromResource" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_budget_from_resource_output_of_yojson
      ~error_deserializer
end

module DisassociatePrincipalFromPortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_principal_from_portfolio_input) =
    let input = Json_serializers.disassociate_principal_from_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DisassociatePrincipalFromPortfolio" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_principal_from_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_principal_from_portfolio_input) =
    let input = Json_serializers.disassociate_principal_from_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DisassociatePrincipalFromPortfolio" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_principal_from_portfolio_output_of_yojson
      ~error_deserializer
end

module DisassociateProductFromPortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceInUseException _ -> "com.amazonaws.servicecatalog#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_product_from_portfolio_input) =
    let input = Json_serializers.disassociate_product_from_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DisassociateProductFromPortfolio" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_product_from_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_product_from_portfolio_input) =
    let input = Json_serializers.disassociate_product_from_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DisassociateProductFromPortfolio" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_product_from_portfolio_output_of_yojson
      ~error_deserializer
end

module DisassociateServiceActionFromProvisioningArtifact = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_service_action_from_provisioning_artifact_input) =
    let input =
      Json_serializers.disassociate_service_action_from_provisioning_artifact_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DisassociateServiceActionFromProvisioningArtifact"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_service_action_from_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : disassociate_service_action_from_provisioning_artifact_input) =
    let input =
      Json_serializers.disassociate_service_action_from_provisioning_artifact_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DisassociateServiceActionFromProvisioningArtifact"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_service_action_from_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module DisassociateTagOptionFromResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_tag_option_from_resource_input) =
    let input = Json_serializers.disassociate_tag_option_from_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.DisassociateTagOptionFromResource" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_tag_option_from_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_tag_option_from_resource_input) =
    let input = Json_serializers.disassociate_tag_option_from_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.DisassociateTagOptionFromResource" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_tag_option_from_resource_output_of_yojson
      ~error_deserializer
end

module EnableAWSOrganizationsAccess = struct
  let error_to_string = function
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_aws_organizations_access_input) =
    let input = Json_serializers.enable_aws_organizations_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.EnableAWSOrganizationsAccess" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.enable_aws_organizations_access_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_aws_organizations_access_input) =
    let input = Json_serializers.enable_aws_organizations_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.EnableAWSOrganizationsAccess" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.enable_aws_organizations_access_output_of_yojson
      ~error_deserializer
end

module ExecuteProvisionedProductPlan = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : execute_provisioned_product_plan_input) =
    let input = Json_serializers.execute_provisioned_product_plan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ExecuteProvisionedProductPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.execute_provisioned_product_plan_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : execute_provisioned_product_plan_input) =
    let input = Json_serializers.execute_provisioned_product_plan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ExecuteProvisionedProductPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.execute_provisioned_product_plan_output_of_yojson
      ~error_deserializer
end

module ExecuteProvisionedProductServiceAction = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : execute_provisioned_product_service_action_input) =
    let input =
      Json_serializers.execute_provisioned_product_service_action_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ExecuteProvisionedProductServiceAction" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.execute_provisioned_product_service_action_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : execute_provisioned_product_service_action_input) =
    let input =
      Json_serializers.execute_provisioned_product_service_action_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ExecuteProvisionedProductServiceAction" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.execute_provisioned_product_service_action_output_of_yojson
      ~error_deserializer
end

module GetAWSOrganizationsAccessStatus = struct
  let error_to_string = function
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_aws_organizations_access_status_input) =
    let input = Json_serializers.get_aws_organizations_access_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.GetAWSOrganizationsAccessStatus" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_aws_organizations_access_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_aws_organizations_access_status_input) =
    let input = Json_serializers.get_aws_organizations_access_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.GetAWSOrganizationsAccessStatus" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_aws_organizations_access_status_output_of_yojson
      ~error_deserializer
end

module GetProvisionedProductOutputs = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_provisioned_product_outputs_input) =
    let input = Json_serializers.get_provisioned_product_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.GetProvisionedProductOutputs" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_provisioned_product_outputs_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_provisioned_product_outputs_input) =
    let input = Json_serializers.get_provisioned_product_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.GetProvisionedProductOutputs" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_provisioned_product_outputs_output_of_yojson
      ~error_deserializer
end

module ImportAsProvisionedProduct = struct
  let error_to_string = function
    | `DuplicateResourceException _ -> "com.amazonaws.servicecatalog#DuplicateResourceException"
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateResourceException" ->
          `DuplicateResourceException
            (Json_deserializers.duplicate_resource_exception_of_yojson tree path)
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_as_provisioned_product_input) =
    let input = Json_serializers.import_as_provisioned_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ImportAsProvisionedProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_as_provisioned_product_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_as_provisioned_product_input) =
    let input = Json_serializers.import_as_provisioned_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ImportAsProvisionedProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_as_provisioned_product_output_of_yojson
      ~error_deserializer
end

module ListAcceptedPortfolioShares = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_accepted_portfolio_shares_input) =
    let input = Json_serializers.list_accepted_portfolio_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListAcceptedPortfolioShares" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accepted_portfolio_shares_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_accepted_portfolio_shares_input) =
    let input = Json_serializers.list_accepted_portfolio_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListAcceptedPortfolioShares" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accepted_portfolio_shares_output_of_yojson
      ~error_deserializer
end

module ListBudgetsForResource = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_budgets_for_resource_input) =
    let input = Json_serializers.list_budgets_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListBudgetsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_budgets_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_budgets_for_resource_input) =
    let input = Json_serializers.list_budgets_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListBudgetsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_budgets_for_resource_output_of_yojson
      ~error_deserializer
end

module ListConstraintsForPortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_constraints_for_portfolio_input) =
    let input = Json_serializers.list_constraints_for_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListConstraintsForPortfolio" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_constraints_for_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_constraints_for_portfolio_input) =
    let input = Json_serializers.list_constraints_for_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListConstraintsForPortfolio" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_constraints_for_portfolio_output_of_yojson
      ~error_deserializer
end

module ListLaunchPaths = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_launch_paths_input) =
    let input = Json_serializers.list_launch_paths_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.ListLaunchPaths"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_launch_paths_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_launch_paths_input) =
    let input = Json_serializers.list_launch_paths_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListLaunchPaths" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_launch_paths_output_of_yojson ~error_deserializer
end

module ListOrganizationPortfolioAccess = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_organization_portfolio_access_input) =
    let input = Json_serializers.list_organization_portfolio_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListOrganizationPortfolioAccess" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_organization_portfolio_access_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_organization_portfolio_access_input) =
    let input = Json_serializers.list_organization_portfolio_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListOrganizationPortfolioAccess" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_organization_portfolio_access_output_of_yojson
      ~error_deserializer
end

module ListPortfolioAccess = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_portfolio_access_input) =
    let input = Json_serializers.list_portfolio_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListPortfolioAccess" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_portfolio_access_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_portfolio_access_input) =
    let input = Json_serializers.list_portfolio_access_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListPortfolioAccess" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_portfolio_access_output_of_yojson
      ~error_deserializer
end

module ListPortfolios = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_portfolios_input) =
    let input = Json_serializers.list_portfolios_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.ListPortfolios"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_portfolios_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_portfolios_input) =
    let input = Json_serializers.list_portfolios_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListPortfolios" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_portfolios_output_of_yojson ~error_deserializer
end

module ListPortfoliosForProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_portfolios_for_product_input) =
    let input = Json_serializers.list_portfolios_for_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListPortfoliosForProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_portfolios_for_product_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_portfolios_for_product_input) =
    let input = Json_serializers.list_portfolios_for_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListPortfoliosForProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_portfolios_for_product_output_of_yojson
      ~error_deserializer
end

module ListPrincipalsForPortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_principals_for_portfolio_input) =
    let input = Json_serializers.list_principals_for_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListPrincipalsForPortfolio" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_principals_for_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_principals_for_portfolio_input) =
    let input = Json_serializers.list_principals_for_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListPrincipalsForPortfolio" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_principals_for_portfolio_output_of_yojson
      ~error_deserializer
end

module ListProvisionedProductPlans = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_provisioned_product_plans_input) =
    let input = Json_serializers.list_provisioned_product_plans_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListProvisionedProductPlans" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_provisioned_product_plans_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_provisioned_product_plans_input) =
    let input = Json_serializers.list_provisioned_product_plans_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListProvisionedProductPlans" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_provisioned_product_plans_output_of_yojson
      ~error_deserializer
end

module ListProvisioningArtifacts = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_provisioning_artifacts_input) =
    let input = Json_serializers.list_provisioning_artifacts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListProvisioningArtifacts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_provisioning_artifacts_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_provisioning_artifacts_input) =
    let input = Json_serializers.list_provisioning_artifacts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListProvisioningArtifacts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_provisioning_artifacts_output_of_yojson
      ~error_deserializer
end

module ListProvisioningArtifactsForServiceAction = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_provisioning_artifacts_for_service_action_input) =
    let input =
      Json_serializers.list_provisioning_artifacts_for_service_action_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListProvisioningArtifactsForServiceAction" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_provisioning_artifacts_for_service_action_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_provisioning_artifacts_for_service_action_input)
      =
    let input =
      Json_serializers.list_provisioning_artifacts_for_service_action_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListProvisioningArtifactsForServiceAction" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_provisioning_artifacts_for_service_action_output_of_yojson
      ~error_deserializer
end

module ListRecordHistory = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_record_history_input) =
    let input = Json_serializers.list_record_history_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.ListRecordHistory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_record_history_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_record_history_input) =
    let input = Json_serializers.list_record_history_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListRecordHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_record_history_output_of_yojson
      ~error_deserializer
end

module ListResourcesForTagOption = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resources_for_tag_option_input) =
    let input = Json_serializers.list_resources_for_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListResourcesForTagOption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resources_for_tag_option_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resources_for_tag_option_input) =
    let input = Json_serializers.list_resources_for_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListResourcesForTagOption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resources_for_tag_option_output_of_yojson
      ~error_deserializer
end

module ListServiceActions = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_actions_input) =
    let input = Json_serializers.list_service_actions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.ListServiceActions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_actions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_service_actions_input) =
    let input = Json_serializers.list_service_actions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListServiceActions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_actions_output_of_yojson
      ~error_deserializer
end

module ListServiceActionsForProvisioningArtifact = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_actions_for_provisioning_artifact_input) =
    let input =
      Json_serializers.list_service_actions_for_provisioning_artifact_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListServiceActionsForProvisioningArtifact" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_service_actions_for_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_service_actions_for_provisioning_artifact_input)
      =
    let input =
      Json_serializers.list_service_actions_for_provisioning_artifact_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListServiceActionsForProvisioningArtifact" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_service_actions_for_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module ListStackInstancesForProvisionedProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_stack_instances_for_provisioned_product_input) =
    let input =
      Json_serializers.list_stack_instances_for_provisioned_product_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ListStackInstancesForProvisionedProduct" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_stack_instances_for_provisioned_product_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_stack_instances_for_provisioned_product_input) =
    let input =
      Json_serializers.list_stack_instances_for_provisioned_product_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListStackInstancesForProvisionedProduct" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_stack_instances_for_provisioned_product_output_of_yojson
      ~error_deserializer
end

module ListTagOptions = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tag_options_input) =
    let input = Json_serializers.list_tag_options_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.ListTagOptions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tag_options_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_tag_options_input) =
    let input = Json_serializers.list_tag_options_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ListTagOptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tag_options_output_of_yojson ~error_deserializer
end

module NotifyProvisionProductEngineWorkflowResult = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : notify_provision_product_engine_workflow_result_input) =
    let input =
      Json_serializers.notify_provision_product_engine_workflow_result_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.NotifyProvisionProductEngineWorkflowResult" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.notify_provision_product_engine_workflow_result_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : notify_provision_product_engine_workflow_result_input) =
    let input =
      Json_serializers.notify_provision_product_engine_workflow_result_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.NotifyProvisionProductEngineWorkflowResult" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.notify_provision_product_engine_workflow_result_output_of_yojson
      ~error_deserializer
end

module NotifyTerminateProvisionedProductEngineWorkflowResult = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : notify_terminate_provisioned_product_engine_workflow_result_input)
      =
    let input =
      Json_serializers.notify_terminate_provisioned_product_engine_workflow_result_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:
        "AWS242ServiceCatalogService.NotifyTerminateProvisionedProductEngineWorkflowResult"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .notify_terminate_provisioned_product_engine_workflow_result_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : notify_terminate_provisioned_product_engine_workflow_result_input) =
    let input =
      Json_serializers.notify_terminate_provisioned_product_engine_workflow_result_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:
        "AWS242ServiceCatalogService.NotifyTerminateProvisionedProductEngineWorkflowResult"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .notify_terminate_provisioned_product_engine_workflow_result_output_of_yojson
      ~error_deserializer
end

module NotifyUpdateProvisionedProductEngineWorkflowResult = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : notify_update_provisioned_product_engine_workflow_result_input) =
    let input =
      Json_serializers.notify_update_provisioned_product_engine_workflow_result_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.NotifyUpdateProvisionedProductEngineWorkflowResult"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.notify_update_provisioned_product_engine_workflow_result_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : notify_update_provisioned_product_engine_workflow_result_input) =
    let input =
      Json_serializers.notify_update_provisioned_product_engine_workflow_result_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.NotifyUpdateProvisionedProductEngineWorkflowResult"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.notify_update_provisioned_product_engine_workflow_result_output_of_yojson
      ~error_deserializer
end

module ProvisionProduct = struct
  let error_to_string = function
    | `DuplicateResourceException _ -> "com.amazonaws.servicecatalog#DuplicateResourceException"
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateResourceException" ->
          `DuplicateResourceException
            (Json_deserializers.duplicate_resource_exception_of_yojson tree path)
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : provision_product_input) =
    let input = Json_serializers.provision_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.ProvisionProduct"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.provision_product_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : provision_product_input) =
    let input = Json_serializers.provision_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ProvisionProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.provision_product_output_of_yojson ~error_deserializer
end

module RejectPortfolioShare = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_portfolio_share_input) =
    let input = Json_serializers.reject_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.RejectPortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_portfolio_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_portfolio_share_input) =
    let input = Json_serializers.reject_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.RejectPortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_portfolio_share_output_of_yojson
      ~error_deserializer
end

module ScanProvisionedProducts = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : scan_provisioned_products_input) =
    let input = Json_serializers.scan_provisioned_products_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.ScanProvisionedProducts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.scan_provisioned_products_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : scan_provisioned_products_input) =
    let input = Json_serializers.scan_provisioned_products_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.ScanProvisionedProducts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.scan_provisioned_products_output_of_yojson
      ~error_deserializer
end

module SearchProducts = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_products_input) =
    let input = Json_serializers.search_products_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.SearchProducts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_products_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : search_products_input) =
    let input = Json_serializers.search_products_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.SearchProducts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_products_output_of_yojson ~error_deserializer
end

module SearchProductsAsAdmin = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_products_as_admin_input) =
    let input = Json_serializers.search_products_as_admin_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.SearchProductsAsAdmin" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_products_as_admin_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_products_as_admin_input) =
    let input = Json_serializers.search_products_as_admin_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.SearchProductsAsAdmin" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_products_as_admin_output_of_yojson
      ~error_deserializer
end

module SearchProvisionedProducts = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_provisioned_products_input) =
    let input = Json_serializers.search_provisioned_products_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.SearchProvisionedProducts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_provisioned_products_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_provisioned_products_input) =
    let input = Json_serializers.search_provisioned_products_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.SearchProvisionedProducts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_provisioned_products_output_of_yojson
      ~error_deserializer
end

module TerminateProvisionedProduct = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_provisioned_product_input) =
    let input = Json_serializers.terminate_provisioned_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.TerminateProvisionedProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_provisioned_product_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_provisioned_product_input) =
    let input = Json_serializers.terminate_provisioned_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.TerminateProvisionedProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_provisioned_product_output_of_yojson
      ~error_deserializer
end

module UpdateConstraint = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_constraint_input) =
    let input = Json_serializers.update_constraint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.UpdateConstraint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_constraint_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_constraint_input) =
    let input = Json_serializers.update_constraint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdateConstraint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_constraint_output_of_yojson ~error_deserializer
end

module UpdatePortfolio = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `LimitExceededException _ -> "com.amazonaws.servicecatalog#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_portfolio_input) =
    let input = Json_serializers.update_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.UpdatePortfolio"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_portfolio_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_portfolio_input) =
    let input = Json_serializers.update_portfolio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdatePortfolio" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_portfolio_output_of_yojson ~error_deserializer
end

module UpdatePortfolioShare = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `OperationNotSupportedException _ ->
        "com.amazonaws.servicecatalog#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_portfolio_share_input) =
    let input = Json_serializers.update_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.UpdatePortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_portfolio_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_portfolio_share_input) =
    let input = Json_serializers.update_portfolio_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdatePortfolioShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_portfolio_share_output_of_yojson
      ~error_deserializer
end

module UpdateProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_product_input) =
    let input = Json_serializers.update_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.UpdateProduct"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_product_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_product_input) =
    let input = Json_serializers.update_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdateProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_product_output_of_yojson ~error_deserializer
end

module UpdateProvisionedProduct = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_provisioned_product_input) =
    let input = Json_serializers.update_provisioned_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.UpdateProvisionedProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_provisioned_product_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_provisioned_product_input) =
    let input = Json_serializers.update_provisioned_product_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdateProvisionedProduct" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_provisioned_product_output_of_yojson
      ~error_deserializer
end

module UpdateProvisionedProductProperties = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `InvalidStateException _ -> "com.amazonaws.servicecatalog#InvalidStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_provisioned_product_properties_input) =
    let input = Json_serializers.update_provisioned_product_properties_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.UpdateProvisionedProductProperties" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_provisioned_product_properties_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_provisioned_product_properties_input) =
    let input = Json_serializers.update_provisioned_product_properties_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdateProvisionedProductProperties" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_provisioned_product_properties_output_of_yojson
      ~error_deserializer
end

module UpdateProvisioningArtifact = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_provisioning_artifact_input) =
    let input = Json_serializers.update_provisioning_artifact_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.UpdateProvisioningArtifact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_provisioning_artifact_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_provisioning_artifact_input) =
    let input = Json_serializers.update_provisioning_artifact_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdateProvisioningArtifact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_provisioning_artifact_output_of_yojson
      ~error_deserializer
end

module UpdateServiceAction = struct
  let error_to_string = function
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_action_input) =
    let input = Json_serializers.update_service_action_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWS242ServiceCatalogService.UpdateServiceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_action_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_service_action_input) =
    let input = Json_serializers.update_service_action_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdateServiceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_action_output_of_yojson
      ~error_deserializer
end

module UpdateTagOption = struct
  let error_to_string = function
    | `DuplicateResourceException _ -> "com.amazonaws.servicecatalog#DuplicateResourceException"
    | `InvalidParametersException _ -> "com.amazonaws.servicecatalog#InvalidParametersException"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicecatalog#ResourceNotFoundException"
    | `TagOptionNotMigratedException _ ->
        "com.amazonaws.servicecatalog#TagOptionNotMigratedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateResourceException" ->
          `DuplicateResourceException
            (Json_deserializers.duplicate_resource_exception_of_yojson tree path)
      | _, "InvalidParametersException" ->
          `InvalidParametersException
            (Json_deserializers.invalid_parameters_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagOptionNotMigratedException" ->
          `TagOptionNotMigratedException
            (Json_deserializers.tag_option_not_migrated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_tag_option_input) =
    let input = Json_serializers.update_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWS242ServiceCatalogService.UpdateTagOption"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_tag_option_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_tag_option_input) =
    let input = Json_serializers.update_tag_option_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWS242ServiceCatalogService.UpdateTagOption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_tag_option_output_of_yojson ~error_deserializer
end
