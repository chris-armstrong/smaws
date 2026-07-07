open Types

val make_user_info : ?date:date -> ?email:email -> ?name:name -> unit -> user_info

val make_update_repository_name_input :
  new_name:repository_name -> old_name:repository_name -> unit -> update_repository_name_input

val make_update_repository_encryption_key_output :
  ?original_kms_key_id:kms_key_id ->
  ?kms_key_id:kms_key_id ->
  ?repository_id:repository_id ->
  unit ->
  update_repository_encryption_key_output

val make_update_repository_encryption_key_input :
  kms_key_id:kms_key_id ->
  repository_name:repository_name ->
  unit ->
  update_repository_encryption_key_input

val make_update_repository_description_input :
  ?repository_description:repository_description ->
  repository_name:repository_name ->
  unit ->
  update_repository_description_input

val make_merge_metadata :
  ?merge_option:merge_option_type_enum ->
  ?merge_commit_id:commit_id ->
  ?merged_by:arn ->
  ?is_merged:is_merged ->
  unit ->
  merge_metadata

val make_pull_request_target :
  ?merge_metadata:merge_metadata ->
  ?merge_base:commit_id ->
  ?source_commit:commit_id ->
  ?destination_commit:commit_id ->
  ?destination_reference:reference_name ->
  ?source_reference:reference_name ->
  ?repository_name:repository_name ->
  unit ->
  pull_request_target

val make_origin_approval_rule_template :
  ?approval_rule_template_name:approval_rule_template_name ->
  ?approval_rule_template_id:approval_rule_template_id ->
  unit ->
  origin_approval_rule_template

val make_approval_rule :
  ?origin_approval_rule_template:origin_approval_rule_template ->
  ?last_modified_user:arn ->
  ?creation_date:creation_date ->
  ?last_modified_date:last_modified_date ->
  ?rule_content_sha256:rule_content_sha256 ->
  ?approval_rule_content:approval_rule_content ->
  ?approval_rule_name:approval_rule_name ->
  ?approval_rule_id:approval_rule_id ->
  unit ->
  approval_rule

val make_pull_request :
  ?approval_rules:approval_rules_list ->
  ?revision_id:revision_id ->
  ?client_request_token:client_request_token ->
  ?pull_request_targets:pull_request_target_list ->
  ?author_arn:arn ->
  ?pull_request_status:pull_request_status_enum ->
  ?creation_date:creation_date ->
  ?last_activity_date:last_modified_date ->
  ?description:description ->
  ?title:title ->
  ?pull_request_id:pull_request_id ->
  unit ->
  pull_request

val make_update_pull_request_title_output :
  pull_request:pull_request -> unit -> update_pull_request_title_output

val make_update_pull_request_title_input :
  title:title -> pull_request_id:pull_request_id -> unit -> update_pull_request_title_input

val make_update_pull_request_status_output :
  pull_request:pull_request -> unit -> update_pull_request_status_output

val make_update_pull_request_status_input :
  pull_request_status:pull_request_status_enum ->
  pull_request_id:pull_request_id ->
  unit ->
  update_pull_request_status_input

val make_update_pull_request_description_output :
  pull_request:pull_request -> unit -> update_pull_request_description_output

val make_update_pull_request_description_input :
  description:description ->
  pull_request_id:pull_request_id ->
  unit ->
  update_pull_request_description_input

val make_update_pull_request_approval_state_input :
  approval_state:approval_state ->
  revision_id:revision_id ->
  pull_request_id:pull_request_id ->
  unit ->
  update_pull_request_approval_state_input

val make_update_pull_request_approval_rule_content_output :
  approval_rule:approval_rule -> unit -> update_pull_request_approval_rule_content_output

val make_update_pull_request_approval_rule_content_input :
  ?existing_rule_content_sha256:rule_content_sha256 ->
  new_rule_content:approval_rule_content ->
  approval_rule_name:approval_rule_name ->
  pull_request_id:pull_request_id ->
  unit ->
  update_pull_request_approval_rule_content_input

val make_update_default_branch_input :
  default_branch_name:branch_name ->
  repository_name:repository_name ->
  unit ->
  update_default_branch_input

val make_comment :
  ?reaction_counts:reaction_counts_map ->
  ?caller_reactions:caller_reactions ->
  ?client_request_token:client_request_token ->
  ?deleted:is_comment_deleted ->
  ?author_arn:arn ->
  ?last_modified_date:last_modified_date ->
  ?creation_date:creation_date ->
  ?in_reply_to:comment_id ->
  ?content:content ->
  ?comment_id:comment_id ->
  unit ->
  comment

val make_update_comment_output : ?comment:comment -> unit -> update_comment_output

val make_update_comment_input :
  content:content -> comment_id:comment_id -> unit -> update_comment_input

