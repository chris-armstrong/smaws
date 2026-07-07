type nonrec blob = bytes [@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec email = string [@@ocaml.doc ""]

type nonrec date = string [@@ocaml.doc ""]

type nonrec user_info = {
  date : date option;
      [@ocaml.doc
        "The date when the specified commit was commited, in timestamp format with GMT offset.\n"]
  email : email option;
      [@ocaml.doc "The email address associated with the user who made the commit, if any.\n"]
  name : name option; [@ocaml.doc "The name of the user who made the specified commit.\n"]
}
[@@ocaml.doc "Information about the user who made a specified commit.\n"]

type nonrec repository_name = string [@@ocaml.doc ""]

type nonrec update_repository_name_input = {
  new_name : repository_name; [@ocaml.doc "The new name for the repository.\n"]
  old_name : repository_name; [@ocaml.doc "The current name of the repository.\n"]
}
[@@ocaml.doc "Represents the input of an update repository description operation.\n"]

type nonrec message = string [@@ocaml.doc ""]

type nonrec repository_name_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A repository name is required, but was not specified.\n"]

type nonrec repository_name_exists_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified repository name already exists.\n"]

type nonrec repository_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified repository does not exist.\n"]

type nonrec invalid_repository_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A specified repository name is not valid.\n\n\
  \  This exception occurs only when a specified repository name is not valid. Other exceptions \
   occur when a required repository parameter is missing, or when a specified repository does not \
   exist.\n\
  \  \n\
  \   "]

type nonrec repository_id = string [@@ocaml.doc ""]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec update_repository_encryption_key_output = {
  original_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the encryption key formerly used to encrypt and decrypt the repository.\n"]
  kms_key_id : kms_key_id option; [@ocaml.doc "The ID of the encryption key.\n"]
  repository_id : repository_id option; [@ocaml.doc "The ID of the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec update_repository_encryption_key_input = {
  kms_key_id : kms_key_id;
      [@ocaml.doc
        "The ID of the encryption key. You can view the ID of an encryption key in the KMS \
         console, or use the KMS APIs to programmatically retrieve a key ID. For more information \
         about acceptable values for keyID, see \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_Decrypt.html#KMS-Decrypt-request-KeyId}KeyId} \
         in the Decrypt API description in the {i Key Management Service API Reference}.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository for which you want to update the KMS encryption key used to \
         encrypt and decrypt the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec encryption_key_unavailable_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The encryption key is not available.\n"]

type nonrec encryption_key_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A KMS encryption key ID is required but was not specified.\n"]

type nonrec encryption_key_not_found_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "No encryption key was found.\n"]

type nonrec encryption_key_invalid_usage_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A KMS encryption key was used to try and encrypt or decrypt a repository, but either the \
   repository or the key was not in a valid state to support the operation.\n"]

type nonrec encryption_key_invalid_id_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The Key Management Service encryption key is not valid.\n"]

type nonrec encryption_key_disabled_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The encryption key is disabled.\n"]

type nonrec encryption_key_access_denied_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "An encryption key could not be accessed.\n"]

type nonrec encryption_integrity_checks_failed_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "An encryption integrity check failed.\n"]

type nonrec repository_description = string [@@ocaml.doc ""]

type nonrec update_repository_description_input = {
  repository_description : repository_description option;
      [@ocaml.doc
        "The new comment or description for the specified repository. Repository descriptions are \
         limited to 1,000 characters.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to set or change the comment or description for.\n"]
}
[@@ocaml.doc "Represents the input of an update repository description operation.\n"]

type nonrec invalid_repository_description_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified repository description is not valid.\n"]

type nonrec pull_request_id = string [@@ocaml.doc ""]

type nonrec title = string [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec last_modified_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec creation_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec pull_request_status_enum = CLOSED [@ocaml.doc ""] | OPEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec reference_name = string [@@ocaml.doc ""]

type nonrec commit_id = string [@@ocaml.doc ""]

type nonrec is_merged = bool [@@ocaml.doc ""]

type nonrec merge_option_type_enum =
  | THREE_WAY_MERGE [@ocaml.doc ""]
  | SQUASH_MERGE [@ocaml.doc ""]
  | FAST_FORWARD_MERGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec merge_metadata = {
  merge_option : merge_option_type_enum option;
      [@ocaml.doc "The merge strategy used in the merge.\n"]
  merge_commit_id : commit_id option; [@ocaml.doc "The commit ID for the merge commit, if any.\n"]
  merged_by : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the user who merged the branches.\n"]
  is_merged : is_merged option;
      [@ocaml.doc "A Boolean value indicating whether the merge has been made.\n"]
}
[@@ocaml.doc
  "Returns information about a merge or potential merge between a source reference and a \
   destination reference in a pull request.\n"]

type nonrec pull_request_target = {
  merge_metadata : merge_metadata option;
      [@ocaml.doc
        "Returns metadata about the state of the merge, including whether the merge has been made.\n"]
  merge_base : commit_id option;
      [@ocaml.doc
        "The commit ID of the most recent commit that the source branch and the destination branch \
         have in common.\n"]
  source_commit : commit_id option;
      [@ocaml.doc
        "The full commit ID of the tip of the source branch used to create the pull request. If \
         the pull request branch is updated by a push while the pull request is open, the commit \
         ID changes to reflect the new tip of the branch.\n"]
  destination_commit : commit_id option;
      [@ocaml.doc
        "The full commit ID that is the tip of the destination branch. This is the commit where \
         the pull request was or will be merged.\n"]
  destination_reference : reference_name option;
      [@ocaml.doc
        "The branch of the repository where the pull request changes are merged. Also known as the \
         destination branch. \n"]
  source_reference : reference_name option;
      [@ocaml.doc
        "The branch of the repository that contains the changes for the pull request. Also known \
         as the source branch.\n"]
  repository_name : repository_name option;
      [@ocaml.doc
        "The name of the repository that contains the pull request source and destination branches.\n"]
}
[@@ocaml.doc "Returns information about a pull request target.\n"]

type nonrec pull_request_target_list = pull_request_target list [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec revision_id = string [@@ocaml.doc ""]

type nonrec approval_rule_id = string [@@ocaml.doc ""]

type nonrec approval_rule_name = string [@@ocaml.doc ""]

type nonrec approval_rule_content = string [@@ocaml.doc ""]

type nonrec rule_content_sha256 = string [@@ocaml.doc ""]

type nonrec approval_rule_template_id = string [@@ocaml.doc ""]

type nonrec approval_rule_template_name = string [@@ocaml.doc ""]

type nonrec origin_approval_rule_template = {
  approval_rule_template_name : approval_rule_template_name option;
      [@ocaml.doc "The name of the template that created the approval rule.\n"]
  approval_rule_template_id : approval_rule_template_id option;
      [@ocaml.doc "The ID of the template that created the approval rule.\n"]
}
[@@ocaml.doc
  "Returns information about the template that created the approval rule for a pull request.\n"]

type nonrec approval_rule = {
  origin_approval_rule_template : origin_approval_rule_template option;
      [@ocaml.doc "The approval rule template used to create the rule.\n"]
  last_modified_user : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the user who made the most recent changes to the \
         approval rule.\n"]
  creation_date : creation_date option;
      [@ocaml.doc "The date the approval rule was created, in timestamp format.\n"]
  last_modified_date : last_modified_date option;
      [@ocaml.doc "The date the approval rule was most recently changed, in timestamp format.\n"]
  rule_content_sha256 : rule_content_sha256 option;
      [@ocaml.doc "The SHA-256 hash signature for the content of the approval rule.\n"]
  approval_rule_content : approval_rule_content option;
      [@ocaml.doc "The content of the approval rule.\n"]
  approval_rule_name : approval_rule_name option; [@ocaml.doc "The name of the approval rule.\n"]
  approval_rule_id : approval_rule_id option;
      [@ocaml.doc "The system-generated ID of the approval rule.\n"]
}
[@@ocaml.doc "Returns information about an approval rule.\n"]

type nonrec approval_rules_list = approval_rule list [@@ocaml.doc ""]

type nonrec pull_request = {
  approval_rules : approval_rules_list option;
      [@ocaml.doc "The approval rules applied to the pull request.\n"]
  revision_id : revision_id option;
      [@ocaml.doc "The system-generated revision ID for the pull request.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique, client-generated idempotency token that, when provided in a request, ensures \
         the request cannot be repeated with a changed parameter. If a request is received with \
         the same parameters and a token is included, the request returns information about the \
         initial request that used that token.\n"]
  pull_request_targets : pull_request_target_list option;
      [@ocaml.doc
        "The targets of the pull request, including the source branch and destination branch for \
         the pull request.\n"]
  author_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the user who created the pull request.\n"]
  pull_request_status : pull_request_status_enum option;
      [@ocaml.doc
        "The status of the pull request. Pull request status can only change from [OPEN] to \
         [CLOSED].\n"]
  creation_date : creation_date option;
      [@ocaml.doc
        "The date and time the pull request was originally created, in timestamp format.\n"]
  last_activity_date : last_modified_date option;
      [@ocaml.doc
        "The day and time of the last user or system activity on the pull request, in timestamp \
         format.\n"]
  description : description option;
      [@ocaml.doc
        "The user-defined description of the pull request. This description can be used to clarify \
         what should be reviewed and other details of the request.\n"]
  title : title option;
      [@ocaml.doc
        "The user-defined title of the pull request. This title is displayed in the list of pull \
         requests to other repository users.\n"]
  pull_request_id : pull_request_id option;
      [@ocaml.doc "The system-generated ID of the pull request. \n"]
}
[@@ocaml.doc "Returns information about a pull request.\n"]

type nonrec update_pull_request_title_output = {
  pull_request : pull_request; [@ocaml.doc "Information about the updated pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_pull_request_title_input = {
  title : title;
      [@ocaml.doc "The updated title of the pull request. This replaces the existing title.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec title_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A pull request title is required. It cannot be empty or null.\n"]

type nonrec pull_request_id_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A pull request ID is required, but none was provided.\n"]

type nonrec pull_request_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The pull request ID could not be found. Make sure that you have specified the correct \
   repository name and pull request ID, and then try again.\n"]

type nonrec pull_request_already_closed_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The pull request status cannot be updated because it is already closed.\n"]

type nonrec invalid_title_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The title of the pull request is not valid. Pull request titles cannot exceed 100 characters in \
   length.\n"]

type nonrec invalid_pull_request_id_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The pull request ID is not valid. Make sure that you have provided the full ID and that the \
   pull request is in the specified repository, and then try again.\n"]

type nonrec update_pull_request_status_output = {
  pull_request : pull_request; [@ocaml.doc "Information about the pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_pull_request_status_input = {
  pull_request_status : pull_request_status_enum;
      [@ocaml.doc
        "The status of the pull request. The only valid operations are to update the status from \
         [OPEN] to [OPEN], [OPEN] to [CLOSED] or from [CLOSED] to [CLOSED].\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec pull_request_status_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A pull request status is required, but none was provided.\n"]

type nonrec invalid_pull_request_status_update_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The pull request status update is not valid. The only valid update is from [OPEN] to [CLOSED].\n"]

type nonrec invalid_pull_request_status_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The pull request status is not valid. The only valid values are [OPEN] and [CLOSED].\n"]

type nonrec update_pull_request_description_output = {
  pull_request : pull_request; [@ocaml.doc "Information about the updated pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_pull_request_description_input = {
  description : description;
      [@ocaml.doc
        "The updated content of the description for the pull request. This content replaces the \
         existing description.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_description_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The pull request description is not valid. Descriptions cannot be more than 1,000 characters.\n"]

type nonrec approval_state = REVOKE [@ocaml.doc ""] | APPROVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_pull_request_approval_state_input = {
  approval_state : approval_state;
      [@ocaml.doc "The approval state to associate with the user on the pull request.\n"]
  revision_id : revision_id; [@ocaml.doc "The system-generated ID of the revision.\n"]
  pull_request_id : pull_request_id; [@ocaml.doc "The system-generated ID of the pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec revision_not_current_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The revision ID provided in the request does not match the current revision ID. Use \
   GetPullRequest to retrieve the current revision ID.\n"]

type nonrec revision_id_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A revision ID is required, but was not provided.\n"]

type nonrec pull_request_cannot_be_approved_by_author_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The approval cannot be applied because the user approving the pull request matches the user who \
   created the pull request. You cannot approve a pull request that you created.\n"]

type nonrec maximum_number_of_approvals_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The number of approvals required for the approval rule exceeds the maximum number allowed.\n"]

type nonrec invalid_revision_id_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The revision ID is not valid. Use GetPullRequest to determine the value.\n"]

type nonrec invalid_approval_state_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The state for the approval is not valid. Valid values include APPROVE and REVOKE. \n"]

type nonrec approval_state_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "An approval state is required, but was not specified.\n"]

type nonrec update_pull_request_approval_rule_content_output = {
  approval_rule : approval_rule; [@ocaml.doc "Information about the updated approval rule.\n"]
}
[@@ocaml.doc ""]

type nonrec update_pull_request_approval_rule_content_input = {
  new_rule_content : approval_rule_content;
      [@ocaml.doc
        "The updated content for the approval rule.\n\n\
        \  When you update the content of the approval rule, you can specify approvers in an \
         approval pool in one of two ways:\n\
        \  \n\
        \   {ul\n\
        \         {-   {b CodeCommitApprovers}: This option only requires an Amazon Web Services \
         account and a resource. It can be used for both IAM users and federated access users \
         whose name matches the provided resource name. This is a very powerful option that offers \
         a great deal of flexibility. For example, if you specify the Amazon Web Services account \
         {i 123456789012} and {i Mary_Major}, all of the following are counted as approvals coming \
         from that user:\n\
        \             \n\
        \              {ul\n\
        \                    {-  An IAM user in the account (arn:aws:iam::{i 123456789012}:user/{i \
         Mary_Major})\n\
        \                        \n\
        \                         }\n\
        \                    {-  A federated user identified in IAM as Mary_Major (arn:aws:sts::{i \
         123456789012}:federated-user/{i Mary_Major})\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \          }\n\
        \           This option does not recognize an active session of someone assuming the role \
         of CodeCommitReview with a role session name of {i Mary_Major} (arn:aws:sts::{i \
         123456789012}:assumed-role/CodeCommitReview/{i Mary_Major}) unless you include a wildcard \
         (*Mary_Major).\n\
        \           \n\
        \            }\n\
        \         {-   {b Fully qualified ARN}: This option allows you to specify the fully \
         qualified Amazon Resource Name (ARN) of the IAM user or role. \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   For more information about IAM ARNs, wildcards, and formats, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html}IAM \
         Identifiers} in the {i IAM User Guide}.\n\
        \   \n\
        \    "]
  existing_rule_content_sha256 : rule_content_sha256 option;
      [@ocaml.doc
        "The SHA-256 hash signature for the content of the approval rule. You can retrieve this \
         information by using [GetPullRequest].\n"]
  approval_rule_name : approval_rule_name;
      [@ocaml.doc "The name of the approval rule you want to update.\n"]
  pull_request_id : pull_request_id; [@ocaml.doc "The system-generated ID of the pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_rule_content_sha256_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The SHA-256 hash signature for the rule content is not valid.\n"]

type nonrec invalid_approval_rule_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The name for the approval rule is not valid.\n"]

type nonrec invalid_approval_rule_content_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The content for the approval rule is not valid.\n"]

type nonrec cannot_modify_approval_rule_from_template_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The approval rule cannot be modified for the pull request because it was created by an approval \
   rule template and applied to the pull request automatically.\n"]

type nonrec approval_rule_name_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "An approval rule name is required, but was not specified.\n"]

type nonrec approval_rule_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified approval rule does not exist.\n"]

type nonrec approval_rule_content_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The content for the approval rule is empty. You must provide some content for an approval rule. \
   The content cannot be null.\n"]

type nonrec branch_name = string [@@ocaml.doc ""]

type nonrec update_default_branch_input = {
  default_branch_name : branch_name;
      [@ocaml.doc "The name of the branch to set as the default branch.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository for which you want to set or change the default branch.\n"]
}
[@@ocaml.doc "Represents the input of an update default branch operation.\n"]

type nonrec invalid_branch_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified reference name is not valid.\n"]

type nonrec branch_name_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A branch name is required, but was not specified.\n"]

type nonrec branch_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified branch does not exist.\n"]

type nonrec comment_id = string [@@ocaml.doc ""]

type nonrec content = string [@@ocaml.doc ""]

type nonrec is_comment_deleted = bool [@@ocaml.doc ""]

type nonrec reaction_value = string [@@ocaml.doc ""]

type nonrec caller_reactions = reaction_value list [@@ocaml.doc ""]

type nonrec count = int [@@ocaml.doc ""]

type nonrec reaction_counts_map = (reaction_value * count) list [@@ocaml.doc ""]

type nonrec comment = {
  reaction_counts : reaction_counts_map option;
      [@ocaml.doc
        "A string to integer map that represents the number of individual users who have responded \
         to a comment with the specified reactions.\n"]
  caller_reactions : caller_reactions option;
      [@ocaml.doc
        "The emoji reactions to a comment, if any, submitted by the user whose credentials are \
         associated with the call to the API.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique, client-generated idempotency token that, when provided in a request, ensures \
         the request cannot be repeated with a changed parameter. If a request is received with \
         the same parameters and a token is included, the request returns information about the \
         initial request that used that token.\n"]
  deleted : is_comment_deleted option;
      [@ocaml.doc "A Boolean value indicating whether the comment has been deleted.\n"]
  author_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the person who posted the comment.\n"]
  last_modified_date : last_modified_date option;
      [@ocaml.doc
        "The date and time the comment was most recently modified, in timestamp format.\n"]
  creation_date : creation_date option;
      [@ocaml.doc "The date and time the comment was created, in timestamp format.\n"]
  in_reply_to : comment_id option;
      [@ocaml.doc "The ID of the comment for which this comment is a reply, if any.\n"]
  content : content option; [@ocaml.doc "The content of the comment.\n"]
  comment_id : comment_id option; [@ocaml.doc "The system-generated comment ID.\n"]
}
[@@ocaml.doc "Returns information about a specific comment.\n"]

type nonrec update_comment_output = {
  comment : comment option; [@ocaml.doc "Information about the updated comment.\n"]
}
[@@ocaml.doc ""]

type nonrec update_comment_input = {
  content : content;
      [@ocaml.doc "The updated content to replace the existing content of the comment.\n"]
  comment_id : comment_id;
      [@ocaml.doc
        "The system-generated ID of the comment you want to update. To get this ID, use \
         [GetCommentsForComparedCommit] or [GetCommentsForPullRequest].\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_comment_id_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The comment ID is not in a valid format. Make sure that you have provided the full comment ID.\n"]

type nonrec comment_not_created_by_caller_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "You cannot modify or delete this comment. Only comment authors can modify or delete their \
   comments.\n"]

type nonrec comment_id_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The comment ID is missing or null. A comment ID is required.\n"]

type nonrec comment_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "No comment exists with the provided ID. Verify that you have used the correct ID, and then try \
   again.\n"]

type nonrec comment_deleted_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "This comment has already been deleted. You cannot edit or delete a deleted comment.\n"]

type nonrec comment_content_size_limit_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The comment is too large. Comments are limited to 10,240 characters.\n"]

type nonrec comment_content_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The comment is empty. You must provide some content for a comment. The content cannot be null.\n"]

type nonrec approval_rule_template_description = string [@@ocaml.doc ""]

type nonrec approval_rule_template_content = string [@@ocaml.doc ""]

type nonrec approval_rule_template = {
  last_modified_user : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the user who made the most recent changes to the \
         approval rule template.\n"]
  creation_date : creation_date option;
      [@ocaml.doc "The date the approval rule template was created, in timestamp format.\n"]
  last_modified_date : last_modified_date option;
      [@ocaml.doc
        "The date the approval rule template was most recently changed, in timestamp format.\n"]
  rule_content_sha256 : rule_content_sha256 option;
      [@ocaml.doc "The SHA-256 hash signature for the content of the approval rule template.\n"]
  approval_rule_template_content : approval_rule_template_content option;
      [@ocaml.doc "The content of the approval rule template.\n"]
  approval_rule_template_description : approval_rule_template_description option;
      [@ocaml.doc "The description of the approval rule template.\n"]
  approval_rule_template_name : approval_rule_template_name option;
      [@ocaml.doc "The name of the approval rule template.\n"]
  approval_rule_template_id : approval_rule_template_id option;
      [@ocaml.doc "The system-generated ID of the approval rule template.\n"]
}
[@@ocaml.doc "Returns information about an approval rule template.\n"]

type nonrec update_approval_rule_template_name_output = {
  approval_rule_template : approval_rule_template;
      [@ocaml.doc "The structure and content of the updated approval rule template.\n"]
}
[@@ocaml.doc ""]

type nonrec update_approval_rule_template_name_input = {
  new_approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc "The new name you want to apply to the approval rule template.\n"]
  old_approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc "The current name of the approval rule template.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_approval_rule_template_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The name of the approval rule template is not valid. Template names must be between 1 and 100 \
   valid characters in length. For more information about limits in CodeCommit, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html}Quotas} in the {i \
   CodeCommit User Guide}.\n"]

type nonrec approval_rule_template_name_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "An approval rule template name is required, but was not specified.\n"]

type nonrec approval_rule_template_name_already_exists_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "You cannot create an approval rule template with that name because a template with that name \
   already exists in this Amazon Web Services Region for your Amazon Web Services account. \
   Approval rule template names must be unique.\n"]

type nonrec approval_rule_template_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified approval rule template does not exist. Verify that the name is correct and that \
   you are signed in to the Amazon Web Services Region where the template was created, and then \
   try again.\n"]

type nonrec update_approval_rule_template_description_output = {
  approval_rule_template : approval_rule_template;
      [@ocaml.doc "The structure and content of the updated approval rule template.\n"]
}
[@@ocaml.doc ""]

type nonrec update_approval_rule_template_description_input = {
  approval_rule_template_description : approval_rule_template_description;
      [@ocaml.doc "The updated description of the approval rule template.\n"]
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc "The name of the template for which you want to update the description.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_approval_rule_template_description_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The description for the approval rule template is not valid because it exceeds the maximum \
   characters allowed for a description. For more information about limits in CodeCommit, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html}Quotas} in the {i \
   CodeCommit User Guide}.\n"]

type nonrec update_approval_rule_template_content_output = {
  approval_rule_template : approval_rule_template; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_approval_rule_template_content_input = {
  existing_rule_content_sha256 : rule_content_sha256 option;
      [@ocaml.doc
        "The SHA-256 hash signature for the content of the approval rule. You can retrieve this \
         information by using [GetPullRequest].\n"]
  new_rule_content : approval_rule_template_content;
      [@ocaml.doc
        "The content that replaces the existing content of the rule. Content statements must be \
         complete. You cannot provide only the changes.\n"]
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc
        "The name of the approval rule template where you want to update the content of the rule. \n"]
}
[@@ocaml.doc ""]

type nonrec invalid_approval_rule_template_content_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The content of the approval rule template is not valid.\n"]

type nonrec approval_rule_template_content_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The content for the approval rule template is empty. You must provide some content for an \
   approval rule template. The content cannot be null.\n"]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  tag_keys : tag_keys_list;
      [@ocaml.doc "The tag key for each tag that you want to remove from the resource.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to which you want to remove tags.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The maximum number of tags for an CodeCommit resource has been exceeded.\n"]

type nonrec tag_policy_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The tag policy is not valid.\n"]

type nonrec tag_keys_list_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A list of tag keys is required. The list cannot be empty or null.\n"]

type nonrec resource_arn_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A valid Amazon Resource Name (ARN) for an CodeCommit resource is required. For a list of valid \
   resources in CodeCommit, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats}CodeCommit \
   Resources and Operations} in the CodeCommit User Guide.\n"]

type nonrec invalid_tag_keys_list_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The list of tags is not valid.\n"]

type nonrec invalid_system_tag_usage_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified tag is not valid. Key names cannot be prefixed with aws:.\n"]

type nonrec invalid_resource_arn_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The value for the resource ARN is not valid. For more information about resources in \
   CodeCommit, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats}CodeCommit \
   Resources and Operations} in the CodeCommit User Guide.\n"]

