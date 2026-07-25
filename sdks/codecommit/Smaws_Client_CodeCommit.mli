(** CodeCommit client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_approval : ?user_arn:arn -> ?approval_state:approval_state -> unit -> approval

val make_origin_approval_rule_template :
  ?approval_rule_template_id:approval_rule_template_id ->
  ?approval_rule_template_name:approval_rule_template_name ->
  unit ->
  origin_approval_rule_template

val make_approval_rule :
  ?approval_rule_id:approval_rule_id ->
  ?approval_rule_name:approval_rule_name ->
  ?approval_rule_content:approval_rule_content ->
  ?rule_content_sha256:rule_content_sha256 ->
  ?last_modified_date:last_modified_date ->
  ?creation_date:creation_date ->
  ?last_modified_user:arn ->
  ?origin_approval_rule_template:origin_approval_rule_template ->
  unit ->
  approval_rule

val make_approval_rule_event_metadata :
  ?approval_rule_name:approval_rule_name ->
  ?approval_rule_id:approval_rule_id ->
  ?approval_rule_content:approval_rule_content ->
  unit ->
  approval_rule_event_metadata

val make_approval_rule_overridden_event_metadata :
  ?revision_id:revision_id ->
  ?override_status:override_status ->
  unit ->
  approval_rule_overridden_event_metadata

val make_approval_rule_template :
  ?approval_rule_template_id:approval_rule_template_id ->
  ?approval_rule_template_name:approval_rule_template_name ->
  ?approval_rule_template_description:approval_rule_template_description ->
  ?approval_rule_template_content:approval_rule_template_content ->
  ?rule_content_sha256:rule_content_sha256 ->
  ?last_modified_date:last_modified_date ->
  ?creation_date:creation_date ->
  ?last_modified_user:arn ->
  unit ->
  approval_rule_template

val make_approval_state_changed_event_metadata :
  ?revision_id:revision_id ->
  ?approval_status:approval_state ->
  unit ->
  approval_state_changed_event_metadata

val make_associate_approval_rule_template_with_repository_input :
  approval_rule_template_name:approval_rule_template_name ->
  repository_name:repository_name ->
  unit ->
  associate_approval_rule_template_with_repository_input

val make_batch_associate_approval_rule_template_with_repositories_error :
  ?repository_name:repository_name ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  batch_associate_approval_rule_template_with_repositories_error

val make_batch_associate_approval_rule_template_with_repositories_output :
  associated_repository_names:repository_name_list ->
  errors:batch_associate_approval_rule_template_with_repositories_errors_list ->
  unit ->
  batch_associate_approval_rule_template_with_repositories_output

val make_batch_associate_approval_rule_template_with_repositories_input :
  approval_rule_template_name:approval_rule_template_name ->
  repository_names:repository_name_list ->
  unit ->
  batch_associate_approval_rule_template_with_repositories_input

val make_batch_describe_merge_conflicts_error :
  file_path:path ->
  exception_name:exception_name ->
  message:message ->
  unit ->
  batch_describe_merge_conflicts_error

val make_merge_hunk_detail :
  ?start_line:line_number ->
  ?end_line:line_number ->
  ?hunk_content:hunk_content ->
  unit ->
  merge_hunk_detail

val make_merge_hunk :
  ?is_conflict:is_hunk_conflict ->
  ?source:merge_hunk_detail ->
  ?destination:merge_hunk_detail ->
  ?base:merge_hunk_detail ->
  unit ->
  merge_hunk

val make_merge_operations :
  ?source:change_type_enum -> ?destination:change_type_enum -> unit -> merge_operations

val make_is_binary_file :
  ?source:capital_boolean ->
  ?destination:capital_boolean ->
  ?base:capital_boolean ->
  unit ->
  is_binary_file

val make_object_types :
  ?source:object_type_enum ->
  ?destination:object_type_enum ->
  ?base:object_type_enum ->
  unit ->
  object_types

val make_file_modes :
  ?source:file_mode_type_enum ->
  ?destination:file_mode_type_enum ->
  ?base:file_mode_type_enum ->
  unit ->
  file_modes

val make_file_sizes :
  ?source:file_size -> ?destination:file_size -> ?base:file_size -> unit -> file_sizes

val make_conflict_metadata :
  ?file_path:path ->
  ?file_sizes:file_sizes ->
  ?file_modes:file_modes ->
  ?object_types:object_types ->
  ?number_of_conflicts:number_of_conflicts ->
  ?is_binary_file:is_binary_file ->
  ?content_conflict:is_content_conflict ->
  ?file_mode_conflict:is_file_mode_conflict ->
  ?object_type_conflict:is_object_type_conflict ->
  ?merge_operations:merge_operations ->
  unit ->
  conflict_metadata

val make_conflict :
  ?conflict_metadata:conflict_metadata -> ?merge_hunks:merge_hunks -> unit -> conflict

val make_batch_describe_merge_conflicts_output :
  ?next_token:next_token ->
  ?errors:batch_describe_merge_conflicts_errors ->
  ?base_commit_id:object_id ->
  conflicts:conflicts ->
  destination_commit_id:object_id ->
  source_commit_id:object_id ->
  unit ->
  batch_describe_merge_conflicts_output

val make_batch_describe_merge_conflicts_input :
  ?max_merge_hunks:max_results ->
  ?max_conflict_files:max_results ->
  ?file_paths:file_paths ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?next_token:next_token ->
  repository_name:repository_name ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  merge_option:merge_option_type_enum ->
  unit ->
  batch_describe_merge_conflicts_input

val make_batch_disassociate_approval_rule_template_from_repositories_error :
  ?repository_name:repository_name ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  batch_disassociate_approval_rule_template_from_repositories_error

val make_batch_disassociate_approval_rule_template_from_repositories_output :
  disassociated_repository_names:repository_name_list ->
  errors:batch_disassociate_approval_rule_template_from_repositories_errors_list ->
  unit ->
  batch_disassociate_approval_rule_template_from_repositories_output

val make_batch_disassociate_approval_rule_template_from_repositories_input :
  approval_rule_template_name:approval_rule_template_name ->
  repository_names:repository_name_list ->
  unit ->
  batch_disassociate_approval_rule_template_from_repositories_input

val make_batch_get_commits_error :
  ?commit_id:object_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  batch_get_commits_error

val make_user_info : ?name:name -> ?email:email -> ?date:date -> unit -> user_info

val make_commit :
  ?commit_id:object_id ->
  ?tree_id:object_id ->
  ?parents:parent_list ->
  ?message:message ->
  ?author:user_info ->
  ?committer:user_info ->
  ?additional_data:additional_data ->
  unit ->
  commit

val make_batch_get_commits_output :
  ?commits:commit_objects_list ->
  ?errors:batch_get_commits_errors_list ->
  unit ->
  batch_get_commits_output

val make_batch_get_commits_input :
  commit_ids:commit_ids_input_list ->
  repository_name:repository_name ->
  unit ->
  batch_get_commits_input

val make_batch_get_repositories_error :
  ?repository_id:repository_id ->
  ?repository_name:repository_name ->
  ?error_code:batch_get_repositories_error_code_enum ->
  ?error_message:error_message ->
  unit ->
  batch_get_repositories_error

val make_repository_metadata :
  ?account_id:account_id ->
  ?repository_id:repository_id ->
  ?repository_name:repository_name ->
  ?repository_description:repository_description ->
  ?default_branch:branch_name ->
  ?last_modified_date:last_modified_date ->
  ?creation_date:creation_date ->
  ?clone_url_http:clone_url_http ->
  ?clone_url_ssh:clone_url_ssh ->
  ?arn:arn ->
  ?kms_key_id:kms_key_id ->
  unit ->
  repository_metadata

val make_batch_get_repositories_output :
  ?repositories:repository_metadata_list ->
  ?repositories_not_found:repository_not_found_list ->
  ?errors:batch_get_repositories_errors_list ->
  unit ->
  batch_get_repositories_output

val make_batch_get_repositories_input :
  repository_names:repository_name_list -> unit -> batch_get_repositories_input

val make_blob_metadata : ?blob_id:object_id -> ?path:path -> ?mode:mode -> unit -> blob_metadata
val make_branch_info : ?branch_name:branch_name -> ?commit_id:commit_id -> unit -> branch_info

val make_update_repository_name_input :
  old_name:repository_name -> new_name:repository_name -> unit -> update_repository_name_input

val make_update_repository_encryption_key_output :
  ?repository_id:repository_id ->
  ?kms_key_id:kms_key_id ->
  ?original_kms_key_id:kms_key_id ->
  unit ->
  update_repository_encryption_key_output

val make_update_repository_encryption_key_input :
  repository_name:repository_name ->
  kms_key_id:kms_key_id ->
  unit ->
  update_repository_encryption_key_input

val make_update_repository_description_input :
  ?repository_description:repository_description ->
  repository_name:repository_name ->
  unit ->
  update_repository_description_input

val make_merge_metadata :
  ?is_merged:is_merged ->
  ?merged_by:arn ->
  ?merge_commit_id:commit_id ->
  ?merge_option:merge_option_type_enum ->
  unit ->
  merge_metadata

val make_pull_request_target :
  ?repository_name:repository_name ->
  ?source_reference:reference_name ->
  ?destination_reference:reference_name ->
  ?destination_commit:commit_id ->
  ?source_commit:commit_id ->
  ?merge_base:commit_id ->
  ?merge_metadata:merge_metadata ->
  unit ->
  pull_request_target

val make_pull_request :
  ?pull_request_id:pull_request_id ->
  ?title:title ->
  ?description:description ->
  ?last_activity_date:last_modified_date ->
  ?creation_date:creation_date ->
  ?pull_request_status:pull_request_status_enum ->
  ?author_arn:arn ->
  ?pull_request_targets:pull_request_target_list ->
  ?client_request_token:client_request_token ->
  ?revision_id:revision_id ->
  ?approval_rules:approval_rules_list ->
  unit ->
  pull_request

val make_update_pull_request_title_output :
  pull_request:pull_request -> unit -> update_pull_request_title_output

val make_update_pull_request_title_input :
  pull_request_id:pull_request_id -> title:title -> unit -> update_pull_request_title_input

val make_update_pull_request_status_output :
  pull_request:pull_request -> unit -> update_pull_request_status_output

val make_update_pull_request_status_input :
  pull_request_id:pull_request_id ->
  pull_request_status:pull_request_status_enum ->
  unit ->
  update_pull_request_status_input

val make_update_pull_request_description_output :
  pull_request:pull_request -> unit -> update_pull_request_description_output

val make_update_pull_request_description_input :
  pull_request_id:pull_request_id ->
  description:description ->
  unit ->
  update_pull_request_description_input

val make_update_pull_request_approval_state_input :
  pull_request_id:pull_request_id ->
  revision_id:revision_id ->
  approval_state:approval_state ->
  unit ->
  update_pull_request_approval_state_input

val make_update_pull_request_approval_rule_content_output :
  approval_rule:approval_rule -> unit -> update_pull_request_approval_rule_content_output

val make_update_pull_request_approval_rule_content_input :
  ?existing_rule_content_sha256:rule_content_sha256 ->
  pull_request_id:pull_request_id ->
  approval_rule_name:approval_rule_name ->
  new_rule_content:approval_rule_content ->
  unit ->
  update_pull_request_approval_rule_content_input

val make_update_default_branch_input :
  repository_name:repository_name ->
  default_branch_name:branch_name ->
  unit ->
  update_default_branch_input

val make_comment :
  ?comment_id:comment_id ->
  ?content:content ->
  ?in_reply_to:comment_id ->
  ?creation_date:creation_date ->
  ?last_modified_date:last_modified_date ->
  ?author_arn:arn ->
  ?deleted:is_comment_deleted ->
  ?client_request_token:client_request_token ->
  ?caller_reactions:caller_reactions ->
  ?reaction_counts:reaction_counts_map ->
  unit ->
  comment

val make_update_comment_output : ?comment:comment -> unit -> update_comment_output

val make_update_comment_input :
  comment_id:comment_id -> content:content -> unit -> update_comment_input

val make_update_approval_rule_template_name_output :
  approval_rule_template:approval_rule_template -> unit -> update_approval_rule_template_name_output

val make_update_approval_rule_template_name_input :
  old_approval_rule_template_name:approval_rule_template_name ->
  new_approval_rule_template_name:approval_rule_template_name ->
  unit ->
  update_approval_rule_template_name_input

val make_update_approval_rule_template_description_output :
  approval_rule_template:approval_rule_template ->
  unit ->
  update_approval_rule_template_description_output

val make_update_approval_rule_template_description_input :
  approval_rule_template_name:approval_rule_template_name ->
  approval_rule_template_description:approval_rule_template_description ->
  unit ->
  update_approval_rule_template_description_input

val make_update_approval_rule_template_content_output :
  approval_rule_template:approval_rule_template ->
  unit ->
  update_approval_rule_template_content_output

val make_update_approval_rule_template_content_input :
  ?existing_rule_content_sha256:rule_content_sha256 ->
  approval_rule_template_name:approval_rule_template_name ->
  new_rule_content:approval_rule_template_content ->
  unit ->
  update_approval_rule_template_content_input

val make_untag_resource_input :
  resource_arn:resource_arn -> tag_keys:tag_keys_list -> unit -> untag_resource_input

val make_repository_trigger_execution_failure :
  ?trigger:repository_trigger_name ->
  ?failure_message:repository_trigger_execution_failure_message ->
  unit ->
  repository_trigger_execution_failure

val make_test_repository_triggers_output :
  ?successful_executions:repository_trigger_name_list ->
  ?failed_executions:repository_trigger_execution_failure_list ->
  unit ->
  test_repository_triggers_output

val make_repository_trigger :
  ?custom_data:repository_trigger_custom_data ->
  ?branches:branch_name_list ->
  name:repository_trigger_name ->
  destination_arn:arn ->
  events:repository_trigger_event_list ->
  unit ->
  repository_trigger

val make_test_repository_triggers_input :
  repository_name:repository_name ->
  triggers:repository_triggers_list ->
  unit ->
  test_repository_triggers_input

val make_tag_resource_input :
  resource_arn:resource_arn -> tags:tags_map -> unit -> tag_resource_input

val make_put_repository_triggers_output :
  ?configuration_id:repository_triggers_configuration_id -> unit -> put_repository_triggers_output

val make_put_repository_triggers_input :
  repository_name:repository_name ->
  triggers:repository_triggers_list ->
  unit ->
  put_repository_triggers_input

val make_put_file_output :
  commit_id:object_id -> blob_id:object_id -> tree_id:object_id -> unit -> put_file_output

val make_put_file_input :
  ?file_mode:file_mode_type_enum ->
  ?parent_commit_id:commit_id ->
  ?commit_message:message ->
  ?name:name ->
  ?email:email ->
  repository_name:repository_name ->
  branch_name:branch_name ->
  file_content:file_content ->
  file_path:path ->
  unit ->
  put_file_input

val make_put_comment_reaction_input :
  comment_id:comment_id -> reaction_value:reaction_value -> unit -> put_comment_reaction_input

val make_post_comment_reply_output : ?comment:comment -> unit -> post_comment_reply_output

val make_post_comment_reply_input :
  ?client_request_token:client_request_token ->
  in_reply_to:comment_id ->
  content:content ->
  unit ->
  post_comment_reply_input

val make_location :
  ?file_path:path ->
  ?file_position:position ->
  ?relative_file_version:relative_file_version_enum ->
  unit ->
  location

val make_post_comment_for_pull_request_output :
  ?repository_name:repository_name ->
  ?pull_request_id:pull_request_id ->
  ?before_commit_id:commit_id ->
  ?after_commit_id:commit_id ->
  ?before_blob_id:object_id ->
  ?after_blob_id:object_id ->
  ?location:location ->
  ?comment:comment ->
  unit ->
  post_comment_for_pull_request_output

val make_post_comment_for_pull_request_input :
  ?location:location ->
  ?client_request_token:client_request_token ->
  pull_request_id:pull_request_id ->
  repository_name:repository_name ->
  before_commit_id:commit_id ->
  after_commit_id:commit_id ->
  content:content ->
  unit ->
  post_comment_for_pull_request_input

val make_post_comment_for_compared_commit_output :
  ?repository_name:repository_name ->
  ?before_commit_id:commit_id ->
  ?after_commit_id:commit_id ->
  ?before_blob_id:object_id ->
  ?after_blob_id:object_id ->
  ?location:location ->
  ?comment:comment ->
  unit ->
  post_comment_for_compared_commit_output

val make_post_comment_for_compared_commit_input :
  ?before_commit_id:commit_id ->
  ?location:location ->
  ?client_request_token:client_request_token ->
  repository_name:repository_name ->
  after_commit_id:commit_id ->
  content:content ->
  unit ->
  post_comment_for_compared_commit_input

val make_override_pull_request_approval_rules_input :
  pull_request_id:pull_request_id ->
  revision_id:revision_id ->
  override_status:override_status ->
  unit ->
  override_pull_request_approval_rules_input

val make_merge_pull_request_by_three_way_output :
  ?pull_request:pull_request -> unit -> merge_pull_request_by_three_way_output

val make_set_file_mode_entry :
  file_path:path -> file_mode:file_mode_type_enum -> unit -> set_file_mode_entry

val make_delete_file_entry : file_path:path -> unit -> delete_file_entry

val make_replace_content_entry :
  ?content:file_content ->
  ?file_mode:file_mode_type_enum ->
  file_path:path ->
  replacement_type:replacement_type_enum ->
  unit ->
  replace_content_entry

val make_conflict_resolution :
  ?replace_contents:replace_content_entries ->
  ?delete_files:delete_file_entries ->
  ?set_file_modes:set_file_mode_entries ->
  unit ->
  conflict_resolution

val make_merge_pull_request_by_three_way_input :
  ?source_commit_id:object_id ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?commit_message:message ->
  ?author_name:name ->
  ?email:email ->
  ?keep_empty_folders:keep_empty_folders ->
  ?conflict_resolution:conflict_resolution ->
  pull_request_id:pull_request_id ->
  repository_name:repository_name ->
  unit ->
  merge_pull_request_by_three_way_input

val make_merge_pull_request_by_squash_output :
  ?pull_request:pull_request -> unit -> merge_pull_request_by_squash_output

val make_merge_pull_request_by_squash_input :
  ?source_commit_id:object_id ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?commit_message:message ->
  ?author_name:name ->
  ?email:email ->
  ?keep_empty_folders:keep_empty_folders ->
  ?conflict_resolution:conflict_resolution ->
  pull_request_id:pull_request_id ->
  repository_name:repository_name ->
  unit ->
  merge_pull_request_by_squash_input

val make_merge_pull_request_by_fast_forward_output :
  ?pull_request:pull_request -> unit -> merge_pull_request_by_fast_forward_output

val make_merge_pull_request_by_fast_forward_input :
  ?source_commit_id:object_id ->
  pull_request_id:pull_request_id ->
  repository_name:repository_name ->
  unit ->
  merge_pull_request_by_fast_forward_input

val make_merge_branches_by_three_way_output :
  ?commit_id:object_id -> ?tree_id:object_id -> unit -> merge_branches_by_three_way_output

val make_merge_branches_by_three_way_input :
  ?target_branch:branch_name ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?author_name:name ->
  ?email:email ->
  ?commit_message:message ->
  ?keep_empty_folders:keep_empty_folders ->
  ?conflict_resolution:conflict_resolution ->
  repository_name:repository_name ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  unit ->
  merge_branches_by_three_way_input

val make_merge_branches_by_squash_output :
  ?commit_id:object_id -> ?tree_id:object_id -> unit -> merge_branches_by_squash_output

val make_merge_branches_by_squash_input :
  ?target_branch:branch_name ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?author_name:name ->
  ?email:email ->
  ?commit_message:message ->
  ?keep_empty_folders:keep_empty_folders ->
  ?conflict_resolution:conflict_resolution ->
  repository_name:repository_name ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  unit ->
  merge_branches_by_squash_input

val make_merge_branches_by_fast_forward_output :
  ?commit_id:object_id -> ?tree_id:object_id -> unit -> merge_branches_by_fast_forward_output

val make_merge_branches_by_fast_forward_input :
  ?target_branch:branch_name ->
  repository_name:repository_name ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  unit ->
  merge_branches_by_fast_forward_input

val make_list_tags_for_resource_output :
  ?tags:tags_map -> ?next_token:next_token -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?next_token:next_token -> resource_arn:resource_arn -> unit -> list_tags_for_resource_input

val make_list_repositories_for_approval_rule_template_output :
  ?repository_names:repository_name_list ->
  ?next_token:next_token ->
  unit ->
  list_repositories_for_approval_rule_template_output

val make_list_repositories_for_approval_rule_template_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  list_repositories_for_approval_rule_template_input

val make_repository_name_id_pair :
  ?repository_name:repository_name ->
  ?repository_id:repository_id ->
  unit ->
  repository_name_id_pair

val make_list_repositories_output :
  ?repositories:repository_name_id_pair_list ->
  ?next_token:next_token ->
  unit ->
  list_repositories_output

val make_list_repositories_input :
  ?next_token:next_token ->
  ?sort_by:sort_by_enum ->
  ?order:order_enum ->
  unit ->
  list_repositories_input

val make_list_pull_requests_output :
  ?next_token:next_token ->
  pull_request_ids:pull_request_id_list ->
  unit ->
  list_pull_requests_output

val make_list_pull_requests_input :
  ?author_arn:arn ->
  ?pull_request_status:pull_request_status_enum ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  repository_name:repository_name ->
  unit ->
  list_pull_requests_input

val make_file_version :
  ?commit:commit ->
  ?blob_id:object_id ->
  ?path:path ->
  ?revision_children:revision_children ->
  unit ->
  file_version

val make_list_file_commit_history_response :
  ?next_token:next_token -> revision_dag:revision_dag -> unit -> list_file_commit_history_response

val make_list_file_commit_history_request :
  ?commit_specifier:commit_name ->
  ?max_results:limit ->
  ?next_token:next_token ->
  repository_name:repository_name ->
  file_path:path ->
  unit ->
  list_file_commit_history_request

val make_list_branches_output :
  ?branches:branch_name_list -> ?next_token:next_token -> unit -> list_branches_output

val make_list_branches_input :
  ?next_token:next_token -> repository_name:repository_name -> unit -> list_branches_input

val make_list_associated_approval_rule_templates_for_repository_output :
  ?approval_rule_template_names:approval_rule_template_name_list ->
  ?next_token:next_token ->
  unit ->
  list_associated_approval_rule_templates_for_repository_output

val make_list_associated_approval_rule_templates_for_repository_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  repository_name:repository_name ->
  unit ->
  list_associated_approval_rule_templates_for_repository_input

val make_list_approval_rule_templates_output :
  ?approval_rule_template_names:approval_rule_template_name_list ->
  ?next_token:next_token ->
  unit ->
  list_approval_rule_templates_output

val make_list_approval_rule_templates_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_approval_rule_templates_input

val make_get_repository_triggers_output :
  ?configuration_id:repository_triggers_configuration_id ->
  ?triggers:repository_triggers_list ->
  unit ->
  get_repository_triggers_output

val make_get_repository_triggers_input :
  repository_name:repository_name -> unit -> get_repository_triggers_input

val make_get_repository_output :
  ?repository_metadata:repository_metadata -> unit -> get_repository_output

val make_get_repository_input : repository_name:repository_name -> unit -> get_repository_input

val make_get_pull_request_override_state_output :
  ?overridden:overridden -> ?overrider:arn -> unit -> get_pull_request_override_state_output

val make_get_pull_request_override_state_input :
  pull_request_id:pull_request_id ->
  revision_id:revision_id ->
  unit ->
  get_pull_request_override_state_input

val make_get_pull_request_approval_states_output :
  ?approvals:approval_list -> unit -> get_pull_request_approval_states_output

val make_get_pull_request_approval_states_input :
  pull_request_id:pull_request_id ->
  revision_id:revision_id ->
  unit ->
  get_pull_request_approval_states_input

val make_get_pull_request_output : pull_request:pull_request -> unit -> get_pull_request_output
val make_get_pull_request_input : pull_request_id:pull_request_id -> unit -> get_pull_request_input

val make_get_merge_options_output :
  merge_options:merge_options ->
  source_commit_id:object_id ->
  destination_commit_id:object_id ->
  base_commit_id:object_id ->
  unit ->
  get_merge_options_output

val make_get_merge_options_input :
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  repository_name:repository_name ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  unit ->
  get_merge_options_input

val make_get_merge_conflicts_output :
  ?base_commit_id:object_id ->
  ?next_token:next_token ->
  mergeable:is_mergeable ->
  destination_commit_id:object_id ->
  source_commit_id:object_id ->
  conflict_metadata_list:conflict_metadata_list ->
  unit ->
  get_merge_conflicts_output

val make_get_merge_conflicts_input :
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?max_conflict_files:max_results ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?next_token:next_token ->
  repository_name:repository_name ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  merge_option:merge_option_type_enum ->
  unit ->
  get_merge_conflicts_input

val make_get_merge_commit_output :
  ?source_commit_id:object_id ->
  ?destination_commit_id:object_id ->
  ?base_commit_id:object_id ->
  ?merged_commit_id:object_id ->
  unit ->
  get_merge_commit_output

val make_get_merge_commit_input :
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  repository_name:repository_name ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  unit ->
  get_merge_commit_input

val make_sub_module :
  ?commit_id:object_id -> ?absolute_path:path -> ?relative_path:path -> unit -> sub_module

val make_symbolic_link :
  ?blob_id:object_id ->
  ?absolute_path:path ->
  ?relative_path:path ->
  ?file_mode:file_mode_type_enum ->
  unit ->
  symbolic_link

val make_file :
  ?blob_id:object_id ->
  ?absolute_path:path ->
  ?relative_path:path ->
  ?file_mode:file_mode_type_enum ->
  unit ->
  file

val make_folder : ?tree_id:object_id -> ?absolute_path:path -> ?relative_path:path -> unit -> folder

val make_get_folder_output :
  ?tree_id:object_id ->
  ?sub_folders:folder_list ->
  ?files:file_list ->
  ?symbolic_links:symbolic_link_list ->
  ?sub_modules:sub_module_list ->
  commit_id:object_id ->
  folder_path:path ->
  unit ->
  get_folder_output

val make_get_folder_input :
  ?commit_specifier:commit_name ->
  repository_name:repository_name ->
  folder_path:path ->
  unit ->
  get_folder_input

val make_get_file_output :
  commit_id:object_id ->
  blob_id:object_id ->
  file_path:path ->
  file_mode:file_mode_type_enum ->
  file_size:object_size ->
  file_content:file_content ->
  unit ->
  get_file_output

val make_get_file_input :
  ?commit_specifier:commit_name ->
  repository_name:repository_name ->
  file_path:path ->
  unit ->
  get_file_input

val make_difference :
  ?before_blob:blob_metadata ->
  ?after_blob:blob_metadata ->
  ?change_type:change_type_enum ->
  unit ->
  difference

val make_get_differences_output :
  ?differences:difference_list -> ?next_token:next_token -> unit -> get_differences_output

val make_get_differences_input :
  ?before_commit_specifier:commit_name ->
  ?before_path:path ->
  ?after_path:path ->
  ?max_results:limit ->
  ?next_token:next_token ->
  repository_name:repository_name ->
  after_commit_specifier:commit_name ->
  unit ->
  get_differences_input

val make_get_commit_output : commit:commit -> unit -> get_commit_output

val make_get_commit_input :
  repository_name:repository_name -> commit_id:object_id -> unit -> get_commit_input

val make_comments_for_pull_request :
  ?pull_request_id:pull_request_id ->
  ?repository_name:repository_name ->
  ?before_commit_id:commit_id ->
  ?after_commit_id:commit_id ->
  ?before_blob_id:object_id ->
  ?after_blob_id:object_id ->
  ?location:location ->
  ?comments:comments ->
  unit ->
  comments_for_pull_request

val make_get_comments_for_pull_request_output :
  ?comments_for_pull_request_data:comments_for_pull_request_data ->
  ?next_token:next_token ->
  unit ->
  get_comments_for_pull_request_output

val make_get_comments_for_pull_request_input :
  ?repository_name:repository_name ->
  ?before_commit_id:commit_id ->
  ?after_commit_id:commit_id ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  pull_request_id:pull_request_id ->
  unit ->
  get_comments_for_pull_request_input

val make_comments_for_compared_commit :
  ?repository_name:repository_name ->
  ?before_commit_id:commit_id ->
  ?after_commit_id:commit_id ->
  ?before_blob_id:object_id ->
  ?after_blob_id:object_id ->
  ?location:location ->
  ?comments:comments ->
  unit ->
  comments_for_compared_commit

val make_get_comments_for_compared_commit_output :
  ?comments_for_compared_commit_data:comments_for_compared_commit_data ->
  ?next_token:next_token ->
  unit ->
  get_comments_for_compared_commit_output

val make_get_comments_for_compared_commit_input :
  ?before_commit_id:commit_id ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  repository_name:repository_name ->
  after_commit_id:commit_id ->
  unit ->
  get_comments_for_compared_commit_input

val make_reaction_value_formats :
  ?emoji:reaction_emoji ->
  ?short_code:reaction_short_code ->
  ?unicode:reaction_unicode ->
  unit ->
  reaction_value_formats

val make_reaction_for_comment :
  ?reaction:reaction_value_formats ->
  ?reaction_users:reaction_users_list ->
  ?reactions_from_deleted_users_count:count ->
  unit ->
  reaction_for_comment

val make_get_comment_reactions_output :
  ?next_token:next_token ->
  reactions_for_comment:reactions_for_comment_list ->
  unit ->
  get_comment_reactions_output

val make_get_comment_reactions_input :
  ?reaction_user_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  comment_id:comment_id ->
  unit ->
  get_comment_reactions_input

val make_get_comment_output : ?comment:comment -> unit -> get_comment_output
val make_get_comment_input : comment_id:comment_id -> unit -> get_comment_input
val make_get_branch_output : ?branch:branch_info -> unit -> get_branch_output

val make_get_branch_input :
  ?repository_name:repository_name -> ?branch_name:branch_name -> unit -> get_branch_input

val make_get_blob_output : content:blob -> unit -> get_blob_output

val make_get_blob_input :
  repository_name:repository_name -> blob_id:object_id -> unit -> get_blob_input

val make_get_approval_rule_template_output :
  approval_rule_template:approval_rule_template -> unit -> get_approval_rule_template_output

val make_get_approval_rule_template_input :
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  get_approval_rule_template_input

val make_evaluation :
  ?approved:approved ->
  ?overridden:overridden ->
  ?approval_rules_satisfied:approval_rules_satisfied_list ->
  ?approval_rules_not_satisfied:approval_rules_not_satisfied_list ->
  unit ->
  evaluation

val make_evaluate_pull_request_approval_rules_output :
  evaluation:evaluation -> unit -> evaluate_pull_request_approval_rules_output

val make_evaluate_pull_request_approval_rules_input :
  pull_request_id:pull_request_id ->
  revision_id:revision_id ->
  unit ->
  evaluate_pull_request_approval_rules_input

val make_disassociate_approval_rule_template_from_repository_input :
  approval_rule_template_name:approval_rule_template_name ->
  repository_name:repository_name ->
  unit ->
  disassociate_approval_rule_template_from_repository_input

val make_pull_request_merged_state_changed_event_metadata :
  ?repository_name:repository_name ->
  ?destination_reference:reference_name ->
  ?merge_metadata:merge_metadata ->
  unit ->
  pull_request_merged_state_changed_event_metadata

val make_pull_request_source_reference_updated_event_metadata :
  ?repository_name:repository_name ->
  ?before_commit_id:commit_id ->
  ?after_commit_id:commit_id ->
  ?merge_base:commit_id ->
  unit ->
  pull_request_source_reference_updated_event_metadata

val make_pull_request_status_changed_event_metadata :
  ?pull_request_status:pull_request_status_enum ->
  unit ->
  pull_request_status_changed_event_metadata

val make_pull_request_created_event_metadata :
  ?repository_name:repository_name ->
  ?source_commit_id:commit_id ->
  ?destination_commit_id:commit_id ->
  ?merge_base:commit_id ->
  unit ->
  pull_request_created_event_metadata

val make_pull_request_event :
  ?pull_request_id:pull_request_id ->
  ?event_date:event_date ->
  ?pull_request_event_type:pull_request_event_type ->
  ?actor_arn:arn ->
  ?pull_request_created_event_metadata:pull_request_created_event_metadata ->
  ?pull_request_status_changed_event_metadata:pull_request_status_changed_event_metadata ->
  ?pull_request_source_reference_updated_event_metadata:
    pull_request_source_reference_updated_event_metadata ->
  ?pull_request_merged_state_changed_event_metadata:pull_request_merged_state_changed_event_metadata ->
  ?approval_rule_event_metadata:approval_rule_event_metadata ->
  ?approval_state_changed_event_metadata:approval_state_changed_event_metadata ->
  ?approval_rule_overridden_event_metadata:approval_rule_overridden_event_metadata ->
  unit ->
  pull_request_event

val make_describe_pull_request_events_output :
  ?next_token:next_token ->
  pull_request_events:pull_request_event_list ->
  unit ->
  describe_pull_request_events_output

val make_describe_pull_request_events_input :
  ?pull_request_event_type:pull_request_event_type ->
  ?actor_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  pull_request_id:pull_request_id ->
  unit ->
  describe_pull_request_events_input

val make_describe_merge_conflicts_output :
  ?next_token:next_token ->
  ?base_commit_id:object_id ->
  conflict_metadata:conflict_metadata ->
  merge_hunks:merge_hunks ->
  destination_commit_id:object_id ->
  source_commit_id:object_id ->
  unit ->
  describe_merge_conflicts_output

val make_describe_merge_conflicts_input :
  ?max_merge_hunks:max_results ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?next_token:next_token ->
  repository_name:repository_name ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  merge_option:merge_option_type_enum ->
  file_path:path ->
  unit ->
  describe_merge_conflicts_input

val make_delete_repository_output : ?repository_id:repository_id -> unit -> delete_repository_output

val make_delete_repository_input :
  repository_name:repository_name -> unit -> delete_repository_input

val make_delete_pull_request_approval_rule_output :
  approval_rule_id:approval_rule_id -> unit -> delete_pull_request_approval_rule_output

val make_delete_pull_request_approval_rule_input :
  pull_request_id:pull_request_id ->
  approval_rule_name:approval_rule_name ->
  unit ->
  delete_pull_request_approval_rule_input

val make_delete_file_output :
  commit_id:object_id ->
  blob_id:object_id ->
  tree_id:object_id ->
  file_path:path ->
  unit ->
  delete_file_output

val make_delete_file_input :
  ?keep_empty_folders:keep_empty_folders ->
  ?commit_message:message ->
  ?name:name ->
  ?email:email ->
  repository_name:repository_name ->
  branch_name:branch_name ->
  file_path:path ->
  parent_commit_id:commit_id ->
  unit ->
  delete_file_input

val make_delete_comment_content_output : ?comment:comment -> unit -> delete_comment_content_output

val make_delete_comment_content_input :
  comment_id:comment_id -> unit -> delete_comment_content_input

val make_delete_branch_output : ?deleted_branch:branch_info -> unit -> delete_branch_output

val make_delete_branch_input :
  repository_name:repository_name -> branch_name:branch_name -> unit -> delete_branch_input

val make_delete_approval_rule_template_output :
  approval_rule_template_id:approval_rule_template_id ->
  unit ->
  delete_approval_rule_template_output

val make_delete_approval_rule_template_input :
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  delete_approval_rule_template_input

val make_create_unreferenced_merge_commit_output :
  ?commit_id:object_id -> ?tree_id:object_id -> unit -> create_unreferenced_merge_commit_output

val make_create_unreferenced_merge_commit_input :
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?author_name:name ->
  ?email:email ->
  ?commit_message:message ->
  ?keep_empty_folders:keep_empty_folders ->
  ?conflict_resolution:conflict_resolution ->
  repository_name:repository_name ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  merge_option:merge_option_type_enum ->
  unit ->
  create_unreferenced_merge_commit_input

val make_create_repository_output :
  ?repository_metadata:repository_metadata -> unit -> create_repository_output

val make_create_repository_input :
  ?repository_description:repository_description ->
  ?tags:tags_map ->
  ?kms_key_id:kms_key_id ->
  repository_name:repository_name ->
  unit ->
  create_repository_input

val make_create_pull_request_approval_rule_output :
  approval_rule:approval_rule -> unit -> create_pull_request_approval_rule_output

val make_create_pull_request_approval_rule_input :
  pull_request_id:pull_request_id ->
  approval_rule_name:approval_rule_name ->
  approval_rule_content:approval_rule_content ->
  unit ->
  create_pull_request_approval_rule_input

val make_create_pull_request_output :
  pull_request:pull_request -> unit -> create_pull_request_output

val make_target :
  ?destination_reference:reference_name ->
  repository_name:repository_name ->
  source_reference:reference_name ->
  unit ->
  target

val make_create_pull_request_input :
  ?description:description ->
  ?client_request_token:client_request_token ->
  title:title ->
  targets:target_list ->
  unit ->
  create_pull_request_input

val make_file_metadata :
  ?absolute_path:path ->
  ?blob_id:object_id ->
  ?file_mode:file_mode_type_enum ->
  unit ->
  file_metadata

val make_create_commit_output :
  ?commit_id:object_id ->
  ?tree_id:object_id ->
  ?files_added:files_metadata ->
  ?files_updated:files_metadata ->
  ?files_deleted:files_metadata ->
  unit ->
  create_commit_output

val make_source_file_specifier : ?is_move:is_move -> file_path:path -> unit -> source_file_specifier

val make_put_file_entry :
  ?file_mode:file_mode_type_enum ->
  ?file_content:file_content ->
  ?source_file:source_file_specifier ->
  file_path:path ->
  unit ->
  put_file_entry

val make_create_commit_input :
  ?parent_commit_id:commit_id ->
  ?author_name:name ->
  ?email:email ->
  ?commit_message:message ->
  ?keep_empty_folders:keep_empty_folders ->
  ?put_files:put_file_entries ->
  ?delete_files:delete_file_entries ->
  ?set_file_modes:set_file_mode_entries ->
  repository_name:repository_name ->
  branch_name:branch_name ->
  unit ->
  create_commit_input

val make_create_branch_input :
  repository_name:repository_name ->
  branch_name:branch_name ->
  commit_id:commit_id ->
  unit ->
  create_branch_input

val make_create_approval_rule_template_output :
  approval_rule_template:approval_rule_template -> unit -> create_approval_rule_template_output

val make_create_approval_rule_template_input :
  ?approval_rule_template_description:approval_rule_template_description ->
  approval_rule_template_name:approval_rule_template_name ->
  approval_rule_template_content:approval_rule_template_content ->
  unit ->
  create_approval_rule_template_input
(** {1:operations Operations} *)

module CreateApprovalRuleTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateContentRequiredException of
      approval_rule_template_content_required_exception
    | `ApprovalRuleTemplateNameAlreadyExistsException of
      approval_rule_template_name_already_exists_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `InvalidApprovalRuleTemplateContentException of
      invalid_approval_rule_template_content_exception
    | `InvalidApprovalRuleTemplateDescriptionException of
      invalid_approval_rule_template_description_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
    | `NumberOfRuleTemplatesExceededException of number_of_rule_templates_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_approval_rule_template_input ->
    ( create_approval_rule_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateContentRequiredException of
        approval_rule_template_content_required_exception
      | `ApprovalRuleTemplateNameAlreadyExistsException of
        approval_rule_template_name_already_exists_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateContentException of
        invalid_approval_rule_template_content_exception
      | `InvalidApprovalRuleTemplateDescriptionException of
        invalid_approval_rule_template_description_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `NumberOfRuleTemplatesExceededException of number_of_rule_templates_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_approval_rule_template_input ->
    ( create_approval_rule_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateContentRequiredException of
        approval_rule_template_content_required_exception
      | `ApprovalRuleTemplateNameAlreadyExistsException of
        approval_rule_template_name_already_exists_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateContentException of
        invalid_approval_rule_template_content_exception
      | `InvalidApprovalRuleTemplateDescriptionException of
        invalid_approval_rule_template_description_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `NumberOfRuleTemplatesExceededException of number_of_rule_templates_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a template for approval rules that can then be associated with one or more repositories \
   in your Amazon Web Services account. When you associate a template with a repository, \
   CodeCommit creates an approval rule that matches the conditions of the template for all pull \
   requests that meet the conditions of the template. For more information, see \
   [AssociateApprovalRuleTemplateWithRepository].\n"]

module CreateBranch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchNameExistsException of branch_name_exists_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitIdRequiredException of commit_id_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_branch_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchNameExistsException of branch_name_exists_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_branch_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchNameExistsException of branch_name_exists_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a branch in a repository and points the branch to a commit.\n\n\
  \  Calling the create branch operation does not set a repository's default branch. To do this, \
   call the update default branch operation.\n\
  \  \n\
  \   "]

module CreateCommit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchDoesNotExistException of branch_does_not_exist_exception
    | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
    | `DirectoryNameConflictsWithFileNameException of
      directory_name_conflicts_with_file_name_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileContentAndSourceFileSpecifiedException of
      file_content_and_source_file_specified_exception
    | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
    | `FileDoesNotExistException of file_does_not_exist_exception
    | `FileEntryRequiredException of file_entry_required_exception
    | `FileModeRequiredException of file_mode_required_exception
    | `FileNameConflictsWithDirectoryNameException of
      file_name_conflicts_with_directory_name_exception
    | `FilePathConflictsWithSubmodulePathException of
      file_path_conflicts_with_submodule_path_exception
    | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidDeletionParameterException of invalid_deletion_parameter_exception
    | `InvalidEmailException of invalid_email_exception
    | `InvalidFileModeException of invalid_file_mode_exception
    | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `MaximumFileEntriesExceededException of maximum_file_entries_exceeded_exception
    | `NameLengthExceededException of name_length_exceeded_exception
    | `NoChangeException of no_change_exception
    | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
    | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
    | `ParentCommitIdRequiredException of parent_commit_id_required_exception
    | `PathRequiredException of path_required_exception
    | `PutFileEntryConflictException of put_file_entry_conflict_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `RestrictedSourceFileException of restricted_source_file_exception
    | `SamePathRequestException of same_path_request_exception
    | `SourceFileOrContentRequiredException of source_file_or_content_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_commit_input ->
    ( create_commit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `DirectoryNameConflictsWithFileNameException of
        directory_name_conflicts_with_file_name_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentAndSourceFileSpecifiedException of
        file_content_and_source_file_specified_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileDoesNotExistException of file_does_not_exist_exception
      | `FileEntryRequiredException of file_entry_required_exception
      | `FileModeRequiredException of file_mode_required_exception
      | `FileNameConflictsWithDirectoryNameException of
        file_name_conflicts_with_directory_name_exception
      | `FilePathConflictsWithSubmodulePathException of
        file_path_conflicts_with_submodule_path_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidDeletionParameterException of invalid_deletion_parameter_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumFileEntriesExceededException of maximum_file_entries_exceeded_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `NoChangeException of no_change_exception
      | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
      | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
      | `ParentCommitIdRequiredException of parent_commit_id_required_exception
      | `PathRequiredException of path_required_exception
      | `PutFileEntryConflictException of put_file_entry_conflict_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RestrictedSourceFileException of restricted_source_file_exception
      | `SamePathRequestException of same_path_request_exception
      | `SourceFileOrContentRequiredException of source_file_or_content_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_commit_input ->
    ( create_commit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `DirectoryNameConflictsWithFileNameException of
        directory_name_conflicts_with_file_name_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentAndSourceFileSpecifiedException of
        file_content_and_source_file_specified_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileDoesNotExistException of file_does_not_exist_exception
      | `FileEntryRequiredException of file_entry_required_exception
      | `FileModeRequiredException of file_mode_required_exception
      | `FileNameConflictsWithDirectoryNameException of
        file_name_conflicts_with_directory_name_exception
      | `FilePathConflictsWithSubmodulePathException of
        file_path_conflicts_with_submodule_path_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidDeletionParameterException of invalid_deletion_parameter_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumFileEntriesExceededException of maximum_file_entries_exceeded_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `NoChangeException of no_change_exception
      | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
      | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
      | `ParentCommitIdRequiredException of parent_commit_id_required_exception
      | `PathRequiredException of path_required_exception
      | `PutFileEntryConflictException of put_file_entry_conflict_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RestrictedSourceFileException of restricted_source_file_exception
      | `SamePathRequestException of same_path_request_exception
      | `SourceFileOrContentRequiredException of source_file_or_content_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a commit for a repository on the tip of a specified branch.\n"]

module CreatePullRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientRequestTokenRequiredException of client_request_token_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
    | `InvalidClientRequestTokenException of invalid_client_request_token_exception
    | `InvalidDescriptionException of invalid_description_exception
    | `InvalidReferenceNameException of invalid_reference_name_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidTargetException of invalid_target_exception
    | `InvalidTargetsException of invalid_targets_exception
    | `InvalidTitleException of invalid_title_exception
    | `MaximumOpenPullRequestsExceededException of maximum_open_pull_requests_exceeded_exception
    | `MultipleRepositoriesInPullRequestException of multiple_repositories_in_pull_request_exception
    | `ReferenceDoesNotExistException of reference_does_not_exist_exception
    | `ReferenceNameRequiredException of reference_name_required_exception
    | `ReferenceTypeNotSupportedException of reference_type_not_supported_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `SourceAndDestinationAreSameException of source_and_destination_are_same_exception
    | `TargetRequiredException of target_required_exception
    | `TargetsRequiredException of targets_required_exception
    | `TitleRequiredException of title_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_pull_request_input ->
    ( create_pull_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientRequestTokenRequiredException of client_request_token_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
      | `InvalidClientRequestTokenException of invalid_client_request_token_exception
      | `InvalidDescriptionException of invalid_description_exception
      | `InvalidReferenceNameException of invalid_reference_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidTargetException of invalid_target_exception
      | `InvalidTargetsException of invalid_targets_exception
      | `InvalidTitleException of invalid_title_exception
      | `MaximumOpenPullRequestsExceededException of maximum_open_pull_requests_exceeded_exception
      | `MultipleRepositoriesInPullRequestException of
        multiple_repositories_in_pull_request_exception
      | `ReferenceDoesNotExistException of reference_does_not_exist_exception
      | `ReferenceNameRequiredException of reference_name_required_exception
      | `ReferenceTypeNotSupportedException of reference_type_not_supported_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `SourceAndDestinationAreSameException of source_and_destination_are_same_exception
      | `TargetRequiredException of target_required_exception
      | `TargetsRequiredException of targets_required_exception
      | `TitleRequiredException of title_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_pull_request_input ->
    ( create_pull_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientRequestTokenRequiredException of client_request_token_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
      | `InvalidClientRequestTokenException of invalid_client_request_token_exception
      | `InvalidDescriptionException of invalid_description_exception
      | `InvalidReferenceNameException of invalid_reference_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidTargetException of invalid_target_exception
      | `InvalidTargetsException of invalid_targets_exception
      | `InvalidTitleException of invalid_title_exception
      | `MaximumOpenPullRequestsExceededException of maximum_open_pull_requests_exceeded_exception
      | `MultipleRepositoriesInPullRequestException of
        multiple_repositories_in_pull_request_exception
      | `ReferenceDoesNotExistException of reference_does_not_exist_exception
      | `ReferenceNameRequiredException of reference_name_required_exception
      | `ReferenceTypeNotSupportedException of reference_type_not_supported_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `SourceAndDestinationAreSameException of source_and_destination_are_same_exception
      | `TargetRequiredException of target_required_exception
      | `TargetsRequiredException of targets_required_exception
      | `TitleRequiredException of title_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a pull request in the specified repository.\n"]

module CreatePullRequestApprovalRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleContentRequiredException of approval_rule_content_required_exception
    | `ApprovalRuleNameAlreadyExistsException of approval_rule_name_already_exists_exception
    | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalRuleContentException of invalid_approval_rule_content_exception
    | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `NumberOfRulesExceededException of number_of_rules_exceeded_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_pull_request_approval_rule_input ->
    ( create_pull_request_approval_rule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleContentRequiredException of approval_rule_content_required_exception
      | `ApprovalRuleNameAlreadyExistsException of approval_rule_name_already_exists_exception
      | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleContentException of invalid_approval_rule_content_exception
      | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `NumberOfRulesExceededException of number_of_rules_exceeded_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_pull_request_approval_rule_input ->
    ( create_pull_request_approval_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleContentRequiredException of approval_rule_content_required_exception
      | `ApprovalRuleNameAlreadyExistsException of approval_rule_name_already_exists_exception
      | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleContentException of invalid_approval_rule_content_exception
      | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `NumberOfRulesExceededException of number_of_rules_exceeded_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an approval rule for a pull request.\n"]

module CreateRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyInvalidIdException of encryption_key_invalid_id_exception
    | `EncryptionKeyInvalidUsageException of encryption_key_invalid_usage_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryDescriptionException of invalid_repository_description_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
    | `InvalidTagsMapException of invalid_tags_map_exception
    | `OperationNotAllowedException of operation_not_allowed_exception
    | `RepositoryLimitExceededException of repository_limit_exceeded_exception
    | `RepositoryNameExistsException of repository_name_exists_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_repository_input ->
    ( create_repository_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyInvalidIdException of encryption_key_invalid_id_exception
      | `EncryptionKeyInvalidUsageException of encryption_key_invalid_usage_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryDescriptionException of invalid_repository_description_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
      | `InvalidTagsMapException of invalid_tags_map_exception
      | `OperationNotAllowedException of operation_not_allowed_exception
      | `RepositoryLimitExceededException of repository_limit_exceeded_exception
      | `RepositoryNameExistsException of repository_name_exists_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_repository_input ->
    ( create_repository_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyInvalidIdException of encryption_key_invalid_id_exception
      | `EncryptionKeyInvalidUsageException of encryption_key_invalid_usage_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryDescriptionException of invalid_repository_description_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
      | `InvalidTagsMapException of invalid_tags_map_exception
      | `OperationNotAllowedException of operation_not_allowed_exception
      | `RepositoryLimitExceededException of repository_limit_exceeded_exception
      | `RepositoryNameExistsException of repository_name_exists_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new, empty repository.\n"]

module CreateUnreferencedMergeCommit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
    | `CommitRequiredException of commit_required_exception
    | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
    | `FileModeRequiredException of file_mode_required_exception
    | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidEmailException of invalid_email_exception
    | `InvalidFileModeException of invalid_file_mode_exception
    | `InvalidMergeOptionException of invalid_merge_option_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidReplacementContentException of invalid_replacement_content_exception
    | `InvalidReplacementTypeException of invalid_replacement_type_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `ManualMergeRequiredException of manual_merge_required_exception
    | `MaximumConflictResolutionEntriesExceededException of
      maximum_conflict_resolution_entries_exceeded_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `MergeOptionRequiredException of merge_option_required_exception
    | `MultipleConflictResolutionEntriesException of multiple_conflict_resolution_entries_exception
    | `NameLengthExceededException of name_length_exceeded_exception
    | `PathRequiredException of path_required_exception
    | `ReplacementContentRequiredException of replacement_content_required_exception
    | `ReplacementTypeRequiredException of replacement_type_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_unreferenced_merge_commit_input ->
    ( create_unreferenced_merge_commit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `CommitRequiredException of commit_required_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileModeRequiredException of file_mode_required_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidMergeOptionException of invalid_merge_option_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MergeOptionRequiredException of merge_option_required_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_unreferenced_merge_commit_input ->
    ( create_unreferenced_merge_commit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `CommitRequiredException of commit_required_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileModeRequiredException of file_mode_required_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidMergeOptionException of invalid_merge_option_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MergeOptionRequiredException of merge_option_required_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an unreferenced commit that represents the result of merging two branches using a \
   specified merge strategy. This can help you determine the outcome of a potential merge. This \
   API cannot be used with the fast-forward merge strategy because that strategy does not create a \
   merge commit.\n\n\
  \  This unreferenced merge commit can only be accessed using the GetCommit API or through git \
   commands such as git fetch. To retrieve this commit, you must specify its commit ID or \
   otherwise reference it.\n\
  \  \n\
  \   "]

module DeleteApprovalRuleTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateInUseException of approval_rule_template_in_use_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_approval_rule_template_input ->
    ( delete_approval_rule_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateInUseException of approval_rule_template_in_use_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_approval_rule_template_input ->
    ( delete_approval_rule_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateInUseException of approval_rule_template_in_use_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified approval rule template. Deleting a template does not remove approval rules \
   on pull requests already created with the template.\n"]

module DeleteBranch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchNameRequiredException of branch_name_required_exception
    | `DefaultBranchCannotBeDeletedException of default_branch_cannot_be_deleted_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_branch_input ->
    ( delete_branch_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchNameRequiredException of branch_name_required_exception
      | `DefaultBranchCannotBeDeletedException of default_branch_cannot_be_deleted_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_branch_input ->
    ( delete_branch_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchNameRequiredException of branch_name_required_exception
      | `DefaultBranchCannotBeDeletedException of default_branch_cannot_be_deleted_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a branch from a repository, unless that branch is the default branch for the repository. \n"]

module DeleteCommentContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommentDeletedException of comment_deleted_exception
    | `CommentDoesNotExistException of comment_does_not_exist_exception
    | `CommentIdRequiredException of comment_id_required_exception
    | `InvalidCommentIdException of invalid_comment_id_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_comment_content_input ->
    ( delete_comment_content_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `InvalidCommentIdException of invalid_comment_id_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_comment_content_input ->
    ( delete_comment_content_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `InvalidCommentIdException of invalid_comment_id_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the content of a comment made on a change, file, or commit in a repository.\n"]

module DeleteFile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchDoesNotExistException of branch_does_not_exist_exception
    | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileDoesNotExistException of file_does_not_exist_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidEmailException of invalid_email_exception
    | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `NameLengthExceededException of name_length_exceeded_exception
    | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
    | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
    | `ParentCommitIdRequiredException of parent_commit_id_required_exception
    | `PathRequiredException of path_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_file_input ->
    ( delete_file_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileDoesNotExistException of file_does_not_exist_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
      | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
      | `ParentCommitIdRequiredException of parent_commit_id_required_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_file_input ->
    ( delete_file_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileDoesNotExistException of file_does_not_exist_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
      | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
      | `ParentCommitIdRequiredException of parent_commit_id_required_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified file from a specified branch. A commit is created on the branch that \
   contains the revision. The file still exists in the commits earlier to the commit that contains \
   the deletion.\n"]

module DeletePullRequestApprovalRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
    | `CannotDeleteApprovalRuleFromTemplateException of
      cannot_delete_approval_rule_from_template_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_pull_request_approval_rule_input ->
    ( delete_pull_request_approval_rule_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
      | `CannotDeleteApprovalRuleFromTemplateException of
        cannot_delete_approval_rule_from_template_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_pull_request_approval_rule_input ->
    ( delete_pull_request_approval_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
      | `CannotDeleteApprovalRuleFromTemplateException of
        cannot_delete_approval_rule_from_template_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an approval rule from a specified pull request. Approval rules can be deleted from a \
   pull request only if the pull request is open, and if the approval rule was created \
   specifically for a pull request and not generated from an approval rule template associated \
   with the repository where the pull request was created. You cannot delete an approval rule from \
   a merged or closed pull request.\n"]

module DeleteRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_input ->
    ( delete_repository_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_input ->
    ( delete_repository_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a repository. If a specified repository was already deleted, a null repository ID is \
   returned.\n\n\
  \  Deleting a repository also deletes all associated objects and metadata. After a repository is \
   deleted, all future push calls to the deleted repository fail.\n\
  \  \n\
  \   "]

module DescribeMergeConflicts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitRequiredException of commit_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileDoesNotExistException of file_does_not_exist_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxMergeHunksException of invalid_max_merge_hunks_exception
    | `InvalidMergeOptionException of invalid_merge_option_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `MergeOptionRequiredException of merge_option_required_exception
    | `PathRequiredException of path_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_merge_conflicts_input ->
    ( describe_merge_conflicts_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileDoesNotExistException of file_does_not_exist_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxMergeHunksException of invalid_max_merge_hunks_exception
      | `InvalidMergeOptionException of invalid_merge_option_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MergeOptionRequiredException of merge_option_required_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_merge_conflicts_input ->
    ( describe_merge_conflicts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileDoesNotExistException of file_does_not_exist_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxMergeHunksException of invalid_max_merge_hunks_exception
      | `InvalidMergeOptionException of invalid_merge_option_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MergeOptionRequiredException of merge_option_required_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about one or more merge conflicts in the attempted merge of two commit \
   specifiers using the squash or three-way merge strategy. If the merge option for the attempted \
   merge is specified as FAST_FORWARD_MERGE, an exception is thrown.\n"]

module DescribePullRequestEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActorDoesNotExistException of actor_does_not_exist_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidActorArnException of invalid_actor_arn_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception
    | `InvalidPullRequestEventTypeException of invalid_pull_request_event_type_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pull_request_events_input ->
    ( describe_pull_request_events_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActorDoesNotExistException of actor_does_not_exist_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidActorArnException of invalid_actor_arn_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidPullRequestEventTypeException of invalid_pull_request_event_type_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pull_request_events_input ->
    ( describe_pull_request_events_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActorDoesNotExistException of actor_does_not_exist_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidActorArnException of invalid_actor_arn_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidPullRequestEventTypeException of invalid_pull_request_event_type_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about one or more pull request events.\n"]

module DisassociateApprovalRuleTemplateFromRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_approval_rule_template_from_repository_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_approval_rule_template_from_repository_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association between a template and a repository so that approval rules based on the \
   template are not automatically created when pull requests are created in the specified \
   repository. This does not delete any approval rules previously created for pull requests \
   through the template association.\n"]

module EvaluatePullRequestApprovalRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRevisionIdException of invalid_revision_id_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `RevisionIdRequiredException of revision_id_required_exception
    | `RevisionNotCurrentException of revision_not_current_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    evaluate_pull_request_approval_rules_input ->
    ( evaluate_pull_request_approval_rules_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception
      | `RevisionNotCurrentException of revision_not_current_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    evaluate_pull_request_approval_rules_input ->
    ( evaluate_pull_request_approval_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception
      | `RevisionNotCurrentException of revision_not_current_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Evaluates whether a pull request has met all the conditions specified in its associated \
   approval rules.\n"]

module GetApprovalRuleTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_approval_rule_template_input ->
    ( get_approval_rule_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_approval_rule_template_input ->
    ( get_approval_rule_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a specified approval rule template.\n"]

module GetBlob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BlobIdDoesNotExistException of blob_id_does_not_exist_exception
    | `BlobIdRequiredException of blob_id_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileTooLargeException of file_too_large_exception
    | `InvalidBlobIdException of invalid_blob_id_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_blob_input ->
    ( get_blob_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BlobIdDoesNotExistException of blob_id_does_not_exist_exception
      | `BlobIdRequiredException of blob_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileTooLargeException of file_too_large_exception
      | `InvalidBlobIdException of invalid_blob_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_blob_input ->
    ( get_blob_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BlobIdDoesNotExistException of blob_id_does_not_exist_exception
      | `BlobIdRequiredException of blob_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileTooLargeException of file_too_large_exception
      | `InvalidBlobIdException of invalid_blob_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the base-64 encoded content of an individual blob in a repository.\n"]

module GetBranch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchDoesNotExistException of branch_does_not_exist_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_branch_input ->
    ( get_branch_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_branch_input ->
    ( get_branch_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a repository branch, including its name and the last commit ID.\n"]

module GetComment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommentDeletedException of comment_deleted_exception
    | `CommentDoesNotExistException of comment_does_not_exist_exception
    | `CommentIdRequiredException of comment_id_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommentIdException of invalid_comment_id_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_comment_input ->
    ( get_comment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommentIdException of invalid_comment_id_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_comment_input ->
    ( get_comment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommentIdException of invalid_comment_id_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the content of a comment made on a change, file, or commit in a repository. \n\n\
  \  Reaction counts might include numbers from user identities who were deleted after the \
   reaction was made. For a count of reactions from active identities, use GetCommentReactions.\n\
  \  \n\
  \   "]

module GetCommentReactions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommentDeletedException of comment_deleted_exception
    | `CommentDoesNotExistException of comment_does_not_exist_exception
    | `CommentIdRequiredException of comment_id_required_exception
    | `InvalidCommentIdException of invalid_comment_id_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception
    | `InvalidReactionUserArnException of invalid_reaction_user_arn_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_comment_reactions_input ->
    ( get_comment_reactions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `InvalidCommentIdException of invalid_comment_id_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidReactionUserArnException of invalid_reaction_user_arn_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_comment_reactions_input ->
    ( get_comment_reactions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `InvalidCommentIdException of invalid_comment_id_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidReactionUserArnException of invalid_reaction_user_arn_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about reactions to a specified comment ID. Reactions from users who have \
   been deleted will not be included in the count.\n"]

module GetCommentsForComparedCommit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitIdRequiredException of commit_id_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_comments_for_compared_commit_input ->
    ( get_comments_for_compared_commit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_comments_for_compared_commit_input ->
    ( get_comments_for_compared_commit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about comments made on the comparison between two commits.\n\n\
  \  Reaction counts might include numbers from user identities who were deleted after the \
   reaction was made. For a count of reactions from active identities, use GetCommentReactions.\n\
  \  \n\
  \   "]

module GetCommentsForPullRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitIdRequiredException of commit_id_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `RepositoryNotAssociatedWithPullRequestException of
      repository_not_associated_with_pull_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_comments_for_pull_request_input ->
    ( get_comments_for_pull_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_comments_for_pull_request_input ->
    ( get_comments_for_pull_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns comments made on a pull request.\n\n\
  \  Reaction counts might include numbers from user identities who were deleted after the \
   reaction was made. For a count of reactions from active identities, use GetCommentReactions.\n\
  \  \n\
  \   "]

module GetCommit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitIdDoesNotExistException of commit_id_does_not_exist_exception
    | `CommitIdRequiredException of commit_id_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_commit_input ->
    ( get_commit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitIdDoesNotExistException of commit_id_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_commit_input ->
    ( get_commit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitIdDoesNotExistException of commit_id_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a commit, including commit message and committer information.\n"]

module GetDifferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitRequiredException of commit_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `PathDoesNotExistException of path_does_not_exist_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_differences_input ->
    ( get_differences_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathDoesNotExistException of path_does_not_exist_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_differences_input ->
    ( get_differences_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathDoesNotExistException of path_does_not_exist_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the differences in a valid commit specifier (such as a branch, tag, \
   HEAD, commit ID, or other fully qualified reference). Results can be limited to a specified \
   path.\n"]

module GetFile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileDoesNotExistException of file_does_not_exist_exception
    | `FileTooLargeException of file_too_large_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `PathRequiredException of path_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_file_input ->
    ( get_file_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileDoesNotExistException of file_does_not_exist_exception
      | `FileTooLargeException of file_too_large_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_file_input ->
    ( get_file_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileDoesNotExistException of file_does_not_exist_exception
      | `FileTooLargeException of file_too_large_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the base-64 encoded contents of a specified file and its metadata.\n"]

module GetFolder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FolderDoesNotExistException of folder_does_not_exist_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `PathRequiredException of path_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_folder_input ->
    ( get_folder_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FolderDoesNotExistException of folder_does_not_exist_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_folder_input ->
    ( get_folder_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FolderDoesNotExistException of folder_does_not_exist_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the contents of a specified folder in a repository.\n"]

module GetMergeCommit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitRequiredException of commit_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_merge_commit_input ->
    ( get_merge_commit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_merge_commit_input ->
    ( get_merge_commit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a specified merge commit.\n"]

module GetMergeConflicts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitRequiredException of commit_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidDestinationCommitSpecifierException of invalid_destination_commit_specifier_exception
    | `InvalidMaxConflictFilesException of invalid_max_conflict_files_exception
    | `InvalidMergeOptionException of invalid_merge_option_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidSourceCommitSpecifierException of invalid_source_commit_specifier_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `MergeOptionRequiredException of merge_option_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_merge_conflicts_input ->
    ( get_merge_conflicts_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidDestinationCommitSpecifierException of
        invalid_destination_commit_specifier_exception
      | `InvalidMaxConflictFilesException of invalid_max_conflict_files_exception
      | `InvalidMergeOptionException of invalid_merge_option_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidSourceCommitSpecifierException of invalid_source_commit_specifier_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MergeOptionRequiredException of merge_option_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_merge_conflicts_input ->
    ( get_merge_conflicts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidDestinationCommitSpecifierException of
        invalid_destination_commit_specifier_exception
      | `InvalidMaxConflictFilesException of invalid_max_conflict_files_exception
      | `InvalidMergeOptionException of invalid_merge_option_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidSourceCommitSpecifierException of invalid_source_commit_specifier_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MergeOptionRequiredException of merge_option_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about merge conflicts between the before and after commit IDs for a pull \
   request in a repository.\n"]

module GetMergeOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitRequiredException of commit_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_merge_options_input ->
    ( get_merge_options_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_merge_options_input ->
    ( get_merge_options_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the merge options available for merging two specified branches. For \
   details about why a merge option is not available, use GetMergeConflicts or \
   DescribeMergeConflicts.\n"]

module GetPullRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pull_request_input ->
    ( get_pull_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pull_request_input ->
    ( get_pull_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a pull request in a specified repository.\n"]

module GetPullRequestApprovalStates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRevisionIdException of invalid_revision_id_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `RevisionIdRequiredException of revision_id_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pull_request_approval_states_input ->
    ( get_pull_request_approval_states_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pull_request_approval_states_input ->
    ( get_pull_request_approval_states_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the approval states for a specified pull request. Approval states only \
   apply to pull requests that have one or more approval rules applied to them.\n"]

module GetPullRequestOverrideState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRevisionIdException of invalid_revision_id_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `RevisionIdRequiredException of revision_id_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pull_request_override_state_input ->
    ( get_pull_request_override_state_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pull_request_override_state_input ->
    ( get_pull_request_override_state_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about whether approval rules have been set aside (overridden) for a pull \
   request, and if so, the Amazon Resource Name (ARN) of the user or identity that overrode the \
   rules and their requirements for the pull request.\n"]

module GetRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_repository_input ->
    ( get_repository_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_repository_input ->
    ( get_repository_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a repository.\n\n\
  \  The description field for a repository accepts all HTML characters and all valid Unicode \
   characters. Applications that do not HTML-encode the description and display it in a webpage \
   can expose users to potentially malicious code. Make sure that you HTML-encode the description \
   field in any application that uses this API to display the repository description on a webpage.\n\
  \  \n\
  \   "]

module GetRepositoryTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_repository_triggers_input ->
    ( get_repository_triggers_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_repository_triggers_input ->
    ( get_repository_triggers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about triggers configured for a repository.\n"]

module ListApprovalRuleTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_approval_rule_templates_input ->
    ( list_approval_rule_templates_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_approval_rule_templates_input ->
    ( list_approval_rule_templates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all approval rule templates in the specified Amazon Web Services Region in your Amazon \
   Web Services account. If an Amazon Web Services Region is not specified, the Amazon Web \
   Services Region where you are signed in is used.\n"]

module ListAssociatedApprovalRuleTemplatesForRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associated_approval_rule_templates_for_repository_input ->
    ( list_associated_approval_rule_templates_for_repository_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associated_approval_rule_templates_for_repository_input ->
    ( list_associated_approval_rule_templates_for_repository_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all approval rule templates that are associated with a specified repository.\n"]

module ListBranches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_branches_input ->
    ( list_branches_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_branches_input ->
    ( list_branches_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about one or more branches in a repository.\n"]

module ListFileCommitHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitRequiredException of commit_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_file_commit_history_request ->
    ( list_file_commit_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_file_commit_history_request ->
    ( list_file_commit_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of commits and changes to a specified file.\n"]

module ListPullRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthorDoesNotExistException of author_does_not_exist_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidAuthorArnException of invalid_author_arn_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception
    | `InvalidPullRequestStatusException of invalid_pull_request_status_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pull_requests_input ->
    ( list_pull_requests_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorDoesNotExistException of author_does_not_exist_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidAuthorArnException of invalid_author_arn_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidPullRequestStatusException of invalid_pull_request_status_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pull_requests_input ->
    ( list_pull_requests_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthorDoesNotExistException of author_does_not_exist_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidAuthorArnException of invalid_author_arn_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception
      | `InvalidPullRequestStatusException of invalid_pull_request_status_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of pull requests for a specified repository. The return list can be refined by \
   pull request status or pull request author ARN.\n"]

module ListRepositories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidOrderException of invalid_order_exception
    | `InvalidSortByException of invalid_sort_by_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_repositories_input ->
    ( list_repositories_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidOrderException of invalid_order_exception
      | `InvalidSortByException of invalid_sort_by_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_repositories_input ->
    ( list_repositories_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidOrderException of invalid_order_exception
      | `InvalidSortByException of invalid_sort_by_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about one or more repositories.\n"]

module ListRepositoriesForApprovalRuleTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxResultsException of invalid_max_results_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_repositories_for_approval_rule_template_input ->
    ( list_repositories_for_approval_rule_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_repositories_for_approval_rule_template_input ->
    ( list_repositories_for_approval_rule_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxResultsException of invalid_max_results_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all repositories associated with the specified approval rule template.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidResourceArnException of invalid_resource_arn_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `ResourceArnRequiredException of resource_arn_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidResourceArnException of invalid_resource_arn_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `ResourceArnRequiredException of resource_arn_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidResourceArnException of invalid_resource_arn_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `ResourceArnRequiredException of resource_arn_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about Amazon Web Servicestags for a specified Amazon Resource Name (ARN) in \
   CodeCommit. For a list of valid resources in CodeCommit, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats}CodeCommit \
   Resources and Operations} in the{i  CodeCommit User Guide}.\n"]

module MergeBranchesByFastForward : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchDoesNotExistException of branch_does_not_exist_exception
    | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitRequiredException of commit_required_exception
    | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidTargetBranchException of invalid_target_branch_exception
    | `ManualMergeRequiredException of manual_merge_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    merge_branches_by_fast_forward_input ->
    ( merge_branches_by_fast_forward_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidTargetBranchException of invalid_target_branch_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    merge_branches_by_fast_forward_input ->
    ( merge_branches_by_fast_forward_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidTargetBranchException of invalid_target_branch_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Merges two branches using the fast-forward merge strategy.\n"]

module MergeBranchesBySquash : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchDoesNotExistException of branch_does_not_exist_exception
    | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
    | `CommitRequiredException of commit_required_exception
    | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
    | `FileModeRequiredException of file_mode_required_exception
    | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidEmailException of invalid_email_exception
    | `InvalidFileModeException of invalid_file_mode_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidReplacementContentException of invalid_replacement_content_exception
    | `InvalidReplacementTypeException of invalid_replacement_type_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidTargetBranchException of invalid_target_branch_exception
    | `ManualMergeRequiredException of manual_merge_required_exception
    | `MaximumConflictResolutionEntriesExceededException of
      maximum_conflict_resolution_entries_exceeded_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `MultipleConflictResolutionEntriesException of multiple_conflict_resolution_entries_exception
    | `NameLengthExceededException of name_length_exceeded_exception
    | `PathRequiredException of path_required_exception
    | `ReplacementContentRequiredException of replacement_content_required_exception
    | `ReplacementTypeRequiredException of replacement_type_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    merge_branches_by_squash_input ->
    ( merge_branches_by_squash_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `CommitRequiredException of commit_required_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileModeRequiredException of file_mode_required_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidTargetBranchException of invalid_target_branch_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    merge_branches_by_squash_input ->
    ( merge_branches_by_squash_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `CommitRequiredException of commit_required_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileModeRequiredException of file_mode_required_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidTargetBranchException of invalid_target_branch_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Merges two branches using the squash merge strategy.\n"]

module MergeBranchesByThreeWay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchDoesNotExistException of branch_does_not_exist_exception
    | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
    | `CommitRequiredException of commit_required_exception
    | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
    | `FileModeRequiredException of file_mode_required_exception
    | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidEmailException of invalid_email_exception
    | `InvalidFileModeException of invalid_file_mode_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidReplacementContentException of invalid_replacement_content_exception
    | `InvalidReplacementTypeException of invalid_replacement_type_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidTargetBranchException of invalid_target_branch_exception
    | `ManualMergeRequiredException of manual_merge_required_exception
    | `MaximumConflictResolutionEntriesExceededException of
      maximum_conflict_resolution_entries_exceeded_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `MultipleConflictResolutionEntriesException of multiple_conflict_resolution_entries_exception
    | `NameLengthExceededException of name_length_exceeded_exception
    | `PathRequiredException of path_required_exception
    | `ReplacementContentRequiredException of replacement_content_required_exception
    | `ReplacementTypeRequiredException of replacement_type_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    merge_branches_by_three_way_input ->
    ( merge_branches_by_three_way_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `CommitRequiredException of commit_required_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileModeRequiredException of file_mode_required_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidTargetBranchException of invalid_target_branch_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    merge_branches_by_three_way_input ->
    ( merge_branches_by_three_way_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `CommitRequiredException of commit_required_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileModeRequiredException of file_mode_required_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidTargetBranchException of invalid_target_branch_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Merges two specified branches using the three-way merge strategy.\n"]

module MergePullRequestByFastForward : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `ManualMergeRequiredException of manual_merge_required_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestApprovalRulesNotSatisfiedException of
      pull_request_approval_rules_not_satisfied_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `ReferenceDoesNotExistException of reference_does_not_exist_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `RepositoryNotAssociatedWithPullRequestException of
      repository_not_associated_with_pull_request_exception
    | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
    ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    merge_pull_request_by_fast_forward_input ->
    ( merge_pull_request_by_fast_forward_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestApprovalRulesNotSatisfiedException of
        pull_request_approval_rules_not_satisfied_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `ReferenceDoesNotExistException of reference_does_not_exist_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception
      | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    merge_pull_request_by_fast_forward_input ->
    ( merge_pull_request_by_fast_forward_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestApprovalRulesNotSatisfiedException of
        pull_request_approval_rules_not_satisfied_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `ReferenceDoesNotExistException of reference_does_not_exist_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception
      | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attempts to merge the source commit of a pull request into the specified destination branch for \
   that pull request at the specified commit using the fast-forward merge strategy. If the merge \
   is successful, it closes the pull request.\n"]

module MergePullRequestBySquash : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
    | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
    | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidEmailException of invalid_email_exception
    | `InvalidFileModeException of invalid_file_mode_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidReplacementContentException of invalid_replacement_content_exception
    | `InvalidReplacementTypeException of invalid_replacement_type_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `ManualMergeRequiredException of manual_merge_required_exception
    | `MaximumConflictResolutionEntriesExceededException of
      maximum_conflict_resolution_entries_exceeded_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `MultipleConflictResolutionEntriesException of multiple_conflict_resolution_entries_exception
    | `NameLengthExceededException of name_length_exceeded_exception
    | `PathRequiredException of path_required_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestApprovalRulesNotSatisfiedException of
      pull_request_approval_rules_not_satisfied_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `ReplacementContentRequiredException of replacement_content_required_exception
    | `ReplacementTypeRequiredException of replacement_type_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `RepositoryNotAssociatedWithPullRequestException of
      repository_not_associated_with_pull_request_exception
    | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    merge_pull_request_by_squash_input ->
    ( merge_pull_request_by_squash_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestApprovalRulesNotSatisfiedException of
        pull_request_approval_rules_not_satisfied_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception
      | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    merge_pull_request_by_squash_input ->
    ( merge_pull_request_by_squash_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestApprovalRulesNotSatisfiedException of
        pull_request_approval_rules_not_satisfied_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception
      | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attempts to merge the source commit of a pull request into the specified destination branch for \
   that pull request at the specified commit using the squash merge strategy. If the merge is \
   successful, it closes the pull request.\n"]

module MergePullRequestByThreeWay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
    | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
    | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidEmailException of invalid_email_exception
    | `InvalidFileModeException of invalid_file_mode_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidReplacementContentException of invalid_replacement_content_exception
    | `InvalidReplacementTypeException of invalid_replacement_type_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `ManualMergeRequiredException of manual_merge_required_exception
    | `MaximumConflictResolutionEntriesExceededException of
      maximum_conflict_resolution_entries_exceeded_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `MultipleConflictResolutionEntriesException of multiple_conflict_resolution_entries_exception
    | `NameLengthExceededException of name_length_exceeded_exception
    | `PathRequiredException of path_required_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestApprovalRulesNotSatisfiedException of
      pull_request_approval_rules_not_satisfied_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `ReplacementContentRequiredException of replacement_content_required_exception
    | `ReplacementTypeRequiredException of replacement_type_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `RepositoryNotAssociatedWithPullRequestException of
      repository_not_associated_with_pull_request_exception
    | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    merge_pull_request_by_three_way_input ->
    ( merge_pull_request_by_three_way_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestApprovalRulesNotSatisfiedException of
        pull_request_approval_rules_not_satisfied_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception
      | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    merge_pull_request_by_three_way_input ->
    ( merge_pull_request_by_three_way_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `ConcurrentReferenceUpdateException of concurrent_reference_update_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionException of invalid_conflict_resolution_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidReplacementContentException of invalid_replacement_content_exception
      | `InvalidReplacementTypeException of invalid_replacement_type_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `ManualMergeRequiredException of manual_merge_required_exception
      | `MaximumConflictResolutionEntriesExceededException of
        maximum_conflict_resolution_entries_exceeded_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MultipleConflictResolutionEntriesException of
        multiple_conflict_resolution_entries_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `PathRequiredException of path_required_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestApprovalRulesNotSatisfiedException of
        pull_request_approval_rules_not_satisfied_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `ReplacementContentRequiredException of replacement_content_required_exception
      | `ReplacementTypeRequiredException of replacement_type_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception
      | `TipOfSourceReferenceIsDifferentException of tip_of_source_reference_is_different_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attempts to merge the source commit of a pull request into the specified destination branch for \
   that pull request at the specified commit using the three-way merge strategy. If the merge is \
   successful, it closes the pull request.\n"]

module OverridePullRequestApprovalRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidOverrideStatusException of invalid_override_status_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRevisionIdException of invalid_revision_id_exception
    | `OverrideAlreadySetException of override_already_set_exception
    | `OverrideStatusRequiredException of override_status_required_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `RevisionIdRequiredException of revision_id_required_exception
    | `RevisionNotCurrentException of revision_not_current_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    override_pull_request_approval_rules_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidOverrideStatusException of invalid_override_status_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `OverrideAlreadySetException of override_already_set_exception
      | `OverrideStatusRequiredException of override_status_required_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception
      | `RevisionNotCurrentException of revision_not_current_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    override_pull_request_approval_rules_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidOverrideStatusException of invalid_override_status_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `OverrideAlreadySetException of override_already_set_exception
      | `OverrideStatusRequiredException of override_status_required_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception
      | `RevisionNotCurrentException of revision_not_current_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets aside (overrides) all approval rule requirements for a specified pull request.\n"]

module PostCommentForComparedCommit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BeforeCommitIdAndAfterCommitIdAreSameException of
      before_commit_id_and_after_commit_id_are_same_exception
    | `ClientRequestTokenRequiredException of client_request_token_required_exception
    | `CommentContentRequiredException of comment_content_required_exception
    | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitIdRequiredException of commit_id_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
    | `InvalidClientRequestTokenException of invalid_client_request_token_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidFileLocationException of invalid_file_location_exception
    | `InvalidFilePositionException of invalid_file_position_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidRelativeFileVersionEnumException of invalid_relative_file_version_enum_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `PathDoesNotExistException of path_does_not_exist_exception
    | `PathRequiredException of path_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    post_comment_for_compared_commit_input ->
    ( post_comment_for_compared_commit_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BeforeCommitIdAndAfterCommitIdAreSameException of
        before_commit_id_and_after_commit_id_are_same_exception
      | `ClientRequestTokenRequiredException of client_request_token_required_exception
      | `CommentContentRequiredException of comment_content_required_exception
      | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
      | `InvalidClientRequestTokenException of invalid_client_request_token_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidFileLocationException of invalid_file_location_exception
      | `InvalidFilePositionException of invalid_file_position_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRelativeFileVersionEnumException of invalid_relative_file_version_enum_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathDoesNotExistException of path_does_not_exist_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    post_comment_for_compared_commit_input ->
    ( post_comment_for_compared_commit_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BeforeCommitIdAndAfterCommitIdAreSameException of
        before_commit_id_and_after_commit_id_are_same_exception
      | `ClientRequestTokenRequiredException of client_request_token_required_exception
      | `CommentContentRequiredException of comment_content_required_exception
      | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
      | `InvalidClientRequestTokenException of invalid_client_request_token_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidFileLocationException of invalid_file_location_exception
      | `InvalidFilePositionException of invalid_file_position_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRelativeFileVersionEnumException of invalid_relative_file_version_enum_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathDoesNotExistException of path_does_not_exist_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Posts a comment on the comparison between two commits.\n"]

module PostCommentForPullRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BeforeCommitIdAndAfterCommitIdAreSameException of
      before_commit_id_and_after_commit_id_are_same_exception
    | `ClientRequestTokenRequiredException of client_request_token_required_exception
    | `CommentContentRequiredException of comment_content_required_exception
    | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitIdRequiredException of commit_id_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
    | `InvalidClientRequestTokenException of invalid_client_request_token_exception
    | `InvalidCommitIdException of invalid_commit_id_exception
    | `InvalidFileLocationException of invalid_file_location_exception
    | `InvalidFilePositionException of invalid_file_position_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRelativeFileVersionEnumException of invalid_relative_file_version_enum_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `PathDoesNotExistException of path_does_not_exist_exception
    | `PathRequiredException of path_required_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `RepositoryNotAssociatedWithPullRequestException of
      repository_not_associated_with_pull_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    post_comment_for_pull_request_input ->
    ( post_comment_for_pull_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BeforeCommitIdAndAfterCommitIdAreSameException of
        before_commit_id_and_after_commit_id_are_same_exception
      | `ClientRequestTokenRequiredException of client_request_token_required_exception
      | `CommentContentRequiredException of comment_content_required_exception
      | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
      | `InvalidClientRequestTokenException of invalid_client_request_token_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidFileLocationException of invalid_file_location_exception
      | `InvalidFilePositionException of invalid_file_position_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRelativeFileVersionEnumException of invalid_relative_file_version_enum_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathDoesNotExistException of path_does_not_exist_exception
      | `PathRequiredException of path_required_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    post_comment_for_pull_request_input ->
    ( post_comment_for_pull_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BeforeCommitIdAndAfterCommitIdAreSameException of
        before_commit_id_and_after_commit_id_are_same_exception
      | `ClientRequestTokenRequiredException of client_request_token_required_exception
      | `CommentContentRequiredException of comment_content_required_exception
      | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitIdRequiredException of commit_id_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
      | `InvalidClientRequestTokenException of invalid_client_request_token_exception
      | `InvalidCommitIdException of invalid_commit_id_exception
      | `InvalidFileLocationException of invalid_file_location_exception
      | `InvalidFilePositionException of invalid_file_position_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRelativeFileVersionEnumException of invalid_relative_file_version_enum_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `PathDoesNotExistException of path_does_not_exist_exception
      | `PathRequiredException of path_required_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryNotAssociatedWithPullRequestException of
        repository_not_associated_with_pull_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Posts a comment on a pull request.\n"]

module PostCommentReply : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientRequestTokenRequiredException of client_request_token_required_exception
    | `CommentContentRequiredException of comment_content_required_exception
    | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
    | `CommentDoesNotExistException of comment_does_not_exist_exception
    | `CommentIdRequiredException of comment_id_required_exception
    | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
    | `InvalidClientRequestTokenException of invalid_client_request_token_exception
    | `InvalidCommentIdException of invalid_comment_id_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    post_comment_reply_input ->
    ( post_comment_reply_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientRequestTokenRequiredException of client_request_token_required_exception
      | `CommentContentRequiredException of comment_content_required_exception
      | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
      | `InvalidClientRequestTokenException of invalid_client_request_token_exception
      | `InvalidCommentIdException of invalid_comment_id_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    post_comment_reply_input ->
    ( post_comment_reply_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientRequestTokenRequiredException of client_request_token_required_exception
      | `CommentContentRequiredException of comment_content_required_exception
      | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `IdempotencyParameterMismatchException of idempotency_parameter_mismatch_exception
      | `InvalidClientRequestTokenException of invalid_client_request_token_exception
      | `InvalidCommentIdException of invalid_comment_id_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Posts a comment in reply to an existing comment on a comparison between commits or a pull \
   request.\n"]

module PutCommentReaction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommentDeletedException of comment_deleted_exception
    | `CommentDoesNotExistException of comment_does_not_exist_exception
    | `CommentIdRequiredException of comment_id_required_exception
    | `InvalidCommentIdException of invalid_comment_id_exception
    | `InvalidReactionValueException of invalid_reaction_value_exception
    | `ReactionLimitExceededException of reaction_limit_exceeded_exception
    | `ReactionValueRequiredException of reaction_value_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_comment_reaction_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `InvalidCommentIdException of invalid_comment_id_exception
      | `InvalidReactionValueException of invalid_reaction_value_exception
      | `ReactionLimitExceededException of reaction_limit_exceeded_exception
      | `ReactionValueRequiredException of reaction_value_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_comment_reaction_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `InvalidCommentIdException of invalid_comment_id_exception
      | `InvalidReactionValueException of invalid_reaction_value_exception
      | `ReactionLimitExceededException of reaction_limit_exceeded_exception
      | `ReactionValueRequiredException of reaction_value_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates a reaction to a specified comment for the user whose identity is used to make \
   the request. You can only add or update a reaction for yourself. You cannot add, modify, or \
   delete a reaction for another user.\n"]

module PutFile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchDoesNotExistException of branch_does_not_exist_exception
    | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
    | `DirectoryNameConflictsWithFileNameException of
      directory_name_conflicts_with_file_name_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `FileContentRequiredException of file_content_required_exception
    | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
    | `FileNameConflictsWithDirectoryNameException of
      file_name_conflicts_with_directory_name_exception
    | `FilePathConflictsWithSubmodulePathException of
      file_path_conflicts_with_submodule_path_exception
    | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidDeletionParameterException of invalid_deletion_parameter_exception
    | `InvalidEmailException of invalid_email_exception
    | `InvalidFileModeException of invalid_file_mode_exception
    | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
    | `InvalidPathException of invalid_path_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `NameLengthExceededException of name_length_exceeded_exception
    | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
    | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
    | `ParentCommitIdRequiredException of parent_commit_id_required_exception
    | `PathRequiredException of path_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `SameFileContentException of same_file_content_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_file_input ->
    ( put_file_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `DirectoryNameConflictsWithFileNameException of
        directory_name_conflicts_with_file_name_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentRequiredException of file_content_required_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileNameConflictsWithDirectoryNameException of
        file_name_conflicts_with_directory_name_exception
      | `FilePathConflictsWithSubmodulePathException of
        file_path_conflicts_with_submodule_path_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidDeletionParameterException of invalid_deletion_parameter_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
      | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
      | `ParentCommitIdRequiredException of parent_commit_id_required_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `SameFileContentException of same_file_content_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_file_input ->
    ( put_file_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameIsTagNameException of branch_name_is_tag_name_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `CommitMessageLengthExceededException of commit_message_length_exceeded_exception
      | `DirectoryNameConflictsWithFileNameException of
        directory_name_conflicts_with_file_name_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `FileContentRequiredException of file_content_required_exception
      | `FileContentSizeLimitExceededException of file_content_size_limit_exceeded_exception
      | `FileNameConflictsWithDirectoryNameException of
        file_name_conflicts_with_directory_name_exception
      | `FilePathConflictsWithSubmodulePathException of
        file_path_conflicts_with_submodule_path_exception
      | `FolderContentSizeLimitExceededException of folder_content_size_limit_exceeded_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidDeletionParameterException of invalid_deletion_parameter_exception
      | `InvalidEmailException of invalid_email_exception
      | `InvalidFileModeException of invalid_file_mode_exception
      | `InvalidParentCommitIdException of invalid_parent_commit_id_exception
      | `InvalidPathException of invalid_path_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `NameLengthExceededException of name_length_exceeded_exception
      | `ParentCommitDoesNotExistException of parent_commit_does_not_exist_exception
      | `ParentCommitIdOutdatedException of parent_commit_id_outdated_exception
      | `ParentCommitIdRequiredException of parent_commit_id_required_exception
      | `PathRequiredException of path_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `SameFileContentException of same_file_content_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates a file in a branch in an CodeCommit repository, and generates a commit for the \
   addition in the specified branch.\n"]

module PutRepositoryTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidRepositoryTriggerBranchNameException of
      invalid_repository_trigger_branch_name_exception
    | `InvalidRepositoryTriggerCustomDataException of
      invalid_repository_trigger_custom_data_exception
    | `InvalidRepositoryTriggerDestinationArnException of
      invalid_repository_trigger_destination_arn_exception
    | `InvalidRepositoryTriggerEventsException of invalid_repository_trigger_events_exception
    | `InvalidRepositoryTriggerNameException of invalid_repository_trigger_name_exception
    | `InvalidRepositoryTriggerRegionException of invalid_repository_trigger_region_exception
    | `MaximumBranchesExceededException of maximum_branches_exceeded_exception
    | `MaximumRepositoryTriggersExceededException of maximum_repository_triggers_exceeded_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `RepositoryTriggerBranchNameListRequiredException of
      repository_trigger_branch_name_list_required_exception
    | `RepositoryTriggerDestinationArnRequiredException of
      repository_trigger_destination_arn_required_exception
    | `RepositoryTriggerEventsListRequiredException of
      repository_trigger_events_list_required_exception
    | `RepositoryTriggerNameRequiredException of repository_trigger_name_required_exception
    | `RepositoryTriggersListRequiredException of repository_triggers_list_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_repository_triggers_input ->
    ( put_repository_triggers_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidRepositoryTriggerBranchNameException of
        invalid_repository_trigger_branch_name_exception
      | `InvalidRepositoryTriggerCustomDataException of
        invalid_repository_trigger_custom_data_exception
      | `InvalidRepositoryTriggerDestinationArnException of
        invalid_repository_trigger_destination_arn_exception
      | `InvalidRepositoryTriggerEventsException of invalid_repository_trigger_events_exception
      | `InvalidRepositoryTriggerNameException of invalid_repository_trigger_name_exception
      | `InvalidRepositoryTriggerRegionException of invalid_repository_trigger_region_exception
      | `MaximumBranchesExceededException of maximum_branches_exceeded_exception
      | `MaximumRepositoryTriggersExceededException of
        maximum_repository_triggers_exceeded_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryTriggerBranchNameListRequiredException of
        repository_trigger_branch_name_list_required_exception
      | `RepositoryTriggerDestinationArnRequiredException of
        repository_trigger_destination_arn_required_exception
      | `RepositoryTriggerEventsListRequiredException of
        repository_trigger_events_list_required_exception
      | `RepositoryTriggerNameRequiredException of repository_trigger_name_required_exception
      | `RepositoryTriggersListRequiredException of repository_triggers_list_required_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_repository_triggers_input ->
    ( put_repository_triggers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidRepositoryTriggerBranchNameException of
        invalid_repository_trigger_branch_name_exception
      | `InvalidRepositoryTriggerCustomDataException of
        invalid_repository_trigger_custom_data_exception
      | `InvalidRepositoryTriggerDestinationArnException of
        invalid_repository_trigger_destination_arn_exception
      | `InvalidRepositoryTriggerEventsException of invalid_repository_trigger_events_exception
      | `InvalidRepositoryTriggerNameException of invalid_repository_trigger_name_exception
      | `InvalidRepositoryTriggerRegionException of invalid_repository_trigger_region_exception
      | `MaximumBranchesExceededException of maximum_branches_exceeded_exception
      | `MaximumRepositoryTriggersExceededException of
        maximum_repository_triggers_exceeded_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryTriggerBranchNameListRequiredException of
        repository_trigger_branch_name_list_required_exception
      | `RepositoryTriggerDestinationArnRequiredException of
        repository_trigger_destination_arn_required_exception
      | `RepositoryTriggerEventsListRequiredException of
        repository_trigger_events_list_required_exception
      | `RepositoryTriggerNameRequiredException of repository_trigger_name_required_exception
      | `RepositoryTriggersListRequiredException of repository_triggers_list_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Replaces all triggers for a repository. Used to create or delete triggers.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidResourceArnException of invalid_resource_arn_exception
    | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
    | `InvalidTagsMapException of invalid_tags_map_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `ResourceArnRequiredException of resource_arn_required_exception
    | `TagPolicyException of tag_policy_exception
    | `TagsMapRequiredException of tags_map_required_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidResourceArnException of invalid_resource_arn_exception
      | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
      | `InvalidTagsMapException of invalid_tags_map_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `ResourceArnRequiredException of resource_arn_required_exception
      | `TagPolicyException of tag_policy_exception
      | `TagsMapRequiredException of tags_map_required_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidResourceArnException of invalid_resource_arn_exception
      | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
      | `InvalidTagsMapException of invalid_tags_map_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `ResourceArnRequiredException of resource_arn_required_exception
      | `TagPolicyException of tag_policy_exception
      | `TagsMapRequiredException of tags_map_required_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates tags for a resource in CodeCommit. For a list of valid resources in CodeCommit, \
   see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats}CodeCommit \
   Resources and Operations} in the {i CodeCommit User Guide}.\n"]

module TestRepositoryTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidRepositoryTriggerBranchNameException of
      invalid_repository_trigger_branch_name_exception
    | `InvalidRepositoryTriggerCustomDataException of
      invalid_repository_trigger_custom_data_exception
    | `InvalidRepositoryTriggerDestinationArnException of
      invalid_repository_trigger_destination_arn_exception
    | `InvalidRepositoryTriggerEventsException of invalid_repository_trigger_events_exception
    | `InvalidRepositoryTriggerNameException of invalid_repository_trigger_name_exception
    | `InvalidRepositoryTriggerRegionException of invalid_repository_trigger_region_exception
    | `MaximumBranchesExceededException of maximum_branches_exceeded_exception
    | `MaximumRepositoryTriggersExceededException of maximum_repository_triggers_exceeded_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `RepositoryTriggerBranchNameListRequiredException of
      repository_trigger_branch_name_list_required_exception
    | `RepositoryTriggerDestinationArnRequiredException of
      repository_trigger_destination_arn_required_exception
    | `RepositoryTriggerEventsListRequiredException of
      repository_trigger_events_list_required_exception
    | `RepositoryTriggerNameRequiredException of repository_trigger_name_required_exception
    | `RepositoryTriggersListRequiredException of repository_triggers_list_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_repository_triggers_input ->
    ( test_repository_triggers_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidRepositoryTriggerBranchNameException of
        invalid_repository_trigger_branch_name_exception
      | `InvalidRepositoryTriggerCustomDataException of
        invalid_repository_trigger_custom_data_exception
      | `InvalidRepositoryTriggerDestinationArnException of
        invalid_repository_trigger_destination_arn_exception
      | `InvalidRepositoryTriggerEventsException of invalid_repository_trigger_events_exception
      | `InvalidRepositoryTriggerNameException of invalid_repository_trigger_name_exception
      | `InvalidRepositoryTriggerRegionException of invalid_repository_trigger_region_exception
      | `MaximumBranchesExceededException of maximum_branches_exceeded_exception
      | `MaximumRepositoryTriggersExceededException of
        maximum_repository_triggers_exceeded_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryTriggerBranchNameListRequiredException of
        repository_trigger_branch_name_list_required_exception
      | `RepositoryTriggerDestinationArnRequiredException of
        repository_trigger_destination_arn_required_exception
      | `RepositoryTriggerEventsListRequiredException of
        repository_trigger_events_list_required_exception
      | `RepositoryTriggerNameRequiredException of repository_trigger_name_required_exception
      | `RepositoryTriggersListRequiredException of repository_triggers_list_required_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_repository_triggers_input ->
    ( test_repository_triggers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidRepositoryTriggerBranchNameException of
        invalid_repository_trigger_branch_name_exception
      | `InvalidRepositoryTriggerCustomDataException of
        invalid_repository_trigger_custom_data_exception
      | `InvalidRepositoryTriggerDestinationArnException of
        invalid_repository_trigger_destination_arn_exception
      | `InvalidRepositoryTriggerEventsException of invalid_repository_trigger_events_exception
      | `InvalidRepositoryTriggerNameException of invalid_repository_trigger_name_exception
      | `InvalidRepositoryTriggerRegionException of invalid_repository_trigger_region_exception
      | `MaximumBranchesExceededException of maximum_branches_exceeded_exception
      | `MaximumRepositoryTriggersExceededException of
        maximum_repository_triggers_exceeded_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `RepositoryTriggerBranchNameListRequiredException of
        repository_trigger_branch_name_list_required_exception
      | `RepositoryTriggerDestinationArnRequiredException of
        repository_trigger_destination_arn_required_exception
      | `RepositoryTriggerEventsListRequiredException of
        repository_trigger_events_list_required_exception
      | `RepositoryTriggerNameRequiredException of repository_trigger_name_required_exception
      | `RepositoryTriggersListRequiredException of repository_triggers_list_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Tests the functionality of repository triggers by sending information to the trigger target. If \
   real data is available in the repository, the test sends data from the last commit. If no data \
   is available, sample data is generated.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `InvalidResourceArnException of invalid_resource_arn_exception
    | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
    | `InvalidTagKeysListException of invalid_tag_keys_list_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `ResourceArnRequiredException of resource_arn_required_exception
    | `TagKeysListRequiredException of tag_keys_list_required_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidResourceArnException of invalid_resource_arn_exception
      | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
      | `InvalidTagKeysListException of invalid_tag_keys_list_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `ResourceArnRequiredException of resource_arn_required_exception
      | `TagKeysListRequiredException of tag_keys_list_required_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `InvalidResourceArnException of invalid_resource_arn_exception
      | `InvalidSystemTagUsageException of invalid_system_tag_usage_exception
      | `InvalidTagKeysListException of invalid_tag_keys_list_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `ResourceArnRequiredException of resource_arn_required_exception
      | `TagKeysListRequiredException of tag_keys_list_required_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes tags for a resource in CodeCommit. For a list of valid resources in CodeCommit, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats}CodeCommit \
   Resources and Operations} in the {i CodeCommit User Guide}.\n"]

module UpdateApprovalRuleTemplateContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateContentRequiredException of
      approval_rule_template_content_required_exception
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `InvalidApprovalRuleTemplateContentException of
      invalid_approval_rule_template_content_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
    | `InvalidRuleContentSha256Exception of invalid_rule_content_sha256_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_approval_rule_template_content_input ->
    ( update_approval_rule_template_content_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateContentRequiredException of
        approval_rule_template_content_required_exception
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateContentException of
        invalid_approval_rule_template_content_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `InvalidRuleContentSha256Exception of invalid_rule_content_sha256_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_approval_rule_template_content_input ->
    ( update_approval_rule_template_content_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateContentRequiredException of
        approval_rule_template_content_required_exception
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateContentException of
        invalid_approval_rule_template_content_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `InvalidRuleContentSha256Exception of invalid_rule_content_sha256_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the content of an approval rule template. You can change the number of required \
   approvals, the membership of the approval rule, and whether an approval pool is defined.\n"]

module UpdateApprovalRuleTemplateDescription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `InvalidApprovalRuleTemplateDescriptionException of
      invalid_approval_rule_template_description_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_approval_rule_template_description_input ->
    ( update_approval_rule_template_description_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateDescriptionException of
        invalid_approval_rule_template_description_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_approval_rule_template_description_input ->
    ( update_approval_rule_template_description_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateDescriptionException of
        invalid_approval_rule_template_description_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the description for a specified approval rule template.\n"]

module UpdateApprovalRuleTemplateName : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameAlreadyExistsException of
      approval_rule_template_name_already_exists_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_approval_rule_template_name_input ->
    ( update_approval_rule_template_name_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameAlreadyExistsException of
        approval_rule_template_name_already_exists_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_approval_rule_template_name_input ->
    ( update_approval_rule_template_name_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameAlreadyExistsException of
        approval_rule_template_name_already_exists_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the name of a specified approval rule template.\n"]

module UpdateComment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommentContentRequiredException of comment_content_required_exception
    | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
    | `CommentDeletedException of comment_deleted_exception
    | `CommentDoesNotExistException of comment_does_not_exist_exception
    | `CommentIdRequiredException of comment_id_required_exception
    | `CommentNotCreatedByCallerException of comment_not_created_by_caller_exception
    | `InvalidCommentIdException of invalid_comment_id_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_comment_input ->
    ( update_comment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentContentRequiredException of comment_content_required_exception
      | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `CommentNotCreatedByCallerException of comment_not_created_by_caller_exception
      | `InvalidCommentIdException of invalid_comment_id_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_comment_input ->
    ( update_comment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommentContentRequiredException of comment_content_required_exception
      | `CommentContentSizeLimitExceededException of comment_content_size_limit_exceeded_exception
      | `CommentDeletedException of comment_deleted_exception
      | `CommentDoesNotExistException of comment_does_not_exist_exception
      | `CommentIdRequiredException of comment_id_required_exception
      | `CommentNotCreatedByCallerException of comment_not_created_by_caller_exception
      | `InvalidCommentIdException of invalid_comment_id_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Replaces the contents of a comment.\n"]

module UpdateDefaultBranch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BranchDoesNotExistException of branch_does_not_exist_exception
    | `BranchNameRequiredException of branch_name_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidBranchNameException of invalid_branch_name_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_default_branch_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_default_branch_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BranchDoesNotExistException of branch_does_not_exist_exception
      | `BranchNameRequiredException of branch_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidBranchNameException of invalid_branch_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets or changes the default branch name for the specified repository.\n\n\
  \  If you use this operation to change the default branch name to the current default branch \
   name, a success message is returned even though the default branch did not change.\n\
  \  \n\
  \   "]

module UpdatePullRequestApprovalRuleContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleContentRequiredException of approval_rule_content_required_exception
    | `ApprovalRuleDoesNotExistException of approval_rule_does_not_exist_exception
    | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
    | `CannotModifyApprovalRuleFromTemplateException of
      cannot_modify_approval_rule_from_template_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalRuleContentException of invalid_approval_rule_content_exception
    | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRuleContentSha256Exception of invalid_rule_content_sha256_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_approval_rule_content_input ->
    ( update_pull_request_approval_rule_content_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleContentRequiredException of approval_rule_content_required_exception
      | `ApprovalRuleDoesNotExistException of approval_rule_does_not_exist_exception
      | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
      | `CannotModifyApprovalRuleFromTemplateException of
        cannot_modify_approval_rule_from_template_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleContentException of invalid_approval_rule_content_exception
      | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRuleContentSha256Exception of invalid_rule_content_sha256_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_approval_rule_content_input ->
    ( update_pull_request_approval_rule_content_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleContentRequiredException of approval_rule_content_required_exception
      | `ApprovalRuleDoesNotExistException of approval_rule_does_not_exist_exception
      | `ApprovalRuleNameRequiredException of approval_rule_name_required_exception
      | `CannotModifyApprovalRuleFromTemplateException of
        cannot_modify_approval_rule_from_template_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleContentException of invalid_approval_rule_content_exception
      | `InvalidApprovalRuleNameException of invalid_approval_rule_name_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRuleContentSha256Exception of invalid_rule_content_sha256_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the structure of an approval rule created specifically for a pull request. For example, \
   you can change the number of required approvers and the approval pool for approvers. \n"]

module UpdatePullRequestApprovalState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalStateRequiredException of approval_state_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalStateException of invalid_approval_state_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidRevisionIdException of invalid_revision_id_exception
    | `MaximumNumberOfApprovalsExceededException of maximum_number_of_approvals_exceeded_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestCannotBeApprovedByAuthorException of
      pull_request_cannot_be_approved_by_author_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `RevisionIdRequiredException of revision_id_required_exception
    | `RevisionNotCurrentException of revision_not_current_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_approval_state_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalStateRequiredException of approval_state_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalStateException of invalid_approval_state_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `MaximumNumberOfApprovalsExceededException of maximum_number_of_approvals_exceeded_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestCannotBeApprovedByAuthorException of
        pull_request_cannot_be_approved_by_author_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception
      | `RevisionNotCurrentException of revision_not_current_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_approval_state_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalStateRequiredException of approval_state_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalStateException of invalid_approval_state_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidRevisionIdException of invalid_revision_id_exception
      | `MaximumNumberOfApprovalsExceededException of maximum_number_of_approvals_exceeded_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestCannotBeApprovedByAuthorException of
        pull_request_cannot_be_approved_by_author_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `RevisionIdRequiredException of revision_id_required_exception
      | `RevisionNotCurrentException of revision_not_current_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the state of a user's approval on a pull request. The user is derived from the \
   signed-in account when the request is made.\n"]

module UpdatePullRequestDescription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidDescriptionException of invalid_description_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_description_input ->
    ( update_pull_request_description_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidDescriptionException of invalid_description_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_description_input ->
    ( update_pull_request_description_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidDescriptionException of invalid_description_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Replaces the contents of the description of a pull request.\n"]

module UpdatePullRequestStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidPullRequestStatusException of invalid_pull_request_status_exception
    | `InvalidPullRequestStatusUpdateException of invalid_pull_request_status_update_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `PullRequestStatusRequiredException of pull_request_status_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_status_input ->
    ( update_pull_request_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidPullRequestStatusException of invalid_pull_request_status_exception
      | `InvalidPullRequestStatusUpdateException of invalid_pull_request_status_update_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `PullRequestStatusRequiredException of pull_request_status_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_status_input ->
    ( update_pull_request_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidPullRequestStatusException of invalid_pull_request_status_exception
      | `InvalidPullRequestStatusUpdateException of invalid_pull_request_status_update_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `PullRequestStatusRequiredException of pull_request_status_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the status of a pull request. \n"]

module UpdatePullRequestTitle : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidPullRequestIdException of invalid_pull_request_id_exception
    | `InvalidTitleException of invalid_title_exception
    | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
    | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
    | `PullRequestIdRequiredException of pull_request_id_required_exception
    | `TitleRequiredException of title_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_title_input ->
    ( update_pull_request_title_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidTitleException of invalid_title_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `TitleRequiredException of title_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pull_request_title_input ->
    ( update_pull_request_title_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPullRequestIdException of invalid_pull_request_id_exception
      | `InvalidTitleException of invalid_title_exception
      | `PullRequestAlreadyClosedException of pull_request_already_closed_exception
      | `PullRequestDoesNotExistException of pull_request_does_not_exist_exception
      | `PullRequestIdRequiredException of pull_request_id_required_exception
      | `TitleRequiredException of title_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Replaces the title of a pull request.\n"]

module UpdateRepositoryDescription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryDescriptionException of invalid_repository_description_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_repository_description_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryDescriptionException of invalid_repository_description_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_repository_description_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryDescriptionException of invalid_repository_description_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets or changes the comment or description for a repository.\n\n\
  \  The description field for a repository accepts all HTML characters and all valid Unicode \
   characters. Applications that do not HTML-encode the description and display it in a webpage \
   can expose users to potentially malicious code. Make sure that you HTML-encode the description \
   field in any application that uses this API to display the repository description on a webpage.\n\
  \  \n\
  \   "]

module UpdateRepositoryEncryptionKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyInvalidIdException of encryption_key_invalid_id_exception
    | `EncryptionKeyInvalidUsageException of encryption_key_invalid_usage_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyRequiredException of encryption_key_required_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_repository_encryption_key_input ->
    ( update_repository_encryption_key_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyInvalidIdException of encryption_key_invalid_id_exception
      | `EncryptionKeyInvalidUsageException of encryption_key_invalid_usage_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyRequiredException of encryption_key_required_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_repository_encryption_key_input ->
    ( update_repository_encryption_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyInvalidIdException of encryption_key_invalid_id_exception
      | `EncryptionKeyInvalidUsageException of encryption_key_invalid_usage_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyRequiredException of encryption_key_required_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the Key Management Service encryption key used to encrypt and decrypt a CodeCommit \
   repository.\n"]

module UpdateRepositoryName : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameExistsException of repository_name_exists_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_repository_name_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameExistsException of repository_name_exists_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_repository_name_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameExistsException of repository_name_exists_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Renames a repository. The repository name must be unique across the calling Amazon Web Services \
   account. Repository names are limited to 100 alphanumeric, dash, and underscore characters, and \
   cannot include certain characters. The suffix .git is prohibited. For more information about \
   the limits on repository names, see \
   {{:https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html}Quotas} in the \
   CodeCommit User Guide.\n"]

module BatchGetRepositories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
    | `RepositoryNamesRequiredException of repository_names_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_repositories_input ->
    ( batch_get_repositories_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
      | `RepositoryNamesRequiredException of repository_names_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_repositories_input ->
    ( batch_get_repositories_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
      | `RepositoryNamesRequiredException of repository_names_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about one or more repositories.\n\n\
  \  The description field for a repository accepts all HTML characters and all valid Unicode \
   characters. Applications that do not HTML-encode the description and display it in a webpage \
   can expose users to potentially malicious code. Make sure that you HTML-encode the description \
   field in any application that uses this API to display the repository description on a webpage.\n\
  \  \n\
  \   "]

module BatchGetCommits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitIdsLimitExceededException of commit_ids_limit_exceeded_exception
    | `CommitIdsListRequiredException of commit_ids_list_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_commits_input ->
    ( batch_get_commits_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitIdsLimitExceededException of commit_ids_limit_exceeded_exception
      | `CommitIdsListRequiredException of commit_ids_list_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_commits_input ->
    ( batch_get_commits_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitIdsLimitExceededException of commit_ids_limit_exceeded_exception
      | `CommitIdsListRequiredException of commit_ids_list_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the contents of one or more commits in a repository.\n"]

module BatchDisassociateApprovalRuleTemplateFromRepositories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
    | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
    | `RepositoryNamesRequiredException of repository_names_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_approval_rule_template_from_repositories_input ->
    ( batch_disassociate_approval_rule_template_from_repositories_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
      | `RepositoryNamesRequiredException of repository_names_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_approval_rule_template_from_repositories_input ->
    ( batch_disassociate_approval_rule_template_from_repositories_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
      | `RepositoryNamesRequiredException of repository_names_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association between an approval rule template and one or more specified \
   repositories. \n"]

module BatchDescribeMergeConflicts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CommitDoesNotExistException of commit_does_not_exist_exception
    | `CommitRequiredException of commit_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidCommitException of invalid_commit_exception
    | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
    | `InvalidConflictResolutionStrategyException of invalid_conflict_resolution_strategy_exception
    | `InvalidContinuationTokenException of invalid_continuation_token_exception
    | `InvalidMaxConflictFilesException of invalid_max_conflict_files_exception
    | `InvalidMaxMergeHunksException of invalid_max_merge_hunks_exception
    | `InvalidMergeOptionException of invalid_merge_option_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `MaximumFileContentToLoadExceededException of maximum_file_content_to_load_exceeded_exception
    | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
    | `MergeOptionRequiredException of merge_option_required_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception
    | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_describe_merge_conflicts_input ->
    ( batch_describe_merge_conflicts_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxConflictFilesException of invalid_max_conflict_files_exception
      | `InvalidMaxMergeHunksException of invalid_max_merge_hunks_exception
      | `InvalidMergeOptionException of invalid_merge_option_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MergeOptionRequiredException of merge_option_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_describe_merge_conflicts_input ->
    ( batch_describe_merge_conflicts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CommitDoesNotExistException of commit_does_not_exist_exception
      | `CommitRequiredException of commit_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidCommitException of invalid_commit_exception
      | `InvalidConflictDetailLevelException of invalid_conflict_detail_level_exception
      | `InvalidConflictResolutionStrategyException of
        invalid_conflict_resolution_strategy_exception
      | `InvalidContinuationTokenException of invalid_continuation_token_exception
      | `InvalidMaxConflictFilesException of invalid_max_conflict_files_exception
      | `InvalidMaxMergeHunksException of invalid_max_merge_hunks_exception
      | `InvalidMergeOptionException of invalid_merge_option_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumFileContentToLoadExceededException of
        maximum_file_content_to_load_exceeded_exception
      | `MaximumItemsToCompareExceededException of maximum_items_to_compare_exceeded_exception
      | `MergeOptionRequiredException of merge_option_required_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception
      | `TipsDivergenceExceededException of tips_divergence_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about one or more merge conflicts in the attempted merge of two commit \
   specifiers using the squash or three-way merge strategy.\n"]

module BatchAssociateApprovalRuleTemplateWithRepositories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
    | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
    | `RepositoryNamesRequiredException of repository_names_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_approval_rule_template_with_repositories_input ->
    ( batch_associate_approval_rule_template_with_repositories_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
      | `RepositoryNamesRequiredException of repository_names_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_approval_rule_template_with_repositories_input ->
    ( batch_associate_approval_rule_template_with_repositories_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `MaximumRepositoryNamesExceededException of maximum_repository_names_exceeded_exception
      | `RepositoryNamesRequiredException of repository_names_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an association between an approval rule template and one or more specified repositories. \n"]

(** {1:Serialization and Deserialization} *)
module AssociateApprovalRuleTemplateWithRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApprovalRuleTemplateDoesNotExistException of approval_rule_template_does_not_exist_exception
    | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
    | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
    | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
    | `EncryptionKeyDisabledException of encryption_key_disabled_exception
    | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
    | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
    | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
    | `InvalidRepositoryNameException of invalid_repository_name_exception
    | `MaximumRuleTemplatesAssociatedWithRepositoryException of
      maximum_rule_templates_associated_with_repository_exception
    | `RepositoryDoesNotExistException of repository_does_not_exist_exception
    | `RepositoryNameRequiredException of repository_name_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_approval_rule_template_with_repository_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumRuleTemplatesAssociatedWithRepositoryException of
        maximum_rule_templates_associated_with_repository_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_approval_rule_template_with_repository_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApprovalRuleTemplateDoesNotExistException of
        approval_rule_template_does_not_exist_exception
      | `ApprovalRuleTemplateNameRequiredException of approval_rule_template_name_required_exception
      | `EncryptionIntegrityChecksFailedException of encryption_integrity_checks_failed_exception
      | `EncryptionKeyAccessDeniedException of encryption_key_access_denied_exception
      | `EncryptionKeyDisabledException of encryption_key_disabled_exception
      | `EncryptionKeyNotFoundException of encryption_key_not_found_exception
      | `EncryptionKeyUnavailableException of encryption_key_unavailable_exception
      | `InvalidApprovalRuleTemplateNameException of invalid_approval_rule_template_name_exception
      | `InvalidRepositoryNameException of invalid_repository_name_exception
      | `MaximumRuleTemplatesAssociatedWithRepositoryException of
        maximum_rule_templates_associated_with_repository_exception
      | `RepositoryDoesNotExistException of repository_does_not_exist_exception
      | `RepositoryNameRequiredException of repository_name_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an association between an approval rule template and a specified repository. Then, the \
   next time a pull request is created in the repository where the destination reference (if \
   specified) matches the destination reference (branch) for the pull request, an approval rule \
   that matches the template conditions is automatically created for that pull request. If no \
   destination references are specified in the template, an approval rule that matches the \
   template contents is created for all pull requests in that repository.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