val make_approval_rule_template :
  ?last_modified_user:arn ->
  ?creation_date:creation_date ->
  ?last_modified_date:last_modified_date ->
  ?rule_content_sha256:rule_content_sha256 ->
  ?approval_rule_template_content:approval_rule_template_content ->
  ?approval_rule_template_description:approval_rule_template_description ->
  ?approval_rule_template_name:approval_rule_template_name ->
  ?approval_rule_template_id:approval_rule_template_id ->
  unit ->
  approval_rule_template

val make_update_approval_rule_template_name_output :
  approval_rule_template:approval_rule_template -> unit -> update_approval_rule_template_name_output

val make_update_approval_rule_template_name_input :
  new_approval_rule_template_name:approval_rule_template_name ->
  old_approval_rule_template_name:approval_rule_template_name ->
  unit ->
  update_approval_rule_template_name_input

val make_update_approval_rule_template_description_output :
  approval_rule_template:approval_rule_template ->
  unit ->
  update_approval_rule_template_description_output

val make_update_approval_rule_template_description_input :
  approval_rule_template_description:approval_rule_template_description ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  update_approval_rule_template_description_input

val make_update_approval_rule_template_content_output :
  approval_rule_template:approval_rule_template ->
  unit ->
  update_approval_rule_template_content_output

val make_update_approval_rule_template_content_input :
  ?existing_rule_content_sha256:rule_content_sha256 ->
  new_rule_content:approval_rule_template_content ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  update_approval_rule_template_content_input

val make_untag_resource_input :
  tag_keys:tag_keys_list -> resource_arn:resource_arn -> unit -> untag_resource_input

val make_repository_trigger_execution_failure :
  ?failure_message:repository_trigger_execution_failure_message ->
  ?trigger:repository_trigger_name ->
  unit ->
  repository_trigger_execution_failure

val make_test_repository_triggers_output :
  ?failed_executions:repository_trigger_execution_failure_list ->
  ?successful_executions:repository_trigger_name_list ->
  unit ->
  test_repository_triggers_output

val make_repository_trigger :
  ?branches:branch_name_list ->
  ?custom_data:repository_trigger_custom_data ->
  events:repository_trigger_event_list ->
  destination_arn:arn ->
  name:repository_trigger_name ->
  unit ->
  repository_trigger

val make_test_repository_triggers_input :
  triggers:repository_triggers_list ->
  repository_name:repository_name ->
  unit ->
  test_repository_triggers_input

val make_target :
  ?destination_reference:reference_name ->
  source_reference:reference_name ->
  repository_name:repository_name ->
  unit ->
  target

val make_tag_resource_input :
  tags:tags_map -> resource_arn:resource_arn -> unit -> tag_resource_input

val make_symbolic_link :
  ?file_mode:file_mode_type_enum ->
  ?relative_path:path ->
  ?absolute_path:path ->
  ?blob_id:object_id ->
  unit ->
  symbolic_link

val make_sub_module :
  ?relative_path:path -> ?absolute_path:path -> ?commit_id:object_id -> unit -> sub_module

val make_source_file_specifier : ?is_move:is_move -> file_path:path -> unit -> source_file_specifier

val make_set_file_mode_entry :
  file_mode:file_mode_type_enum -> file_path:path -> unit -> set_file_mode_entry

val make_commit :
  ?additional_data:additional_data ->
  ?committer:user_info ->
  ?author:user_info ->
  ?message:message ->
  ?parents:parent_list ->
  ?tree_id:object_id ->
  ?commit_id:object_id ->
  unit ->
  commit

val make_file_version :
  ?revision_children:revision_children ->
  ?path:path ->
  ?blob_id:object_id ->
  ?commit:commit ->
  unit ->
  file_version

val make_repository_name_id_pair :
  ?repository_id:repository_id ->
  ?repository_name:repository_name ->
  unit ->
  repository_name_id_pair

val make_repository_metadata :
  ?kms_key_id:kms_key_id ->
  ?arn:arn ->
  ?clone_url_ssh:clone_url_ssh ->
  ?clone_url_http:clone_url_http ->
  ?creation_date:creation_date ->
  ?last_modified_date:last_modified_date ->
  ?default_branch:branch_name ->
  ?repository_description:repository_description ->
  ?repository_name:repository_name ->
  ?repository_id:repository_id ->
  ?account_id:account_id ->
  unit ->
  repository_metadata

val make_replace_content_entry :
  ?file_mode:file_mode_type_enum ->
  ?content:file_content ->
  replacement_type:replacement_type_enum ->
  file_path:path ->
  unit ->
  replace_content_entry

val make_reaction_value_formats :
  ?unicode:reaction_unicode ->
  ?short_code:reaction_short_code ->
  ?emoji:reaction_emoji ->
  unit ->
  reaction_value_formats

val make_reaction_for_comment :
  ?reactions_from_deleted_users_count:count ->
  ?reaction_users:reaction_users_list ->
  ?reaction:reaction_value_formats ->
  unit ->
  reaction_for_comment

val make_put_repository_triggers_output :
  ?configuration_id:repository_triggers_configuration_id -> unit -> put_repository_triggers_output