type nonrec tips_divergence_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The divergence between the tips of the provided commit specifiers is too great to determine \
   whether there might be any merge conflicts. Locally compare the specifiers using [git diff] or \
   a diff tool.\n"]

type nonrec tip_of_source_reference_is_different_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The tip of the source branch in the destination repository does not match the tip of the source \
   branch specified in your request. The pull request might have been updated. Make sure that you \
   have the latest changes.\n"]

type nonrec repository_trigger_name = string [@@ocaml.doc ""]

type nonrec repository_trigger_name_list = repository_trigger_name list [@@ocaml.doc ""]

type nonrec repository_trigger_execution_failure_message = string [@@ocaml.doc ""]

type nonrec repository_trigger_execution_failure = {
  failure_message : repository_trigger_execution_failure_message option;
      [@ocaml.doc "Message information about the trigger that did not run.\n"]
  trigger : repository_trigger_name option;
      [@ocaml.doc "The name of the trigger that did not run.\n"]
}
[@@ocaml.doc "A trigger failed to run.\n"]

type nonrec repository_trigger_execution_failure_list = repository_trigger_execution_failure list
[@@ocaml.doc ""]

type nonrec test_repository_triggers_output = {
  failed_executions : repository_trigger_execution_failure_list option;
      [@ocaml.doc
        "The list of triggers that were not tested. This list provides the names of the triggers \
         that could not be tested, separated by commas.\n"]
  successful_executions : repository_trigger_name_list option;
      [@ocaml.doc
        "The list of triggers that were successfully tested. This list provides the names of the \
         triggers that were successfully tested, separated by commas.\n"]
}
[@@ocaml.doc "Represents the output of a test repository triggers operation.\n"]

type nonrec repository_trigger_custom_data = string [@@ocaml.doc ""]

type nonrec branch_name_list = branch_name list [@@ocaml.doc ""]

type nonrec repository_trigger_event_enum =
  | DELETE_REFERENCE [@ocaml.doc ""]
  | CREATE_REFERENCE [@ocaml.doc ""]
  | UPDATE_REFERENCE [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec repository_trigger_event_list = repository_trigger_event_enum list [@@ocaml.doc ""]

type nonrec repository_trigger = {
  events : repository_trigger_event_list;
      [@ocaml.doc
        "The repository events that cause the trigger to run actions in another service, such as \
         sending a notification through Amazon SNS. \n\n\
        \  The valid value \"all\" cannot be used with any other values.\n\
        \  \n\
        \   "]
  branches : branch_name_list option;
      [@ocaml.doc
        "The branches to be included in the trigger configuration. If you specify an empty array, \
         the trigger applies to all branches.\n\n\
        \  Although no content is required in the array, you must include the array itself.\n\
        \  \n\
        \   "]
  custom_data : repository_trigger_custom_data option;
      [@ocaml.doc
        "Any custom data associated with the trigger to be included in the information sent to the \
         target of the trigger.\n"]
  destination_arn : arn;
      [@ocaml.doc
        "The ARN of the resource that is the target for a trigger (for example, the ARN of a topic \
         in Amazon SNS).\n"]
  name : repository_trigger_name; [@ocaml.doc "The name of the trigger.\n"]
}
[@@ocaml.doc
  "Information about a trigger for a repository. \n\n\
  \  If you want to receive notifications about repository events, consider using notifications \
   instead of triggers. For more information, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-repository-email.html}Configuring \
   notifications for repository events}.\n\
  \  \n\
  \   "]

type nonrec repository_triggers_list = repository_trigger list [@@ocaml.doc ""]

type nonrec test_repository_triggers_input = {
  triggers : repository_triggers_list; [@ocaml.doc "The list of triggers to test.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository in which to test the triggers.\n"]
}
[@@ocaml.doc "Represents the input of a test repository triggers operation.\n"]

type nonrec repository_triggers_list_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The list of triggers for the repository is required, but was not specified.\n"]

type nonrec repository_trigger_name_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A name for the trigger is required, but was not specified.\n"]

type nonrec repository_trigger_events_list_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "At least one event for the trigger is required, but was not specified.\n"]

type nonrec repository_trigger_destination_arn_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A destination ARN for the target service for the trigger is required, but was not specified.\n"]

type nonrec repository_trigger_branch_name_list_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "At least one branch name is required, but was not specified in the trigger configuration.\n"]

type nonrec maximum_repository_triggers_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The number of triggers allowed for the repository was exceeded.\n"]

type nonrec maximum_branches_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The number of branches for the trigger was exceeded.\n"]

type nonrec invalid_repository_trigger_region_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The Amazon Web Services Region for the trigger target does not match the Amazon Web Services \
   Region for the repository. Triggers must be created in the same Amazon Web Services Region as \
   the target for the trigger.\n"]

type nonrec invalid_repository_trigger_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The name of the trigger is not valid.\n"]

type nonrec invalid_repository_trigger_events_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "One or more events specified for the trigger is not valid. Check to make sure that all events \
   specified match the requirements for allowed events.\n"]

type nonrec invalid_repository_trigger_destination_arn_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The Amazon Resource Name (ARN) for the trigger is not valid for the specified destination. The \
   most common reason for this error is that the ARN does not meet the requirements for the \
   service type.\n"]

type nonrec invalid_repository_trigger_custom_data_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The custom data provided for the trigger is not valid.\n"]

type nonrec invalid_repository_trigger_branch_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "One or more branch names specified for the trigger is not valid.\n"]

type nonrec targets_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "An array of target objects is required. It cannot be empty or null.\n"]

type nonrec target_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A pull request target is required. It cannot be empty or null. A pull request target must \
   contain the full values for the repository name, source branch, and destination branch for the \
   pull request.\n"]

type nonrec target = {
  destination_reference : reference_name option;
      [@ocaml.doc
        "The branch of the repository where the pull request changes are merged. Also known as the \
         destination branch.\n"]
  source_reference : reference_name;
      [@ocaml.doc
        "The branch of the repository that contains the changes for the pull request. Also known \
         as the source branch.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the pull request.\n"]
}
[@@ocaml.doc "Returns information about a target for a pull request.\n"]

type nonrec target_list = target list [@@ocaml.doc ""]

type nonrec tags_map_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A map of tags is required.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tags_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  tags : tags_map; [@ocaml.doc "The key-value pair to use when tagging this repository.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to which you want to add or update tags.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_tags_map_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The map of tags is not valid.\n"]

type nonrec object_id = string [@@ocaml.doc ""]

type nonrec path = string [@@ocaml.doc ""]

type nonrec file_mode_type_enum =
  | SYMLINK [@ocaml.doc ""]
  | NORMAL [@ocaml.doc ""]
  | EXECUTABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec symbolic_link = {
  file_mode : file_mode_type_enum option;
      [@ocaml.doc
        "The file mode permissions of the blob that cotains information about the symbolic link.\n"]
  relative_path : path option;
      [@ocaml.doc
        "The relative path of the symbolic link from the folder where the query originated.\n"]
  absolute_path : path option;
      [@ocaml.doc "The fully qualified path to the folder that contains the symbolic link.\n"]
  blob_id : object_id option;
      [@ocaml.doc "The blob ID that contains the information about the symbolic link.\n"]
}
[@@ocaml.doc "Returns information about a symbolic link in a repository folder.\n"]

type nonrec symbolic_link_list = symbolic_link list [@@ocaml.doc ""]

type nonrec sub_module = {
  relative_path : path option;
      [@ocaml.doc
        "The relative path of the submodule from the folder where the query originated.\n"]
  absolute_path : path option;
      [@ocaml.doc
        "The fully qualified path to the folder that contains the reference to the submodule.\n"]
  commit_id : object_id option;
      [@ocaml.doc "The commit ID that contains the reference to the submodule.\n"]
}
[@@ocaml.doc "Returns information about a submodule reference in a repository folder.\n"]

type nonrec sub_module_list = sub_module list [@@ocaml.doc ""]

type nonrec is_move = bool [@@ocaml.doc ""]

type nonrec source_file_specifier = {
  is_move : is_move option;
      [@ocaml.doc "Whether to remove the source file from the parent commit.\n"]
  file_path : path; [@ocaml.doc "The full path to the file, including the name of the file.\n"]
}
[@@ocaml.doc "Information about a source file that is part of changes made in a commit.\n"]

type nonrec source_file_or_content_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because no source files or file content have been specified for \
   the commit.\n"]

type nonrec source_and_destination_are_same_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The source branch and destination branch for the pull request are the same. You must specify \
   different branches for the source and destination.\n"]

type nonrec sort_by_enum = MODIFIED_DATE [@ocaml.doc ""] | REPOSITORY_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec set_file_mode_entry = {
  file_mode : file_mode_type_enum; [@ocaml.doc "The file mode for the file.\n"]
  file_path : path; [@ocaml.doc "The full path to the file, including the name of the file.\n"]
}
[@@ocaml.doc "Information about the file mode changes.\n"]

type nonrec set_file_mode_entries = set_file_mode_entry list [@@ocaml.doc ""]

type nonrec same_path_request_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because one or more changes in this commit duplicate actions in \
   the same file path. For example, you cannot make the same delete request to the same file in \
   the same file path twice, or make a delete request and a move request to the same file as part \
   of the same commit.\n"]

type nonrec same_file_content_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The file was not added or updated because the content of the file is exactly the same as the \
   content of that file in the repository and branch that you specified.\n"]

type nonrec parent_list = object_id list [@@ocaml.doc ""]

type nonrec additional_data = string [@@ocaml.doc ""]

