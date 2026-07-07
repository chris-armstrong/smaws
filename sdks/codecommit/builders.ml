open Types

let make_user_info ?date:(date_ : date option) ?email:(email_ : email option)
    ?name:(name_ : name option) () =
  ({ date = date_; email = email_; name = name_ } : user_info)

let make_update_repository_name_input ~new_name:(new_name_ : repository_name)
    ~old_name:(old_name_ : repository_name) () =
  ({ new_name = new_name_; old_name = old_name_ } : update_repository_name_input)

let make_update_repository_encryption_key_output
    ?original_kms_key_id:(original_kms_key_id_ : kms_key_id option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?repository_id:(repository_id_ : repository_id option) () =
  ({
     original_kms_key_id = original_kms_key_id_;
     kms_key_id = kms_key_id_;
     repository_id = repository_id_;
   }
    : update_repository_encryption_key_output)

let make_update_repository_encryption_key_input ~kms_key_id:(kms_key_id_ : kms_key_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ kms_key_id = kms_key_id_; repository_name = repository_name_ }
    : update_repository_encryption_key_input)

let make_update_repository_description_input
    ?repository_description:(repository_description_ : repository_description option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_description = repository_description_; repository_name = repository_name_ }
    : update_repository_description_input)

let make_merge_metadata ?merge_option:(merge_option_ : merge_option_type_enum option)
    ?merge_commit_id:(merge_commit_id_ : commit_id option) ?merged_by:(merged_by_ : arn option)
    ?is_merged:(is_merged_ : is_merged option) () =
  ({
     merge_option = merge_option_;
     merge_commit_id = merge_commit_id_;
     merged_by = merged_by_;
     is_merged = is_merged_;
   }
    : merge_metadata)

let make_pull_request_target ?merge_metadata:(merge_metadata_ : merge_metadata option)
    ?merge_base:(merge_base_ : commit_id option) ?source_commit:(source_commit_ : commit_id option)
    ?destination_commit:(destination_commit_ : commit_id option)
    ?destination_reference:(destination_reference_ : reference_name option)
    ?source_reference:(source_reference_ : reference_name option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     merge_metadata = merge_metadata_;
     merge_base = merge_base_;
     source_commit = source_commit_;
     destination_commit = destination_commit_;
     destination_reference = destination_reference_;
     source_reference = source_reference_;
     repository_name = repository_name_;
   }
    : pull_request_target)

let make_origin_approval_rule_template
    ?approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name option)
    ?approval_rule_template_id:(approval_rule_template_id_ : approval_rule_template_id option) () =
  ({
     approval_rule_template_name = approval_rule_template_name_;
     approval_rule_template_id = approval_rule_template_id_;
   }
    : origin_approval_rule_template)

let make_approval_rule
    ?origin_approval_rule_template:
      (origin_approval_rule_template_ : origin_approval_rule_template option)
    ?last_modified_user:(last_modified_user_ : arn option)
    ?creation_date:(creation_date_ : creation_date option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?rule_content_sha256:(rule_content_sha256_ : rule_content_sha256 option)
    ?approval_rule_content:(approval_rule_content_ : approval_rule_content option)
    ?approval_rule_name:(approval_rule_name_ : approval_rule_name option)
    ?approval_rule_id:(approval_rule_id_ : approval_rule_id option) () =
  ({
     origin_approval_rule_template = origin_approval_rule_template_;
     last_modified_user = last_modified_user_;
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     rule_content_sha256 = rule_content_sha256_;
     approval_rule_content = approval_rule_content_;
     approval_rule_name = approval_rule_name_;
     approval_rule_id = approval_rule_id_;
   }
    : approval_rule)

let make_pull_request ?approval_rules:(approval_rules_ : approval_rules_list option)
    ?revision_id:(revision_id_ : revision_id option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?pull_request_targets:(pull_request_targets_ : pull_request_target_list option)
    ?author_arn:(author_arn_ : arn option)
    ?pull_request_status:(pull_request_status_ : pull_request_status_enum option)
    ?creation_date:(creation_date_ : creation_date option)
    ?last_activity_date:(last_activity_date_ : last_modified_date option)
    ?description:(description_ : description option) ?title:(title_ : title option)
    ?pull_request_id:(pull_request_id_ : pull_request_id option) () =
  ({
     approval_rules = approval_rules_;
     revision_id = revision_id_;
     client_request_token = client_request_token_;
     pull_request_targets = pull_request_targets_;
     author_arn = author_arn_;
     pull_request_status = pull_request_status_;
     creation_date = creation_date_;
     last_activity_date = last_activity_date_;
     description = description_;
     title = title_;
     pull_request_id = pull_request_id_;
   }
    : pull_request)

let make_update_pull_request_title_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : update_pull_request_title_output)

let make_update_pull_request_title_input ~title:(title_ : title)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ title = title_; pull_request_id = pull_request_id_ } : update_pull_request_title_input)

let make_update_pull_request_status_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : update_pull_request_status_output)

let make_update_pull_request_status_input
    ~pull_request_status:(pull_request_status_ : pull_request_status_enum)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ pull_request_status = pull_request_status_; pull_request_id = pull_request_id_ }
    : update_pull_request_status_input)

let make_update_pull_request_description_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : update_pull_request_description_output)

let make_update_pull_request_description_input ~description:(description_ : description)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ description = description_; pull_request_id = pull_request_id_ }
    : update_pull_request_description_input)

let make_update_pull_request_approval_state_input ~approval_state:(approval_state_ : approval_state)
    ~revision_id:(revision_id_ : revision_id) ~pull_request_id:(pull_request_id_ : pull_request_id)
    () =
  ({
     approval_state = approval_state_;
     revision_id = revision_id_;
     pull_request_id = pull_request_id_;
   }
    : update_pull_request_approval_state_input)

let make_update_pull_request_approval_rule_content_output
    ~approval_rule:(approval_rule_ : approval_rule) () =
  ({ approval_rule = approval_rule_ } : update_pull_request_approval_rule_content_output)

let make_update_pull_request_approval_rule_content_input
    ?existing_rule_content_sha256:(existing_rule_content_sha256_ : rule_content_sha256 option)
    ~new_rule_content:(new_rule_content_ : approval_rule_content)
    ~approval_rule_name:(approval_rule_name_ : approval_rule_name)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     new_rule_content = new_rule_content_;
     existing_rule_content_sha256 = existing_rule_content_sha256_;
     approval_rule_name = approval_rule_name_;
     pull_request_id = pull_request_id_;
   }
    : update_pull_request_approval_rule_content_input)

let make_update_default_branch_input ~default_branch_name:(default_branch_name_ : branch_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ default_branch_name = default_branch_name_; repository_name = repository_name_ }
    : update_default_branch_input)

let make_comment ?reaction_counts:(reaction_counts_ : reaction_counts_map option)
    ?caller_reactions:(caller_reactions_ : caller_reactions option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?deleted:(deleted_ : is_comment_deleted option) ?author_arn:(author_arn_ : arn option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?creation_date:(creation_date_ : creation_date option)
    ?in_reply_to:(in_reply_to_ : comment_id option) ?content:(content_ : content option)
    ?comment_id:(comment_id_ : comment_id option) () =
  ({
     reaction_counts = reaction_counts_;
     caller_reactions = caller_reactions_;
     client_request_token = client_request_token_;
     deleted = deleted_;
     author_arn = author_arn_;
     last_modified_date = last_modified_date_;
     creation_date = creation_date_;
     in_reply_to = in_reply_to_;
     content = content_;
     comment_id = comment_id_;
   }
    : comment)

let make_update_comment_output ?comment:(comment_ : comment option) () =
  ({ comment = comment_ } : update_comment_output)

let make_update_comment_input ~content:(content_ : content) ~comment_id:(comment_id_ : comment_id)
    () =
  ({ content = content_; comment_id = comment_id_ } : update_comment_input)

let make_approval_rule_template ?last_modified_user:(last_modified_user_ : arn option)
    ?creation_date:(creation_date_ : creation_date option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?rule_content_sha256:(rule_content_sha256_ : rule_content_sha256 option)
    ?approval_rule_template_content:
      (approval_rule_template_content_ : approval_rule_template_content option)
    ?approval_rule_template_description:
      (approval_rule_template_description_ : approval_rule_template_description option)
    ?approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name option)
    ?approval_rule_template_id:(approval_rule_template_id_ : approval_rule_template_id option) () =
  ({
     last_modified_user = last_modified_user_;
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     rule_content_sha256 = rule_content_sha256_;
     approval_rule_template_content = approval_rule_template_content_;
     approval_rule_template_description = approval_rule_template_description_;
     approval_rule_template_name = approval_rule_template_name_;
     approval_rule_template_id = approval_rule_template_id_;
   }
    : approval_rule_template)

let make_update_approval_rule_template_name_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ } : update_approval_rule_template_name_output)

