open Smaws_Lib.Json.DeserializeHelpers
open Types

let account_id_of_yojson = string_of_yojson
let message_of_yojson = string_of_yojson

let actor_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : actor_does_not_exist_exception)

let additional_data_of_yojson = string_of_yojson

let approval_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPROVE" -> APPROVE
    | `String "REVOKE" -> REVOKE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApprovalState" value)
    | _ -> raise (deserialize_wrong_type_error path "ApprovalState")
     : approval_state)
    : approval_state)

let arn_of_yojson = string_of_yojson

let approval_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_arn = option_of_yojson (value_for_key arn_of_yojson "userArn") _list path;
     approval_state =
       option_of_yojson (value_for_key approval_state_of_yojson "approvalState") _list path;
   }
    : approval)

let approval_list_of_yojson tree path = list_of_yojson approval_of_yojson tree path
let approval_rule_template_name_of_yojson = string_of_yojson
let approval_rule_template_id_of_yojson = string_of_yojson

let origin_approval_rule_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_id =
       option_of_yojson
         (value_for_key approval_rule_template_id_of_yojson "approvalRuleTemplateId")
         _list path;
     approval_rule_template_name =
       option_of_yojson
         (value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName")
         _list path;
   }
    : origin_approval_rule_template)

let creation_date_of_yojson = timestamp_epoch_seconds_of_yojson
let last_modified_date_of_yojson = timestamp_epoch_seconds_of_yojson
let rule_content_sha256_of_yojson = string_of_yojson
let approval_rule_content_of_yojson = string_of_yojson
let approval_rule_name_of_yojson = string_of_yojson
let approval_rule_id_of_yojson = string_of_yojson

let approval_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_id =
       option_of_yojson (value_for_key approval_rule_id_of_yojson "approvalRuleId") _list path;
     approval_rule_name =
       option_of_yojson (value_for_key approval_rule_name_of_yojson "approvalRuleName") _list path;
     approval_rule_content =
       option_of_yojson
         (value_for_key approval_rule_content_of_yojson "approvalRuleContent")
         _list path;
     rule_content_sha256 =
       option_of_yojson (value_for_key rule_content_sha256_of_yojson "ruleContentSha256") _list path;
     last_modified_date =
       option_of_yojson (value_for_key last_modified_date_of_yojson "lastModifiedDate") _list path;
     creation_date =
       option_of_yojson (value_for_key creation_date_of_yojson "creationDate") _list path;
     last_modified_user =
       option_of_yojson (value_for_key arn_of_yojson "lastModifiedUser") _list path;
     origin_approval_rule_template =
       option_of_yojson
         (value_for_key origin_approval_rule_template_of_yojson "originApprovalRuleTemplate")
         _list path;
   }
    : approval_rule)

let approval_rule_content_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_content_required_exception)

let approval_rule_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_does_not_exist_exception)

let approval_rule_event_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_name =
       option_of_yojson (value_for_key approval_rule_name_of_yojson "approvalRuleName") _list path;
     approval_rule_id =
       option_of_yojson (value_for_key approval_rule_id_of_yojson "approvalRuleId") _list path;
     approval_rule_content =
       option_of_yojson
         (value_for_key approval_rule_content_of_yojson "approvalRuleContent")
         _list path;
   }
    : approval_rule_event_metadata)

let approval_rule_name_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_name_already_exists_exception)

let approval_rule_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_name_required_exception)

let override_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "OVERRIDE" -> OVERRIDE
    | `String "REVOKE" -> REVOKE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OverrideStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OverrideStatus")
     : override_status)
    : override_status)

let revision_id_of_yojson = string_of_yojson

let approval_rule_overridden_event_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id = option_of_yojson (value_for_key revision_id_of_yojson "revisionId") _list path;
     override_status =
       option_of_yojson (value_for_key override_status_of_yojson "overrideStatus") _list path;
   }
    : approval_rule_overridden_event_metadata)

let approval_rule_template_content_of_yojson = string_of_yojson
let approval_rule_template_description_of_yojson = string_of_yojson

let approval_rule_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_id =
       option_of_yojson
         (value_for_key approval_rule_template_id_of_yojson "approvalRuleTemplateId")
         _list path;
     approval_rule_template_name =
       option_of_yojson
         (value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName")
         _list path;
     approval_rule_template_description =
       option_of_yojson
         (value_for_key approval_rule_template_description_of_yojson
            "approvalRuleTemplateDescription")
         _list path;
     approval_rule_template_content =
       option_of_yojson
         (value_for_key approval_rule_template_content_of_yojson "approvalRuleTemplateContent")
         _list path;
     rule_content_sha256 =
       option_of_yojson (value_for_key rule_content_sha256_of_yojson "ruleContentSha256") _list path;
     last_modified_date =
       option_of_yojson (value_for_key last_modified_date_of_yojson "lastModifiedDate") _list path;
     creation_date =
       option_of_yojson (value_for_key creation_date_of_yojson "creationDate") _list path;
     last_modified_user =
       option_of_yojson (value_for_key arn_of_yojson "lastModifiedUser") _list path;
   }
    : approval_rule_template)

let approval_rule_template_content_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_template_content_required_exception)

let approval_rule_template_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_template_does_not_exist_exception)

let approval_rule_template_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_template_in_use_exception)

let approval_rule_template_name_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_template_name_already_exists_exception)

let approval_rule_template_name_list_of_yojson tree path =
  list_of_yojson approval_rule_template_name_of_yojson tree path

let approval_rule_template_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_rule_template_name_required_exception)

let approval_rules_list_of_yojson tree path = list_of_yojson approval_rule_of_yojson tree path

let approval_rules_not_satisfied_list_of_yojson tree path =
  list_of_yojson approval_rule_name_of_yojson tree path

let approval_rules_satisfied_list_of_yojson tree path =
  list_of_yojson approval_rule_name_of_yojson tree path

let approval_state_changed_event_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id = option_of_yojson (value_for_key revision_id_of_yojson "revisionId") _list path;
     approval_status =
       option_of_yojson (value_for_key approval_state_of_yojson "approvalStatus") _list path;
   }
    : approval_state_changed_event_metadata)

let approval_state_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : approval_state_required_exception)

let approved_of_yojson = bool_of_yojson

let repository_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_name_required_exception)

let repository_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_does_not_exist_exception)

let maximum_rule_templates_associated_with_repository_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_rule_templates_associated_with_repository_exception)

let invalid_repository_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_repository_name_exception)

let invalid_approval_rule_template_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_approval_rule_template_name_exception)

let encryption_key_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : encryption_key_unavailable_exception)

let encryption_key_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : encryption_key_not_found_exception)

let encryption_key_disabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : encryption_key_disabled_exception)

let encryption_key_access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : encryption_key_access_denied_exception)

let encryption_integrity_checks_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : encryption_integrity_checks_failed_exception)

let repository_name_of_yojson = string_of_yojson

let associate_approval_rule_template_with_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : associate_approval_rule_template_with_repository_input)

let author_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : author_does_not_exist_exception)

let repository_names_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_names_required_exception)

let maximum_repository_names_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_repository_names_exceeded_exception)

let error_message_of_yojson = string_of_yojson
let error_code_of_yojson = string_of_yojson

let batch_associate_approval_rule_template_with_repositories_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "errorCode") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : batch_associate_approval_rule_template_with_repositories_error)

let batch_associate_approval_rule_template_with_repositories_errors_list_of_yojson tree path =
  list_of_yojson batch_associate_approval_rule_template_with_repositories_error_of_yojson tree path

let repository_name_list_of_yojson tree path = list_of_yojson repository_name_of_yojson tree path

let batch_associate_approval_rule_template_with_repositories_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_repository_names =
       value_for_key repository_name_list_of_yojson "associatedRepositoryNames" _list path;
     errors =
       value_for_key batch_associate_approval_rule_template_with_repositories_errors_list_of_yojson
         "errors" _list path;
   }
    : batch_associate_approval_rule_template_with_repositories_output)

let batch_associate_approval_rule_template_with_repositories_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
     repository_names = value_for_key repository_name_list_of_yojson "repositoryNames" _list path;
   }
    : batch_associate_approval_rule_template_with_repositories_input)

let tips_divergence_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : tips_divergence_exceeded_exception)

let merge_option_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : merge_option_required_exception)

let maximum_items_to_compare_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_items_to_compare_exceeded_exception)

let maximum_file_content_to_load_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_file_content_to_load_exceeded_exception)

let invalid_merge_option_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_merge_option_exception)

let invalid_max_merge_hunks_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_max_merge_hunks_exception)

let invalid_max_conflict_files_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_max_conflict_files_exception)

let invalid_continuation_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_continuation_token_exception)

let invalid_conflict_resolution_strategy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_conflict_resolution_strategy_exception)

let invalid_conflict_detail_level_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_conflict_detail_level_exception)

let invalid_commit_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_commit_exception)

let commit_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : commit_required_exception)

let commit_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : commit_does_not_exist_exception)

let object_id_of_yojson = string_of_yojson
let exception_name_of_yojson = string_of_yojson
let path_of_yojson = string_of_yojson

let batch_describe_merge_conflicts_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = value_for_key path_of_yojson "filePath" _list path;
     exception_name = value_for_key exception_name_of_yojson "exceptionName" _list path;
     message = value_for_key message_of_yojson "message" _list path;
   }
    : batch_describe_merge_conflicts_error)

let batch_describe_merge_conflicts_errors_of_yojson tree path =
  list_of_yojson batch_describe_merge_conflicts_error_of_yojson tree path

let next_token_of_yojson = string_of_yojson
let hunk_content_of_yojson = string_of_yojson
let line_number_of_yojson = int_of_yojson

let merge_hunk_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_line = option_of_yojson (value_for_key line_number_of_yojson "startLine") _list path;
     end_line = option_of_yojson (value_for_key line_number_of_yojson "endLine") _list path;
     hunk_content = option_of_yojson (value_for_key hunk_content_of_yojson "hunkContent") _list path;
   }
    : merge_hunk_detail)

let is_hunk_conflict_of_yojson = bool_of_yojson

let merge_hunk_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_conflict =
       option_of_yojson (value_for_key is_hunk_conflict_of_yojson "isConflict") _list path;
     source = option_of_yojson (value_for_key merge_hunk_detail_of_yojson "source") _list path;
     destination =
       option_of_yojson (value_for_key merge_hunk_detail_of_yojson "destination") _list path;
     base = option_of_yojson (value_for_key merge_hunk_detail_of_yojson "base") _list path;
   }
    : merge_hunk)

let merge_hunks_of_yojson tree path = list_of_yojson merge_hunk_of_yojson tree path

let change_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "A" -> ADDED
    | `String "M" -> MODIFIED
    | `String "D" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChangeTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ChangeTypeEnum")
     : change_type_enum)
    : change_type_enum)