type nonrec commit = {
  additional_data : additional_data option;
      [@ocaml.doc "Any other data associated with the specified commit.\n"]
  committer : user_info option;
      [@ocaml.doc
        "Information about the person who committed the specified commit, also known as the \
         committer. Information includes the date in timestamp format with GMT offset, the name of \
         the committer, and the email address for the committer, as configured in Git.\n\n\
        \ For more information about the difference between an author and a committer in Git, see \
         {{:http://git-scm.com/book/ch2-3.html}Viewing the Commit History} in Pro Git by Scott \
         Chacon and Ben Straub.\n\
        \ "]
  author : user_info option;
      [@ocaml.doc
        "Information about the author of the specified commit. Information includes the date in \
         timestamp format with GMT offset, the name of the author, and the email address for the \
         author, as configured in Git.\n"]
  message : message option;
      [@ocaml.doc "The commit message associated with the specified commit.\n"]
  parents : parent_list option;
      [@ocaml.doc
        "A list of parent commits for the specified commit. Each parent commit ID is the full \
         commit ID.\n"]
  tree_id : object_id option; [@ocaml.doc "Tree information for the specified commit.\n"]
  commit_id : object_id option; [@ocaml.doc "The full SHA ID of the specified commit. \n"]
}
[@@ocaml.doc "Returns information about a specific commit.\n"]

type nonrec revision_children = revision_id list [@@ocaml.doc ""]

type nonrec file_version = {
  revision_children : revision_children option;
      [@ocaml.doc
        "An array of commit IDs that contain more recent versions of this file. If there are no \
         additional versions of the file, this array will be empty.\n"]
  path : path option;
      [@ocaml.doc
        "The name and path of the file at which this blob is indexed which contains the data for \
         this version of the file. This value will vary between file versions if a file is renamed \
         or if its path changes.\n"]
  blob_id : object_id option;
      [@ocaml.doc
        "The blob ID of the object that represents the content of the file in this version.\n"]
  commit : commit option; [@ocaml.doc ""]
}
[@@ocaml.doc "Information about a version of a file.\n"]

type nonrec revision_dag = file_version list [@@ocaml.doc ""]

type nonrec restricted_source_file_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because one of the changes specifies copying or moving a .gitkeep \
   file.\n"]

type nonrec repository_triggers_configuration_id = string [@@ocaml.doc ""]

type nonrec repository_not_found_list = repository_name list [@@ocaml.doc ""]

type nonrec repository_not_associated_with_pull_request_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The repository does not contain any pull requests with that pull request ID. Use GetPullRequest \
   to verify the correct repository name for the pull request ID.\n"]

type nonrec repository_names_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "At least one repository name object is required, but was not specified.\n"]

type nonrec repository_name_list = repository_name list [@@ocaml.doc ""]

type nonrec repository_name_id_pair = {
  repository_id : repository_id option; [@ocaml.doc "The ID associated with the repository.\n"]
  repository_name : repository_name option; [@ocaml.doc "The name associated with the repository.\n"]
}
[@@ocaml.doc "Information about a repository name and ID.\n"]

type nonrec repository_name_id_pair_list = repository_name_id_pair list [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec clone_url_http = string [@@ocaml.doc ""]

type nonrec clone_url_ssh = string [@@ocaml.doc ""]

type nonrec repository_metadata = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the Key Management Service encryption key used to encrypt and decrypt the \
         repository.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the repository.\n"]
  clone_url_ssh : clone_url_ssh option;
      [@ocaml.doc "The URL to use for cloning the repository over SSH.\n"]
  clone_url_http : clone_url_http option;
      [@ocaml.doc "The URL to use for cloning the repository over HTTPS.\n"]
  creation_date : creation_date option;
      [@ocaml.doc "The date and time the repository was created, in timestamp format.\n"]
  last_modified_date : last_modified_date option;
      [@ocaml.doc "The date and time the repository was last modified, in timestamp format.\n"]
  default_branch : branch_name option; [@ocaml.doc "The repository's default branch name.\n"]
  repository_description : repository_description option;
      [@ocaml.doc "A comment or description about the repository.\n"]
  repository_name : repository_name option; [@ocaml.doc "The repository's name.\n"]
  repository_id : repository_id option; [@ocaml.doc "The ID of the repository.\n"]
  account_id : account_id option;
      [@ocaml.doc "The ID of the Amazon Web Services account associated with the repository.\n"]
}
[@@ocaml.doc "Information about a repository.\n"]

type nonrec repository_metadata_list = repository_metadata list [@@ocaml.doc ""]

type nonrec repository_limit_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A repository resource limit was exceeded.\n"]

type nonrec replacement_type_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A replacement type is required.\n"]

type nonrec replacement_type_enum =
  | USE_NEW_CONTENT [@ocaml.doc ""]
  | KEEP_DESTINATION [@ocaml.doc ""]
  | KEEP_SOURCE [@ocaml.doc ""]
  | KEEP_BASE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replacement_content_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "USE_NEW_CONTENT was specified, but no replacement content has been provided.\n"]

type nonrec file_content = bytes [@@ocaml.doc ""]

type nonrec replace_content_entry = {
  file_mode : file_mode_type_enum option;
      [@ocaml.doc "The file mode to apply during conflict resoltion.\n"]
  content : file_content option;
      [@ocaml.doc
        "The base-64 encoded content to use when the replacement type is USE_NEW_CONTENT.\n"]
  replacement_type : replacement_type_enum;
      [@ocaml.doc "The replacement type to use when determining how to resolve the conflict.\n"]
  file_path : path; [@ocaml.doc "The path of the conflicting file.\n"]
}
[@@ocaml.doc
  "Information about a replacement content entry in the conflict of a merge or pull request \
   operation.\n"]

type nonrec replace_content_entries = replace_content_entry list [@@ocaml.doc ""]

type nonrec relative_file_version_enum = AFTER [@ocaml.doc ""] | BEFORE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reference_type_not_supported_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified reference is not a supported type. \n"]

type nonrec reference_name_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A reference name is required, but none was provided.\n"]

type nonrec reference_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified reference does not exist. You must provide a full commit ID.\n"]

type nonrec reaction_emoji = string [@@ocaml.doc ""]

type nonrec reaction_short_code = string [@@ocaml.doc ""]

type nonrec reaction_unicode = string [@@ocaml.doc ""]

type nonrec reaction_value_formats = {
  unicode : reaction_unicode option; [@ocaml.doc "The Unicode codepoint for the reaction.\n"]
  short_code : reaction_short_code option;
      [@ocaml.doc
        "The emoji short code for the reaction. Short codes are interpreted slightly differently \
         on different operating systems. \n"]
  emoji : reaction_emoji option;
      [@ocaml.doc
        "The Emoji Version 1.0 graphic of the reaction. These graphics are interpreted slightly \
         differently on different operating systems.\n"]
}
[@@ocaml.doc
  "Information about the values for reactions to a comment. CodeCommit supports a limited set of \
   reactions.\n"]

type nonrec reaction_users_list = arn list [@@ocaml.doc ""]

type nonrec reaction_for_comment = {
  reactions_from_deleted_users_count : count option;
      [@ocaml.doc
        "A numerical count of users who reacted with the specified emoji whose identities have \
         been subsequently deleted from IAM. While these IAM users or roles no longer exist, the \
         reactions might still appear in total reaction counts.\n"]
  reaction_users : reaction_users_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of users who have provided reactions to the comment.\n"]
  reaction : reaction_value_formats option; [@ocaml.doc "The reaction for a specified comment.\n"]
}
[@@ocaml.doc "Information about the reaction values provided by users on a comment.\n"]

type nonrec reactions_for_comment_list = reaction_for_comment list [@@ocaml.doc ""]

type nonrec reaction_value_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A reaction value is required. \n"]

type nonrec reaction_limit_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The number of reactions has been exceeded. Reactions are limited to one reaction per user for \
   each individual comment ID.\n"]

type nonrec put_repository_triggers_output = {
  configuration_id : repository_triggers_configuration_id option;
      [@ocaml.doc "The system-generated unique ID for the create or update operation.\n"]
}
[@@ocaml.doc "Represents the output of a put repository triggers operation.\n"]

type nonrec put_repository_triggers_input = {
  triggers : repository_triggers_list;
      [@ocaml.doc "The JSON block of configuration information for each trigger.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where you want to create or update the trigger.\n"]
}
[@@ocaml.doc "Represents the input of a put repository triggers operation.\n"]

type nonrec put_file_output = {
  tree_id : object_id;
      [@ocaml.doc
        "The full SHA-1 pointer of the tree information for the commit that contains this file \
         change.\n"]
  blob_id : object_id; [@ocaml.doc "The ID of the blob, which is its SHA-1 pointer.\n"]
  commit_id : object_id;
      [@ocaml.doc "The full SHA ID of the commit that contains this file change.\n"]
}
[@@ocaml.doc ""]

type nonrec put_file_input = {
  email : email option;
      [@ocaml.doc "An email address for the person adding or updating the file.\n"]
  name : name option;
      [@ocaml.doc
        "The name of the person adding or updating the file. Although it is optional, a name makes \
         the commit history for your repository more useful.\n"]
  commit_message : message option;
      [@ocaml.doc
        "A message about why this file was added or updated. Although it is optional, a message \
         makes the commit history for your repository more useful.\n"]
  parent_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the head commit in the branch where you want to add or update the \
         file. If this is an empty repository, no commit ID is required. If this is not an empty \
         repository, a commit ID is required. \n\n\
        \ The commit ID must match the ID of the head commit at the time of the operation. \
         Otherwise, an error occurs, and the file is not added or updated.\n\
        \ "]
  file_mode : file_mode_type_enum option;
      [@ocaml.doc
        "The file mode permissions of the blob. Valid file mode permissions are listed here.\n"]
  file_path : path;
      [@ocaml.doc
        "The name of the file you want to add or update, including the relative path to the file \
         in the repository.\n\n\
        \  If the path does not currently exist in the repository, the path is created as part of \
         adding the file.\n\
        \  \n\
        \   "]
  file_content : file_content; [@ocaml.doc "The content of the file, in binary object format. \n"]
  branch_name : branch_name;
      [@ocaml.doc
        "The name of the branch where you want to add or update the file. If this is an empty \
         repository, this branch is created.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where you want to add or update the file.\n"]
}
[@@ocaml.doc ""]

type nonrec put_file_entry_conflict_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because one or more files specified in the commit reference both a \
   file and a folder.\n"]

type nonrec put_file_entry = {
  source_file : source_file_specifier option;
      [@ocaml.doc
        "The name and full path of the file that contains the changes you want to make as part of \
         the commit, if you are not providing the file content directly.\n"]
  file_content : file_content option;
      [@ocaml.doc "The content of the file, if a source file is not specified.\n"]
  file_mode : file_mode_type_enum option;
      [@ocaml.doc
        "The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and \
         NORMAL.\n"]
  file_path : path;
      [@ocaml.doc "The full path to the file in the repository, including the name of the file.\n"]
}
[@@ocaml.doc "Information about a file added or updated as part of a commit.\n"]

type nonrec put_file_entries = put_file_entry list [@@ocaml.doc ""]

type nonrec path_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The folderPath for a location cannot be null.\n"]

type nonrec parent_commit_id_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A parent commit ID is required. To view the full commit ID of a branch in a repository, use \
   [GetBranch] or a Git command (for example, git pull or git log).\n"]

type nonrec parent_commit_id_outdated_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The file could not be added because the provided parent commit ID is not the current tip of the \
   specified branch. To view the full commit ID of the current head of the branch, use [GetBranch].\n"]

type nonrec parent_commit_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The parent commit ID is not valid because it does not exist. The specified parent commit ID \
   does not exist in the specified branch of the repository.\n"]

type nonrec name_length_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The user name is not valid because it has exceeded the character limit for author names. \n"]

type nonrec invalid_path_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified path is not valid.\n"]

type nonrec invalid_parent_commit_id_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The parent commit ID is not valid. The commit ID cannot be empty, and must match the head \
   commit ID for the branch of the repository where you want to add or update a file.\n"]

type nonrec invalid_file_mode_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified file mode permission is not valid. For a list of valid file mode permissions, see \
   [PutFile]. \n"]

type nonrec invalid_email_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified email address either contains one or more characters that are not allowed, or it \
   exceeds the maximum number of characters allowed for an email address.\n"]

type nonrec invalid_deletion_parameter_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified deletion parameter is not valid.\n"]

type nonrec folder_content_size_limit_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because at least one of the overall changes in the commit results \
   in a folder whose contents exceed the limit of 6 MB. Either reduce the number and size of your \
   changes, or split the changes across multiple folders.\n"]

type nonrec file_path_conflicts_with_submodule_path_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because a specified file path points to a submodule. Verify that \
   the destination files have valid file paths that do not point to a submodule.\n"]

type nonrec file_name_conflicts_with_directory_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A file cannot be added to the repository because the specified file name has the same name as a \
   directory in this repository. Either provide another name for the file, or add the file in a \
   directory that does not match the file name.\n"]

type nonrec file_content_size_limit_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The file cannot be added because it is too large. The maximum file size is 6 MB, and the \
   combined file content change size is 7 MB. Consider making these changes using a Git client.\n"]

type nonrec file_content_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The file cannot be added because it is empty. Empty files cannot be added to the repository \
   with this API.\n"]

type nonrec directory_name_conflicts_with_file_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A file cannot be added to the repository because the specified path name has the same name as a \
   file that already exists in this repository. Either provide a different name for the file, or \
   specify a different path for the file.\n"]

type nonrec commit_message_length_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The commit message is too long. Provide a shorter string. \n"]

type nonrec branch_name_is_tag_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified branch name is not valid because it is a tag name. Enter the name of a branch in \
   the repository. For a list of valid branch names, use [ListBranches].\n"]