val make_put_repository_triggers_input :
  triggers:repository_triggers_list ->
  repository_name:repository_name ->
  unit ->
  put_repository_triggers_input

val make_put_file_output :
  tree_id:object_id -> blob_id:object_id -> commit_id:object_id -> unit -> put_file_output

val make_put_file_input :
  ?email:email ->
  ?name:name ->
  ?commit_message:message ->
  ?parent_commit_id:commit_id ->
  ?file_mode:file_mode_type_enum ->
  file_path:path ->
  file_content:file_content ->
  branch_name:branch_name ->
  repository_name:repository_name ->
  unit ->
  put_file_input

val make_put_file_entry :
  ?source_file:source_file_specifier ->
  ?file_content:file_content ->
  ?file_mode:file_mode_type_enum ->
  file_path:path ->
  unit ->
  put_file_entry

val make_put_comment_reaction_input :
  reaction_value:reaction_value -> comment_id:comment_id -> unit -> put_comment_reaction_input

val make_pull_request_status_changed_event_metadata :
  ?pull_request_status:pull_request_status_enum ->
  unit ->
  pull_request_status_changed_event_metadata

val make_pull_request_source_reference_updated_event_metadata :
  ?merge_base:commit_id ->
  ?after_commit_id:commit_id ->
  ?before_commit_id:commit_id ->
  ?repository_name:repository_name ->
  unit ->
  pull_request_source_reference_updated_event_metadata

val make_pull_request_merged_state_changed_event_metadata :
  ?merge_metadata:merge_metadata ->
  ?destination_reference:reference_name ->
  ?repository_name:repository_name ->
  unit ->
  pull_request_merged_state_changed_event_metadata

val make_pull_request_created_event_metadata :
  ?merge_base:commit_id ->
  ?destination_commit_id:commit_id ->
  ?source_commit_id:commit_id ->
  ?repository_name:repository_name ->
  unit ->
  pull_request_created_event_metadata

val make_approval_rule_event_metadata :
  ?approval_rule_content:approval_rule_content ->
  ?approval_rule_id:approval_rule_id ->
  ?approval_rule_name:approval_rule_name ->
  unit ->
  approval_rule_event_metadata

val make_approval_state_changed_event_metadata :
  ?approval_status:approval_state ->
  ?revision_id:revision_id ->
  unit ->
  approval_state_changed_event_metadata

val make_approval_rule_overridden_event_metadata :
  ?override_status:override_status ->
  ?revision_id:revision_id ->
  unit ->
  approval_rule_overridden_event_metadata

val make_pull_request_event :
  ?approval_rule_overridden_event_metadata:approval_rule_overridden_event_metadata ->
  ?approval_state_changed_event_metadata:approval_state_changed_event_metadata ->
  ?approval_rule_event_metadata:approval_rule_event_metadata ->
  ?pull_request_merged_state_changed_event_metadata:pull_request_merged_state_changed_event_metadata ->
  ?pull_request_source_reference_updated_event_metadata:
    pull_request_source_reference_updated_event_metadata ->
  ?pull_request_status_changed_event_metadata:pull_request_status_changed_event_metadata ->
  ?pull_request_created_event_metadata:pull_request_created_event_metadata ->
  ?actor_arn:arn ->
  ?pull_request_event_type:pull_request_event_type ->
  ?event_date:event_date ->
  ?pull_request_id:pull_request_id ->
  unit ->
  pull_request_event

val make_post_comment_reply_output : ?comment:comment -> unit -> post_comment_reply_output

val make_post_comment_reply_input :
  ?client_request_token:client_request_token ->
  content:content ->
  in_reply_to:comment_id ->
  unit ->
  post_comment_reply_input

val make_location :
  ?relative_file_version:relative_file_version_enum ->
  ?file_position:position ->
  ?file_path:path ->
  unit ->
  location

val make_post_comment_for_pull_request_output :
  ?comment:comment ->
  ?location:location ->
  ?after_blob_id:object_id ->
  ?before_blob_id:object_id ->
  ?after_commit_id:commit_id ->
  ?before_commit_id:commit_id ->
  ?pull_request_id:pull_request_id ->
  ?repository_name:repository_name ->
  unit ->
  post_comment_for_pull_request_output

val make_post_comment_for_pull_request_input :
  ?client_request_token:client_request_token ->
  ?location:location ->
  content:content ->
  after_commit_id:commit_id ->
  before_commit_id:commit_id ->
  repository_name:repository_name ->
  pull_request_id:pull_request_id ->
  unit ->
  post_comment_for_pull_request_input

val make_post_comment_for_compared_commit_output :
  ?comment:comment ->
  ?location:location ->
  ?after_blob_id:object_id ->
  ?before_blob_id:object_id ->
  ?after_commit_id:commit_id ->
  ?before_commit_id:commit_id ->
  ?repository_name:repository_name ->
  unit ->
  post_comment_for_compared_commit_output