let merge_operations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key change_type_enum_of_yojson "source") _list path;
     destination =
       option_of_yojson (value_for_key change_type_enum_of_yojson "destination") _list path;
   }
    : merge_operations)

let is_object_type_conflict_of_yojson = bool_of_yojson
let is_file_mode_conflict_of_yojson = bool_of_yojson
let is_content_conflict_of_yojson = bool_of_yojson
let capital_boolean_of_yojson = bool_of_yojson

let is_binary_file_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key capital_boolean_of_yojson "source") _list path;
     destination =
       option_of_yojson (value_for_key capital_boolean_of_yojson "destination") _list path;
     base = option_of_yojson (value_for_key capital_boolean_of_yojson "base") _list path;
   }
    : is_binary_file)

let number_of_conflicts_of_yojson = int_of_yojson

let object_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "FILE" -> FILE
    | `String "DIRECTORY" -> DIRECTORY
    | `String "GIT_LINK" -> GIT_LINK
    | `String "SYMBOLIC_LINK" -> SYMBOLIC_LINK
    | `String value -> raise (deserialize_unknown_enum_value_error path "ObjectTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ObjectTypeEnum")
     : object_type_enum)
    : object_type_enum)

let object_types_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key object_type_enum_of_yojson "source") _list path;
     destination =
       option_of_yojson (value_for_key object_type_enum_of_yojson "destination") _list path;
     base = option_of_yojson (value_for_key object_type_enum_of_yojson "base") _list path;
   }
    : object_types)

let file_mode_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXECUTABLE" -> EXECUTABLE
    | `String "NORMAL" -> NORMAL
    | `String "SYMLINK" -> SYMLINK
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileModeTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "FileModeTypeEnum")
     : file_mode_type_enum)
    : file_mode_type_enum)

let file_modes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key file_mode_type_enum_of_yojson "source") _list path;
     destination =
       option_of_yojson (value_for_key file_mode_type_enum_of_yojson "destination") _list path;
     base = option_of_yojson (value_for_key file_mode_type_enum_of_yojson "base") _list path;
   }
    : file_modes)

let file_size_of_yojson = long_of_yojson

let file_sizes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key file_size_of_yojson "source") _list path;
     destination = option_of_yojson (value_for_key file_size_of_yojson "destination") _list path;
     base = option_of_yojson (value_for_key file_size_of_yojson "base") _list path;
   }
    : file_sizes)

let conflict_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = option_of_yojson (value_for_key path_of_yojson "filePath") _list path;
     file_sizes = option_of_yojson (value_for_key file_sizes_of_yojson "fileSizes") _list path;
     file_modes = option_of_yojson (value_for_key file_modes_of_yojson "fileModes") _list path;
     object_types = option_of_yojson (value_for_key object_types_of_yojson "objectTypes") _list path;
     number_of_conflicts =
       option_of_yojson (value_for_key number_of_conflicts_of_yojson "numberOfConflicts") _list path;
     is_binary_file =
       option_of_yojson (value_for_key is_binary_file_of_yojson "isBinaryFile") _list path;
     content_conflict =
       option_of_yojson (value_for_key is_content_conflict_of_yojson "contentConflict") _list path;
     file_mode_conflict =
       option_of_yojson
         (value_for_key is_file_mode_conflict_of_yojson "fileModeConflict")
         _list path;
     object_type_conflict =
       option_of_yojson
         (value_for_key is_object_type_conflict_of_yojson "objectTypeConflict")
         _list path;
     merge_operations =
       option_of_yojson (value_for_key merge_operations_of_yojson "mergeOperations") _list path;
   }
    : conflict_metadata)

let conflict_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conflict_metadata =
       option_of_yojson (value_for_key conflict_metadata_of_yojson "conflictMetadata") _list path;
     merge_hunks = option_of_yojson (value_for_key merge_hunks_of_yojson "mergeHunks") _list path;
   }
    : conflict)

let conflicts_of_yojson tree path = list_of_yojson conflict_of_yojson tree path

let batch_describe_merge_conflicts_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conflicts = value_for_key conflicts_of_yojson "conflicts" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     errors =
       option_of_yojson
         (value_for_key batch_describe_merge_conflicts_errors_of_yojson "errors")
         _list path;
     destination_commit_id = value_for_key object_id_of_yojson "destinationCommitId" _list path;
     source_commit_id = value_for_key object_id_of_yojson "sourceCommitId" _list path;
     base_commit_id = option_of_yojson (value_for_key object_id_of_yojson "baseCommitId") _list path;
   }
    : batch_describe_merge_conflicts_output)

let conflict_resolution_strategy_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ACCEPT_SOURCE" -> ACCEPT_SOURCE
    | `String "ACCEPT_DESTINATION" -> ACCEPT_DESTINATION
    | `String "AUTOMERGE" -> AUTOMERGE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConflictResolutionStrategyTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ConflictResolutionStrategyTypeEnum")
     : conflict_resolution_strategy_type_enum)
    : conflict_resolution_strategy_type_enum)

let conflict_detail_level_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "FILE_LEVEL" -> FILE_LEVEL
    | `String "LINE_LEVEL" -> LINE_LEVEL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConflictDetailLevelTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ConflictDetailLevelTypeEnum")
     : conflict_detail_level_type_enum)
    : conflict_detail_level_type_enum)

let file_paths_of_yojson tree path = list_of_yojson path_of_yojson tree path
let max_results_of_yojson = int_of_yojson

let merge_option_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAST_FORWARD_MERGE" -> FAST_FORWARD_MERGE
    | `String "SQUASH_MERGE" -> SQUASH_MERGE
    | `String "THREE_WAY_MERGE" -> THREE_WAY_MERGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MergeOptionTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "MergeOptionTypeEnum")
     : merge_option_type_enum)
    : merge_option_type_enum)

let commit_name_of_yojson = string_of_yojson

let batch_describe_merge_conflicts_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     merge_option = value_for_key merge_option_type_enum_of_yojson "mergeOption" _list path;
     max_merge_hunks =
       option_of_yojson (value_for_key max_results_of_yojson "maxMergeHunks") _list path;
     max_conflict_files =
       option_of_yojson (value_for_key max_results_of_yojson "maxConflictFiles") _list path;
     file_paths = option_of_yojson (value_for_key file_paths_of_yojson "filePaths") _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : batch_describe_merge_conflicts_input)

let batch_disassociate_approval_rule_template_from_repositories_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "errorCode") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : batch_disassociate_approval_rule_template_from_repositories_error)

let batch_disassociate_approval_rule_template_from_repositories_errors_list_of_yojson tree path =
  list_of_yojson batch_disassociate_approval_rule_template_from_repositories_error_of_yojson tree
    path

let batch_disassociate_approval_rule_template_from_repositories_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disassociated_repository_names =
       value_for_key repository_name_list_of_yojson "disassociatedRepositoryNames" _list path;
     errors =
       value_for_key
         batch_disassociate_approval_rule_template_from_repositories_errors_list_of_yojson "errors"
         _list path;
   }
    : batch_disassociate_approval_rule_template_from_repositories_output)

let batch_disassociate_approval_rule_template_from_repositories_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
     repository_names = value_for_key repository_name_list_of_yojson "repositoryNames" _list path;
   }
    : batch_disassociate_approval_rule_template_from_repositories_input)

let commit_ids_list_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : commit_ids_list_required_exception)

let commit_ids_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : commit_ids_limit_exceeded_exception)

let batch_get_commits_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = option_of_yojson (value_for_key object_id_of_yojson "commitId") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "errorCode") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : batch_get_commits_error)

let batch_get_commits_errors_list_of_yojson tree path =
  list_of_yojson batch_get_commits_error_of_yojson tree path

let date_of_yojson = string_of_yojson
let email_of_yojson = string_of_yojson
let name_of_yojson = string_of_yojson

let user_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     date = option_of_yojson (value_for_key date_of_yojson "date") _list path;
   }
    : user_info)

let parent_list_of_yojson tree path = list_of_yojson object_id_of_yojson tree path

let commit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = option_of_yojson (value_for_key object_id_of_yojson "commitId") _list path;
     tree_id = option_of_yojson (value_for_key object_id_of_yojson "treeId") _list path;
     parents = option_of_yojson (value_for_key parent_list_of_yojson "parents") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     author = option_of_yojson (value_for_key user_info_of_yojson "author") _list path;
     committer = option_of_yojson (value_for_key user_info_of_yojson "committer") _list path;
     additional_data =
       option_of_yojson (value_for_key additional_data_of_yojson "additionalData") _list path;
   }
    : commit)

let commit_objects_list_of_yojson tree path = list_of_yojson commit_of_yojson tree path

let batch_get_commits_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commits = option_of_yojson (value_for_key commit_objects_list_of_yojson "commits") _list path;
     errors =
       option_of_yojson (value_for_key batch_get_commits_errors_list_of_yojson "errors") _list path;
   }
    : batch_get_commits_output)

let commit_ids_input_list_of_yojson tree path = list_of_yojson object_id_of_yojson tree path

let batch_get_commits_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_ids = value_for_key commit_ids_input_list_of_yojson "commitIds" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : batch_get_commits_input)

let batch_get_repositories_error_code_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "EncryptionIntegrityChecksFailedException" ->
        ENCRYPTION_INTEGRITY_CHECKS_FAILED_EXCEPTION
    | `String "EncryptionKeyAccessDeniedException" -> ENCRYPTION_KEY_ACCESS_DENIED_EXCEPTION
    | `String "EncryptionKeyDisabledException" -> ENCRYPTION_KEY_DISABLED_EXCEPTION
    | `String "EncryptionKeyNotFoundException" -> ENCRYPTION_KEY_NOT_FOUND_EXCEPTION
    | `String "EncryptionKeyUnavailableException" -> ENCRYPTION_KEY_UNAVAILABLE_EXCEPTION
    | `String "RepositoryDoesNotExistException" -> REPOSITORY_DOES_NOT_EXIST_EXCEPTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BatchGetRepositoriesErrorCodeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchGetRepositoriesErrorCodeEnum")
     : batch_get_repositories_error_code_enum)
    : batch_get_repositories_error_code_enum)

let repository_id_of_yojson = string_of_yojson

let batch_get_repositories_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_id =
       option_of_yojson (value_for_key repository_id_of_yojson "repositoryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     error_code =
       option_of_yojson
         (value_for_key batch_get_repositories_error_code_enum_of_yojson "errorCode")
         _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : batch_get_repositories_error)

let batch_get_repositories_errors_list_of_yojson tree path =
  list_of_yojson batch_get_repositories_error_of_yojson tree path

let repository_not_found_list_of_yojson tree path =
  list_of_yojson repository_name_of_yojson tree path