type nonrec put_comment_reaction_input = {
  reaction_value : reaction_value;
      [@ocaml.doc
        "The emoji reaction you want to add or update. To remove a reaction, provide a value of \
         blank or null. You can also provide the value of none. For information about emoji \
         reaction values supported in CodeCommit, see the \
         {{:https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-commit-comment.html#emoji-reaction-table}CodeCommit \
         User Guide}.\n"]
  comment_id : comment_id;
      [@ocaml.doc "The ID of the comment to which you want to add or update a reaction.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_reaction_value_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The value of the reaction is not valid. For more information, see the \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html}CodeCommit User Guide}.\n"]

type nonrec pull_request_status_changed_event_metadata = {
  pull_request_status : pull_request_status_enum option;
      [@ocaml.doc "The changed status of the pull request.\n"]
}
[@@ocaml.doc "Information about a change to the status of a pull request.\n"]

type nonrec pull_request_source_reference_updated_event_metadata = {
  merge_base : commit_id option;
      [@ocaml.doc
        "The commit ID of the most recent commit that the source branch and the destination branch \
         have in common.\n"]
  after_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit in the source branch that was the tip of the branch at \
         the time the pull request was updated.\n"]
  before_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit in the destination branch that was the tip of the branch \
         at the time the pull request was updated.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository where the pull request was updated.\n"]
}
[@@ocaml.doc "Information about an update to the source branch of a pull request.\n"]

type nonrec pull_request_merged_state_changed_event_metadata = {
  merge_metadata : merge_metadata option;
      [@ocaml.doc "Information about the merge state change event.\n"]
  destination_reference : reference_name option;
      [@ocaml.doc "The name of the branch that the pull request is merged into.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository where the pull request was created.\n"]
}
[@@ocaml.doc "Returns information about the change in the merge state for a pull request event. \n"]

type nonrec pull_request_id_list = pull_request_id list [@@ocaml.doc ""]

type nonrec pull_request_event_type =
  | PULL_REQUEST_APPROVAL_STATE_CHANGED [@ocaml.doc ""]
  | PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN [@ocaml.doc ""]
  | PULL_REQUEST_APPROVAL_RULE_DELETED [@ocaml.doc ""]
  | PULL_REQUEST_APPROVAL_RULE_UPDATED [@ocaml.doc ""]
  | PULL_REQUEST_APPROVAL_RULE_CREATED [@ocaml.doc ""]
  | PULL_REQUEST_MERGE_STATE_CHANGED [@ocaml.doc ""]
  | PULL_REQUEST_SOURCE_REFERENCE_UPDATED [@ocaml.doc ""]
  | PULL_REQUEST_STATUS_CHANGED [@ocaml.doc ""]
  | PULL_REQUEST_CREATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec pull_request_created_event_metadata = {
  merge_base : commit_id option;
      [@ocaml.doc
        "The commit ID of the most recent commit that the source branch and the destination branch \
         have in common.\n"]
  destination_commit_id : commit_id option;
      [@ocaml.doc
        "The commit ID of the tip of the branch specified as the destination branch when the pull \
         request was created.\n"]
  source_commit_id : commit_id option;
      [@ocaml.doc "The commit ID on the source branch used when the pull request was created.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository where the pull request was created.\n"]
}
[@@ocaml.doc
  "Metadata about the pull request that is used when comparing the pull request source with its \
   destination.\n"]

type nonrec approval_rule_event_metadata = {
  approval_rule_content : approval_rule_content option;
      [@ocaml.doc "The content of the approval rule.\n"]
  approval_rule_id : approval_rule_id option;
      [@ocaml.doc "The system-generated ID of the approval rule.\n"]
  approval_rule_name : approval_rule_name option; [@ocaml.doc "The name of the approval rule.\n"]
}
[@@ocaml.doc "Returns information about an event for an approval rule.\n"]

type nonrec approval_state_changed_event_metadata = {
  approval_status : approval_state option;
      [@ocaml.doc "The approval status for the pull request.\n"]
  revision_id : revision_id option;
      [@ocaml.doc "The revision ID of the pull request when the approval state changed.\n"]
}
[@@ocaml.doc "Returns information about a change in the approval state for a pull request.\n"]

type nonrec override_status = REVOKE [@ocaml.doc ""] | OVERRIDE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec approval_rule_overridden_event_metadata = {
  override_status : override_status option; [@ocaml.doc "The status of the override event.\n"]
  revision_id : revision_id option;
      [@ocaml.doc "The revision ID of the pull request when the override event occurred.\n"]
}
[@@ocaml.doc "Returns information about an override event for approval rules for a pull request.\n"]

type nonrec pull_request_event = {
  approval_rule_overridden_event_metadata : approval_rule_overridden_event_metadata option;
      [@ocaml.doc "Information about an approval rule override event for a pull request.\n"]
  approval_state_changed_event_metadata : approval_state_changed_event_metadata option;
      [@ocaml.doc "Information about an approval state change for a pull request.\n"]
  approval_rule_event_metadata : approval_rule_event_metadata option;
      [@ocaml.doc "Information about a pull request event.\n"]
  pull_request_merged_state_changed_event_metadata :
    pull_request_merged_state_changed_event_metadata option;
      [@ocaml.doc "Information about the change in mergability state for the pull request event.\n"]
  pull_request_source_reference_updated_event_metadata :
    pull_request_source_reference_updated_event_metadata option;
      [@ocaml.doc "Information about the updated source branch for the pull request event. \n"]
  pull_request_status_changed_event_metadata : pull_request_status_changed_event_metadata option;
      [@ocaml.doc "Information about the change in status for the pull request event.\n"]
  pull_request_created_event_metadata : pull_request_created_event_metadata option;
      [@ocaml.doc "Information about the source and destination branches for the pull request.\n"]
  actor_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the user whose actions resulted in the event. Examples \
         include updating the pull request with more commits or changing the status of a pull \
         request.\n"]
  pull_request_event_type : pull_request_event_type option;
      [@ocaml.doc
        "The type of the pull request event (for example, a status change event \
         (PULL_REQUEST_STATUS_CHANGED) or update event (PULL_REQUEST_SOURCE_REFERENCE_UPDATED)).\n"]
  event_date : event_date option;
      [@ocaml.doc "The day and time of the pull request event, in timestamp format.\n"]
  pull_request_id : pull_request_id option;
      [@ocaml.doc "The system-generated ID of the pull request.\n"]
}
[@@ocaml.doc "Returns information about a pull request event.\n"]

type nonrec pull_request_event_list = pull_request_event list [@@ocaml.doc ""]

type nonrec pull_request_approval_rules_not_satisfied_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The pull request cannot be merged because one or more approval rules applied to the pull \
   request have conditions that have not been met.\n"]

type nonrec post_comment_reply_output = {
  comment : comment option; [@ocaml.doc "Information about the reply to a comment.\n"]
}
[@@ocaml.doc ""]

type nonrec post_comment_reply_input = {
  content : content; [@ocaml.doc "The contents of your reply to a comment.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique, client-generated idempotency token that, when provided in a request, ensures \
         the request cannot be repeated with a changed parameter. If a request is received with \
         the same parameters and a token is included, the request returns information about the \
         initial request that used that token.\n"]
  in_reply_to : comment_id;
      [@ocaml.doc
        "The system-generated ID of the comment to which you want to reply. To get this ID, use \
         [GetCommentsForComparedCommit] or [GetCommentsForPullRequest].\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_client_request_token_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The client request token is not valid.\n"]

type nonrec idempotency_parameter_mismatch_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The client request token is not valid. Either the token is not in a valid format, or the token \
   has been used in a previous request and cannot be reused.\n"]

type nonrec client_request_token_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A client request token is required. A client request token is an unique, client-generated \
   idempotency token that, when provided in a request, ensures the request cannot be repeated with \
   a changed parameter. If a request is received with the same parameters and a token is included, \
   the request returns information about the initial request that used that token.\n"]

type nonrec position = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec location = {
  relative_file_version : relative_file_version_enum option;
      [@ocaml.doc
        "In a comparison of commits or a pull request, whether the change is in the before or \
         after of that comparison.\n"]
  file_position : position option;
      [@ocaml.doc "The position of a change in a compared file, in line number format.\n"]
  file_path : path option;
      [@ocaml.doc
        "The name of the file being compared, including its extension and subdirectory, if any.\n"]
}
[@@ocaml.doc
  "Returns information about the location of a change or comment in the comparison between two \
   commits or a pull request.\n"]

type nonrec post_comment_for_pull_request_output = {
  comment : comment option; [@ocaml.doc "The content of the comment you posted.\n"]
  location : location option;
      [@ocaml.doc "The location of the change where you posted your comment.\n"]
  after_blob_id : object_id option;
      [@ocaml.doc "In the directionality of the pull request, the blob ID of the after blob.\n"]
  before_blob_id : object_id option;
      [@ocaml.doc "In the directionality of the pull request, the blob ID of the before blob.\n"]
  after_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit in the destination branch where the pull request is \
         merged.\n"]
  before_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit in the source branch used to create the pull request, or \
         in the case of an updated pull request, the full commit ID of the commit used to update \
         the pull request.\n"]
  pull_request_id : pull_request_id option;
      [@ocaml.doc "The system-generated ID of the pull request. \n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository where you posted a comment on a pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec post_comment_for_pull_request_input = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique, client-generated idempotency token that, when provided in a request, ensures \
         the request cannot be repeated with a changed parameter. If a request is received with \
         the same parameters and a token is included, the request returns information about the \
         initial request that used that token.\n"]
  content : content; [@ocaml.doc "The content of your comment on the change.\n"]
  location : location option;
      [@ocaml.doc
        "The location of the change where you want to post your comment. If no location is \
         provided, the comment is posted as a general comment on the pull request difference \
         between the before commit ID and the after commit ID.\n"]
  after_commit_id : commit_id;
      [@ocaml.doc
        "The full commit ID of the commit in the source branch that is the current tip of the \
         branch for the pull request when you post the comment.\n"]
  before_commit_id : commit_id;
      [@ocaml.doc
        "The full commit ID of the commit in the destination branch that was the tip of the branch \
         at the time the pull request was created.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository where you want to post a comment on a pull request.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec path_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified path does not exist.\n"]

type nonrec invalid_relative_file_version_enum_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "Either the enum is not in a valid format, or the specified file version enum is not valid in \
   respect to the current file version.\n"]

type nonrec invalid_file_position_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The position is not valid. Make sure that the line number exists in the version of the file you \
   want to comment on.\n"]

type nonrec invalid_file_location_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The location of the file is not valid. Make sure that you include the file name and extension.\n"]

type nonrec invalid_commit_id_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified commit ID is not valid.\n"]

type nonrec commit_id_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A commit ID was not specified.\n"]

type nonrec commit_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified commit does not exist or no commit was specified, and the specified repository \
   has no default branch.\n"]

type nonrec before_commit_id_and_after_commit_id_are_same_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The before commit ID and the after commit ID are the same, which is not valid. The before \
   commit ID and the after commit ID must be different commit IDs.\n"]

type nonrec post_comment_for_compared_commit_output = {
  comment : comment option; [@ocaml.doc "The content of the comment you posted.\n"]
  location : location option;
      [@ocaml.doc "The location of the comment in the comparison between the two commits.\n"]
  after_blob_id : object_id option;
      [@ocaml.doc "In the directionality you established, the blob ID of the after blob.\n"]
  before_blob_id : object_id option;
      [@ocaml.doc "In the directionality you established, the blob ID of the before blob.\n"]
  after_commit_id : commit_id option;
      [@ocaml.doc
        "In the directionality you established, the full commit ID of the after commit.\n"]
  before_commit_id : commit_id option;
      [@ocaml.doc
        "In the directionality you established, the full commit ID of the before commit.\n"]
  repository_name : repository_name option;
      [@ocaml.doc
        "The name of the repository where you posted a comment on the comparison between commits.\n"]
}
[@@ocaml.doc ""]

type nonrec post_comment_for_compared_commit_input = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique, client-generated idempotency token that, when provided in a request, ensures \
         the request cannot be repeated with a changed parameter. If a request is received with \
         the same parameters and a token is included, the request returns information about the \
         initial request that used that token.\n"]
  content : content; [@ocaml.doc "The content of the comment you want to make.\n"]
  location : location option;
      [@ocaml.doc "The location of the comparison where you want to comment.\n"]
  after_commit_id : commit_id;
      [@ocaml.doc
        "To establish the directionality of the comparison, the full commit ID of the after commit.\n"]
  before_commit_id : commit_id option;
      [@ocaml.doc
        "To establish the directionality of the comparison, the full commit ID of the before \
         commit. Required for commenting on any commit unless that commit is the initial commit.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository where you want to post a comment on the comparison between \
         commits.\n"]
}
[@@ocaml.doc ""]

type nonrec override_status_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "An override status is required, but no value was provided. Valid values include OVERRIDE and \
   REVOKE.\n"]

type nonrec override_pull_request_approval_rules_input = {
  override_status : override_status;
      [@ocaml.doc
        "Whether you want to set aside approval rule requirements for the pull request (OVERRIDE) \
         or revoke a previous override and apply approval rule requirements (REVOKE). REVOKE \
         status is not stored.\n"]
  revision_id : revision_id;
      [@ocaml.doc
        "The system-generated ID of the most recent revision of the pull request. You cannot \
         override approval rules for anything but the most recent revision of a pull request. To \
         get the revision ID, use GetPullRequest.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request for which you want to override all approval \
         rule requirements. To get this information, use [GetPullRequest].\n"]
}
[@@ocaml.doc ""]

type nonrec override_already_set_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The pull request has already had its approval rules set to override.\n"]

type nonrec invalid_override_status_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The override status is not valid. Valid statuses are OVERRIDE and REVOKE.\n"]

type nonrec overridden = bool [@@ocaml.doc ""]

type nonrec order_enum = DESCENDING [@ocaml.doc ""] | ASCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec operation_not_allowed_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The requested action is not allowed.\n"]

type nonrec object_type_enum =
  | SYMBOLIC_LINK [@ocaml.doc ""]
  | GIT_LINK [@ocaml.doc ""]
  | DIRECTORY [@ocaml.doc ""]
  | FILE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_types = {
  base : object_type_enum option;
      [@ocaml.doc "The type of the object in the base commit of the merge.\n"]
  destination : object_type_enum option;
      [@ocaml.doc "The type of the object in the destination branch.\n"]
  source : object_type_enum option; [@ocaml.doc "The type of the object in the source branch.\n"]
}
[@@ocaml.doc "Information about the type of an object in a merge operation.\n"]

type nonrec object_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec number_of_rules_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The approval rule cannot be added. The pull request has the maximum number of approval rules \
   associated with it.\n"]

type nonrec number_of_rule_templates_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The maximum number of approval rule templates has been exceeded for this Amazon Web Services \
   Region. \n"]

type nonrec number_of_conflicts = int [@@ocaml.doc ""]

type nonrec no_change_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because no changes will be made to the repository as a result of \
   this commit. A commit must contain at least one change.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec multiple_repositories_in_pull_request_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "You cannot include more than one repository in a pull request. Make sure you have specified \
   only one repository name in your request, and then try again.\n"]

type nonrec multiple_conflict_resolution_entries_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "More than one conflict resolution entries exists for the conflict. A conflict can have only one \
   conflict resolution entry.\n"]

type nonrec mode = string [@@ocaml.doc ""]

type nonrec merge_pull_request_by_three_way_output = {
  pull_request : pull_request option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec conflict_detail_level_type_enum =
  | LINE_LEVEL [@ocaml.doc ""]
  | FILE_LEVEL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec conflict_resolution_strategy_type_enum =
  | AUTOMERGE [@ocaml.doc ""]
  | ACCEPT_DESTINATION [@ocaml.doc ""]
  | ACCEPT_SOURCE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec keep_empty_folders = bool [@@ocaml.doc ""]

type nonrec delete_file_entry = {
  file_path : path;
      [@ocaml.doc "The full path of the file to be deleted, including the name of the file.\n"]
}
[@@ocaml.doc "A file that is deleted as part of a commit.\n"]

type nonrec delete_file_entries = delete_file_entry list [@@ocaml.doc ""]

type nonrec conflict_resolution = {
  set_file_modes : set_file_mode_entries option;
      [@ocaml.doc "File modes that are set as part of the merge conflict resolution.\n"]
  delete_files : delete_file_entries option;
      [@ocaml.doc "Files to be deleted as part of the merge conflict resolution.\n"]
  replace_contents : replace_content_entries option;
      [@ocaml.doc "Files to have content replaced as part of the merge conflict resolution.\n"]
}
[@@ocaml.doc
  "If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving \
   conflicts during a merge.\n"]

type nonrec merge_pull_request_by_three_way_input = {
  conflict_resolution : conflict_resolution option;
      [@ocaml.doc
        "If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving \
         conflicts during a merge.\n"]
  keep_empty_folders : keep_empty_folders option;
      [@ocaml.doc
        "If the commit contains deletions, whether to keep a folder or folder structure if the \
         changes leave the folders empty. If true, a .gitkeep file is created for empty folders. \
         The default is false.\n"]
  email : email option;
      [@ocaml.doc
        "The email address of the person merging the branches. This information is used in the \
         commit information for the merge.\n"]
  author_name : name option;
      [@ocaml.doc
        "The name of the author who created the commit. This information is used as both the \
         author and committer for the commit.\n"]
  commit_message : message option;
      [@ocaml.doc "The commit message to include in the commit information for the merge.\n"]
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  source_commit_id : object_id option;
      [@ocaml.doc
        "The full commit ID of the original or updated commit in the pull request source branch. \
         Pass this value if you want an exception thrown if the current commit ID of the tip of \
         the source branch does not match this commit ID.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where the pull request was created.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec maximum_items_to_compare_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The number of items to compare between the source or destination branches and the merge base \
   has exceeded the maximum allowed.\n"]

type nonrec maximum_file_content_to_load_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The number of files to load exceeds the allowed limit.\n"]

type nonrec maximum_conflict_resolution_entries_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The number of allowed conflict resolution entries was exceeded.\n"]

type nonrec manual_merge_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The pull request cannot be merged automatically into the destination branch. You must manually \
   merge the branches and resolve any conflicts.\n"]

type nonrec invalid_replacement_type_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "Automerge was specified for resolving the conflict, but the specified replacement type is not \
   valid.\n"]

type nonrec invalid_replacement_content_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "Automerge was specified for resolving the conflict, but the replacement type is not valid or \
   content is missing. \n"]

type nonrec invalid_conflict_resolution_strategy_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified conflict resolution strategy is not valid.\n"]

type nonrec invalid_conflict_resolution_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified conflict resolution list is not valid.\n"]

type nonrec invalid_conflict_detail_level_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified conflict detail level is not valid.\n"]

type nonrec concurrent_reference_update_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The merge cannot be completed because the target branch has been modified. Another user might \
   have modified the target branch while the merge was in progress. Wait a few minutes, and then \
   try again.\n"]