let make_update_approval_rule_template_name_input
    ~new_approval_rule_template_name:
      (new_approval_rule_template_name_ : approval_rule_template_name)
    ~old_approval_rule_template_name:
      (old_approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     new_approval_rule_template_name = new_approval_rule_template_name_;
     old_approval_rule_template_name = old_approval_rule_template_name_;
   }
    : update_approval_rule_template_name_input)

let make_update_approval_rule_template_description_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ }
    : update_approval_rule_template_description_output)

let make_update_approval_rule_template_description_input
    ~approval_rule_template_description:
      (approval_rule_template_description_ : approval_rule_template_description)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     approval_rule_template_description = approval_rule_template_description_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : update_approval_rule_template_description_input)

let make_update_approval_rule_template_content_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ }
    : update_approval_rule_template_content_output)

let make_update_approval_rule_template_content_input
    ?existing_rule_content_sha256:(existing_rule_content_sha256_ : rule_content_sha256 option)
    ~new_rule_content:(new_rule_content_ : approval_rule_template_content)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     existing_rule_content_sha256 = existing_rule_content_sha256_;
     new_rule_content = new_rule_content_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : update_approval_rule_template_content_input)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_keys_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)

let make_repository_trigger_execution_failure
    ?failure_message:(failure_message_ : repository_trigger_execution_failure_message option)
    ?trigger:(trigger_ : repository_trigger_name option) () =
  ({ failure_message = failure_message_; trigger = trigger_ }
    : repository_trigger_execution_failure)

let make_test_repository_triggers_output
    ?failed_executions:(failed_executions_ : repository_trigger_execution_failure_list option)
    ?successful_executions:(successful_executions_ : repository_trigger_name_list option) () =
  ({ failed_executions = failed_executions_; successful_executions = successful_executions_ }
    : test_repository_triggers_output)

let make_repository_trigger ?branches:(branches_ : branch_name_list option)
    ?custom_data:(custom_data_ : repository_trigger_custom_data option)
    ~events:(events_ : repository_trigger_event_list) ~destination_arn:(destination_arn_ : arn)
    ~name:(name_ : repository_trigger_name) () =
  ({
     events = events_;
     branches = branches_;
     custom_data = custom_data_;
     destination_arn = destination_arn_;
     name = name_;
   }
    : repository_trigger)

let make_test_repository_triggers_input ~triggers:(triggers_ : repository_triggers_list)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ triggers = triggers_; repository_name = repository_name_ } : test_repository_triggers_input)

let make_target ?destination_reference:(destination_reference_ : reference_name option)
    ~source_reference:(source_reference_ : reference_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     destination_reference = destination_reference_;
     source_reference = source_reference_;
     repository_name = repository_name_;
   }
    : target)

let make_tag_resource_input ~tags:(tags_ : tags_map) ~resource_arn:(resource_arn_ : resource_arn) ()
    =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)

let make_symbolic_link ?file_mode:(file_mode_ : file_mode_type_enum option)
    ?relative_path:(relative_path_ : path option) ?absolute_path:(absolute_path_ : path option)
    ?blob_id:(blob_id_ : object_id option) () =
  ({
     file_mode = file_mode_;
     relative_path = relative_path_;
     absolute_path = absolute_path_;
     blob_id = blob_id_;
   }
    : symbolic_link)

let make_sub_module ?relative_path:(relative_path_ : path option)
    ?absolute_path:(absolute_path_ : path option) ?commit_id:(commit_id_ : object_id option) () =
  ({ relative_path = relative_path_; absolute_path = absolute_path_; commit_id = commit_id_ }
    : sub_module)

let make_source_file_specifier ?is_move:(is_move_ : is_move option) ~file_path:(file_path_ : path)
    () =
  ({ is_move = is_move_; file_path = file_path_ } : source_file_specifier)

let make_set_file_mode_entry ~file_mode:(file_mode_ : file_mode_type_enum)
    ~file_path:(file_path_ : path) () =
  ({ file_mode = file_mode_; file_path = file_path_ } : set_file_mode_entry)

let make_commit ?additional_data:(additional_data_ : additional_data option)
    ?committer:(committer_ : user_info option) ?author:(author_ : user_info option)
    ?message:(message_ : message option) ?parents:(parents_ : parent_list option)
    ?tree_id:(tree_id_ : object_id option) ?commit_id:(commit_id_ : object_id option) () =
  ({
     additional_data = additional_data_;
     committer = committer_;
     author = author_;
     message = message_;
     parents = parents_;
     tree_id = tree_id_;
     commit_id = commit_id_;
   }
    : commit)

let make_file_version ?revision_children:(revision_children_ : revision_children option)
    ?path:(path_ : path option) ?blob_id:(blob_id_ : object_id option)
    ?commit:(commit_ : commit option) () =
  ({ revision_children = revision_children_; path = path_; blob_id = blob_id_; commit = commit_ }
    : file_version)

let make_repository_name_id_pair ?repository_id:(repository_id_ : repository_id option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({ repository_id = repository_id_; repository_name = repository_name_ } : repository_name_id_pair)

let make_repository_metadata ?kms_key_id:(kms_key_id_ : kms_key_id option) ?arn:(arn_ : arn option)
    ?clone_url_ssh:(clone_url_ssh_ : clone_url_ssh option)
    ?clone_url_http:(clone_url_http_ : clone_url_http option)
    ?creation_date:(creation_date_ : creation_date option)
    ?last_modified_date:(last_modified_date_ : last_modified_date option)
    ?default_branch:(default_branch_ : branch_name option)
    ?repository_description:(repository_description_ : repository_description option)
    ?repository_name:(repository_name_ : repository_name option)
    ?repository_id:(repository_id_ : repository_id option)
    ?account_id:(account_id_ : account_id option) () =
  ({
     kms_key_id = kms_key_id_;
     arn = arn_;
     clone_url_ssh = clone_url_ssh_;
     clone_url_http = clone_url_http_;
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
     default_branch = default_branch_;
     repository_description = repository_description_;
     repository_name = repository_name_;
     repository_id = repository_id_;
     account_id = account_id_;
   }
    : repository_metadata)

let make_replace_content_entry ?file_mode:(file_mode_ : file_mode_type_enum option)
    ?content:(content_ : file_content option)
    ~replacement_type:(replacement_type_ : replacement_type_enum) ~file_path:(file_path_ : path) ()
    =
  ({
     file_mode = file_mode_;
     content = content_;
     replacement_type = replacement_type_;
     file_path = file_path_;
   }
    : replace_content_entry)

let make_reaction_value_formats ?unicode:(unicode_ : reaction_unicode option)
    ?short_code:(short_code_ : reaction_short_code option) ?emoji:(emoji_ : reaction_emoji option)
    () =
  ({ unicode = unicode_; short_code = short_code_; emoji = emoji_ } : reaction_value_formats)

let make_reaction_for_comment
    ?reactions_from_deleted_users_count:(reactions_from_deleted_users_count_ : count option)
    ?reaction_users:(reaction_users_ : reaction_users_list option)
    ?reaction:(reaction_ : reaction_value_formats option) () =
  ({
     reactions_from_deleted_users_count = reactions_from_deleted_users_count_;
     reaction_users = reaction_users_;
     reaction = reaction_;
   }
    : reaction_for_comment)

let make_put_repository_triggers_output
    ?configuration_id:(configuration_id_ : repository_triggers_configuration_id option) () =
  ({ configuration_id = configuration_id_ } : put_repository_triggers_output)

let make_put_repository_triggers_input ~triggers:(triggers_ : repository_triggers_list)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ triggers = triggers_; repository_name = repository_name_ } : put_repository_triggers_input)