val make_post_comment_for_compared_commit_input :
  ?client_request_token:client_request_token ->
  ?location:location ->
  ?before_commit_id:commit_id ->
  content:content ->
  after_commit_id:commit_id ->
  repository_name:repository_name ->
  unit ->
  post_comment_for_compared_commit_input

val make_override_pull_request_approval_rules_input :
  override_status:override_status ->
  revision_id:revision_id ->
  pull_request_id:pull_request_id ->
  unit ->
  override_pull_request_approval_rules_input

val make_object_types :
  ?base:object_type_enum ->
  ?destination:object_type_enum ->
  ?source:object_type_enum ->
  unit ->
  object_types

val make_merge_pull_request_by_three_way_output :
  ?pull_request:pull_request -> unit -> merge_pull_request_by_three_way_output

val make_delete_file_entry : file_path:path -> unit -> delete_file_entry

val make_conflict_resolution :
  ?set_file_modes:set_file_mode_entries ->
  ?delete_files:delete_file_entries ->
  ?replace_contents:replace_content_entries ->
  unit ->
  conflict_resolution

val make_merge_pull_request_by_three_way_input :
  ?conflict_resolution:conflict_resolution ->
  ?keep_empty_folders:keep_empty_folders ->
  ?email:email ->
  ?author_name:name ->
  ?commit_message:message ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?source_commit_id:object_id ->
  repository_name:repository_name ->
  pull_request_id:pull_request_id ->
  unit ->
  merge_pull_request_by_three_way_input

val make_merge_pull_request_by_squash_output :
  ?pull_request:pull_request -> unit -> merge_pull_request_by_squash_output

val make_merge_pull_request_by_squash_input :
  ?conflict_resolution:conflict_resolution ->
  ?keep_empty_folders:keep_empty_folders ->
  ?email:email ->
  ?author_name:name ->
  ?commit_message:message ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?source_commit_id:object_id ->
  repository_name:repository_name ->
  pull_request_id:pull_request_id ->
  unit ->
  merge_pull_request_by_squash_input

val make_merge_pull_request_by_fast_forward_output :
  ?pull_request:pull_request -> unit -> merge_pull_request_by_fast_forward_output

val make_merge_pull_request_by_fast_forward_input :
  ?source_commit_id:object_id ->
  repository_name:repository_name ->
  pull_request_id:pull_request_id ->
  unit ->
  merge_pull_request_by_fast_forward_input

val make_merge_operations :
  ?destination:change_type_enum -> ?source:change_type_enum -> unit -> merge_operations

val make_merge_hunk_detail :
  ?hunk_content:hunk_content ->
  ?end_line:line_number ->
  ?start_line:line_number ->
  unit ->
  merge_hunk_detail

val make_merge_hunk :
  ?base:merge_hunk_detail ->
  ?destination:merge_hunk_detail ->
  ?source:merge_hunk_detail ->
  ?is_conflict:is_hunk_conflict ->
  unit ->
  merge_hunk

val make_merge_branches_by_three_way_output :
  ?tree_id:object_id -> ?commit_id:object_id -> unit -> merge_branches_by_three_way_output

val make_merge_branches_by_three_way_input :
  ?conflict_resolution:conflict_resolution ->
  ?keep_empty_folders:keep_empty_folders ->
  ?commit_message:message ->
  ?email:email ->
  ?author_name:name ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?target_branch:branch_name ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  merge_branches_by_three_way_input

val make_merge_branches_by_squash_output :
  ?tree_id:object_id -> ?commit_id:object_id -> unit -> merge_branches_by_squash_output

val make_merge_branches_by_squash_input :
  ?conflict_resolution:conflict_resolution ->
  ?keep_empty_folders:keep_empty_folders ->
  ?commit_message:message ->
  ?email:email ->
  ?author_name:name ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?target_branch:branch_name ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  merge_branches_by_squash_input

val make_merge_branches_by_fast_forward_output :
  ?tree_id:object_id -> ?commit_id:object_id -> unit -> merge_branches_by_fast_forward_output

val make_merge_branches_by_fast_forward_input :
  ?target_branch:branch_name ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  merge_branches_by_fast_forward_input

val make_list_tags_for_resource_output :
  ?next_token:next_token -> ?tags:tags_map -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?next_token:next_token -> resource_arn:resource_arn -> unit -> list_tags_for_resource_input

val make_list_repositories_output :
  ?next_token:next_token ->
  ?repositories:repository_name_id_pair_list ->
  unit ->
  list_repositories_output

val make_list_repositories_input :
  ?order:order_enum ->
  ?sort_by:sort_by_enum ->
  ?next_token:next_token ->
  unit ->
  list_repositories_input

val make_list_repositories_for_approval_rule_template_output :
  ?next_token:next_token ->
  ?repository_names:repository_name_list ->
  unit ->
  list_repositories_for_approval_rule_template_output

val make_list_repositories_for_approval_rule_template_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  list_repositories_for_approval_rule_template_input