type nonrec merge_pull_request_by_squash_output = {
  pull_request : pull_request option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec merge_pull_request_by_squash_input = {
  conflict_resolution : conflict_resolution option;
      [@ocaml.doc
        "If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving \
         conflicts during a merge.\n"]
  keep_empty_folders : keep_empty_folders option;
      [@ocaml.doc
        "If the commit contains deletions, whether to keep a folder or folder structure if the \
         changes leave the folders empty. If true, a .gitkeep file is created for empty folders. \
         The default is false.\n"]
  email : email option;
      [@ocaml.doc
        "The email address of the person merging the branches. This information is used in the \
         commit information for the merge.\n"]
  author_name : name option;
      [@ocaml.doc
        "The name of the author who created the commit. This information is used as both the \
         author and committer for the commit.\n"]
  commit_message : message option;
      [@ocaml.doc "The commit message to include in the commit information for the merge.\n"]
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  source_commit_id : object_id option;
      [@ocaml.doc
        "The full commit ID of the original or updated commit in the pull request source branch. \
         Pass this value if you want an exception thrown if the current commit ID of the tip of \
         the source branch does not match this commit ID.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where the pull request was created.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec merge_pull_request_by_fast_forward_output = {
  pull_request : pull_request option;
      [@ocaml.doc "Information about the specified pull request, including the merge.\n"]
}
[@@ocaml.doc ""]

type nonrec merge_pull_request_by_fast_forward_input = {
  source_commit_id : object_id option;
      [@ocaml.doc
        "The full commit ID of the original or updated commit in the pull request source branch. \
         Pass this value if you want an exception thrown if the current commit ID of the tip of \
         the source branch does not match this commit ID.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where the pull request was created.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec merge_options = merge_option_type_enum list [@@ocaml.doc ""]

type nonrec merge_option_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A merge option or stategy is required, and none was provided.\n"]

type nonrec change_type_enum =
  | DELETED [@ocaml.doc ""]
  | MODIFIED [@ocaml.doc ""]
  | ADDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec merge_operations = {
  destination : change_type_enum option;
      [@ocaml.doc "The operation on a file in the destination of a merge or pull request.\n"]
  source : change_type_enum option;
      [@ocaml.doc
        "The operation (add, modify, or delete) on a file in the source of a merge or pull request.\n"]
}
[@@ocaml.doc "Information about the file operation conflicts in a merge operation.\n"]

type nonrec is_hunk_conflict = bool [@@ocaml.doc ""]

type nonrec line_number = int [@@ocaml.doc ""]

type nonrec hunk_content = string [@@ocaml.doc ""]

type nonrec merge_hunk_detail = {
  hunk_content : hunk_content option;
      [@ocaml.doc
        "The base-64 encoded content of the hunk merged region that might contain a conflict.\n"]
  end_line : line_number option; [@ocaml.doc "The end position of the hunk in the merge result.\n"]
  start_line : line_number option;
      [@ocaml.doc "The start position of the hunk in the merge result.\n"]
}
[@@ocaml.doc
  "Information about the details of a merge hunk that contains a conflict in a merge or pull \
   request operation.\n"]

type nonrec merge_hunk = {
  base : merge_hunk_detail option;
      [@ocaml.doc "Information about the merge hunk in the base of a merge or pull request.\n"]
  destination : merge_hunk_detail option;
      [@ocaml.doc
        "Information about the merge hunk in the destination of a merge or pull request.\n"]
  source : merge_hunk_detail option;
      [@ocaml.doc "Information about the merge hunk in the source of a merge or pull request.\n"]
  is_conflict : is_hunk_conflict option;
      [@ocaml.doc
        "A Boolean value indicating whether a combination of hunks contains a conflict. Conflicts \
         occur when the same file or the same lines in a file were modified in both the source and \
         destination of a merge or pull request. Valid values include true, false, and null. True \
         when the hunk represents a conflict and one or more files contains a line conflict. File \
         mode conflicts in a merge do not set this to true.\n"]
}
[@@ocaml.doc "Information about merge hunks in a merge or pull request operation.\n"]

type nonrec merge_hunks = merge_hunk list [@@ocaml.doc ""]

type nonrec merge_branches_by_three_way_output = {
  tree_id : object_id option;
      [@ocaml.doc "The tree ID of the merge in the destination or target branch.\n"]
  commit_id : object_id option;
      [@ocaml.doc "The commit ID of the merge in the destination or target branch.\n"]
}
[@@ocaml.doc ""]

type nonrec commit_name = string [@@ocaml.doc ""]

type nonrec merge_branches_by_three_way_input = {
  conflict_resolution : conflict_resolution option;
      [@ocaml.doc
        "If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving \
         conflicts during a merge.\n"]
  keep_empty_folders : keep_empty_folders option;
      [@ocaml.doc
        "If the commit contains deletions, whether to keep a folder or folder structure if the \
         changes leave the folders empty. If true, a .gitkeep file is created for empty folders. \
         The default is false.\n"]
  commit_message : message option;
      [@ocaml.doc "The commit message to include in the commit information for the merge.\n"]
  email : email option;
      [@ocaml.doc
        "The email address of the person merging the branches. This information is used in the \
         commit information for the merge.\n"]
  author_name : name option;
      [@ocaml.doc
        "The name of the author who created the commit. This information is used as both the \
         author and committer for the commit.\n"]
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  target_branch : branch_name option; [@ocaml.doc "The branch where the merge is applied. \n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where you want to merge two branches.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_target_branch_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified target branch is not valid.\n"]

type nonrec invalid_commit_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified commit is not valid.\n"]

type nonrec file_mode_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because no file mode has been specified. A file mode is required \
   to update mode permissions for a file.\n"]

type nonrec commit_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A commit was not specified.\n"]

type nonrec merge_branches_by_squash_output = {
  tree_id : object_id option;
      [@ocaml.doc "The tree ID of the merge in the destination or target branch.\n"]
  commit_id : object_id option;
      [@ocaml.doc "The commit ID of the merge in the destination or target branch.\n"]
}
[@@ocaml.doc ""]

type nonrec merge_branches_by_squash_input = {
  conflict_resolution : conflict_resolution option;
      [@ocaml.doc
        "If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving \
         conflicts during a merge.\n"]
  keep_empty_folders : keep_empty_folders option;
      [@ocaml.doc
        "If the commit contains deletions, whether to keep a folder or folder structure if the \
         changes leave the folders empty. If this is specified as true, a .gitkeep file is created \
         for empty folders. The default is false.\n"]
  commit_message : message option; [@ocaml.doc "The commit message for the merge.\n"]
  email : email option;
      [@ocaml.doc
        "The email address of the person merging the branches. This information is used in the \
         commit information for the merge.\n"]
  author_name : name option;
      [@ocaml.doc
        "The name of the author who created the commit. This information is used as both the \
         author and committer for the commit.\n"]
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  target_branch : branch_name option; [@ocaml.doc "The branch where the merge is applied. \n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where you want to merge two branches.\n"]
}
[@@ocaml.doc ""]

type nonrec merge_branches_by_fast_forward_output = {
  tree_id : object_id option;
      [@ocaml.doc "The tree ID of the merge in the destination or target branch.\n"]
  commit_id : object_id option;
      [@ocaml.doc "The commit ID of the merge in the destination or target branch.\n"]
}
[@@ocaml.doc ""]

type nonrec merge_branches_by_fast_forward_input = {
  target_branch : branch_name option; [@ocaml.doc "The branch where the merge is applied.\n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where you want to merge two branches.\n"]
}
[@@ocaml.doc ""]

type nonrec maximum_rule_templates_associated_with_repository_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The maximum number of approval rule templates for a repository has been exceeded. You cannot \
   associate more than 25 approval rule templates with a repository.\n"]

type nonrec maximum_repository_names_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The maximum number of allowed repository names was exceeded. Currently, this number is 100.\n"]

type nonrec maximum_open_pull_requests_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "You cannot create the pull request because the repository has too many open pull requests. The \
   maximum number of open pull requests for a repository is 1,000. Close one or more open pull \
   requests, and then try again.\n"]

type nonrec maximum_file_entries_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The number of specified files to change as part of this commit exceeds the maximum number of \
   files that can be changed in a single commit. Consider using a Git client for these changes.\n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that allows the operation to batch the next results of the operation.\n"]
  tags : tags_map option;
      [@ocaml.doc "A list of tag key and value pairs associated with the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which you want to get information \
         about tags, if any.\n"]
}
[@@ocaml.doc ""]

type nonrec list_repositories_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that allows the operation to batch the results of the operation. \
         Batch sizes are 1,000 for list repository operations. When the client sends the token \
         back to CodeCommit, another page of 1,000 records is retrieved.\n"]
  repositories : repository_name_id_pair_list option;
      [@ocaml.doc "Lists the repositories called by the list repositories operation.\n"]
}
[@@ocaml.doc "Represents the output of a list repositories operation.\n"]

type nonrec list_repositories_input = {
  order : order_enum option;
      [@ocaml.doc "The order in which to sort the results of a list repositories operation.\n"]
  sort_by : sort_by_enum option;
      [@ocaml.doc "The criteria used to sort the results of a list repositories operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that allows the operation to batch the results of the operation. \
         Batch sizes are 1,000 for list repository operations. When the client sends the token \
         back to CodeCommit, another page of 1,000 records is retrieved.\n"]
}
[@@ocaml.doc "Represents the input of a list repositories operation.\n"]

type nonrec list_repositories_for_approval_rule_template_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that allows the operation to batch the next results of the operation.\n"]
  repository_names : repository_name_list option;
      [@ocaml.doc
        "A list of repository names that are associated with the specified approval rule template.\n"]
}
[@@ocaml.doc ""]

type nonrec list_repositories_for_approval_rule_template_input = {
  max_results : max_results option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc
        "The name of the approval rule template for which you want to list repositories that are \
         associated with that template.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_max_results_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified number of maximum results is not valid.\n"]

type nonrec invalid_continuation_token_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified continuation token is not valid.\n"]

type nonrec invalid_sort_by_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified sort by value is not valid.\n"]

type nonrec invalid_order_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified sort order is not valid.\n"]

type nonrec list_pull_requests_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that allows the operation to batch the next results of the operation.\n"]
  pull_request_ids : pull_request_id_list;
      [@ocaml.doc "The system-generated IDs of the pull requests.\n"]
}
[@@ocaml.doc ""]

