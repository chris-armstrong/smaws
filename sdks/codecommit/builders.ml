open Types

let make_approval ?user_arn:(user_arn_ : arn option)
    ?approval_state:(approval_state_ : approval_state option) () =
  ({ user_arn = user_arn_; approval_state = approval_state_ } : approval)

let make_origin_approval_rule_template
    ?approval_rule_template_id:(approval_rule_template_id_ : approval_rule_template_id option)
    ?approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name option)
    () =
  ({
     approval_rule_template_id = approval_rule_template_id_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : origin_approval_rule_template)

let make_approval_rule ?approval_rule_id:(approval_rule_id_ : approval_rule_id option)
    ?approval_rule_name:(approval_rule_name_ : approval_rule_name option)
    ?approval_rule_content:(approval_rule_content_ : approval_rule_content option)
    ?rule_content_sha256:(rule_content_sha256_ : rule_content_sha256 option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?creation_date:(creation_date_ : creation_date option)
    ?last_modified_user:(last_modified_user_ : arn option)
    ?origin_approval_rule_template:
      (origin_approval_rule_template_ : origin_approval_rule_template option) () =
  ({
     approval_rule_id = approval_rule_id_;
     approval_rule_name = approval_rule_name_;
     approval_rule_content = approval_rule_content_;
     rule_content_sha256 = rule_content_sha256_;
     last_modified_date = last_modified_date_;
     creation_date = creation_date_;
     last_modified_user = last_modified_user_;
     origin_approval_rule_template = origin_approval_rule_template_;
   }
    : approval_rule)

let make_approval_rule_event_metadata
    ?approval_rule_name:(approval_rule_name_ : approval_rule_name option)
    ?approval_rule_id:(approval_rule_id_ : approval_rule_id option)
    ?approval_rule_content:(approval_rule_content_ : approval_rule_content option) () =
  ({
     approval_rule_name = approval_rule_name_;
     approval_rule_id = approval_rule_id_;
     approval_rule_content = approval_rule_content_;
   }
    : approval_rule_event_metadata)

let make_approval_rule_overridden_event_metadata ?revision_id:(revision_id_ : revision_id option)
    ?override_status:(override_status_ : override_status option) () =
  ({ revision_id = revision_id_; override_status = override_status_ }
    : approval_rule_overridden_event_metadata)

let make_approval_rule_template
    ?approval_rule_template_id:(approval_rule_template_id_ : approval_rule_template_id option)
    ?approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name option)
    ?approval_rule_template_description:
      (approval_rule_template_description_ : approval_rule_template_description option)
    ?approval_rule_template_content:
      (approval_rule_template_content_ : approval_rule_template_content option)
    ?rule_content_sha256:(rule_content_sha256_ : rule_content_sha256 option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?creation_date:(creation_date_ : creation_date option)
    ?last_modified_user:(last_modified_user_ : arn option) () =
  ({
     approval_rule_template_id = approval_rule_template_id_;
     approval_rule_template_name = approval_rule_template_name_;
     approval_rule_template_description = approval_rule_template_description_;
     approval_rule_template_content = approval_rule_template_content_;
     rule_content_sha256 = rule_content_sha256_;
     last_modified_date = last_modified_date_;
     creation_date = creation_date_;
     last_modified_user = last_modified_user_;
   }
    : approval_rule_template)

let make_approval_state_changed_event_metadata ?revision_id:(revision_id_ : revision_id option)
    ?approval_status:(approval_status_ : approval_state option) () =
  ({ revision_id = revision_id_; approval_status = approval_status_ }
    : approval_state_changed_event_metadata)

let make_associate_approval_rule_template_with_repository_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     repository_name = repository_name_;
   }
    : associate_approval_rule_template_with_repository_input)

let make_batch_associate_approval_rule_template_with_repositories_error
    ?repository_name:(repository_name_ : repository_name option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ repository_name = repository_name_; error_code = error_code_; error_message = error_message_ }
    : batch_associate_approval_rule_template_with_repositories_error)

let make_batch_associate_approval_rule_template_with_repositories_output
    ~associated_repository_names:(associated_repository_names_ : repository_name_list)
    ~errors:(errors_ : batch_associate_approval_rule_template_with_repositories_errors_list) () =
  ({ associated_repository_names = associated_repository_names_; errors = errors_ }
    : batch_associate_approval_rule_template_with_repositories_output)

let make_batch_associate_approval_rule_template_with_repositories_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name)
    ~repository_names:(repository_names_ : repository_name_list) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     repository_names = repository_names_;
   }
    : batch_associate_approval_rule_template_with_repositories_input)

let make_batch_describe_merge_conflicts_error ~file_path:(file_path_ : path)
    ~exception_name:(exception_name_ : exception_name) ~message:(message_ : message) () =
  ({ file_path = file_path_; exception_name = exception_name_; message = message_ }
    : batch_describe_merge_conflicts_error)

let make_merge_hunk_detail ?start_line:(start_line_ : line_number option)
    ?end_line:(end_line_ : line_number option) ?hunk_content:(hunk_content_ : hunk_content option)
    () =
  ({ start_line = start_line_; end_line = end_line_; hunk_content = hunk_content_ }
    : merge_hunk_detail)

let make_merge_hunk ?is_conflict:(is_conflict_ : is_hunk_conflict option)
    ?source:(source_ : merge_hunk_detail option)
    ?destination:(destination_ : merge_hunk_detail option) ?base:(base_ : merge_hunk_detail option)
    () =
  ({ is_conflict = is_conflict_; source = source_; destination = destination_; base = base_ }
    : merge_hunk)

let make_merge_operations ?source:(source_ : change_type_enum option)
    ?destination:(destination_ : change_type_enum option) () =
  ({ source = source_; destination = destination_ } : merge_operations)

let make_is_binary_file ?source:(source_ : capital_boolean option)
    ?destination:(destination_ : capital_boolean option) ?base:(base_ : capital_boolean option) () =
  ({ source = source_; destination = destination_; base = base_ } : is_binary_file)

let make_object_types ?source:(source_ : object_type_enum option)
    ?destination:(destination_ : object_type_enum option) ?base:(base_ : object_type_enum option) ()
    =
  ({ source = source_; destination = destination_; base = base_ } : object_types)

let make_file_modes ?source:(source_ : file_mode_type_enum option)
    ?destination:(destination_ : file_mode_type_enum option)
    ?base:(base_ : file_mode_type_enum option) () =
  ({ source = source_; destination = destination_; base = base_ } : file_modes)

let make_file_sizes ?source:(source_ : file_size option)
    ?destination:(destination_ : file_size option) ?base:(base_ : file_size option) () =
  ({ source = source_; destination = destination_; base = base_ } : file_sizes)

let make_conflict_metadata ?file_path:(file_path_ : path option)
    ?file_sizes:(file_sizes_ : file_sizes option) ?file_modes:(file_modes_ : file_modes option)
    ?object_types:(object_types_ : object_types option)
    ?number_of_conflicts:(number_of_conflicts_ : number_of_conflicts option)
    ?is_binary_file:(is_binary_file_ : is_binary_file option)
    ?content_conflict:(content_conflict_ : is_content_conflict option)
    ?file_mode_conflict:(file_mode_conflict_ : is_file_mode_conflict option)
    ?object_type_conflict:(object_type_conflict_ : is_object_type_conflict option)
    ?merge_operations:(merge_operations_ : merge_operations option) () =
  ({
     file_path = file_path_;
     file_sizes = file_sizes_;
     file_modes = file_modes_;
     object_types = object_types_;
     number_of_conflicts = number_of_conflicts_;
     is_binary_file = is_binary_file_;
     content_conflict = content_conflict_;
     file_mode_conflict = file_mode_conflict_;
     object_type_conflict = object_type_conflict_;
     merge_operations = merge_operations_;
   }
    : conflict_metadata)

let make_conflict ?conflict_metadata:(conflict_metadata_ : conflict_metadata option)
    ?merge_hunks:(merge_hunks_ : merge_hunks option) () =
  ({ conflict_metadata = conflict_metadata_; merge_hunks = merge_hunks_ } : conflict)