val make_list_pull_requests_output :
  ?next_token:next_token ->
  pull_request_ids:pull_request_id_list ->
  unit ->
  list_pull_requests_output

val make_list_pull_requests_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?pull_request_status:pull_request_status_enum ->
  ?author_arn:arn ->
  repository_name:repository_name ->
  unit ->
  list_pull_requests_input

val make_list_file_commit_history_response :
  ?next_token:next_token -> revision_dag:revision_dag -> unit -> list_file_commit_history_response

val make_list_file_commit_history_request :
  ?next_token:next_token ->
  ?max_results:limit ->
  ?commit_specifier:commit_name ->
  file_path:path ->
  repository_name:repository_name ->
  unit ->
  list_file_commit_history_request

val make_list_branches_output :
  ?next_token:next_token -> ?branches:branch_name_list -> unit -> list_branches_output

val make_list_branches_input :
  ?next_token:next_token -> repository_name:repository_name -> unit -> list_branches_input

val make_list_associated_approval_rule_templates_for_repository_output :
  ?next_token:next_token ->
  ?approval_rule_template_names:approval_rule_template_name_list ->
  unit ->
  list_associated_approval_rule_templates_for_repository_output

val make_list_associated_approval_rule_templates_for_repository_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  repository_name:repository_name ->
  unit ->
  list_associated_approval_rule_templates_for_repository_input

val make_list_approval_rule_templates_output :
  ?next_token:next_token ->
  ?approval_rule_template_names:approval_rule_template_name_list ->
  unit ->
  list_approval_rule_templates_output

val make_list_approval_rule_templates_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_approval_rule_templates_input

val make_is_binary_file :
  ?base:capital_boolean ->
  ?destination:capital_boolean ->
  ?source:capital_boolean ->
  unit ->
  is_binary_file

val make_get_repository_triggers_output :
  ?triggers:repository_triggers_list ->
  ?configuration_id:repository_triggers_configuration_id ->
  unit ->
  get_repository_triggers_output

val make_get_repository_triggers_input :
  repository_name:repository_name -> unit -> get_repository_triggers_input

val make_get_repository_output :
  ?repository_metadata:repository_metadata -> unit -> get_repository_output

val make_get_repository_input : repository_name:repository_name -> unit -> get_repository_input

val make_get_pull_request_override_state_output :
  ?overrider:arn -> ?overridden:overridden -> unit -> get_pull_request_override_state_output

val make_get_pull_request_override_state_input :
  revision_id:revision_id ->
  pull_request_id:pull_request_id ->
  unit ->
  get_pull_request_override_state_input

val make_get_pull_request_output : pull_request:pull_request -> unit -> get_pull_request_output
val make_get_pull_request_input : pull_request_id:pull_request_id -> unit -> get_pull_request_input
val make_approval : ?approval_state:approval_state -> ?user_arn:arn -> unit -> approval

val make_get_pull_request_approval_states_output :
  ?approvals:approval_list -> unit -> get_pull_request_approval_states_output

val make_get_pull_request_approval_states_input :
  revision_id:revision_id ->
  pull_request_id:pull_request_id ->
  unit ->
  get_pull_request_approval_states_input

val make_get_merge_options_output :
  base_commit_id:object_id ->
  destination_commit_id:object_id ->
  source_commit_id:object_id ->
  merge_options:merge_options ->
  unit ->
  get_merge_options_output

val make_get_merge_options_input :
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  get_merge_options_input

val make_file_sizes :
  ?base:file_size -> ?destination:file_size -> ?source:file_size -> unit -> file_sizes

val make_file_modes :
  ?base:file_mode_type_enum ->
  ?destination:file_mode_type_enum ->
  ?source:file_mode_type_enum ->
  unit ->
  file_modes

val make_conflict_metadata :
  ?merge_operations:merge_operations ->
  ?object_type_conflict:is_object_type_conflict ->
  ?file_mode_conflict:is_file_mode_conflict ->
  ?content_conflict:is_content_conflict ->
  ?is_binary_file:is_binary_file ->
  ?number_of_conflicts:number_of_conflicts ->
  ?object_types:object_types ->
  ?file_modes:file_modes ->
  ?file_sizes:file_sizes ->
  ?file_path:path ->
  unit ->
  conflict_metadata

val make_get_merge_conflicts_output :
  ?next_token:next_token ->
  ?base_commit_id:object_id ->
  conflict_metadata_list:conflict_metadata_list ->
  source_commit_id:object_id ->
  destination_commit_id:object_id ->
  mergeable:is_mergeable ->
  unit ->
  get_merge_conflicts_output

val make_get_merge_conflicts_input :
  ?next_token:next_token ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?max_conflict_files:max_results ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  merge_option:merge_option_type_enum ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  get_merge_conflicts_input

val make_get_merge_commit_output :
  ?merged_commit_id:object_id ->
  ?base_commit_id:object_id ->
  ?destination_commit_id:object_id ->
  ?source_commit_id:object_id ->
  unit ->
  get_merge_commit_output