let make_put_file_output ~tree_id:(tree_id_ : object_id) ~blob_id:(blob_id_ : object_id)
    ~commit_id:(commit_id_ : object_id) () =
  ({ tree_id = tree_id_; blob_id = blob_id_; commit_id = commit_id_ } : put_file_output)

let make_put_file_input ?email:(email_ : email option) ?name:(name_ : name option)
    ?commit_message:(commit_message_ : message option)
    ?parent_commit_id:(parent_commit_id_ : commit_id option)
    ?file_mode:(file_mode_ : file_mode_type_enum option) ~file_path:(file_path_ : path)
    ~file_content:(file_content_ : file_content) ~branch_name:(branch_name_ : branch_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     email = email_;
     name = name_;
     commit_message = commit_message_;
     parent_commit_id = parent_commit_id_;
     file_mode = file_mode_;
     file_path = file_path_;
     file_content = file_content_;
     branch_name = branch_name_;
     repository_name = repository_name_;
   }
    : put_file_input)

let make_put_file_entry ?source_file:(source_file_ : source_file_specifier option)
    ?file_content:(file_content_ : file_content option)
    ?file_mode:(file_mode_ : file_mode_type_enum option) ~file_path:(file_path_ : path) () =
  ({
     source_file = source_file_;
     file_content = file_content_;
     file_mode = file_mode_;
     file_path = file_path_;
   }
    : put_file_entry)

let make_put_comment_reaction_input ~reaction_value:(reaction_value_ : reaction_value)
    ~comment_id:(comment_id_ : comment_id) () =
  ({ reaction_value = reaction_value_; comment_id = comment_id_ } : put_comment_reaction_input)

let make_pull_request_status_changed_event_metadata
    ?pull_request_status:(pull_request_status_ : pull_request_status_enum option) () =
  ({ pull_request_status = pull_request_status_ } : pull_request_status_changed_event_metadata)

let make_pull_request_source_reference_updated_event_metadata
    ?merge_base:(merge_base_ : commit_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     merge_base = merge_base_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     repository_name = repository_name_;
   }
    : pull_request_source_reference_updated_event_metadata)

let make_pull_request_merged_state_changed_event_metadata
    ?merge_metadata:(merge_metadata_ : merge_metadata option)
    ?destination_reference:(destination_reference_ : reference_name option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     merge_metadata = merge_metadata_;
     destination_reference = destination_reference_;
     repository_name = repository_name_;
   }
    : pull_request_merged_state_changed_event_metadata)

let make_pull_request_created_event_metadata ?merge_base:(merge_base_ : commit_id option)
    ?destination_commit_id:(destination_commit_id_ : commit_id option)
    ?source_commit_id:(source_commit_id_ : commit_id option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     merge_base = merge_base_;
     destination_commit_id = destination_commit_id_;
     source_commit_id = source_commit_id_;
     repository_name = repository_name_;
   }
    : pull_request_created_event_metadata)

let make_approval_rule_event_metadata
    ?approval_rule_content:(approval_rule_content_ : approval_rule_content option)
    ?approval_rule_id:(approval_rule_id_ : approval_rule_id option)
    ?approval_rule_name:(approval_rule_name_ : approval_rule_name option) () =
  ({
     approval_rule_content = approval_rule_content_;
     approval_rule_id = approval_rule_id_;
     approval_rule_name = approval_rule_name_;
   }
    : approval_rule_event_metadata)

let make_approval_state_changed_event_metadata
    ?approval_status:(approval_status_ : approval_state option)
    ?revision_id:(revision_id_ : revision_id option) () =
  ({ approval_status = approval_status_; revision_id = revision_id_ }
    : approval_state_changed_event_metadata)

let make_approval_rule_overridden_event_metadata
    ?override_status:(override_status_ : override_status option)
    ?revision_id:(revision_id_ : revision_id option) () =
  ({ override_status = override_status_; revision_id = revision_id_ }
    : approval_rule_overridden_event_metadata)

let make_pull_request_event
    ?approval_rule_overridden_event_metadata:
      (approval_rule_overridden_event_metadata_ : approval_rule_overridden_event_metadata option)
    ?approval_state_changed_event_metadata:
      (approval_state_changed_event_metadata_ : approval_state_changed_event_metadata option)
    ?approval_rule_event_metadata:
      (approval_rule_event_metadata_ : approval_rule_event_metadata option)
    ?pull_request_merged_state_changed_event_metadata:
      (pull_request_merged_state_changed_event_metadata_ :
         pull_request_merged_state_changed_event_metadata option)
    ?pull_request_source_reference_updated_event_metadata:
      (pull_request_source_reference_updated_event_metadata_ :
         pull_request_source_reference_updated_event_metadata option)
    ?pull_request_status_changed_event_metadata:
      (pull_request_status_changed_event_metadata_ :
         pull_request_status_changed_event_metadata option)
    ?pull_request_created_event_metadata:
      (pull_request_created_event_metadata_ : pull_request_created_event_metadata option)
    ?actor_arn:(actor_arn_ : arn option)
    ?pull_request_event_type:(pull_request_event_type_ : pull_request_event_type option)
    ?event_date:(event_date_ : event_date option)
    ?pull_request_id:(pull_request_id_ : pull_request_id option) () =
  ({
     approval_rule_overridden_event_metadata = approval_rule_overridden_event_metadata_;
     approval_state_changed_event_metadata = approval_state_changed_event_metadata_;
     approval_rule_event_metadata = approval_rule_event_metadata_;
     pull_request_merged_state_changed_event_metadata =
       pull_request_merged_state_changed_event_metadata_;
     pull_request_source_reference_updated_event_metadata =
       pull_request_source_reference_updated_event_metadata_;
     pull_request_status_changed_event_metadata = pull_request_status_changed_event_metadata_;
     pull_request_created_event_metadata = pull_request_created_event_metadata_;
     actor_arn = actor_arn_;
     pull_request_event_type = pull_request_event_type_;
     event_date = event_date_;
     pull_request_id = pull_request_id_;
   }
    : pull_request_event)

let make_post_comment_reply_output ?comment:(comment_ : comment option) () =
  ({ comment = comment_ } : post_comment_reply_output)

let make_post_comment_reply_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~content:(content_ : content) ~in_reply_to:(in_reply_to_ : comment_id) () =
  ({ content = content_; client_request_token = client_request_token_; in_reply_to = in_reply_to_ }
    : post_comment_reply_input)

let make_location
    ?relative_file_version:(relative_file_version_ : relative_file_version_enum option)
    ?file_position:(file_position_ : position option) ?file_path:(file_path_ : path option) () =
  ({
     relative_file_version = relative_file_version_;
     file_position = file_position_;
     file_path = file_path_;
   }
    : location)

let make_post_comment_for_pull_request_output ?comment:(comment_ : comment option)
    ?location:(location_ : location option) ?after_blob_id:(after_blob_id_ : object_id option)
    ?before_blob_id:(before_blob_id_ : object_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?pull_request_id:(pull_request_id_ : pull_request_id option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     comment = comment_;
     location = location_;
     after_blob_id = after_blob_id_;
     before_blob_id = before_blob_id_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     pull_request_id = pull_request_id_;
     repository_name = repository_name_;
   }
    : post_comment_for_pull_request_output)

let make_post_comment_for_pull_request_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?location:(location_ : location option) ~content:(content_ : content)
    ~after_commit_id:(after_commit_id_ : commit_id)
    ~before_commit_id:(before_commit_id_ : commit_id)
    ~repository_name:(repository_name_ : repository_name)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     client_request_token = client_request_token_;
     content = content_;
     location = location_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     repository_name = repository_name_;
     pull_request_id = pull_request_id_;
   }
    : post_comment_for_pull_request_input)