let kms_key_id_of_yojson = string_of_yojson
let clone_url_ssh_of_yojson = string_of_yojson
let clone_url_http_of_yojson = string_of_yojson
let branch_name_of_yojson = string_of_yojson
let repository_description_of_yojson = string_of_yojson

let repository_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     repository_id =
       option_of_yojson (value_for_key repository_id_of_yojson "repositoryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     repository_description =
       option_of_yojson
         (value_for_key repository_description_of_yojson "repositoryDescription")
         _list path;
     default_branch =
       option_of_yojson (value_for_key branch_name_of_yojson "defaultBranch") _list path;
     last_modified_date =
       option_of_yojson (value_for_key last_modified_date_of_yojson "lastModifiedDate") _list path;
     creation_date =
       option_of_yojson (value_for_key creation_date_of_yojson "creationDate") _list path;
     clone_url_http =
       option_of_yojson (value_for_key clone_url_http_of_yojson "cloneUrlHttp") _list path;
     clone_url_ssh =
       option_of_yojson (value_for_key clone_url_ssh_of_yojson "cloneUrlSsh") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
   }
    : repository_metadata)

let repository_metadata_list_of_yojson tree path =
  list_of_yojson repository_metadata_of_yojson tree path

let batch_get_repositories_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repositories =
       option_of_yojson (value_for_key repository_metadata_list_of_yojson "repositories") _list path;
     repositories_not_found =
       option_of_yojson
         (value_for_key repository_not_found_list_of_yojson "repositoriesNotFound")
         _list path;
     errors =
       option_of_yojson
         (value_for_key batch_get_repositories_errors_list_of_yojson "errors")
         _list path;
   }
    : batch_get_repositories_output)

let batch_get_repositories_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository_names = value_for_key repository_name_list_of_yojson "repositoryNames" _list path }
    : batch_get_repositories_input)

let before_commit_id_and_after_commit_id_are_same_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : before_commit_id_and_after_commit_id_are_same_exception)

let blob_id_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : blob_id_does_not_exist_exception)

let blob_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : blob_id_required_exception)

let mode_of_yojson = string_of_yojson

let blob_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob_id = option_of_yojson (value_for_key object_id_of_yojson "blobId") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "path") _list path;
     mode = option_of_yojson (value_for_key mode_of_yojson "mode") _list path;
   }
    : blob_metadata)

let branch_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : branch_does_not_exist_exception)

let commit_id_of_yojson = string_of_yojson

let branch_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch_name = option_of_yojson (value_for_key branch_name_of_yojson "branchName") _list path;
     commit_id = option_of_yojson (value_for_key commit_id_of_yojson "commitId") _list path;
   }
    : branch_info)

let branch_name_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : branch_name_exists_exception)

let branch_name_is_tag_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : branch_name_is_tag_name_exception)

let branch_name_list_of_yojson tree path = list_of_yojson branch_name_of_yojson tree path

let branch_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : branch_name_required_exception)

let reaction_value_of_yojson = string_of_yojson
let caller_reactions_of_yojson tree path = list_of_yojson reaction_value_of_yojson tree path

let cannot_delete_approval_rule_from_template_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : cannot_delete_approval_rule_from_template_exception)

let cannot_modify_approval_rule_from_template_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : cannot_modify_approval_rule_from_template_exception)

let client_request_token_of_yojson = string_of_yojson

let client_request_token_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : client_request_token_required_exception)

let repository_name_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_name_exists_exception)

let update_repository_name_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     old_name = value_for_key repository_name_of_yojson "oldName" _list path;
     new_name = value_for_key repository_name_of_yojson "newName" _list path;
   }
    : update_repository_name_input)

let encryption_key_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : encryption_key_required_exception)

let encryption_key_invalid_usage_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : encryption_key_invalid_usage_exception)

let encryption_key_invalid_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : encryption_key_invalid_id_exception)

let update_repository_encryption_key_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_id =
       option_of_yojson (value_for_key repository_id_of_yojson "repositoryId") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     original_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "originalKmsKeyId") _list path;
   }
    : update_repository_encryption_key_output)

let update_repository_encryption_key_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     kms_key_id = value_for_key kms_key_id_of_yojson "kmsKeyId" _list path;
   }
    : update_repository_encryption_key_input)

let invalid_repository_description_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_repository_description_exception)

let update_repository_description_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     repository_description =
       option_of_yojson
         (value_for_key repository_description_of_yojson "repositoryDescription")
         _list path;
   }
    : update_repository_description_input)

let title_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : title_required_exception)

let pull_request_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pull_request_id_required_exception)

let pull_request_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pull_request_does_not_exist_exception)

let pull_request_already_closed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pull_request_already_closed_exception)

let invalid_title_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_title_exception)

let invalid_pull_request_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_pull_request_id_exception)

let is_merged_of_yojson = bool_of_yojson

let merge_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_merged = option_of_yojson (value_for_key is_merged_of_yojson "isMerged") _list path;
     merged_by = option_of_yojson (value_for_key arn_of_yojson "mergedBy") _list path;
     merge_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "mergeCommitId") _list path;
     merge_option =
       option_of_yojson (value_for_key merge_option_type_enum_of_yojson "mergeOption") _list path;
   }
    : merge_metadata)

let reference_name_of_yojson = string_of_yojson

let pull_request_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     source_reference =
       option_of_yojson (value_for_key reference_name_of_yojson "sourceReference") _list path;
     destination_reference =
       option_of_yojson (value_for_key reference_name_of_yojson "destinationReference") _list path;
     destination_commit =
       option_of_yojson (value_for_key commit_id_of_yojson "destinationCommit") _list path;
     source_commit = option_of_yojson (value_for_key commit_id_of_yojson "sourceCommit") _list path;
     merge_base = option_of_yojson (value_for_key commit_id_of_yojson "mergeBase") _list path;
     merge_metadata =
       option_of_yojson (value_for_key merge_metadata_of_yojson "mergeMetadata") _list path;
   }
    : pull_request_target)

let pull_request_target_list_of_yojson tree path =
  list_of_yojson pull_request_target_of_yojson tree path