val make_get_merge_commit_input :
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  get_merge_commit_input

val make_folder : ?relative_path:path -> ?absolute_path:path -> ?tree_id:object_id -> unit -> folder

val make_file :
  ?file_mode:file_mode_type_enum ->
  ?relative_path:path ->
  ?absolute_path:path ->
  ?blob_id:object_id ->
  unit ->
  file

val make_get_folder_output :
  ?sub_modules:sub_module_list ->
  ?symbolic_links:symbolic_link_list ->
  ?files:file_list ->
  ?sub_folders:folder_list ->
  ?tree_id:object_id ->
  folder_path:path ->
  commit_id:object_id ->
  unit ->
  get_folder_output

val make_get_folder_input :
  ?commit_specifier:commit_name ->
  folder_path:path ->
  repository_name:repository_name ->
  unit ->
  get_folder_input

val make_get_file_output :
  file_content:file_content ->
  file_size:object_size ->
  file_mode:file_mode_type_enum ->
  file_path:path ->
  blob_id:object_id ->
  commit_id:object_id ->
  unit ->
  get_file_output

val make_get_file_input :
  ?commit_specifier:commit_name ->
  file_path:path ->
  repository_name:repository_name ->
  unit ->
  get_file_input

val make_blob_metadata : ?mode:mode -> ?path:path -> ?blob_id:object_id -> unit -> blob_metadata

val make_difference :
  ?change_type:change_type_enum ->
  ?after_blob:blob_metadata ->
  ?before_blob:blob_metadata ->
  unit ->
  difference

val make_get_differences_output :
  ?next_token:next_token -> ?differences:difference_list -> unit -> get_differences_output

val make_get_differences_input :
  ?next_token:next_token ->
  ?max_results:limit ->
  ?after_path:path ->
  ?before_path:path ->
  ?before_commit_specifier:commit_name ->
  after_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  get_differences_input

val make_get_commit_output : commit:commit -> unit -> get_commit_output

val make_get_commit_input :
  commit_id:object_id -> repository_name:repository_name -> unit -> get_commit_input

val make_comments_for_pull_request :
  ?comments:comments ->
  ?location:location ->
  ?after_blob_id:object_id ->
  ?before_blob_id:object_id ->
  ?after_commit_id:commit_id ->
  ?before_commit_id:commit_id ->
  ?repository_name:repository_name ->
  ?pull_request_id:pull_request_id ->
  unit ->
  comments_for_pull_request

val make_get_comments_for_pull_request_output :
  ?next_token:next_token ->
  ?comments_for_pull_request_data:comments_for_pull_request_data ->
  unit ->
  get_comments_for_pull_request_output

val make_get_comments_for_pull_request_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?after_commit_id:commit_id ->
  ?before_commit_id:commit_id ->
  ?repository_name:repository_name ->
  pull_request_id:pull_request_id ->
  unit ->
  get_comments_for_pull_request_input

val make_comments_for_compared_commit :
  ?comments:comments ->
  ?location:location ->
  ?after_blob_id:object_id ->
  ?before_blob_id:object_id ->
  ?after_commit_id:commit_id ->
  ?before_commit_id:commit_id ->
  ?repository_name:repository_name ->
  unit ->
  comments_for_compared_commit

val make_get_comments_for_compared_commit_output :
  ?next_token:next_token ->
  ?comments_for_compared_commit_data:comments_for_compared_commit_data ->
  unit ->
  get_comments_for_compared_commit_output

val make_get_comments_for_compared_commit_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?before_commit_id:commit_id ->
  after_commit_id:commit_id ->
  repository_name:repository_name ->
  unit ->
  get_comments_for_compared_commit_input

val make_get_comment_reactions_output :
  ?next_token:next_token ->
  reactions_for_comment:reactions_for_comment_list ->
  unit ->
  get_comment_reactions_output

val make_get_comment_reactions_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?reaction_user_arn:arn ->
  comment_id:comment_id ->
  unit ->
  get_comment_reactions_input

val make_get_comment_output : ?comment:comment -> unit -> get_comment_output
val make_get_comment_input : comment_id:comment_id -> unit -> get_comment_input
val make_branch_info : ?commit_id:commit_id -> ?branch_name:branch_name -> unit -> branch_info
val make_get_branch_output : ?branch:branch_info -> unit -> get_branch_output

val make_get_branch_input :
  ?branch_name:branch_name -> ?repository_name:repository_name -> unit -> get_branch_input

val make_get_blob_output : content:blob -> unit -> get_blob_output

val make_get_blob_input :
  blob_id:object_id -> repository_name:repository_name -> unit -> get_blob_input

val make_get_approval_rule_template_output :
  approval_rule_template:approval_rule_template -> unit -> get_approval_rule_template_output

val make_get_approval_rule_template_input :
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  get_approval_rule_template_input