let make_batch_describe_merge_conflicts_output ?next_token:(next_token_ : next_token option)
    ?errors:(errors_ : batch_describe_merge_conflicts_errors option)
    ?base_commit_id:(base_commit_id_ : object_id option) ~conflicts:(conflicts_ : conflicts)
    ~destination_commit_id:(destination_commit_id_ : object_id)
    ~source_commit_id:(source_commit_id_ : object_id) () =
  ({
     conflicts = conflicts_;
     next_token = next_token_;
     errors = errors_;
     destination_commit_id = destination_commit_id_;
     source_commit_id = source_commit_id_;
     base_commit_id = base_commit_id_;
   }
    : batch_describe_merge_conflicts_output)

let make_batch_describe_merge_conflicts_input
    ?max_merge_hunks:(max_merge_hunks_ : max_results option)
    ?max_conflict_files:(max_conflict_files_ : max_results option)
    ?file_paths:(file_paths_ : file_paths option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?next_token:(next_token_ : next_token option)
    ~repository_name:(repository_name_ : repository_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~merge_option:(merge_option_ : merge_option_type_enum) () =
  ({
     repository_name = repository_name_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     merge_option = merge_option_;
     max_merge_hunks = max_merge_hunks_;
     max_conflict_files = max_conflict_files_;
     file_paths = file_paths_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     next_token = next_token_;
   }
    : batch_describe_merge_conflicts_input)

let make_batch_disassociate_approval_rule_template_from_repositories_error
    ?repository_name:(repository_name_ : repository_name option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ repository_name = repository_name_; error_code = error_code_; error_message = error_message_ }
    : batch_disassociate_approval_rule_template_from_repositories_error)

let make_batch_disassociate_approval_rule_template_from_repositories_output
    ~disassociated_repository_names:(disassociated_repository_names_ : repository_name_list)
    ~errors:(errors_ : batch_disassociate_approval_rule_template_from_repositories_errors_list) () =
  ({ disassociated_repository_names = disassociated_repository_names_; errors = errors_ }
    : batch_disassociate_approval_rule_template_from_repositories_output)

let make_batch_disassociate_approval_rule_template_from_repositories_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name)
    ~repository_names:(repository_names_ : repository_name_list) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     repository_names = repository_names_;
   }
    : batch_disassociate_approval_rule_template_from_repositories_input)

let make_batch_get_commits_error ?commit_id:(commit_id_ : object_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ commit_id = commit_id_; error_code = error_code_; error_message = error_message_ }
    : batch_get_commits_error)

let make_user_info ?name:(name_ : name option) ?email:(email_ : email option)
    ?date:(date_ : date option) () =
  ({ name = name_; email = email_; date = date_ } : user_info)

let make_commit ?commit_id:(commit_id_ : object_id option) ?tree_id:(tree_id_ : object_id option)
    ?parents:(parents_ : parent_list option) ?message:(message_ : message option)
    ?author:(author_ : user_info option) ?committer:(committer_ : user_info option)
    ?additional_data:(additional_data_ : additional_data option) () =
  ({
     commit_id = commit_id_;
     tree_id = tree_id_;
     parents = parents_;
     message = message_;
     author = author_;
     committer = committer_;
     additional_data = additional_data_;
   }
    : commit)

let make_batch_get_commits_output ?commits:(commits_ : commit_objects_list option)
    ?errors:(errors_ : batch_get_commits_errors_list option) () =
  ({ commits = commits_; errors = errors_ } : batch_get_commits_output)

let make_batch_get_commits_input ~commit_ids:(commit_ids_ : commit_ids_input_list)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ commit_ids = commit_ids_; repository_name = repository_name_ } : batch_get_commits_input)

let make_batch_get_repositories_error ?repository_id:(repository_id_ : repository_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?error_code:(error_code_ : batch_get_repositories_error_code_enum option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     repository_id = repository_id_;
     repository_name = repository_name_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : batch_get_repositories_error)

let make_repository_metadata ?account_id:(account_id_ : account_id option)
    ?repository_id:(repository_id_ : repository_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?repository_description:(repository_description_ : repository_description option)
    ?default_branch:(default_branch_ : branch_name option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?creation_date:(creation_date_ : creation_date option)
    ?clone_url_http:(clone_url_http_ : clone_url_http option)
    ?clone_url_ssh:(clone_url_ssh_ : clone_url_ssh option) ?arn:(arn_ : arn option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({
     account_id = account_id_;
     repository_id = repository_id_;
     repository_name = repository_name_;
     repository_description = repository_description_;
     default_branch = default_branch_;
     last_modified_date = last_modified_date_;
     creation_date = creation_date_;
     clone_url_http = clone_url_http_;
     clone_url_ssh = clone_url_ssh_;
     arn = arn_;
     kms_key_id = kms_key_id_;
   }
    : repository_metadata)

let make_batch_get_repositories_output
    ?repositories:(repositories_ : repository_metadata_list option)
    ?repositories_not_found:(repositories_not_found_ : repository_not_found_list option)
    ?errors:(errors_ : batch_get_repositories_errors_list option) () =
  ({
     repositories = repositories_;
     repositories_not_found = repositories_not_found_;
     errors = errors_;
   }
    : batch_get_repositories_output)

let make_batch_get_repositories_input ~repository_names:(repository_names_ : repository_name_list)
    () =
  ({ repository_names = repository_names_ } : batch_get_repositories_input)

let make_blob_metadata ?blob_id:(blob_id_ : object_id option) ?path:(path_ : path option)
    ?mode:(mode_ : mode option) () =
  ({ blob_id = blob_id_; path = path_; mode = mode_ } : blob_metadata)

let make_branch_info ?branch_name:(branch_name_ : branch_name option)
    ?commit_id:(commit_id_ : commit_id option) () =
  ({ branch_name = branch_name_; commit_id = commit_id_ } : branch_info)

let make_update_repository_name_input ~old_name:(old_name_ : repository_name)
    ~new_name:(new_name_ : repository_name) () =
  ({ old_name = old_name_; new_name = new_name_ } : update_repository_name_input)

let make_update_repository_encryption_key_output
    ?repository_id:(repository_id_ : repository_id option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?original_kms_key_id:(original_kms_key_id_ : kms_key_id option) () =
  ({
     repository_id = repository_id_;
     kms_key_id = kms_key_id_;
     original_kms_key_id = original_kms_key_id_;
   }
    : update_repository_encryption_key_output)

let make_update_repository_encryption_key_input
    ~repository_name:(repository_name_ : repository_name) ~kms_key_id:(kms_key_id_ : kms_key_id) ()
    =
  ({ repository_name = repository_name_; kms_key_id = kms_key_id_ }
    : update_repository_encryption_key_input)

let make_update_repository_description_input
    ?repository_description:(repository_description_ : repository_description option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; repository_description = repository_description_ }
    : update_repository_description_input)

let make_merge_metadata ?is_merged:(is_merged_ : is_merged option)
    ?merged_by:(merged_by_ : arn option) ?merge_commit_id:(merge_commit_id_ : commit_id option)
    ?merge_option:(merge_option_ : merge_option_type_enum option) () =
  ({
     is_merged = is_merged_;
     merged_by = merged_by_;
     merge_commit_id = merge_commit_id_;
     merge_option = merge_option_;
   }
    : merge_metadata)

let make_pull_request_target ?repository_name:(repository_name_ : repository_name option)
    ?source_reference:(source_reference_ : reference_name option)
    ?destination_reference:(destination_reference_ : reference_name option)
    ?destination_commit:(destination_commit_ : commit_id option)
    ?source_commit:(source_commit_ : commit_id option) ?merge_base:(merge_base_ : commit_id option)
    ?merge_metadata:(merge_metadata_ : merge_metadata option) () =
  ({
     repository_name = repository_name_;
     source_reference = source_reference_;
     destination_reference = destination_reference_;
     destination_commit = destination_commit_;
     source_commit = source_commit_;
     merge_base = merge_base_;
     merge_metadata = merge_metadata_;
   }
    : pull_request_target)

let make_pull_request ?pull_request_id:(pull_request_id_ : pull_request_id option)
    ?title:(title_ : title option) ?description:(description_ : description option)
    ?last_activity_date:(last_activity_date_ : last_modified_date option)
    ?creation_date:(creation_date_ : creation_date option)
    ?pull_request_status:(pull_request_status_ : pull_request_status_enum option)
    ?author_arn:(author_arn_ : arn option)
    ?pull_request_targets:(pull_request_targets_ : pull_request_target_list option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?revision_id:(revision_id_ : revision_id option)
    ?approval_rules:(approval_rules_ : approval_rules_list option) () =
  ({
     pull_request_id = pull_request_id_;
     title = title_;
     description = description_;
     last_activity_date = last_activity_date_;
     creation_date = creation_date_;
     pull_request_status = pull_request_status_;
     author_arn = author_arn_;
     pull_request_targets = pull_request_targets_;
     client_request_token = client_request_token_;
     revision_id = revision_id_;
     approval_rules = approval_rules_;
   }
    : pull_request)

let make_update_pull_request_title_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : update_pull_request_title_output)

let make_update_pull_request_title_input ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~title:(title_ : title) () =
  ({ pull_request_id = pull_request_id_; title = title_ } : update_pull_request_title_input)

let make_update_pull_request_status_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : update_pull_request_status_output)

let make_update_pull_request_status_input ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~pull_request_status:(pull_request_status_ : pull_request_status_enum) () =
  ({ pull_request_id = pull_request_id_; pull_request_status = pull_request_status_ }
    : update_pull_request_status_input)

let make_update_pull_request_description_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : update_pull_request_description_output)

let make_update_pull_request_description_input ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~description:(description_ : description) () =
  ({ pull_request_id = pull_request_id_; description = description_ }
    : update_pull_request_description_input)

let make_update_pull_request_approval_state_input
    ~pull_request_id:(pull_request_id_ : pull_request_id) ~revision_id:(revision_id_ : revision_id)
    ~approval_state:(approval_state_ : approval_state) () =
  ({
     pull_request_id = pull_request_id_;
     revision_id = revision_id_;
     approval_state = approval_state_;
   }
    : update_pull_request_approval_state_input)

let make_update_pull_request_approval_rule_content_output
    ~approval_rule:(approval_rule_ : approval_rule) () =
  ({ approval_rule = approval_rule_ } : update_pull_request_approval_rule_content_output)

let make_update_pull_request_approval_rule_content_input
    ?existing_rule_content_sha256:(existing_rule_content_sha256_ : rule_content_sha256 option)
    ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~approval_rule_name:(approval_rule_name_ : approval_rule_name)
    ~new_rule_content:(new_rule_content_ : approval_rule_content) () =
  ({
     pull_request_id = pull_request_id_;
     approval_rule_name = approval_rule_name_;
     existing_rule_content_sha256 = existing_rule_content_sha256_;
     new_rule_content = new_rule_content_;
   }
    : update_pull_request_approval_rule_content_input)

let make_update_default_branch_input ~repository_name:(repository_name_ : repository_name)
    ~default_branch_name:(default_branch_name_ : branch_name) () =
  ({ repository_name = repository_name_; default_branch_name = default_branch_name_ }
    : update_default_branch_input)

let make_comment ?comment_id:(comment_id_ : comment_id option) ?content:(content_ : content option)
    ?in_reply_to:(in_reply_to_ : comment_id option)
    ?creation_date:(creation_date_ : creation_date option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?author_arn:(author_arn_ : arn option) ?deleted:(deleted_ : is_comment_deleted option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?caller_reactions:(caller_reactions_ : caller_reactions option)
    ?reaction_counts:(reaction_counts_ : reaction_counts_map option) () =
  ({
     comment_id = comment_id_;
     content = content_;
     in_reply_to = in_reply_to_;
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     author_arn = author_arn_;
     deleted = deleted_;
     client_request_token = client_request_token_;
     caller_reactions = caller_reactions_;
     reaction_counts = reaction_counts_;
   }
    : comment)

let make_update_comment_output ?comment:(comment_ : comment option) () =
  ({ comment = comment_ } : update_comment_output)

let make_update_comment_input ~comment_id:(comment_id_ : comment_id) ~content:(content_ : content)
    () =
  ({ comment_id = comment_id_; content = content_ } : update_comment_input)

let make_update_approval_rule_template_name_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ } : update_approval_rule_template_name_output)

let make_update_approval_rule_template_name_input
    ~old_approval_rule_template_name:
      (old_approval_rule_template_name_ : approval_rule_template_name)
    ~new_approval_rule_template_name:
      (new_approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     old_approval_rule_template_name = old_approval_rule_template_name_;
     new_approval_rule_template_name = new_approval_rule_template_name_;
   }
    : update_approval_rule_template_name_input)

let make_update_approval_rule_template_description_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ }
    : update_approval_rule_template_description_output)