let make_post_comment_for_compared_commit_output ?comment:(comment_ : comment option)
    ?location:(location_ : location option) ?after_blob_id:(after_blob_id_ : object_id option)
    ?before_blob_id:(before_blob_id_ : object_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     comment = comment_;
     location = location_;
     after_blob_id = after_blob_id_;
     before_blob_id = before_blob_id_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     repository_name = repository_name_;
   }
    : post_comment_for_compared_commit_output)

let make_post_comment_for_compared_commit_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?location:(location_ : location option) ?before_commit_id:(before_commit_id_ : commit_id option)
    ~content:(content_ : content) ~after_commit_id:(after_commit_id_ : commit_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     client_request_token = client_request_token_;
     content = content_;
     location = location_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     repository_name = repository_name_;
   }
    : post_comment_for_compared_commit_input)

let make_override_pull_request_approval_rules_input
    ~override_status:(override_status_ : override_status) ~revision_id:(revision_id_ : revision_id)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     override_status = override_status_;
     revision_id = revision_id_;
     pull_request_id = pull_request_id_;
   }
    : override_pull_request_approval_rules_input)

let make_object_types ?base:(base_ : object_type_enum option)
    ?destination:(destination_ : object_type_enum option)
    ?source:(source_ : object_type_enum option) () =
  ({ base = base_; destination = destination_; source = source_ } : object_types)

let make_merge_pull_request_by_three_way_output ?pull_request:(pull_request_ : pull_request option)
    () =
  ({ pull_request = pull_request_ } : merge_pull_request_by_three_way_output)

let make_delete_file_entry ~file_path:(file_path_ : path) () =
  ({ file_path = file_path_ } : delete_file_entry)

let make_conflict_resolution ?set_file_modes:(set_file_modes_ : set_file_mode_entries option)
    ?delete_files:(delete_files_ : delete_file_entries option)
    ?replace_contents:(replace_contents_ : replace_content_entries option) () =
  ({
     set_file_modes = set_file_modes_;
     delete_files = delete_files_;
     replace_contents = replace_contents_;
   }
    : conflict_resolution)

let make_merge_pull_request_by_three_way_input
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?email:(email_ : email option) ?author_name:(author_name_ : name option)
    ?commit_message:(commit_message_ : message option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?source_commit_id:(source_commit_id_ : object_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     conflict_resolution = conflict_resolution_;
     keep_empty_folders = keep_empty_folders_;
     email = email_;
     author_name = author_name_;
     commit_message = commit_message_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     source_commit_id = source_commit_id_;
     repository_name = repository_name_;
     pull_request_id = pull_request_id_;
   }
    : merge_pull_request_by_three_way_input)

let make_merge_pull_request_by_squash_output ?pull_request:(pull_request_ : pull_request option) ()
    =
  ({ pull_request = pull_request_ } : merge_pull_request_by_squash_output)

let make_merge_pull_request_by_squash_input
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?email:(email_ : email option) ?author_name:(author_name_ : name option)
    ?commit_message:(commit_message_ : message option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?source_commit_id:(source_commit_id_ : object_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     conflict_resolution = conflict_resolution_;
     keep_empty_folders = keep_empty_folders_;
     email = email_;
     author_name = author_name_;
     commit_message = commit_message_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     source_commit_id = source_commit_id_;
     repository_name = repository_name_;
     pull_request_id = pull_request_id_;
   }
    : merge_pull_request_by_squash_input)

let make_merge_pull_request_by_fast_forward_output
    ?pull_request:(pull_request_ : pull_request option) () =
  ({ pull_request = pull_request_ } : merge_pull_request_by_fast_forward_output)

let make_merge_pull_request_by_fast_forward_input
    ?source_commit_id:(source_commit_id_ : object_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     source_commit_id = source_commit_id_;
     repository_name = repository_name_;
     pull_request_id = pull_request_id_;
   }
    : merge_pull_request_by_fast_forward_input)

let make_merge_operations ?destination:(destination_ : change_type_enum option)
    ?source:(source_ : change_type_enum option) () =
  ({ destination = destination_; source = source_ } : merge_operations)

let make_merge_hunk_detail ?hunk_content:(hunk_content_ : hunk_content option)
    ?end_line:(end_line_ : line_number option) ?start_line:(start_line_ : line_number option) () =
  ({ hunk_content = hunk_content_; end_line = end_line_; start_line = start_line_ }
    : merge_hunk_detail)

let make_merge_hunk ?base:(base_ : merge_hunk_detail option)
    ?destination:(destination_ : merge_hunk_detail option)
    ?source:(source_ : merge_hunk_detail option)
    ?is_conflict:(is_conflict_ : is_hunk_conflict option) () =
  ({ base = base_; destination = destination_; source = source_; is_conflict = is_conflict_ }
    : merge_hunk)

let make_merge_branches_by_three_way_output ?tree_id:(tree_id_ : object_id option)
    ?commit_id:(commit_id_ : object_id option) () =
  ({ tree_id = tree_id_; commit_id = commit_id_ } : merge_branches_by_three_way_output)

let make_merge_branches_by_three_way_input
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?commit_message:(commit_message_ : message option) ?email:(email_ : email option)
    ?author_name:(author_name_ : name option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?target_branch:(target_branch_ : branch_name option)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     conflict_resolution = conflict_resolution_;
     keep_empty_folders = keep_empty_folders_;
     commit_message = commit_message_;
     email = email_;
     author_name = author_name_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     target_branch = target_branch_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     repository_name = repository_name_;
   }
    : merge_branches_by_three_way_input)

let make_merge_branches_by_squash_output ?tree_id:(tree_id_ : object_id option)
    ?commit_id:(commit_id_ : object_id option) () =
  ({ tree_id = tree_id_; commit_id = commit_id_ } : merge_branches_by_squash_output)

let make_merge_branches_by_squash_input
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?commit_message:(commit_message_ : message option) ?email:(email_ : email option)
    ?author_name:(author_name_ : name option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?target_branch:(target_branch_ : branch_name option)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     conflict_resolution = conflict_resolution_;
     keep_empty_folders = keep_empty_folders_;
     commit_message = commit_message_;
     email = email_;
     author_name = author_name_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     target_branch = target_branch_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     repository_name = repository_name_;
   }
    : merge_branches_by_squash_input)

let make_merge_branches_by_fast_forward_output ?tree_id:(tree_id_ : object_id option)
    ?commit_id:(commit_id_ : object_id option) () =
  ({ tree_id = tree_id_; commit_id = commit_id_ } : merge_branches_by_fast_forward_output)

let make_merge_branches_by_fast_forward_input ?target_branch:(target_branch_ : branch_name option)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     target_branch = target_branch_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     repository_name = repository_name_;
   }
    : merge_branches_by_fast_forward_input)

let make_list_tags_for_resource_output ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tags_map option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?next_token:(next_token_ : next_token option)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ next_token = next_token_; resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_list_repositories_output ?next_token:(next_token_ : next_token option)
    ?repositories:(repositories_ : repository_name_id_pair_list option) () =
  ({ next_token = next_token_; repositories = repositories_ } : list_repositories_output)

let make_list_repositories_input ?order:(order_ : order_enum option)
    ?sort_by:(sort_by_ : sort_by_enum option) ?next_token:(next_token_ : next_token option) () =
  ({ order = order_; sort_by = sort_by_; next_token = next_token_ } : list_repositories_input)

let make_list_repositories_for_approval_rule_template_output
    ?next_token:(next_token_ : next_token option)
    ?repository_names:(repository_names_ : repository_name_list option) () =
  ({ next_token = next_token_; repository_names = repository_names_ }
    : list_repositories_for_approval_rule_template_output)

let make_list_repositories_for_approval_rule_template_input
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : list_repositories_for_approval_rule_template_input)

let make_list_pull_requests_output ?next_token:(next_token_ : next_token option)
    ~pull_request_ids:(pull_request_ids_ : pull_request_id_list) () =
  ({ next_token = next_token_; pull_request_ids = pull_request_ids_ } : list_pull_requests_output)

let make_list_pull_requests_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?pull_request_status:(pull_request_status_ : pull_request_status_enum option)
    ?author_arn:(author_arn_ : arn option) ~repository_name:(repository_name_ : repository_name) ()
    =
  ({
     max_results = max_results_;
     next_token = next_token_;
     pull_request_status = pull_request_status_;
     author_arn = author_arn_;
     repository_name = repository_name_;
   }
    : list_pull_requests_input)

