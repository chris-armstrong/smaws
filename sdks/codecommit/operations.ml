open Types
open Service_metadata

module AssociateApprovalRuleTemplateWithRepository = struct
  let error_to_string = function
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `MaximumRuleTemplatesAssociatedWithRepositoryException _ ->
        "com.amazonaws.codecommit#MaximumRuleTemplatesAssociatedWithRepositoryException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "MaximumRuleTemplatesAssociatedWithRepositoryException" ->
          `MaximumRuleTemplatesAssociatedWithRepositoryException
            (Json_deserializers
             .maximum_rule_templates_associated_with_repository_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_approval_rule_template_with_repository_input) =
    let input =
      Json_serializers.associate_approval_rule_template_with_repository_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.AssociateApprovalRuleTemplateWithRepository" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : associate_approval_rule_template_with_repository_input) =
    let input =
      Json_serializers.associate_approval_rule_template_with_repository_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.AssociateApprovalRuleTemplateWithRepository" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module BatchAssociateApprovalRuleTemplateWithRepositories = struct
  let error_to_string = function
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | `MaximumRepositoryNamesExceededException _ ->
        "com.amazonaws.codecommit#MaximumRepositoryNamesExceededException"
    | `RepositoryNamesRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNamesRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _, "MaximumRepositoryNamesExceededException" ->
          `MaximumRepositoryNamesExceededException
            (Json_deserializers.maximum_repository_names_exceeded_exception_of_yojson tree path)
      | _, "RepositoryNamesRequiredException" ->
          `RepositoryNamesRequiredException
            (Json_deserializers.repository_names_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_associate_approval_rule_template_with_repositories_input) =
    let input =
      Json_serializers.batch_associate_approval_rule_template_with_repositories_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.BatchAssociateApprovalRuleTemplateWithRepositories" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_associate_approval_rule_template_with_repositories_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_associate_approval_rule_template_with_repositories_input) =
    let input =
      Json_serializers.batch_associate_approval_rule_template_with_repositories_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.BatchAssociateApprovalRuleTemplateWithRepositories" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_associate_approval_rule_template_with_repositories_output_of_yojson
      ~error_deserializer
end

module BatchDescribeMergeConflicts = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxConflictFilesException _ ->
        "com.amazonaws.codecommit#InvalidMaxConflictFilesException"
    | `InvalidMaxMergeHunksException _ -> "com.amazonaws.codecommit#InvalidMaxMergeHunksException"
    | `InvalidMergeOptionException _ -> "com.amazonaws.codecommit#InvalidMergeOptionException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `MergeOptionRequiredException _ -> "com.amazonaws.codecommit#MergeOptionRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxConflictFilesException" ->
          `InvalidMaxConflictFilesException
            (Json_deserializers.invalid_max_conflict_files_exception_of_yojson tree path)
      | _, "InvalidMaxMergeHunksException" ->
          `InvalidMaxMergeHunksException
            (Json_deserializers.invalid_max_merge_hunks_exception_of_yojson tree path)
      | _, "InvalidMergeOptionException" ->
          `InvalidMergeOptionException
            (Json_deserializers.invalid_merge_option_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "MergeOptionRequiredException" ->
          `MergeOptionRequiredException
            (Json_deserializers.merge_option_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_describe_merge_conflicts_input) =
    let input = Json_serializers.batch_describe_merge_conflicts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.BatchDescribeMergeConflicts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_describe_merge_conflicts_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_describe_merge_conflicts_input) =
    let input = Json_serializers.batch_describe_merge_conflicts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.BatchDescribeMergeConflicts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_describe_merge_conflicts_output_of_yojson
      ~error_deserializer
end

module BatchDisassociateApprovalRuleTemplateFromRepositories = struct
  let error_to_string = function
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | `MaximumRepositoryNamesExceededException _ ->
        "com.amazonaws.codecommit#MaximumRepositoryNamesExceededException"
    | `RepositoryNamesRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNamesRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _, "MaximumRepositoryNamesExceededException" ->
          `MaximumRepositoryNamesExceededException
            (Json_deserializers.maximum_repository_names_exceeded_exception_of_yojson tree path)
      | _, "RepositoryNamesRequiredException" ->
          `RepositoryNamesRequiredException
            (Json_deserializers.repository_names_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_disassociate_approval_rule_template_from_repositories_input)
      =
    let input =
      Json_serializers.batch_disassociate_approval_rule_template_from_repositories_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.BatchDisassociateApprovalRuleTemplateFromRepositories"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .batch_disassociate_approval_rule_template_from_repositories_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_disassociate_approval_rule_template_from_repositories_input) =
    let input =
      Json_serializers.batch_disassociate_approval_rule_template_from_repositories_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.BatchDisassociateApprovalRuleTemplateFromRepositories"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .batch_disassociate_approval_rule_template_from_repositories_output_of_yojson
      ~error_deserializer
end

module BatchGetCommits = struct
  let error_to_string = function
    | `CommitIdsLimitExceededException _ ->
        "com.amazonaws.codecommit#CommitIdsLimitExceededException"
    | `CommitIdsListRequiredException _ -> "com.amazonaws.codecommit#CommitIdsListRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitIdsLimitExceededException" ->
          `CommitIdsLimitExceededException
            (Json_deserializers.commit_ids_limit_exceeded_exception_of_yojson tree path)
      | _, "CommitIdsListRequiredException" ->
          `CommitIdsListRequiredException
            (Json_deserializers.commit_ids_list_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_commits_input) =
    let input = Json_serializers.batch_get_commits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.BatchGetCommits" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_commits_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_commits_input) =
    let input = Json_serializers.batch_get_commits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.BatchGetCommits" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_commits_output_of_yojson ~error_deserializer
end

module BatchGetRepositories = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `MaximumRepositoryNamesExceededException _ ->
        "com.amazonaws.codecommit#MaximumRepositoryNamesExceededException"
    | `RepositoryNamesRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNamesRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "MaximumRepositoryNamesExceededException" ->
          `MaximumRepositoryNamesExceededException
            (Json_deserializers.maximum_repository_names_exceeded_exception_of_yojson tree path)
      | _, "RepositoryNamesRequiredException" ->
          `RepositoryNamesRequiredException
            (Json_deserializers.repository_names_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_repositories_input) =
    let input = Json_serializers.batch_get_repositories_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.BatchGetRepositories"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_repositories_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_repositories_input) =
    let input = Json_serializers.batch_get_repositories_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.BatchGetRepositories" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_repositories_output_of_yojson
      ~error_deserializer
end

module CreateApprovalRuleTemplate = struct
  let error_to_string = function
    | `ApprovalRuleTemplateContentRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateContentRequiredException"
    | `ApprovalRuleTemplateNameAlreadyExistsException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameAlreadyExistsException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `InvalidApprovalRuleTemplateContentException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateContentException"
    | `InvalidApprovalRuleTemplateDescriptionException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateDescriptionException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | `NumberOfRuleTemplatesExceededException _ ->
        "com.amazonaws.codecommit#NumberOfRuleTemplatesExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateContentRequiredException" ->
          `ApprovalRuleTemplateContentRequiredException
            (Json_deserializers.approval_rule_template_content_required_exception_of_yojson tree
               path)
      | _, "ApprovalRuleTemplateNameAlreadyExistsException" ->
          `ApprovalRuleTemplateNameAlreadyExistsException
            (Json_deserializers.approval_rule_template_name_already_exists_exception_of_yojson tree
               path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateContentException" ->
          `InvalidApprovalRuleTemplateContentException
            (Json_deserializers.invalid_approval_rule_template_content_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateDescriptionException" ->
          `InvalidApprovalRuleTemplateDescriptionException
            (Json_deserializers.invalid_approval_rule_template_description_exception_of_yojson tree
               path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _, "NumberOfRuleTemplatesExceededException" ->
          `NumberOfRuleTemplatesExceededException
            (Json_deserializers.number_of_rule_templates_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_approval_rule_template_input) =
    let input = Json_serializers.create_approval_rule_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.CreateApprovalRuleTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_approval_rule_template_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_approval_rule_template_input) =
    let input = Json_serializers.create_approval_rule_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.CreateApprovalRuleTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_approval_rule_template_output_of_yojson
      ~error_deserializer
end