let make_update_approval_rule_template_description_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name)
    ~approval_rule_template_description:
      (approval_rule_template_description_ : approval_rule_template_description) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     approval_rule_template_description = approval_rule_template_description_;
   }
    : update_approval_rule_template_description_input)

let make_update_approval_rule_template_content_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ }
    : update_approval_rule_template_content_output)

let make_update_approval_rule_template_content_input
    ?existing_rule_content_sha256:(existing_rule_content_sha256_ : rule_content_sha256 option)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name)
    ~new_rule_content:(new_rule_content_ : approval_rule_template_content) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     new_rule_content = new_rule_content_;
     existing_rule_content_sha256 = existing_rule_content_sha256_;
   }
    : update_approval_rule_template_content_input)

let make_untag_resource_input ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_keys_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_repository_trigger_execution_failure ?trigger:(trigger_ : repository_trigger_name option)
    ?failure_message:(failure_message_ : repository_trigger_execution_failure_message option) () =
  ({ trigger = trigger_; failure_message = failure_message_ }
    : repository_trigger_execution_failure)

let make_test_repository_triggers_output
    ?successful_executions:(successful_executions_ : repository_trigger_name_list option)
    ?failed_executions:(failed_executions_ : repository_trigger_execution_failure_list option) () =
  ({ successful_executions = successful_executions_; failed_executions = failed_executions_ }
    : test_repository_triggers_output)

let make_repository_trigger ?custom_data:(custom_data_ : repository_trigger_custom_data option)
    ?branches:(branches_ : branch_name_list option) ~name:(name_ : repository_trigger_name)
    ~destination_arn:(destination_arn_ : arn) ~events:(events_ : repository_trigger_event_list) () =
  ({
     name = name_;
     destination_arn = destination_arn_;
     custom_data = custom_data_;
     branches = branches_;
     events = events_;
   }
    : repository_trigger)

let make_test_repository_triggers_input ~repository_name:(repository_name_ : repository_name)
    ~triggers:(triggers_ : repository_triggers_list) () =
  ({ repository_name = repository_name_; triggers = triggers_ } : test_repository_triggers_input)

let make_tag_resource_input ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tags_map) ()
    =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_put_repository_triggers_output
    ?configuration_id:(configuration_id_ : repository_triggers_configuration_id option) () =
  ({ configuration_id = configuration_id_ } : put_repository_triggers_output)

let make_put_repository_triggers_input ~repository_name:(repository_name_ : repository_name)
    ~triggers:(triggers_ : repository_triggers_list) () =
  ({ repository_name = repository_name_; triggers = triggers_ } : put_repository_triggers_input)

let make_put_file_output ~commit_id:(commit_id_ : object_id) ~blob_id:(blob_id_ : object_id)
    ~tree_id:(tree_id_ : object_id) () =
  ({ commit_id = commit_id_; blob_id = blob_id_; tree_id = tree_id_ } : put_file_output)

let make_put_file_input ?file_mode:(file_mode_ : file_mode_type_enum option)
    ?parent_commit_id:(parent_commit_id_ : commit_id option)
    ?commit_message:(commit_message_ : message option) ?name:(name_ : name option)
    ?email:(email_ : email option) ~repository_name:(repository_name_ : repository_name)
    ~branch_name:(branch_name_ : branch_name) ~file_content:(file_content_ : file_content)
    ~file_path:(file_path_ : path) () =
  ({
     repository_name = repository_name_;
     branch_name = branch_name_;
     file_content = file_content_;
     file_path = file_path_;
     file_mode = file_mode_;
     parent_commit_id = parent_commit_id_;
     commit_message = commit_message_;
     name = name_;
     email = email_;
   }
    : put_file_input)