let make_list_file_commit_history_response ?next_token:(next_token_ : next_token option)
    ~revision_dag:(revision_dag_ : revision_dag) () =
  ({ next_token = next_token_; revision_dag = revision_dag_ } : list_file_commit_history_response)

let make_list_file_commit_history_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : limit option)
    ?commit_specifier:(commit_specifier_ : commit_name option) ~file_path:(file_path_ : path)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     file_path = file_path_;
     commit_specifier = commit_specifier_;
     repository_name = repository_name_;
   }
    : list_file_commit_history_request)

let make_list_branches_output ?next_token:(next_token_ : next_token option)
    ?branches:(branches_ : branch_name_list option) () =
  ({ next_token = next_token_; branches = branches_ } : list_branches_output)

let make_list_branches_input ?next_token:(next_token_ : next_token option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ next_token = next_token_; repository_name = repository_name_ } : list_branches_input)

let make_list_associated_approval_rule_templates_for_repository_output
    ?next_token:(next_token_ : next_token option)
    ?approval_rule_template_names:
      (approval_rule_template_names_ : approval_rule_template_name_list option) () =
  ({ next_token = next_token_; approval_rule_template_names = approval_rule_template_names_ }
    : list_associated_approval_rule_templates_for_repository_output)

let make_list_associated_approval_rule_templates_for_repository_input
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ max_results = max_results_; next_token = next_token_; repository_name = repository_name_ }
    : list_associated_approval_rule_templates_for_repository_input)

let make_list_approval_rule_templates_output ?next_token:(next_token_ : next_token option)
    ?approval_rule_template_names:
      (approval_rule_template_names_ : approval_rule_template_name_list option) () =
  ({ next_token = next_token_; approval_rule_template_names = approval_rule_template_names_ }
    : list_approval_rule_templates_output)

let make_list_approval_rule_templates_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_approval_rule_templates_input)

let make_is_binary_file ?base:(base_ : capital_boolean option)
    ?destination:(destination_ : capital_boolean option) ?source:(source_ : capital_boolean option)
    () =
  ({ base = base_; destination = destination_; source = source_ } : is_binary_file)

let make_get_repository_triggers_output ?triggers:(triggers_ : repository_triggers_list option)
    ?configuration_id:(configuration_id_ : repository_triggers_configuration_id option) () =
  ({ triggers = triggers_; configuration_id = configuration_id_ } : get_repository_triggers_output)

let make_get_repository_triggers_input ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_ } : get_repository_triggers_input)

let make_get_repository_output
    ?repository_metadata:(repository_metadata_ : repository_metadata option) () =
  ({ repository_metadata = repository_metadata_ } : get_repository_output)

let make_get_repository_input ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_ } : get_repository_input)

let make_get_pull_request_override_state_output ?overrider:(overrider_ : arn option)
    ?overridden:(overridden_ : overridden option) () =
  ({ overrider = overrider_; overridden = overridden_ } : get_pull_request_override_state_output)

let make_get_pull_request_override_state_input ~revision_id:(revision_id_ : revision_id)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ revision_id = revision_id_; pull_request_id = pull_request_id_ }
    : get_pull_request_override_state_input)

let make_get_pull_request_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : get_pull_request_output)

let make_get_pull_request_input ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ pull_request_id = pull_request_id_ } : get_pull_request_input)

let make_approval ?approval_state:(approval_state_ : approval_state option)
    ?user_arn:(user_arn_ : arn option) () =
  ({ approval_state = approval_state_; user_arn = user_arn_ } : approval)

let make_get_pull_request_approval_states_output ?approvals:(approvals_ : approval_list option) () =
  ({ approvals = approvals_ } : get_pull_request_approval_states_output)

let make_get_pull_request_approval_states_input ~revision_id:(revision_id_ : revision_id)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ revision_id = revision_id_; pull_request_id = pull_request_id_ }
    : get_pull_request_approval_states_input)

let make_get_merge_options_output ~base_commit_id:(base_commit_id_ : object_id)
    ~destination_commit_id:(destination_commit_id_ : object_id)
    ~source_commit_id:(source_commit_id_ : object_id)
    ~merge_options:(merge_options_ : merge_options) () =
  ({
     base_commit_id = base_commit_id_;
     destination_commit_id = destination_commit_id_;
     source_commit_id = source_commit_id_;
     merge_options = merge_options_;
   }
    : get_merge_options_output)

let make_get_merge_options_input
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     repository_name = repository_name_;
   }
    : get_merge_options_input)

let make_file_sizes ?base:(base_ : file_size option) ?destination:(destination_ : file_size option)
    ?source:(source_ : file_size option) () =
  ({ base = base_; destination = destination_; source = source_ } : file_sizes)

let make_file_modes ?base:(base_ : file_mode_type_enum option)
    ?destination:(destination_ : file_mode_type_enum option)
    ?source:(source_ : file_mode_type_enum option) () =
  ({ base = base_; destination = destination_; source = source_ } : file_modes)

let make_conflict_metadata ?merge_operations:(merge_operations_ : merge_operations option)
    ?object_type_conflict:(object_type_conflict_ : is_object_type_conflict option)
    ?file_mode_conflict:(file_mode_conflict_ : is_file_mode_conflict option)
    ?content_conflict:(content_conflict_ : is_content_conflict option)
    ?is_binary_file:(is_binary_file_ : is_binary_file option)
    ?number_of_conflicts:(number_of_conflicts_ : number_of_conflicts option)
    ?object_types:(object_types_ : object_types option)
    ?file_modes:(file_modes_ : file_modes option) ?file_sizes:(file_sizes_ : file_sizes option)
    ?file_path:(file_path_ : path option) () =
  ({
     merge_operations = merge_operations_;
     object_type_conflict = object_type_conflict_;
     file_mode_conflict = file_mode_conflict_;
     content_conflict = content_conflict_;
     is_binary_file = is_binary_file_;
     number_of_conflicts = number_of_conflicts_;
     object_types = object_types_;
     file_modes = file_modes_;
     file_sizes = file_sizes_;
     file_path = file_path_;
   }
    : conflict_metadata)

let make_get_merge_conflicts_output ?next_token:(next_token_ : next_token option)
    ?base_commit_id:(base_commit_id_ : object_id option)
    ~conflict_metadata_list:(conflict_metadata_list_ : conflict_metadata_list)
    ~source_commit_id:(source_commit_id_ : object_id)
    ~destination_commit_id:(destination_commit_id_ : object_id)
    ~mergeable:(mergeable_ : is_mergeable) () =
  ({
     next_token = next_token_;
     conflict_metadata_list = conflict_metadata_list_;
     base_commit_id = base_commit_id_;
     source_commit_id = source_commit_id_;
     destination_commit_id = destination_commit_id_;
     mergeable = mergeable_;
   }
    : get_merge_conflicts_output)

let make_get_merge_conflicts_input ?next_token:(next_token_ : next_token option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?max_conflict_files:(max_conflict_files_ : max_results option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ~merge_option:(merge_option_ : merge_option_type_enum)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     next_token = next_token_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     max_conflict_files = max_conflict_files_;
     conflict_detail_level = conflict_detail_level_;
     merge_option = merge_option_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     repository_name = repository_name_;
   }
    : get_merge_conflicts_input)

let make_get_merge_commit_output ?merged_commit_id:(merged_commit_id_ : object_id option)
    ?base_commit_id:(base_commit_id_ : object_id option)
    ?destination_commit_id:(destination_commit_id_ : object_id option)
    ?source_commit_id:(source_commit_id_ : object_id option) () =
  ({
     merged_commit_id = merged_commit_id_;
     base_commit_id = base_commit_id_;
     destination_commit_id = destination_commit_id_;
     source_commit_id = source_commit_id_;
   }
    : get_merge_commit_output)

let make_get_merge_commit_input
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     repository_name = repository_name_;
   }
    : get_merge_commit_input)

let make_folder ?relative_path:(relative_path_ : path option)
    ?absolute_path:(absolute_path_ : path option) ?tree_id:(tree_id_ : object_id option) () =
  ({ relative_path = relative_path_; absolute_path = absolute_path_; tree_id = tree_id_ } : folder)