type nonrec list_pull_requests_input = {
  max_results : max_results option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  pull_request_status : pull_request_status_enum option;
      [@ocaml.doc
        "Optional. The status of the pull request. If used, this refines the results to the pull \
         requests that match the specified status.\n"]
  author_arn : arn option;
      [@ocaml.doc
        "Optional. The Amazon Resource Name (ARN) of the user who created the pull request. If \
         used, this filters the results to pull requests created by that user.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository for which you want to list pull requests.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_author_arn_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The Amazon Resource Name (ARN) is not valid. Make sure that you have provided the full ARN for \
   the author of the pull request, and then try again.\n"]

type nonrec author_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified Amazon Resource Name (ARN) does not exist in the Amazon Web Services account.\n"]

type nonrec list_file_commit_history_response = {
  next_token : next_token option;
      [@ocaml.doc "An enumeration token that can be used to return the next batch of results.\n"]
  revision_dag : revision_dag;
      [@ocaml.doc
        "An array of FileVersion objects that form a directed acyclic graph (DAG) of the changes \
         to the file made by the commits that changed the file.\n"]
}
[@@ocaml.doc ""]

type nonrec limit = int [@@ocaml.doc ""]

type nonrec list_file_commit_history_request = {
  next_token : next_token option;
      [@ocaml.doc "An enumeration token that allows the operation to batch the results.\n"]
  max_results : limit option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results.\n"]
  file_path : path;
      [@ocaml.doc
        "The full path of the file whose history you want to retrieve, including the name of the \
         file.\n"]
  commit_specifier : commit_name option;
      [@ocaml.doc
        "The fully quaified reference that identifies the commit that contains the file. For \
         example, you can specify a full commit ID, a tag, a branch name, or a reference such as \
         [refs/heads/main]. If none is provided, the head commit is used.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the file.\n"]
}
[@@ocaml.doc ""]

type nonrec list_branches_output = {
  next_token : next_token option;
      [@ocaml.doc "An enumeration token that returns the batch of the results.\n"]
  branches : branch_name_list option; [@ocaml.doc "The list of branch names.\n"]
}
[@@ocaml.doc "Represents the output of a list branches operation.\n"]

type nonrec list_branches_input = {
  next_token : next_token option;
      [@ocaml.doc "An enumeration token that allows the operation to batch the results.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the branches.\n"]
}
[@@ocaml.doc "Represents the input of a list branches operation.\n"]

type nonrec approval_rule_template_name_list = approval_rule_template_name list [@@ocaml.doc ""]

type nonrec list_associated_approval_rule_templates_for_repository_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that allows the operation to batch the next results of the operation.\n"]
  approval_rule_template_names : approval_rule_template_name_list option;
      [@ocaml.doc "The names of all approval rule templates associated with the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec list_associated_approval_rule_templates_for_repository_input = {
  max_results : max_results option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository for which you want to list all associated approval rule \
         templates.\n"]
}
[@@ocaml.doc ""]

type nonrec list_approval_rule_templates_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that allows the operation to batch the next results of the operation.\n"]
  approval_rule_template_names : approval_rule_template_name_list option;
      [@ocaml.doc
        "The names of all the approval rule templates found in the Amazon Web Services Region for \
         your Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec list_approval_rule_templates_input = {
  max_results : max_results option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
}
[@@ocaml.doc ""]

type nonrec is_object_type_conflict = bool [@@ocaml.doc ""]

type nonrec is_mergeable = bool [@@ocaml.doc ""]

type nonrec is_file_mode_conflict = bool [@@ocaml.doc ""]

type nonrec is_content_conflict = bool [@@ocaml.doc ""]

type nonrec capital_boolean = bool [@@ocaml.doc ""]

type nonrec is_binary_file = {
  base : capital_boolean option;
      [@ocaml.doc
        "The binary or non-binary status of a file in the base of a merge or pull request.\n"]
  destination : capital_boolean option;
      [@ocaml.doc
        "The binary or non-binary status of a file in the destination of a merge or pull request.\n"]
  source : capital_boolean option;
      [@ocaml.doc
        "The binary or non-binary status of file in the source of a merge or pull request.\n"]
}
[@@ocaml.doc
  "Information about whether a file is binary or textual in a merge or pull request operation.\n"]

type nonrec invalid_targets_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The targets for the pull request is not valid or not in a valid format. Targets are a list of \
   target objects. Each target object must contain the full values for the repository name, source \
   branch, and destination branch for a pull request.\n"]

type nonrec invalid_target_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The target for the pull request is not valid. A target must contain the full values for the \
   repository name, source branch, and destination branch for the pull request.\n"]

type nonrec invalid_source_commit_specifier_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The source commit specifier is not valid. You must provide a valid branch name, tag, or full \
   commit ID.\n"]

type nonrec invalid_reference_name_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified reference name format is not valid. Reference names must conform to the Git \
   references format (for example, refs/heads/main). For more information, see \
   {{:https://git-scm.com/book/en/v2/Git-Internals-Git-References}Git Internals - Git References} \
   or consult your Git documentation.\n"]

type nonrec invalid_reaction_user_arn_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The Amazon Resource Name (ARN) of the user or identity is not valid.\n"]

type nonrec invalid_pull_request_event_type_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The pull request event type is not valid. \n"]

type nonrec invalid_merge_option_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified merge option is not valid for this operation. Not all merge strategies are \
   supported for all operations.\n"]

type nonrec invalid_max_merge_hunks_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified value for the number of merge hunks to return is not valid.\n"]

type nonrec invalid_max_conflict_files_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified value for the number of conflict files to return is not valid.\n"]

type nonrec invalid_destination_commit_specifier_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The destination commit specifier is not valid. You must provide a valid branch name, tag, or \
   full commit ID. \n"]

type nonrec invalid_blob_id_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified blob is not valid.\n"]

type nonrec invalid_actor_arn_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The Amazon Resource Name (ARN) is not valid. Make sure that you have provided the full ARN for \
   the user who initiated the change for the pull request, and then try again.\n"]

type nonrec get_repository_triggers_output = {
  triggers : repository_triggers_list option;
      [@ocaml.doc "The JSON block of configuration information for each trigger.\n"]
  configuration_id : repository_triggers_configuration_id option;
      [@ocaml.doc "The system-generated unique ID for the trigger.\n"]
}
[@@ocaml.doc "Represents the output of a get repository triggers operation.\n"]

type nonrec get_repository_triggers_input = {
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository for which the trigger is configured.\n"]
}
[@@ocaml.doc "Represents the input of a get repository triggers operation.\n"]

type nonrec get_repository_output = {
  repository_metadata : repository_metadata option;
      [@ocaml.doc "Information about the repository.\n"]
}
[@@ocaml.doc "Represents the output of a get repository operation.\n"]

type nonrec get_repository_input = {
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to get information about.\n"]
}
[@@ocaml.doc "Represents the input of a get repository operation.\n"]

type nonrec get_pull_request_override_state_output = {
  overrider : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the user or identity that overrode the rules and their \
         requirements for the pull request.\n"]
  overridden : overridden option;
      [@ocaml.doc
        "A Boolean value that indicates whether a pull request has had its rules set aside (TRUE) \
         or whether all approval rules still apply (FALSE).\n"]
}
[@@ocaml.doc ""]

type nonrec get_pull_request_override_state_input = {
  revision_id : revision_id;
      [@ocaml.doc
        "The system-generated ID of the revision for the pull request. To retrieve the most recent \
         revision ID, use [GetPullRequest].\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The ID of the pull request for which you want to get information about whether approval \
         rules have been set aside (overridden).\n"]
}
[@@ocaml.doc ""]

type nonrec get_pull_request_output = {
  pull_request : pull_request; [@ocaml.doc "Information about the specified pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_pull_request_input = {
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec approval = {
  approval_state : approval_state option;
      [@ocaml.doc "The state of the approval, APPROVE or REVOKE. REVOKE states are not stored.\n"]
  user_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the user.\n"]
}
[@@ocaml.doc "Returns information about a specific approval on a pull request.\n"]

type nonrec approval_list = approval list [@@ocaml.doc ""]

type nonrec get_pull_request_approval_states_output = {
  approvals : approval_list option;
      [@ocaml.doc "Information about users who have approved the pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_pull_request_approval_states_input = {
  revision_id : revision_id; [@ocaml.doc "The system-generated ID for the pull request revision.\n"]
  pull_request_id : pull_request_id; [@ocaml.doc "The system-generated ID for the pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_merge_options_output = {
  base_commit_id : object_id; [@ocaml.doc "The commit ID of the merge base.\n"]
  destination_commit_id : object_id;
      [@ocaml.doc
        "The commit ID of the destination commit specifier that was used in the merge evaluation.\n"]
  source_commit_id : object_id;
      [@ocaml.doc
        "The commit ID of the source commit specifier that was used in the merge evaluation.\n"]
  merge_options : merge_options;
      [@ocaml.doc "The merge option or strategy used to merge the code.\n"]
}
[@@ocaml.doc ""]

type nonrec get_merge_options_input = {
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository that contains the commits about which you want to get merge \
         options.\n"]
}
[@@ocaml.doc ""]

type nonrec file_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec file_sizes = {
  base : file_size option;
      [@ocaml.doc "The size of a file in the base of a merge or pull request.\n"]
  destination : file_size option;
      [@ocaml.doc "The size of a file in the destination of a merge or pull request.\n"]
  source : file_size option;
      [@ocaml.doc "The size of a file in the source of a merge or pull request.\n"]
}
[@@ocaml.doc "Information about the size of files in a merge or pull request.\n"]

type nonrec file_modes = {
  base : file_mode_type_enum option;
      [@ocaml.doc "The file mode of a file in the base of a merge or pull request.\n"]
  destination : file_mode_type_enum option;
      [@ocaml.doc "The file mode of a file in the destination of a merge or pull request.\n"]
  source : file_mode_type_enum option;
      [@ocaml.doc "The file mode of a file in the source of a merge or pull request.\n"]
}
[@@ocaml.doc "Information about file modes in a merge or pull request.\n"]

type nonrec conflict_metadata = {
  merge_operations : merge_operations option;
      [@ocaml.doc
        "Whether an add, modify, or delete operation caused the conflict between the source and \
         destination of the merge.\n"]
  object_type_conflict : is_object_type_conflict option;
      [@ocaml.doc
        "A boolean value (true or false) indicating whether there are conflicts between the \
         branches in the object type of a file, folder, or submodule.\n"]
  file_mode_conflict : is_file_mode_conflict option;
      [@ocaml.doc
        "A boolean value indicating whether there are conflicts in the file mode of a file.\n"]
  content_conflict : is_content_conflict option;
      [@ocaml.doc
        "A boolean value indicating whether there are conflicts in the content of a file.\n"]
  is_binary_file : is_binary_file option;
      [@ocaml.doc
        "A boolean value (true or false) indicating whether the file is binary or textual in the \
         source, destination, and base of the merge.\n"]
  number_of_conflicts : number_of_conflicts option;
      [@ocaml.doc
        "The number of conflicts, including both hunk conflicts and metadata conflicts.\n"]
  object_types : object_types option;
      [@ocaml.doc "Information about any object type conflicts in a merge operation.\n"]
  file_modes : file_modes option;
      [@ocaml.doc "The file modes of the file in the source, destination, and base of the merge.\n"]
  file_sizes : file_sizes option;
      [@ocaml.doc "The file sizes of the file in the source, destination, and base of the merge.\n"]
  file_path : path option; [@ocaml.doc "The path of the file that contains conflicts.\n"]
}
[@@ocaml.doc "Information about the metadata for a conflict in a merge operation.\n"]

type nonrec conflict_metadata_list = conflict_metadata list [@@ocaml.doc ""]

type nonrec get_merge_conflicts_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that can be used in a request to return the next batch of the results.\n"]
  conflict_metadata_list : conflict_metadata_list;
      [@ocaml.doc
        "A list of metadata for any conflicting files. If the specified merge strategy is \
         FAST_FORWARD_MERGE, this list is always empty.\n"]
  base_commit_id : object_id option; [@ocaml.doc "The commit ID of the merge base.\n"]
  source_commit_id : object_id;
      [@ocaml.doc
        "The commit ID of the source commit specifier that was used in the merge evaluation.\n"]
  destination_commit_id : object_id;
      [@ocaml.doc
        "The commit ID of the destination commit specifier that was used in the merge evaluation.\n"]
  mergeable : is_mergeable;
      [@ocaml.doc
        "A Boolean value that indicates whether the code is mergeable by the specified merge option.\n"]
}
[@@ocaml.doc ""]

type nonrec get_merge_conflicts_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  max_conflict_files : max_results option;
      [@ocaml.doc "The maximum number of files to include in the output.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  merge_option : merge_option_type_enum;
      [@ocaml.doc "The merge option or strategy you want to use to merge the code. \n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where the pull request was created.\n"]
}
[@@ocaml.doc ""]

type nonrec get_merge_commit_output = {
  merged_commit_id : object_id option;
      [@ocaml.doc
        "The commit ID for the merge commit created when the source branch was merged into the \
         destination branch. If the fast-forward merge strategy was used, there is no merge commit.\n"]
  base_commit_id : object_id option; [@ocaml.doc "The commit ID of the merge base.\n"]
  destination_commit_id : object_id option;
      [@ocaml.doc
        "The commit ID of the destination commit specifier that was used in the merge evaluation.\n"]
  source_commit_id : object_id option;
      [@ocaml.doc
        "The commit ID of the source commit specifier that was used in the merge evaluation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_merge_commit_input = {
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository that contains the merge commit about which you want to get \
         information.\n"]
}
[@@ocaml.doc ""]

type nonrec folder = {
  relative_path : path option;
      [@ocaml.doc
        "The relative path of the specified folder from the folder where the query originated.\n"]
  absolute_path : path option;
      [@ocaml.doc "The fully qualified path of the folder in the repository.\n"]
  tree_id : object_id option;
      [@ocaml.doc
        "The full SHA-1 pointer of the tree information for the commit that contains the folder.\n"]
}
[@@ocaml.doc "Returns information about a folder in a repository.\n"]

type nonrec folder_list = folder list [@@ocaml.doc ""]

type nonrec file = {
  file_mode : file_mode_type_enum option;
      [@ocaml.doc
        "The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and \
         NORMAL.\n"]
  relative_path : path option;
      [@ocaml.doc "The relative path of the file from the folder where the query originated.\n"]
  absolute_path : path option;
      [@ocaml.doc "The fully qualified path to the file in the repository.\n"]
  blob_id : object_id option; [@ocaml.doc "The blob ID that contains the file information.\n"]
}
[@@ocaml.doc "Returns information about a file in a repository.\n"]

type nonrec file_list = file list [@@ocaml.doc ""]

type nonrec get_folder_output = {
  sub_modules : sub_module_list option;
      [@ocaml.doc "The list of submodules in the specified folder, if any.\n"]
  symbolic_links : symbolic_link_list option;
      [@ocaml.doc
        "The list of symbolic links to other files and folders in the specified folder, if any.\n"]
  files : file_list option; [@ocaml.doc "The list of files in the specified folder, if any.\n"]
  sub_folders : folder_list option;
      [@ocaml.doc "The list of folders that exist under the specified folder, if any.\n"]
  tree_id : object_id option;
      [@ocaml.doc
        "The full SHA-1 pointer of the tree information for the commit that contains the folder.\n"]
  folder_path : path;
      [@ocaml.doc "The fully qualified path of the folder whose contents are returned.\n"]
  commit_id : object_id;
      [@ocaml.doc
        "The full commit ID used as a reference for the returned version of the folder content.\n"]
}
[@@ocaml.doc ""]

type nonrec get_folder_input = {
  folder_path : path;
      [@ocaml.doc
        "The fully qualified path to the folder whose contents are returned, including the folder \
         name. For example, /examples is a fully-qualified path to a folder named examples that \
         was created off of the root directory (/) of a repository. \n"]
  commit_specifier : commit_name option;
      [@ocaml.doc
        "A fully qualified reference used to identify a commit that contains the version of the \
         folder's content to return. A fully qualified reference can be a commit ID, branch name, \
         tag, or reference such as HEAD. If no specifier is provided, the folder content is \
         returned as it exists in the HEAD commit.\n"]
  repository_name : repository_name; [@ocaml.doc "The name of the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec folder_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified folder does not exist. Either the folder name is not correct, or you did not \
   enter the full path to the folder.\n"]

type nonrec get_file_output = {
  file_content : file_content;
      [@ocaml.doc
        "The base-64 encoded binary data object that represents the content of the file.\n"]
  file_size : object_size; [@ocaml.doc "The size of the contents of the file, in bytes.\n"]
  file_mode : file_mode_type_enum;
      [@ocaml.doc
        "The extrapolated file mode permissions of the blob. Valid values include strings such as \
         EXECUTABLE and not numeric values.\n\n\
        \  The file mode permissions returned by this API are not the standard file mode \
         permission values, such as 100644, but rather extrapolated values. See the supported \
         return values.\n\
        \  \n\
        \   "]
  file_path : path;
      [@ocaml.doc
        "The fully qualified path to the specified file. Returns the name and extension of the file.\n"]
  blob_id : object_id; [@ocaml.doc "The blob ID of the object that represents the file content.\n"]
  commit_id : object_id;
      [@ocaml.doc
        "The full commit ID of the commit that contains the content returned by GetFile.\n"]
}
[@@ocaml.doc ""]

type nonrec get_file_input = {
  file_path : path;
      [@ocaml.doc
        "The fully qualified path to the file, including the full name and extension of the file. \
         For example, /examples/file.md is the fully qualified path to a file named file.md in a \
         folder named examples.\n"]
  commit_specifier : commit_name option;
      [@ocaml.doc
        "The fully quaified reference that identifies the commit that contains the file. For \
         example, you can specify a full commit ID, a tag, a branch name, or a reference such as \
         refs/heads/main. If none is provided, the head commit is used.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the file.\n"]
}
[@@ocaml.doc ""]

type nonrec file_too_large_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified file exceeds the file size limit for CodeCommit. For more information about \
   limits in CodeCommit, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html}Quotas} in the {i \
   CodeCommit User Guide}.\n"]

type nonrec file_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified file does not exist. Verify that you have used the correct file name, full path, \
   and extension.\n"]

type nonrec blob_metadata = {
  mode : mode option;
      [@ocaml.doc
        "The file mode permissions of the blob. File mode permission codes include:\n\n\
        \ {ul\n\
        \       {-   [100644] indicates read/write\n\
        \           \n\
        \            }\n\
        \       {-   [100755] indicates read/write/execute\n\
        \           \n\
        \            }\n\
        \       {-   [160000] indicates a submodule\n\
        \           \n\
        \            }\n\
        \       {-   [120000] indicates a symlink\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  path : path option; [@ocaml.doc "The path to the blob and associated file name, if any.\n"]
  blob_id : object_id option; [@ocaml.doc "The full ID of the blob.\n"]
}
[@@ocaml.doc "Returns information about a specific Git blob object.\n"]

type nonrec difference = {
  change_type : change_type_enum option;
      [@ocaml.doc
        "Whether the change type of the difference is an addition (A), deletion (D), or \
         modification (M).\n"]
  after_blob : blob_metadata option;
      [@ocaml.doc
        "Information about an [afterBlob] data type object, including the ID, the file mode \
         permission code, and the path.\n"]
  before_blob : blob_metadata option;
      [@ocaml.doc
        "Information about a [beforeBlob] data type object, including the ID, the file mode \
         permission code, and the path.\n"]
}
[@@ocaml.doc "Returns information about a set of differences for a commit specifier.\n"]

type nonrec difference_list = difference list [@@ocaml.doc ""]

type nonrec get_differences_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that can be used in a request to return the next batch of the results.\n"]
  differences : difference_list option;
      [@ocaml.doc
        "A data type object that contains information about the differences, including whether the \
         difference is added, modified, or deleted (A, D, M).\n"]
}
[@@ocaml.doc ""]

type nonrec get_differences_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  max_results : limit option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results.\n"]
  after_path : path option;
      [@ocaml.doc
        "The file path in which to check differences. Limits the results to this path. Can also be \
         used to specify the changed name of a directory or folder, if it has changed. If not \
         specified, differences are shown for all paths.\n"]
  before_path : path option;
      [@ocaml.doc
        "The file path in which to check for differences. Limits the results to this path. Can \
         also be used to specify the previous name of a directory or folder. If [beforePath] and \
         [afterPath] are not specified, differences are shown for all paths.\n"]
  after_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit.\n"]
  before_commit_specifier : commit_name option;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, the full commit ID). Optional. If not specified, all changes before the \
         [afterCommitSpecifier] value are shown. If you do not use [beforeCommitSpecifier] in your \
         request, consider limiting the results with [maxResults].\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where you want to get differences.\n"]
}
[@@ocaml.doc ""]

type nonrec get_commit_output = {
  commit : commit;
      [@ocaml.doc
        "A commit data type object that contains information about the specified commit.\n"]
}
[@@ocaml.doc "Represents the output of a get commit operation.\n"]

type nonrec get_commit_input = {
  commit_id : object_id;
      [@ocaml.doc "The commit ID. Commit IDs are the full SHA ID of the commit.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to which the commit was made.\n"]
}
[@@ocaml.doc "Represents the input of a get commit operation.\n"]

type nonrec commit_id_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified commit ID does not exist.\n"]

type nonrec comments = comment list [@@ocaml.doc ""]

type nonrec comments_for_pull_request = {
  comments : comments option;
      [@ocaml.doc
        "An array of comment objects. Each comment object contains information about a comment on \
         the pull request.\n"]
  location : location option;
      [@ocaml.doc
        "Location information about the comment on the pull request, including the file name, line \
         number, and whether the version of the file where the comment was made is BEFORE \
         (destination branch) or AFTER (source branch).\n"]
  after_blob_id : object_id option;
      [@ocaml.doc
        "The full blob ID of the file on which you want to comment on the source commit.\n"]
  before_blob_id : object_id option;
      [@ocaml.doc
        "The full blob ID of the file on which you want to comment on the destination commit.\n"]
  after_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit that was the tip of the source branch at the time the \
         comment was made. \n"]
  before_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit that was the tip of the destination branch when the pull \
         request was created. This commit is superceded by the after commit in the source branch \
         when and if you merge the source branch into the destination branch.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository that contains the pull request.\n"]
  pull_request_id : pull_request_id option;
      [@ocaml.doc "The system-generated ID of the pull request.\n"]
}
[@@ocaml.doc "Returns information about comments on a pull request.\n"]

type nonrec comments_for_pull_request_data = comments_for_pull_request list [@@ocaml.doc ""]

type nonrec get_comments_for_pull_request_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that can be used in a request to return the next batch of the results.\n"]
  comments_for_pull_request_data : comments_for_pull_request_data option;
      [@ocaml.doc "An array of comment objects on the pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_comments_for_pull_request_input = {
  max_results : max_results option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results. The \
         default is 100 comments. You can return up to 500 comments with a single request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  after_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit in the source branch that was the tip of the branch at \
         the time the comment was made. Requirement is conditional: [afterCommitId] must be \
         specified when [repositoryName] is included.\n"]
  before_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit in the destination branch that was the tip of the branch \
         at the time the pull request was created. Requirement is conditional: [beforeCommitId] \
         must be specified when [repositoryName] is included.\n"]
  repository_name : repository_name option;
      [@ocaml.doc
        "The name of the repository that contains the pull request. Requirement is conditional: \
         [repositoryName] must be specified when [beforeCommitId] and [afterCommitId] are included.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec comments_for_compared_commit = {
  comments : comments option;
      [@ocaml.doc
        "An array of comment objects. Each comment object contains information about a comment on \
         the comparison between commits.\n"]
  location : location option;
      [@ocaml.doc
        "Location information about the comment on the comparison, including the file name, line \
         number, and whether the version of the file where the comment was made is BEFORE or AFTER.\n"]
  after_blob_id : object_id option;
      [@ocaml.doc "The full blob ID of the commit used to establish the after of the comparison.\n"]
  before_blob_id : object_id option;
      [@ocaml.doc
        "The full blob ID of the commit used to establish the before of the comparison.\n"]
  after_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit used to establish the after of the comparison.\n"]
  before_commit_id : commit_id option;
      [@ocaml.doc
        "The full commit ID of the commit used to establish the before of the comparison.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository that contains the compared commits.\n"]
}
[@@ocaml.doc "Returns information about comments on the comparison between two commits.\n"]

type nonrec comments_for_compared_commit_data = comments_for_compared_commit list [@@ocaml.doc ""]

type nonrec get_comments_for_compared_commit_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that can be used in a request to return the next batch of the results.\n"]
  comments_for_compared_commit_data : comments_for_compared_commit_data option;
      [@ocaml.doc "A list of comment objects on the compared commit.\n"]
}
[@@ocaml.doc ""]

type nonrec get_comments_for_compared_commit_input = {
  max_results : max_results option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results. The \
         default is 100 comments, but you can configure up to 500.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that when provided in a request, returns the next batch of the \
         results. \n"]
  after_commit_id : commit_id;
      [@ocaml.doc
        "To establish the directionality of the comparison, the full commit ID of the after commit.\n"]
  before_commit_id : commit_id option;
      [@ocaml.doc
        "To establish the directionality of the comparison, the full commit ID of the before commit.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where you want to compare commits.\n"]
}
[@@ocaml.doc ""]

type nonrec get_comment_reactions_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that can be used in a request to return the next batch of the results.\n"]
  reactions_for_comment : reactions_for_comment_list;
      [@ocaml.doc "An array of reactions to the specified comment.\n"]
}
[@@ocaml.doc ""]

type nonrec get_comment_reactions_input = {
  max_results : max_results option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results. The \
         default is the same as the allowed maximum, 1,000.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results. \n"]
  reaction_user_arn : arn option;
      [@ocaml.doc
        "Optional. The Amazon Resource Name (ARN) of the user or identity for which you want to \
         get reaction information.\n"]
  comment_id : comment_id;
      [@ocaml.doc "The ID of the comment for which you want to get reactions information.\n"]
}
[@@ocaml.doc ""]

type nonrec get_comment_output = {
  comment : comment option; [@ocaml.doc "The contents of the comment.\n"]
}
[@@ocaml.doc ""]

type nonrec get_comment_input = {
  comment_id : comment_id;
      [@ocaml.doc
        "The unique, system-generated ID of the comment. To get this ID, use \
         [GetCommentsForComparedCommit] or [GetCommentsForPullRequest].\n"]
}
[@@ocaml.doc ""]

type nonrec branch_info = {
  commit_id : commit_id option; [@ocaml.doc "The ID of the last commit made to the branch.\n"]
  branch_name : branch_name option; [@ocaml.doc "The name of the branch.\n"]
}
[@@ocaml.doc "Returns information about a branch.\n"]

type nonrec get_branch_output = {
  branch : branch_info option; [@ocaml.doc "The name of the branch.\n"]
}
[@@ocaml.doc "Represents the output of a get branch operation.\n"]

type nonrec get_branch_input = {
  branch_name : branch_name option;
      [@ocaml.doc "The name of the branch for which you want to retrieve information.\n"]
  repository_name : repository_name option;
      [@ocaml.doc
        "The name of the repository that contains the branch for which you want to retrieve \
         information.\n"]
}
[@@ocaml.doc "Represents the input of a get branch operation.\n"]

type nonrec get_blob_output = {
  content : blob; [@ocaml.doc "The content of the blob, usually a file.\n"]
}
[@@ocaml.doc "Represents the output of a get blob operation.\n"]

type nonrec get_blob_input = {
  blob_id : object_id; [@ocaml.doc "The ID of the blob, which is its SHA-1 pointer.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the blob.\n"]
}
[@@ocaml.doc "Represents the input of a get blob operation.\n"]

type nonrec blob_id_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "A blob ID is required, but was not specified.\n"]

type nonrec blob_id_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc "The specified blob does not exist.\n"]

type nonrec get_approval_rule_template_output = {
  approval_rule_template : approval_rule_template;
      [@ocaml.doc "The content and structure of the approval rule template.\n"]
}
[@@ocaml.doc ""]

type nonrec get_approval_rule_template_input = {
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc "The name of the approval rule template for which you want to get information.\n"]
}
[@@ocaml.doc ""]