let make_put_comment_reaction_input ~comment_id:(comment_id_ : comment_id)
    ~reaction_value:(reaction_value_ : reaction_value) () =
  ({ comment_id = comment_id_; reaction_value = reaction_value_ } : put_comment_reaction_input)

let make_post_comment_reply_output ?comment:(comment_ : comment option) () =
  ({ comment = comment_ } : post_comment_reply_output)

let make_post_comment_reply_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~in_reply_to:(in_reply_to_ : comment_id) ~content:(content_ : content) () =
  ({ in_reply_to = in_reply_to_; client_request_token = client_request_token_; content = content_ }
    : post_comment_reply_input)

let make_location ?file_path:(file_path_ : path option)
    ?file_position:(file_position_ : position option)
    ?relative_file_version:(relative_file_version_ : relative_file_version_enum option) () =
  ({
     file_path = file_path_;
     file_position = file_position_;
     relative_file_version = relative_file_version_;
   }
    : location)

let make_post_comment_for_pull_request_output
    ?repository_name:(repository_name_ : repository_name option)
    ?pull_request_id:(pull_request_id_ : pull_request_id option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_blob_id:(before_blob_id_ : object_id option)
    ?after_blob_id:(after_blob_id_ : object_id option) ?location:(location_ : location option)
    ?comment:(comment_ : comment option) () =
  ({
     repository_name = repository_name_;
     pull_request_id = pull_request_id_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     before_blob_id = before_blob_id_;
     after_blob_id = after_blob_id_;
     location = location_;
     comment = comment_;
   }
    : post_comment_for_pull_request_output)

let make_post_comment_for_pull_request_input ?location:(location_ : location option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~repository_name:(repository_name_ : repository_name)
    ~before_commit_id:(before_commit_id_ : commit_id)
    ~after_commit_id:(after_commit_id_ : commit_id) ~content:(content_ : content) () =
  ({
     pull_request_id = pull_request_id_;
     repository_name = repository_name_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     location = location_;
     content = content_;
     client_request_token = client_request_token_;
   }
    : post_comment_for_pull_request_input)

let make_post_comment_for_compared_commit_output
    ?repository_name:(repository_name_ : repository_name option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_blob_id:(before_blob_id_ : object_id option)
    ?after_blob_id:(after_blob_id_ : object_id option) ?location:(location_ : location option)
    ?comment:(comment_ : comment option) () =
  ({
     repository_name = repository_name_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     before_blob_id = before_blob_id_;
     after_blob_id = after_blob_id_;
     location = location_;
     comment = comment_;
   }
    : post_comment_for_compared_commit_output)

let make_post_comment_for_compared_commit_input
    ?before_commit_id:(before_commit_id_ : commit_id option) ?location:(location_ : location option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~repository_name:(repository_name_ : repository_name)
    ~after_commit_id:(after_commit_id_ : commit_id) ~content:(content_ : content) () =
  ({
     repository_name = repository_name_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     location = location_;
     content = content_;
     client_request_token = client_request_token_;
   }
    : post_comment_for_compared_commit_input)

let make_override_pull_request_approval_rules_input
    ~pull_request_id:(pull_request_id_ : pull_request_id) ~revision_id:(revision_id_ : revision_id)
    ~override_status:(override_status_ : override_status) () =
  ({
     pull_request_id = pull_request_id_;
     revision_id = revision_id_;
     override_status = override_status_;
   }
    : override_pull_request_approval_rules_input)

let make_merge_pull_request_by_three_way_output ?pull_request:(pull_request_ : pull_request option)
    () =
  ({ pull_request = pull_request_ } : merge_pull_request_by_three_way_output)

let make_set_file_mode_entry ~file_path:(file_path_ : path)
    ~file_mode:(file_mode_ : file_mode_type_enum) () =
  ({ file_path = file_path_; file_mode = file_mode_ } : set_file_mode_entry)

let make_delete_file_entry ~file_path:(file_path_ : path) () =
  ({ file_path = file_path_ } : delete_file_entry)

let make_replace_content_entry ?content:(content_ : file_content option)
    ?file_mode:(file_mode_ : file_mode_type_enum option) ~file_path:(file_path_ : path)
    ~replacement_type:(replacement_type_ : replacement_type_enum) () =
  ({
     file_path = file_path_;
     replacement_type = replacement_type_;
     content = content_;
     file_mode = file_mode_;
   }
    : replace_content_entry)

let make_conflict_resolution ?replace_contents:(replace_contents_ : replace_content_entries option)
    ?delete_files:(delete_files_ : delete_file_entries option)
    ?set_file_modes:(set_file_modes_ : set_file_mode_entries option) () =
  ({
     replace_contents = replace_contents_;
     delete_files = delete_files_;
     set_file_modes = set_file_modes_;
   }
    : conflict_resolution)

let make_merge_pull_request_by_three_way_input
    ?source_commit_id:(source_commit_id_ : object_id option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?commit_message:(commit_message_ : message option) ?author_name:(author_name_ : name option)
    ?email:(email_ : email option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     pull_request_id = pull_request_id_;
     repository_name = repository_name_;
     source_commit_id = source_commit_id_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     commit_message = commit_message_;
     author_name = author_name_;
     email = email_;
     keep_empty_folders = keep_empty_folders_;
     conflict_resolution = conflict_resolution_;
   }
    : merge_pull_request_by_three_way_input)

let make_merge_pull_request_by_squash_output ?pull_request:(pull_request_ : pull_request option) ()
    =
  ({ pull_request = pull_request_ } : merge_pull_request_by_squash_output)

let make_merge_pull_request_by_squash_input ?source_commit_id:(source_commit_id_ : object_id option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?commit_message:(commit_message_ : message option) ?author_name:(author_name_ : name option)
    ?email:(email_ : email option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     pull_request_id = pull_request_id_;
     repository_name = repository_name_;
     source_commit_id = source_commit_id_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     commit_message = commit_message_;
     author_name = author_name_;
     email = email_;
     keep_empty_folders = keep_empty_folders_;
     conflict_resolution = conflict_resolution_;
   }
    : merge_pull_request_by_squash_input)

let make_merge_pull_request_by_fast_forward_output
    ?pull_request:(pull_request_ : pull_request option) () =
  ({ pull_request = pull_request_ } : merge_pull_request_by_fast_forward_output)

let make_merge_pull_request_by_fast_forward_input
    ?source_commit_id:(source_commit_id_ : object_id option)
    ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     pull_request_id = pull_request_id_;
     repository_name = repository_name_;
     source_commit_id = source_commit_id_;
   }
    : merge_pull_request_by_fast_forward_input)

let make_merge_branches_by_three_way_output ?commit_id:(commit_id_ : object_id option)
    ?tree_id:(tree_id_ : object_id option) () =
  ({ commit_id = commit_id_; tree_id = tree_id_ } : merge_branches_by_three_way_output)

let make_merge_branches_by_three_way_input ?target_branch:(target_branch_ : branch_name option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?author_name:(author_name_ : name option) ?email:(email_ : email option)
    ?commit_message:(commit_message_ : message option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ~repository_name:(repository_name_ : repository_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name) () =
  ({
     repository_name = repository_name_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     target_branch = target_branch_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     author_name = author_name_;
     email = email_;
     commit_message = commit_message_;
     keep_empty_folders = keep_empty_folders_;
     conflict_resolution = conflict_resolution_;
   }
    : merge_branches_by_three_way_input)

let make_merge_branches_by_squash_output ?commit_id:(commit_id_ : object_id option)
    ?tree_id:(tree_id_ : object_id option) () =
  ({ commit_id = commit_id_; tree_id = tree_id_ } : merge_branches_by_squash_output)

let make_merge_branches_by_squash_input ?target_branch:(target_branch_ : branch_name option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?author_name:(author_name_ : name option) ?email:(email_ : email option)
    ?commit_message:(commit_message_ : message option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ~repository_name:(repository_name_ : repository_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name) () =
  ({
     repository_name = repository_name_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     target_branch = target_branch_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     author_name = author_name_;
     email = email_;
     commit_message = commit_message_;
     keep_empty_folders = keep_empty_folders_;
     conflict_resolution = conflict_resolution_;
   }
    : merge_branches_by_squash_input)

let make_merge_branches_by_fast_forward_output ?commit_id:(commit_id_ : object_id option)
    ?tree_id:(tree_id_ : object_id option) () =
  ({ commit_id = commit_id_; tree_id = tree_id_ } : merge_branches_by_fast_forward_output)

let make_merge_branches_by_fast_forward_input ?target_branch:(target_branch_ : branch_name option)
    ~repository_name:(repository_name_ : repository_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name) () =
  ({
     repository_name = repository_name_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     target_branch = target_branch_;
   }
    : merge_branches_by_fast_forward_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tags_map option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?next_token:(next_token_ : next_token option)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_; next_token = next_token_ } : list_tags_for_resource_input)

let make_list_repositories_for_approval_rule_template_output
    ?repository_names:(repository_names_ : repository_name_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ repository_names = repository_names_; next_token = next_token_ }
    : list_repositories_for_approval_rule_template_output)

let make_list_repositories_for_approval_rule_template_input
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_repositories_for_approval_rule_template_input)

let make_repository_name_id_pair ?repository_name:(repository_name_ : repository_name option)
    ?repository_id:(repository_id_ : repository_id option) () =
  ({ repository_name = repository_name_; repository_id = repository_id_ } : repository_name_id_pair)

let make_list_repositories_output
    ?repositories:(repositories_ : repository_name_id_pair_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ repositories = repositories_; next_token = next_token_ } : list_repositories_output)

let make_list_repositories_input ?next_token:(next_token_ : next_token option)
    ?sort_by:(sort_by_ : sort_by_enum option) ?order:(order_ : order_enum option) () =
  ({ next_token = next_token_; sort_by = sort_by_; order = order_ } : list_repositories_input)

let make_list_pull_requests_output ?next_token:(next_token_ : next_token option)
    ~pull_request_ids:(pull_request_ids_ : pull_request_id_list) () =
  ({ pull_request_ids = pull_request_ids_; next_token = next_token_ } : list_pull_requests_output)

let make_list_pull_requests_input ?author_arn:(author_arn_ : arn option)
    ?pull_request_status:(pull_request_status_ : pull_request_status_enum option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     repository_name = repository_name_;
     author_arn = author_arn_;
     pull_request_status = pull_request_status_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_pull_requests_input)

let make_file_version ?commit:(commit_ : commit option) ?blob_id:(blob_id_ : object_id option)
    ?path:(path_ : path option) ?revision_children:(revision_children_ : revision_children option)
    () =
  ({ commit = commit_; blob_id = blob_id_; path = path_; revision_children = revision_children_ }
    : file_version)

let make_list_file_commit_history_response ?next_token:(next_token_ : next_token option)
    ~revision_dag:(revision_dag_ : revision_dag) () =
  ({ revision_dag = revision_dag_; next_token = next_token_ } : list_file_commit_history_response)

let make_list_file_commit_history_request ?commit_specifier:(commit_specifier_ : commit_name option)
    ?max_results:(max_results_ : limit option) ?next_token:(next_token_ : next_token option)
    ~repository_name:(repository_name_ : repository_name) ~file_path:(file_path_ : path) () =
  ({
     repository_name = repository_name_;
     commit_specifier = commit_specifier_;
     file_path = file_path_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_file_commit_history_request)

let make_list_branches_output ?branches:(branches_ : branch_name_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ branches = branches_; next_token = next_token_ } : list_branches_output)

let make_list_branches_input ?next_token:(next_token_ : next_token option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; next_token = next_token_ } : list_branches_input)

let make_list_associated_approval_rule_templates_for_repository_output
    ?approval_rule_template_names:
      (approval_rule_template_names_ : approval_rule_template_name_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ approval_rule_template_names = approval_rule_template_names_; next_token = next_token_ }
    : list_associated_approval_rule_templates_for_repository_output)