let make_file ?file_mode:(file_mode_ : file_mode_type_enum option)
    ?relative_path:(relative_path_ : path option) ?absolute_path:(absolute_path_ : path option)
    ?blob_id:(blob_id_ : object_id option) () =
  ({
     file_mode = file_mode_;
     relative_path = relative_path_;
     absolute_path = absolute_path_;
     blob_id = blob_id_;
   }
    : file)

let make_get_folder_output ?sub_modules:(sub_modules_ : sub_module_list option)
    ?symbolic_links:(symbolic_links_ : symbolic_link_list option) ?files:(files_ : file_list option)
    ?sub_folders:(sub_folders_ : folder_list option) ?tree_id:(tree_id_ : object_id option)
    ~folder_path:(folder_path_ : path) ~commit_id:(commit_id_ : object_id) () =
  ({
     sub_modules = sub_modules_;
     symbolic_links = symbolic_links_;
     files = files_;
     sub_folders = sub_folders_;
     tree_id = tree_id_;
     folder_path = folder_path_;
     commit_id = commit_id_;
   }
    : get_folder_output)

let make_get_folder_input ?commit_specifier:(commit_specifier_ : commit_name option)
    ~folder_path:(folder_path_ : path) ~repository_name:(repository_name_ : repository_name) () =
  ({
     folder_path = folder_path_;
     commit_specifier = commit_specifier_;
     repository_name = repository_name_;
   }
    : get_folder_input)

let make_get_file_output ~file_content:(file_content_ : file_content)
    ~file_size:(file_size_ : object_size) ~file_mode:(file_mode_ : file_mode_type_enum)
    ~file_path:(file_path_ : path) ~blob_id:(blob_id_ : object_id)
    ~commit_id:(commit_id_ : object_id) () =
  ({
     file_content = file_content_;
     file_size = file_size_;
     file_mode = file_mode_;
     file_path = file_path_;
     blob_id = blob_id_;
     commit_id = commit_id_;
   }
    : get_file_output)

let make_get_file_input ?commit_specifier:(commit_specifier_ : commit_name option)
    ~file_path:(file_path_ : path) ~repository_name:(repository_name_ : repository_name) () =
  ({
     file_path = file_path_;
     commit_specifier = commit_specifier_;
     repository_name = repository_name_;
   }
    : get_file_input)

let make_blob_metadata ?mode:(mode_ : mode option) ?path:(path_ : path option)
    ?blob_id:(blob_id_ : object_id option) () =
  ({ mode = mode_; path = path_; blob_id = blob_id_ } : blob_metadata)

let make_difference ?change_type:(change_type_ : change_type_enum option)
    ?after_blob:(after_blob_ : blob_metadata option)
    ?before_blob:(before_blob_ : blob_metadata option) () =
  ({ change_type = change_type_; after_blob = after_blob_; before_blob = before_blob_ }
    : difference)

let make_get_differences_output ?next_token:(next_token_ : next_token option)
    ?differences:(differences_ : difference_list option) () =
  ({ next_token = next_token_; differences = differences_ } : get_differences_output)

let make_get_differences_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : limit option) ?after_path:(after_path_ : path option)
    ?before_path:(before_path_ : path option)
    ?before_commit_specifier:(before_commit_specifier_ : commit_name option)
    ~after_commit_specifier:(after_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     after_path = after_path_;
     before_path = before_path_;
     after_commit_specifier = after_commit_specifier_;
     before_commit_specifier = before_commit_specifier_;
     repository_name = repository_name_;
   }
    : get_differences_input)

let make_get_commit_output ~commit:(commit_ : commit) () =
  ({ commit = commit_ } : get_commit_output)

let make_get_commit_input ~commit_id:(commit_id_ : object_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ commit_id = commit_id_; repository_name = repository_name_ } : get_commit_input)

let make_comments_for_pull_request ?comments:(comments_ : comments option)
    ?location:(location_ : location option) ?after_blob_id:(after_blob_id_ : object_id option)
    ?before_blob_id:(before_blob_id_ : object_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?pull_request_id:(pull_request_id_ : pull_request_id option) () =
  ({
     comments = comments_;
     location = location_;
     after_blob_id = after_blob_id_;
     before_blob_id = before_blob_id_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     repository_name = repository_name_;
     pull_request_id = pull_request_id_;
   }
    : comments_for_pull_request)

let make_get_comments_for_pull_request_output ?next_token:(next_token_ : next_token option)
    ?comments_for_pull_request_data:
      (comments_for_pull_request_data_ : comments_for_pull_request_data option) () =
  ({ next_token = next_token_; comments_for_pull_request_data = comments_for_pull_request_data_ }
    : get_comments_for_pull_request_output)

let make_get_comments_for_pull_request_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     repository_name = repository_name_;
     pull_request_id = pull_request_id_;
   }
    : get_comments_for_pull_request_input)

let make_comments_for_compared_commit ?comments:(comments_ : comments option)
    ?location:(location_ : location option) ?after_blob_id:(after_blob_id_ : object_id option)
    ?before_blob_id:(before_blob_id_ : object_id option)
    ?after_commit_id:(after_commit_id_ : commit_id option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     comments = comments_;
     location = location_;
     after_blob_id = after_blob_id_;
     before_blob_id = before_blob_id_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     repository_name = repository_name_;
   }
    : comments_for_compared_commit)

let make_get_comments_for_compared_commit_output ?next_token:(next_token_ : next_token option)
    ?comments_for_compared_commit_data:
      (comments_for_compared_commit_data_ : comments_for_compared_commit_data option) () =
  ({
     next_token = next_token_;
     comments_for_compared_commit_data = comments_for_compared_commit_data_;
   }
    : get_comments_for_compared_commit_output)

let make_get_comments_for_compared_commit_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?before_commit_id:(before_commit_id_ : commit_id option)
    ~after_commit_id:(after_commit_id_ : commit_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     after_commit_id = after_commit_id_;
     before_commit_id = before_commit_id_;
     repository_name = repository_name_;
   }
    : get_comments_for_compared_commit_input)

let make_get_comment_reactions_output ?next_token:(next_token_ : next_token option)
    ~reactions_for_comment:(reactions_for_comment_ : reactions_for_comment_list) () =
  ({ next_token = next_token_; reactions_for_comment = reactions_for_comment_ }
    : get_comment_reactions_output)

let make_get_comment_reactions_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?reaction_user_arn:(reaction_user_arn_ : arn option) ~comment_id:(comment_id_ : comment_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     reaction_user_arn = reaction_user_arn_;
     comment_id = comment_id_;
   }
    : get_comment_reactions_input)

let make_get_comment_output ?comment:(comment_ : comment option) () =
  ({ comment = comment_ } : get_comment_output)

let make_get_comment_input ~comment_id:(comment_id_ : comment_id) () =
  ({ comment_id = comment_id_ } : get_comment_input)

let make_branch_info ?commit_id:(commit_id_ : commit_id option)
    ?branch_name:(branch_name_ : branch_name option) () =
  ({ commit_id = commit_id_; branch_name = branch_name_ } : branch_info)

let make_get_branch_output ?branch:(branch_ : branch_info option) () =
  ({ branch = branch_ } : get_branch_output)

let make_get_branch_input ?branch_name:(branch_name_ : branch_name option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({ branch_name = branch_name_; repository_name = repository_name_ } : get_branch_input)

let make_get_blob_output ~content:(content_ : blob) () = ({ content = content_ } : get_blob_output)

let make_get_blob_input ~blob_id:(blob_id_ : object_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ blob_id = blob_id_; repository_name = repository_name_ } : get_blob_input)

let make_get_approval_rule_template_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ } : get_approval_rule_template_output)

let make_get_approval_rule_template_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({ approval_rule_template_name = approval_rule_template_name_ }
    : get_approval_rule_template_input)

let make_file_metadata ?file_mode:(file_mode_ : file_mode_type_enum option)
    ?blob_id:(blob_id_ : object_id option) ?absolute_path:(absolute_path_ : path option) () =
  ({ file_mode = file_mode_; blob_id = blob_id_; absolute_path = absolute_path_ } : file_metadata)