let pull_request_status_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPEN" -> OPEN
    | `String "CLOSED" -> CLOSED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PullRequestStatusEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "PullRequestStatusEnum")
     : pull_request_status_enum)
    : pull_request_status_enum)

let description_of_yojson = string_of_yojson
let title_of_yojson = string_of_yojson
let pull_request_id_of_yojson = string_of_yojson

let pull_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id =
       option_of_yojson (value_for_key pull_request_id_of_yojson "pullRequestId") _list path;
     title = option_of_yojson (value_for_key title_of_yojson "title") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     last_activity_date =
       option_of_yojson (value_for_key last_modified_date_of_yojson "lastActivityDate") _list path;
     creation_date =
       option_of_yojson (value_for_key creation_date_of_yojson "creationDate") _list path;
     pull_request_status =
       option_of_yojson
         (value_for_key pull_request_status_enum_of_yojson "pullRequestStatus")
         _list path;
     author_arn = option_of_yojson (value_for_key arn_of_yojson "authorArn") _list path;
     pull_request_targets =
       option_of_yojson
         (value_for_key pull_request_target_list_of_yojson "pullRequestTargets")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
     revision_id = option_of_yojson (value_for_key revision_id_of_yojson "revisionId") _list path;
     approval_rules =
       option_of_yojson (value_for_key approval_rules_list_of_yojson "approvalRules") _list path;
   }
    : pull_request)

let update_pull_request_title_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pull_request = value_for_key pull_request_of_yojson "pullRequest" _list path }
    : update_pull_request_title_output)

let update_pull_request_title_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     title = value_for_key title_of_yojson "title" _list path;
   }
    : update_pull_request_title_input)

let pull_request_status_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pull_request_status_required_exception)

let invalid_pull_request_status_update_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_pull_request_status_update_exception)

let invalid_pull_request_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_pull_request_status_exception)

let update_pull_request_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pull_request = value_for_key pull_request_of_yojson "pullRequest" _list path }
    : update_pull_request_status_output)

let update_pull_request_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     pull_request_status =
       value_for_key pull_request_status_enum_of_yojson "pullRequestStatus" _list path;
   }
    : update_pull_request_status_input)

let invalid_description_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_description_exception)

let update_pull_request_description_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pull_request = value_for_key pull_request_of_yojson "pullRequest" _list path }
    : update_pull_request_description_output)

let update_pull_request_description_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     description = value_for_key description_of_yojson "description" _list path;
   }
    : update_pull_request_description_input)

let revision_not_current_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : revision_not_current_exception)

let revision_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : revision_id_required_exception)

let pull_request_cannot_be_approved_by_author_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pull_request_cannot_be_approved_by_author_exception)

let maximum_number_of_approvals_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_number_of_approvals_exceeded_exception)

let invalid_revision_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_revision_id_exception)

let invalid_approval_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_approval_state_exception)

let update_pull_request_approval_state_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     revision_id = value_for_key revision_id_of_yojson "revisionId" _list path;
     approval_state = value_for_key approval_state_of_yojson "approvalState" _list path;
   }
    : update_pull_request_approval_state_input)

let invalid_rule_content_sha256_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_rule_content_sha256_exception)

let invalid_approval_rule_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_approval_rule_name_exception)

let invalid_approval_rule_content_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_approval_rule_content_exception)

let update_pull_request_approval_rule_content_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ approval_rule = value_for_key approval_rule_of_yojson "approvalRule" _list path }
    : update_pull_request_approval_rule_content_output)

let update_pull_request_approval_rule_content_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     approval_rule_name = value_for_key approval_rule_name_of_yojson "approvalRuleName" _list path;
     existing_rule_content_sha256 =
       option_of_yojson
         (value_for_key rule_content_sha256_of_yojson "existingRuleContentSha256")
         _list path;
     new_rule_content = value_for_key approval_rule_content_of_yojson "newRuleContent" _list path;
   }
    : update_pull_request_approval_rule_content_input)

let invalid_branch_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_branch_name_exception)

let update_default_branch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     default_branch_name = value_for_key branch_name_of_yojson "defaultBranchName" _list path;
   }
    : update_default_branch_input)

let invalid_comment_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_comment_id_exception)

let comment_not_created_by_caller_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : comment_not_created_by_caller_exception)

let comment_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : comment_id_required_exception)

let comment_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : comment_does_not_exist_exception)

let comment_deleted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : comment_deleted_exception)

let comment_content_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : comment_content_size_limit_exceeded_exception)

let comment_content_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : comment_content_required_exception)

let count_of_yojson = int_of_yojson

let reaction_counts_map_of_yojson tree path =
  map_of_yojson reaction_value_of_yojson count_of_yojson tree path

let is_comment_deleted_of_yojson = bool_of_yojson
let comment_id_of_yojson = string_of_yojson
let content_of_yojson = string_of_yojson

let comment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment_id = option_of_yojson (value_for_key comment_id_of_yojson "commentId") _list path;
     content = option_of_yojson (value_for_key content_of_yojson "content") _list path;
     in_reply_to = option_of_yojson (value_for_key comment_id_of_yojson "inReplyTo") _list path;
     creation_date =
       option_of_yojson (value_for_key creation_date_of_yojson "creationDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key last_modified_date_of_yojson "lastModifiedDate") _list path;
     author_arn = option_of_yojson (value_for_key arn_of_yojson "authorArn") _list path;
     deleted = option_of_yojson (value_for_key is_comment_deleted_of_yojson "deleted") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
     caller_reactions =
       option_of_yojson (value_for_key caller_reactions_of_yojson "callerReactions") _list path;
     reaction_counts =
       option_of_yojson (value_for_key reaction_counts_map_of_yojson "reactionCounts") _list path;
   }
    : comment)

let update_comment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ comment = option_of_yojson (value_for_key comment_of_yojson "comment") _list path }
    : update_comment_output)

let update_comment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment_id = value_for_key comment_id_of_yojson "commentId" _list path;
     content = value_for_key content_of_yojson "content" _list path;
   }
    : update_comment_input)

let update_approval_rule_template_name_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template =
       value_for_key approval_rule_template_of_yojson "approvalRuleTemplate" _list path;
   }
    : update_approval_rule_template_name_output)

let update_approval_rule_template_name_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     old_approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "oldApprovalRuleTemplateName" _list path;
     new_approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "newApprovalRuleTemplateName" _list path;
   }
    : update_approval_rule_template_name_input)

let invalid_approval_rule_template_description_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_approval_rule_template_description_exception)

let update_approval_rule_template_description_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template =
       value_for_key approval_rule_template_of_yojson "approvalRuleTemplate" _list path;
   }
    : update_approval_rule_template_description_output)

let update_approval_rule_template_description_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
     approval_rule_template_description =
       value_for_key approval_rule_template_description_of_yojson "approvalRuleTemplateDescription"
         _list path;
   }
    : update_approval_rule_template_description_input)

let invalid_approval_rule_template_content_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_approval_rule_template_content_exception)

let update_approval_rule_template_content_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template =
       value_for_key approval_rule_template_of_yojson "approvalRuleTemplate" _list path;
   }
    : update_approval_rule_template_content_output)

let update_approval_rule_template_content_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
     new_rule_content =
       value_for_key approval_rule_template_content_of_yojson "newRuleContent" _list path;
     existing_rule_content_sha256 =
       option_of_yojson
         (value_for_key rule_content_sha256_of_yojson "existingRuleContentSha256")
         _list path;
   }
    : update_approval_rule_template_content_input)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : too_many_tags_exception)

let tag_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : tag_policy_exception)

let tag_keys_list_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : tag_keys_list_required_exception)

let resource_arn_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : resource_arn_required_exception)

let invalid_tag_keys_list_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_tag_keys_list_exception)

let invalid_system_tag_usage_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_system_tag_usage_exception)

let invalid_resource_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_resource_arn_exception)

let tag_key_of_yojson = string_of_yojson
let tag_keys_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_keys_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_input)

let repository_triggers_list_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_triggers_list_required_exception)

let repository_trigger_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_trigger_name_required_exception)

let repository_trigger_events_list_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_trigger_events_list_required_exception)

let repository_trigger_destination_arn_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_trigger_destination_arn_required_exception)

let repository_trigger_branch_name_list_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_trigger_branch_name_list_required_exception)

let maximum_repository_triggers_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_repository_triggers_exceeded_exception)

let maximum_branches_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_branches_exceeded_exception)

let invalid_repository_trigger_region_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_repository_trigger_region_exception)

let invalid_repository_trigger_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_repository_trigger_name_exception)

let invalid_repository_trigger_events_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_repository_trigger_events_exception)

let invalid_repository_trigger_destination_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_repository_trigger_destination_arn_exception)

let invalid_repository_trigger_custom_data_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_repository_trigger_custom_data_exception)

let invalid_repository_trigger_branch_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_repository_trigger_branch_name_exception)

let repository_trigger_execution_failure_message_of_yojson = string_of_yojson
let repository_trigger_name_of_yojson = string_of_yojson

let repository_trigger_execution_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trigger =
       option_of_yojson (value_for_key repository_trigger_name_of_yojson "trigger") _list path;
     failure_message =
       option_of_yojson
         (value_for_key repository_trigger_execution_failure_message_of_yojson "failureMessage")
         _list path;
   }
    : repository_trigger_execution_failure)

let repository_trigger_execution_failure_list_of_yojson tree path =
  list_of_yojson repository_trigger_execution_failure_of_yojson tree path

let repository_trigger_name_list_of_yojson tree path =
  list_of_yojson repository_trigger_name_of_yojson tree path

let test_repository_triggers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     successful_executions =
       option_of_yojson
         (value_for_key repository_trigger_name_list_of_yojson "successfulExecutions")
         _list path;
     failed_executions =
       option_of_yojson
         (value_for_key repository_trigger_execution_failure_list_of_yojson "failedExecutions")
         _list path;
   }
    : test_repository_triggers_output)

let repository_trigger_event_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "all" -> ALL
    | `String "updateReference" -> UPDATE_REFERENCE
    | `String "createReference" -> CREATE_REFERENCE
    | `String "deleteReference" -> DELETE_REFERENCE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RepositoryTriggerEventEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "RepositoryTriggerEventEnum")
     : repository_trigger_event_enum)
    : repository_trigger_event_enum)

let repository_trigger_event_list_of_yojson tree path =
  list_of_yojson repository_trigger_event_enum_of_yojson tree path

let repository_trigger_custom_data_of_yojson = string_of_yojson

let repository_trigger_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key repository_trigger_name_of_yojson "name" _list path;
     destination_arn = value_for_key arn_of_yojson "destinationArn" _list path;
     custom_data =
       option_of_yojson
         (value_for_key repository_trigger_custom_data_of_yojson "customData")
         _list path;
     branches = option_of_yojson (value_for_key branch_name_list_of_yojson "branches") _list path;
     events = value_for_key repository_trigger_event_list_of_yojson "events" _list path;
   }
    : repository_trigger)

let repository_triggers_list_of_yojson tree path =
  list_of_yojson repository_trigger_of_yojson tree path

let test_repository_triggers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     triggers = value_for_key repository_triggers_list_of_yojson "triggers" _list path;
   }
    : test_repository_triggers_input)

let tags_map_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : tags_map_required_exception)

let invalid_tags_map_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_tags_map_exception)

let tag_value_of_yojson = string_of_yojson
let tags_map_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     tags = value_for_key tags_map_of_yojson "tags" _list path;
   }
    : tag_resource_input)

let repository_triggers_configuration_id_of_yojson = string_of_yojson

let put_repository_triggers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_id =
       option_of_yojson
         (value_for_key repository_triggers_configuration_id_of_yojson "configurationId")
         _list path;
   }
    : put_repository_triggers_output)

let put_repository_triggers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     triggers = value_for_key repository_triggers_list_of_yojson "triggers" _list path;
   }
    : put_repository_triggers_input)

let same_file_content_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : same_file_content_exception)

let path_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : path_required_exception)

let parent_commit_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : parent_commit_id_required_exception)

let parent_commit_id_outdated_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : parent_commit_id_outdated_exception)

let parent_commit_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : parent_commit_does_not_exist_exception)

let name_length_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : name_length_exceeded_exception)

let invalid_path_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_path_exception)

let invalid_parent_commit_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_parent_commit_id_exception)

let invalid_file_mode_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_file_mode_exception)

let invalid_email_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_email_exception)

let invalid_deletion_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deletion_parameter_exception)

let folder_content_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : folder_content_size_limit_exceeded_exception)

let file_path_conflicts_with_submodule_path_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_path_conflicts_with_submodule_path_exception)

let file_name_conflicts_with_directory_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_name_conflicts_with_directory_name_exception)

let file_content_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_content_size_limit_exceeded_exception)

let file_content_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_content_required_exception)

let directory_name_conflicts_with_file_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : directory_name_conflicts_with_file_name_exception)

let commit_message_length_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : commit_message_length_exceeded_exception)

let put_file_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = value_for_key object_id_of_yojson "commitId" _list path;
     blob_id = value_for_key object_id_of_yojson "blobId" _list path;
     tree_id = value_for_key object_id_of_yojson "treeId" _list path;
   }
    : put_file_output)

let file_content_of_yojson = blob_of_yojson

let put_file_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     branch_name = value_for_key branch_name_of_yojson "branchName" _list path;
     file_content = value_for_key file_content_of_yojson "fileContent" _list path;
     file_path = value_for_key path_of_yojson "filePath" _list path;
     file_mode =
       option_of_yojson (value_for_key file_mode_type_enum_of_yojson "fileMode") _list path;
     parent_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "parentCommitId") _list path;
     commit_message = option_of_yojson (value_for_key message_of_yojson "commitMessage") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
   }
    : put_file_input)

let reaction_value_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : reaction_value_required_exception)

let reaction_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : reaction_limit_exceeded_exception)

let invalid_reaction_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_reaction_value_exception)

let put_comment_reaction_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment_id = value_for_key comment_id_of_yojson "commentId" _list path;
     reaction_value = value_for_key reaction_value_of_yojson "reactionValue" _list path;
   }
    : put_comment_reaction_input)

let invalid_client_request_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_client_request_token_exception)

let idempotency_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : idempotency_parameter_mismatch_exception)

let post_comment_reply_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ comment = option_of_yojson (value_for_key comment_of_yojson "comment") _list path }
    : post_comment_reply_output)

let post_comment_reply_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     in_reply_to = value_for_key comment_id_of_yojson "inReplyTo" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
     content = value_for_key content_of_yojson "content" _list path;
   }
    : post_comment_reply_input)

let repository_not_associated_with_pull_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_not_associated_with_pull_request_exception)

let path_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : path_does_not_exist_exception)

let invalid_relative_file_version_enum_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_relative_file_version_enum_exception)

let invalid_file_position_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_file_position_exception)

let invalid_file_location_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_file_location_exception)

let invalid_commit_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_commit_id_exception)

let commit_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : commit_id_required_exception)