let make_list_associated_approval_rule_templates_for_repository_input
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; next_token = next_token_; max_results = max_results_ }
    : list_associated_approval_rule_templates_for_repository_input)

let make_list_approval_rule_templates_output
    ?approval_rule_template_names:
      (approval_rule_template_names_ : approval_rule_template_name_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ approval_rule_template_names = approval_rule_template_names_; next_token = next_token_ }
    : list_approval_rule_templates_output)

let make_list_approval_rule_templates_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_approval_rule_templates_input)

let make_get_repository_triggers_output
    ?configuration_id:(configuration_id_ : repository_triggers_configuration_id option)
    ?triggers:(triggers_ : repository_triggers_list option) () =
  ({ configuration_id = configuration_id_; triggers = triggers_ } : get_repository_triggers_output)

let make_get_repository_triggers_input ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_ } : get_repository_triggers_input)

let make_get_repository_output
    ?repository_metadata:(repository_metadata_ : repository_metadata option) () =
  ({ repository_metadata = repository_metadata_ } : get_repository_output)

let make_get_repository_input ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_ } : get_repository_input)

let make_get_pull_request_override_state_output ?overridden:(overridden_ : overridden option)
    ?overrider:(overrider_ : arn option) () =
  ({ overridden = overridden_; overrider = overrider_ } : get_pull_request_override_state_output)

let make_get_pull_request_override_state_input ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~revision_id:(revision_id_ : revision_id) () =
  ({ pull_request_id = pull_request_id_; revision_id = revision_id_ }
    : get_pull_request_override_state_input)

let make_get_pull_request_approval_states_output ?approvals:(approvals_ : approval_list option) () =
  ({ approvals = approvals_ } : get_pull_request_approval_states_output)

let make_get_pull_request_approval_states_input
    ~pull_request_id:(pull_request_id_ : pull_request_id) ~revision_id:(revision_id_ : revision_id)
    () =
  ({ pull_request_id = pull_request_id_; revision_id = revision_id_ }
    : get_pull_request_approval_states_input)

let make_get_pull_request_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : get_pull_request_output)

let make_get_pull_request_input ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ pull_request_id = pull_request_id_ } : get_pull_request_input)

let make_get_merge_options_output ~merge_options:(merge_options_ : merge_options)
    ~source_commit_id:(source_commit_id_ : object_id)
    ~destination_commit_id:(destination_commit_id_ : object_id)
    ~base_commit_id:(base_commit_id_ : object_id) () =
  ({
     merge_options = merge_options_;
     source_commit_id = source_commit_id_;
     destination_commit_id = destination_commit_id_;
     base_commit_id = base_commit_id_;
   }
    : get_merge_options_output)

let make_get_merge_options_input
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ~repository_name:(repository_name_ : repository_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name) () =
  ({
     repository_name = repository_name_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
   }
    : get_merge_options_input)

let make_get_merge_conflicts_output ?base_commit_id:(base_commit_id_ : object_id option)
    ?next_token:(next_token_ : next_token option) ~mergeable:(mergeable_ : is_mergeable)
    ~destination_commit_id:(destination_commit_id_ : object_id)
    ~source_commit_id:(source_commit_id_ : object_id)
    ~conflict_metadata_list:(conflict_metadata_list_ : conflict_metadata_list) () =
  ({
     mergeable = mergeable_;
     destination_commit_id = destination_commit_id_;
     source_commit_id = source_commit_id_;
     base_commit_id = base_commit_id_;
     conflict_metadata_list = conflict_metadata_list_;
     next_token = next_token_;
   }
    : get_merge_conflicts_output)

