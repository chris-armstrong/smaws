open Types

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