let relative_file_version_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "BEFORE" -> BEFORE
    | `String "AFTER" -> AFTER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RelativeFileVersionEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "RelativeFileVersionEnum")
     : relative_file_version_enum)
    : relative_file_version_enum)

let position_of_yojson = long_of_yojson

let location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = option_of_yojson (value_for_key path_of_yojson "filePath") _list path;
     file_position = option_of_yojson (value_for_key position_of_yojson "filePosition") _list path;
     relative_file_version =
       option_of_yojson
         (value_for_key relative_file_version_enum_of_yojson "relativeFileVersion")
         _list path;
   }
    : location)

let post_comment_for_pull_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     pull_request_id =
       option_of_yojson (value_for_key pull_request_id_of_yojson "pullRequestId") _list path;
     before_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "beforeCommitId") _list path;
     after_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "afterCommitId") _list path;
     before_blob_id = option_of_yojson (value_for_key object_id_of_yojson "beforeBlobId") _list path;
     after_blob_id = option_of_yojson (value_for_key object_id_of_yojson "afterBlobId") _list path;
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     comment = option_of_yojson (value_for_key comment_of_yojson "comment") _list path;
   }
    : post_comment_for_pull_request_output)

let post_comment_for_pull_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     before_commit_id = value_for_key commit_id_of_yojson "beforeCommitId" _list path;
     after_commit_id = value_for_key commit_id_of_yojson "afterCommitId" _list path;
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     content = value_for_key content_of_yojson "content" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
   }
    : post_comment_for_pull_request_input)

let post_comment_for_compared_commit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     before_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "beforeCommitId") _list path;
     after_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "afterCommitId") _list path;
     before_blob_id = option_of_yojson (value_for_key object_id_of_yojson "beforeBlobId") _list path;
     after_blob_id = option_of_yojson (value_for_key object_id_of_yojson "afterBlobId") _list path;
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     comment = option_of_yojson (value_for_key comment_of_yojson "comment") _list path;
   }
    : post_comment_for_compared_commit_output)

let post_comment_for_compared_commit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     before_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "beforeCommitId") _list path;
     after_commit_id = value_for_key commit_id_of_yojson "afterCommitId" _list path;
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     content = value_for_key content_of_yojson "content" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
   }
    : post_comment_for_compared_commit_input)

let override_status_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : override_status_required_exception)

let override_already_set_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : override_already_set_exception)

let invalid_override_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_override_status_exception)

let override_pull_request_approval_rules_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     revision_id = value_for_key revision_id_of_yojson "revisionId" _list path;
     override_status = value_for_key override_status_of_yojson "overrideStatus" _list path;
   }
    : override_pull_request_approval_rules_input)

let tip_of_source_reference_is_different_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : tip_of_source_reference_is_different_exception)

let replacement_type_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : replacement_type_required_exception)

let replacement_content_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : replacement_content_required_exception)

let pull_request_approval_rules_not_satisfied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : pull_request_approval_rules_not_satisfied_exception)

let multiple_conflict_resolution_entries_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : multiple_conflict_resolution_entries_exception)

let maximum_conflict_resolution_entries_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_conflict_resolution_entries_exceeded_exception)

let manual_merge_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : manual_merge_required_exception)

let invalid_replacement_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_replacement_type_exception)

let invalid_replacement_content_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_replacement_content_exception)

let invalid_conflict_resolution_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_conflict_resolution_exception)

let concurrent_reference_update_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : concurrent_reference_update_exception)

let merge_pull_request_by_three_way_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request = option_of_yojson (value_for_key pull_request_of_yojson "pullRequest") _list path;
   }
    : merge_pull_request_by_three_way_output)

let set_file_mode_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = value_for_key path_of_yojson "filePath" _list path;
     file_mode = value_for_key file_mode_type_enum_of_yojson "fileMode" _list path;
   }
    : set_file_mode_entry)

let set_file_mode_entries_of_yojson tree path =
  list_of_yojson set_file_mode_entry_of_yojson tree path

let delete_file_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ file_path = value_for_key path_of_yojson "filePath" _list path } : delete_file_entry)

let delete_file_entries_of_yojson tree path = list_of_yojson delete_file_entry_of_yojson tree path

let replacement_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEEP_BASE" -> KEEP_BASE
    | `String "KEEP_SOURCE" -> KEEP_SOURCE
    | `String "KEEP_DESTINATION" -> KEEP_DESTINATION
    | `String "USE_NEW_CONTENT" -> USE_NEW_CONTENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplacementTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplacementTypeEnum")
     : replacement_type_enum)
    : replacement_type_enum)

let replace_content_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = value_for_key path_of_yojson "filePath" _list path;
     replacement_type = value_for_key replacement_type_enum_of_yojson "replacementType" _list path;
     content = option_of_yojson (value_for_key file_content_of_yojson "content") _list path;
     file_mode =
       option_of_yojson (value_for_key file_mode_type_enum_of_yojson "fileMode") _list path;
   }
    : replace_content_entry)

let replace_content_entries_of_yojson tree path =
  list_of_yojson replace_content_entry_of_yojson tree path

let conflict_resolution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replace_contents =
       option_of_yojson
         (value_for_key replace_content_entries_of_yojson "replaceContents")
         _list path;
     delete_files =
       option_of_yojson (value_for_key delete_file_entries_of_yojson "deleteFiles") _list path;
     set_file_modes =
       option_of_yojson (value_for_key set_file_mode_entries_of_yojson "setFileModes") _list path;
   }
    : conflict_resolution)

let keep_empty_folders_of_yojson = bool_of_yojson

let merge_pull_request_by_three_way_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_id =
       option_of_yojson (value_for_key object_id_of_yojson "sourceCommitId") _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
     commit_message = option_of_yojson (value_for_key message_of_yojson "commitMessage") _list path;
     author_name = option_of_yojson (value_for_key name_of_yojson "authorName") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     keep_empty_folders =
       option_of_yojson (value_for_key keep_empty_folders_of_yojson "keepEmptyFolders") _list path;
     conflict_resolution =
       option_of_yojson
         (value_for_key conflict_resolution_of_yojson "conflictResolution")
         _list path;
   }
    : merge_pull_request_by_three_way_input)

let merge_pull_request_by_squash_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request = option_of_yojson (value_for_key pull_request_of_yojson "pullRequest") _list path;
   }
    : merge_pull_request_by_squash_output)

let merge_pull_request_by_squash_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_id =
       option_of_yojson (value_for_key object_id_of_yojson "sourceCommitId") _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
     commit_message = option_of_yojson (value_for_key message_of_yojson "commitMessage") _list path;
     author_name = option_of_yojson (value_for_key name_of_yojson "authorName") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     keep_empty_folders =
       option_of_yojson (value_for_key keep_empty_folders_of_yojson "keepEmptyFolders") _list path;
     conflict_resolution =
       option_of_yojson
         (value_for_key conflict_resolution_of_yojson "conflictResolution")
         _list path;
   }
    : merge_pull_request_by_squash_input)

let reference_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : reference_does_not_exist_exception)

let merge_pull_request_by_fast_forward_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request = option_of_yojson (value_for_key pull_request_of_yojson "pullRequest") _list path;
   }
    : merge_pull_request_by_fast_forward_output)

let merge_pull_request_by_fast_forward_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_id =
       option_of_yojson (value_for_key object_id_of_yojson "sourceCommitId") _list path;
   }
    : merge_pull_request_by_fast_forward_input)

let invalid_target_branch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_target_branch_exception)

let file_mode_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_mode_required_exception)

let merge_branches_by_three_way_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = option_of_yojson (value_for_key object_id_of_yojson "commitId") _list path;
     tree_id = option_of_yojson (value_for_key object_id_of_yojson "treeId") _list path;
   }
    : merge_branches_by_three_way_output)

let merge_branches_by_three_way_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     target_branch =
       option_of_yojson (value_for_key branch_name_of_yojson "targetBranch") _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
     author_name = option_of_yojson (value_for_key name_of_yojson "authorName") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     commit_message = option_of_yojson (value_for_key message_of_yojson "commitMessage") _list path;
     keep_empty_folders =
       option_of_yojson (value_for_key keep_empty_folders_of_yojson "keepEmptyFolders") _list path;
     conflict_resolution =
       option_of_yojson
         (value_for_key conflict_resolution_of_yojson "conflictResolution")
         _list path;
   }
    : merge_branches_by_three_way_input)

let merge_branches_by_squash_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = option_of_yojson (value_for_key object_id_of_yojson "commitId") _list path;
     tree_id = option_of_yojson (value_for_key object_id_of_yojson "treeId") _list path;
   }
    : merge_branches_by_squash_output)

let merge_branches_by_squash_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     target_branch =
       option_of_yojson (value_for_key branch_name_of_yojson "targetBranch") _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
     author_name = option_of_yojson (value_for_key name_of_yojson "authorName") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     commit_message = option_of_yojson (value_for_key message_of_yojson "commitMessage") _list path;
     keep_empty_folders =
       option_of_yojson (value_for_key keep_empty_folders_of_yojson "keepEmptyFolders") _list path;
     conflict_resolution =
       option_of_yojson
         (value_for_key conflict_resolution_of_yojson "conflictResolution")
         _list path;
   }
    : merge_branches_by_squash_input)

let merge_branches_by_fast_forward_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = option_of_yojson (value_for_key object_id_of_yojson "commitId") _list path;
     tree_id = option_of_yojson (value_for_key object_id_of_yojson "treeId") _list path;
   }
    : merge_branches_by_fast_forward_output)

let merge_branches_by_fast_forward_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     target_branch =
       option_of_yojson (value_for_key branch_name_of_yojson "targetBranch") _list path;
   }
    : merge_branches_by_fast_forward_input)

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_tags_for_resource_input)

let invalid_max_results_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_max_results_exception)

let list_repositories_for_approval_rule_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_names =
       option_of_yojson (value_for_key repository_name_list_of_yojson "repositoryNames") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_repositories_for_approval_rule_template_output)

let list_repositories_for_approval_rule_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_repositories_for_approval_rule_template_input)

let invalid_sort_by_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_sort_by_exception)

let invalid_order_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_order_exception)

let repository_name_id_pair_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     repository_id =
       option_of_yojson (value_for_key repository_id_of_yojson "repositoryId") _list path;
   }
    : repository_name_id_pair)

let repository_name_id_pair_list_of_yojson tree path =
  list_of_yojson repository_name_id_pair_of_yojson tree path

let list_repositories_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repositories =
       option_of_yojson
         (value_for_key repository_name_id_pair_list_of_yojson "repositories")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_repositories_output)

let order_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ascending" -> ASCENDING
    | `String "descending" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrderEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "OrderEnum")
     : order_enum)
    : order_enum)

let sort_by_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "repositoryName" -> REPOSITORY_NAME
    | `String "lastModifiedDate" -> MODIFIED_DATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortByEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "SortByEnum")
     : sort_by_enum)
    : sort_by_enum)

let list_repositories_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_enum_of_yojson "sortBy") _list path;
     order = option_of_yojson (value_for_key order_enum_of_yojson "order") _list path;
   }
    : list_repositories_input)

let invalid_author_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_author_arn_exception)

let pull_request_id_list_of_yojson tree path = list_of_yojson pull_request_id_of_yojson tree path

let list_pull_requests_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_ids = value_for_key pull_request_id_list_of_yojson "pullRequestIds" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_pull_requests_output)