let make_get_merge_conflicts_input
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?max_conflict_files:(max_conflict_files_ : max_results option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?next_token:(next_token_ : next_token option)
    ~repository_name:(repository_name_ : repository_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~merge_option:(merge_option_ : merge_option_type_enum) () =
  ({
     repository_name = repository_name_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     merge_option = merge_option_;
     conflict_detail_level = conflict_detail_level_;
     max_conflict_files = max_conflict_files_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     next_token = next_token_;
   }
    : get_merge_conflicts_input)

let make_get_merge_commit_output ?source_commit_id:(source_commit_id_ : object_id option)
    ?destination_commit_id:(destination_commit_id_ : object_id option)
    ?base_commit_id:(base_commit_id_ : object_id option)
    ?merged_commit_id:(merged_commit_id_ : object_id option) () =
  ({
     source_commit_id = source_commit_id_;
     destination_commit_id = destination_commit_id_;
     base_commit_id = base_commit_id_;
     merged_commit_id = merged_commit_id_;
   }
    : get_merge_commit_output)

let make_get_merge_commit_input
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ~repository_name:(repository_name_ : repository_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name) () =
  ({
     repository_name = repository_name_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
   }
    : get_merge_commit_input)

let make_sub_module ?commit_id:(commit_id_ : object_id option)
    ?absolute_path:(absolute_path_ : path option) ?relative_path:(relative_path_ : path option) () =
  ({ commit_id = commit_id_; absolute_path = absolute_path_; relative_path = relative_path_ }
    : sub_module)

let make_symbolic_link ?blob_id:(blob_id_ : object_id option)
    ?absolute_path:(absolute_path_ : path option) ?relative_path:(relative_path_ : path option)
    ?file_mode:(file_mode_ : file_mode_type_enum option) () =
  ({
     blob_id = blob_id_;
     absolute_path = absolute_path_;
     relative_path = relative_path_;
     file_mode = file_mode_;
   }
    : symbolic_link)

let make_file ?blob_id:(blob_id_ : object_id option) ?absolute_path:(absolute_path_ : path option)
    ?relative_path:(relative_path_ : path option)
    ?file_mode:(file_mode_ : file_mode_type_enum option) () =
  ({
     blob_id = blob_id_;
     absolute_path = absolute_path_;
     relative_path = relative_path_;
     file_mode = file_mode_;
   }
    : file)

let make_folder ?tree_id:(tree_id_ : object_id option) ?absolute_path:(absolute_path_ : path option)
    ?relative_path:(relative_path_ : path option) () =
  ({ tree_id = tree_id_; absolute_path = absolute_path_; relative_path = relative_path_ } : folder)

let make_get_folder_output ?tree_id:(tree_id_ : object_id option)
    ?sub_folders:(sub_folders_ : folder_list option) ?files:(files_ : file_list option)
    ?symbolic_links:(symbolic_links_ : symbolic_link_list option)
    ?sub_modules:(sub_modules_ : sub_module_list option) ~commit_id:(commit_id_ : object_id)
    ~folder_path:(folder_path_ : path) () =
  ({
     commit_id = commit_id_;
     folder_path = folder_path_;
     tree_id = tree_id_;
     sub_folders = sub_folders_;
     files = files_;
     symbolic_links = symbolic_links_;
     sub_modules = sub_modules_;
   }
    : get_folder_output)

let make_get_folder_input ?commit_specifier:(commit_specifier_ : commit_name option)
    ~repository_name:(repository_name_ : repository_name) ~folder_path:(folder_path_ : path) () =
  ({
     repository_name = repository_name_;
     commit_specifier = commit_specifier_;
     folder_path = folder_path_;
   }
    : get_folder_input)

let make_get_file_output ~commit_id:(commit_id_ : object_id) ~blob_id:(blob_id_ : object_id)
    ~file_path:(file_path_ : path) ~file_mode:(file_mode_ : file_mode_type_enum)
    ~file_size:(file_size_ : object_size) ~file_content:(file_content_ : file_content) () =
  ({
     commit_id = commit_id_;
     blob_id = blob_id_;
     file_path = file_path_;
     file_mode = file_mode_;
     file_size = file_size_;
     file_content = file_content_;
   }
    : get_file_output)

let make_get_file_input ?commit_specifier:(commit_specifier_ : commit_name option)
    ~repository_name:(repository_name_ : repository_name) ~file_path:(file_path_ : path) () =
  ({
     repository_name = repository_name_;
     commit_specifier = commit_specifier_;
     file_path = file_path_;
   }
    : get_file_input)

let make_difference ?before_blob:(before_blob_ : blob_metadata option)
    ?after_blob:(after_blob_ : blob_metadata option)
    ?change_type:(change_type_ : change_type_enum option) () =
  ({ before_blob = before_blob_; after_blob = after_blob_; change_type = change_type_ }
    : difference)

let make_get_differences_output ?differences:(differences_ : difference_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ differences = differences_; next_token = next_token_ } : get_differences_output)

let make_get_differences_input
    ?before_commit_specifier:(before_commit_specifier_ : commit_name option)
    ?before_path:(before_path_ : path option) ?after_path:(after_path_ : path option)
    ?max_results:(max_results_ : limit option) ?next_token:(next_token_ : next_token option)
    ~repository_name:(repository_name_ : repository_name)
    ~after_commit_specifier:(after_commit_specifier_ : commit_name) () =
  ({
     repository_name = repository_name_;
     before_commit_specifier = before_commit_specifier_;
     after_commit_specifier = after_commit_specifier_;
     before_path = before_path_;
     after_path = after_path_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : get_differences_input)

let make_get_commit_output ~commit:(commit_ : commit) () =
  ({ commit = commit_ } : get_commit_output)

let make_get_commit_input ~repository_name:(repository_name_ : repository_name)
    ~commit_id:(commit_id_ : object_id) () =
  ({ repository_name = repository_name_; commit_id = commit_id_ } : get_commit_input)

let make_comments_for_pull_request ?pull_request_id:(pull_request_id_ : pull_request_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_blob_id:(before_blob_id_ : object_id option)
    ?after_blob_id:(after_blob_id_ : object_id option) ?location:(location_ : location option)
    ?comments:(comments_ : comments option) () =
  ({
     pull_request_id = pull_request_id_;
     repository_name = repository_name_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     before_blob_id = before_blob_id_;
     after_blob_id = after_blob_id_;
     location = location_;
     comments = comments_;
   }
    : comments_for_pull_request)

let make_get_comments_for_pull_request_output
    ?comments_for_pull_request_data:
      (comments_for_pull_request_data_ : comments_for_pull_request_data option)
    ?next_token:(next_token_ : next_token option) () =
  ({ comments_for_pull_request_data = comments_for_pull_request_data_; next_token = next_token_ }
    : get_comments_for_pull_request_output)

let make_get_comments_for_pull_request_input
    ?repository_name:(repository_name_ : repository_name option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     pull_request_id = pull_request_id_;
     repository_name = repository_name_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_comments_for_pull_request_input)

let make_comments_for_compared_commit ?repository_name:(repository_name_ : repository_name option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_blob_id:(before_blob_id_ : object_id option)
    ?after_blob_id:(after_blob_id_ : object_id option) ?location:(location_ : location option)
    ?comments:(comments_ : comments option) () =
  ({
     repository_name = repository_name_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     before_blob_id = before_blob_id_;
     after_blob_id = after_blob_id_;
     location = location_;
     comments = comments_;
   }
    : comments_for_compared_commit)

let make_get_comments_for_compared_commit_output
    ?comments_for_compared_commit_data:
      (comments_for_compared_commit_data_ : comments_for_compared_commit_data option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     comments_for_compared_commit_data = comments_for_compared_commit_data_;
     next_token = next_token_;
   }
    : get_comments_for_compared_commit_output)

let make_get_comments_for_compared_commit_input
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~repository_name:(repository_name_ : repository_name)
    ~after_commit_id:(after_commit_id_ : commit_id) () =
  ({
     repository_name = repository_name_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_comments_for_compared_commit_input)

let make_reaction_value_formats ?emoji:(emoji_ : reaction_emoji option)
    ?short_code:(short_code_ : reaction_short_code option)
    ?unicode:(unicode_ : reaction_unicode option) () =
  ({ emoji = emoji_; short_code = short_code_; unicode = unicode_ } : reaction_value_formats)

let make_reaction_for_comment ?reaction:(reaction_ : reaction_value_formats option)
    ?reaction_users:(reaction_users_ : reaction_users_list option)
    ?reactions_from_deleted_users_count:(reactions_from_deleted_users_count_ : count option) () =
  ({
     reaction = reaction_;
     reaction_users = reaction_users_;
     reactions_from_deleted_users_count = reactions_from_deleted_users_count_;
   }
    : reaction_for_comment)

let make_get_comment_reactions_output ?next_token:(next_token_ : next_token option)
    ~reactions_for_comment:(reactions_for_comment_ : reactions_for_comment_list) () =
  ({ reactions_for_comment = reactions_for_comment_; next_token = next_token_ }
    : get_comment_reactions_output)

let make_get_comment_reactions_input ?reaction_user_arn:(reaction_user_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~comment_id:(comment_id_ : comment_id) () =
  ({
     comment_id = comment_id_;
     reaction_user_arn = reaction_user_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_comment_reactions_input)

let make_get_comment_output ?comment:(comment_ : comment option) () =
  ({ comment = comment_ } : get_comment_output)

let make_get_comment_input ~comment_id:(comment_id_ : comment_id) () =
  ({ comment_id = comment_id_ } : get_comment_input)

let make_get_branch_output ?branch:(branch_ : branch_info option) () =
  ({ branch = branch_ } : get_branch_output)

let make_get_branch_input ?repository_name:(repository_name_ : repository_name option)
    ?branch_name:(branch_name_ : branch_name option) () =
  ({ repository_name = repository_name_; branch_name = branch_name_ } : get_branch_input)

let make_get_blob_output ~content:(content_ : blob) () = ({ content = content_ } : get_blob_output)

let make_get_blob_input ~repository_name:(repository_name_ : repository_name)
    ~blob_id:(blob_id_ : object_id) () =
  ({ repository_name = repository_name_; blob_id = blob_id_ } : get_blob_input)

let make_get_approval_rule_template_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ } : get_approval_rule_template_output)

let make_get_approval_rule_template_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({ approval_rule_template_name = approval_rule_template_name_ }
    : get_approval_rule_template_input)

let make_evaluation ?approved:(approved_ : approved option)
    ?overridden:(overridden_ : overridden option)
    ?approval_rules_satisfied:(approval_rules_satisfied_ : approval_rules_satisfied_list option)
    ?approval_rules_not_satisfied:
      (approval_rules_not_satisfied_ : approval_rules_not_satisfied_list option) () =
  ({
     approved = approved_;
     overridden = overridden_;
     approval_rules_satisfied = approval_rules_satisfied_;
     approval_rules_not_satisfied = approval_rules_not_satisfied_;
   }
    : evaluation)

let make_evaluate_pull_request_approval_rules_output ~evaluation:(evaluation_ : evaluation) () =
  ({ evaluation = evaluation_ } : evaluate_pull_request_approval_rules_output)

let make_evaluate_pull_request_approval_rules_input
    ~pull_request_id:(pull_request_id_ : pull_request_id) ~revision_id:(revision_id_ : revision_id)
    () =
  ({ pull_request_id = pull_request_id_; revision_id = revision_id_ }
    : evaluate_pull_request_approval_rules_input)

let make_disassociate_approval_rule_template_from_repository_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     repository_name = repository_name_;
   }
    : disassociate_approval_rule_template_from_repository_input)

let make_pull_request_merged_state_changed_event_metadata
    ?repository_name:(repository_name_ : repository_name option)
    ?destination_reference:(destination_reference_ : reference_name option)
    ?merge_metadata:(merge_metadata_ : merge_metadata option) () =
  ({
     repository_name = repository_name_;
     destination_reference = destination_reference_;
     merge_metadata = merge_metadata_;
   }
    : pull_request_merged_state_changed_event_metadata)

let make_pull_request_source_reference_updated_event_metadata
    ?repository_name:(repository_name_ : repository_name option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?merge_base:(merge_base_ : commit_id option) () =
  ({
     repository_name = repository_name_;
     before_commit_id = before_commit_id_;
     after_commit_id = after_commit_id_;
     merge_base = merge_base_;
   }
    : pull_request_source_reference_updated_event_metadata)

let make_pull_request_status_changed_event_metadata
    ?pull_request_status:(pull_request_status_ : pull_request_status_enum option) () =
  ({ pull_request_status = pull_request_status_ } : pull_request_status_changed_event_metadata)

let make_pull_request_created_event_metadata
    ?repository_name:(repository_name_ : repository_name option)
    ?source_commit_id:(source_commit_id_ : commit_id option)
    ?destination_commit_id:(destination_commit_id_ : commit_id option)
    ?merge_base:(merge_base_ : commit_id option) () =
  ({
     repository_name = repository_name_;
     source_commit_id = source_commit_id_;
     destination_commit_id = destination_commit_id_;
     merge_base = merge_base_;
   }
    : pull_request_created_event_metadata)

let make_pull_request_event ?pull_request_id:(pull_request_id_ : pull_request_id option)
    ?event_date:(event_date_ : event_date option)
    ?pull_request_event_type:(pull_request_event_type_ : pull_request_event_type option)
    ?actor_arn:(actor_arn_ : arn option)
    ?pull_request_created_event_metadata:
      (pull_request_created_event_metadata_ : pull_request_created_event_metadata option)
    ?pull_request_status_changed_event_metadata:
      (pull_request_status_changed_event_metadata_ :
         pull_request_status_changed_event_metadata option)
    ?pull_request_source_reference_updated_event_metadata:
      (pull_request_source_reference_updated_event_metadata_ :
         pull_request_source_reference_updated_event_metadata option)
    ?pull_request_merged_state_changed_event_metadata:
      (pull_request_merged_state_changed_event_metadata_ :
         pull_request_merged_state_changed_event_metadata option)
    ?approval_rule_event_metadata:
      (approval_rule_event_metadata_ : approval_rule_event_metadata option)
    ?approval_state_changed_event_metadata:
      (approval_state_changed_event_metadata_ : approval_state_changed_event_metadata option)
    ?approval_rule_overridden_event_metadata:
      (approval_rule_overridden_event_metadata_ : approval_rule_overridden_event_metadata option) ()
    =
  ({
     pull_request_id = pull_request_id_;
     event_date = event_date_;
     pull_request_event_type = pull_request_event_type_;
     actor_arn = actor_arn_;
     pull_request_created_event_metadata = pull_request_created_event_metadata_;
     pull_request_status_changed_event_metadata = pull_request_status_changed_event_metadata_;
     pull_request_source_reference_updated_event_metadata =
       pull_request_source_reference_updated_event_metadata_;
     pull_request_merged_state_changed_event_metadata =
       pull_request_merged_state_changed_event_metadata_;
     approval_rule_event_metadata = approval_rule_event_metadata_;
     approval_state_changed_event_metadata = approval_state_changed_event_metadata_;
     approval_rule_overridden_event_metadata = approval_rule_overridden_event_metadata_;
   }
    : pull_request_event)

let make_describe_pull_request_events_output ?next_token:(next_token_ : next_token option)
    ~pull_request_events:(pull_request_events_ : pull_request_event_list) () =
  ({ pull_request_events = pull_request_events_; next_token = next_token_ }
    : describe_pull_request_events_output)

let make_describe_pull_request_events_input
    ?pull_request_event_type:(pull_request_event_type_ : pull_request_event_type option)
    ?actor_arn:(actor_arn_ : arn option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     pull_request_id = pull_request_id_;
     pull_request_event_type = pull_request_event_type_;
     actor_arn = actor_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_pull_request_events_input)

let make_describe_merge_conflicts_output ?next_token:(next_token_ : next_token option)
    ?base_commit_id:(base_commit_id_ : object_id option)
    ~conflict_metadata:(conflict_metadata_ : conflict_metadata)
    ~merge_hunks:(merge_hunks_ : merge_hunks)
    ~destination_commit_id:(destination_commit_id_ : object_id)
    ~source_commit_id:(source_commit_id_ : object_id) () =
  ({
     conflict_metadata = conflict_metadata_;
     merge_hunks = merge_hunks_;
     next_token = next_token_;
     destination_commit_id = destination_commit_id_;
     source_commit_id = source_commit_id_;
     base_commit_id = base_commit_id_;
   }
    : describe_merge_conflicts_output)

let make_describe_merge_conflicts_input ?max_merge_hunks:(max_merge_hunks_ : max_results option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?next_token:(next_token_ : next_token option)
    ~repository_name:(repository_name_ : repository_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~merge_option:(merge_option_ : merge_option_type_enum) ~file_path:(file_path_ : path) () =
  ({
     repository_name = repository_name_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     merge_option = merge_option_;
     max_merge_hunks = max_merge_hunks_;
     file_path = file_path_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     next_token = next_token_;
   }
    : describe_merge_conflicts_input)

let make_delete_repository_output ?repository_id:(repository_id_ : repository_id option) () =
  ({ repository_id = repository_id_ } : delete_repository_output)

let make_delete_repository_input ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_ } : delete_repository_input)

let make_delete_pull_request_approval_rule_output
    ~approval_rule_id:(approval_rule_id_ : approval_rule_id) () =
  ({ approval_rule_id = approval_rule_id_ } : delete_pull_request_approval_rule_output)

let make_delete_pull_request_approval_rule_input
    ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~approval_rule_name:(approval_rule_name_ : approval_rule_name) () =
  ({ pull_request_id = pull_request_id_; approval_rule_name = approval_rule_name_ }
    : delete_pull_request_approval_rule_input)

let make_delete_file_output ~commit_id:(commit_id_ : object_id) ~blob_id:(blob_id_ : object_id)
    ~tree_id:(tree_id_ : object_id) ~file_path:(file_path_ : path) () =
  ({ commit_id = commit_id_; blob_id = blob_id_; tree_id = tree_id_; file_path = file_path_ }
    : delete_file_output)

let make_delete_file_input ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?commit_message:(commit_message_ : message option) ?name:(name_ : name option)
    ?email:(email_ : email option) ~repository_name:(repository_name_ : repository_name)
    ~branch_name:(branch_name_ : branch_name) ~file_path:(file_path_ : path)
    ~parent_commit_id:(parent_commit_id_ : commit_id) () =
  ({
     repository_name = repository_name_;
     branch_name = branch_name_;
     file_path = file_path_;
     parent_commit_id = parent_commit_id_;
     keep_empty_folders = keep_empty_folders_;
     commit_message = commit_message_;
     name = name_;
     email = email_;
   }
    : delete_file_input)

let make_delete_comment_content_output ?comment:(comment_ : comment option) () =
  ({ comment = comment_ } : delete_comment_content_output)

let make_delete_comment_content_input ~comment_id:(comment_id_ : comment_id) () =
  ({ comment_id = comment_id_ } : delete_comment_content_input)

let make_delete_branch_output ?deleted_branch:(deleted_branch_ : branch_info option) () =
  ({ deleted_branch = deleted_branch_ } : delete_branch_output)

let make_delete_branch_input ~repository_name:(repository_name_ : repository_name)
    ~branch_name:(branch_name_ : branch_name) () =
  ({ repository_name = repository_name_; branch_name = branch_name_ } : delete_branch_input)

let make_delete_approval_rule_template_output
    ~approval_rule_template_id:(approval_rule_template_id_ : approval_rule_template_id) () =
  ({ approval_rule_template_id = approval_rule_template_id_ }
    : delete_approval_rule_template_output)

let make_delete_approval_rule_template_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({ approval_rule_template_name = approval_rule_template_name_ }
    : delete_approval_rule_template_input)

let make_create_unreferenced_merge_commit_output ?commit_id:(commit_id_ : object_id option)
    ?tree_id:(tree_id_ : object_id option) () =
  ({ commit_id = commit_id_; tree_id = tree_id_ } : create_unreferenced_merge_commit_output)

let make_create_unreferenced_merge_commit_input
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?author_name:(author_name_ : name option) ?email:(email_ : email option)
    ?commit_message:(commit_message_ : message option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ~repository_name:(repository_name_ : repository_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~merge_option:(merge_option_ : merge_option_type_enum) () =
  ({
     repository_name = repository_name_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     merge_option = merge_option_;
     conflict_detail_level = conflict_detail_level_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     author_name = author_name_;
     email = email_;
     commit_message = commit_message_;
     keep_empty_folders = keep_empty_folders_;
     conflict_resolution = conflict_resolution_;
   }
    : create_unreferenced_merge_commit_input)

let make_create_repository_output
    ?repository_metadata:(repository_metadata_ : repository_metadata option) () =
  ({ repository_metadata = repository_metadata_ } : create_repository_output)

let make_create_repository_input
    ?repository_description:(repository_description_ : repository_description option)
    ?tags:(tags_ : tags_map option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     repository_name = repository_name_;
     repository_description = repository_description_;
     tags = tags_;
     kms_key_id = kms_key_id_;
   }
    : create_repository_input)

let make_create_pull_request_approval_rule_output ~approval_rule:(approval_rule_ : approval_rule) ()
    =
  ({ approval_rule = approval_rule_ } : create_pull_request_approval_rule_output)

let make_create_pull_request_approval_rule_input
    ~pull_request_id:(pull_request_id_ : pull_request_id)
    ~approval_rule_name:(approval_rule_name_ : approval_rule_name)
    ~approval_rule_content:(approval_rule_content_ : approval_rule_content) () =
  ({
     pull_request_id = pull_request_id_;
     approval_rule_name = approval_rule_name_;
     approval_rule_content = approval_rule_content_;
   }
    : create_pull_request_approval_rule_input)

let make_create_pull_request_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : create_pull_request_output)

let make_target ?destination_reference:(destination_reference_ : reference_name option)
    ~repository_name:(repository_name_ : repository_name)
    ~source_reference:(source_reference_ : reference_name) () =
  ({
     repository_name = repository_name_;
     source_reference = source_reference_;
     destination_reference = destination_reference_;
   }
    : target)

let make_create_pull_request_input ?description:(description_ : description option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~title:(title_ : title) ~targets:(targets_ : target_list) () =
  ({
     title = title_;
     description = description_;
     targets = targets_;
     client_request_token = client_request_token_;
   }
    : create_pull_request_input)

let make_file_metadata ?absolute_path:(absolute_path_ : path option)
    ?blob_id:(blob_id_ : object_id option) ?file_mode:(file_mode_ : file_mode_type_enum option) () =
  ({ absolute_path = absolute_path_; blob_id = blob_id_; file_mode = file_mode_ } : file_metadata)

let make_create_commit_output ?commit_id:(commit_id_ : object_id option)
    ?tree_id:(tree_id_ : object_id option) ?files_added:(files_added_ : files_metadata option)
    ?files_updated:(files_updated_ : files_metadata option)
    ?files_deleted:(files_deleted_ : files_metadata option) () =
  ({
     commit_id = commit_id_;
     tree_id = tree_id_;
     files_added = files_added_;
     files_updated = files_updated_;
     files_deleted = files_deleted_;
   }
    : create_commit_output)

let make_source_file_specifier ?is_move:(is_move_ : is_move option) ~file_path:(file_path_ : path)
    () =
  ({ file_path = file_path_; is_move = is_move_ } : source_file_specifier)

let make_put_file_entry ?file_mode:(file_mode_ : file_mode_type_enum option)
    ?file_content:(file_content_ : file_content option)
    ?source_file:(source_file_ : source_file_specifier option) ~file_path:(file_path_ : path) () =
  ({
     file_path = file_path_;
     file_mode = file_mode_;
     file_content = file_content_;
     source_file = source_file_;
   }
    : put_file_entry)

let make_create_commit_input ?parent_commit_id:(parent_commit_id_ : commit_id option)
    ?author_name:(author_name_ : name option) ?email:(email_ : email option)
    ?commit_message:(commit_message_ : message option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?put_files:(put_files_ : put_file_entries option)
    ?delete_files:(delete_files_ : delete_file_entries option)
    ?set_file_modes:(set_file_modes_ : set_file_mode_entries option)
    ~repository_name:(repository_name_ : repository_name) ~branch_name:(branch_name_ : branch_name)
    () =
  ({
     repository_name = repository_name_;
     branch_name = branch_name_;
     parent_commit_id = parent_commit_id_;
     author_name = author_name_;
     email = email_;
     commit_message = commit_message_;
     keep_empty_folders = keep_empty_folders_;
     put_files = put_files_;
     delete_files = delete_files_;
     set_file_modes = set_file_modes_;
   }
    : create_commit_input)

let make_create_branch_input ~repository_name:(repository_name_ : repository_name)
    ~branch_name:(branch_name_ : branch_name) ~commit_id:(commit_id_ : commit_id) () =
  ({ repository_name = repository_name_; branch_name = branch_name_; commit_id = commit_id_ }
    : create_branch_input)

let make_create_approval_rule_template_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ } : create_approval_rule_template_output)

let make_create_approval_rule_template_input
    ?approval_rule_template_description:
      (approval_rule_template_description_ : approval_rule_template_description option)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name)
    ~approval_rule_template_content:
      (approval_rule_template_content_ : approval_rule_template_content) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     approval_rule_template_content = approval_rule_template_content_;
     approval_rule_template_description = approval_rule_template_description_;
   }
    : create_approval_rule_template_input)