let make_evaluation
    ?approval_rules_not_satisfied:
      (approval_rules_not_satisfied_ : approval_rules_not_satisfied_list option)
    ?approval_rules_satisfied:(approval_rules_satisfied_ : approval_rules_satisfied_list option)
    ?overridden:(overridden_ : overridden option) ?approved:(approved_ : approved option) () =
  ({
     approval_rules_not_satisfied = approval_rules_not_satisfied_;
     approval_rules_satisfied = approval_rules_satisfied_;
     overridden = overridden_;
     approved = approved_;
   }
    : evaluation)

let make_evaluate_pull_request_approval_rules_output ~evaluation:(evaluation_ : evaluation) () =
  ({ evaluation = evaluation_ } : evaluate_pull_request_approval_rules_output)

let make_evaluate_pull_request_approval_rules_input ~revision_id:(revision_id_ : revision_id)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ revision_id = revision_id_; pull_request_id = pull_request_id_ }
    : evaluate_pull_request_approval_rules_input)

let make_disassociate_approval_rule_template_from_repository_input
    ~repository_name:(repository_name_ : repository_name)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     repository_name = repository_name_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : disassociate_approval_rule_template_from_repository_input)

let make_describe_pull_request_events_output ?next_token:(next_token_ : next_token option)
    ~pull_request_events:(pull_request_events_ : pull_request_event_list) () =
  ({ next_token = next_token_; pull_request_events = pull_request_events_ }
    : describe_pull_request_events_output)

let make_describe_pull_request_events_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?actor_arn:(actor_arn_ : arn option)
    ?pull_request_event_type:(pull_request_event_type_ : pull_request_event_type option)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     actor_arn = actor_arn_;
     pull_request_event_type = pull_request_event_type_;
     pull_request_id = pull_request_id_;
   }
    : describe_pull_request_events_input)

let make_describe_merge_conflicts_output ?base_commit_id:(base_commit_id_ : object_id option)
    ?next_token:(next_token_ : next_token option) ~source_commit_id:(source_commit_id_ : object_id)
    ~destination_commit_id:(destination_commit_id_ : object_id)
    ~merge_hunks:(merge_hunks_ : merge_hunks)
    ~conflict_metadata:(conflict_metadata_ : conflict_metadata) () =
  ({
     base_commit_id = base_commit_id_;
     source_commit_id = source_commit_id_;
     destination_commit_id = destination_commit_id_;
     next_token = next_token_;
     merge_hunks = merge_hunks_;
     conflict_metadata = conflict_metadata_;
   }
    : describe_merge_conflicts_output)

let make_describe_merge_conflicts_input ?next_token:(next_token_ : next_token option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?max_merge_hunks:(max_merge_hunks_ : max_results option) ~file_path:(file_path_ : path)
    ~merge_option:(merge_option_ : merge_option_type_enum)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     next_token = next_token_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     file_path = file_path_;
     max_merge_hunks = max_merge_hunks_;
     merge_option = merge_option_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     repository_name = repository_name_;
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
    ~approval_rule_name:(approval_rule_name_ : approval_rule_name)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({ approval_rule_name = approval_rule_name_; pull_request_id = pull_request_id_ }
    : delete_pull_request_approval_rule_input)

let make_delete_file_output ~file_path:(file_path_ : path) ~tree_id:(tree_id_ : object_id)
    ~blob_id:(blob_id_ : object_id) ~commit_id:(commit_id_ : object_id) () =
  ({ file_path = file_path_; tree_id = tree_id_; blob_id = blob_id_; commit_id = commit_id_ }
    : delete_file_output)

let make_delete_file_input ?email:(email_ : email option) ?name:(name_ : name option)
    ?commit_message:(commit_message_ : message option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ~parent_commit_id:(parent_commit_id_ : commit_id) ~file_path:(file_path_ : path)
    ~branch_name:(branch_name_ : branch_name) ~repository_name:(repository_name_ : repository_name)
    () =
  ({
     email = email_;
     name = name_;
     commit_message = commit_message_;
     keep_empty_folders = keep_empty_folders_;
     parent_commit_id = parent_commit_id_;
     file_path = file_path_;
     branch_name = branch_name_;
     repository_name = repository_name_;
   }
    : delete_file_input)

let make_delete_comment_content_output ?comment:(comment_ : comment option) () =
  ({ comment = comment_ } : delete_comment_content_output)

let make_delete_comment_content_input ~comment_id:(comment_id_ : comment_id) () =
  ({ comment_id = comment_id_ } : delete_comment_content_input)

let make_delete_branch_output ?deleted_branch:(deleted_branch_ : branch_info option) () =
  ({ deleted_branch = deleted_branch_ } : delete_branch_output)

let make_delete_branch_input ~branch_name:(branch_name_ : branch_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ branch_name = branch_name_; repository_name = repository_name_ } : delete_branch_input)

let make_delete_approval_rule_template_output
    ~approval_rule_template_id:(approval_rule_template_id_ : approval_rule_template_id) () =
  ({ approval_rule_template_id = approval_rule_template_id_ }
    : delete_approval_rule_template_output)

let make_delete_approval_rule_template_input
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({ approval_rule_template_name = approval_rule_template_name_ }
    : delete_approval_rule_template_input)

let make_create_unreferenced_merge_commit_output ?tree_id:(tree_id_ : object_id option)
    ?commit_id:(commit_id_ : object_id option) () =
  ({ tree_id = tree_id_; commit_id = commit_id_ } : create_unreferenced_merge_commit_output)

let make_create_unreferenced_merge_commit_input
    ?conflict_resolution:(conflict_resolution_ : conflict_resolution option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?commit_message:(commit_message_ : message option) ?email:(email_ : email option)
    ?author_name:(author_name_ : name option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ~merge_option:(merge_option_ : merge_option_type_enum)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     conflict_resolution = conflict_resolution_;
     keep_empty_folders = keep_empty_folders_;
     commit_message = commit_message_;
     email = email_;
     author_name = author_name_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     merge_option = merge_option_;
     destination_commit_specifier = destination_commit_specifier_;
     source_commit_specifier = source_commit_specifier_;
     repository_name = repository_name_;
   }
    : create_unreferenced_merge_commit_input)

let make_create_repository_output
    ?repository_metadata:(repository_metadata_ : repository_metadata option) () =
  ({ repository_metadata = repository_metadata_ } : create_repository_output)

let make_create_repository_input ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?tags:(tags_ : tags_map option)
    ?repository_description:(repository_description_ : repository_description option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     kms_key_id = kms_key_id_;
     tags = tags_;
     repository_description = repository_description_;
     repository_name = repository_name_;
   }
    : create_repository_input)

let make_create_pull_request_output ~pull_request:(pull_request_ : pull_request) () =
  ({ pull_request = pull_request_ } : create_pull_request_output)

let make_create_pull_request_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?description:(description_ : description option) ~targets:(targets_ : target_list)
    ~title:(title_ : title) () =
  ({
     client_request_token = client_request_token_;
     targets = targets_;
     description = description_;
     title = title_;
   }
    : create_pull_request_input)

let make_create_pull_request_approval_rule_output ~approval_rule:(approval_rule_ : approval_rule) ()
    =
  ({ approval_rule = approval_rule_ } : create_pull_request_approval_rule_output)

let make_create_pull_request_approval_rule_input
    ~approval_rule_content:(approval_rule_content_ : approval_rule_content)
    ~approval_rule_name:(approval_rule_name_ : approval_rule_name)
    ~pull_request_id:(pull_request_id_ : pull_request_id) () =
  ({
     approval_rule_content = approval_rule_content_;
     approval_rule_name = approval_rule_name_;
     pull_request_id = pull_request_id_;
   }
    : create_pull_request_approval_rule_input)

let make_create_commit_output ?files_deleted:(files_deleted_ : files_metadata option)
    ?files_updated:(files_updated_ : files_metadata option)
    ?files_added:(files_added_ : files_metadata option) ?tree_id:(tree_id_ : object_id option)
    ?commit_id:(commit_id_ : object_id option) () =
  ({
     files_deleted = files_deleted_;
     files_updated = files_updated_;
     files_added = files_added_;
     tree_id = tree_id_;
     commit_id = commit_id_;
   }
    : create_commit_output)