let list_pull_requests_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     author_arn = option_of_yojson (value_for_key arn_of_yojson "authorArn") _list path;
     pull_request_status =
       option_of_yojson
         (value_for_key pull_request_status_enum_of_yojson "pullRequestStatus")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_pull_requests_input)

let revision_children_of_yojson tree path = list_of_yojson revision_id_of_yojson tree path

let file_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit = option_of_yojson (value_for_key commit_of_yojson "commit") _list path;
     blob_id = option_of_yojson (value_for_key object_id_of_yojson "blobId") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "path") _list path;
     revision_children =
       option_of_yojson (value_for_key revision_children_of_yojson "revisionChildren") _list path;
   }
    : file_version)

let revision_dag_of_yojson tree path = list_of_yojson file_version_of_yojson tree path

let list_file_commit_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_dag = value_for_key revision_dag_of_yojson "revisionDag" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_file_commit_history_response)

let limit_of_yojson = int_of_yojson

let list_file_commit_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     commit_specifier =
       option_of_yojson (value_for_key commit_name_of_yojson "commitSpecifier") _list path;
     file_path = value_for_key path_of_yojson "filePath" _list path;
     max_results = option_of_yojson (value_for_key limit_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_file_commit_history_request)

let list_branches_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branches = option_of_yojson (value_for_key branch_name_list_of_yojson "branches") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_branches_output)

let list_branches_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_branches_input)

let list_associated_approval_rule_templates_for_repository_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_names =
       option_of_yojson
         (value_for_key approval_rule_template_name_list_of_yojson "approvalRuleTemplateNames")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_associated_approval_rule_templates_for_repository_output)

let list_associated_approval_rule_templates_for_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_associated_approval_rule_templates_for_repository_input)

let list_approval_rule_templates_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_names =
       option_of_yojson
         (value_for_key approval_rule_template_name_list_of_yojson "approvalRuleTemplateNames")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_approval_rule_templates_output)

let list_approval_rule_templates_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_approval_rule_templates_input)

let get_repository_triggers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_id =
       option_of_yojson
         (value_for_key repository_triggers_configuration_id_of_yojson "configurationId")
         _list path;
     triggers =
       option_of_yojson (value_for_key repository_triggers_list_of_yojson "triggers") _list path;
   }
    : get_repository_triggers_output)

let get_repository_triggers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path }
    : get_repository_triggers_input)

let get_repository_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_metadata =
       option_of_yojson
         (value_for_key repository_metadata_of_yojson "repositoryMetadata")
         _list path;
   }
    : get_repository_output)

let get_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path }
    : get_repository_input)

let overridden_of_yojson = bool_of_yojson

let get_pull_request_override_state_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overridden = option_of_yojson (value_for_key overridden_of_yojson "overridden") _list path;
     overrider = option_of_yojson (value_for_key arn_of_yojson "overrider") _list path;
   }
    : get_pull_request_override_state_output)

let get_pull_request_override_state_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     revision_id = value_for_key revision_id_of_yojson "revisionId" _list path;
   }
    : get_pull_request_override_state_input)

let get_pull_request_approval_states_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ approvals = option_of_yojson (value_for_key approval_list_of_yojson "approvals") _list path }
    : get_pull_request_approval_states_output)

let get_pull_request_approval_states_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     revision_id = value_for_key revision_id_of_yojson "revisionId" _list path;
   }
    : get_pull_request_approval_states_input)

let get_pull_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pull_request = value_for_key pull_request_of_yojson "pullRequest" _list path }
    : get_pull_request_output)

let get_pull_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path }
    : get_pull_request_input)

let merge_options_of_yojson tree path = list_of_yojson merge_option_type_enum_of_yojson tree path

let get_merge_options_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     merge_options = value_for_key merge_options_of_yojson "mergeOptions" _list path;
     source_commit_id = value_for_key object_id_of_yojson "sourceCommitId" _list path;
     destination_commit_id = value_for_key object_id_of_yojson "destinationCommitId" _list path;
     base_commit_id = value_for_key object_id_of_yojson "baseCommitId" _list path;
   }
    : get_merge_options_output)

let get_merge_options_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
   }
    : get_merge_options_input)

let invalid_source_commit_specifier_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_source_commit_specifier_exception)

let invalid_destination_commit_specifier_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_destination_commit_specifier_exception)

let conflict_metadata_list_of_yojson tree path =
  list_of_yojson conflict_metadata_of_yojson tree path

let is_mergeable_of_yojson = bool_of_yojson

let get_merge_conflicts_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mergeable = value_for_key is_mergeable_of_yojson "mergeable" _list path;
     destination_commit_id = value_for_key object_id_of_yojson "destinationCommitId" _list path;
     source_commit_id = value_for_key object_id_of_yojson "sourceCommitId" _list path;
     base_commit_id = option_of_yojson (value_for_key object_id_of_yojson "baseCommitId") _list path;
     conflict_metadata_list =
       value_for_key conflict_metadata_list_of_yojson "conflictMetadataList" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_merge_conflicts_output)

let get_merge_conflicts_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     merge_option = value_for_key merge_option_type_enum_of_yojson "mergeOption" _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     max_conflict_files =
       option_of_yojson (value_for_key max_results_of_yojson "maxConflictFiles") _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_merge_conflicts_input)

let get_merge_commit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_commit_id =
       option_of_yojson (value_for_key object_id_of_yojson "sourceCommitId") _list path;
     destination_commit_id =
       option_of_yojson (value_for_key object_id_of_yojson "destinationCommitId") _list path;
     base_commit_id = option_of_yojson (value_for_key object_id_of_yojson "baseCommitId") _list path;
     merged_commit_id =
       option_of_yojson (value_for_key object_id_of_yojson "mergedCommitId") _list path;
   }
    : get_merge_commit_output)

let get_merge_commit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
   }
    : get_merge_commit_input)

let folder_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : folder_does_not_exist_exception)

let sub_module_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = option_of_yojson (value_for_key object_id_of_yojson "commitId") _list path;
     absolute_path = option_of_yojson (value_for_key path_of_yojson "absolutePath") _list path;
     relative_path = option_of_yojson (value_for_key path_of_yojson "relativePath") _list path;
   }
    : sub_module)

let sub_module_list_of_yojson tree path = list_of_yojson sub_module_of_yojson tree path

let symbolic_link_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob_id = option_of_yojson (value_for_key object_id_of_yojson "blobId") _list path;
     absolute_path = option_of_yojson (value_for_key path_of_yojson "absolutePath") _list path;
     relative_path = option_of_yojson (value_for_key path_of_yojson "relativePath") _list path;
     file_mode =
       option_of_yojson (value_for_key file_mode_type_enum_of_yojson "fileMode") _list path;
   }
    : symbolic_link)

let symbolic_link_list_of_yojson tree path = list_of_yojson symbolic_link_of_yojson tree path

let file_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob_id = option_of_yojson (value_for_key object_id_of_yojson "blobId") _list path;
     absolute_path = option_of_yojson (value_for_key path_of_yojson "absolutePath") _list path;
     relative_path = option_of_yojson (value_for_key path_of_yojson "relativePath") _list path;
     file_mode =
       option_of_yojson (value_for_key file_mode_type_enum_of_yojson "fileMode") _list path;
   }
    : file)

let file_list_of_yojson tree path = list_of_yojson file_of_yojson tree path

let folder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tree_id = option_of_yojson (value_for_key object_id_of_yojson "treeId") _list path;
     absolute_path = option_of_yojson (value_for_key path_of_yojson "absolutePath") _list path;
     relative_path = option_of_yojson (value_for_key path_of_yojson "relativePath") _list path;
   }
    : folder)

let folder_list_of_yojson tree path = list_of_yojson folder_of_yojson tree path

let get_folder_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = value_for_key object_id_of_yojson "commitId" _list path;
     folder_path = value_for_key path_of_yojson "folderPath" _list path;
     tree_id = option_of_yojson (value_for_key object_id_of_yojson "treeId") _list path;
     sub_folders = option_of_yojson (value_for_key folder_list_of_yojson "subFolders") _list path;
     files = option_of_yojson (value_for_key file_list_of_yojson "files") _list path;
     symbolic_links =
       option_of_yojson (value_for_key symbolic_link_list_of_yojson "symbolicLinks") _list path;
     sub_modules =
       option_of_yojson (value_for_key sub_module_list_of_yojson "subModules") _list path;
   }
    : get_folder_output)

let get_folder_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     commit_specifier =
       option_of_yojson (value_for_key commit_name_of_yojson "commitSpecifier") _list path;
     folder_path = value_for_key path_of_yojson "folderPath" _list path;
   }
    : get_folder_input)

let file_too_large_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_too_large_exception)

let file_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_does_not_exist_exception)

let object_size_of_yojson = long_of_yojson

let get_file_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = value_for_key object_id_of_yojson "commitId" _list path;
     blob_id = value_for_key object_id_of_yojson "blobId" _list path;
     file_path = value_for_key path_of_yojson "filePath" _list path;
     file_mode = value_for_key file_mode_type_enum_of_yojson "fileMode" _list path;
     file_size = value_for_key object_size_of_yojson "fileSize" _list path;
     file_content = value_for_key file_content_of_yojson "fileContent" _list path;
   }
    : get_file_output)

let get_file_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     commit_specifier =
       option_of_yojson (value_for_key commit_name_of_yojson "commitSpecifier") _list path;
     file_path = value_for_key path_of_yojson "filePath" _list path;
   }
    : get_file_input)

let difference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     before_blob = option_of_yojson (value_for_key blob_metadata_of_yojson "beforeBlob") _list path;
     after_blob = option_of_yojson (value_for_key blob_metadata_of_yojson "afterBlob") _list path;
     change_type =
       option_of_yojson (value_for_key change_type_enum_of_yojson "changeType") _list path;
   }
    : difference)

let difference_list_of_yojson tree path = list_of_yojson difference_of_yojson tree path

let get_differences_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     differences =
       option_of_yojson (value_for_key difference_list_of_yojson "differences") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_differences_output)

let get_differences_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     before_commit_specifier =
       option_of_yojson (value_for_key commit_name_of_yojson "beforeCommitSpecifier") _list path;
     after_commit_specifier = value_for_key commit_name_of_yojson "afterCommitSpecifier" _list path;
     before_path = option_of_yojson (value_for_key path_of_yojson "beforePath") _list path;
     after_path = option_of_yojson (value_for_key path_of_yojson "afterPath") _list path;
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_differences_input)

let commit_id_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : commit_id_does_not_exist_exception)

let get_commit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ commit = value_for_key commit_of_yojson "commit" _list path } : get_commit_output)

let get_commit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     commit_id = value_for_key object_id_of_yojson "commitId" _list path;
   }
    : get_commit_input)

let comments_of_yojson tree path = list_of_yojson comment_of_yojson tree path

