open Smaws_Lib.Json.SerializeHelpers
open Types

let blob_to_yojson = blob_to_yojson
let name_to_yojson = string_to_yojson
let email_to_yojson = string_to_yojson
let date_to_yojson = string_to_yojson

let user_info_to_yojson (x : user_info) =
  assoc_to_yojson
    [
      ("date", option_to_yojson date_to_yojson x.date);
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let repository_name_to_yojson = string_to_yojson

let update_repository_name_input_to_yojson (x : update_repository_name_input) =
  assoc_to_yojson
    [
      ("newName", Some (repository_name_to_yojson x.new_name));
      ("oldName", Some (repository_name_to_yojson x.old_name));
    ]

let message_to_yojson = string_to_yojson

let repository_name_required_exception_to_yojson (x : repository_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_name_exists_exception_to_yojson (x : repository_name_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_does_not_exist_exception_to_yojson (x : repository_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_repository_name_exception_to_yojson (x : invalid_repository_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_id_to_yojson = string_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let update_repository_encryption_key_output_to_yojson (x : update_repository_encryption_key_output)
    =
  assoc_to_yojson
    [
      ("originalKmsKeyId", option_to_yojson kms_key_id_to_yojson x.original_kms_key_id);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("repositoryId", option_to_yojson repository_id_to_yojson x.repository_id);
    ]

let update_repository_encryption_key_input_to_yojson (x : update_repository_encryption_key_input) =
  assoc_to_yojson
    [
      ("kmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let encryption_key_unavailable_exception_to_yojson (x : encryption_key_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let encryption_key_required_exception_to_yojson (x : encryption_key_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let encryption_key_not_found_exception_to_yojson (x : encryption_key_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let encryption_key_invalid_usage_exception_to_yojson (x : encryption_key_invalid_usage_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let encryption_key_invalid_id_exception_to_yojson (x : encryption_key_invalid_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let encryption_key_disabled_exception_to_yojson (x : encryption_key_disabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let encryption_key_access_denied_exception_to_yojson (x : encryption_key_access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let encryption_integrity_checks_failed_exception_to_yojson
    (x : encryption_integrity_checks_failed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_description_to_yojson = string_to_yojson

let update_repository_description_input_to_yojson (x : update_repository_description_input) =
  assoc_to_yojson
    [
      ( "repositoryDescription",
        option_to_yojson repository_description_to_yojson x.repository_description );
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let invalid_repository_description_exception_to_yojson
    (x : invalid_repository_description_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pull_request_id_to_yojson = string_to_yojson
let title_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson
let last_modified_date_to_yojson = timestamp_epoch_seconds_to_yojson
let creation_date_to_yojson = timestamp_epoch_seconds_to_yojson

let pull_request_status_enum_to_yojson (x : pull_request_status_enum) =
  match x with CLOSED -> `String "CLOSED" | OPEN -> `String "OPEN"

let arn_to_yojson = string_to_yojson
let reference_name_to_yojson = string_to_yojson
let commit_id_to_yojson = string_to_yojson
let is_merged_to_yojson = bool_to_yojson

let merge_option_type_enum_to_yojson (x : merge_option_type_enum) =
  match x with
  | THREE_WAY_MERGE -> `String "THREE_WAY_MERGE"
  | SQUASH_MERGE -> `String "SQUASH_MERGE"
  | FAST_FORWARD_MERGE -> `String "FAST_FORWARD_MERGE"

let merge_metadata_to_yojson (x : merge_metadata) =
  assoc_to_yojson
    [
      ("mergeOption", option_to_yojson merge_option_type_enum_to_yojson x.merge_option);
      ("mergeCommitId", option_to_yojson commit_id_to_yojson x.merge_commit_id);
      ("mergedBy", option_to_yojson arn_to_yojson x.merged_by);
      ("isMerged", option_to_yojson is_merged_to_yojson x.is_merged);
    ]

let pull_request_target_to_yojson (x : pull_request_target) =
  assoc_to_yojson
    [
      ("mergeMetadata", option_to_yojson merge_metadata_to_yojson x.merge_metadata);
      ("mergeBase", option_to_yojson commit_id_to_yojson x.merge_base);
      ("sourceCommit", option_to_yojson commit_id_to_yojson x.source_commit);
      ("destinationCommit", option_to_yojson commit_id_to_yojson x.destination_commit);
      ("destinationReference", option_to_yojson reference_name_to_yojson x.destination_reference);
      ("sourceReference", option_to_yojson reference_name_to_yojson x.source_reference);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let pull_request_target_list_to_yojson tree = list_to_yojson pull_request_target_to_yojson tree
let client_request_token_to_yojson = string_to_yojson
let revision_id_to_yojson = string_to_yojson
let approval_rule_id_to_yojson = string_to_yojson
let approval_rule_name_to_yojson = string_to_yojson
let approval_rule_content_to_yojson = string_to_yojson
let rule_content_sha256_to_yojson = string_to_yojson
let approval_rule_template_id_to_yojson = string_to_yojson
let approval_rule_template_name_to_yojson = string_to_yojson

let origin_approval_rule_template_to_yojson (x : origin_approval_rule_template) =
  assoc_to_yojson
    [
      ( "approvalRuleTemplateName",
        option_to_yojson approval_rule_template_name_to_yojson x.approval_rule_template_name );
      ( "approvalRuleTemplateId",
        option_to_yojson approval_rule_template_id_to_yojson x.approval_rule_template_id );
    ]

let approval_rule_to_yojson (x : approval_rule) =
  assoc_to_yojson
    [
      ( "originApprovalRuleTemplate",
        option_to_yojson origin_approval_rule_template_to_yojson x.origin_approval_rule_template );
      ("lastModifiedUser", option_to_yojson arn_to_yojson x.last_modified_user);
      ("creationDate", option_to_yojson creation_date_to_yojson x.creation_date);
      ("lastModifiedDate", option_to_yojson last_modified_date_to_yojson x.last_modified_date);
      ("ruleContentSha256", option_to_yojson rule_content_sha256_to_yojson x.rule_content_sha256);
      ( "approvalRuleContent",
        option_to_yojson approval_rule_content_to_yojson x.approval_rule_content );
      ("approvalRuleName", option_to_yojson approval_rule_name_to_yojson x.approval_rule_name);
      ("approvalRuleId", option_to_yojson approval_rule_id_to_yojson x.approval_rule_id);
    ]

let approval_rules_list_to_yojson tree = list_to_yojson approval_rule_to_yojson tree

let pull_request_to_yojson (x : pull_request) =
  assoc_to_yojson
    [
      ("approvalRules", option_to_yojson approval_rules_list_to_yojson x.approval_rules);
      ("revisionId", option_to_yojson revision_id_to_yojson x.revision_id);
      ("clientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ( "pullRequestTargets",
        option_to_yojson pull_request_target_list_to_yojson x.pull_request_targets );
      ("authorArn", option_to_yojson arn_to_yojson x.author_arn);
      ( "pullRequestStatus",
        option_to_yojson pull_request_status_enum_to_yojson x.pull_request_status );
      ("creationDate", option_to_yojson creation_date_to_yojson x.creation_date);
      ("lastActivityDate", option_to_yojson last_modified_date_to_yojson x.last_activity_date);
      ("description", option_to_yojson description_to_yojson x.description);
      ("title", option_to_yojson title_to_yojson x.title);
      ("pullRequestId", option_to_yojson pull_request_id_to_yojson x.pull_request_id);
    ]

let update_pull_request_title_output_to_yojson (x : update_pull_request_title_output) =
  assoc_to_yojson [ ("pullRequest", Some (pull_request_to_yojson x.pull_request)) ]

let update_pull_request_title_input_to_yojson (x : update_pull_request_title_input) =
  assoc_to_yojson
    [
      ("title", Some (title_to_yojson x.title));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let title_required_exception_to_yojson (x : title_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pull_request_id_required_exception_to_yojson (x : pull_request_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pull_request_does_not_exist_exception_to_yojson (x : pull_request_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pull_request_already_closed_exception_to_yojson (x : pull_request_already_closed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_title_exception_to_yojson (x : invalid_title_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_pull_request_id_exception_to_yojson (x : invalid_pull_request_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_pull_request_status_output_to_yojson (x : update_pull_request_status_output) =
  assoc_to_yojson [ ("pullRequest", Some (pull_request_to_yojson x.pull_request)) ]

let update_pull_request_status_input_to_yojson (x : update_pull_request_status_input) =
  assoc_to_yojson
    [
      ("pullRequestStatus", Some (pull_request_status_enum_to_yojson x.pull_request_status));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let pull_request_status_required_exception_to_yojson (x : pull_request_status_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_pull_request_status_update_exception_to_yojson
    (x : invalid_pull_request_status_update_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_pull_request_status_exception_to_yojson (x : invalid_pull_request_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_pull_request_description_output_to_yojson (x : update_pull_request_description_output) =
  assoc_to_yojson [ ("pullRequest", Some (pull_request_to_yojson x.pull_request)) ]

let update_pull_request_description_input_to_yojson (x : update_pull_request_description_input) =
  assoc_to_yojson
    [
      ("description", Some (description_to_yojson x.description));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let invalid_description_exception_to_yojson (x : invalid_description_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_state_to_yojson (x : approval_state) =
  match x with REVOKE -> `String "REVOKE" | APPROVE -> `String "APPROVE"

let update_pull_request_approval_state_input_to_yojson
    (x : update_pull_request_approval_state_input) =
  assoc_to_yojson
    [
      ("approvalState", Some (approval_state_to_yojson x.approval_state));
      ("revisionId", Some (revision_id_to_yojson x.revision_id));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let revision_not_current_exception_to_yojson (x : revision_not_current_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let revision_id_required_exception_to_yojson (x : revision_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pull_request_cannot_be_approved_by_author_exception_to_yojson
    (x : pull_request_cannot_be_approved_by_author_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let maximum_number_of_approvals_exceeded_exception_to_yojson
    (x : maximum_number_of_approvals_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_revision_id_exception_to_yojson (x : invalid_revision_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_approval_state_exception_to_yojson (x : invalid_approval_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_state_required_exception_to_yojson (x : approval_state_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_pull_request_approval_rule_content_output_to_yojson
    (x : update_pull_request_approval_rule_content_output) =
  assoc_to_yojson [ ("approvalRule", Some (approval_rule_to_yojson x.approval_rule)) ]

let update_pull_request_approval_rule_content_input_to_yojson
    (x : update_pull_request_approval_rule_content_input) =
  assoc_to_yojson
    [
      ("newRuleContent", Some (approval_rule_content_to_yojson x.new_rule_content));
      ( "existingRuleContentSha256",
        option_to_yojson rule_content_sha256_to_yojson x.existing_rule_content_sha256 );
      ("approvalRuleName", Some (approval_rule_name_to_yojson x.approval_rule_name));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let invalid_rule_content_sha256_exception_to_yojson (x : invalid_rule_content_sha256_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_approval_rule_name_exception_to_yojson (x : invalid_approval_rule_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_approval_rule_content_exception_to_yojson (x : invalid_approval_rule_content_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let cannot_modify_approval_rule_from_template_exception_to_yojson
    (x : cannot_modify_approval_rule_from_template_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_rule_name_required_exception_to_yojson (x : approval_rule_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_rule_does_not_exist_exception_to_yojson (x : approval_rule_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_rule_content_required_exception_to_yojson
    (x : approval_rule_content_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let branch_name_to_yojson = string_to_yojson

let update_default_branch_input_to_yojson (x : update_default_branch_input) =
  assoc_to_yojson
    [
      ("defaultBranchName", Some (branch_name_to_yojson x.default_branch_name));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let invalid_branch_name_exception_to_yojson (x : invalid_branch_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let branch_name_required_exception_to_yojson (x : branch_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let branch_does_not_exist_exception_to_yojson (x : branch_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let comment_id_to_yojson = string_to_yojson
let content_to_yojson = string_to_yojson
let is_comment_deleted_to_yojson = bool_to_yojson
let reaction_value_to_yojson = string_to_yojson
let caller_reactions_to_yojson tree = list_to_yojson reaction_value_to_yojson tree
let count_to_yojson = int_to_yojson
let reaction_counts_map_to_yojson tree = map_to_yojson reaction_value_to_yojson count_to_yojson tree

let comment_to_yojson (x : comment) =
  assoc_to_yojson
    [
      ("reactionCounts", option_to_yojson reaction_counts_map_to_yojson x.reaction_counts);
      ("callerReactions", option_to_yojson caller_reactions_to_yojson x.caller_reactions);
      ("clientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("deleted", option_to_yojson is_comment_deleted_to_yojson x.deleted);
      ("authorArn", option_to_yojson arn_to_yojson x.author_arn);
      ("lastModifiedDate", option_to_yojson last_modified_date_to_yojson x.last_modified_date);
      ("creationDate", option_to_yojson creation_date_to_yojson x.creation_date);
      ("inReplyTo", option_to_yojson comment_id_to_yojson x.in_reply_to);
      ("content", option_to_yojson content_to_yojson x.content);
      ("commentId", option_to_yojson comment_id_to_yojson x.comment_id);
    ]

let update_comment_output_to_yojson (x : update_comment_output) =
  assoc_to_yojson [ ("comment", option_to_yojson comment_to_yojson x.comment) ]

let update_comment_input_to_yojson (x : update_comment_input) =
  assoc_to_yojson
    [
      ("content", Some (content_to_yojson x.content));
      ("commentId", Some (comment_id_to_yojson x.comment_id));
    ]

let invalid_comment_id_exception_to_yojson (x : invalid_comment_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let comment_not_created_by_caller_exception_to_yojson (x : comment_not_created_by_caller_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let comment_id_required_exception_to_yojson (x : comment_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let comment_does_not_exist_exception_to_yojson (x : comment_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let comment_deleted_exception_to_yojson (x : comment_deleted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let comment_content_size_limit_exceeded_exception_to_yojson
    (x : comment_content_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let comment_content_required_exception_to_yojson (x : comment_content_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_rule_template_description_to_yojson = string_to_yojson
let approval_rule_template_content_to_yojson = string_to_yojson

let approval_rule_template_to_yojson (x : approval_rule_template) =
  assoc_to_yojson
    [
      ("lastModifiedUser", option_to_yojson arn_to_yojson x.last_modified_user);
      ("creationDate", option_to_yojson creation_date_to_yojson x.creation_date);
      ("lastModifiedDate", option_to_yojson last_modified_date_to_yojson x.last_modified_date);
      ("ruleContentSha256", option_to_yojson rule_content_sha256_to_yojson x.rule_content_sha256);
      ( "approvalRuleTemplateContent",
        option_to_yojson approval_rule_template_content_to_yojson x.approval_rule_template_content
      );
      ( "approvalRuleTemplateDescription",
        option_to_yojson approval_rule_template_description_to_yojson
          x.approval_rule_template_description );
      ( "approvalRuleTemplateName",
        option_to_yojson approval_rule_template_name_to_yojson x.approval_rule_template_name );
      ( "approvalRuleTemplateId",
        option_to_yojson approval_rule_template_id_to_yojson x.approval_rule_template_id );
    ]

let update_approval_rule_template_name_output_to_yojson
    (x : update_approval_rule_template_name_output) =
  assoc_to_yojson
    [ ("approvalRuleTemplate", Some (approval_rule_template_to_yojson x.approval_rule_template)) ]

let update_approval_rule_template_name_input_to_yojson
    (x : update_approval_rule_template_name_input) =
  assoc_to_yojson
    [
      ( "newApprovalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.new_approval_rule_template_name) );
      ( "oldApprovalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.old_approval_rule_template_name) );
    ]

let invalid_approval_rule_template_name_exception_to_yojson
    (x : invalid_approval_rule_template_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_rule_template_name_required_exception_to_yojson
    (x : approval_rule_template_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_rule_template_name_already_exists_exception_to_yojson
    (x : approval_rule_template_name_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_rule_template_does_not_exist_exception_to_yojson
    (x : approval_rule_template_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_approval_rule_template_description_output_to_yojson
    (x : update_approval_rule_template_description_output) =
  assoc_to_yojson
    [ ("approvalRuleTemplate", Some (approval_rule_template_to_yojson x.approval_rule_template)) ]

let update_approval_rule_template_description_input_to_yojson
    (x : update_approval_rule_template_description_input) =
  assoc_to_yojson
    [
      ( "approvalRuleTemplateDescription",
        Some (approval_rule_template_description_to_yojson x.approval_rule_template_description) );
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let invalid_approval_rule_template_description_exception_to_yojson
    (x : invalid_approval_rule_template_description_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_approval_rule_template_content_output_to_yojson
    (x : update_approval_rule_template_content_output) =
  assoc_to_yojson
    [ ("approvalRuleTemplate", Some (approval_rule_template_to_yojson x.approval_rule_template)) ]

let update_approval_rule_template_content_input_to_yojson
    (x : update_approval_rule_template_content_input) =
  assoc_to_yojson
    [
      ( "existingRuleContentSha256",
        option_to_yojson rule_content_sha256_to_yojson x.existing_rule_content_sha256 );
      ("newRuleContent", Some (approval_rule_template_content_to_yojson x.new_rule_content));
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let invalid_approval_rule_template_content_exception_to_yojson
    (x : invalid_approval_rule_template_content_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_rule_template_content_required_exception_to_yojson
    (x : approval_rule_template_content_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_keys_list_to_yojson x.tag_keys));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tag_policy_exception_to_yojson (x : tag_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tag_keys_list_required_exception_to_yojson (x : tag_keys_list_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_arn_required_exception_to_yojson (x : resource_arn_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_tag_keys_list_exception_to_yojson (x : invalid_tag_keys_list_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_system_tag_usage_exception_to_yojson (x : invalid_system_tag_usage_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_resource_arn_exception_to_yojson (x : invalid_resource_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tips_divergence_exceeded_exception_to_yojson (x : tips_divergence_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tip_of_source_reference_is_different_exception_to_yojson
    (x : tip_of_source_reference_is_different_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_trigger_name_to_yojson = string_to_yojson

let repository_trigger_name_list_to_yojson tree =
  list_to_yojson repository_trigger_name_to_yojson tree

let repository_trigger_execution_failure_message_to_yojson = string_to_yojson

let repository_trigger_execution_failure_to_yojson (x : repository_trigger_execution_failure) =
  assoc_to_yojson
    [
      ( "failureMessage",
        option_to_yojson repository_trigger_execution_failure_message_to_yojson x.failure_message );
      ("trigger", option_to_yojson repository_trigger_name_to_yojson x.trigger);
    ]

let repository_trigger_execution_failure_list_to_yojson tree =
  list_to_yojson repository_trigger_execution_failure_to_yojson tree

let test_repository_triggers_output_to_yojson (x : test_repository_triggers_output) =
  assoc_to_yojson
    [
      ( "failedExecutions",
        option_to_yojson repository_trigger_execution_failure_list_to_yojson x.failed_executions );
      ( "successfulExecutions",
        option_to_yojson repository_trigger_name_list_to_yojson x.successful_executions );
    ]

let repository_trigger_custom_data_to_yojson = string_to_yojson
let branch_name_list_to_yojson tree = list_to_yojson branch_name_to_yojson tree

let repository_trigger_event_enum_to_yojson (x : repository_trigger_event_enum) =
  match x with
  | DELETE_REFERENCE -> `String "deleteReference"
  | CREATE_REFERENCE -> `String "createReference"
  | UPDATE_REFERENCE -> `String "updateReference"
  | ALL -> `String "all"

let repository_trigger_event_list_to_yojson tree =
  list_to_yojson repository_trigger_event_enum_to_yojson tree

let repository_trigger_to_yojson (x : repository_trigger) =
  assoc_to_yojson
    [
      ("events", Some (repository_trigger_event_list_to_yojson x.events));
      ("branches", option_to_yojson branch_name_list_to_yojson x.branches);
      ("customData", option_to_yojson repository_trigger_custom_data_to_yojson x.custom_data);
      ("destinationArn", Some (arn_to_yojson x.destination_arn));
      ("name", Some (repository_trigger_name_to_yojson x.name));
    ]

let repository_triggers_list_to_yojson tree = list_to_yojson repository_trigger_to_yojson tree

let test_repository_triggers_input_to_yojson (x : test_repository_triggers_input) =
  assoc_to_yojson
    [
      ("triggers", Some (repository_triggers_list_to_yojson x.triggers));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let repository_triggers_list_required_exception_to_yojson
    (x : repository_triggers_list_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_trigger_name_required_exception_to_yojson
    (x : repository_trigger_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_trigger_events_list_required_exception_to_yojson
    (x : repository_trigger_events_list_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_trigger_destination_arn_required_exception_to_yojson
    (x : repository_trigger_destination_arn_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_trigger_branch_name_list_required_exception_to_yojson
    (x : repository_trigger_branch_name_list_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let maximum_repository_triggers_exceeded_exception_to_yojson
    (x : maximum_repository_triggers_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let maximum_branches_exceeded_exception_to_yojson (x : maximum_branches_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_repository_trigger_region_exception_to_yojson
    (x : invalid_repository_trigger_region_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_repository_trigger_name_exception_to_yojson
    (x : invalid_repository_trigger_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_repository_trigger_events_exception_to_yojson
    (x : invalid_repository_trigger_events_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_repository_trigger_destination_arn_exception_to_yojson
    (x : invalid_repository_trigger_destination_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_repository_trigger_custom_data_exception_to_yojson
    (x : invalid_repository_trigger_custom_data_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_repository_trigger_branch_name_exception_to_yojson
    (x : invalid_repository_trigger_branch_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let targets_required_exception_to_yojson (x : targets_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let target_required_exception_to_yojson (x : target_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let target_to_yojson (x : target) =
  assoc_to_yojson
    [
      ("destinationReference", option_to_yojson reference_name_to_yojson x.destination_reference);
      ("sourceReference", Some (reference_name_to_yojson x.source_reference));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let target_list_to_yojson tree = list_to_yojson target_to_yojson tree

let tags_map_required_exception_to_yojson (x : tags_map_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson
let tags_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("tags", Some (tags_map_to_yojson x.tags));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let invalid_tags_map_exception_to_yojson (x : invalid_tags_map_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let object_id_to_yojson = string_to_yojson
let path_to_yojson = string_to_yojson

let file_mode_type_enum_to_yojson (x : file_mode_type_enum) =
  match x with
  | SYMLINK -> `String "SYMLINK"
  | NORMAL -> `String "NORMAL"
  | EXECUTABLE -> `String "EXECUTABLE"

let symbolic_link_to_yojson (x : symbolic_link) =
  assoc_to_yojson
    [
      ("fileMode", option_to_yojson file_mode_type_enum_to_yojson x.file_mode);
      ("relativePath", option_to_yojson path_to_yojson x.relative_path);
      ("absolutePath", option_to_yojson path_to_yojson x.absolute_path);
      ("blobId", option_to_yojson object_id_to_yojson x.blob_id);
    ]

let symbolic_link_list_to_yojson tree = list_to_yojson symbolic_link_to_yojson tree

let sub_module_to_yojson (x : sub_module) =
  assoc_to_yojson
    [
      ("relativePath", option_to_yojson path_to_yojson x.relative_path);
      ("absolutePath", option_to_yojson path_to_yojson x.absolute_path);
      ("commitId", option_to_yojson object_id_to_yojson x.commit_id);
    ]

let sub_module_list_to_yojson tree = list_to_yojson sub_module_to_yojson tree
let is_move_to_yojson = bool_to_yojson

let source_file_specifier_to_yojson (x : source_file_specifier) =
  assoc_to_yojson
    [
      ("isMove", option_to_yojson is_move_to_yojson x.is_move);
      ("filePath", Some (path_to_yojson x.file_path));
    ]

let source_file_or_content_required_exception_to_yojson
    (x : source_file_or_content_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let source_and_destination_are_same_exception_to_yojson
    (x : source_and_destination_are_same_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let sort_by_enum_to_yojson (x : sort_by_enum) =
  match x with
  | MODIFIED_DATE -> `String "lastModifiedDate"
  | REPOSITORY_NAME -> `String "repositoryName"

let set_file_mode_entry_to_yojson (x : set_file_mode_entry) =
  assoc_to_yojson
    [
      ("fileMode", Some (file_mode_type_enum_to_yojson x.file_mode));
      ("filePath", Some (path_to_yojson x.file_path));
    ]

let set_file_mode_entries_to_yojson tree = list_to_yojson set_file_mode_entry_to_yojson tree

let same_path_request_exception_to_yojson (x : same_path_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let same_file_content_exception_to_yojson (x : same_file_content_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let parent_list_to_yojson tree = list_to_yojson object_id_to_yojson tree
let additional_data_to_yojson = string_to_yojson

let commit_to_yojson (x : commit) =
  assoc_to_yojson
    [
      ("additionalData", option_to_yojson additional_data_to_yojson x.additional_data);
      ("committer", option_to_yojson user_info_to_yojson x.committer);
      ("author", option_to_yojson user_info_to_yojson x.author);
      ("message", option_to_yojson message_to_yojson x.message);
      ("parents", option_to_yojson parent_list_to_yojson x.parents);
      ("treeId", option_to_yojson object_id_to_yojson x.tree_id);
      ("commitId", option_to_yojson object_id_to_yojson x.commit_id);
    ]

let revision_children_to_yojson tree = list_to_yojson revision_id_to_yojson tree

let file_version_to_yojson (x : file_version) =
  assoc_to_yojson
    [
      ("revisionChildren", option_to_yojson revision_children_to_yojson x.revision_children);
      ("path", option_to_yojson path_to_yojson x.path);
      ("blobId", option_to_yojson object_id_to_yojson x.blob_id);
      ("commit", option_to_yojson commit_to_yojson x.commit);
    ]

let revision_dag_to_yojson tree = list_to_yojson file_version_to_yojson tree

let restricted_source_file_exception_to_yojson (x : restricted_source_file_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_triggers_configuration_id_to_yojson = string_to_yojson
let repository_not_found_list_to_yojson tree = list_to_yojson repository_name_to_yojson tree

let repository_not_associated_with_pull_request_exception_to_yojson
    (x : repository_not_associated_with_pull_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_names_required_exception_to_yojson (x : repository_names_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let repository_name_list_to_yojson tree = list_to_yojson repository_name_to_yojson tree

let repository_name_id_pair_to_yojson (x : repository_name_id_pair) =
  assoc_to_yojson
    [
      ("repositoryId", option_to_yojson repository_id_to_yojson x.repository_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let repository_name_id_pair_list_to_yojson tree =
  list_to_yojson repository_name_id_pair_to_yojson tree

let account_id_to_yojson = string_to_yojson
let clone_url_http_to_yojson = string_to_yojson
let clone_url_ssh_to_yojson = string_to_yojson

let repository_metadata_to_yojson (x : repository_metadata) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("cloneUrlSsh", option_to_yojson clone_url_ssh_to_yojson x.clone_url_ssh);
      ("cloneUrlHttp", option_to_yojson clone_url_http_to_yojson x.clone_url_http);
      ("creationDate", option_to_yojson creation_date_to_yojson x.creation_date);
      ("lastModifiedDate", option_to_yojson last_modified_date_to_yojson x.last_modified_date);
      ("defaultBranch", option_to_yojson branch_name_to_yojson x.default_branch);
      ( "repositoryDescription",
        option_to_yojson repository_description_to_yojson x.repository_description );
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("repositoryId", option_to_yojson repository_id_to_yojson x.repository_id);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let repository_metadata_list_to_yojson tree = list_to_yojson repository_metadata_to_yojson tree

let repository_limit_exceeded_exception_to_yojson (x : repository_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let replacement_type_required_exception_to_yojson (x : replacement_type_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let replacement_type_enum_to_yojson (x : replacement_type_enum) =
  match x with
  | USE_NEW_CONTENT -> `String "USE_NEW_CONTENT"
  | KEEP_DESTINATION -> `String "KEEP_DESTINATION"
  | KEEP_SOURCE -> `String "KEEP_SOURCE"
  | KEEP_BASE -> `String "KEEP_BASE"

let replacement_content_required_exception_to_yojson (x : replacement_content_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let file_content_to_yojson = blob_to_yojson

let replace_content_entry_to_yojson (x : replace_content_entry) =
  assoc_to_yojson
    [
      ("fileMode", option_to_yojson file_mode_type_enum_to_yojson x.file_mode);
      ("content", option_to_yojson file_content_to_yojson x.content);
      ("replacementType", Some (replacement_type_enum_to_yojson x.replacement_type));
      ("filePath", Some (path_to_yojson x.file_path));
    ]

let replace_content_entries_to_yojson tree = list_to_yojson replace_content_entry_to_yojson tree

let relative_file_version_enum_to_yojson (x : relative_file_version_enum) =
  match x with AFTER -> `String "AFTER" | BEFORE -> `String "BEFORE"

let reference_type_not_supported_exception_to_yojson (x : reference_type_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let reference_name_required_exception_to_yojson (x : reference_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let reference_does_not_exist_exception_to_yojson (x : reference_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let reaction_emoji_to_yojson = string_to_yojson
let reaction_short_code_to_yojson = string_to_yojson
let reaction_unicode_to_yojson = string_to_yojson

let reaction_value_formats_to_yojson (x : reaction_value_formats) =
  assoc_to_yojson
    [
      ("unicode", option_to_yojson reaction_unicode_to_yojson x.unicode);
      ("shortCode", option_to_yojson reaction_short_code_to_yojson x.short_code);
      ("emoji", option_to_yojson reaction_emoji_to_yojson x.emoji);
    ]

let reaction_users_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let reaction_for_comment_to_yojson (x : reaction_for_comment) =
  assoc_to_yojson
    [
      ( "reactionsFromDeletedUsersCount",
        option_to_yojson count_to_yojson x.reactions_from_deleted_users_count );
      ("reactionUsers", option_to_yojson reaction_users_list_to_yojson x.reaction_users);
      ("reaction", option_to_yojson reaction_value_formats_to_yojson x.reaction);
    ]

let reactions_for_comment_list_to_yojson tree = list_to_yojson reaction_for_comment_to_yojson tree

let reaction_value_required_exception_to_yojson (x : reaction_value_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let reaction_limit_exceeded_exception_to_yojson (x : reaction_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let put_repository_triggers_output_to_yojson (x : put_repository_triggers_output) =
  assoc_to_yojson
    [
      ( "configurationId",
        option_to_yojson repository_triggers_configuration_id_to_yojson x.configuration_id );
    ]

let put_repository_triggers_input_to_yojson (x : put_repository_triggers_input) =
  assoc_to_yojson
    [
      ("triggers", Some (repository_triggers_list_to_yojson x.triggers));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let put_file_output_to_yojson (x : put_file_output) =
  assoc_to_yojson
    [
      ("treeId", Some (object_id_to_yojson x.tree_id));
      ("blobId", Some (object_id_to_yojson x.blob_id));
      ("commitId", Some (object_id_to_yojson x.commit_id));
    ]

let put_file_input_to_yojson (x : put_file_input) =
  assoc_to_yojson
    [
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", option_to_yojson name_to_yojson x.name);
      ("commitMessage", option_to_yojson message_to_yojson x.commit_message);
      ("parentCommitId", option_to_yojson commit_id_to_yojson x.parent_commit_id);
      ("fileMode", option_to_yojson file_mode_type_enum_to_yojson x.file_mode);
      ("filePath", Some (path_to_yojson x.file_path));
      ("fileContent", Some (file_content_to_yojson x.file_content));
      ("branchName", Some (branch_name_to_yojson x.branch_name));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let put_file_entry_conflict_exception_to_yojson (x : put_file_entry_conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let put_file_entry_to_yojson (x : put_file_entry) =
  assoc_to_yojson
    [
      ("sourceFile", option_to_yojson source_file_specifier_to_yojson x.source_file);
      ("fileContent", option_to_yojson file_content_to_yojson x.file_content);
      ("fileMode", option_to_yojson file_mode_type_enum_to_yojson x.file_mode);
      ("filePath", Some (path_to_yojson x.file_path));
    ]

let put_file_entries_to_yojson tree = list_to_yojson put_file_entry_to_yojson tree

let path_required_exception_to_yojson (x : path_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let parent_commit_id_required_exception_to_yojson (x : parent_commit_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let parent_commit_id_outdated_exception_to_yojson (x : parent_commit_id_outdated_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let parent_commit_does_not_exist_exception_to_yojson (x : parent_commit_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let name_length_exceeded_exception_to_yojson (x : name_length_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_path_exception_to_yojson (x : invalid_path_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_parent_commit_id_exception_to_yojson (x : invalid_parent_commit_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_file_mode_exception_to_yojson (x : invalid_file_mode_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_email_exception_to_yojson (x : invalid_email_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deletion_parameter_exception_to_yojson (x : invalid_deletion_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let folder_content_size_limit_exceeded_exception_to_yojson
    (x : folder_content_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let file_path_conflicts_with_submodule_path_exception_to_yojson
    (x : file_path_conflicts_with_submodule_path_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let file_name_conflicts_with_directory_name_exception_to_yojson
    (x : file_name_conflicts_with_directory_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let file_content_size_limit_exceeded_exception_to_yojson
    (x : file_content_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let file_content_required_exception_to_yojson (x : file_content_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let directory_name_conflicts_with_file_name_exception_to_yojson
    (x : directory_name_conflicts_with_file_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let commit_message_length_exceeded_exception_to_yojson
    (x : commit_message_length_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let branch_name_is_tag_name_exception_to_yojson (x : branch_name_is_tag_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let put_comment_reaction_input_to_yojson (x : put_comment_reaction_input) =
  assoc_to_yojson
    [
      ("reactionValue", Some (reaction_value_to_yojson x.reaction_value));
      ("commentId", Some (comment_id_to_yojson x.comment_id));
    ]

let invalid_reaction_value_exception_to_yojson (x : invalid_reaction_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pull_request_status_changed_event_metadata_to_yojson
    (x : pull_request_status_changed_event_metadata) =
  assoc_to_yojson
    [
      ( "pullRequestStatus",
        option_to_yojson pull_request_status_enum_to_yojson x.pull_request_status );
    ]

let pull_request_source_reference_updated_event_metadata_to_yojson
    (x : pull_request_source_reference_updated_event_metadata) =
  assoc_to_yojson
    [
      ("mergeBase", option_to_yojson commit_id_to_yojson x.merge_base);
      ("afterCommitId", option_to_yojson commit_id_to_yojson x.after_commit_id);
      ("beforeCommitId", option_to_yojson commit_id_to_yojson x.before_commit_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let pull_request_merged_state_changed_event_metadata_to_yojson
    (x : pull_request_merged_state_changed_event_metadata) =
  assoc_to_yojson
    [
      ("mergeMetadata", option_to_yojson merge_metadata_to_yojson x.merge_metadata);
      ("destinationReference", option_to_yojson reference_name_to_yojson x.destination_reference);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let pull_request_id_list_to_yojson tree = list_to_yojson pull_request_id_to_yojson tree

let pull_request_event_type_to_yojson (x : pull_request_event_type) =
  match x with
  | PULL_REQUEST_APPROVAL_STATE_CHANGED -> `String "PULL_REQUEST_APPROVAL_STATE_CHANGED"
  | PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN -> `String "PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN"
  | PULL_REQUEST_APPROVAL_RULE_DELETED -> `String "PULL_REQUEST_APPROVAL_RULE_DELETED"
  | PULL_REQUEST_APPROVAL_RULE_UPDATED -> `String "PULL_REQUEST_APPROVAL_RULE_UPDATED"
  | PULL_REQUEST_APPROVAL_RULE_CREATED -> `String "PULL_REQUEST_APPROVAL_RULE_CREATED"
  | PULL_REQUEST_MERGE_STATE_CHANGED -> `String "PULL_REQUEST_MERGE_STATE_CHANGED"
  | PULL_REQUEST_SOURCE_REFERENCE_UPDATED -> `String "PULL_REQUEST_SOURCE_REFERENCE_UPDATED"
  | PULL_REQUEST_STATUS_CHANGED -> `String "PULL_REQUEST_STATUS_CHANGED"
  | PULL_REQUEST_CREATED -> `String "PULL_REQUEST_CREATED"

let event_date_to_yojson = timestamp_epoch_seconds_to_yojson

let pull_request_created_event_metadata_to_yojson (x : pull_request_created_event_metadata) =
  assoc_to_yojson
    [
      ("mergeBase", option_to_yojson commit_id_to_yojson x.merge_base);
      ("destinationCommitId", option_to_yojson commit_id_to_yojson x.destination_commit_id);
      ("sourceCommitId", option_to_yojson commit_id_to_yojson x.source_commit_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let approval_rule_event_metadata_to_yojson (x : approval_rule_event_metadata) =
  assoc_to_yojson
    [
      ( "approvalRuleContent",
        option_to_yojson approval_rule_content_to_yojson x.approval_rule_content );
      ("approvalRuleId", option_to_yojson approval_rule_id_to_yojson x.approval_rule_id);
      ("approvalRuleName", option_to_yojson approval_rule_name_to_yojson x.approval_rule_name);
    ]

let approval_state_changed_event_metadata_to_yojson (x : approval_state_changed_event_metadata) =
  assoc_to_yojson
    [
      ("approvalStatus", option_to_yojson approval_state_to_yojson x.approval_status);
      ("revisionId", option_to_yojson revision_id_to_yojson x.revision_id);
    ]

let override_status_to_yojson (x : override_status) =
  match x with REVOKE -> `String "REVOKE" | OVERRIDE -> `String "OVERRIDE"

let approval_rule_overridden_event_metadata_to_yojson (x : approval_rule_overridden_event_metadata)
    =
  assoc_to_yojson
    [
      ("overrideStatus", option_to_yojson override_status_to_yojson x.override_status);
      ("revisionId", option_to_yojson revision_id_to_yojson x.revision_id);
    ]

let pull_request_event_to_yojson (x : pull_request_event) =
  assoc_to_yojson
    [
      ( "approvalRuleOverriddenEventMetadata",
        option_to_yojson approval_rule_overridden_event_metadata_to_yojson
          x.approval_rule_overridden_event_metadata );
      ( "approvalStateChangedEventMetadata",
        option_to_yojson approval_state_changed_event_metadata_to_yojson
          x.approval_state_changed_event_metadata );
      ( "approvalRuleEventMetadata",
        option_to_yojson approval_rule_event_metadata_to_yojson x.approval_rule_event_metadata );
      ( "pullRequestMergedStateChangedEventMetadata",
        option_to_yojson pull_request_merged_state_changed_event_metadata_to_yojson
          x.pull_request_merged_state_changed_event_metadata );
      ( "pullRequestSourceReferenceUpdatedEventMetadata",
        option_to_yojson pull_request_source_reference_updated_event_metadata_to_yojson
          x.pull_request_source_reference_updated_event_metadata );
      ( "pullRequestStatusChangedEventMetadata",
        option_to_yojson pull_request_status_changed_event_metadata_to_yojson
          x.pull_request_status_changed_event_metadata );
      ( "pullRequestCreatedEventMetadata",
        option_to_yojson pull_request_created_event_metadata_to_yojson
          x.pull_request_created_event_metadata );
      ("actorArn", option_to_yojson arn_to_yojson x.actor_arn);
      ( "pullRequestEventType",
        option_to_yojson pull_request_event_type_to_yojson x.pull_request_event_type );
      ("eventDate", option_to_yojson event_date_to_yojson x.event_date);
      ("pullRequestId", option_to_yojson pull_request_id_to_yojson x.pull_request_id);
    ]

let pull_request_event_list_to_yojson tree = list_to_yojson pull_request_event_to_yojson tree

let pull_request_approval_rules_not_satisfied_exception_to_yojson
    (x : pull_request_approval_rules_not_satisfied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let post_comment_reply_output_to_yojson (x : post_comment_reply_output) =
  assoc_to_yojson [ ("comment", option_to_yojson comment_to_yojson x.comment) ]

let post_comment_reply_input_to_yojson (x : post_comment_reply_input) =
  assoc_to_yojson
    [
      ("content", Some (content_to_yojson x.content));
      ( "clientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("inReplyTo", Some (comment_id_to_yojson x.in_reply_to));
    ]

let invalid_client_request_token_exception_to_yojson (x : invalid_client_request_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let idempotency_parameter_mismatch_exception_to_yojson
    (x : idempotency_parameter_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let client_request_token_required_exception_to_yojson (x : client_request_token_required_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let position_to_yojson = long_to_yojson

let location_to_yojson (x : location) =
  assoc_to_yojson
    [
      ( "relativeFileVersion",
        option_to_yojson relative_file_version_enum_to_yojson x.relative_file_version );
      ("filePosition", option_to_yojson position_to_yojson x.file_position);
      ("filePath", option_to_yojson path_to_yojson x.file_path);
    ]

let post_comment_for_pull_request_output_to_yojson (x : post_comment_for_pull_request_output) =
  assoc_to_yojson
    [
      ("comment", option_to_yojson comment_to_yojson x.comment);
      ("location", option_to_yojson location_to_yojson x.location);
      ("afterBlobId", option_to_yojson object_id_to_yojson x.after_blob_id);
      ("beforeBlobId", option_to_yojson object_id_to_yojson x.before_blob_id);
      ("afterCommitId", option_to_yojson commit_id_to_yojson x.after_commit_id);
      ("beforeCommitId", option_to_yojson commit_id_to_yojson x.before_commit_id);
      ("pullRequestId", option_to_yojson pull_request_id_to_yojson x.pull_request_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let post_comment_for_pull_request_input_to_yojson (x : post_comment_for_pull_request_input) =
  assoc_to_yojson
    [
      ( "clientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("content", Some (content_to_yojson x.content));
      ("location", option_to_yojson location_to_yojson x.location);
      ("afterCommitId", Some (commit_id_to_yojson x.after_commit_id));
      ("beforeCommitId", Some (commit_id_to_yojson x.before_commit_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let path_does_not_exist_exception_to_yojson (x : path_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_relative_file_version_enum_exception_to_yojson
    (x : invalid_relative_file_version_enum_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_file_position_exception_to_yojson (x : invalid_file_position_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_file_location_exception_to_yojson (x : invalid_file_location_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_commit_id_exception_to_yojson (x : invalid_commit_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let commit_id_required_exception_to_yojson (x : commit_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let commit_does_not_exist_exception_to_yojson (x : commit_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let before_commit_id_and_after_commit_id_are_same_exception_to_yojson
    (x : before_commit_id_and_after_commit_id_are_same_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let post_comment_for_compared_commit_output_to_yojson (x : post_comment_for_compared_commit_output)
    =
  assoc_to_yojson
    [
      ("comment", option_to_yojson comment_to_yojson x.comment);
      ("location", option_to_yojson location_to_yojson x.location);
      ("afterBlobId", option_to_yojson object_id_to_yojson x.after_blob_id);
      ("beforeBlobId", option_to_yojson object_id_to_yojson x.before_blob_id);
      ("afterCommitId", option_to_yojson commit_id_to_yojson x.after_commit_id);
      ("beforeCommitId", option_to_yojson commit_id_to_yojson x.before_commit_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let post_comment_for_compared_commit_input_to_yojson (x : post_comment_for_compared_commit_input) =
  assoc_to_yojson
    [
      ( "clientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("content", Some (content_to_yojson x.content));
      ("location", option_to_yojson location_to_yojson x.location);
      ("afterCommitId", Some (commit_id_to_yojson x.after_commit_id));
      ("beforeCommitId", option_to_yojson commit_id_to_yojson x.before_commit_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let override_status_required_exception_to_yojson (x : override_status_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let override_pull_request_approval_rules_input_to_yojson
    (x : override_pull_request_approval_rules_input) =
  assoc_to_yojson
    [
      ("overrideStatus", Some (override_status_to_yojson x.override_status));
      ("revisionId", Some (revision_id_to_yojson x.revision_id));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let override_already_set_exception_to_yojson (x : override_already_set_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_override_status_exception_to_yojson (x : invalid_override_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let overridden_to_yojson = bool_to_yojson

let order_enum_to_yojson (x : order_enum) =
  match x with DESCENDING -> `String "descending" | ASCENDING -> `String "ascending"

let operation_not_allowed_exception_to_yojson (x : operation_not_allowed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let object_type_enum_to_yojson (x : object_type_enum) =
  match x with
  | SYMBOLIC_LINK -> `String "SYMBOLIC_LINK"
  | GIT_LINK -> `String "GIT_LINK"
  | DIRECTORY -> `String "DIRECTORY"
  | FILE -> `String "FILE"

let object_types_to_yojson (x : object_types) =
  assoc_to_yojson
    [
      ("base", option_to_yojson object_type_enum_to_yojson x.base);
      ("destination", option_to_yojson object_type_enum_to_yojson x.destination);
      ("source", option_to_yojson object_type_enum_to_yojson x.source);
    ]

let object_size_to_yojson = long_to_yojson

let number_of_rules_exceeded_exception_to_yojson (x : number_of_rules_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let number_of_rule_templates_exceeded_exception_to_yojson
    (x : number_of_rule_templates_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let number_of_conflicts_to_yojson = int_to_yojson

let no_change_exception_to_yojson (x : no_change_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson

let multiple_repositories_in_pull_request_exception_to_yojson
    (x : multiple_repositories_in_pull_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let multiple_conflict_resolution_entries_exception_to_yojson
    (x : multiple_conflict_resolution_entries_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let mode_to_yojson = string_to_yojson

let merge_pull_request_by_three_way_output_to_yojson (x : merge_pull_request_by_three_way_output) =
  assoc_to_yojson [ ("pullRequest", option_to_yojson pull_request_to_yojson x.pull_request) ]

let conflict_detail_level_type_enum_to_yojson (x : conflict_detail_level_type_enum) =
  match x with LINE_LEVEL -> `String "LINE_LEVEL" | FILE_LEVEL -> `String "FILE_LEVEL"

let conflict_resolution_strategy_type_enum_to_yojson (x : conflict_resolution_strategy_type_enum) =
  match x with
  | AUTOMERGE -> `String "AUTOMERGE"
  | ACCEPT_DESTINATION -> `String "ACCEPT_DESTINATION"
  | ACCEPT_SOURCE -> `String "ACCEPT_SOURCE"
  | NONE -> `String "NONE"

let keep_empty_folders_to_yojson = bool_to_yojson

let delete_file_entry_to_yojson (x : delete_file_entry) =
  assoc_to_yojson [ ("filePath", Some (path_to_yojson x.file_path)) ]

let delete_file_entries_to_yojson tree = list_to_yojson delete_file_entry_to_yojson tree

let conflict_resolution_to_yojson (x : conflict_resolution) =
  assoc_to_yojson
    [
      ("setFileModes", option_to_yojson set_file_mode_entries_to_yojson x.set_file_modes);
      ("deleteFiles", option_to_yojson delete_file_entries_to_yojson x.delete_files);
      ("replaceContents", option_to_yojson replace_content_entries_to_yojson x.replace_contents);
    ]

let merge_pull_request_by_three_way_input_to_yojson (x : merge_pull_request_by_three_way_input) =
  assoc_to_yojson
    [
      ("conflictResolution", option_to_yojson conflict_resolution_to_yojson x.conflict_resolution);
      ("keepEmptyFolders", option_to_yojson keep_empty_folders_to_yojson x.keep_empty_folders);
      ("email", option_to_yojson email_to_yojson x.email);
      ("authorName", option_to_yojson name_to_yojson x.author_name);
      ("commitMessage", option_to_yojson message_to_yojson x.commit_message);
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("sourceCommitId", option_to_yojson object_id_to_yojson x.source_commit_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let maximum_items_to_compare_exceeded_exception_to_yojson
    (x : maximum_items_to_compare_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let maximum_file_content_to_load_exceeded_exception_to_yojson
    (x : maximum_file_content_to_load_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let maximum_conflict_resolution_entries_exceeded_exception_to_yojson
    (x : maximum_conflict_resolution_entries_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let manual_merge_required_exception_to_yojson (x : manual_merge_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_replacement_type_exception_to_yojson (x : invalid_replacement_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_replacement_content_exception_to_yojson (x : invalid_replacement_content_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_conflict_resolution_strategy_exception_to_yojson
    (x : invalid_conflict_resolution_strategy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_conflict_resolution_exception_to_yojson (x : invalid_conflict_resolution_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_conflict_detail_level_exception_to_yojson (x : invalid_conflict_detail_level_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let concurrent_reference_update_exception_to_yojson (x : concurrent_reference_update_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let merge_pull_request_by_squash_output_to_yojson (x : merge_pull_request_by_squash_output) =
  assoc_to_yojson [ ("pullRequest", option_to_yojson pull_request_to_yojson x.pull_request) ]

let merge_pull_request_by_squash_input_to_yojson (x : merge_pull_request_by_squash_input) =
  assoc_to_yojson
    [
      ("conflictResolution", option_to_yojson conflict_resolution_to_yojson x.conflict_resolution);
      ("keepEmptyFolders", option_to_yojson keep_empty_folders_to_yojson x.keep_empty_folders);
      ("email", option_to_yojson email_to_yojson x.email);
      ("authorName", option_to_yojson name_to_yojson x.author_name);
      ("commitMessage", option_to_yojson message_to_yojson x.commit_message);
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("sourceCommitId", option_to_yojson object_id_to_yojson x.source_commit_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let merge_pull_request_by_fast_forward_output_to_yojson
    (x : merge_pull_request_by_fast_forward_output) =
  assoc_to_yojson [ ("pullRequest", option_to_yojson pull_request_to_yojson x.pull_request) ]

let merge_pull_request_by_fast_forward_input_to_yojson
    (x : merge_pull_request_by_fast_forward_input) =
  assoc_to_yojson
    [
      ("sourceCommitId", option_to_yojson object_id_to_yojson x.source_commit_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let merge_options_to_yojson tree = list_to_yojson merge_option_type_enum_to_yojson tree

let merge_option_required_exception_to_yojson (x : merge_option_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let change_type_enum_to_yojson (x : change_type_enum) =
  match x with DELETED -> `String "D" | MODIFIED -> `String "M" | ADDED -> `String "A"

let merge_operations_to_yojson (x : merge_operations) =
  assoc_to_yojson
    [
      ("destination", option_to_yojson change_type_enum_to_yojson x.destination);
      ("source", option_to_yojson change_type_enum_to_yojson x.source);
    ]

let is_hunk_conflict_to_yojson = bool_to_yojson
let line_number_to_yojson = int_to_yojson
let hunk_content_to_yojson = string_to_yojson

let merge_hunk_detail_to_yojson (x : merge_hunk_detail) =
  assoc_to_yojson
    [
      ("hunkContent", option_to_yojson hunk_content_to_yojson x.hunk_content);
      ("endLine", option_to_yojson line_number_to_yojson x.end_line);
      ("startLine", option_to_yojson line_number_to_yojson x.start_line);
    ]

let merge_hunk_to_yojson (x : merge_hunk) =
  assoc_to_yojson
    [
      ("base", option_to_yojson merge_hunk_detail_to_yojson x.base);
      ("destination", option_to_yojson merge_hunk_detail_to_yojson x.destination);
      ("source", option_to_yojson merge_hunk_detail_to_yojson x.source);
      ("isConflict", option_to_yojson is_hunk_conflict_to_yojson x.is_conflict);
    ]

let merge_hunks_to_yojson tree = list_to_yojson merge_hunk_to_yojson tree

let merge_branches_by_three_way_output_to_yojson (x : merge_branches_by_three_way_output) =
  assoc_to_yojson
    [
      ("treeId", option_to_yojson object_id_to_yojson x.tree_id);
      ("commitId", option_to_yojson object_id_to_yojson x.commit_id);
    ]

let commit_name_to_yojson = string_to_yojson

let merge_branches_by_three_way_input_to_yojson (x : merge_branches_by_three_way_input) =
  assoc_to_yojson
    [
      ("conflictResolution", option_to_yojson conflict_resolution_to_yojson x.conflict_resolution);
      ("keepEmptyFolders", option_to_yojson keep_empty_folders_to_yojson x.keep_empty_folders);
      ("commitMessage", option_to_yojson message_to_yojson x.commit_message);
      ("email", option_to_yojson email_to_yojson x.email);
      ("authorName", option_to_yojson name_to_yojson x.author_name);
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("targetBranch", option_to_yojson branch_name_to_yojson x.target_branch);
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let invalid_target_branch_exception_to_yojson (x : invalid_target_branch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_commit_exception_to_yojson (x : invalid_commit_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let file_mode_required_exception_to_yojson (x : file_mode_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let commit_required_exception_to_yojson (x : commit_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let merge_branches_by_squash_output_to_yojson (x : merge_branches_by_squash_output) =
  assoc_to_yojson
    [
      ("treeId", option_to_yojson object_id_to_yojson x.tree_id);
      ("commitId", option_to_yojson object_id_to_yojson x.commit_id);
    ]

let merge_branches_by_squash_input_to_yojson (x : merge_branches_by_squash_input) =
  assoc_to_yojson
    [
      ("conflictResolution", option_to_yojson conflict_resolution_to_yojson x.conflict_resolution);
      ("keepEmptyFolders", option_to_yojson keep_empty_folders_to_yojson x.keep_empty_folders);
      ("commitMessage", option_to_yojson message_to_yojson x.commit_message);
      ("email", option_to_yojson email_to_yojson x.email);
      ("authorName", option_to_yojson name_to_yojson x.author_name);
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("targetBranch", option_to_yojson branch_name_to_yojson x.target_branch);
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let merge_branches_by_fast_forward_output_to_yojson (x : merge_branches_by_fast_forward_output) =
  assoc_to_yojson
    [
      ("treeId", option_to_yojson object_id_to_yojson x.tree_id);
      ("commitId", option_to_yojson object_id_to_yojson x.commit_id);
    ]

let merge_branches_by_fast_forward_input_to_yojson (x : merge_branches_by_fast_forward_input) =
  assoc_to_yojson
    [
      ("targetBranch", option_to_yojson branch_name_to_yojson x.target_branch);
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let maximum_rule_templates_associated_with_repository_exception_to_yojson
    (x : maximum_rule_templates_associated_with_repository_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let maximum_repository_names_exceeded_exception_to_yojson
    (x : maximum_repository_names_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let maximum_open_pull_requests_exceeded_exception_to_yojson
    (x : maximum_open_pull_requests_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let maximum_file_entries_exceeded_exception_to_yojson (x : maximum_file_entries_exceeded_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let list_repositories_output_to_yojson (x : list_repositories_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositories", option_to_yojson repository_name_id_pair_list_to_yojson x.repositories);
    ]

let list_repositories_input_to_yojson (x : list_repositories_input) =
  assoc_to_yojson
    [
      ("order", option_to_yojson order_enum_to_yojson x.order);
      ("sortBy", option_to_yojson sort_by_enum_to_yojson x.sort_by);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_repositories_for_approval_rule_template_output_to_yojson
    (x : list_repositories_for_approval_rule_template_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositoryNames", option_to_yojson repository_name_list_to_yojson x.repository_names);
    ]

let list_repositories_for_approval_rule_template_input_to_yojson
    (x : list_repositories_for_approval_rule_template_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let invalid_max_results_exception_to_yojson (x : invalid_max_results_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_continuation_token_exception_to_yojson (x : invalid_continuation_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_sort_by_exception_to_yojson (x : invalid_sort_by_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_order_exception_to_yojson (x : invalid_order_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_pull_requests_output_to_yojson (x : list_pull_requests_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("pullRequestIds", Some (pull_request_id_list_to_yojson x.pull_request_ids));
    ]

let list_pull_requests_input_to_yojson (x : list_pull_requests_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "pullRequestStatus",
        option_to_yojson pull_request_status_enum_to_yojson x.pull_request_status );
      ("authorArn", option_to_yojson arn_to_yojson x.author_arn);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let invalid_author_arn_exception_to_yojson (x : invalid_author_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let author_does_not_exist_exception_to_yojson (x : author_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_file_commit_history_response_to_yojson (x : list_file_commit_history_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("revisionDag", Some (revision_dag_to_yojson x.revision_dag));
    ]

let limit_to_yojson = int_to_yojson

let list_file_commit_history_request_to_yojson (x : list_file_commit_history_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson limit_to_yojson x.max_results);
      ("filePath", Some (path_to_yojson x.file_path));
      ("commitSpecifier", option_to_yojson commit_name_to_yojson x.commit_specifier);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let list_branches_output_to_yojson (x : list_branches_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("branches", option_to_yojson branch_name_list_to_yojson x.branches);
    ]

let list_branches_input_to_yojson (x : list_branches_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let approval_rule_template_name_list_to_yojson tree =
  list_to_yojson approval_rule_template_name_to_yojson tree

let list_associated_approval_rule_templates_for_repository_output_to_yojson
    (x : list_associated_approval_rule_templates_for_repository_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "approvalRuleTemplateNames",
        option_to_yojson approval_rule_template_name_list_to_yojson x.approval_rule_template_names
      );
    ]

let list_associated_approval_rule_templates_for_repository_input_to_yojson
    (x : list_associated_approval_rule_templates_for_repository_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let list_approval_rule_templates_output_to_yojson (x : list_approval_rule_templates_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "approvalRuleTemplateNames",
        option_to_yojson approval_rule_template_name_list_to_yojson x.approval_rule_template_names
      );
    ]

let list_approval_rule_templates_input_to_yojson (x : list_approval_rule_templates_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let is_object_type_conflict_to_yojson = bool_to_yojson
let is_mergeable_to_yojson = bool_to_yojson
let is_file_mode_conflict_to_yojson = bool_to_yojson
let is_content_conflict_to_yojson = bool_to_yojson
let capital_boolean_to_yojson = bool_to_yojson

let is_binary_file_to_yojson (x : is_binary_file) =
  assoc_to_yojson
    [
      ("base", option_to_yojson capital_boolean_to_yojson x.base);
      ("destination", option_to_yojson capital_boolean_to_yojson x.destination);
      ("source", option_to_yojson capital_boolean_to_yojson x.source);
    ]

let invalid_targets_exception_to_yojson (x : invalid_targets_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_target_exception_to_yojson (x : invalid_target_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_source_commit_specifier_exception_to_yojson
    (x : invalid_source_commit_specifier_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_reference_name_exception_to_yojson (x : invalid_reference_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_reaction_user_arn_exception_to_yojson (x : invalid_reaction_user_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_pull_request_event_type_exception_to_yojson
    (x : invalid_pull_request_event_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_merge_option_exception_to_yojson (x : invalid_merge_option_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_max_merge_hunks_exception_to_yojson (x : invalid_max_merge_hunks_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_max_conflict_files_exception_to_yojson (x : invalid_max_conflict_files_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_destination_commit_specifier_exception_to_yojson
    (x : invalid_destination_commit_specifier_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_blob_id_exception_to_yojson (x : invalid_blob_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_actor_arn_exception_to_yojson (x : invalid_actor_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_repository_triggers_output_to_yojson (x : get_repository_triggers_output) =
  assoc_to_yojson
    [
      ("triggers", option_to_yojson repository_triggers_list_to_yojson x.triggers);
      ( "configurationId",
        option_to_yojson repository_triggers_configuration_id_to_yojson x.configuration_id );
    ]

let get_repository_triggers_input_to_yojson (x : get_repository_triggers_input) =
  assoc_to_yojson [ ("repositoryName", Some (repository_name_to_yojson x.repository_name)) ]

let get_repository_output_to_yojson (x : get_repository_output) =
  assoc_to_yojson
    [ ("repositoryMetadata", option_to_yojson repository_metadata_to_yojson x.repository_metadata) ]

let get_repository_input_to_yojson (x : get_repository_input) =
  assoc_to_yojson [ ("repositoryName", Some (repository_name_to_yojson x.repository_name)) ]

let get_pull_request_override_state_output_to_yojson (x : get_pull_request_override_state_output) =
  assoc_to_yojson
    [
      ("overrider", option_to_yojson arn_to_yojson x.overrider);
      ("overridden", option_to_yojson overridden_to_yojson x.overridden);
    ]

let get_pull_request_override_state_input_to_yojson (x : get_pull_request_override_state_input) =
  assoc_to_yojson
    [
      ("revisionId", Some (revision_id_to_yojson x.revision_id));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let get_pull_request_output_to_yojson (x : get_pull_request_output) =
  assoc_to_yojson [ ("pullRequest", Some (pull_request_to_yojson x.pull_request)) ]

let get_pull_request_input_to_yojson (x : get_pull_request_input) =
  assoc_to_yojson [ ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id)) ]

let approval_to_yojson (x : approval) =
  assoc_to_yojson
    [
      ("approvalState", option_to_yojson approval_state_to_yojson x.approval_state);
      ("userArn", option_to_yojson arn_to_yojson x.user_arn);
    ]

let approval_list_to_yojson tree = list_to_yojson approval_to_yojson tree

let get_pull_request_approval_states_output_to_yojson (x : get_pull_request_approval_states_output)
    =
  assoc_to_yojson [ ("approvals", option_to_yojson approval_list_to_yojson x.approvals) ]

let get_pull_request_approval_states_input_to_yojson (x : get_pull_request_approval_states_input) =
  assoc_to_yojson
    [
      ("revisionId", Some (revision_id_to_yojson x.revision_id));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let get_merge_options_output_to_yojson (x : get_merge_options_output) =
  assoc_to_yojson
    [
      ("baseCommitId", Some (object_id_to_yojson x.base_commit_id));
      ("destinationCommitId", Some (object_id_to_yojson x.destination_commit_id));
      ("sourceCommitId", Some (object_id_to_yojson x.source_commit_id));
      ("mergeOptions", Some (merge_options_to_yojson x.merge_options));
    ]

let get_merge_options_input_to_yojson (x : get_merge_options_input) =
  assoc_to_yojson
    [
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let file_size_to_yojson = long_to_yojson

let file_sizes_to_yojson (x : file_sizes) =
  assoc_to_yojson
    [
      ("base", option_to_yojson file_size_to_yojson x.base);
      ("destination", option_to_yojson file_size_to_yojson x.destination);
      ("source", option_to_yojson file_size_to_yojson x.source);
    ]

let file_modes_to_yojson (x : file_modes) =
  assoc_to_yojson
    [
      ("base", option_to_yojson file_mode_type_enum_to_yojson x.base);
      ("destination", option_to_yojson file_mode_type_enum_to_yojson x.destination);
      ("source", option_to_yojson file_mode_type_enum_to_yojson x.source);
    ]

let conflict_metadata_to_yojson (x : conflict_metadata) =
  assoc_to_yojson
    [
      ("mergeOperations", option_to_yojson merge_operations_to_yojson x.merge_operations);
      ( "objectTypeConflict",
        option_to_yojson is_object_type_conflict_to_yojson x.object_type_conflict );
      ("fileModeConflict", option_to_yojson is_file_mode_conflict_to_yojson x.file_mode_conflict);
      ("contentConflict", option_to_yojson is_content_conflict_to_yojson x.content_conflict);
      ("isBinaryFile", option_to_yojson is_binary_file_to_yojson x.is_binary_file);
      ("numberOfConflicts", option_to_yojson number_of_conflicts_to_yojson x.number_of_conflicts);
      ("objectTypes", option_to_yojson object_types_to_yojson x.object_types);
      ("fileModes", option_to_yojson file_modes_to_yojson x.file_modes);
      ("fileSizes", option_to_yojson file_sizes_to_yojson x.file_sizes);
      ("filePath", option_to_yojson path_to_yojson x.file_path);
    ]

let conflict_metadata_list_to_yojson tree = list_to_yojson conflict_metadata_to_yojson tree

let get_merge_conflicts_output_to_yojson (x : get_merge_conflicts_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("conflictMetadataList", Some (conflict_metadata_list_to_yojson x.conflict_metadata_list));
      ("baseCommitId", option_to_yojson object_id_to_yojson x.base_commit_id);
      ("sourceCommitId", Some (object_id_to_yojson x.source_commit_id));
      ("destinationCommitId", Some (object_id_to_yojson x.destination_commit_id));
      ("mergeable", Some (is_mergeable_to_yojson x.mergeable));
    ]

let get_merge_conflicts_input_to_yojson (x : get_merge_conflicts_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ("maxConflictFiles", option_to_yojson max_results_to_yojson x.max_conflict_files);
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("mergeOption", Some (merge_option_type_enum_to_yojson x.merge_option));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let get_merge_commit_output_to_yojson (x : get_merge_commit_output) =
  assoc_to_yojson
    [
      ("mergedCommitId", option_to_yojson object_id_to_yojson x.merged_commit_id);
      ("baseCommitId", option_to_yojson object_id_to_yojson x.base_commit_id);
      ("destinationCommitId", option_to_yojson object_id_to_yojson x.destination_commit_id);
      ("sourceCommitId", option_to_yojson object_id_to_yojson x.source_commit_id);
    ]

let get_merge_commit_input_to_yojson (x : get_merge_commit_input) =
  assoc_to_yojson
    [
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let folder_to_yojson (x : folder) =
  assoc_to_yojson
    [
      ("relativePath", option_to_yojson path_to_yojson x.relative_path);
      ("absolutePath", option_to_yojson path_to_yojson x.absolute_path);
      ("treeId", option_to_yojson object_id_to_yojson x.tree_id);
    ]

let folder_list_to_yojson tree = list_to_yojson folder_to_yojson tree

let file_to_yojson (x : file) =
  assoc_to_yojson
    [
      ("fileMode", option_to_yojson file_mode_type_enum_to_yojson x.file_mode);
      ("relativePath", option_to_yojson path_to_yojson x.relative_path);
      ("absolutePath", option_to_yojson path_to_yojson x.absolute_path);
      ("blobId", option_to_yojson object_id_to_yojson x.blob_id);
    ]

let file_list_to_yojson tree = list_to_yojson file_to_yojson tree

let get_folder_output_to_yojson (x : get_folder_output) =
  assoc_to_yojson
    [
      ("subModules", option_to_yojson sub_module_list_to_yojson x.sub_modules);
      ("symbolicLinks", option_to_yojson symbolic_link_list_to_yojson x.symbolic_links);
      ("files", option_to_yojson file_list_to_yojson x.files);
      ("subFolders", option_to_yojson folder_list_to_yojson x.sub_folders);
      ("treeId", option_to_yojson object_id_to_yojson x.tree_id);
      ("folderPath", Some (path_to_yojson x.folder_path));
      ("commitId", Some (object_id_to_yojson x.commit_id));
    ]

let get_folder_input_to_yojson (x : get_folder_input) =
  assoc_to_yojson
    [
      ("folderPath", Some (path_to_yojson x.folder_path));
      ("commitSpecifier", option_to_yojson commit_name_to_yojson x.commit_specifier);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let folder_does_not_exist_exception_to_yojson (x : folder_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_file_output_to_yojson (x : get_file_output) =
  assoc_to_yojson
    [
      ("fileContent", Some (file_content_to_yojson x.file_content));
      ("fileSize", Some (object_size_to_yojson x.file_size));
      ("fileMode", Some (file_mode_type_enum_to_yojson x.file_mode));
      ("filePath", Some (path_to_yojson x.file_path));
      ("blobId", Some (object_id_to_yojson x.blob_id));
      ("commitId", Some (object_id_to_yojson x.commit_id));
    ]

let get_file_input_to_yojson (x : get_file_input) =
  assoc_to_yojson
    [
      ("filePath", Some (path_to_yojson x.file_path));
      ("commitSpecifier", option_to_yojson commit_name_to_yojson x.commit_specifier);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let file_too_large_exception_to_yojson (x : file_too_large_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let file_does_not_exist_exception_to_yojson (x : file_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let blob_metadata_to_yojson (x : blob_metadata) =
  assoc_to_yojson
    [
      ("mode", option_to_yojson mode_to_yojson x.mode);
      ("path", option_to_yojson path_to_yojson x.path);
      ("blobId", option_to_yojson object_id_to_yojson x.blob_id);
    ]

let difference_to_yojson (x : difference) =
  assoc_to_yojson
    [
      ("changeType", option_to_yojson change_type_enum_to_yojson x.change_type);
      ("afterBlob", option_to_yojson blob_metadata_to_yojson x.after_blob);
      ("beforeBlob", option_to_yojson blob_metadata_to_yojson x.before_blob);
    ]

let difference_list_to_yojson tree = list_to_yojson difference_to_yojson tree

let get_differences_output_to_yojson (x : get_differences_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("differences", option_to_yojson difference_list_to_yojson x.differences);
    ]

let get_differences_input_to_yojson (x : get_differences_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("afterPath", option_to_yojson path_to_yojson x.after_path);
      ("beforePath", option_to_yojson path_to_yojson x.before_path);
      ("afterCommitSpecifier", Some (commit_name_to_yojson x.after_commit_specifier));
      ("beforeCommitSpecifier", option_to_yojson commit_name_to_yojson x.before_commit_specifier);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let get_commit_output_to_yojson (x : get_commit_output) =
  assoc_to_yojson [ ("commit", Some (commit_to_yojson x.commit)) ]

let get_commit_input_to_yojson (x : get_commit_input) =
  assoc_to_yojson
    [
      ("commitId", Some (object_id_to_yojson x.commit_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let commit_id_does_not_exist_exception_to_yojson (x : commit_id_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let comments_to_yojson tree = list_to_yojson comment_to_yojson tree

let comments_for_pull_request_to_yojson (x : comments_for_pull_request) =
  assoc_to_yojson
    [
      ("comments", option_to_yojson comments_to_yojson x.comments);
      ("location", option_to_yojson location_to_yojson x.location);
      ("afterBlobId", option_to_yojson object_id_to_yojson x.after_blob_id);
      ("beforeBlobId", option_to_yojson object_id_to_yojson x.before_blob_id);
      ("afterCommitId", option_to_yojson commit_id_to_yojson x.after_commit_id);
      ("beforeCommitId", option_to_yojson commit_id_to_yojson x.before_commit_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("pullRequestId", option_to_yojson pull_request_id_to_yojson x.pull_request_id);
    ]

let comments_for_pull_request_data_to_yojson tree =
  list_to_yojson comments_for_pull_request_to_yojson tree

let get_comments_for_pull_request_output_to_yojson (x : get_comments_for_pull_request_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "commentsForPullRequestData",
        option_to_yojson comments_for_pull_request_data_to_yojson x.comments_for_pull_request_data
      );
    ]

let get_comments_for_pull_request_input_to_yojson (x : get_comments_for_pull_request_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("afterCommitId", option_to_yojson commit_id_to_yojson x.after_commit_id);
      ("beforeCommitId", option_to_yojson commit_id_to_yojson x.before_commit_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let comments_for_compared_commit_to_yojson (x : comments_for_compared_commit) =
  assoc_to_yojson
    [
      ("comments", option_to_yojson comments_to_yojson x.comments);
      ("location", option_to_yojson location_to_yojson x.location);
      ("afterBlobId", option_to_yojson object_id_to_yojson x.after_blob_id);
      ("beforeBlobId", option_to_yojson object_id_to_yojson x.before_blob_id);
      ("afterCommitId", option_to_yojson commit_id_to_yojson x.after_commit_id);
      ("beforeCommitId", option_to_yojson commit_id_to_yojson x.before_commit_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let comments_for_compared_commit_data_to_yojson tree =
  list_to_yojson comments_for_compared_commit_to_yojson tree

let get_comments_for_compared_commit_output_to_yojson (x : get_comments_for_compared_commit_output)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "commentsForComparedCommitData",
        option_to_yojson comments_for_compared_commit_data_to_yojson
          x.comments_for_compared_commit_data );
    ]

let get_comments_for_compared_commit_input_to_yojson (x : get_comments_for_compared_commit_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("afterCommitId", Some (commit_id_to_yojson x.after_commit_id));
      ("beforeCommitId", option_to_yojson commit_id_to_yojson x.before_commit_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let get_comment_reactions_output_to_yojson (x : get_comment_reactions_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("reactionsForComment", Some (reactions_for_comment_list_to_yojson x.reactions_for_comment));
    ]

let get_comment_reactions_input_to_yojson (x : get_comment_reactions_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("reactionUserArn", option_to_yojson arn_to_yojson x.reaction_user_arn);
      ("commentId", Some (comment_id_to_yojson x.comment_id));
    ]

let get_comment_output_to_yojson (x : get_comment_output) =
  assoc_to_yojson [ ("comment", option_to_yojson comment_to_yojson x.comment) ]

let get_comment_input_to_yojson (x : get_comment_input) =
  assoc_to_yojson [ ("commentId", Some (comment_id_to_yojson x.comment_id)) ]

let branch_info_to_yojson (x : branch_info) =
  assoc_to_yojson
    [
      ("commitId", option_to_yojson commit_id_to_yojson x.commit_id);
      ("branchName", option_to_yojson branch_name_to_yojson x.branch_name);
    ]

let get_branch_output_to_yojson (x : get_branch_output) =
  assoc_to_yojson [ ("branch", option_to_yojson branch_info_to_yojson x.branch) ]

let get_branch_input_to_yojson (x : get_branch_input) =
  assoc_to_yojson
    [
      ("branchName", option_to_yojson branch_name_to_yojson x.branch_name);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let get_blob_output_to_yojson (x : get_blob_output) =
  assoc_to_yojson [ ("content", Some (blob_to_yojson x.content)) ]

let get_blob_input_to_yojson (x : get_blob_input) =
  assoc_to_yojson
    [
      ("blobId", Some (object_id_to_yojson x.blob_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let blob_id_required_exception_to_yojson (x : blob_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let blob_id_does_not_exist_exception_to_yojson (x : blob_id_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_approval_rule_template_output_to_yojson (x : get_approval_rule_template_output) =
  assoc_to_yojson
    [ ("approvalRuleTemplate", Some (approval_rule_template_to_yojson x.approval_rule_template)) ]

let get_approval_rule_template_input_to_yojson (x : get_approval_rule_template_input) =
  assoc_to_yojson
    [
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let file_metadata_to_yojson (x : file_metadata) =
  assoc_to_yojson
    [
      ("fileMode", option_to_yojson file_mode_type_enum_to_yojson x.file_mode);
      ("blobId", option_to_yojson object_id_to_yojson x.blob_id);
      ("absolutePath", option_to_yojson path_to_yojson x.absolute_path);
    ]

let files_metadata_to_yojson tree = list_to_yojson file_metadata_to_yojson tree
let file_paths_to_yojson tree = list_to_yojson path_to_yojson tree

let file_entry_required_exception_to_yojson (x : file_entry_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let file_content_and_source_file_specified_exception_to_yojson
    (x : file_content_and_source_file_specified_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let exception_name_to_yojson = string_to_yojson
let approved_to_yojson = bool_to_yojson
let approval_rules_satisfied_list_to_yojson tree = list_to_yojson approval_rule_name_to_yojson tree

let approval_rules_not_satisfied_list_to_yojson tree =
  list_to_yojson approval_rule_name_to_yojson tree

let evaluation_to_yojson (x : evaluation) =
  assoc_to_yojson
    [
      ( "approvalRulesNotSatisfied",
        option_to_yojson approval_rules_not_satisfied_list_to_yojson x.approval_rules_not_satisfied
      );
      ( "approvalRulesSatisfied",
        option_to_yojson approval_rules_satisfied_list_to_yojson x.approval_rules_satisfied );
      ("overridden", option_to_yojson overridden_to_yojson x.overridden);
      ("approved", option_to_yojson approved_to_yojson x.approved);
    ]

let evaluate_pull_request_approval_rules_output_to_yojson
    (x : evaluate_pull_request_approval_rules_output) =
  assoc_to_yojson [ ("evaluation", Some (evaluation_to_yojson x.evaluation)) ]

let evaluate_pull_request_approval_rules_input_to_yojson
    (x : evaluate_pull_request_approval_rules_input) =
  assoc_to_yojson
    [
      ("revisionId", Some (revision_id_to_yojson x.revision_id));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let error_message_to_yojson = string_to_yojson
let error_code_to_yojson = string_to_yojson

let disassociate_approval_rule_template_from_repository_input_to_yojson
    (x : disassociate_approval_rule_template_from_repository_input) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let describe_pull_request_events_output_to_yojson (x : describe_pull_request_events_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("pullRequestEvents", Some (pull_request_event_list_to_yojson x.pull_request_events));
    ]

let describe_pull_request_events_input_to_yojson (x : describe_pull_request_events_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("actorArn", option_to_yojson arn_to_yojson x.actor_arn);
      ( "pullRequestEventType",
        option_to_yojson pull_request_event_type_to_yojson x.pull_request_event_type );
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let actor_does_not_exist_exception_to_yojson (x : actor_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let describe_merge_conflicts_output_to_yojson (x : describe_merge_conflicts_output) =
  assoc_to_yojson
    [
      ("baseCommitId", option_to_yojson object_id_to_yojson x.base_commit_id);
      ("sourceCommitId", Some (object_id_to_yojson x.source_commit_id));
      ("destinationCommitId", Some (object_id_to_yojson x.destination_commit_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("mergeHunks", Some (merge_hunks_to_yojson x.merge_hunks));
      ("conflictMetadata", Some (conflict_metadata_to_yojson x.conflict_metadata));
    ]

let describe_merge_conflicts_input_to_yojson (x : describe_merge_conflicts_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("filePath", Some (path_to_yojson x.file_path));
      ("maxMergeHunks", option_to_yojson max_results_to_yojson x.max_merge_hunks);
      ("mergeOption", Some (merge_option_type_enum_to_yojson x.merge_option));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let delete_repository_output_to_yojson (x : delete_repository_output) =
  assoc_to_yojson [ ("repositoryId", option_to_yojson repository_id_to_yojson x.repository_id) ]

let delete_repository_input_to_yojson (x : delete_repository_input) =
  assoc_to_yojson [ ("repositoryName", Some (repository_name_to_yojson x.repository_name)) ]

let delete_pull_request_approval_rule_output_to_yojson
    (x : delete_pull_request_approval_rule_output) =
  assoc_to_yojson [ ("approvalRuleId", Some (approval_rule_id_to_yojson x.approval_rule_id)) ]

let delete_pull_request_approval_rule_input_to_yojson (x : delete_pull_request_approval_rule_input)
    =
  assoc_to_yojson
    [
      ("approvalRuleName", Some (approval_rule_name_to_yojson x.approval_rule_name));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let cannot_delete_approval_rule_from_template_exception_to_yojson
    (x : cannot_delete_approval_rule_from_template_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let delete_file_output_to_yojson (x : delete_file_output) =
  assoc_to_yojson
    [
      ("filePath", Some (path_to_yojson x.file_path));
      ("treeId", Some (object_id_to_yojson x.tree_id));
      ("blobId", Some (object_id_to_yojson x.blob_id));
      ("commitId", Some (object_id_to_yojson x.commit_id));
    ]

let delete_file_input_to_yojson (x : delete_file_input) =
  assoc_to_yojson
    [
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", option_to_yojson name_to_yojson x.name);
      ("commitMessage", option_to_yojson message_to_yojson x.commit_message);
      ("keepEmptyFolders", option_to_yojson keep_empty_folders_to_yojson x.keep_empty_folders);
      ("parentCommitId", Some (commit_id_to_yojson x.parent_commit_id));
      ("filePath", Some (path_to_yojson x.file_path));
      ("branchName", Some (branch_name_to_yojson x.branch_name));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let delete_comment_content_output_to_yojson (x : delete_comment_content_output) =
  assoc_to_yojson [ ("comment", option_to_yojson comment_to_yojson x.comment) ]

let delete_comment_content_input_to_yojson (x : delete_comment_content_input) =
  assoc_to_yojson [ ("commentId", Some (comment_id_to_yojson x.comment_id)) ]

let delete_branch_output_to_yojson (x : delete_branch_output) =
  assoc_to_yojson [ ("deletedBranch", option_to_yojson branch_info_to_yojson x.deleted_branch) ]

let delete_branch_input_to_yojson (x : delete_branch_input) =
  assoc_to_yojson
    [
      ("branchName", Some (branch_name_to_yojson x.branch_name));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let default_branch_cannot_be_deleted_exception_to_yojson
    (x : default_branch_cannot_be_deleted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let delete_approval_rule_template_output_to_yojson (x : delete_approval_rule_template_output) =
  assoc_to_yojson
    [
      ( "approvalRuleTemplateId",
        Some (approval_rule_template_id_to_yojson x.approval_rule_template_id) );
    ]

let delete_approval_rule_template_input_to_yojson (x : delete_approval_rule_template_input) =
  assoc_to_yojson
    [
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let approval_rule_template_in_use_exception_to_yojson (x : approval_rule_template_in_use_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let create_unreferenced_merge_commit_output_to_yojson (x : create_unreferenced_merge_commit_output)
    =
  assoc_to_yojson
    [
      ("treeId", option_to_yojson object_id_to_yojson x.tree_id);
      ("commitId", option_to_yojson object_id_to_yojson x.commit_id);
    ]

let create_unreferenced_merge_commit_input_to_yojson (x : create_unreferenced_merge_commit_input) =
  assoc_to_yojson
    [
      ("conflictResolution", option_to_yojson conflict_resolution_to_yojson x.conflict_resolution);
      ("keepEmptyFolders", option_to_yojson keep_empty_folders_to_yojson x.keep_empty_folders);
      ("commitMessage", option_to_yojson message_to_yojson x.commit_message);
      ("email", option_to_yojson email_to_yojson x.email);
      ("authorName", option_to_yojson name_to_yojson x.author_name);
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("mergeOption", Some (merge_option_type_enum_to_yojson x.merge_option));
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let create_repository_output_to_yojson (x : create_repository_output) =
  assoc_to_yojson
    [ ("repositoryMetadata", option_to_yojson repository_metadata_to_yojson x.repository_metadata) ]

let create_repository_input_to_yojson (x : create_repository_input) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("tags", option_to_yojson tags_map_to_yojson x.tags);
      ( "repositoryDescription",
        option_to_yojson repository_description_to_yojson x.repository_description );
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let create_pull_request_output_to_yojson (x : create_pull_request_output) =
  assoc_to_yojson [ ("pullRequest", Some (pull_request_to_yojson x.pull_request)) ]

let create_pull_request_input_to_yojson (x : create_pull_request_input) =
  assoc_to_yojson
    [
      ( "clientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("targets", Some (target_list_to_yojson x.targets));
      ("description", option_to_yojson description_to_yojson x.description);
      ("title", Some (title_to_yojson x.title));
    ]

let create_pull_request_approval_rule_output_to_yojson
    (x : create_pull_request_approval_rule_output) =
  assoc_to_yojson [ ("approvalRule", Some (approval_rule_to_yojson x.approval_rule)) ]

let create_pull_request_approval_rule_input_to_yojson (x : create_pull_request_approval_rule_input)
    =
  assoc_to_yojson
    [
      ("approvalRuleContent", Some (approval_rule_content_to_yojson x.approval_rule_content));
      ("approvalRuleName", Some (approval_rule_name_to_yojson x.approval_rule_name));
      ("pullRequestId", Some (pull_request_id_to_yojson x.pull_request_id));
    ]

let approval_rule_name_already_exists_exception_to_yojson
    (x : approval_rule_name_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let create_commit_output_to_yojson (x : create_commit_output) =
  assoc_to_yojson
    [
      ("filesDeleted", option_to_yojson files_metadata_to_yojson x.files_deleted);
      ("filesUpdated", option_to_yojson files_metadata_to_yojson x.files_updated);
      ("filesAdded", option_to_yojson files_metadata_to_yojson x.files_added);
      ("treeId", option_to_yojson object_id_to_yojson x.tree_id);
      ("commitId", option_to_yojson object_id_to_yojson x.commit_id);
    ]

let create_commit_input_to_yojson (x : create_commit_input) =
  assoc_to_yojson
    [
      ("setFileModes", option_to_yojson set_file_mode_entries_to_yojson x.set_file_modes);
      ("deleteFiles", option_to_yojson delete_file_entries_to_yojson x.delete_files);
      ("putFiles", option_to_yojson put_file_entries_to_yojson x.put_files);
      ("keepEmptyFolders", option_to_yojson keep_empty_folders_to_yojson x.keep_empty_folders);
      ("commitMessage", option_to_yojson message_to_yojson x.commit_message);
      ("email", option_to_yojson email_to_yojson x.email);
      ("authorName", option_to_yojson name_to_yojson x.author_name);
      ("parentCommitId", option_to_yojson commit_id_to_yojson x.parent_commit_id);
      ("branchName", Some (branch_name_to_yojson x.branch_name));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let create_branch_input_to_yojson (x : create_branch_input) =
  assoc_to_yojson
    [
      ("commitId", Some (commit_id_to_yojson x.commit_id));
      ("branchName", Some (branch_name_to_yojson x.branch_name));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let branch_name_exists_exception_to_yojson (x : branch_name_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let create_approval_rule_template_output_to_yojson (x : create_approval_rule_template_output) =
  assoc_to_yojson
    [ ("approvalRuleTemplate", Some (approval_rule_template_to_yojson x.approval_rule_template)) ]

let create_approval_rule_template_input_to_yojson (x : create_approval_rule_template_input) =
  assoc_to_yojson
    [
      ( "approvalRuleTemplateDescription",
        option_to_yojson approval_rule_template_description_to_yojson
          x.approval_rule_template_description );
      ( "approvalRuleTemplateContent",
        Some (approval_rule_template_content_to_yojson x.approval_rule_template_content) );
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let conflict_to_yojson (x : conflict) =
  assoc_to_yojson
    [
      ("mergeHunks", option_to_yojson merge_hunks_to_yojson x.merge_hunks);
      ("conflictMetadata", option_to_yojson conflict_metadata_to_yojson x.conflict_metadata);
    ]

let conflicts_to_yojson tree = list_to_yojson conflict_to_yojson tree
let commit_objects_list_to_yojson tree = list_to_yojson commit_to_yojson tree

let commit_ids_list_required_exception_to_yojson (x : commit_ids_list_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let commit_ids_limit_exceeded_exception_to_yojson (x : commit_ids_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let commit_ids_input_list_to_yojson tree = list_to_yojson object_id_to_yojson tree

let batch_get_repositories_error_code_enum_to_yojson (x : batch_get_repositories_error_code_enum) =
  match x with
  | REPOSITORY_DOES_NOT_EXIST_EXCEPTION -> `String "RepositoryDoesNotExistException"
  | ENCRYPTION_KEY_UNAVAILABLE_EXCEPTION -> `String "EncryptionKeyUnavailableException"
  | ENCRYPTION_KEY_NOT_FOUND_EXCEPTION -> `String "EncryptionKeyNotFoundException"
  | ENCRYPTION_KEY_DISABLED_EXCEPTION -> `String "EncryptionKeyDisabledException"
  | ENCRYPTION_KEY_ACCESS_DENIED_EXCEPTION -> `String "EncryptionKeyAccessDeniedException"
  | ENCRYPTION_INTEGRITY_CHECKS_FAILED_EXCEPTION ->
      `String "EncryptionIntegrityChecksFailedException"

let batch_get_repositories_error_to_yojson (x : batch_get_repositories_error) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("errorCode", option_to_yojson batch_get_repositories_error_code_enum_to_yojson x.error_code);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("repositoryId", option_to_yojson repository_id_to_yojson x.repository_id);
    ]

let batch_get_repositories_errors_list_to_yojson tree =
  list_to_yojson batch_get_repositories_error_to_yojson tree

let batch_get_repositories_output_to_yojson (x : batch_get_repositories_output) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson batch_get_repositories_errors_list_to_yojson x.errors);
      ( "repositoriesNotFound",
        option_to_yojson repository_not_found_list_to_yojson x.repositories_not_found );
      ("repositories", option_to_yojson repository_metadata_list_to_yojson x.repositories);
    ]

let batch_get_repositories_input_to_yojson (x : batch_get_repositories_input) =
  assoc_to_yojson [ ("repositoryNames", Some (repository_name_list_to_yojson x.repository_names)) ]

let batch_get_commits_error_to_yojson (x : batch_get_commits_error) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("errorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("commitId", option_to_yojson object_id_to_yojson x.commit_id);
    ]

let batch_get_commits_errors_list_to_yojson tree =
  list_to_yojson batch_get_commits_error_to_yojson tree

let batch_get_commits_output_to_yojson (x : batch_get_commits_output) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson batch_get_commits_errors_list_to_yojson x.errors);
      ("commits", option_to_yojson commit_objects_list_to_yojson x.commits);
    ]

let batch_get_commits_input_to_yojson (x : batch_get_commits_input) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("commitIds", Some (commit_ids_input_list_to_yojson x.commit_ids));
    ]

let batch_disassociate_approval_rule_template_from_repositories_error_to_yojson
    (x : batch_disassociate_approval_rule_template_from_repositories_error) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("errorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let batch_disassociate_approval_rule_template_from_repositories_errors_list_to_yojson tree =
  list_to_yojson batch_disassociate_approval_rule_template_from_repositories_error_to_yojson tree

let batch_disassociate_approval_rule_template_from_repositories_output_to_yojson
    (x : batch_disassociate_approval_rule_template_from_repositories_output) =
  assoc_to_yojson
    [
      ( "errors",
        Some
          (batch_disassociate_approval_rule_template_from_repositories_errors_list_to_yojson
             x.errors) );
      ( "disassociatedRepositoryNames",
        Some (repository_name_list_to_yojson x.disassociated_repository_names) );
    ]

let batch_disassociate_approval_rule_template_from_repositories_input_to_yojson
    (x : batch_disassociate_approval_rule_template_from_repositories_input) =
  assoc_to_yojson
    [
      ("repositoryNames", Some (repository_name_list_to_yojson x.repository_names));
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let batch_describe_merge_conflicts_error_to_yojson (x : batch_describe_merge_conflicts_error) =
  assoc_to_yojson
    [
      ("message", Some (message_to_yojson x.message));
      ("exceptionName", Some (exception_name_to_yojson x.exception_name));
      ("filePath", Some (path_to_yojson x.file_path));
    ]

let batch_describe_merge_conflicts_errors_to_yojson tree =
  list_to_yojson batch_describe_merge_conflicts_error_to_yojson tree

let batch_describe_merge_conflicts_output_to_yojson (x : batch_describe_merge_conflicts_output) =
  assoc_to_yojson
    [
      ("baseCommitId", option_to_yojson object_id_to_yojson x.base_commit_id);
      ("sourceCommitId", Some (object_id_to_yojson x.source_commit_id));
      ("destinationCommitId", Some (object_id_to_yojson x.destination_commit_id));
      ("errors", option_to_yojson batch_describe_merge_conflicts_errors_to_yojson x.errors);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("conflicts", Some (conflicts_to_yojson x.conflicts));
    ]

let batch_describe_merge_conflicts_input_to_yojson (x : batch_describe_merge_conflicts_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "conflictResolutionStrategy",
        option_to_yojson conflict_resolution_strategy_type_enum_to_yojson
          x.conflict_resolution_strategy );
      ( "conflictDetailLevel",
        option_to_yojson conflict_detail_level_type_enum_to_yojson x.conflict_detail_level );
      ("filePaths", option_to_yojson file_paths_to_yojson x.file_paths);
      ("maxConflictFiles", option_to_yojson max_results_to_yojson x.max_conflict_files);
      ("maxMergeHunks", option_to_yojson max_results_to_yojson x.max_merge_hunks);
      ("mergeOption", Some (merge_option_type_enum_to_yojson x.merge_option));
      ("sourceCommitSpecifier", Some (commit_name_to_yojson x.source_commit_specifier));
      ("destinationCommitSpecifier", Some (commit_name_to_yojson x.destination_commit_specifier));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let batch_associate_approval_rule_template_with_repositories_error_to_yojson
    (x : batch_associate_approval_rule_template_with_repositories_error) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("errorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let batch_associate_approval_rule_template_with_repositories_errors_list_to_yojson tree =
  list_to_yojson batch_associate_approval_rule_template_with_repositories_error_to_yojson tree

let batch_associate_approval_rule_template_with_repositories_output_to_yojson
    (x : batch_associate_approval_rule_template_with_repositories_output) =
  assoc_to_yojson
    [
      ( "errors",
        Some
          (batch_associate_approval_rule_template_with_repositories_errors_list_to_yojson x.errors)
      );
      ( "associatedRepositoryNames",
        Some (repository_name_list_to_yojson x.associated_repository_names) );
    ]

let batch_associate_approval_rule_template_with_repositories_input_to_yojson
    (x : batch_associate_approval_rule_template_with_repositories_input) =
  assoc_to_yojson
    [
      ("repositoryNames", Some (repository_name_list_to_yojson x.repository_names));
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]

let associate_approval_rule_template_with_repository_input_to_yojson
    (x : associate_approval_rule_template_with_repository_input) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ( "approvalRuleTemplateName",
        Some (approval_rule_template_name_to_yojson x.approval_rule_template_name) );
    ]