let make_create_commit_input ?set_file_modes:(set_file_modes_ : set_file_mode_entries option)
    ?delete_files:(delete_files_ : delete_file_entries option)
    ?put_files:(put_files_ : put_file_entries option)
    ?keep_empty_folders:(keep_empty_folders_ : keep_empty_folders option)
    ?commit_message:(commit_message_ : message option) ?email:(email_ : email option)
    ?author_name:(author_name_ : name option)
    ?parent_commit_id:(parent_commit_id_ : commit_id option)
    ~branch_name:(branch_name_ : branch_name) ~repository_name:(repository_name_ : repository_name)
    () =
  ({
     set_file_modes = set_file_modes_;
     delete_files = delete_files_;
     put_files = put_files_;
     keep_empty_folders = keep_empty_folders_;
     commit_message = commit_message_;
     email = email_;
     author_name = author_name_;
     parent_commit_id = parent_commit_id_;
     branch_name = branch_name_;
     repository_name = repository_name_;
   }
    : create_commit_input)

let make_create_branch_input ~commit_id:(commit_id_ : commit_id)
    ~branch_name:(branch_name_ : branch_name) ~repository_name:(repository_name_ : repository_name)
    () =
  ({ commit_id = commit_id_; branch_name = branch_name_; repository_name = repository_name_ }
    : create_branch_input)

let make_create_approval_rule_template_output
    ~approval_rule_template:(approval_rule_template_ : approval_rule_template) () =
  ({ approval_rule_template = approval_rule_template_ } : create_approval_rule_template_output)

let make_create_approval_rule_template_input
    ?approval_rule_template_description:
      (approval_rule_template_description_ : approval_rule_template_description option)
    ~approval_rule_template_content:
      (approval_rule_template_content_ : approval_rule_template_content)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     approval_rule_template_description = approval_rule_template_description_;
     approval_rule_template_content = approval_rule_template_content_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : create_approval_rule_template_input)

let make_conflict ?merge_hunks:(merge_hunks_ : merge_hunks option)
    ?conflict_metadata:(conflict_metadata_ : conflict_metadata option) () =
  ({ merge_hunks = merge_hunks_; conflict_metadata = conflict_metadata_ } : conflict)

let make_batch_get_repositories_error ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : batch_get_repositories_error_code_enum option)
    ?repository_name:(repository_name_ : repository_name option)
    ?repository_id:(repository_id_ : repository_id option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     repository_name = repository_name_;
     repository_id = repository_id_;
   }
    : batch_get_repositories_error)

let make_batch_get_repositories_output ?errors:(errors_ : batch_get_repositories_errors_list option)
    ?repositories_not_found:(repositories_not_found_ : repository_not_found_list option)
    ?repositories:(repositories_ : repository_metadata_list option) () =
  ({
     errors = errors_;
     repositories_not_found = repositories_not_found_;
     repositories = repositories_;
   }
    : batch_get_repositories_output)

let make_batch_get_repositories_input ~repository_names:(repository_names_ : repository_name_list)
    () =
  ({ repository_names = repository_names_ } : batch_get_repositories_input)

let make_batch_get_commits_error ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option) ?commit_id:(commit_id_ : object_id option) () =
  ({ error_message = error_message_; error_code = error_code_; commit_id = commit_id_ }
    : batch_get_commits_error)

let make_batch_get_commits_output ?errors:(errors_ : batch_get_commits_errors_list option)
    ?commits:(commits_ : commit_objects_list option) () =
  ({ errors = errors_; commits = commits_ } : batch_get_commits_output)

let make_batch_get_commits_input ~repository_name:(repository_name_ : repository_name)
    ~commit_ids:(commit_ids_ : commit_ids_input_list) () =
  ({ repository_name = repository_name_; commit_ids = commit_ids_ } : batch_get_commits_input)

let make_batch_disassociate_approval_rule_template_from_repositories_error
    ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({ error_message = error_message_; error_code = error_code_; repository_name = repository_name_ }
    : batch_disassociate_approval_rule_template_from_repositories_error)

let make_batch_disassociate_approval_rule_template_from_repositories_output
    ~errors:(errors_ : batch_disassociate_approval_rule_template_from_repositories_errors_list)
    ~disassociated_repository_names:(disassociated_repository_names_ : repository_name_list) () =
  ({ errors = errors_; disassociated_repository_names = disassociated_repository_names_ }
    : batch_disassociate_approval_rule_template_from_repositories_output)

let make_batch_disassociate_approval_rule_template_from_repositories_input
    ~repository_names:(repository_names_ : repository_name_list)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     repository_names = repository_names_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : batch_disassociate_approval_rule_template_from_repositories_input)

let make_batch_describe_merge_conflicts_error ~message:(message_ : message)
    ~exception_name:(exception_name_ : exception_name) ~file_path:(file_path_ : path) () =
  ({ message = message_; exception_name = exception_name_; file_path = file_path_ }
    : batch_describe_merge_conflicts_error)

let make_batch_describe_merge_conflicts_output ?base_commit_id:(base_commit_id_ : object_id option)
    ?errors:(errors_ : batch_describe_merge_conflicts_errors option)
    ?next_token:(next_token_ : next_token option) ~source_commit_id:(source_commit_id_ : object_id)
    ~destination_commit_id:(destination_commit_id_ : object_id) ~conflicts:(conflicts_ : conflicts)
    () =
  ({
     base_commit_id = base_commit_id_;
     source_commit_id = source_commit_id_;
     destination_commit_id = destination_commit_id_;
     errors = errors_;
     next_token = next_token_;
     conflicts = conflicts_;
   }
    : batch_describe_merge_conflicts_output)

let make_batch_describe_merge_conflicts_input ?next_token:(next_token_ : next_token option)
    ?conflict_resolution_strategy:
      (conflict_resolution_strategy_ : conflict_resolution_strategy_type_enum option)
    ?conflict_detail_level:(conflict_detail_level_ : conflict_detail_level_type_enum option)
    ?file_paths:(file_paths_ : file_paths option)
    ?max_conflict_files:(max_conflict_files_ : max_results option)
    ?max_merge_hunks:(max_merge_hunks_ : max_results option)
    ~merge_option:(merge_option_ : merge_option_type_enum)
    ~source_commit_specifier:(source_commit_specifier_ : commit_name)
    ~destination_commit_specifier:(destination_commit_specifier_ : commit_name)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     next_token = next_token_;
     conflict_resolution_strategy = conflict_resolution_strategy_;
     conflict_detail_level = conflict_detail_level_;
     file_paths = file_paths_;
     max_conflict_files = max_conflict_files_;
     max_merge_hunks = max_merge_hunks_;
     merge_option = merge_option_;
     source_commit_specifier = source_commit_specifier_;
     destination_commit_specifier = destination_commit_specifier_;
     repository_name = repository_name_;
   }
    : batch_describe_merge_conflicts_input)

let make_batch_associate_approval_rule_template_with_repositories_error
    ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({ error_message = error_message_; error_code = error_code_; repository_name = repository_name_ }
    : batch_associate_approval_rule_template_with_repositories_error)

let make_batch_associate_approval_rule_template_with_repositories_output
    ~errors:(errors_ : batch_associate_approval_rule_template_with_repositories_errors_list)
    ~associated_repository_names:(associated_repository_names_ : repository_name_list) () =
  ({ errors = errors_; associated_repository_names = associated_repository_names_ }
    : batch_associate_approval_rule_template_with_repositories_output)

let make_batch_associate_approval_rule_template_with_repositories_input
    ~repository_names:(repository_names_ : repository_name_list)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     repository_names = repository_names_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : batch_associate_approval_rule_template_with_repositories_input)

let make_associate_approval_rule_template_with_repository_input
    ~repository_name:(repository_name_ : repository_name)
    ~approval_rule_template_name:(approval_rule_template_name_ : approval_rule_template_name) () =
  ({
     repository_name = repository_name_;
     approval_rule_template_name = approval_rule_template_name_;
   }
    : associate_approval_rule_template_with_repository_input)