let comments_for_pull_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id =
       option_of_yojson (value_for_key pull_request_id_of_yojson "pullRequestId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     before_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "beforeCommitId") _list path;
     after_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "afterCommitId") _list path;
     before_blob_id = option_of_yojson (value_for_key object_id_of_yojson "beforeBlobId") _list path;
     after_blob_id = option_of_yojson (value_for_key object_id_of_yojson "afterBlobId") _list path;
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     comments = option_of_yojson (value_for_key comments_of_yojson "comments") _list path;
   }
    : comments_for_pull_request)

let comments_for_pull_request_data_of_yojson tree path =
  list_of_yojson comments_for_pull_request_of_yojson tree path

let get_comments_for_pull_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comments_for_pull_request_data =
       option_of_yojson
         (value_for_key comments_for_pull_request_data_of_yojson "commentsForPullRequestData")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_comments_for_pull_request_output)

let get_comments_for_pull_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     before_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "beforeCommitId") _list path;
     after_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "afterCommitId") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_comments_for_pull_request_input)

let comments_for_compared_commit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     before_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "beforeCommitId") _list path;
     after_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "afterCommitId") _list path;
     before_blob_id = option_of_yojson (value_for_key object_id_of_yojson "beforeBlobId") _list path;
     after_blob_id = option_of_yojson (value_for_key object_id_of_yojson "afterBlobId") _list path;
     location = option_of_yojson (value_for_key location_of_yojson "location") _list path;
     comments = option_of_yojson (value_for_key comments_of_yojson "comments") _list path;
   }
    : comments_for_compared_commit)

let comments_for_compared_commit_data_of_yojson tree path =
  list_of_yojson comments_for_compared_commit_of_yojson tree path

let get_comments_for_compared_commit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comments_for_compared_commit_data =
       option_of_yojson
         (value_for_key comments_for_compared_commit_data_of_yojson "commentsForComparedCommitData")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_comments_for_compared_commit_output)

let get_comments_for_compared_commit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     before_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "beforeCommitId") _list path;
     after_commit_id = value_for_key commit_id_of_yojson "afterCommitId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_comments_for_compared_commit_input)

let invalid_reaction_user_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_reaction_user_arn_exception)

let reaction_users_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path
let reaction_unicode_of_yojson = string_of_yojson
let reaction_short_code_of_yojson = string_of_yojson
let reaction_emoji_of_yojson = string_of_yojson

let reaction_value_formats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     emoji = option_of_yojson (value_for_key reaction_emoji_of_yojson "emoji") _list path;
     short_code =
       option_of_yojson (value_for_key reaction_short_code_of_yojson "shortCode") _list path;
     unicode = option_of_yojson (value_for_key reaction_unicode_of_yojson "unicode") _list path;
   }
    : reaction_value_formats)

let reaction_for_comment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reaction =
       option_of_yojson (value_for_key reaction_value_formats_of_yojson "reaction") _list path;
     reaction_users =
       option_of_yojson (value_for_key reaction_users_list_of_yojson "reactionUsers") _list path;
     reactions_from_deleted_users_count =
       option_of_yojson (value_for_key count_of_yojson "reactionsFromDeletedUsersCount") _list path;
   }
    : reaction_for_comment)

let reactions_for_comment_list_of_yojson tree path =
  list_of_yojson reaction_for_comment_of_yojson tree path

let get_comment_reactions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reactions_for_comment =
       value_for_key reactions_for_comment_list_of_yojson "reactionsForComment" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_comment_reactions_output)

let get_comment_reactions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment_id = value_for_key comment_id_of_yojson "commentId" _list path;
     reaction_user_arn = option_of_yojson (value_for_key arn_of_yojson "reactionUserArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : get_comment_reactions_input)

let get_comment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ comment = option_of_yojson (value_for_key comment_of_yojson "comment") _list path }
    : get_comment_output)

let get_comment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ comment_id = value_for_key comment_id_of_yojson "commentId" _list path } : get_comment_input)

let get_branch_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ branch = option_of_yojson (value_for_key branch_info_of_yojson "branch") _list path }
    : get_branch_output)

let get_branch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     branch_name = option_of_yojson (value_for_key branch_name_of_yojson "branchName") _list path;
   }
    : get_branch_input)

let invalid_blob_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_blob_id_exception)

let blob_of_yojson = blob_of_yojson

let get_blob_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ content = value_for_key blob_of_yojson "content" _list path } : get_blob_output)

let get_blob_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     blob_id = value_for_key object_id_of_yojson "blobId" _list path;
   }
    : get_blob_input)

let get_approval_rule_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template =
       value_for_key approval_rule_template_of_yojson "approvalRuleTemplate" _list path;
   }
    : get_approval_rule_template_output)

let get_approval_rule_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
   }
    : get_approval_rule_template_input)

let evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approved = option_of_yojson (value_for_key approved_of_yojson "approved") _list path;
     overridden = option_of_yojson (value_for_key overridden_of_yojson "overridden") _list path;
     approval_rules_satisfied =
       option_of_yojson
         (value_for_key approval_rules_satisfied_list_of_yojson "approvalRulesSatisfied")
         _list path;
     approval_rules_not_satisfied =
       option_of_yojson
         (value_for_key approval_rules_not_satisfied_list_of_yojson "approvalRulesNotSatisfied")
         _list path;
   }
    : evaluation)

let evaluate_pull_request_approval_rules_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ evaluation = value_for_key evaluation_of_yojson "evaluation" _list path }
    : evaluate_pull_request_approval_rules_output)

let evaluate_pull_request_approval_rules_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     revision_id = value_for_key revision_id_of_yojson "revisionId" _list path;
   }
    : evaluate_pull_request_approval_rules_input)

let disassociate_approval_rule_template_from_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : disassociate_approval_rule_template_from_repository_input)

let invalid_pull_request_event_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_pull_request_event_type_exception)

let invalid_actor_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_actor_arn_exception)

let pull_request_merged_state_changed_event_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     destination_reference =
       option_of_yojson (value_for_key reference_name_of_yojson "destinationReference") _list path;
     merge_metadata =
       option_of_yojson (value_for_key merge_metadata_of_yojson "mergeMetadata") _list path;
   }
    : pull_request_merged_state_changed_event_metadata)

let pull_request_source_reference_updated_event_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     before_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "beforeCommitId") _list path;
     after_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "afterCommitId") _list path;
     merge_base = option_of_yojson (value_for_key commit_id_of_yojson "mergeBase") _list path;
   }
    : pull_request_source_reference_updated_event_metadata)

let pull_request_status_changed_event_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_status =
       option_of_yojson
         (value_for_key pull_request_status_enum_of_yojson "pullRequestStatus")
         _list path;
   }
    : pull_request_status_changed_event_metadata)

let pull_request_created_event_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     source_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "sourceCommitId") _list path;
     destination_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "destinationCommitId") _list path;
     merge_base = option_of_yojson (value_for_key commit_id_of_yojson "mergeBase") _list path;
   }
    : pull_request_created_event_metadata)

let pull_request_event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PULL_REQUEST_CREATED" -> PULL_REQUEST_CREATED
    | `String "PULL_REQUEST_STATUS_CHANGED" -> PULL_REQUEST_STATUS_CHANGED
    | `String "PULL_REQUEST_SOURCE_REFERENCE_UPDATED" -> PULL_REQUEST_SOURCE_REFERENCE_UPDATED
    | `String "PULL_REQUEST_MERGE_STATE_CHANGED" -> PULL_REQUEST_MERGE_STATE_CHANGED
    | `String "PULL_REQUEST_APPROVAL_RULE_CREATED" -> PULL_REQUEST_APPROVAL_RULE_CREATED
    | `String "PULL_REQUEST_APPROVAL_RULE_UPDATED" -> PULL_REQUEST_APPROVAL_RULE_UPDATED
    | `String "PULL_REQUEST_APPROVAL_RULE_DELETED" -> PULL_REQUEST_APPROVAL_RULE_DELETED
    | `String "PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN" -> PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN
    | `String "PULL_REQUEST_APPROVAL_STATE_CHANGED" -> PULL_REQUEST_APPROVAL_STATE_CHANGED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PullRequestEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "PullRequestEventType")
     : pull_request_event_type)
    : pull_request_event_type)

let event_date_of_yojson = timestamp_epoch_seconds_of_yojson

let pull_request_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id =
       option_of_yojson (value_for_key pull_request_id_of_yojson "pullRequestId") _list path;
     event_date = option_of_yojson (value_for_key event_date_of_yojson "eventDate") _list path;
     pull_request_event_type =
       option_of_yojson
         (value_for_key pull_request_event_type_of_yojson "pullRequestEventType")
         _list path;
     actor_arn = option_of_yojson (value_for_key arn_of_yojson "actorArn") _list path;
     pull_request_created_event_metadata =
       option_of_yojson
         (value_for_key pull_request_created_event_metadata_of_yojson
            "pullRequestCreatedEventMetadata")
         _list path;
     pull_request_status_changed_event_metadata =
       option_of_yojson
         (value_for_key pull_request_status_changed_event_metadata_of_yojson
            "pullRequestStatusChangedEventMetadata")
         _list path;
     pull_request_source_reference_updated_event_metadata =
       option_of_yojson
         (value_for_key pull_request_source_reference_updated_event_metadata_of_yojson
            "pullRequestSourceReferenceUpdatedEventMetadata")
         _list path;
     pull_request_merged_state_changed_event_metadata =
       option_of_yojson
         (value_for_key pull_request_merged_state_changed_event_metadata_of_yojson
            "pullRequestMergedStateChangedEventMetadata")
         _list path;
     approval_rule_event_metadata =
       option_of_yojson
         (value_for_key approval_rule_event_metadata_of_yojson "approvalRuleEventMetadata")
         _list path;
     approval_state_changed_event_metadata =
       option_of_yojson
         (value_for_key approval_state_changed_event_metadata_of_yojson
            "approvalStateChangedEventMetadata")
         _list path;
     approval_rule_overridden_event_metadata =
       option_of_yojson
         (value_for_key approval_rule_overridden_event_metadata_of_yojson
            "approvalRuleOverriddenEventMetadata")
         _list path;
   }
    : pull_request_event)

let pull_request_event_list_of_yojson tree path =
  list_of_yojson pull_request_event_of_yojson tree path

let describe_pull_request_events_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_events =
       value_for_key pull_request_event_list_of_yojson "pullRequestEvents" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_pull_request_events_output)