type nonrec file_metadata = {
  file_mode : file_mode_type_enum option;
      [@ocaml.doc
        "The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and \
         NORMAL.\n"]
  blob_id : object_id option; [@ocaml.doc "The blob ID that contains the file information.\n"]
  absolute_path : path option;
      [@ocaml.doc
        "The full path to the file to be added or updated, including the name of the file.\n"]
}
[@@ocaml.doc "A file to be added, updated, or deleted as part of a commit.\n"]

type nonrec files_metadata = file_metadata list [@@ocaml.doc ""]

type nonrec file_paths = path list [@@ocaml.doc ""]

type nonrec file_entry_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because no files have been specified as added, updated, or changed \
   (PutFile or DeleteFile) for the commit.\n"]

type nonrec file_content_and_source_file_specified_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The commit cannot be created because both a source file and file content have been specified \
   for the same file. You cannot provide both. Either specify a source file or provide the file \
   content directly.\n"]

type nonrec exception_name = string [@@ocaml.doc ""]

type nonrec approved = bool [@@ocaml.doc ""]

type nonrec approval_rules_satisfied_list = approval_rule_name list [@@ocaml.doc ""]

type nonrec approval_rules_not_satisfied_list = approval_rule_name list [@@ocaml.doc ""]

type nonrec evaluation = {
  approval_rules_not_satisfied : approval_rules_not_satisfied_list option;
      [@ocaml.doc "The names of the approval rules that have not had their conditions met.\n"]
  approval_rules_satisfied : approval_rules_satisfied_list option;
      [@ocaml.doc "The names of the approval rules that have had their conditions met.\n"]
  overridden : overridden option;
      [@ocaml.doc
        "Whether the approval rule requirements for the pull request have been overridden and no \
         longer need to be met.\n"]
  approved : approved option; [@ocaml.doc "Whether the state of the pull request is approved.\n"]
}
[@@ocaml.doc
  "Returns information about the approval rules applied to a pull request and whether conditions \
   have been met.\n"]

type nonrec evaluate_pull_request_approval_rules_output = {
  evaluation : evaluation;
      [@ocaml.doc
        "The result of the evaluation, including the names of the rules whose conditions have been \
         met (if any), the names of the rules whose conditions have not been met (if any), whether \
         the pull request is in the approved state, and whether the pull request approval rule has \
         been set aside by an override. \n"]
}
[@@ocaml.doc ""]