val make_file_metadata :
  ?file_mode:file_mode_type_enum ->
  ?blob_id:object_id ->
  ?absolute_path:path ->
  unit ->
  file_metadata

val make_evaluation :
  ?approval_rules_not_satisfied:approval_rules_not_satisfied_list ->
  ?approval_rules_satisfied:approval_rules_satisfied_list ->
  ?overridden:overridden ->
  ?approved:approved ->
  unit ->
  evaluation

val make_evaluate_pull_request_approval_rules_output :
  evaluation:evaluation -> unit -> evaluate_pull_request_approval_rules_output

val make_evaluate_pull_request_approval_rules_input :
  revision_id:revision_id ->
  pull_request_id:pull_request_id ->
  unit ->
  evaluate_pull_request_approval_rules_input

val make_disassociate_approval_rule_template_from_repository_input :
  repository_name:repository_name ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  disassociate_approval_rule_template_from_repository_input

val make_describe_pull_request_events_output :
  ?next_token:next_token ->
  pull_request_events:pull_request_event_list ->
  unit ->
  describe_pull_request_events_output

val make_describe_pull_request_events_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?actor_arn:arn ->
  ?pull_request_event_type:pull_request_event_type ->
  pull_request_id:pull_request_id ->
  unit ->
  describe_pull_request_events_input

val make_describe_merge_conflicts_output :
  ?base_commit_id:object_id ->
  ?next_token:next_token ->
  source_commit_id:object_id ->
  destination_commit_id:object_id ->
  merge_hunks:merge_hunks ->
  conflict_metadata:conflict_metadata ->
  unit ->
  describe_merge_conflicts_output

val make_describe_merge_conflicts_input :
  ?next_token:next_token ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?max_merge_hunks:max_results ->
  file_path:path ->
  merge_option:merge_option_type_enum ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  describe_merge_conflicts_input

val make_delete_repository_output : ?repository_id:repository_id -> unit -> delete_repository_output

val make_delete_repository_input :
  repository_name:repository_name -> unit -> delete_repository_input

val make_delete_pull_request_approval_rule_output :
  approval_rule_id:approval_rule_id -> unit -> delete_pull_request_approval_rule_output

val make_delete_pull_request_approval_rule_input :
  approval_rule_name:approval_rule_name ->
  pull_request_id:pull_request_id ->
  unit ->
  delete_pull_request_approval_rule_input

val make_delete_file_output :
  file_path:path ->
  tree_id:object_id ->
  blob_id:object_id ->
  commit_id:object_id ->
  unit ->
  delete_file_output

val make_delete_file_input :
  ?email:email ->
  ?name:name ->
  ?commit_message:message ->
  ?keep_empty_folders:keep_empty_folders ->
  parent_commit_id:commit_id ->
  file_path:path ->
  branch_name:branch_name ->
  repository_name:repository_name ->
  unit ->
  delete_file_input

val make_delete_comment_content_output : ?comment:comment -> unit -> delete_comment_content_output

val make_delete_comment_content_input :
  comment_id:comment_id -> unit -> delete_comment_content_input

val make_delete_branch_output : ?deleted_branch:branch_info -> unit -> delete_branch_output

val make_delete_branch_input :
  branch_name:branch_name -> repository_name:repository_name -> unit -> delete_branch_input

val make_delete_approval_rule_template_output :
  approval_rule_template_id:approval_rule_template_id ->
  unit ->
  delete_approval_rule_template_output

val make_delete_approval_rule_template_input :
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  delete_approval_rule_template_input

val make_create_unreferenced_merge_commit_output :
  ?tree_id:object_id -> ?commit_id:object_id -> unit -> create_unreferenced_merge_commit_output

val make_create_unreferenced_merge_commit_input :
  ?conflict_resolution:conflict_resolution ->
  ?keep_empty_folders:keep_empty_folders ->
  ?commit_message:message ->
  ?email:email ->
  ?author_name:name ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  merge_option:merge_option_type_enum ->
  destination_commit_specifier:commit_name ->
  source_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  create_unreferenced_merge_commit_input

val make_create_repository_output :
  ?repository_metadata:repository_metadata -> unit -> create_repository_output

val make_create_repository_input :
  ?kms_key_id:kms_key_id ->
  ?tags:tags_map ->
  ?repository_description:repository_description ->
  repository_name:repository_name ->
  unit ->
  create_repository_input

val make_create_pull_request_output :
  pull_request:pull_request -> unit -> create_pull_request_output

val make_create_pull_request_input :
  ?client_request_token:client_request_token ->
  ?description:description ->
  targets:target_list ->
  title:title ->
  unit ->
  create_pull_request_input

val make_create_pull_request_approval_rule_output :
  approval_rule:approval_rule -> unit -> create_pull_request_approval_rule_output

val make_create_pull_request_approval_rule_input :
  approval_rule_content:approval_rule_content ->
  approval_rule_name:approval_rule_name ->
  pull_request_id:pull_request_id ->
  unit ->
  create_pull_request_approval_rule_input