let describe_pull_request_events_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     pull_request_event_type =
       option_of_yojson
         (value_for_key pull_request_event_type_of_yojson "pullRequestEventType")
         _list path;
     actor_arn = option_of_yojson (value_for_key arn_of_yojson "actorArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_pull_request_events_input)

let describe_merge_conflicts_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conflict_metadata = value_for_key conflict_metadata_of_yojson "conflictMetadata" _list path;
     merge_hunks = value_for_key merge_hunks_of_yojson "mergeHunks" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     destination_commit_id = value_for_key object_id_of_yojson "destinationCommitId" _list path;
     source_commit_id = value_for_key object_id_of_yojson "sourceCommitId" _list path;
     base_commit_id = option_of_yojson (value_for_key object_id_of_yojson "baseCommitId") _list path;
   }
    : describe_merge_conflicts_output)

let describe_merge_conflicts_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     merge_option = value_for_key merge_option_type_enum_of_yojson "mergeOption" _list path;
     max_merge_hunks =
       option_of_yojson (value_for_key max_results_of_yojson "maxMergeHunks") _list path;
     file_path = value_for_key path_of_yojson "filePath" _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_merge_conflicts_input)

let delete_repository_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_id =
       option_of_yojson (value_for_key repository_id_of_yojson "repositoryId") _list path;
   }
    : delete_repository_output)

let delete_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path }
    : delete_repository_input)

let delete_pull_request_approval_rule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ approval_rule_id = value_for_key approval_rule_id_of_yojson "approvalRuleId" _list path }
    : delete_pull_request_approval_rule_output)

let delete_pull_request_approval_rule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     approval_rule_name = value_for_key approval_rule_name_of_yojson "approvalRuleName" _list path;
   }
    : delete_pull_request_approval_rule_input)

let delete_file_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = value_for_key object_id_of_yojson "commitId" _list path;
     blob_id = value_for_key object_id_of_yojson "blobId" _list path;
     tree_id = value_for_key object_id_of_yojson "treeId" _list path;
     file_path = value_for_key path_of_yojson "filePath" _list path;
   }
    : delete_file_output)

let delete_file_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     branch_name = value_for_key branch_name_of_yojson "branchName" _list path;
     file_path = value_for_key path_of_yojson "filePath" _list path;
     parent_commit_id = value_for_key commit_id_of_yojson "parentCommitId" _list path;
     keep_empty_folders =
       option_of_yojson (value_for_key keep_empty_folders_of_yojson "keepEmptyFolders") _list path;
     commit_message = option_of_yojson (value_for_key message_of_yojson "commitMessage") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
   }
    : delete_file_input)

let delete_comment_content_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ comment = option_of_yojson (value_for_key comment_of_yojson "comment") _list path }
    : delete_comment_content_output)

let delete_comment_content_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ comment_id = value_for_key comment_id_of_yojson "commentId" _list path }
    : delete_comment_content_input)

let default_branch_cannot_be_deleted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : default_branch_cannot_be_deleted_exception)

let delete_branch_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deleted_branch =
       option_of_yojson (value_for_key branch_info_of_yojson "deletedBranch") _list path;
   }
    : delete_branch_output)

let delete_branch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     branch_name = value_for_key branch_name_of_yojson "branchName" _list path;
   }
    : delete_branch_input)

let delete_approval_rule_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_id =
       value_for_key approval_rule_template_id_of_yojson "approvalRuleTemplateId" _list path;
   }
    : delete_approval_rule_template_output)

let delete_approval_rule_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
   }
    : delete_approval_rule_template_input)

let create_unreferenced_merge_commit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = option_of_yojson (value_for_key object_id_of_yojson "commitId") _list path;
     tree_id = option_of_yojson (value_for_key object_id_of_yojson "treeId") _list path;
   }
    : create_unreferenced_merge_commit_output)

let create_unreferenced_merge_commit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_commit_specifier =
       value_for_key commit_name_of_yojson "sourceCommitSpecifier" _list path;
     destination_commit_specifier =
       value_for_key commit_name_of_yojson "destinationCommitSpecifier" _list path;
     merge_option = value_for_key merge_option_type_enum_of_yojson "mergeOption" _list path;
     conflict_detail_level =
       option_of_yojson
         (value_for_key conflict_detail_level_type_enum_of_yojson "conflictDetailLevel")
         _list path;
     conflict_resolution_strategy =
       option_of_yojson
         (value_for_key conflict_resolution_strategy_type_enum_of_yojson
            "conflictResolutionStrategy")
         _list path;
     author_name = option_of_yojson (value_for_key name_of_yojson "authorName") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     commit_message = option_of_yojson (value_for_key message_of_yojson "commitMessage") _list path;
     keep_empty_folders =
       option_of_yojson (value_for_key keep_empty_folders_of_yojson "keepEmptyFolders") _list path;
     conflict_resolution =
       option_of_yojson
         (value_for_key conflict_resolution_of_yojson "conflictResolution")
         _list path;
   }
    : create_unreferenced_merge_commit_input)

let repository_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : repository_limit_exceeded_exception)

let operation_not_allowed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : operation_not_allowed_exception)

let create_repository_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_metadata =
       option_of_yojson
         (value_for_key repository_metadata_of_yojson "repositoryMetadata")
         _list path;
   }
    : create_repository_output)

let create_repository_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     repository_description =
       option_of_yojson
         (value_for_key repository_description_of_yojson "repositoryDescription")
         _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "tags") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
   }
    : create_repository_input)

let number_of_rules_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : number_of_rules_exceeded_exception)

let create_pull_request_approval_rule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ approval_rule = value_for_key approval_rule_of_yojson "approvalRule" _list path }
    : create_pull_request_approval_rule_output)

let create_pull_request_approval_rule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_request_id = value_for_key pull_request_id_of_yojson "pullRequestId" _list path;
     approval_rule_name = value_for_key approval_rule_name_of_yojson "approvalRuleName" _list path;
     approval_rule_content =
       value_for_key approval_rule_content_of_yojson "approvalRuleContent" _list path;
   }
    : create_pull_request_approval_rule_input)

let targets_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : targets_required_exception)

let target_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : target_required_exception)

let source_and_destination_are_same_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : source_and_destination_are_same_exception)

let reference_type_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : reference_type_not_supported_exception)

let reference_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : reference_name_required_exception)

let multiple_repositories_in_pull_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : multiple_repositories_in_pull_request_exception)

let maximum_open_pull_requests_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_open_pull_requests_exceeded_exception)

let invalid_targets_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_targets_exception)

let invalid_target_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_target_exception)

let invalid_reference_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_reference_name_exception)

let create_pull_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pull_request = value_for_key pull_request_of_yojson "pullRequest" _list path }
    : create_pull_request_output)

let target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     source_reference = value_for_key reference_name_of_yojson "sourceReference" _list path;
     destination_reference =
       option_of_yojson (value_for_key reference_name_of_yojson "destinationReference") _list path;
   }
    : target)

let target_list_of_yojson tree path = list_of_yojson target_of_yojson tree path

let create_pull_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     title = value_for_key title_of_yojson "title" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     targets = value_for_key target_list_of_yojson "targets" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
   }
    : create_pull_request_input)

let source_file_or_content_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : source_file_or_content_required_exception)

let same_path_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : same_path_request_exception)

let restricted_source_file_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : restricted_source_file_exception)

let put_file_entry_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : put_file_entry_conflict_exception)

let no_change_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : no_change_exception)

let maximum_file_entries_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : maximum_file_entries_exceeded_exception)

let file_entry_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_entry_required_exception)

let file_content_and_source_file_specified_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : file_content_and_source_file_specified_exception)

let file_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     absolute_path = option_of_yojson (value_for_key path_of_yojson "absolutePath") _list path;
     blob_id = option_of_yojson (value_for_key object_id_of_yojson "blobId") _list path;
     file_mode =
       option_of_yojson (value_for_key file_mode_type_enum_of_yojson "fileMode") _list path;
   }
    : file_metadata)

let files_metadata_of_yojson tree path = list_of_yojson file_metadata_of_yojson tree path

let create_commit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commit_id = option_of_yojson (value_for_key object_id_of_yojson "commitId") _list path;
     tree_id = option_of_yojson (value_for_key object_id_of_yojson "treeId") _list path;
     files_added = option_of_yojson (value_for_key files_metadata_of_yojson "filesAdded") _list path;
     files_updated =
       option_of_yojson (value_for_key files_metadata_of_yojson "filesUpdated") _list path;
     files_deleted =
       option_of_yojson (value_for_key files_metadata_of_yojson "filesDeleted") _list path;
   }
    : create_commit_output)

let is_move_of_yojson = bool_of_yojson

let source_file_specifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = value_for_key path_of_yojson "filePath" _list path;
     is_move = option_of_yojson (value_for_key is_move_of_yojson "isMove") _list path;
   }
    : source_file_specifier)

let put_file_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_path = value_for_key path_of_yojson "filePath" _list path;
     file_mode =
       option_of_yojson (value_for_key file_mode_type_enum_of_yojson "fileMode") _list path;
     file_content = option_of_yojson (value_for_key file_content_of_yojson "fileContent") _list path;
     source_file =
       option_of_yojson (value_for_key source_file_specifier_of_yojson "sourceFile") _list path;
   }
    : put_file_entry)

let put_file_entries_of_yojson tree path = list_of_yojson put_file_entry_of_yojson tree path

let create_commit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     branch_name = value_for_key branch_name_of_yojson "branchName" _list path;
     parent_commit_id =
       option_of_yojson (value_for_key commit_id_of_yojson "parentCommitId") _list path;
     author_name = option_of_yojson (value_for_key name_of_yojson "authorName") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     commit_message = option_of_yojson (value_for_key message_of_yojson "commitMessage") _list path;
     keep_empty_folders =
       option_of_yojson (value_for_key keep_empty_folders_of_yojson "keepEmptyFolders") _list path;
     put_files = option_of_yojson (value_for_key put_file_entries_of_yojson "putFiles") _list path;
     delete_files =
       option_of_yojson (value_for_key delete_file_entries_of_yojson "deleteFiles") _list path;
     set_file_modes =
       option_of_yojson (value_for_key set_file_mode_entries_of_yojson "setFileModes") _list path;
   }
    : create_commit_input)

let create_branch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     branch_name = value_for_key branch_name_of_yojson "branchName" _list path;
     commit_id = value_for_key commit_id_of_yojson "commitId" _list path;
   }
    : create_branch_input)

let number_of_rule_templates_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : number_of_rule_templates_exceeded_exception)

let create_approval_rule_template_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template =
       value_for_key approval_rule_template_of_yojson "approvalRuleTemplate" _list path;
   }
    : create_approval_rule_template_output)

let create_approval_rule_template_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approval_rule_template_name =
       value_for_key approval_rule_template_name_of_yojson "approvalRuleTemplateName" _list path;
     approval_rule_template_content =
       value_for_key approval_rule_template_content_of_yojson "approvalRuleTemplateContent" _list
         path;
     approval_rule_template_description =
       option_of_yojson
         (value_for_key approval_rule_template_description_of_yojson
            "approvalRuleTemplateDescription")
         _list path;
   }
    : create_approval_rule_template_input)