type nonrec evaluate_pull_request_approval_rules_input = {
  revision_id : revision_id;
      [@ocaml.doc
        "The system-generated ID for the pull request revision. To retrieve the most recent \
         revision ID for a pull request, use [GetPullRequest].\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc "The system-generated ID of the pull request you want to evaluate.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec disassociate_approval_rule_template_from_repository_input = {
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository you want to disassociate from the template.\n"]
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc
        "The name of the approval rule template to disassociate from a specified repository.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_pull_request_events_output = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that can be used in a request to return the next batch of the results.\n"]
  pull_request_events : pull_request_event_list;
      [@ocaml.doc "Information about the pull request events.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_pull_request_events_input = {
  max_results : max_results option;
      [@ocaml.doc
        "A non-zero, non-negative integer used to limit the number of returned results. The \
         default is 100 events, which is also the maximum number of events that can be returned in \
         a result.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  actor_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the user whose actions resulted in the event. Examples \
         include updating the pull request with more commits or changing the status of a pull \
         request.\n"]
  pull_request_event_type : pull_request_event_type option;
      [@ocaml.doc
        "Optional. The pull request event type about which you want to return information.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request. To get this ID, use [ListPullRequests].\n"]
}
[@@ocaml.doc ""]

type nonrec actor_does_not_exist_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified Amazon Resource Name (ARN) does not exist in the Amazon Web Services account.\n"]

type nonrec describe_merge_conflicts_output = {
  base_commit_id : object_id option; [@ocaml.doc "The commit ID of the merge base.\n"]
  source_commit_id : object_id;
      [@ocaml.doc
        "The commit ID of the source commit specifier that was used in the merge evaluation.\n"]
  destination_commit_id : object_id;
      [@ocaml.doc
        "The commit ID of the destination commit specifier that was used in the merge evaluation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that can be used in a request to return the next batch of the results.\n"]
  merge_hunks : merge_hunks;
      [@ocaml.doc "A list of merge hunks of the differences between the files or lines.\n"]
  conflict_metadata : conflict_metadata;
      [@ocaml.doc "Contains metadata about the conflicts found in the merge.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_merge_conflicts_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  file_path : path; [@ocaml.doc "The path of the target files used to describe the conflicts. \n"]
  max_merge_hunks : max_results option;
      [@ocaml.doc "The maximum number of merge hunks to include in the output.\n"]
  merge_option : merge_option_type_enum;
      [@ocaml.doc "The merge option or strategy you want to use to merge the code.\n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository where you want to get information about a merge conflict.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_repository_output = {
  repository_id : repository_id option; [@ocaml.doc "The ID of the repository that was deleted.\n"]
}
[@@ocaml.doc "Represents the output of a delete repository operation.\n"]

type nonrec delete_repository_input = {
  repository_name : repository_name; [@ocaml.doc "The name of the repository to delete.\n"]
}
[@@ocaml.doc "Represents the input of a delete repository operation.\n"]

type nonrec delete_pull_request_approval_rule_output = {
  approval_rule_id : approval_rule_id;
      [@ocaml.doc
        "The ID of the deleted approval rule. \n\n\
        \  If the approval rule was deleted in an earlier API call, the response is 200 OK without \
         content.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_pull_request_approval_rule_input = {
  approval_rule_name : approval_rule_name;
      [@ocaml.doc "The name of the approval rule you want to delete.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request that contains the approval rule you want to \
         delete.\n"]
}
[@@ocaml.doc ""]

type nonrec cannot_delete_approval_rule_from_template_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The approval rule cannot be deleted from the pull request because it was created by an approval \
   rule template and applied to the pull request automatically.\n"]

type nonrec delete_file_output = {
  file_path : path;
      [@ocaml.doc
        "The fully qualified path to the file to be deleted, including the full name and extension \
         of that file.\n"]
  tree_id : object_id;
      [@ocaml.doc
        "The full SHA-1 pointer of the tree information for the commit that contains the delete \
         file change.\n"]
  blob_id : object_id;
      [@ocaml.doc "The blob ID removed from the tree as part of deleting the file.\n"]
  commit_id : object_id;
      [@ocaml.doc
        "The full commit ID of the commit that contains the change that deletes the file.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_file_input = {
  email : email option;
      [@ocaml.doc
        "The email address for the commit that deletes the file. If no email address is specified, \
         the email address is left blank.\n"]
  name : name option;
      [@ocaml.doc
        "The name of the author of the commit that deletes the file. If no name is specified, the \
         user's ARN is used as the author name and committer name.\n"]
  commit_message : message option;
      [@ocaml.doc
        "The commit message you want to include as part of deleting the file. Commit messages are \
         limited to 256 KB. If no message is specified, a default message is used.\n"]
  keep_empty_folders : keep_empty_folders option;
      [@ocaml.doc
        "If a file is the only object in the folder or directory, specifies whether to delete the \
         folder or directory that contains the file. By default, empty folders are deleted. This \
         includes empty folders that are part of the directory structure. For example, if the path \
         to a file is dir1/dir2/dir3/dir4, and dir2 and dir3 are empty, deleting the last file in \
         dir4 also deletes the empty folders dir4, dir3, and dir2.\n"]
  parent_commit_id : commit_id;
      [@ocaml.doc
        "The ID of the commit that is the tip of the branch where you want to create the commit \
         that deletes the file. This must be the HEAD commit for the branch. The commit that \
         deletes the file is created from this commit ID.\n"]
  file_path : path;
      [@ocaml.doc
        "The fully qualified path to the file that to be deleted, including the full name and \
         extension of that file. For example, /examples/file.md is a fully qualified path to a \
         file named file.md in a folder named examples.\n"]
  branch_name : branch_name;
      [@ocaml.doc "The name of the branch where the commit that deletes the file is made.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the file to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_comment_content_output = {
  comment : comment option; [@ocaml.doc "Information about the comment you just deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_comment_content_input = {
  comment_id : comment_id;
      [@ocaml.doc
        "The unique, system-generated ID of the comment. To get this ID, use \
         [GetCommentsForComparedCommit] or [GetCommentsForPullRequest].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_branch_output = {
  deleted_branch : branch_info option;
      [@ocaml.doc
        "Information about the branch deleted by the operation, including the branch name and the \
         commit ID that was the tip of the branch.\n"]
}
[@@ocaml.doc "Represents the output of a delete branch operation.\n"]

type nonrec delete_branch_input = {
  branch_name : branch_name; [@ocaml.doc "The name of the branch to delete.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the branch to be deleted.\n"]
}
[@@ocaml.doc "Represents the input of a delete branch operation.\n"]

type nonrec default_branch_cannot_be_deleted_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified branch is the default branch for the repository, and cannot be deleted. To delete \
   this branch, you must first set another branch as the default branch.\n"]

type nonrec delete_approval_rule_template_output = {
  approval_rule_template_id : approval_rule_template_id;
      [@ocaml.doc
        "The system-generated ID of the deleted approval rule template. If the template has been \
         previously deleted, the only response is a 200 OK.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_approval_rule_template_input = {
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc "The name of the approval rule template to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec approval_rule_template_in_use_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The approval rule template is associated with one or more repositories. You cannot delete a \
   template that is associated with a repository. Remove all associations, and then try again.\n"]

type nonrec create_unreferenced_merge_commit_output = {
  tree_id : object_id option;
      [@ocaml.doc
        "The full SHA-1 pointer of the tree information for the commit that contains the merge \
         results.\n"]
  commit_id : object_id option;
      [@ocaml.doc "The full commit ID of the commit that contains your merge results.\n"]
}
[@@ocaml.doc ""]

type nonrec create_unreferenced_merge_commit_input = {
  conflict_resolution : conflict_resolution option;
      [@ocaml.doc
        "If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving \
         conflicts during a merge.\n"]
  keep_empty_folders : keep_empty_folders option;
      [@ocaml.doc
        "If the commit contains deletions, whether to keep a folder or folder structure if the \
         changes leave the folders empty. If this is specified as true, a .gitkeep file is created \
         for empty folders. The default is false.\n"]
  commit_message : message option; [@ocaml.doc "The commit message for the unreferenced commit.\n"]
  email : email option;
      [@ocaml.doc "The email address for the person who created the unreferenced commit.\n"]
  author_name : name option;
      [@ocaml.doc
        "The name of the author who created the unreferenced commit. This information is used as \
         both the author and committer for the commit.\n"]
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  merge_option : merge_option_type_enum;
      [@ocaml.doc "The merge option or strategy you want to use to merge the code.\n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository where you want to create the unreferenced merge commit.\n"]
}
[@@ocaml.doc ""]

type nonrec create_repository_output = {
  repository_metadata : repository_metadata option;
      [@ocaml.doc "Information about the newly created repository.\n"]
}
[@@ocaml.doc "Represents the output of a create repository operation.\n"]

type nonrec create_repository_input = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The ID of the encryption key. You can view the ID of an encryption key in the KMS \
         console, or use the KMS APIs to programmatically retrieve a key ID. For more information \
         about acceptable values for kmsKeyID, see \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_Decrypt.html#KMS-Decrypt-request-KeyId}KeyId} \
         in the Decrypt API description in the {i Key Management Service API Reference}.\n\n\
        \ If no key is specified, the default [aws/codecommit] Amazon Web Services managed key is \
         used.\n\
        \ "]
  tags : tags_map option;
      [@ocaml.doc "One or more tag key-value pairs to use when tagging this repository.\n"]
  repository_description : repository_description option;
      [@ocaml.doc
        "A comment or description about the new repository.\n\n\
        \  The description field for a repository accepts all HTML characters and all valid \
         Unicode characters. Applications that do not HTML-encode the description and display it \
         in a webpage can expose users to potentially malicious code. Make sure that you \
         HTML-encode the description field in any application that uses this API to display the \
         repository description on a webpage.\n\
        \  \n\
        \   "]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the new repository to be created.\n\n\
        \  The repository name must be unique across the calling Amazon Web Services account. \
         Repository names are limited to 100 alphanumeric, dash, and underscore characters, and \
         cannot include certain characters. For more information about the limits on repository \
         names, see {{:https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html}Quotas} \
         in the {i CodeCommit User Guide}. The suffix .git is prohibited.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Represents the input of a create repository operation.\n"]

type nonrec create_pull_request_output = {
  pull_request : pull_request; [@ocaml.doc "Information about the newly created pull request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_pull_request_input = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique, client-generated idempotency token that, when provided in a request, ensures \
         the request cannot be repeated with a changed parameter. If a request is received with \
         the same parameters and a token is included, the request returns information about the \
         initial request that used that token.\n\n\
        \  The Amazon Web ServicesSDKs prepopulate client request tokens. If you are using an \
         Amazon Web ServicesSDK, an idempotency token is created for you.\n\
        \  \n\
        \   "]
  targets : target_list;
      [@ocaml.doc
        "The targets for the pull request, including the source of the code to be reviewed (the \
         source branch) and the destination where the creator of the pull request intends the code \
         to be merged after the pull request is closed (the destination branch).\n"]
  description : description option; [@ocaml.doc "A description of the pull request.\n"]
  title : title;
      [@ocaml.doc
        "The title of the pull request. This title is used to identify the pull request to other \
         users in the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec create_pull_request_approval_rule_output = {
  approval_rule : approval_rule; [@ocaml.doc "Information about the created approval rule.\n"]
}
[@@ocaml.doc ""]

type nonrec create_pull_request_approval_rule_input = {
  approval_rule_content : approval_rule_content;
      [@ocaml.doc
        "The content of the approval rule, including the number of approvals needed and the \
         structure of an approval pool defined for approvals, if any. For more information about \
         approval pools, see the CodeCommit User Guide.\n\n\
        \  When you create the content of the approval rule, you can specify approvers in an \
         approval pool in one of two ways:\n\
        \  \n\
        \   {ul\n\
        \         {-   {b CodeCommitApprovers}: This option only requires an Amazon Web Services \
         account and a resource. It can be used for both IAM users and federated access users \
         whose name matches the provided resource name. This is a very powerful option that offers \
         a great deal of flexibility. For example, if you specify the Amazon Web Services account \
         {i 123456789012} and {i Mary_Major}, all of the following would be counted as approvals \
         coming from that user:\n\
        \             \n\
        \              {ul\n\
        \                    {-  An IAM user in the account (arn:aws:iam::{i 123456789012}:user/{i \
         Mary_Major})\n\
        \                        \n\
        \                         }\n\
        \                    {-  A federated user identified in IAM as Mary_Major (arn:aws:sts::{i \
         123456789012}:federated-user/{i Mary_Major})\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \          }\n\
        \           This option does not recognize an active session of someone assuming the role \
         of CodeCommitReview with a role session name of {i Mary_Major} (arn:aws:sts::{i \
         123456789012}:assumed-role/CodeCommitReview/{i Mary_Major}) unless you include a wildcard \
         (*Mary_Major).\n\
        \           \n\
        \            }\n\
        \         {-   {b Fully qualified ARN}: This option allows you to specify the fully \
         qualified Amazon Resource Name (ARN) of the IAM user or role. \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   For more information about IAM ARNs, wildcards, and formats, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html}IAM \
         Identifiers} in the {i IAM User Guide}.\n\
        \   \n\
        \    "]
  approval_rule_name : approval_rule_name; [@ocaml.doc "The name for the approval rule.\n"]
  pull_request_id : pull_request_id;
      [@ocaml.doc
        "The system-generated ID of the pull request for which you want to create the approval rule.\n"]
}
[@@ocaml.doc ""]

type nonrec approval_rule_name_already_exists_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "An approval rule with that name already exists. Approval rule names must be unique within the \
   scope of a pull request.\n"]

type nonrec create_commit_output = {
  files_deleted : files_metadata option;
      [@ocaml.doc "The files deleted as part of the committed file changes.\n"]
  files_updated : files_metadata option;
      [@ocaml.doc "The files updated as part of the commited file changes.\n"]
  files_added : files_metadata option;
      [@ocaml.doc "The files added as part of the committed file changes.\n"]
  tree_id : object_id option;
      [@ocaml.doc
        "The full SHA-1 pointer of the tree information for the commit that contains the commited \
         file changes.\n"]
  commit_id : object_id option;
      [@ocaml.doc "The full commit ID of the commit that contains your committed file changes.\n"]
}
[@@ocaml.doc ""]

type nonrec create_commit_input = {
  set_file_modes : set_file_mode_entries option;
      [@ocaml.doc "The file modes to update for files in this commit.\n"]
  delete_files : delete_file_entries option;
      [@ocaml.doc
        "The files to delete in this commit. These files still exist in earlier commits.\n"]
  put_files : put_file_entries option; [@ocaml.doc "The files to add or update in this commit.\n"]
  keep_empty_folders : keep_empty_folders option;
      [@ocaml.doc
        "If the commit contains deletions, whether to keep a folder or folder structure if the \
         changes leave the folders empty. If true, a ..gitkeep file is created for empty folders. \
         The default is false.\n"]
  commit_message : message option;
      [@ocaml.doc
        "The commit message you want to include in the commit. Commit messages are limited to 256 \
         KB. If no message is specified, a default message is used.\n"]
  email : email option; [@ocaml.doc "The email address of the person who created the commit.\n"]
  author_name : name option;
      [@ocaml.doc
        "The name of the author who created the commit. This information is used as both the \
         author and committer for the commit.\n"]
  parent_commit_id : commit_id option;
      [@ocaml.doc
        "The ID of the commit that is the parent of the commit you create. Not required if this is \
         an empty repository.\n"]
  branch_name : branch_name; [@ocaml.doc "The name of the branch where you create the commit.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where you create the commit.\n"]
}
[@@ocaml.doc ""]

type nonrec create_branch_input = {
  commit_id : commit_id; [@ocaml.doc "The ID of the commit to point the new branch to.\n"]
  branch_name : branch_name; [@ocaml.doc "The name of the new branch to create.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository in which you want to create the new branch.\n"]
}
[@@ocaml.doc "Represents the input of a create branch operation.\n"]

type nonrec branch_name_exists_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "Cannot create the branch with the specified name because the commit conflicts with an existing \
   branch with the same name. Branch names must be unique.\n"]

type nonrec create_approval_rule_template_output = {
  approval_rule_template : approval_rule_template;
      [@ocaml.doc "The content and structure of the created approval rule template.\n"]
}
[@@ocaml.doc ""]

type nonrec create_approval_rule_template_input = {
  approval_rule_template_description : approval_rule_template_description option;
      [@ocaml.doc
        "The description of the approval rule template. Consider providing a description that \
         explains what this template does and when it might be appropriate to associate it with \
         repositories.\n"]
  approval_rule_template_content : approval_rule_template_content;
      [@ocaml.doc
        "The content of the approval rule that is created on pull requests in associated \
         repositories. If you specify one or more destination references (branches), approval \
         rules are created in an associated repository only if their destination references \
         (branches) match those specified in the template.\n\n\
        \  When you create the content of the approval rule template, you can specify approvers in \
         an approval pool in one of two ways:\n\
        \  \n\
        \   {ul\n\
        \         {-   {b CodeCommitApprovers}: This option only requires an Amazon Web Services \
         account and a resource. It can be used for both IAM users and federated access users \
         whose name matches the provided resource name. This is a very powerful option that offers \
         a great deal of flexibility. For example, if you specify the Amazon Web Services account \
         {i 123456789012} and {i Mary_Major}, all of the following are counted as approvals coming \
         from that user:\n\
        \             \n\
        \              {ul\n\
        \                    {-  An IAM user in the account (arn:aws:iam::{i 123456789012}:user/{i \
         Mary_Major})\n\
        \                        \n\
        \                         }\n\
        \                    {-  A federated user identified in IAM as Mary_Major (arn:aws:sts::{i \
         123456789012}:federated-user/{i Mary_Major})\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \          }\n\
        \           This option does not recognize an active session of someone assuming the role \
         of CodeCommitReview with a role session name of {i Mary_Major} (arn:aws:sts::{i \
         123456789012}:assumed-role/CodeCommitReview/{i Mary_Major}) unless you include a wildcard \
         (*Mary_Major).\n\
        \           \n\
        \            }\n\
        \         {-   {b Fully qualified ARN}: This option allows you to specify the fully \
         qualified Amazon Resource Name (ARN) of the IAM user or role. \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   For more information about IAM ARNs, wildcards, and formats, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html}IAM \
         Identifiers} in the {i IAM User Guide}.\n\
        \   \n\
        \    "]
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc
        "The name of the approval rule template. Provide descriptive names, because this name is \
         applied to the approval rules created automatically in associated repositories.\n"]
}
[@@ocaml.doc ""]

type nonrec conflict = {
  merge_hunks : merge_hunks option;
      [@ocaml.doc
        "A list of hunks that contain the differences between files or lines causing the conflict.\n"]
  conflict_metadata : conflict_metadata option;
      [@ocaml.doc "Metadata about a conflict in a merge operation.\n"]
}
[@@ocaml.doc "Information about conflicts in a merge operation.\n"]

type nonrec conflicts = conflict list [@@ocaml.doc ""]

type nonrec commit_objects_list = commit list [@@ocaml.doc ""]

type nonrec commit_ids_list_required_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "A list of commit IDs is required, but was either not specified or the list was empty.\n"]

type nonrec commit_ids_limit_exceeded_exception = {
  message : message option; [@ocaml.doc "Any message associated with the exception.\n"]
}
[@@ocaml.doc
  "The maximum number of allowed commit IDs in a batch request is 100. Verify that your batch \
   requests contains no more than 100 commit IDs, and then try again.\n"]

type nonrec commit_ids_input_list = object_id list [@@ocaml.doc ""]

type nonrec batch_get_repositories_error_code_enum =
  | REPOSITORY_DOES_NOT_EXIST_EXCEPTION [@ocaml.doc ""]
  | ENCRYPTION_KEY_UNAVAILABLE_EXCEPTION [@ocaml.doc ""]
  | ENCRYPTION_KEY_NOT_FOUND_EXCEPTION [@ocaml.doc ""]
  | ENCRYPTION_KEY_DISABLED_EXCEPTION [@ocaml.doc ""]
  | ENCRYPTION_KEY_ACCESS_DENIED_EXCEPTION [@ocaml.doc ""]
  | ENCRYPTION_INTEGRITY_CHECKS_FAILED_EXCEPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_get_repositories_error = {
  error_message : error_message option;
      [@ocaml.doc
        "An error message that provides detail about why the repository either was not found or \
         was not in a valid state.\n"]
  error_code : batch_get_repositories_error_code_enum option;
      [@ocaml.doc "An error code that specifies the type of failure.\n"]
  repository_name : repository_name option;
      [@ocaml.doc
        "The name of a repository that either could not be found or was not in a valid state.\n"]
  repository_id : repository_id option;
      [@ocaml.doc
        "The ID of a repository that either could not be found or was not in a valid state.\n"]
}
[@@ocaml.doc "Returns information about errors in a BatchGetRepositories operation.\n"]

type nonrec batch_get_repositories_errors_list = batch_get_repositories_error list [@@ocaml.doc ""]

type nonrec batch_get_repositories_output = {
  errors : batch_get_repositories_errors_list option;
      [@ocaml.doc
        "Returns information about any errors returned when attempting to retrieve information \
         about the repositories.\n"]
  repositories_not_found : repository_not_found_list option;
      [@ocaml.doc "Returns a list of repository names for which information could not be found.\n"]
  repositories : repository_metadata_list option;
      [@ocaml.doc "A list of repositories returned by the batch get repositories operation.\n"]
}
[@@ocaml.doc "Represents the output of a batch get repositories operation.\n"]

type nonrec batch_get_repositories_input = {
  repository_names : repository_name_list;
      [@ocaml.doc
        "The names of the repositories to get information about.\n\n\
        \  The length constraint limit is for each string in the array. The array itself can be \
         empty.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Represents the input of a batch get repositories operation.\n"]

type nonrec batch_get_commits_error = {
  error_message : error_message option;
      [@ocaml.doc
        "An error message that provides detail about why the commit ID either was not found or was \
         not valid.\n"]
  error_code : error_code option;
      [@ocaml.doc
        "An error code that specifies whether the commit ID was not valid or not found.\n"]
  commit_id : object_id option;
      [@ocaml.doc "A commit ID that either could not be found or was not in a valid format.\n"]
}
[@@ocaml.doc "Returns information about errors in a BatchGetCommits operation.\n"]

type nonrec batch_get_commits_errors_list = batch_get_commits_error list [@@ocaml.doc ""]

type nonrec batch_get_commits_output = {
  errors : batch_get_commits_errors_list option;
      [@ocaml.doc
        "Returns any commit IDs for which information could not be found. For example, if one of \
         the commit IDs was a shortened SHA ID or that commit was not found in the specified \
         repository, the ID returns an error object with more information.\n"]
  commits : commit_objects_list option;
      [@ocaml.doc
        "An array of commit data type objects, each of which contains information about a \
         specified commit.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_commits_input = {
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the commits.\n"]
  commit_ids : commit_ids_input_list;
      [@ocaml.doc
        "The full commit IDs of the commits to get information about.\n\n\
        \  You must supply the full SHA IDs of each commit. You cannot use shortened SHA IDs.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec batch_disassociate_approval_rule_template_from_repositories_error = {
  error_message : error_message option;
      [@ocaml.doc
        "An error message that provides details about why the repository name was either not found \
         or not valid.\n"]
  error_code : error_code option;
      [@ocaml.doc
        "An error code that specifies whether the repository name was not valid or not found.\n"]
  repository_name : repository_name option;
      [@ocaml.doc
        "The name of the repository where the association with the template was not able to be \
         removed.\n"]
}
[@@ocaml.doc
  "Returns information about errors in a BatchDisassociateApprovalRuleTemplateFromRepositories \
   operation.\n"]

type nonrec batch_disassociate_approval_rule_template_from_repositories_errors_list =
  batch_disassociate_approval_rule_template_from_repositories_error list
[@@ocaml.doc ""]

type nonrec batch_disassociate_approval_rule_template_from_repositories_output = {
  errors : batch_disassociate_approval_rule_template_from_repositories_errors_list;
      [@ocaml.doc
        "A list of any errors that might have occurred while attempting to remove the association \
         between the template and the repositories.\n"]
  disassociated_repository_names : repository_name_list;
      [@ocaml.doc
        "A list of repository names that have had their association with the template removed.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_disassociate_approval_rule_template_from_repositories_input = {
  repository_names : repository_name_list;
      [@ocaml.doc
        "The repository names that you want to disassociate from the approval rule template.\n\n\
        \  The length constraint limit is for each string in the array. The array itself can be \
         empty.\n\
        \  \n\
        \   "]
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc
        "The name of the template that you want to disassociate from one or more repositories.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_describe_merge_conflicts_error = {
  message : message; [@ocaml.doc "The message provided by the exception.\n"]
  exception_name : exception_name; [@ocaml.doc "The name of the exception.\n"]
  file_path : path; [@ocaml.doc "The path to the file.\n"]
}
[@@ocaml.doc "Returns information about errors in a BatchDescribeMergeConflicts operation.\n"]

type nonrec batch_describe_merge_conflicts_errors = batch_describe_merge_conflicts_error list
[@@ocaml.doc ""]

type nonrec batch_describe_merge_conflicts_output = {
  base_commit_id : object_id option; [@ocaml.doc "The commit ID of the merge base.\n"]
  source_commit_id : object_id;
      [@ocaml.doc
        "The commit ID of the source commit specifier that was used in the merge evaluation.\n"]
  destination_commit_id : object_id;
      [@ocaml.doc
        "The commit ID of the destination commit specifier that was used in the merge evaluation.\n"]
  errors : batch_describe_merge_conflicts_errors option;
      [@ocaml.doc
        "A list of any errors returned while describing the merge conflicts for each file.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that can be used in a request to return the next batch of the results.\n"]
  conflicts : conflicts;
      [@ocaml.doc
        "A list of conflicts for each file, including the conflict metadata and the hunks of the \
         differences between the files.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_describe_merge_conflicts_input = {
  next_token : next_token option;
      [@ocaml.doc
        "An enumeration token that, when provided in a request, returns the next batch of the \
         results.\n"]
  conflict_resolution_strategy : conflict_resolution_strategy_type_enum option;
      [@ocaml.doc
        "Specifies which branch to use when resolving conflicts, or whether to attempt \
         automatically merging two versions of a file. The default is NONE, which requires any \
         conflicts to be resolved manually before the merge operation is successful.\n"]
  conflict_detail_level : conflict_detail_level_type_enum option;
      [@ocaml.doc
        "The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, \
         which returns a not-mergeable result if the same file has differences in both branches. \
         If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in \
         both branches has differences on the same line.\n"]
  file_paths : file_paths option;
      [@ocaml.doc
        "The path of the target files used to describe the conflicts. If not specified, the \
         default is all conflict files.\n"]
  max_conflict_files : max_results option;
      [@ocaml.doc "The maximum number of files to include in the output.\n"]
  max_merge_hunks : max_results option;
      [@ocaml.doc "The maximum number of merge hunks to include in the output.\n"]
  merge_option : merge_option_type_enum;
      [@ocaml.doc "The merge option or strategy you want to use to merge the code.\n"]
  source_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  destination_commit_specifier : commit_name;
      [@ocaml.doc
        "The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for \
         example, a branch name or a full commit ID).\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository that contains the merge conflicts you want to review.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_associate_approval_rule_template_with_repositories_error = {
  error_message : error_message option;
      [@ocaml.doc
        "An error message that provides details about why the repository name was not found or not \
         valid.\n"]
  error_code : error_code option;
      [@ocaml.doc
        "An error code that specifies whether the repository name was not valid or not found.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository where the association was not made.\n"]
}
[@@ocaml.doc
  "Returns information about errors in a BatchAssociateApprovalRuleTemplateWithRepositories \
   operation.\n"]

type nonrec batch_associate_approval_rule_template_with_repositories_errors_list =
  batch_associate_approval_rule_template_with_repositories_error list
[@@ocaml.doc ""]

type nonrec batch_associate_approval_rule_template_with_repositories_output = {
  errors : batch_associate_approval_rule_template_with_repositories_errors_list;
      [@ocaml.doc
        "A list of any errors that might have occurred while attempting to create the association \
         between the template and the repositories.\n"]
  associated_repository_names : repository_name_list;
      [@ocaml.doc
        "A list of names of the repositories that have been associated with the template.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_associate_approval_rule_template_with_repositories_input = {
  repository_names : repository_name_list;
      [@ocaml.doc
        "The names of the repositories you want to associate with the template.\n\n\
        \  The length constraint limit is for each string in the array. The array itself can be \
         empty.\n\
        \  \n\
        \   "]
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc "The name of the template you want to associate with one or more repositories.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_approval_rule_template_with_repository_input = {
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that you want to associate with the template.\n"]
  approval_rule_template_name : approval_rule_template_name;
      [@ocaml.doc "The name for the approval rule template. \n"]
}
[@@ocaml.doc ""]