val make_create_commit_output :
  ?files_deleted:files_metadata ->
  ?files_updated:files_metadata ->
  ?files_added:files_metadata ->
  ?tree_id:object_id ->
  ?commit_id:object_id ->
  unit ->
  create_commit_output

val make_create_commit_input :
  ?set_file_modes:set_file_mode_entries ->
  ?delete_files:delete_file_entries ->
  ?put_files:put_file_entries ->
  ?keep_empty_folders:keep_empty_folders ->
  ?commit_message:message ->
  ?email:email ->
  ?author_name:name ->
  ?parent_commit_id:commit_id ->
  branch_name:branch_name ->
  repository_name:repository_name ->
  unit ->
  create_commit_input

val make_create_branch_input :
  commit_id:commit_id ->
  branch_name:branch_name ->
  repository_name:repository_name ->
  unit ->
  create_branch_input

val make_create_approval_rule_template_output :
  approval_rule_template:approval_rule_template -> unit -> create_approval_rule_template_output

val make_create_approval_rule_template_input :
  ?approval_rule_template_description:approval_rule_template_description ->
  approval_rule_template_content:approval_rule_template_content ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  create_approval_rule_template_input

val make_conflict :
  ?merge_hunks:merge_hunks -> ?conflict_metadata:conflict_metadata -> unit -> conflict

val make_batch_get_repositories_error :
  ?error_message:error_message ->
  ?error_code:batch_get_repositories_error_code_enum ->
  ?repository_name:repository_name ->
  ?repository_id:repository_id ->
  unit ->
  batch_get_repositories_error

val make_batch_get_repositories_output :
  ?errors:batch_get_repositories_errors_list ->
  ?repositories_not_found:repository_not_found_list ->
  ?repositories:repository_metadata_list ->
  unit ->
  batch_get_repositories_output

val make_batch_get_repositories_input :
  repository_names:repository_name_list -> unit -> batch_get_repositories_input

val make_batch_get_commits_error :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?commit_id:object_id ->
  unit ->
  batch_get_commits_error

val make_batch_get_commits_output :
  ?errors:batch_get_commits_errors_list ->
  ?commits:commit_objects_list ->
  unit ->
  batch_get_commits_output

val make_batch_get_commits_input :
  repository_name:repository_name ->
  commit_ids:commit_ids_input_list ->
  unit ->
  batch_get_commits_input

val make_batch_disassociate_approval_rule_template_from_repositories_error :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?repository_name:repository_name ->
  unit ->
  batch_disassociate_approval_rule_template_from_repositories_error

val make_batch_disassociate_approval_rule_template_from_repositories_output :
  errors:batch_disassociate_approval_rule_template_from_repositories_errors_list ->
  disassociated_repository_names:repository_name_list ->
  unit ->
  batch_disassociate_approval_rule_template_from_repositories_output

val make_batch_disassociate_approval_rule_template_from_repositories_input :
  repository_names:repository_name_list ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  batch_disassociate_approval_rule_template_from_repositories_input

val make_batch_describe_merge_conflicts_error :
  message:message ->
  exception_name:exception_name ->
  file_path:path ->
  unit ->
  batch_describe_merge_conflicts_error

val make_batch_describe_merge_conflicts_output :
  ?base_commit_id:object_id ->
  ?errors:batch_describe_merge_conflicts_errors ->
  ?next_token:next_token ->
  source_commit_id:object_id ->
  destination_commit_id:object_id ->
  conflicts:conflicts ->
  unit ->
  batch_describe_merge_conflicts_output

val make_batch_describe_merge_conflicts_input :
  ?next_token:next_token ->
  ?conflict_resolution_strategy:conflict_resolution_strategy_type_enum ->
  ?conflict_detail_level:conflict_detail_level_type_enum ->
  ?file_paths:file_paths ->
  ?max_conflict_files:max_results ->
  ?max_merge_hunks:max_results ->
  merge_option:merge_option_type_enum ->
  source_commit_specifier:commit_name ->
  destination_commit_specifier:commit_name ->
  repository_name:repository_name ->
  unit ->
  batch_describe_merge_conflicts_input

val make_batch_associate_approval_rule_template_with_repositories_error :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?repository_name:repository_name ->
  unit ->
  batch_associate_approval_rule_template_with_repositories_error

val make_batch_associate_approval_rule_template_with_repositories_output :
  errors:batch_associate_approval_rule_template_with_repositories_errors_list ->
  associated_repository_names:repository_name_list ->
  unit ->
  batch_associate_approval_rule_template_with_repositories_output

val make_batch_associate_approval_rule_template_with_repositories_input :
  repository_names:repository_name_list ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  batch_associate_approval_rule_template_with_repositories_input

val make_associate_approval_rule_template_with_repository_input :
  repository_name:repository_name ->
  approval_rule_template_name:approval_rule_template_name ->
  unit ->
  associate_approval_rule_template_with_repository_input