module CreateBranch = struct
  let error_to_string = function
    | `BranchNameExistsException _ -> "com.amazonaws.codecommit#BranchNameExistsException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitIdRequiredException _ -> "com.amazonaws.codecommit#CommitIdRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchNameExistsException" ->
          `BranchNameExistsException
            (Json_deserializers.branch_name_exists_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitIdRequiredException" ->
          `CommitIdRequiredException
            (Json_deserializers.commit_id_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_branch_input) =
    let input = Json_serializers.create_branch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.CreateBranch" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_branch_input) =
    let input = Json_serializers.create_branch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.CreateBranch"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateCommit = struct
  let error_to_string = function
    | `BranchDoesNotExistException _ -> "com.amazonaws.codecommit#BranchDoesNotExistException"
    | `BranchNameIsTagNameException _ -> "com.amazonaws.codecommit#BranchNameIsTagNameException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `CommitMessageLengthExceededException _ ->
        "com.amazonaws.codecommit#CommitMessageLengthExceededException"
    | `DirectoryNameConflictsWithFileNameException _ ->
        "com.amazonaws.codecommit#DirectoryNameConflictsWithFileNameException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileContentAndSourceFileSpecifiedException _ ->
        "com.amazonaws.codecommit#FileContentAndSourceFileSpecifiedException"
    | `FileContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FileContentSizeLimitExceededException"
    | `FileDoesNotExistException _ -> "com.amazonaws.codecommit#FileDoesNotExistException"
    | `FileEntryRequiredException _ -> "com.amazonaws.codecommit#FileEntryRequiredException"
    | `FileModeRequiredException _ -> "com.amazonaws.codecommit#FileModeRequiredException"
    | `FileNameConflictsWithDirectoryNameException _ ->
        "com.amazonaws.codecommit#FileNameConflictsWithDirectoryNameException"
    | `FilePathConflictsWithSubmodulePathException _ ->
        "com.amazonaws.codecommit#FilePathConflictsWithSubmodulePathException"
    | `FolderContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FolderContentSizeLimitExceededException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidDeletionParameterException _ ->
        "com.amazonaws.codecommit#InvalidDeletionParameterException"
    | `InvalidEmailException _ -> "com.amazonaws.codecommit#InvalidEmailException"
    | `InvalidFileModeException _ -> "com.amazonaws.codecommit#InvalidFileModeException"
    | `InvalidParentCommitIdException _ -> "com.amazonaws.codecommit#InvalidParentCommitIdException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `MaximumFileEntriesExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileEntriesExceededException"
    | `NameLengthExceededException _ -> "com.amazonaws.codecommit#NameLengthExceededException"
    | `NoChangeException _ -> "com.amazonaws.codecommit#NoChangeException"
    | `ParentCommitDoesNotExistException _ ->
        "com.amazonaws.codecommit#ParentCommitDoesNotExistException"
    | `ParentCommitIdOutdatedException _ ->
        "com.amazonaws.codecommit#ParentCommitIdOutdatedException"
    | `ParentCommitIdRequiredException _ ->
        "com.amazonaws.codecommit#ParentCommitIdRequiredException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `PutFileEntryConflictException _ -> "com.amazonaws.codecommit#PutFileEntryConflictException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `RestrictedSourceFileException _ -> "com.amazonaws.codecommit#RestrictedSourceFileException"
    | `SamePathRequestException _ -> "com.amazonaws.codecommit#SamePathRequestException"
    | `SourceFileOrContentRequiredException _ ->
        "com.amazonaws.codecommit#SourceFileOrContentRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchDoesNotExistException" ->
          `BranchDoesNotExistException
            (Json_deserializers.branch_does_not_exist_exception_of_yojson tree path)
      | _, "BranchNameIsTagNameException" ->
          `BranchNameIsTagNameException
            (Json_deserializers.branch_name_is_tag_name_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "CommitMessageLengthExceededException" ->
          `CommitMessageLengthExceededException
            (Json_deserializers.commit_message_length_exceeded_exception_of_yojson tree path)
      | _, "DirectoryNameConflictsWithFileNameException" ->
          `DirectoryNameConflictsWithFileNameException
            (Json_deserializers.directory_name_conflicts_with_file_name_exception_of_yojson tree
               path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileContentAndSourceFileSpecifiedException" ->
          `FileContentAndSourceFileSpecifiedException
            (Json_deserializers.file_content_and_source_file_specified_exception_of_yojson tree path)
      | _, "FileContentSizeLimitExceededException" ->
          `FileContentSizeLimitExceededException
            (Json_deserializers.file_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "FileDoesNotExistException" ->
          `FileDoesNotExistException
            (Json_deserializers.file_does_not_exist_exception_of_yojson tree path)
      | _, "FileEntryRequiredException" ->
          `FileEntryRequiredException
            (Json_deserializers.file_entry_required_exception_of_yojson tree path)
      | _, "FileModeRequiredException" ->
          `FileModeRequiredException
            (Json_deserializers.file_mode_required_exception_of_yojson tree path)
      | _, "FileNameConflictsWithDirectoryNameException" ->
          `FileNameConflictsWithDirectoryNameException
            (Json_deserializers.file_name_conflicts_with_directory_name_exception_of_yojson tree
               path)
      | _, "FilePathConflictsWithSubmodulePathException" ->
          `FilePathConflictsWithSubmodulePathException
            (Json_deserializers.file_path_conflicts_with_submodule_path_exception_of_yojson tree
               path)
      | _, "FolderContentSizeLimitExceededException" ->
          `FolderContentSizeLimitExceededException
            (Json_deserializers.folder_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidDeletionParameterException" ->
          `InvalidDeletionParameterException
            (Json_deserializers.invalid_deletion_parameter_exception_of_yojson tree path)
      | _, "InvalidEmailException" ->
          `InvalidEmailException (Json_deserializers.invalid_email_exception_of_yojson tree path)
      | _, "InvalidFileModeException" ->
          `InvalidFileModeException
            (Json_deserializers.invalid_file_mode_exception_of_yojson tree path)
      | _, "InvalidParentCommitIdException" ->
          `InvalidParentCommitIdException
            (Json_deserializers.invalid_parent_commit_id_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "MaximumFileEntriesExceededException" ->
          `MaximumFileEntriesExceededException
            (Json_deserializers.maximum_file_entries_exceeded_exception_of_yojson tree path)
      | _, "NameLengthExceededException" ->
          `NameLengthExceededException
            (Json_deserializers.name_length_exceeded_exception_of_yojson tree path)
      | _, "NoChangeException" ->
          `NoChangeException (Json_deserializers.no_change_exception_of_yojson tree path)
      | _, "ParentCommitDoesNotExistException" ->
          `ParentCommitDoesNotExistException
            (Json_deserializers.parent_commit_does_not_exist_exception_of_yojson tree path)
      | _, "ParentCommitIdOutdatedException" ->
          `ParentCommitIdOutdatedException
            (Json_deserializers.parent_commit_id_outdated_exception_of_yojson tree path)
      | _, "ParentCommitIdRequiredException" ->
          `ParentCommitIdRequiredException
            (Json_deserializers.parent_commit_id_required_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "PutFileEntryConflictException" ->
          `PutFileEntryConflictException
            (Json_deserializers.put_file_entry_conflict_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "RestrictedSourceFileException" ->
          `RestrictedSourceFileException
            (Json_deserializers.restricted_source_file_exception_of_yojson tree path)
      | _, "SamePathRequestException" ->
          `SamePathRequestException
            (Json_deserializers.same_path_request_exception_of_yojson tree path)
      | _, "SourceFileOrContentRequiredException" ->
          `SourceFileOrContentRequiredException
            (Json_deserializers.source_file_or_content_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_commit_input) =
    let input = Json_serializers.create_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.CreateCommit" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_commit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_commit_input) =
    let input = Json_serializers.create_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.CreateCommit"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_commit_output_of_yojson ~error_deserializer
end

module CreatePullRequest = struct
  let error_to_string = function
    | `ClientRequestTokenRequiredException _ ->
        "com.amazonaws.codecommit#ClientRequestTokenRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `IdempotencyParameterMismatchException _ ->
        "com.amazonaws.codecommit#IdempotencyParameterMismatchException"
    | `InvalidClientRequestTokenException _ ->
        "com.amazonaws.codecommit#InvalidClientRequestTokenException"
    | `InvalidDescriptionException _ -> "com.amazonaws.codecommit#InvalidDescriptionException"
    | `InvalidReferenceNameException _ -> "com.amazonaws.codecommit#InvalidReferenceNameException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidTargetException _ -> "com.amazonaws.codecommit#InvalidTargetException"
    | `InvalidTargetsException _ -> "com.amazonaws.codecommit#InvalidTargetsException"
    | `InvalidTitleException _ -> "com.amazonaws.codecommit#InvalidTitleException"
    | `MaximumOpenPullRequestsExceededException _ ->
        "com.amazonaws.codecommit#MaximumOpenPullRequestsExceededException"
    | `MultipleRepositoriesInPullRequestException _ ->
        "com.amazonaws.codecommit#MultipleRepositoriesInPullRequestException"
    | `ReferenceDoesNotExistException _ -> "com.amazonaws.codecommit#ReferenceDoesNotExistException"
    | `ReferenceNameRequiredException _ -> "com.amazonaws.codecommit#ReferenceNameRequiredException"
    | `ReferenceTypeNotSupportedException _ ->
        "com.amazonaws.codecommit#ReferenceTypeNotSupportedException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `SourceAndDestinationAreSameException _ ->
        "com.amazonaws.codecommit#SourceAndDestinationAreSameException"
    | `TargetRequiredException _ -> "com.amazonaws.codecommit#TargetRequiredException"
    | `TargetsRequiredException _ -> "com.amazonaws.codecommit#TargetsRequiredException"
    | `TitleRequiredException _ -> "com.amazonaws.codecommit#TitleRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientRequestTokenRequiredException" ->
          `ClientRequestTokenRequiredException
            (Json_deserializers.client_request_token_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "IdempotencyParameterMismatchException" ->
          `IdempotencyParameterMismatchException
            (Json_deserializers.idempotency_parameter_mismatch_exception_of_yojson tree path)
      | _, "InvalidClientRequestTokenException" ->
          `InvalidClientRequestTokenException
            (Json_deserializers.invalid_client_request_token_exception_of_yojson tree path)
      | _, "InvalidDescriptionException" ->
          `InvalidDescriptionException
            (Json_deserializers.invalid_description_exception_of_yojson tree path)
      | _, "InvalidReferenceNameException" ->
          `InvalidReferenceNameException
            (Json_deserializers.invalid_reference_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidTargetException" ->
          `InvalidTargetException (Json_deserializers.invalid_target_exception_of_yojson tree path)
      | _, "InvalidTargetsException" ->
          `InvalidTargetsException
            (Json_deserializers.invalid_targets_exception_of_yojson tree path)
      | _, "InvalidTitleException" ->
          `InvalidTitleException (Json_deserializers.invalid_title_exception_of_yojson tree path)
      | _, "MaximumOpenPullRequestsExceededException" ->
          `MaximumOpenPullRequestsExceededException
            (Json_deserializers.maximum_open_pull_requests_exceeded_exception_of_yojson tree path)
      | _, "MultipleRepositoriesInPullRequestException" ->
          `MultipleRepositoriesInPullRequestException
            (Json_deserializers.multiple_repositories_in_pull_request_exception_of_yojson tree path)
      | _, "ReferenceDoesNotExistException" ->
          `ReferenceDoesNotExistException
            (Json_deserializers.reference_does_not_exist_exception_of_yojson tree path)
      | _, "ReferenceNameRequiredException" ->
          `ReferenceNameRequiredException
            (Json_deserializers.reference_name_required_exception_of_yojson tree path)
      | _, "ReferenceTypeNotSupportedException" ->
          `ReferenceTypeNotSupportedException
            (Json_deserializers.reference_type_not_supported_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "SourceAndDestinationAreSameException" ->
          `SourceAndDestinationAreSameException
            (Json_deserializers.source_and_destination_are_same_exception_of_yojson tree path)
      | _, "TargetRequiredException" ->
          `TargetRequiredException
            (Json_deserializers.target_required_exception_of_yojson tree path)
      | _, "TargetsRequiredException" ->
          `TargetsRequiredException
            (Json_deserializers.targets_required_exception_of_yojson tree path)
      | _, "TitleRequiredException" ->
          `TitleRequiredException (Json_deserializers.title_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_pull_request_input) =
    let input = Json_serializers.create_pull_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.CreatePullRequest" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_pull_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_pull_request_input) =
    let input = Json_serializers.create_pull_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.CreatePullRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_pull_request_output_of_yojson
      ~error_deserializer
end

module CreatePullRequestApprovalRule = struct
  let error_to_string = function
    | `ApprovalRuleContentRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleContentRequiredException"
    | `ApprovalRuleNameAlreadyExistsException _ ->
        "com.amazonaws.codecommit#ApprovalRuleNameAlreadyExistsException"
    | `ApprovalRuleNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleNameRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalRuleContentException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleContentException"
    | `InvalidApprovalRuleNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleNameException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `NumberOfRulesExceededException _ -> "com.amazonaws.codecommit#NumberOfRulesExceededException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleContentRequiredException" ->
          `ApprovalRuleContentRequiredException
            (Json_deserializers.approval_rule_content_required_exception_of_yojson tree path)
      | _, "ApprovalRuleNameAlreadyExistsException" ->
          `ApprovalRuleNameAlreadyExistsException
            (Json_deserializers.approval_rule_name_already_exists_exception_of_yojson tree path)
      | _, "ApprovalRuleNameRequiredException" ->
          `ApprovalRuleNameRequiredException
            (Json_deserializers.approval_rule_name_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleContentException" ->
          `InvalidApprovalRuleContentException
            (Json_deserializers.invalid_approval_rule_content_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleNameException" ->
          `InvalidApprovalRuleNameException
            (Json_deserializers.invalid_approval_rule_name_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "NumberOfRulesExceededException" ->
          `NumberOfRulesExceededException
            (Json_deserializers.number_of_rules_exceeded_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_pull_request_approval_rule_input) =
    let input = Json_serializers.create_pull_request_approval_rule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.CreatePullRequestApprovalRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_pull_request_approval_rule_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_pull_request_approval_rule_input) =
    let input = Json_serializers.create_pull_request_approval_rule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.CreatePullRequestApprovalRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_pull_request_approval_rule_output_of_yojson
      ~error_deserializer
end

module CreateRepository = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyInvalidIdException _ ->
        "com.amazonaws.codecommit#EncryptionKeyInvalidIdException"
    | `EncryptionKeyInvalidUsageException _ ->
        "com.amazonaws.codecommit#EncryptionKeyInvalidUsageException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryDescriptionException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryDescriptionException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidSystemTagUsageException _ -> "com.amazonaws.codecommit#InvalidSystemTagUsageException"
    | `InvalidTagsMapException _ -> "com.amazonaws.codecommit#InvalidTagsMapException"
    | `OperationNotAllowedException _ -> "com.amazonaws.codecommit#OperationNotAllowedException"
    | `RepositoryLimitExceededException _ ->
        "com.amazonaws.codecommit#RepositoryLimitExceededException"
    | `RepositoryNameExistsException _ -> "com.amazonaws.codecommit#RepositoryNameExistsException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TagPolicyException _ -> "com.amazonaws.codecommit#TagPolicyException"
    | `TooManyTagsException _ -> "com.amazonaws.codecommit#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyInvalidIdException" ->
          `EncryptionKeyInvalidIdException
            (Json_deserializers.encryption_key_invalid_id_exception_of_yojson tree path)
      | _, "EncryptionKeyInvalidUsageException" ->
          `EncryptionKeyInvalidUsageException
            (Json_deserializers.encryption_key_invalid_usage_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryDescriptionException" ->
          `InvalidRepositoryDescriptionException
            (Json_deserializers.invalid_repository_description_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidSystemTagUsageException" ->
          `InvalidSystemTagUsageException
            (Json_deserializers.invalid_system_tag_usage_exception_of_yojson tree path)
      | _, "InvalidTagsMapException" ->
          `InvalidTagsMapException
            (Json_deserializers.invalid_tags_map_exception_of_yojson tree path)
      | _, "OperationNotAllowedException" ->
          `OperationNotAllowedException
            (Json_deserializers.operation_not_allowed_exception_of_yojson tree path)
      | _, "RepositoryLimitExceededException" ->
          `RepositoryLimitExceededException
            (Json_deserializers.repository_limit_exceeded_exception_of_yojson tree path)
      | _, "RepositoryNameExistsException" ->
          `RepositoryNameExistsException
            (Json_deserializers.repository_name_exists_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_repository_input) =
    let input = Json_serializers.create_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.CreateRepository" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_repository_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_repository_input) =
    let input = Json_serializers.create_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.CreateRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_repository_output_of_yojson ~error_deserializer
end

module CreateUnreferencedMergeCommit = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitMessageLengthExceededException _ ->
        "com.amazonaws.codecommit#CommitMessageLengthExceededException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `ConcurrentReferenceUpdateException _ ->
        "com.amazonaws.codecommit#ConcurrentReferenceUpdateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FileContentSizeLimitExceededException"
    | `FileModeRequiredException _ -> "com.amazonaws.codecommit#FileModeRequiredException"
    | `FolderContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FolderContentSizeLimitExceededException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidEmailException _ -> "com.amazonaws.codecommit#InvalidEmailException"
    | `InvalidFileModeException _ -> "com.amazonaws.codecommit#InvalidFileModeException"
    | `InvalidMergeOptionException _ -> "com.amazonaws.codecommit#InvalidMergeOptionException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidReplacementContentException _ ->
        "com.amazonaws.codecommit#InvalidReplacementContentException"
    | `InvalidReplacementTypeException _ ->
        "com.amazonaws.codecommit#InvalidReplacementTypeException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `ManualMergeRequiredException _ -> "com.amazonaws.codecommit#ManualMergeRequiredException"
    | `MaximumConflictResolutionEntriesExceededException _ ->
        "com.amazonaws.codecommit#MaximumConflictResolutionEntriesExceededException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `MergeOptionRequiredException _ -> "com.amazonaws.codecommit#MergeOptionRequiredException"
    | `MultipleConflictResolutionEntriesException _ ->
        "com.amazonaws.codecommit#MultipleConflictResolutionEntriesException"
    | `NameLengthExceededException _ -> "com.amazonaws.codecommit#NameLengthExceededException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `ReplacementContentRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementContentRequiredException"
    | `ReplacementTypeRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementTypeRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitMessageLengthExceededException" ->
          `CommitMessageLengthExceededException
            (Json_deserializers.commit_message_length_exceeded_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "ConcurrentReferenceUpdateException" ->
          `ConcurrentReferenceUpdateException
            (Json_deserializers.concurrent_reference_update_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileContentSizeLimitExceededException" ->
          `FileContentSizeLimitExceededException
            (Json_deserializers.file_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "FileModeRequiredException" ->
          `FileModeRequiredException
            (Json_deserializers.file_mode_required_exception_of_yojson tree path)
      | _, "FolderContentSizeLimitExceededException" ->
          `FolderContentSizeLimitExceededException
            (Json_deserializers.folder_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionException" ->
          `InvalidConflictResolutionException
            (Json_deserializers.invalid_conflict_resolution_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidEmailException" ->
          `InvalidEmailException (Json_deserializers.invalid_email_exception_of_yojson tree path)
      | _, "InvalidFileModeException" ->
          `InvalidFileModeException
            (Json_deserializers.invalid_file_mode_exception_of_yojson tree path)
      | _, "InvalidMergeOptionException" ->
          `InvalidMergeOptionException
            (Json_deserializers.invalid_merge_option_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidReplacementContentException" ->
          `InvalidReplacementContentException
            (Json_deserializers.invalid_replacement_content_exception_of_yojson tree path)
      | _, "InvalidReplacementTypeException" ->
          `InvalidReplacementTypeException
            (Json_deserializers.invalid_replacement_type_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "ManualMergeRequiredException" ->
          `ManualMergeRequiredException
            (Json_deserializers.manual_merge_required_exception_of_yojson tree path)
      | _, "MaximumConflictResolutionEntriesExceededException" ->
          `MaximumConflictResolutionEntriesExceededException
            (Json_deserializers.maximum_conflict_resolution_entries_exceeded_exception_of_yojson
               tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "MergeOptionRequiredException" ->
          `MergeOptionRequiredException
            (Json_deserializers.merge_option_required_exception_of_yojson tree path)
      | _, "MultipleConflictResolutionEntriesException" ->
          `MultipleConflictResolutionEntriesException
            (Json_deserializers.multiple_conflict_resolution_entries_exception_of_yojson tree path)
      | _, "NameLengthExceededException" ->
          `NameLengthExceededException
            (Json_deserializers.name_length_exceeded_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "ReplacementContentRequiredException" ->
          `ReplacementContentRequiredException
            (Json_deserializers.replacement_content_required_exception_of_yojson tree path)
      | _, "ReplacementTypeRequiredException" ->
          `ReplacementTypeRequiredException
            (Json_deserializers.replacement_type_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_unreferenced_merge_commit_input) =
    let input = Json_serializers.create_unreferenced_merge_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.CreateUnreferencedMergeCommit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_unreferenced_merge_commit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_unreferenced_merge_commit_input) =
    let input = Json_serializers.create_unreferenced_merge_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.CreateUnreferencedMergeCommit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_unreferenced_merge_commit_output_of_yojson
      ~error_deserializer
end

module DeleteApprovalRuleTemplate = struct
  let error_to_string = function
    | `ApprovalRuleTemplateInUseException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateInUseException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateInUseException" ->
          `ApprovalRuleTemplateInUseException
            (Json_deserializers.approval_rule_template_in_use_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_approval_rule_template_input) =
    let input = Json_serializers.delete_approval_rule_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.DeleteApprovalRuleTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_approval_rule_template_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_approval_rule_template_input) =
    let input = Json_serializers.delete_approval_rule_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.DeleteApprovalRuleTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_approval_rule_template_output_of_yojson
      ~error_deserializer
end

module DeleteBranch = struct
  let error_to_string = function
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `DefaultBranchCannotBeDeletedException _ ->
        "com.amazonaws.codecommit#DefaultBranchCannotBeDeletedException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "DefaultBranchCannotBeDeletedException" ->
          `DefaultBranchCannotBeDeletedException
            (Json_deserializers.default_branch_cannot_be_deleted_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_branch_input) =
    let input = Json_serializers.delete_branch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.DeleteBranch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_branch_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_branch_input) =
    let input = Json_serializers.delete_branch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.DeleteBranch"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_branch_output_of_yojson ~error_deserializer
end

module DeleteCommentContent = struct
  let error_to_string = function
    | `CommentDeletedException _ -> "com.amazonaws.codecommit#CommentDeletedException"
    | `CommentDoesNotExistException _ -> "com.amazonaws.codecommit#CommentDoesNotExistException"
    | `CommentIdRequiredException _ -> "com.amazonaws.codecommit#CommentIdRequiredException"
    | `InvalidCommentIdException _ -> "com.amazonaws.codecommit#InvalidCommentIdException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommentDeletedException" ->
          `CommentDeletedException
            (Json_deserializers.comment_deleted_exception_of_yojson tree path)
      | _, "CommentDoesNotExistException" ->
          `CommentDoesNotExistException
            (Json_deserializers.comment_does_not_exist_exception_of_yojson tree path)
      | _, "CommentIdRequiredException" ->
          `CommentIdRequiredException
            (Json_deserializers.comment_id_required_exception_of_yojson tree path)
      | _, "InvalidCommentIdException" ->
          `InvalidCommentIdException
            (Json_deserializers.invalid_comment_id_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_comment_content_input) =
    let input = Json_serializers.delete_comment_content_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.DeleteCommentContent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_comment_content_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_comment_content_input) =
    let input = Json_serializers.delete_comment_content_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.DeleteCommentContent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_comment_content_output_of_yojson
      ~error_deserializer
end

module DeleteFile = struct
  let error_to_string = function
    | `BranchDoesNotExistException _ -> "com.amazonaws.codecommit#BranchDoesNotExistException"
    | `BranchNameIsTagNameException _ -> "com.amazonaws.codecommit#BranchNameIsTagNameException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `CommitMessageLengthExceededException _ ->
        "com.amazonaws.codecommit#CommitMessageLengthExceededException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileDoesNotExistException _ -> "com.amazonaws.codecommit#FileDoesNotExistException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidEmailException _ -> "com.amazonaws.codecommit#InvalidEmailException"
    | `InvalidParentCommitIdException _ -> "com.amazonaws.codecommit#InvalidParentCommitIdException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `NameLengthExceededException _ -> "com.amazonaws.codecommit#NameLengthExceededException"
    | `ParentCommitDoesNotExistException _ ->
        "com.amazonaws.codecommit#ParentCommitDoesNotExistException"
    | `ParentCommitIdOutdatedException _ ->
        "com.amazonaws.codecommit#ParentCommitIdOutdatedException"
    | `ParentCommitIdRequiredException _ ->
        "com.amazonaws.codecommit#ParentCommitIdRequiredException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchDoesNotExistException" ->
          `BranchDoesNotExistException
            (Json_deserializers.branch_does_not_exist_exception_of_yojson tree path)
      | _, "BranchNameIsTagNameException" ->
          `BranchNameIsTagNameException
            (Json_deserializers.branch_name_is_tag_name_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "CommitMessageLengthExceededException" ->
          `CommitMessageLengthExceededException
            (Json_deserializers.commit_message_length_exceeded_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileDoesNotExistException" ->
          `FileDoesNotExistException
            (Json_deserializers.file_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidEmailException" ->
          `InvalidEmailException (Json_deserializers.invalid_email_exception_of_yojson tree path)
      | _, "InvalidParentCommitIdException" ->
          `InvalidParentCommitIdException
            (Json_deserializers.invalid_parent_commit_id_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "NameLengthExceededException" ->
          `NameLengthExceededException
            (Json_deserializers.name_length_exceeded_exception_of_yojson tree path)
      | _, "ParentCommitDoesNotExistException" ->
          `ParentCommitDoesNotExistException
            (Json_deserializers.parent_commit_does_not_exist_exception_of_yojson tree path)
      | _, "ParentCommitIdOutdatedException" ->
          `ParentCommitIdOutdatedException
            (Json_deserializers.parent_commit_id_outdated_exception_of_yojson tree path)
      | _, "ParentCommitIdRequiredException" ->
          `ParentCommitIdRequiredException
            (Json_deserializers.parent_commit_id_required_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_file_input) =
    let input = Json_serializers.delete_file_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.DeleteFile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_file_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_file_input) =
    let input = Json_serializers.delete_file_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.DeleteFile"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_file_output_of_yojson
      ~error_deserializer
end

module DeletePullRequestApprovalRule = struct
  let error_to_string = function
    | `ApprovalRuleNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleNameRequiredException"
    | `CannotDeleteApprovalRuleFromTemplateException _ ->
        "com.amazonaws.codecommit#CannotDeleteApprovalRuleFromTemplateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalRuleNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleNameException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleNameRequiredException" ->
          `ApprovalRuleNameRequiredException
            (Json_deserializers.approval_rule_name_required_exception_of_yojson tree path)
      | _, "CannotDeleteApprovalRuleFromTemplateException" ->
          `CannotDeleteApprovalRuleFromTemplateException
            (Json_deserializers.cannot_delete_approval_rule_from_template_exception_of_yojson tree
               path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleNameException" ->
          `InvalidApprovalRuleNameException
            (Json_deserializers.invalid_approval_rule_name_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_pull_request_approval_rule_input) =
    let input = Json_serializers.delete_pull_request_approval_rule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.DeletePullRequestApprovalRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_pull_request_approval_rule_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_pull_request_approval_rule_input) =
    let input = Json_serializers.delete_pull_request_approval_rule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.DeletePullRequestApprovalRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_pull_request_approval_rule_output_of_yojson
      ~error_deserializer
end

module DeleteRepository = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_repository_input) =
    let input = Json_serializers.delete_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.DeleteRepository" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_repository_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_repository_input) =
    let input = Json_serializers.delete_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.DeleteRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_output_of_yojson ~error_deserializer
end

module DescribeMergeConflicts = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileDoesNotExistException _ -> "com.amazonaws.codecommit#FileDoesNotExistException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxMergeHunksException _ -> "com.amazonaws.codecommit#InvalidMaxMergeHunksException"
    | `InvalidMergeOptionException _ -> "com.amazonaws.codecommit#InvalidMergeOptionException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `MergeOptionRequiredException _ -> "com.amazonaws.codecommit#MergeOptionRequiredException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileDoesNotExistException" ->
          `FileDoesNotExistException
            (Json_deserializers.file_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxMergeHunksException" ->
          `InvalidMaxMergeHunksException
            (Json_deserializers.invalid_max_merge_hunks_exception_of_yojson tree path)
      | _, "InvalidMergeOptionException" ->
          `InvalidMergeOptionException
            (Json_deserializers.invalid_merge_option_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "MergeOptionRequiredException" ->
          `MergeOptionRequiredException
            (Json_deserializers.merge_option_required_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_merge_conflicts_input) =
    let input = Json_serializers.describe_merge_conflicts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.DescribeMergeConflicts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_merge_conflicts_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_merge_conflicts_input) =
    let input = Json_serializers.describe_merge_conflicts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.DescribeMergeConflicts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_merge_conflicts_output_of_yojson
      ~error_deserializer
end

module DescribePullRequestEvents = struct
  let error_to_string = function
    | `ActorDoesNotExistException _ -> "com.amazonaws.codecommit#ActorDoesNotExistException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidActorArnException _ -> "com.amazonaws.codecommit#InvalidActorArnException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | `InvalidPullRequestEventTypeException _ ->
        "com.amazonaws.codecommit#InvalidPullRequestEventTypeException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActorDoesNotExistException" ->
          `ActorDoesNotExistException
            (Json_deserializers.actor_does_not_exist_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidActorArnException" ->
          `InvalidActorArnException
            (Json_deserializers.invalid_actor_arn_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidPullRequestEventTypeException" ->
          `InvalidPullRequestEventTypeException
            (Json_deserializers.invalid_pull_request_event_type_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pull_request_events_input) =
    let input = Json_serializers.describe_pull_request_events_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.DescribePullRequestEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_pull_request_events_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pull_request_events_input) =
    let input = Json_serializers.describe_pull_request_events_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.DescribePullRequestEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_pull_request_events_output_of_yojson
      ~error_deserializer
end

module DisassociateApprovalRuleTemplateFromRepository = struct
  let error_to_string = function
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_approval_rule_template_from_repository_input) =
    let input =
      Json_serializers.disassociate_approval_rule_template_from_repository_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.DisassociateApprovalRuleTemplateFromRepository" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : disassociate_approval_rule_template_from_repository_input) =
    let input =
      Json_serializers.disassociate_approval_rule_template_from_repository_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.DisassociateApprovalRuleTemplateFromRepository" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module EvaluatePullRequestApprovalRules = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRevisionIdException _ -> "com.amazonaws.codecommit#InvalidRevisionIdException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `RevisionIdRequiredException _ -> "com.amazonaws.codecommit#RevisionIdRequiredException"
    | `RevisionNotCurrentException _ -> "com.amazonaws.codecommit#RevisionNotCurrentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRevisionIdException" ->
          `InvalidRevisionIdException
            (Json_deserializers.invalid_revision_id_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "RevisionIdRequiredException" ->
          `RevisionIdRequiredException
            (Json_deserializers.revision_id_required_exception_of_yojson tree path)
      | _, "RevisionNotCurrentException" ->
          `RevisionNotCurrentException
            (Json_deserializers.revision_not_current_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : evaluate_pull_request_approval_rules_input) =
    let input = Json_serializers.evaluate_pull_request_approval_rules_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.EvaluatePullRequestApprovalRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.evaluate_pull_request_approval_rules_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : evaluate_pull_request_approval_rules_input) =
    let input = Json_serializers.evaluate_pull_request_approval_rules_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.EvaluatePullRequestApprovalRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.evaluate_pull_request_approval_rules_output_of_yojson
      ~error_deserializer
end

module GetApprovalRuleTemplate = struct
  let error_to_string = function
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_approval_rule_template_input) =
    let input = Json_serializers.get_approval_rule_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetApprovalRuleTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_approval_rule_template_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_approval_rule_template_input) =
    let input = Json_serializers.get_approval_rule_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetApprovalRuleTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_approval_rule_template_output_of_yojson
      ~error_deserializer
end

module GetBlob = struct
  let error_to_string = function
    | `BlobIdDoesNotExistException _ -> "com.amazonaws.codecommit#BlobIdDoesNotExistException"
    | `BlobIdRequiredException _ -> "com.amazonaws.codecommit#BlobIdRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileTooLargeException _ -> "com.amazonaws.codecommit#FileTooLargeException"
    | `InvalidBlobIdException _ -> "com.amazonaws.codecommit#InvalidBlobIdException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BlobIdDoesNotExistException" ->
          `BlobIdDoesNotExistException
            (Json_deserializers.blob_id_does_not_exist_exception_of_yojson tree path)
      | _, "BlobIdRequiredException" ->
          `BlobIdRequiredException
            (Json_deserializers.blob_id_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileTooLargeException" ->
          `FileTooLargeException (Json_deserializers.file_too_large_exception_of_yojson tree path)
      | _, "InvalidBlobIdException" ->
          `InvalidBlobIdException (Json_deserializers.invalid_blob_id_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_blob_input) =
    let input = Json_serializers.get_blob_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetBlob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_blob_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_blob_input) =
    let input = Json_serializers.get_blob_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.GetBlob"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_blob_output_of_yojson
      ~error_deserializer
end

module GetBranch = struct
  let error_to_string = function
    | `BranchDoesNotExistException _ -> "com.amazonaws.codecommit#BranchDoesNotExistException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchDoesNotExistException" ->
          `BranchDoesNotExistException
            (Json_deserializers.branch_does_not_exist_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_branch_input) =
    let input = Json_serializers.get_branch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetBranch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_branch_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_branch_input) =
    let input = Json_serializers.get_branch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.GetBranch"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_branch_output_of_yojson
      ~error_deserializer
end

module GetComment = struct
  let error_to_string = function
    | `CommentDeletedException _ -> "com.amazonaws.codecommit#CommentDeletedException"
    | `CommentDoesNotExistException _ -> "com.amazonaws.codecommit#CommentDoesNotExistException"
    | `CommentIdRequiredException _ -> "com.amazonaws.codecommit#CommentIdRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommentIdException _ -> "com.amazonaws.codecommit#InvalidCommentIdException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommentDeletedException" ->
          `CommentDeletedException
            (Json_deserializers.comment_deleted_exception_of_yojson tree path)
      | _, "CommentDoesNotExistException" ->
          `CommentDoesNotExistException
            (Json_deserializers.comment_does_not_exist_exception_of_yojson tree path)
      | _, "CommentIdRequiredException" ->
          `CommentIdRequiredException
            (Json_deserializers.comment_id_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommentIdException" ->
          `InvalidCommentIdException
            (Json_deserializers.invalid_comment_id_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_comment_input) =
    let input = Json_serializers.get_comment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetComment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_comment_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_comment_input) =
    let input = Json_serializers.get_comment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.GetComment"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_comment_output_of_yojson
      ~error_deserializer
end

module GetCommentReactions = struct
  let error_to_string = function
    | `CommentDeletedException _ -> "com.amazonaws.codecommit#CommentDeletedException"
    | `CommentDoesNotExistException _ -> "com.amazonaws.codecommit#CommentDoesNotExistException"
    | `CommentIdRequiredException _ -> "com.amazonaws.codecommit#CommentIdRequiredException"
    | `InvalidCommentIdException _ -> "com.amazonaws.codecommit#InvalidCommentIdException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | `InvalidReactionUserArnException _ ->
        "com.amazonaws.codecommit#InvalidReactionUserArnException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommentDeletedException" ->
          `CommentDeletedException
            (Json_deserializers.comment_deleted_exception_of_yojson tree path)
      | _, "CommentDoesNotExistException" ->
          `CommentDoesNotExistException
            (Json_deserializers.comment_does_not_exist_exception_of_yojson tree path)
      | _, "CommentIdRequiredException" ->
          `CommentIdRequiredException
            (Json_deserializers.comment_id_required_exception_of_yojson tree path)
      | _, "InvalidCommentIdException" ->
          `InvalidCommentIdException
            (Json_deserializers.invalid_comment_id_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidReactionUserArnException" ->
          `InvalidReactionUserArnException
            (Json_deserializers.invalid_reaction_user_arn_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_comment_reactions_input) =
    let input = Json_serializers.get_comment_reactions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetCommentReactions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_comment_reactions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_comment_reactions_input) =
    let input = Json_serializers.get_comment_reactions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetCommentReactions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_comment_reactions_output_of_yojson
      ~error_deserializer
end

module GetCommentsForComparedCommit = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitIdRequiredException _ -> "com.amazonaws.codecommit#CommitIdRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitIdRequiredException" ->
          `CommitIdRequiredException
            (Json_deserializers.commit_id_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_comments_for_compared_commit_input) =
    let input = Json_serializers.get_comments_for_compared_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.GetCommentsForComparedCommit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_comments_for_compared_commit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_comments_for_compared_commit_input) =
    let input = Json_serializers.get_comments_for_compared_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetCommentsForComparedCommit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_comments_for_compared_commit_output_of_yojson
      ~error_deserializer
end

module GetCommentsForPullRequest = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitIdRequiredException _ -> "com.amazonaws.codecommit#CommitIdRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `RepositoryNotAssociatedWithPullRequestException _ ->
        "com.amazonaws.codecommit#RepositoryNotAssociatedWithPullRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitIdRequiredException" ->
          `CommitIdRequiredException
            (Json_deserializers.commit_id_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "RepositoryNotAssociatedWithPullRequestException" ->
          `RepositoryNotAssociatedWithPullRequestException
            (Json_deserializers.repository_not_associated_with_pull_request_exception_of_yojson tree
               path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_comments_for_pull_request_input) =
    let input = Json_serializers.get_comments_for_pull_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetCommentsForPullRequest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_comments_for_pull_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_comments_for_pull_request_input) =
    let input = Json_serializers.get_comments_for_pull_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetCommentsForPullRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_comments_for_pull_request_output_of_yojson
      ~error_deserializer
end

module GetCommit = struct
  let error_to_string = function
    | `CommitIdDoesNotExistException _ -> "com.amazonaws.codecommit#CommitIdDoesNotExistException"
    | `CommitIdRequiredException _ -> "com.amazonaws.codecommit#CommitIdRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitIdDoesNotExistException" ->
          `CommitIdDoesNotExistException
            (Json_deserializers.commit_id_does_not_exist_exception_of_yojson tree path)
      | _, "CommitIdRequiredException" ->
          `CommitIdRequiredException
            (Json_deserializers.commit_id_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_commit_input) =
    let input = Json_serializers.get_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetCommit" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_commit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_commit_input) =
    let input = Json_serializers.get_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.GetCommit"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_commit_output_of_yojson
      ~error_deserializer
end

module GetDifferences = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `PathDoesNotExistException _ -> "com.amazonaws.codecommit#PathDoesNotExistException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "PathDoesNotExistException" ->
          `PathDoesNotExistException
            (Json_deserializers.path_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_differences_input) =
    let input = Json_serializers.get_differences_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetDifferences" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_differences_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_differences_input) =
    let input = Json_serializers.get_differences_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetDifferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_differences_output_of_yojson ~error_deserializer
end

module GetFile = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileDoesNotExistException _ -> "com.amazonaws.codecommit#FileDoesNotExistException"
    | `FileTooLargeException _ -> "com.amazonaws.codecommit#FileTooLargeException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileDoesNotExistException" ->
          `FileDoesNotExistException
            (Json_deserializers.file_does_not_exist_exception_of_yojson tree path)
      | _, "FileTooLargeException" ->
          `FileTooLargeException (Json_deserializers.file_too_large_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_file_input) =
    let input = Json_serializers.get_file_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetFile" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_file_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_file_input) =
    let input = Json_serializers.get_file_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.GetFile"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_file_output_of_yojson
      ~error_deserializer
end

module GetFolder = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FolderDoesNotExistException _ -> "com.amazonaws.codecommit#FolderDoesNotExistException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FolderDoesNotExistException" ->
          `FolderDoesNotExistException
            (Json_deserializers.folder_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_folder_input) =
    let input = Json_serializers.get_folder_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetFolder" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_folder_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_folder_input) =
    let input = Json_serializers.get_folder_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.GetFolder"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_folder_output_of_yojson
      ~error_deserializer
end

module GetMergeCommit = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_merge_commit_input) =
    let input = Json_serializers.get_merge_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetMergeCommit" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_merge_commit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_merge_commit_input) =
    let input = Json_serializers.get_merge_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetMergeCommit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_merge_commit_output_of_yojson ~error_deserializer
end

module GetMergeConflicts = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidDestinationCommitSpecifierException _ ->
        "com.amazonaws.codecommit#InvalidDestinationCommitSpecifierException"
    | `InvalidMaxConflictFilesException _ ->
        "com.amazonaws.codecommit#InvalidMaxConflictFilesException"
    | `InvalidMergeOptionException _ -> "com.amazonaws.codecommit#InvalidMergeOptionException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidSourceCommitSpecifierException _ ->
        "com.amazonaws.codecommit#InvalidSourceCommitSpecifierException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `MergeOptionRequiredException _ -> "com.amazonaws.codecommit#MergeOptionRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidDestinationCommitSpecifierException" ->
          `InvalidDestinationCommitSpecifierException
            (Json_deserializers.invalid_destination_commit_specifier_exception_of_yojson tree path)
      | _, "InvalidMaxConflictFilesException" ->
          `InvalidMaxConflictFilesException
            (Json_deserializers.invalid_max_conflict_files_exception_of_yojson tree path)
      | _, "InvalidMergeOptionException" ->
          `InvalidMergeOptionException
            (Json_deserializers.invalid_merge_option_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidSourceCommitSpecifierException" ->
          `InvalidSourceCommitSpecifierException
            (Json_deserializers.invalid_source_commit_specifier_exception_of_yojson tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "MergeOptionRequiredException" ->
          `MergeOptionRequiredException
            (Json_deserializers.merge_option_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_merge_conflicts_input) =
    let input = Json_serializers.get_merge_conflicts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetMergeConflicts" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_merge_conflicts_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_merge_conflicts_input) =
    let input = Json_serializers.get_merge_conflicts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetMergeConflicts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_merge_conflicts_output_of_yojson
      ~error_deserializer
end

module GetMergeOptions = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_merge_options_input) =
    let input = Json_serializers.get_merge_options_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetMergeOptions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_merge_options_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_merge_options_input) =
    let input = Json_serializers.get_merge_options_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetMergeOptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_merge_options_output_of_yojson ~error_deserializer
end

module GetPullRequest = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_pull_request_input) =
    let input = Json_serializers.get_pull_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetPullRequest" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_pull_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_pull_request_input) =
    let input = Json_serializers.get_pull_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetPullRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pull_request_output_of_yojson ~error_deserializer
end

module GetPullRequestApprovalStates = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRevisionIdException _ -> "com.amazonaws.codecommit#InvalidRevisionIdException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `RevisionIdRequiredException _ -> "com.amazonaws.codecommit#RevisionIdRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRevisionIdException" ->
          `InvalidRevisionIdException
            (Json_deserializers.invalid_revision_id_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "RevisionIdRequiredException" ->
          `RevisionIdRequiredException
            (Json_deserializers.revision_id_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_pull_request_approval_states_input) =
    let input = Json_serializers.get_pull_request_approval_states_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.GetPullRequestApprovalStates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pull_request_approval_states_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_pull_request_approval_states_input) =
    let input = Json_serializers.get_pull_request_approval_states_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetPullRequestApprovalStates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pull_request_approval_states_output_of_yojson
      ~error_deserializer
end

module GetPullRequestOverrideState = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRevisionIdException _ -> "com.amazonaws.codecommit#InvalidRevisionIdException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `RevisionIdRequiredException _ -> "com.amazonaws.codecommit#RevisionIdRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRevisionIdException" ->
          `InvalidRevisionIdException
            (Json_deserializers.invalid_revision_id_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "RevisionIdRequiredException" ->
          `RevisionIdRequiredException
            (Json_deserializers.revision_id_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_pull_request_override_state_input) =
    let input = Json_serializers.get_pull_request_override_state_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.GetPullRequestOverrideState" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pull_request_override_state_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_pull_request_override_state_input) =
    let input = Json_serializers.get_pull_request_override_state_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetPullRequestOverrideState" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pull_request_override_state_output_of_yojson
      ~error_deserializer
end

module GetRepository = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_input) =
    let input = Json_serializers.get_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetRepository" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_repository_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_repository_input) =
    let input = Json_serializers.get_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_output_of_yojson ~error_deserializer
end

module GetRepositoryTriggers = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_triggers_input) =
    let input = Json_serializers.get_repository_triggers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.GetRepositoryTriggers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_triggers_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_repository_triggers_input) =
    let input = Json_serializers.get_repository_triggers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.GetRepositoryTriggers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_triggers_output_of_yojson
      ~error_deserializer
end

module ListApprovalRuleTemplates = struct
  let error_to_string = function
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_approval_rule_templates_input) =
    let input = Json_serializers.list_approval_rule_templates_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.ListApprovalRuleTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_approval_rule_templates_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_approval_rule_templates_input) =
    let input = Json_serializers.list_approval_rule_templates_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.ListApprovalRuleTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_approval_rule_templates_output_of_yojson
      ~error_deserializer
end

module ListAssociatedApprovalRuleTemplatesForRepository = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_associated_approval_rule_templates_for_repository_input) =
    let input =
      Json_serializers.list_associated_approval_rule_templates_for_repository_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.ListAssociatedApprovalRuleTemplatesForRepository" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_associated_approval_rule_templates_for_repository_output_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_associated_approval_rule_templates_for_repository_input) =
    let input =
      Json_serializers.list_associated_approval_rule_templates_for_repository_input_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.ListAssociatedApprovalRuleTemplatesForRepository" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_associated_approval_rule_templates_for_repository_output_of_yojson
      ~error_deserializer
end

module ListBranches = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_branches_input) =
    let input = Json_serializers.list_branches_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.ListBranches" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_branches_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_branches_input) =
    let input = Json_serializers.list_branches_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.ListBranches"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_branches_output_of_yojson ~error_deserializer
end

module ListFileCommitHistory = struct
  let error_to_string = function
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_file_commit_history_request) =
    let input = Json_serializers.list_file_commit_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.ListFileCommitHistory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_file_commit_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_file_commit_history_request) =
    let input = Json_serializers.list_file_commit_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.ListFileCommitHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_file_commit_history_response_of_yojson
      ~error_deserializer
end

module ListPullRequests = struct
  let error_to_string = function
    | `AuthorDoesNotExistException _ -> "com.amazonaws.codecommit#AuthorDoesNotExistException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidAuthorArnException _ -> "com.amazonaws.codecommit#InvalidAuthorArnException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | `InvalidPullRequestStatusException _ ->
        "com.amazonaws.codecommit#InvalidPullRequestStatusException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorDoesNotExistException" ->
          `AuthorDoesNotExistException
            (Json_deserializers.author_does_not_exist_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidAuthorArnException" ->
          `InvalidAuthorArnException
            (Json_deserializers.invalid_author_arn_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidPullRequestStatusException" ->
          `InvalidPullRequestStatusException
            (Json_deserializers.invalid_pull_request_status_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pull_requests_input) =
    let input = Json_serializers.list_pull_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.ListPullRequests" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_pull_requests_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pull_requests_input) =
    let input = Json_serializers.list_pull_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.ListPullRequests" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pull_requests_output_of_yojson
      ~error_deserializer
end

module ListRepositories = struct
  let error_to_string = function
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidOrderException _ -> "com.amazonaws.codecommit#InvalidOrderException"
    | `InvalidSortByException _ -> "com.amazonaws.codecommit#InvalidSortByException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidOrderException" ->
          `InvalidOrderException (Json_deserializers.invalid_order_exception_of_yojson tree path)
      | _, "InvalidSortByException" ->
          `InvalidSortByException (Json_deserializers.invalid_sort_by_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_repositories_input) =
    let input = Json_serializers.list_repositories_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.ListRepositories" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_repositories_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_repositories_input) =
    let input = Json_serializers.list_repositories_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.ListRepositories" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_repositories_output_of_yojson ~error_deserializer
end

module ListRepositoriesForApprovalRuleTemplate = struct
  let error_to_string = function
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | `InvalidContinuationTokenException _ ->
        "com.amazonaws.codecommit#InvalidContinuationTokenException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.codecommit#InvalidMaxResultsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _, "InvalidContinuationTokenException" ->
          `InvalidContinuationTokenException
            (Json_deserializers.invalid_continuation_token_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_repositories_for_approval_rule_template_input) =
    let input =
      Json_serializers.list_repositories_for_approval_rule_template_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.ListRepositoriesForApprovalRuleTemplate" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_repositories_for_approval_rule_template_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_repositories_for_approval_rule_template_input) =
    let input =
      Json_serializers.list_repositories_for_approval_rule_template_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.ListRepositoriesForApprovalRuleTemplate" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_repositories_for_approval_rule_template_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidResourceArnException _ -> "com.amazonaws.codecommit#InvalidResourceArnException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `ResourceArnRequiredException _ -> "com.amazonaws.codecommit#ResourceArnRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidResourceArnException" ->
          `InvalidResourceArnException
            (Json_deserializers.invalid_resource_arn_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "ResourceArnRequiredException" ->
          `ResourceArnRequiredException
            (Json_deserializers.resource_arn_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module MergeBranchesByFastForward = struct
  let error_to_string = function
    | `BranchDoesNotExistException _ -> "com.amazonaws.codecommit#BranchDoesNotExistException"
    | `BranchNameIsTagNameException _ -> "com.amazonaws.codecommit#BranchNameIsTagNameException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `ConcurrentReferenceUpdateException _ ->
        "com.amazonaws.codecommit#ConcurrentReferenceUpdateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidTargetBranchException _ -> "com.amazonaws.codecommit#InvalidTargetBranchException"
    | `ManualMergeRequiredException _ -> "com.amazonaws.codecommit#ManualMergeRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchDoesNotExistException" ->
          `BranchDoesNotExistException
            (Json_deserializers.branch_does_not_exist_exception_of_yojson tree path)
      | _, "BranchNameIsTagNameException" ->
          `BranchNameIsTagNameException
            (Json_deserializers.branch_name_is_tag_name_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "ConcurrentReferenceUpdateException" ->
          `ConcurrentReferenceUpdateException
            (Json_deserializers.concurrent_reference_update_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidTargetBranchException" ->
          `InvalidTargetBranchException
            (Json_deserializers.invalid_target_branch_exception_of_yojson tree path)
      | _, "ManualMergeRequiredException" ->
          `ManualMergeRequiredException
            (Json_deserializers.manual_merge_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : merge_branches_by_fast_forward_input) =
    let input = Json_serializers.merge_branches_by_fast_forward_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.MergeBranchesByFastForward"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_branches_by_fast_forward_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : merge_branches_by_fast_forward_input) =
    let input = Json_serializers.merge_branches_by_fast_forward_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.MergeBranchesByFastForward" ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_branches_by_fast_forward_output_of_yojson
      ~error_deserializer
end

module MergeBranchesBySquash = struct
  let error_to_string = function
    | `BranchDoesNotExistException _ -> "com.amazonaws.codecommit#BranchDoesNotExistException"
    | `BranchNameIsTagNameException _ -> "com.amazonaws.codecommit#BranchNameIsTagNameException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitMessageLengthExceededException _ ->
        "com.amazonaws.codecommit#CommitMessageLengthExceededException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `ConcurrentReferenceUpdateException _ ->
        "com.amazonaws.codecommit#ConcurrentReferenceUpdateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FileContentSizeLimitExceededException"
    | `FileModeRequiredException _ -> "com.amazonaws.codecommit#FileModeRequiredException"
    | `FolderContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FolderContentSizeLimitExceededException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidEmailException _ -> "com.amazonaws.codecommit#InvalidEmailException"
    | `InvalidFileModeException _ -> "com.amazonaws.codecommit#InvalidFileModeException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidReplacementContentException _ ->
        "com.amazonaws.codecommit#InvalidReplacementContentException"
    | `InvalidReplacementTypeException _ ->
        "com.amazonaws.codecommit#InvalidReplacementTypeException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidTargetBranchException _ -> "com.amazonaws.codecommit#InvalidTargetBranchException"
    | `ManualMergeRequiredException _ -> "com.amazonaws.codecommit#ManualMergeRequiredException"
    | `MaximumConflictResolutionEntriesExceededException _ ->
        "com.amazonaws.codecommit#MaximumConflictResolutionEntriesExceededException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `MultipleConflictResolutionEntriesException _ ->
        "com.amazonaws.codecommit#MultipleConflictResolutionEntriesException"
    | `NameLengthExceededException _ -> "com.amazonaws.codecommit#NameLengthExceededException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `ReplacementContentRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementContentRequiredException"
    | `ReplacementTypeRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementTypeRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchDoesNotExistException" ->
          `BranchDoesNotExistException
            (Json_deserializers.branch_does_not_exist_exception_of_yojson tree path)
      | _, "BranchNameIsTagNameException" ->
          `BranchNameIsTagNameException
            (Json_deserializers.branch_name_is_tag_name_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitMessageLengthExceededException" ->
          `CommitMessageLengthExceededException
            (Json_deserializers.commit_message_length_exceeded_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "ConcurrentReferenceUpdateException" ->
          `ConcurrentReferenceUpdateException
            (Json_deserializers.concurrent_reference_update_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileContentSizeLimitExceededException" ->
          `FileContentSizeLimitExceededException
            (Json_deserializers.file_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "FileModeRequiredException" ->
          `FileModeRequiredException
            (Json_deserializers.file_mode_required_exception_of_yojson tree path)
      | _, "FolderContentSizeLimitExceededException" ->
          `FolderContentSizeLimitExceededException
            (Json_deserializers.folder_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionException" ->
          `InvalidConflictResolutionException
            (Json_deserializers.invalid_conflict_resolution_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidEmailException" ->
          `InvalidEmailException (Json_deserializers.invalid_email_exception_of_yojson tree path)
      | _, "InvalidFileModeException" ->
          `InvalidFileModeException
            (Json_deserializers.invalid_file_mode_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidReplacementContentException" ->
          `InvalidReplacementContentException
            (Json_deserializers.invalid_replacement_content_exception_of_yojson tree path)
      | _, "InvalidReplacementTypeException" ->
          `InvalidReplacementTypeException
            (Json_deserializers.invalid_replacement_type_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidTargetBranchException" ->
          `InvalidTargetBranchException
            (Json_deserializers.invalid_target_branch_exception_of_yojson tree path)
      | _, "ManualMergeRequiredException" ->
          `ManualMergeRequiredException
            (Json_deserializers.manual_merge_required_exception_of_yojson tree path)
      | _, "MaximumConflictResolutionEntriesExceededException" ->
          `MaximumConflictResolutionEntriesExceededException
            (Json_deserializers.maximum_conflict_resolution_entries_exceeded_exception_of_yojson
               tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "MultipleConflictResolutionEntriesException" ->
          `MultipleConflictResolutionEntriesException
            (Json_deserializers.multiple_conflict_resolution_entries_exception_of_yojson tree path)
      | _, "NameLengthExceededException" ->
          `NameLengthExceededException
            (Json_deserializers.name_length_exceeded_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "ReplacementContentRequiredException" ->
          `ReplacementContentRequiredException
            (Json_deserializers.replacement_content_required_exception_of_yojson tree path)
      | _, "ReplacementTypeRequiredException" ->
          `ReplacementTypeRequiredException
            (Json_deserializers.replacement_type_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : merge_branches_by_squash_input) =
    let input = Json_serializers.merge_branches_by_squash_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.MergeBranchesBySquash"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_branches_by_squash_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : merge_branches_by_squash_input) =
    let input = Json_serializers.merge_branches_by_squash_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.MergeBranchesBySquash" ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_branches_by_squash_output_of_yojson
      ~error_deserializer
end

module MergeBranchesByThreeWay = struct
  let error_to_string = function
    | `BranchDoesNotExistException _ -> "com.amazonaws.codecommit#BranchDoesNotExistException"
    | `BranchNameIsTagNameException _ -> "com.amazonaws.codecommit#BranchNameIsTagNameException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitMessageLengthExceededException _ ->
        "com.amazonaws.codecommit#CommitMessageLengthExceededException"
    | `CommitRequiredException _ -> "com.amazonaws.codecommit#CommitRequiredException"
    | `ConcurrentReferenceUpdateException _ ->
        "com.amazonaws.codecommit#ConcurrentReferenceUpdateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FileContentSizeLimitExceededException"
    | `FileModeRequiredException _ -> "com.amazonaws.codecommit#FileModeRequiredException"
    | `FolderContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FolderContentSizeLimitExceededException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidCommitException _ -> "com.amazonaws.codecommit#InvalidCommitException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidEmailException _ -> "com.amazonaws.codecommit#InvalidEmailException"
    | `InvalidFileModeException _ -> "com.amazonaws.codecommit#InvalidFileModeException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidReplacementContentException _ ->
        "com.amazonaws.codecommit#InvalidReplacementContentException"
    | `InvalidReplacementTypeException _ ->
        "com.amazonaws.codecommit#InvalidReplacementTypeException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidTargetBranchException _ -> "com.amazonaws.codecommit#InvalidTargetBranchException"
    | `ManualMergeRequiredException _ -> "com.amazonaws.codecommit#ManualMergeRequiredException"
    | `MaximumConflictResolutionEntriesExceededException _ ->
        "com.amazonaws.codecommit#MaximumConflictResolutionEntriesExceededException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `MultipleConflictResolutionEntriesException _ ->
        "com.amazonaws.codecommit#MultipleConflictResolutionEntriesException"
    | `NameLengthExceededException _ -> "com.amazonaws.codecommit#NameLengthExceededException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `ReplacementContentRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementContentRequiredException"
    | `ReplacementTypeRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementTypeRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchDoesNotExistException" ->
          `BranchDoesNotExistException
            (Json_deserializers.branch_does_not_exist_exception_of_yojson tree path)
      | _, "BranchNameIsTagNameException" ->
          `BranchNameIsTagNameException
            (Json_deserializers.branch_name_is_tag_name_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitMessageLengthExceededException" ->
          `CommitMessageLengthExceededException
            (Json_deserializers.commit_message_length_exceeded_exception_of_yojson tree path)
      | _, "CommitRequiredException" ->
          `CommitRequiredException
            (Json_deserializers.commit_required_exception_of_yojson tree path)
      | _, "ConcurrentReferenceUpdateException" ->
          `ConcurrentReferenceUpdateException
            (Json_deserializers.concurrent_reference_update_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileContentSizeLimitExceededException" ->
          `FileContentSizeLimitExceededException
            (Json_deserializers.file_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "FileModeRequiredException" ->
          `FileModeRequiredException
            (Json_deserializers.file_mode_required_exception_of_yojson tree path)
      | _, "FolderContentSizeLimitExceededException" ->
          `FolderContentSizeLimitExceededException
            (Json_deserializers.folder_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidCommitException" ->
          `InvalidCommitException (Json_deserializers.invalid_commit_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionException" ->
          `InvalidConflictResolutionException
            (Json_deserializers.invalid_conflict_resolution_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidEmailException" ->
          `InvalidEmailException (Json_deserializers.invalid_email_exception_of_yojson tree path)
      | _, "InvalidFileModeException" ->
          `InvalidFileModeException
            (Json_deserializers.invalid_file_mode_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidReplacementContentException" ->
          `InvalidReplacementContentException
            (Json_deserializers.invalid_replacement_content_exception_of_yojson tree path)
      | _, "InvalidReplacementTypeException" ->
          `InvalidReplacementTypeException
            (Json_deserializers.invalid_replacement_type_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidTargetBranchException" ->
          `InvalidTargetBranchException
            (Json_deserializers.invalid_target_branch_exception_of_yojson tree path)
      | _, "ManualMergeRequiredException" ->
          `ManualMergeRequiredException
            (Json_deserializers.manual_merge_required_exception_of_yojson tree path)
      | _, "MaximumConflictResolutionEntriesExceededException" ->
          `MaximumConflictResolutionEntriesExceededException
            (Json_deserializers.maximum_conflict_resolution_entries_exceeded_exception_of_yojson
               tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "MultipleConflictResolutionEntriesException" ->
          `MultipleConflictResolutionEntriesException
            (Json_deserializers.multiple_conflict_resolution_entries_exception_of_yojson tree path)
      | _, "NameLengthExceededException" ->
          `NameLengthExceededException
            (Json_deserializers.name_length_exceeded_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "ReplacementContentRequiredException" ->
          `ReplacementContentRequiredException
            (Json_deserializers.replacement_content_required_exception_of_yojson tree path)
      | _, "ReplacementTypeRequiredException" ->
          `ReplacementTypeRequiredException
            (Json_deserializers.replacement_type_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : merge_branches_by_three_way_input) =
    let input = Json_serializers.merge_branches_by_three_way_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.MergeBranchesByThreeWay"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_branches_by_three_way_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : merge_branches_by_three_way_input) =
    let input = Json_serializers.merge_branches_by_three_way_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.MergeBranchesByThreeWay" ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_branches_by_three_way_output_of_yojson
      ~error_deserializer
end

module MergePullRequestByFastForward = struct
  let error_to_string = function
    | `ConcurrentReferenceUpdateException _ ->
        "com.amazonaws.codecommit#ConcurrentReferenceUpdateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `ManualMergeRequiredException _ -> "com.amazonaws.codecommit#ManualMergeRequiredException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestApprovalRulesNotSatisfiedException _ ->
        "com.amazonaws.codecommit#PullRequestApprovalRulesNotSatisfiedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `ReferenceDoesNotExistException _ -> "com.amazonaws.codecommit#ReferenceDoesNotExistException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `RepositoryNotAssociatedWithPullRequestException _ ->
        "com.amazonaws.codecommit#RepositoryNotAssociatedWithPullRequestException"
    | `TipOfSourceReferenceIsDifferentException _ ->
        "com.amazonaws.codecommit#TipOfSourceReferenceIsDifferentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentReferenceUpdateException" ->
          `ConcurrentReferenceUpdateException
            (Json_deserializers.concurrent_reference_update_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "ManualMergeRequiredException" ->
          `ManualMergeRequiredException
            (Json_deserializers.manual_merge_required_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestApprovalRulesNotSatisfiedException" ->
          `PullRequestApprovalRulesNotSatisfiedException
            (Json_deserializers.pull_request_approval_rules_not_satisfied_exception_of_yojson tree
               path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "ReferenceDoesNotExistException" ->
          `ReferenceDoesNotExistException
            (Json_deserializers.reference_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "RepositoryNotAssociatedWithPullRequestException" ->
          `RepositoryNotAssociatedWithPullRequestException
            (Json_deserializers.repository_not_associated_with_pull_request_exception_of_yojson tree
               path)
      | _, "TipOfSourceReferenceIsDifferentException" ->
          `TipOfSourceReferenceIsDifferentException
            (Json_deserializers.tip_of_source_reference_is_different_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : merge_pull_request_by_fast_forward_input) =
    let input = Json_serializers.merge_pull_request_by_fast_forward_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.MergePullRequestByFastForward" ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_pull_request_by_fast_forward_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : merge_pull_request_by_fast_forward_input) =
    let input = Json_serializers.merge_pull_request_by_fast_forward_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.MergePullRequestByFastForward" ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_pull_request_by_fast_forward_output_of_yojson
      ~error_deserializer
end

module MergePullRequestBySquash = struct
  let error_to_string = function
    | `CommitMessageLengthExceededException _ ->
        "com.amazonaws.codecommit#CommitMessageLengthExceededException"
    | `ConcurrentReferenceUpdateException _ ->
        "com.amazonaws.codecommit#ConcurrentReferenceUpdateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FileContentSizeLimitExceededException"
    | `FolderContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FolderContentSizeLimitExceededException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidEmailException _ -> "com.amazonaws.codecommit#InvalidEmailException"
    | `InvalidFileModeException _ -> "com.amazonaws.codecommit#InvalidFileModeException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidReplacementContentException _ ->
        "com.amazonaws.codecommit#InvalidReplacementContentException"
    | `InvalidReplacementTypeException _ ->
        "com.amazonaws.codecommit#InvalidReplacementTypeException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `ManualMergeRequiredException _ -> "com.amazonaws.codecommit#ManualMergeRequiredException"
    | `MaximumConflictResolutionEntriesExceededException _ ->
        "com.amazonaws.codecommit#MaximumConflictResolutionEntriesExceededException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `MultipleConflictResolutionEntriesException _ ->
        "com.amazonaws.codecommit#MultipleConflictResolutionEntriesException"
    | `NameLengthExceededException _ -> "com.amazonaws.codecommit#NameLengthExceededException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestApprovalRulesNotSatisfiedException _ ->
        "com.amazonaws.codecommit#PullRequestApprovalRulesNotSatisfiedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `ReplacementContentRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementContentRequiredException"
    | `ReplacementTypeRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementTypeRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `RepositoryNotAssociatedWithPullRequestException _ ->
        "com.amazonaws.codecommit#RepositoryNotAssociatedWithPullRequestException"
    | `TipOfSourceReferenceIsDifferentException _ ->
        "com.amazonaws.codecommit#TipOfSourceReferenceIsDifferentException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitMessageLengthExceededException" ->
          `CommitMessageLengthExceededException
            (Json_deserializers.commit_message_length_exceeded_exception_of_yojson tree path)
      | _, "ConcurrentReferenceUpdateException" ->
          `ConcurrentReferenceUpdateException
            (Json_deserializers.concurrent_reference_update_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileContentSizeLimitExceededException" ->
          `FileContentSizeLimitExceededException
            (Json_deserializers.file_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "FolderContentSizeLimitExceededException" ->
          `FolderContentSizeLimitExceededException
            (Json_deserializers.folder_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionException" ->
          `InvalidConflictResolutionException
            (Json_deserializers.invalid_conflict_resolution_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidEmailException" ->
          `InvalidEmailException (Json_deserializers.invalid_email_exception_of_yojson tree path)
      | _, "InvalidFileModeException" ->
          `InvalidFileModeException
            (Json_deserializers.invalid_file_mode_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidReplacementContentException" ->
          `InvalidReplacementContentException
            (Json_deserializers.invalid_replacement_content_exception_of_yojson tree path)
      | _, "InvalidReplacementTypeException" ->
          `InvalidReplacementTypeException
            (Json_deserializers.invalid_replacement_type_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "ManualMergeRequiredException" ->
          `ManualMergeRequiredException
            (Json_deserializers.manual_merge_required_exception_of_yojson tree path)
      | _, "MaximumConflictResolutionEntriesExceededException" ->
          `MaximumConflictResolutionEntriesExceededException
            (Json_deserializers.maximum_conflict_resolution_entries_exceeded_exception_of_yojson
               tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "MultipleConflictResolutionEntriesException" ->
          `MultipleConflictResolutionEntriesException
            (Json_deserializers.multiple_conflict_resolution_entries_exception_of_yojson tree path)
      | _, "NameLengthExceededException" ->
          `NameLengthExceededException
            (Json_deserializers.name_length_exceeded_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestApprovalRulesNotSatisfiedException" ->
          `PullRequestApprovalRulesNotSatisfiedException
            (Json_deserializers.pull_request_approval_rules_not_satisfied_exception_of_yojson tree
               path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "ReplacementContentRequiredException" ->
          `ReplacementContentRequiredException
            (Json_deserializers.replacement_content_required_exception_of_yojson tree path)
      | _, "ReplacementTypeRequiredException" ->
          `ReplacementTypeRequiredException
            (Json_deserializers.replacement_type_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "RepositoryNotAssociatedWithPullRequestException" ->
          `RepositoryNotAssociatedWithPullRequestException
            (Json_deserializers.repository_not_associated_with_pull_request_exception_of_yojson tree
               path)
      | _, "TipOfSourceReferenceIsDifferentException" ->
          `TipOfSourceReferenceIsDifferentException
            (Json_deserializers.tip_of_source_reference_is_different_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : merge_pull_request_by_squash_input) =
    let input = Json_serializers.merge_pull_request_by_squash_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.MergePullRequestBySquash"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_pull_request_by_squash_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : merge_pull_request_by_squash_input) =
    let input = Json_serializers.merge_pull_request_by_squash_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.MergePullRequestBySquash" ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_pull_request_by_squash_output_of_yojson
      ~error_deserializer
end

module MergePullRequestByThreeWay = struct
  let error_to_string = function
    | `CommitMessageLengthExceededException _ ->
        "com.amazonaws.codecommit#CommitMessageLengthExceededException"
    | `ConcurrentReferenceUpdateException _ ->
        "com.amazonaws.codecommit#ConcurrentReferenceUpdateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FileContentSizeLimitExceededException"
    | `FolderContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FolderContentSizeLimitExceededException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidConflictDetailLevelException _ ->
        "com.amazonaws.codecommit#InvalidConflictDetailLevelException"
    | `InvalidConflictResolutionException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionException"
    | `InvalidConflictResolutionStrategyException _ ->
        "com.amazonaws.codecommit#InvalidConflictResolutionStrategyException"
    | `InvalidEmailException _ -> "com.amazonaws.codecommit#InvalidEmailException"
    | `InvalidFileModeException _ -> "com.amazonaws.codecommit#InvalidFileModeException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidReplacementContentException _ ->
        "com.amazonaws.codecommit#InvalidReplacementContentException"
    | `InvalidReplacementTypeException _ ->
        "com.amazonaws.codecommit#InvalidReplacementTypeException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `ManualMergeRequiredException _ -> "com.amazonaws.codecommit#ManualMergeRequiredException"
    | `MaximumConflictResolutionEntriesExceededException _ ->
        "com.amazonaws.codecommit#MaximumConflictResolutionEntriesExceededException"
    | `MaximumFileContentToLoadExceededException _ ->
        "com.amazonaws.codecommit#MaximumFileContentToLoadExceededException"
    | `MaximumItemsToCompareExceededException _ ->
        "com.amazonaws.codecommit#MaximumItemsToCompareExceededException"
    | `MultipleConflictResolutionEntriesException _ ->
        "com.amazonaws.codecommit#MultipleConflictResolutionEntriesException"
    | `NameLengthExceededException _ -> "com.amazonaws.codecommit#NameLengthExceededException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestApprovalRulesNotSatisfiedException _ ->
        "com.amazonaws.codecommit#PullRequestApprovalRulesNotSatisfiedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `ReplacementContentRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementContentRequiredException"
    | `ReplacementTypeRequiredException _ ->
        "com.amazonaws.codecommit#ReplacementTypeRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `RepositoryNotAssociatedWithPullRequestException _ ->
        "com.amazonaws.codecommit#RepositoryNotAssociatedWithPullRequestException"
    | `TipOfSourceReferenceIsDifferentException _ ->
        "com.amazonaws.codecommit#TipOfSourceReferenceIsDifferentException"
    | `TipsDivergenceExceededException _ ->
        "com.amazonaws.codecommit#TipsDivergenceExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommitMessageLengthExceededException" ->
          `CommitMessageLengthExceededException
            (Json_deserializers.commit_message_length_exceeded_exception_of_yojson tree path)
      | _, "ConcurrentReferenceUpdateException" ->
          `ConcurrentReferenceUpdateException
            (Json_deserializers.concurrent_reference_update_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileContentSizeLimitExceededException" ->
          `FileContentSizeLimitExceededException
            (Json_deserializers.file_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "FolderContentSizeLimitExceededException" ->
          `FolderContentSizeLimitExceededException
            (Json_deserializers.folder_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidConflictDetailLevelException" ->
          `InvalidConflictDetailLevelException
            (Json_deserializers.invalid_conflict_detail_level_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionException" ->
          `InvalidConflictResolutionException
            (Json_deserializers.invalid_conflict_resolution_exception_of_yojson tree path)
      | _, "InvalidConflictResolutionStrategyException" ->
          `InvalidConflictResolutionStrategyException
            (Json_deserializers.invalid_conflict_resolution_strategy_exception_of_yojson tree path)
      | _, "InvalidEmailException" ->
          `InvalidEmailException (Json_deserializers.invalid_email_exception_of_yojson tree path)
      | _, "InvalidFileModeException" ->
          `InvalidFileModeException
            (Json_deserializers.invalid_file_mode_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidReplacementContentException" ->
          `InvalidReplacementContentException
            (Json_deserializers.invalid_replacement_content_exception_of_yojson tree path)
      | _, "InvalidReplacementTypeException" ->
          `InvalidReplacementTypeException
            (Json_deserializers.invalid_replacement_type_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "ManualMergeRequiredException" ->
          `ManualMergeRequiredException
            (Json_deserializers.manual_merge_required_exception_of_yojson tree path)
      | _, "MaximumConflictResolutionEntriesExceededException" ->
          `MaximumConflictResolutionEntriesExceededException
            (Json_deserializers.maximum_conflict_resolution_entries_exceeded_exception_of_yojson
               tree path)
      | _, "MaximumFileContentToLoadExceededException" ->
          `MaximumFileContentToLoadExceededException
            (Json_deserializers.maximum_file_content_to_load_exceeded_exception_of_yojson tree path)
      | _, "MaximumItemsToCompareExceededException" ->
          `MaximumItemsToCompareExceededException
            (Json_deserializers.maximum_items_to_compare_exceeded_exception_of_yojson tree path)
      | _, "MultipleConflictResolutionEntriesException" ->
          `MultipleConflictResolutionEntriesException
            (Json_deserializers.multiple_conflict_resolution_entries_exception_of_yojson tree path)
      | _, "NameLengthExceededException" ->
          `NameLengthExceededException
            (Json_deserializers.name_length_exceeded_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestApprovalRulesNotSatisfiedException" ->
          `PullRequestApprovalRulesNotSatisfiedException
            (Json_deserializers.pull_request_approval_rules_not_satisfied_exception_of_yojson tree
               path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "ReplacementContentRequiredException" ->
          `ReplacementContentRequiredException
            (Json_deserializers.replacement_content_required_exception_of_yojson tree path)
      | _, "ReplacementTypeRequiredException" ->
          `ReplacementTypeRequiredException
            (Json_deserializers.replacement_type_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "RepositoryNotAssociatedWithPullRequestException" ->
          `RepositoryNotAssociatedWithPullRequestException
            (Json_deserializers.repository_not_associated_with_pull_request_exception_of_yojson tree
               path)
      | _, "TipOfSourceReferenceIsDifferentException" ->
          `TipOfSourceReferenceIsDifferentException
            (Json_deserializers.tip_of_source_reference_is_different_exception_of_yojson tree path)
      | _, "TipsDivergenceExceededException" ->
          `TipsDivergenceExceededException
            (Json_deserializers.tips_divergence_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : merge_pull_request_by_three_way_input) =
    let input = Json_serializers.merge_pull_request_by_three_way_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.MergePullRequestByThreeWay"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_pull_request_by_three_way_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : merge_pull_request_by_three_way_input) =
    let input = Json_serializers.merge_pull_request_by_three_way_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.MergePullRequestByThreeWay" ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_pull_request_by_three_way_output_of_yojson
      ~error_deserializer
end

module OverridePullRequestApprovalRules = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidOverrideStatusException _ -> "com.amazonaws.codecommit#InvalidOverrideStatusException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRevisionIdException _ -> "com.amazonaws.codecommit#InvalidRevisionIdException"
    | `OverrideAlreadySetException _ -> "com.amazonaws.codecommit#OverrideAlreadySetException"
    | `OverrideStatusRequiredException _ ->
        "com.amazonaws.codecommit#OverrideStatusRequiredException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `RevisionIdRequiredException _ -> "com.amazonaws.codecommit#RevisionIdRequiredException"
    | `RevisionNotCurrentException _ -> "com.amazonaws.codecommit#RevisionNotCurrentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidOverrideStatusException" ->
          `InvalidOverrideStatusException
            (Json_deserializers.invalid_override_status_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRevisionIdException" ->
          `InvalidRevisionIdException
            (Json_deserializers.invalid_revision_id_exception_of_yojson tree path)
      | _, "OverrideAlreadySetException" ->
          `OverrideAlreadySetException
            (Json_deserializers.override_already_set_exception_of_yojson tree path)
      | _, "OverrideStatusRequiredException" ->
          `OverrideStatusRequiredException
            (Json_deserializers.override_status_required_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "RevisionIdRequiredException" ->
          `RevisionIdRequiredException
            (Json_deserializers.revision_id_required_exception_of_yojson tree path)
      | _, "RevisionNotCurrentException" ->
          `RevisionNotCurrentException
            (Json_deserializers.revision_not_current_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : override_pull_request_approval_rules_input) =
    let input = Json_serializers.override_pull_request_approval_rules_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.OverridePullRequestApprovalRules" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : override_pull_request_approval_rules_input) =
    let input = Json_serializers.override_pull_request_approval_rules_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.OverridePullRequestApprovalRules" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PostCommentForComparedCommit = struct
  let error_to_string = function
    | `BeforeCommitIdAndAfterCommitIdAreSameException _ ->
        "com.amazonaws.codecommit#BeforeCommitIdAndAfterCommitIdAreSameException"
    | `ClientRequestTokenRequiredException _ ->
        "com.amazonaws.codecommit#ClientRequestTokenRequiredException"
    | `CommentContentRequiredException _ ->
        "com.amazonaws.codecommit#CommentContentRequiredException"
    | `CommentContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#CommentContentSizeLimitExceededException"
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitIdRequiredException _ -> "com.amazonaws.codecommit#CommitIdRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `IdempotencyParameterMismatchException _ ->
        "com.amazonaws.codecommit#IdempotencyParameterMismatchException"
    | `InvalidClientRequestTokenException _ ->
        "com.amazonaws.codecommit#InvalidClientRequestTokenException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidFileLocationException _ -> "com.amazonaws.codecommit#InvalidFileLocationException"
    | `InvalidFilePositionException _ -> "com.amazonaws.codecommit#InvalidFilePositionException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidRelativeFileVersionEnumException _ ->
        "com.amazonaws.codecommit#InvalidRelativeFileVersionEnumException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `PathDoesNotExistException _ -> "com.amazonaws.codecommit#PathDoesNotExistException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BeforeCommitIdAndAfterCommitIdAreSameException" ->
          `BeforeCommitIdAndAfterCommitIdAreSameException
            (Json_deserializers.before_commit_id_and_after_commit_id_are_same_exception_of_yojson
               tree path)
      | _, "ClientRequestTokenRequiredException" ->
          `ClientRequestTokenRequiredException
            (Json_deserializers.client_request_token_required_exception_of_yojson tree path)
      | _, "CommentContentRequiredException" ->
          `CommentContentRequiredException
            (Json_deserializers.comment_content_required_exception_of_yojson tree path)
      | _, "CommentContentSizeLimitExceededException" ->
          `CommentContentSizeLimitExceededException
            (Json_deserializers.comment_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitIdRequiredException" ->
          `CommitIdRequiredException
            (Json_deserializers.commit_id_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "IdempotencyParameterMismatchException" ->
          `IdempotencyParameterMismatchException
            (Json_deserializers.idempotency_parameter_mismatch_exception_of_yojson tree path)
      | _, "InvalidClientRequestTokenException" ->
          `InvalidClientRequestTokenException
            (Json_deserializers.invalid_client_request_token_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidFileLocationException" ->
          `InvalidFileLocationException
            (Json_deserializers.invalid_file_location_exception_of_yojson tree path)
      | _, "InvalidFilePositionException" ->
          `InvalidFilePositionException
            (Json_deserializers.invalid_file_position_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidRelativeFileVersionEnumException" ->
          `InvalidRelativeFileVersionEnumException
            (Json_deserializers.invalid_relative_file_version_enum_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "PathDoesNotExistException" ->
          `PathDoesNotExistException
            (Json_deserializers.path_does_not_exist_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : post_comment_for_compared_commit_input) =
    let input = Json_serializers.post_comment_for_compared_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.PostCommentForComparedCommit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.post_comment_for_compared_commit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : post_comment_for_compared_commit_input) =
    let input = Json_serializers.post_comment_for_compared_commit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.PostCommentForComparedCommit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.post_comment_for_compared_commit_output_of_yojson
      ~error_deserializer
end

module PostCommentForPullRequest = struct
  let error_to_string = function
    | `BeforeCommitIdAndAfterCommitIdAreSameException _ ->
        "com.amazonaws.codecommit#BeforeCommitIdAndAfterCommitIdAreSameException"
    | `ClientRequestTokenRequiredException _ ->
        "com.amazonaws.codecommit#ClientRequestTokenRequiredException"
    | `CommentContentRequiredException _ ->
        "com.amazonaws.codecommit#CommentContentRequiredException"
    | `CommentContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#CommentContentSizeLimitExceededException"
    | `CommitDoesNotExistException _ -> "com.amazonaws.codecommit#CommitDoesNotExistException"
    | `CommitIdRequiredException _ -> "com.amazonaws.codecommit#CommitIdRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `IdempotencyParameterMismatchException _ ->
        "com.amazonaws.codecommit#IdempotencyParameterMismatchException"
    | `InvalidClientRequestTokenException _ ->
        "com.amazonaws.codecommit#InvalidClientRequestTokenException"
    | `InvalidCommitIdException _ -> "com.amazonaws.codecommit#InvalidCommitIdException"
    | `InvalidFileLocationException _ -> "com.amazonaws.codecommit#InvalidFileLocationException"
    | `InvalidFilePositionException _ -> "com.amazonaws.codecommit#InvalidFilePositionException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRelativeFileVersionEnumException _ ->
        "com.amazonaws.codecommit#InvalidRelativeFileVersionEnumException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `PathDoesNotExistException _ -> "com.amazonaws.codecommit#PathDoesNotExistException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `RepositoryNotAssociatedWithPullRequestException _ ->
        "com.amazonaws.codecommit#RepositoryNotAssociatedWithPullRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BeforeCommitIdAndAfterCommitIdAreSameException" ->
          `BeforeCommitIdAndAfterCommitIdAreSameException
            (Json_deserializers.before_commit_id_and_after_commit_id_are_same_exception_of_yojson
               tree path)
      | _, "ClientRequestTokenRequiredException" ->
          `ClientRequestTokenRequiredException
            (Json_deserializers.client_request_token_required_exception_of_yojson tree path)
      | _, "CommentContentRequiredException" ->
          `CommentContentRequiredException
            (Json_deserializers.comment_content_required_exception_of_yojson tree path)
      | _, "CommentContentSizeLimitExceededException" ->
          `CommentContentSizeLimitExceededException
            (Json_deserializers.comment_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "CommitDoesNotExistException" ->
          `CommitDoesNotExistException
            (Json_deserializers.commit_does_not_exist_exception_of_yojson tree path)
      | _, "CommitIdRequiredException" ->
          `CommitIdRequiredException
            (Json_deserializers.commit_id_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "IdempotencyParameterMismatchException" ->
          `IdempotencyParameterMismatchException
            (Json_deserializers.idempotency_parameter_mismatch_exception_of_yojson tree path)
      | _, "InvalidClientRequestTokenException" ->
          `InvalidClientRequestTokenException
            (Json_deserializers.invalid_client_request_token_exception_of_yojson tree path)
      | _, "InvalidCommitIdException" ->
          `InvalidCommitIdException
            (Json_deserializers.invalid_commit_id_exception_of_yojson tree path)
      | _, "InvalidFileLocationException" ->
          `InvalidFileLocationException
            (Json_deserializers.invalid_file_location_exception_of_yojson tree path)
      | _, "InvalidFilePositionException" ->
          `InvalidFilePositionException
            (Json_deserializers.invalid_file_position_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRelativeFileVersionEnumException" ->
          `InvalidRelativeFileVersionEnumException
            (Json_deserializers.invalid_relative_file_version_enum_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "PathDoesNotExistException" ->
          `PathDoesNotExistException
            (Json_deserializers.path_does_not_exist_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "RepositoryNotAssociatedWithPullRequestException" ->
          `RepositoryNotAssociatedWithPullRequestException
            (Json_deserializers.repository_not_associated_with_pull_request_exception_of_yojson tree
               path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : post_comment_for_pull_request_input) =
    let input = Json_serializers.post_comment_for_pull_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.PostCommentForPullRequest"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.post_comment_for_pull_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : post_comment_for_pull_request_input) =
    let input = Json_serializers.post_comment_for_pull_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.PostCommentForPullRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.post_comment_for_pull_request_output_of_yojson
      ~error_deserializer
end

module PostCommentReply = struct
  let error_to_string = function
    | `ClientRequestTokenRequiredException _ ->
        "com.amazonaws.codecommit#ClientRequestTokenRequiredException"
    | `CommentContentRequiredException _ ->
        "com.amazonaws.codecommit#CommentContentRequiredException"
    | `CommentContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#CommentContentSizeLimitExceededException"
    | `CommentDoesNotExistException _ -> "com.amazonaws.codecommit#CommentDoesNotExistException"
    | `CommentIdRequiredException _ -> "com.amazonaws.codecommit#CommentIdRequiredException"
    | `IdempotencyParameterMismatchException _ ->
        "com.amazonaws.codecommit#IdempotencyParameterMismatchException"
    | `InvalidClientRequestTokenException _ ->
        "com.amazonaws.codecommit#InvalidClientRequestTokenException"
    | `InvalidCommentIdException _ -> "com.amazonaws.codecommit#InvalidCommentIdException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientRequestTokenRequiredException" ->
          `ClientRequestTokenRequiredException
            (Json_deserializers.client_request_token_required_exception_of_yojson tree path)
      | _, "CommentContentRequiredException" ->
          `CommentContentRequiredException
            (Json_deserializers.comment_content_required_exception_of_yojson tree path)
      | _, "CommentContentSizeLimitExceededException" ->
          `CommentContentSizeLimitExceededException
            (Json_deserializers.comment_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "CommentDoesNotExistException" ->
          `CommentDoesNotExistException
            (Json_deserializers.comment_does_not_exist_exception_of_yojson tree path)
      | _, "CommentIdRequiredException" ->
          `CommentIdRequiredException
            (Json_deserializers.comment_id_required_exception_of_yojson tree path)
      | _, "IdempotencyParameterMismatchException" ->
          `IdempotencyParameterMismatchException
            (Json_deserializers.idempotency_parameter_mismatch_exception_of_yojson tree path)
      | _, "InvalidClientRequestTokenException" ->
          `InvalidClientRequestTokenException
            (Json_deserializers.invalid_client_request_token_exception_of_yojson tree path)
      | _, "InvalidCommentIdException" ->
          `InvalidCommentIdException
            (Json_deserializers.invalid_comment_id_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : post_comment_reply_input) =
    let input = Json_serializers.post_comment_reply_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.PostCommentReply" ~service
      ~context ~input ~output_deserializer:Json_deserializers.post_comment_reply_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : post_comment_reply_input) =
    let input = Json_serializers.post_comment_reply_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.PostCommentReply" ~service ~context ~input
      ~output_deserializer:Json_deserializers.post_comment_reply_output_of_yojson
      ~error_deserializer
end

module PutCommentReaction = struct
  let error_to_string = function
    | `CommentDeletedException _ -> "com.amazonaws.codecommit#CommentDeletedException"
    | `CommentDoesNotExistException _ -> "com.amazonaws.codecommit#CommentDoesNotExistException"
    | `CommentIdRequiredException _ -> "com.amazonaws.codecommit#CommentIdRequiredException"
    | `InvalidCommentIdException _ -> "com.amazonaws.codecommit#InvalidCommentIdException"
    | `InvalidReactionValueException _ -> "com.amazonaws.codecommit#InvalidReactionValueException"
    | `ReactionLimitExceededException _ -> "com.amazonaws.codecommit#ReactionLimitExceededException"
    | `ReactionValueRequiredException _ -> "com.amazonaws.codecommit#ReactionValueRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommentDeletedException" ->
          `CommentDeletedException
            (Json_deserializers.comment_deleted_exception_of_yojson tree path)
      | _, "CommentDoesNotExistException" ->
          `CommentDoesNotExistException
            (Json_deserializers.comment_does_not_exist_exception_of_yojson tree path)
      | _, "CommentIdRequiredException" ->
          `CommentIdRequiredException
            (Json_deserializers.comment_id_required_exception_of_yojson tree path)
      | _, "InvalidCommentIdException" ->
          `InvalidCommentIdException
            (Json_deserializers.invalid_comment_id_exception_of_yojson tree path)
      | _, "InvalidReactionValueException" ->
          `InvalidReactionValueException
            (Json_deserializers.invalid_reaction_value_exception_of_yojson tree path)
      | _, "ReactionLimitExceededException" ->
          `ReactionLimitExceededException
            (Json_deserializers.reaction_limit_exceeded_exception_of_yojson tree path)
      | _, "ReactionValueRequiredException" ->
          `ReactionValueRequiredException
            (Json_deserializers.reaction_value_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_comment_reaction_input) =
    let input = Json_serializers.put_comment_reaction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.PutCommentReaction"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_comment_reaction_input) =
    let input = Json_serializers.put_comment_reaction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.PutCommentReaction" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutFile = struct
  let error_to_string = function
    | `BranchDoesNotExistException _ -> "com.amazonaws.codecommit#BranchDoesNotExistException"
    | `BranchNameIsTagNameException _ -> "com.amazonaws.codecommit#BranchNameIsTagNameException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `CommitMessageLengthExceededException _ ->
        "com.amazonaws.codecommit#CommitMessageLengthExceededException"
    | `DirectoryNameConflictsWithFileNameException _ ->
        "com.amazonaws.codecommit#DirectoryNameConflictsWithFileNameException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `FileContentRequiredException _ -> "com.amazonaws.codecommit#FileContentRequiredException"
    | `FileContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FileContentSizeLimitExceededException"
    | `FileNameConflictsWithDirectoryNameException _ ->
        "com.amazonaws.codecommit#FileNameConflictsWithDirectoryNameException"
    | `FilePathConflictsWithSubmodulePathException _ ->
        "com.amazonaws.codecommit#FilePathConflictsWithSubmodulePathException"
    | `FolderContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#FolderContentSizeLimitExceededException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidDeletionParameterException _ ->
        "com.amazonaws.codecommit#InvalidDeletionParameterException"
    | `InvalidEmailException _ -> "com.amazonaws.codecommit#InvalidEmailException"
    | `InvalidFileModeException _ -> "com.amazonaws.codecommit#InvalidFileModeException"
    | `InvalidParentCommitIdException _ -> "com.amazonaws.codecommit#InvalidParentCommitIdException"
    | `InvalidPathException _ -> "com.amazonaws.codecommit#InvalidPathException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `NameLengthExceededException _ -> "com.amazonaws.codecommit#NameLengthExceededException"
    | `ParentCommitDoesNotExistException _ ->
        "com.amazonaws.codecommit#ParentCommitDoesNotExistException"
    | `ParentCommitIdOutdatedException _ ->
        "com.amazonaws.codecommit#ParentCommitIdOutdatedException"
    | `ParentCommitIdRequiredException _ ->
        "com.amazonaws.codecommit#ParentCommitIdRequiredException"
    | `PathRequiredException _ -> "com.amazonaws.codecommit#PathRequiredException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `SameFileContentException _ -> "com.amazonaws.codecommit#SameFileContentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchDoesNotExistException" ->
          `BranchDoesNotExistException
            (Json_deserializers.branch_does_not_exist_exception_of_yojson tree path)
      | _, "BranchNameIsTagNameException" ->
          `BranchNameIsTagNameException
            (Json_deserializers.branch_name_is_tag_name_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "CommitMessageLengthExceededException" ->
          `CommitMessageLengthExceededException
            (Json_deserializers.commit_message_length_exceeded_exception_of_yojson tree path)
      | _, "DirectoryNameConflictsWithFileNameException" ->
          `DirectoryNameConflictsWithFileNameException
            (Json_deserializers.directory_name_conflicts_with_file_name_exception_of_yojson tree
               path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "FileContentRequiredException" ->
          `FileContentRequiredException
            (Json_deserializers.file_content_required_exception_of_yojson tree path)
      | _, "FileContentSizeLimitExceededException" ->
          `FileContentSizeLimitExceededException
            (Json_deserializers.file_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "FileNameConflictsWithDirectoryNameException" ->
          `FileNameConflictsWithDirectoryNameException
            (Json_deserializers.file_name_conflicts_with_directory_name_exception_of_yojson tree
               path)
      | _, "FilePathConflictsWithSubmodulePathException" ->
          `FilePathConflictsWithSubmodulePathException
            (Json_deserializers.file_path_conflicts_with_submodule_path_exception_of_yojson tree
               path)
      | _, "FolderContentSizeLimitExceededException" ->
          `FolderContentSizeLimitExceededException
            (Json_deserializers.folder_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidDeletionParameterException" ->
          `InvalidDeletionParameterException
            (Json_deserializers.invalid_deletion_parameter_exception_of_yojson tree path)
      | _, "InvalidEmailException" ->
          `InvalidEmailException (Json_deserializers.invalid_email_exception_of_yojson tree path)
      | _, "InvalidFileModeException" ->
          `InvalidFileModeException
            (Json_deserializers.invalid_file_mode_exception_of_yojson tree path)
      | _, "InvalidParentCommitIdException" ->
          `InvalidParentCommitIdException
            (Json_deserializers.invalid_parent_commit_id_exception_of_yojson tree path)
      | _, "InvalidPathException" ->
          `InvalidPathException (Json_deserializers.invalid_path_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "NameLengthExceededException" ->
          `NameLengthExceededException
            (Json_deserializers.name_length_exceeded_exception_of_yojson tree path)
      | _, "ParentCommitDoesNotExistException" ->
          `ParentCommitDoesNotExistException
            (Json_deserializers.parent_commit_does_not_exist_exception_of_yojson tree path)
      | _, "ParentCommitIdOutdatedException" ->
          `ParentCommitIdOutdatedException
            (Json_deserializers.parent_commit_id_outdated_exception_of_yojson tree path)
      | _, "ParentCommitIdRequiredException" ->
          `ParentCommitIdRequiredException
            (Json_deserializers.parent_commit_id_required_exception_of_yojson tree path)
      | _, "PathRequiredException" ->
          `PathRequiredException (Json_deserializers.path_required_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "SameFileContentException" ->
          `SameFileContentException
            (Json_deserializers.same_file_content_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_file_input) =
    let input = Json_serializers.put_file_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.PutFile" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_file_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_file_input) =
    let input = Json_serializers.put_file_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.PutFile"
      ~service ~context ~input ~output_deserializer:Json_deserializers.put_file_output_of_yojson
      ~error_deserializer
end

module PutRepositoryTriggers = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidRepositoryTriggerBranchNameException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerBranchNameException"
    | `InvalidRepositoryTriggerCustomDataException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerCustomDataException"
    | `InvalidRepositoryTriggerDestinationArnException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerDestinationArnException"
    | `InvalidRepositoryTriggerEventsException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerEventsException"
    | `InvalidRepositoryTriggerNameException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerNameException"
    | `InvalidRepositoryTriggerRegionException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerRegionException"
    | `MaximumBranchesExceededException _ ->
        "com.amazonaws.codecommit#MaximumBranchesExceededException"
    | `MaximumRepositoryTriggersExceededException _ ->
        "com.amazonaws.codecommit#MaximumRepositoryTriggersExceededException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `RepositoryTriggerBranchNameListRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggerBranchNameListRequiredException"
    | `RepositoryTriggerDestinationArnRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggerDestinationArnRequiredException"
    | `RepositoryTriggerEventsListRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggerEventsListRequiredException"
    | `RepositoryTriggerNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggerNameRequiredException"
    | `RepositoryTriggersListRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggersListRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerBranchNameException" ->
          `InvalidRepositoryTriggerBranchNameException
            (Json_deserializers.invalid_repository_trigger_branch_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerCustomDataException" ->
          `InvalidRepositoryTriggerCustomDataException
            (Json_deserializers.invalid_repository_trigger_custom_data_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerDestinationArnException" ->
          `InvalidRepositoryTriggerDestinationArnException
            (Json_deserializers.invalid_repository_trigger_destination_arn_exception_of_yojson tree
               path)
      | _, "InvalidRepositoryTriggerEventsException" ->
          `InvalidRepositoryTriggerEventsException
            (Json_deserializers.invalid_repository_trigger_events_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerNameException" ->
          `InvalidRepositoryTriggerNameException
            (Json_deserializers.invalid_repository_trigger_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerRegionException" ->
          `InvalidRepositoryTriggerRegionException
            (Json_deserializers.invalid_repository_trigger_region_exception_of_yojson tree path)
      | _, "MaximumBranchesExceededException" ->
          `MaximumBranchesExceededException
            (Json_deserializers.maximum_branches_exceeded_exception_of_yojson tree path)
      | _, "MaximumRepositoryTriggersExceededException" ->
          `MaximumRepositoryTriggersExceededException
            (Json_deserializers.maximum_repository_triggers_exceeded_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "RepositoryTriggerBranchNameListRequiredException" ->
          `RepositoryTriggerBranchNameListRequiredException
            (Json_deserializers.repository_trigger_branch_name_list_required_exception_of_yojson
               tree path)
      | _, "RepositoryTriggerDestinationArnRequiredException" ->
          `RepositoryTriggerDestinationArnRequiredException
            (Json_deserializers.repository_trigger_destination_arn_required_exception_of_yojson tree
               path)
      | _, "RepositoryTriggerEventsListRequiredException" ->
          `RepositoryTriggerEventsListRequiredException
            (Json_deserializers.repository_trigger_events_list_required_exception_of_yojson tree
               path)
      | _, "RepositoryTriggerNameRequiredException" ->
          `RepositoryTriggerNameRequiredException
            (Json_deserializers.repository_trigger_name_required_exception_of_yojson tree path)
      | _, "RepositoryTriggersListRequiredException" ->
          `RepositoryTriggersListRequiredException
            (Json_deserializers.repository_triggers_list_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_repository_triggers_input) =
    let input = Json_serializers.put_repository_triggers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.PutRepositoryTriggers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_repository_triggers_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_repository_triggers_input) =
    let input = Json_serializers.put_repository_triggers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.PutRepositoryTriggers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_repository_triggers_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidResourceArnException _ -> "com.amazonaws.codecommit#InvalidResourceArnException"
    | `InvalidSystemTagUsageException _ -> "com.amazonaws.codecommit#InvalidSystemTagUsageException"
    | `InvalidTagsMapException _ -> "com.amazonaws.codecommit#InvalidTagsMapException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `ResourceArnRequiredException _ -> "com.amazonaws.codecommit#ResourceArnRequiredException"
    | `TagPolicyException _ -> "com.amazonaws.codecommit#TagPolicyException"
    | `TagsMapRequiredException _ -> "com.amazonaws.codecommit#TagsMapRequiredException"
    | `TooManyTagsException _ -> "com.amazonaws.codecommit#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidResourceArnException" ->
          `InvalidResourceArnException
            (Json_deserializers.invalid_resource_arn_exception_of_yojson tree path)
      | _, "InvalidSystemTagUsageException" ->
          `InvalidSystemTagUsageException
            (Json_deserializers.invalid_system_tag_usage_exception_of_yojson tree path)
      | _, "InvalidTagsMapException" ->
          `InvalidTagsMapException
            (Json_deserializers.invalid_tags_map_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "ResourceArnRequiredException" ->
          `ResourceArnRequiredException
            (Json_deserializers.resource_arn_required_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "TagsMapRequiredException" ->
          `TagsMapRequiredException
            (Json_deserializers.tags_map_required_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.TagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeCommit_20150413.TagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TestRepositoryTriggers = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidRepositoryTriggerBranchNameException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerBranchNameException"
    | `InvalidRepositoryTriggerCustomDataException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerCustomDataException"
    | `InvalidRepositoryTriggerDestinationArnException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerDestinationArnException"
    | `InvalidRepositoryTriggerEventsException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerEventsException"
    | `InvalidRepositoryTriggerNameException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerNameException"
    | `InvalidRepositoryTriggerRegionException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryTriggerRegionException"
    | `MaximumBranchesExceededException _ ->
        "com.amazonaws.codecommit#MaximumBranchesExceededException"
    | `MaximumRepositoryTriggersExceededException _ ->
        "com.amazonaws.codecommit#MaximumRepositoryTriggersExceededException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | `RepositoryTriggerBranchNameListRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggerBranchNameListRequiredException"
    | `RepositoryTriggerDestinationArnRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggerDestinationArnRequiredException"
    | `RepositoryTriggerEventsListRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggerEventsListRequiredException"
    | `RepositoryTriggerNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggerNameRequiredException"
    | `RepositoryTriggersListRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryTriggersListRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerBranchNameException" ->
          `InvalidRepositoryTriggerBranchNameException
            (Json_deserializers.invalid_repository_trigger_branch_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerCustomDataException" ->
          `InvalidRepositoryTriggerCustomDataException
            (Json_deserializers.invalid_repository_trigger_custom_data_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerDestinationArnException" ->
          `InvalidRepositoryTriggerDestinationArnException
            (Json_deserializers.invalid_repository_trigger_destination_arn_exception_of_yojson tree
               path)
      | _, "InvalidRepositoryTriggerEventsException" ->
          `InvalidRepositoryTriggerEventsException
            (Json_deserializers.invalid_repository_trigger_events_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerNameException" ->
          `InvalidRepositoryTriggerNameException
            (Json_deserializers.invalid_repository_trigger_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryTriggerRegionException" ->
          `InvalidRepositoryTriggerRegionException
            (Json_deserializers.invalid_repository_trigger_region_exception_of_yojson tree path)
      | _, "MaximumBranchesExceededException" ->
          `MaximumBranchesExceededException
            (Json_deserializers.maximum_branches_exceeded_exception_of_yojson tree path)
      | _, "MaximumRepositoryTriggersExceededException" ->
          `MaximumRepositoryTriggersExceededException
            (Json_deserializers.maximum_repository_triggers_exceeded_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _, "RepositoryTriggerBranchNameListRequiredException" ->
          `RepositoryTriggerBranchNameListRequiredException
            (Json_deserializers.repository_trigger_branch_name_list_required_exception_of_yojson
               tree path)
      | _, "RepositoryTriggerDestinationArnRequiredException" ->
          `RepositoryTriggerDestinationArnRequiredException
            (Json_deserializers.repository_trigger_destination_arn_required_exception_of_yojson tree
               path)
      | _, "RepositoryTriggerEventsListRequiredException" ->
          `RepositoryTriggerEventsListRequiredException
            (Json_deserializers.repository_trigger_events_list_required_exception_of_yojson tree
               path)
      | _, "RepositoryTriggerNameRequiredException" ->
          `RepositoryTriggerNameRequiredException
            (Json_deserializers.repository_trigger_name_required_exception_of_yojson tree path)
      | _, "RepositoryTriggersListRequiredException" ->
          `RepositoryTriggersListRequiredException
            (Json_deserializers.repository_triggers_list_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_repository_triggers_input) =
    let input = Json_serializers.test_repository_triggers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.TestRepositoryTriggers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_repository_triggers_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : test_repository_triggers_input) =
    let input = Json_serializers.test_repository_triggers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.TestRepositoryTriggers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_repository_triggers_output_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `InvalidResourceArnException _ -> "com.amazonaws.codecommit#InvalidResourceArnException"
    | `InvalidSystemTagUsageException _ -> "com.amazonaws.codecommit#InvalidSystemTagUsageException"
    | `InvalidTagKeysListException _ -> "com.amazonaws.codecommit#InvalidTagKeysListException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `ResourceArnRequiredException _ -> "com.amazonaws.codecommit#ResourceArnRequiredException"
    | `TagKeysListRequiredException _ -> "com.amazonaws.codecommit#TagKeysListRequiredException"
    | `TagPolicyException _ -> "com.amazonaws.codecommit#TagPolicyException"
    | `TooManyTagsException _ -> "com.amazonaws.codecommit#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "InvalidResourceArnException" ->
          `InvalidResourceArnException
            (Json_deserializers.invalid_resource_arn_exception_of_yojson tree path)
      | _, "InvalidSystemTagUsageException" ->
          `InvalidSystemTagUsageException
            (Json_deserializers.invalid_system_tag_usage_exception_of_yojson tree path)
      | _, "InvalidTagKeysListException" ->
          `InvalidTagKeysListException
            (Json_deserializers.invalid_tag_keys_list_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "ResourceArnRequiredException" ->
          `ResourceArnRequiredException
            (Json_deserializers.resource_arn_required_exception_of_yojson tree path)
      | _, "TagKeysListRequiredException" ->
          `TagKeysListRequiredException
            (Json_deserializers.tag_keys_list_required_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.UntagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UntagResource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateApprovalRuleTemplateContent = struct
  let error_to_string = function
    | `ApprovalRuleTemplateContentRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateContentRequiredException"
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `InvalidApprovalRuleTemplateContentException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateContentException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | `InvalidRuleContentSha256Exception _ ->
        "com.amazonaws.codecommit#InvalidRuleContentSha256Exception"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateContentRequiredException" ->
          `ApprovalRuleTemplateContentRequiredException
            (Json_deserializers.approval_rule_template_content_required_exception_of_yojson tree
               path)
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateContentException" ->
          `InvalidApprovalRuleTemplateContentException
            (Json_deserializers.invalid_approval_rule_template_content_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _, "InvalidRuleContentSha256Exception" ->
          `InvalidRuleContentSha256Exception
            (Json_deserializers.invalid_rule_content_sha256_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_approval_rule_template_content_input) =
    let input = Json_serializers.update_approval_rule_template_content_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.UpdateApprovalRuleTemplateContent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_approval_rule_template_content_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_approval_rule_template_content_input) =
    let input = Json_serializers.update_approval_rule_template_content_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdateApprovalRuleTemplateContent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_approval_rule_template_content_output_of_yojson
      ~error_deserializer
end

module UpdateApprovalRuleTemplateDescription = struct
  let error_to_string = function
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `InvalidApprovalRuleTemplateDescriptionException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateDescriptionException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateDescriptionException" ->
          `InvalidApprovalRuleTemplateDescriptionException
            (Json_deserializers.invalid_approval_rule_template_description_exception_of_yojson tree
               path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_approval_rule_template_description_input) =
    let input =
      Json_serializers.update_approval_rule_template_description_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.UpdateApprovalRuleTemplateDescription" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_approval_rule_template_description_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_approval_rule_template_description_input) =
    let input =
      Json_serializers.update_approval_rule_template_description_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdateApprovalRuleTemplateDescription" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_approval_rule_template_description_output_of_yojson
      ~error_deserializer
end

module UpdateApprovalRuleTemplateName = struct
  let error_to_string = function
    | `ApprovalRuleTemplateDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateDoesNotExistException"
    | `ApprovalRuleTemplateNameAlreadyExistsException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameAlreadyExistsException"
    | `ApprovalRuleTemplateNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleTemplateNameRequiredException"
    | `InvalidApprovalRuleTemplateNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleTemplateNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleTemplateDoesNotExistException" ->
          `ApprovalRuleTemplateDoesNotExistException
            (Json_deserializers.approval_rule_template_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleTemplateNameAlreadyExistsException" ->
          `ApprovalRuleTemplateNameAlreadyExistsException
            (Json_deserializers.approval_rule_template_name_already_exists_exception_of_yojson tree
               path)
      | _, "ApprovalRuleTemplateNameRequiredException" ->
          `ApprovalRuleTemplateNameRequiredException
            (Json_deserializers.approval_rule_template_name_required_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleTemplateNameException" ->
          `InvalidApprovalRuleTemplateNameException
            (Json_deserializers.invalid_approval_rule_template_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_approval_rule_template_name_input) =
    let input = Json_serializers.update_approval_rule_template_name_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.UpdateApprovalRuleTemplateName" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_approval_rule_template_name_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_approval_rule_template_name_input) =
    let input = Json_serializers.update_approval_rule_template_name_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdateApprovalRuleTemplateName" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_approval_rule_template_name_output_of_yojson
      ~error_deserializer
end

module UpdateComment = struct
  let error_to_string = function
    | `CommentContentRequiredException _ ->
        "com.amazonaws.codecommit#CommentContentRequiredException"
    | `CommentContentSizeLimitExceededException _ ->
        "com.amazonaws.codecommit#CommentContentSizeLimitExceededException"
    | `CommentDeletedException _ -> "com.amazonaws.codecommit#CommentDeletedException"
    | `CommentDoesNotExistException _ -> "com.amazonaws.codecommit#CommentDoesNotExistException"
    | `CommentIdRequiredException _ -> "com.amazonaws.codecommit#CommentIdRequiredException"
    | `CommentNotCreatedByCallerException _ ->
        "com.amazonaws.codecommit#CommentNotCreatedByCallerException"
    | `InvalidCommentIdException _ -> "com.amazonaws.codecommit#InvalidCommentIdException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CommentContentRequiredException" ->
          `CommentContentRequiredException
            (Json_deserializers.comment_content_required_exception_of_yojson tree path)
      | _, "CommentContentSizeLimitExceededException" ->
          `CommentContentSizeLimitExceededException
            (Json_deserializers.comment_content_size_limit_exceeded_exception_of_yojson tree path)
      | _, "CommentDeletedException" ->
          `CommentDeletedException
            (Json_deserializers.comment_deleted_exception_of_yojson tree path)
      | _, "CommentDoesNotExistException" ->
          `CommentDoesNotExistException
            (Json_deserializers.comment_does_not_exist_exception_of_yojson tree path)
      | _, "CommentIdRequiredException" ->
          `CommentIdRequiredException
            (Json_deserializers.comment_id_required_exception_of_yojson tree path)
      | _, "CommentNotCreatedByCallerException" ->
          `CommentNotCreatedByCallerException
            (Json_deserializers.comment_not_created_by_caller_exception_of_yojson tree path)
      | _, "InvalidCommentIdException" ->
          `InvalidCommentIdException
            (Json_deserializers.invalid_comment_id_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_comment_input) =
    let input = Json_serializers.update_comment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.UpdateComment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_comment_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_comment_input) =
    let input = Json_serializers.update_comment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdateComment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_comment_output_of_yojson ~error_deserializer
end

module UpdateDefaultBranch = struct
  let error_to_string = function
    | `BranchDoesNotExistException _ -> "com.amazonaws.codecommit#BranchDoesNotExistException"
    | `BranchNameRequiredException _ -> "com.amazonaws.codecommit#BranchNameRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidBranchNameException _ -> "com.amazonaws.codecommit#InvalidBranchNameException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BranchDoesNotExistException" ->
          `BranchDoesNotExistException
            (Json_deserializers.branch_does_not_exist_exception_of_yojson tree path)
      | _, "BranchNameRequiredException" ->
          `BranchNameRequiredException
            (Json_deserializers.branch_name_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidBranchNameException" ->
          `InvalidBranchNameException
            (Json_deserializers.invalid_branch_name_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_default_branch_input) =
    let input = Json_serializers.update_default_branch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.UpdateDefaultBranch"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_default_branch_input) =
    let input = Json_serializers.update_default_branch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdateDefaultBranch" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdatePullRequestApprovalRuleContent = struct
  let error_to_string = function
    | `ApprovalRuleContentRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleContentRequiredException"
    | `ApprovalRuleDoesNotExistException _ ->
        "com.amazonaws.codecommit#ApprovalRuleDoesNotExistException"
    | `ApprovalRuleNameRequiredException _ ->
        "com.amazonaws.codecommit#ApprovalRuleNameRequiredException"
    | `CannotModifyApprovalRuleFromTemplateException _ ->
        "com.amazonaws.codecommit#CannotModifyApprovalRuleFromTemplateException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalRuleContentException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleContentException"
    | `InvalidApprovalRuleNameException _ ->
        "com.amazonaws.codecommit#InvalidApprovalRuleNameException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRuleContentSha256Exception _ ->
        "com.amazonaws.codecommit#InvalidRuleContentSha256Exception"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalRuleContentRequiredException" ->
          `ApprovalRuleContentRequiredException
            (Json_deserializers.approval_rule_content_required_exception_of_yojson tree path)
      | _, "ApprovalRuleDoesNotExistException" ->
          `ApprovalRuleDoesNotExistException
            (Json_deserializers.approval_rule_does_not_exist_exception_of_yojson tree path)
      | _, "ApprovalRuleNameRequiredException" ->
          `ApprovalRuleNameRequiredException
            (Json_deserializers.approval_rule_name_required_exception_of_yojson tree path)
      | _, "CannotModifyApprovalRuleFromTemplateException" ->
          `CannotModifyApprovalRuleFromTemplateException
            (Json_deserializers.cannot_modify_approval_rule_from_template_exception_of_yojson tree
               path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleContentException" ->
          `InvalidApprovalRuleContentException
            (Json_deserializers.invalid_approval_rule_content_exception_of_yojson tree path)
      | _, "InvalidApprovalRuleNameException" ->
          `InvalidApprovalRuleNameException
            (Json_deserializers.invalid_approval_rule_name_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRuleContentSha256Exception" ->
          `InvalidRuleContentSha256Exception
            (Json_deserializers.invalid_rule_content_sha256_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pull_request_approval_rule_content_input) =
    let input =
      Json_serializers.update_pull_request_approval_rule_content_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.UpdatePullRequestApprovalRuleContent" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_pull_request_approval_rule_content_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pull_request_approval_rule_content_input) =
    let input =
      Json_serializers.update_pull_request_approval_rule_content_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdatePullRequestApprovalRuleContent" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_pull_request_approval_rule_content_output_of_yojson
      ~error_deserializer
end

module UpdatePullRequestApprovalState = struct
  let error_to_string = function
    | `ApprovalStateRequiredException _ -> "com.amazonaws.codecommit#ApprovalStateRequiredException"
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidApprovalStateException _ -> "com.amazonaws.codecommit#InvalidApprovalStateException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidRevisionIdException _ -> "com.amazonaws.codecommit#InvalidRevisionIdException"
    | `MaximumNumberOfApprovalsExceededException _ ->
        "com.amazonaws.codecommit#MaximumNumberOfApprovalsExceededException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestCannotBeApprovedByAuthorException _ ->
        "com.amazonaws.codecommit#PullRequestCannotBeApprovedByAuthorException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `RevisionIdRequiredException _ -> "com.amazonaws.codecommit#RevisionIdRequiredException"
    | `RevisionNotCurrentException _ -> "com.amazonaws.codecommit#RevisionNotCurrentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApprovalStateRequiredException" ->
          `ApprovalStateRequiredException
            (Json_deserializers.approval_state_required_exception_of_yojson tree path)
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidApprovalStateException" ->
          `InvalidApprovalStateException
            (Json_deserializers.invalid_approval_state_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidRevisionIdException" ->
          `InvalidRevisionIdException
            (Json_deserializers.invalid_revision_id_exception_of_yojson tree path)
      | _, "MaximumNumberOfApprovalsExceededException" ->
          `MaximumNumberOfApprovalsExceededException
            (Json_deserializers.maximum_number_of_approvals_exceeded_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestCannotBeApprovedByAuthorException" ->
          `PullRequestCannotBeApprovedByAuthorException
            (Json_deserializers.pull_request_cannot_be_approved_by_author_exception_of_yojson tree
               path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "RevisionIdRequiredException" ->
          `RevisionIdRequiredException
            (Json_deserializers.revision_id_required_exception_of_yojson tree path)
      | _, "RevisionNotCurrentException" ->
          `RevisionNotCurrentException
            (Json_deserializers.revision_not_current_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pull_request_approval_state_input) =
    let input = Json_serializers.update_pull_request_approval_state_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.UpdatePullRequestApprovalState" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pull_request_approval_state_input) =
    let input = Json_serializers.update_pull_request_approval_state_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdatePullRequestApprovalState" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdatePullRequestDescription = struct
  let error_to_string = function
    | `InvalidDescriptionException _ -> "com.amazonaws.codecommit#InvalidDescriptionException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidDescriptionException" ->
          `InvalidDescriptionException
            (Json_deserializers.invalid_description_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pull_request_description_input) =
    let input = Json_serializers.update_pull_request_description_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.UpdatePullRequestDescription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pull_request_description_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pull_request_description_input) =
    let input = Json_serializers.update_pull_request_description_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdatePullRequestDescription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pull_request_description_output_of_yojson
      ~error_deserializer
end

module UpdatePullRequestStatus = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidPullRequestStatusException _ ->
        "com.amazonaws.codecommit#InvalidPullRequestStatusException"
    | `InvalidPullRequestStatusUpdateException _ ->
        "com.amazonaws.codecommit#InvalidPullRequestStatusUpdateException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `PullRequestStatusRequiredException _ ->
        "com.amazonaws.codecommit#PullRequestStatusRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidPullRequestStatusException" ->
          `InvalidPullRequestStatusException
            (Json_deserializers.invalid_pull_request_status_exception_of_yojson tree path)
      | _, "InvalidPullRequestStatusUpdateException" ->
          `InvalidPullRequestStatusUpdateException
            (Json_deserializers.invalid_pull_request_status_update_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "PullRequestStatusRequiredException" ->
          `PullRequestStatusRequiredException
            (Json_deserializers.pull_request_status_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pull_request_status_input) =
    let input = Json_serializers.update_pull_request_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.UpdatePullRequestStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pull_request_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pull_request_status_input) =
    let input = Json_serializers.update_pull_request_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdatePullRequestStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pull_request_status_output_of_yojson
      ~error_deserializer
end

module UpdatePullRequestTitle = struct
  let error_to_string = function
    | `InvalidPullRequestIdException _ -> "com.amazonaws.codecommit#InvalidPullRequestIdException"
    | `InvalidTitleException _ -> "com.amazonaws.codecommit#InvalidTitleException"
    | `PullRequestAlreadyClosedException _ ->
        "com.amazonaws.codecommit#PullRequestAlreadyClosedException"
    | `PullRequestDoesNotExistException _ ->
        "com.amazonaws.codecommit#PullRequestDoesNotExistException"
    | `PullRequestIdRequiredException _ -> "com.amazonaws.codecommit#PullRequestIdRequiredException"
    | `TitleRequiredException _ -> "com.amazonaws.codecommit#TitleRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPullRequestIdException" ->
          `InvalidPullRequestIdException
            (Json_deserializers.invalid_pull_request_id_exception_of_yojson tree path)
      | _, "InvalidTitleException" ->
          `InvalidTitleException (Json_deserializers.invalid_title_exception_of_yojson tree path)
      | _, "PullRequestAlreadyClosedException" ->
          `PullRequestAlreadyClosedException
            (Json_deserializers.pull_request_already_closed_exception_of_yojson tree path)
      | _, "PullRequestDoesNotExistException" ->
          `PullRequestDoesNotExistException
            (Json_deserializers.pull_request_does_not_exist_exception_of_yojson tree path)
      | _, "PullRequestIdRequiredException" ->
          `PullRequestIdRequiredException
            (Json_deserializers.pull_request_id_required_exception_of_yojson tree path)
      | _, "TitleRequiredException" ->
          `TitleRequiredException (Json_deserializers.title_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pull_request_title_input) =
    let input = Json_serializers.update_pull_request_title_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.UpdatePullRequestTitle"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pull_request_title_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pull_request_title_input) =
    let input = Json_serializers.update_pull_request_title_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdatePullRequestTitle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pull_request_title_output_of_yojson
      ~error_deserializer
end

module UpdateRepositoryDescription = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryDescriptionException _ ->
        "com.amazonaws.codecommit#InvalidRepositoryDescriptionException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryDescriptionException" ->
          `InvalidRepositoryDescriptionException
            (Json_deserializers.invalid_repository_description_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_repository_description_input) =
    let input = Json_serializers.update_repository_description_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.UpdateRepositoryDescription" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_repository_description_input) =
    let input = Json_serializers.update_repository_description_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdateRepositoryDescription" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateRepositoryEncryptionKey = struct
  let error_to_string = function
    | `EncryptionIntegrityChecksFailedException _ ->
        "com.amazonaws.codecommit#EncryptionIntegrityChecksFailedException"
    | `EncryptionKeyAccessDeniedException _ ->
        "com.amazonaws.codecommit#EncryptionKeyAccessDeniedException"
    | `EncryptionKeyDisabledException _ -> "com.amazonaws.codecommit#EncryptionKeyDisabledException"
    | `EncryptionKeyInvalidIdException _ ->
        "com.amazonaws.codecommit#EncryptionKeyInvalidIdException"
    | `EncryptionKeyInvalidUsageException _ ->
        "com.amazonaws.codecommit#EncryptionKeyInvalidUsageException"
    | `EncryptionKeyNotFoundException _ -> "com.amazonaws.codecommit#EncryptionKeyNotFoundException"
    | `EncryptionKeyRequiredException _ -> "com.amazonaws.codecommit#EncryptionKeyRequiredException"
    | `EncryptionKeyUnavailableException _ ->
        "com.amazonaws.codecommit#EncryptionKeyUnavailableException"
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EncryptionIntegrityChecksFailedException" ->
          `EncryptionIntegrityChecksFailedException
            (Json_deserializers.encryption_integrity_checks_failed_exception_of_yojson tree path)
      | _, "EncryptionKeyAccessDeniedException" ->
          `EncryptionKeyAccessDeniedException
            (Json_deserializers.encryption_key_access_denied_exception_of_yojson tree path)
      | _, "EncryptionKeyDisabledException" ->
          `EncryptionKeyDisabledException
            (Json_deserializers.encryption_key_disabled_exception_of_yojson tree path)
      | _, "EncryptionKeyInvalidIdException" ->
          `EncryptionKeyInvalidIdException
            (Json_deserializers.encryption_key_invalid_id_exception_of_yojson tree path)
      | _, "EncryptionKeyInvalidUsageException" ->
          `EncryptionKeyInvalidUsageException
            (Json_deserializers.encryption_key_invalid_usage_exception_of_yojson tree path)
      | _, "EncryptionKeyNotFoundException" ->
          `EncryptionKeyNotFoundException
            (Json_deserializers.encryption_key_not_found_exception_of_yojson tree path)
      | _, "EncryptionKeyRequiredException" ->
          `EncryptionKeyRequiredException
            (Json_deserializers.encryption_key_required_exception_of_yojson tree path)
      | _, "EncryptionKeyUnavailableException" ->
          `EncryptionKeyUnavailableException
            (Json_deserializers.encryption_key_unavailable_exception_of_yojson tree path)
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_repository_encryption_key_input) =
    let input = Json_serializers.update_repository_encryption_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeCommit_20150413.UpdateRepositoryEncryptionKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_repository_encryption_key_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_repository_encryption_key_input) =
    let input = Json_serializers.update_repository_encryption_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdateRepositoryEncryptionKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_repository_encryption_key_output_of_yojson
      ~error_deserializer
end

module UpdateRepositoryName = struct
  let error_to_string = function
    | `InvalidRepositoryNameException _ -> "com.amazonaws.codecommit#InvalidRepositoryNameException"
    | `RepositoryDoesNotExistException _ ->
        "com.amazonaws.codecommit#RepositoryDoesNotExistException"
    | `RepositoryNameExistsException _ -> "com.amazonaws.codecommit#RepositoryNameExistsException"
    | `RepositoryNameRequiredException _ ->
        "com.amazonaws.codecommit#RepositoryNameRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidRepositoryNameException" ->
          `InvalidRepositoryNameException
            (Json_deserializers.invalid_repository_name_exception_of_yojson tree path)
      | _, "RepositoryDoesNotExistException" ->
          `RepositoryDoesNotExistException
            (Json_deserializers.repository_does_not_exist_exception_of_yojson tree path)
      | _, "RepositoryNameExistsException" ->
          `RepositoryNameExistsException
            (Json_deserializers.repository_name_exists_exception_of_yojson tree path)
      | _, "RepositoryNameRequiredException" ->
          `RepositoryNameRequiredException
            (Json_deserializers.repository_name_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_repository_name_input) =
    let input = Json_serializers.update_repository_name_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeCommit_20150413.UpdateRepositoryName"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_repository_name_input) =
    let input = Json_serializers.update_repository_name_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeCommit_20150413.UpdateRepositoryName" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
