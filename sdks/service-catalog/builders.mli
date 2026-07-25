open Types

val make_tag_option_detail :
  ?key:tag_option_key ->
  ?value:tag_option_value ->
  ?active:tag_option_active ->
  ?id:tag_option_id ->
  ?owner:owner ->
  unit ->
  tag_option_detail

val make_update_tag_option_output :
  ?tag_option_detail:tag_option_detail -> unit -> update_tag_option_output

val make_update_tag_option_input :
  ?value:tag_option_value ->
  ?active:tag_option_active ->
  id:tag_option_id ->
  unit ->
  update_tag_option_input

val make_service_action_summary :
  ?id:id ->
  ?name:service_action_name ->
  ?description:service_action_description ->
  ?definition_type:service_action_definition_type ->
  unit ->
  service_action_summary

val make_service_action_detail :
  ?service_action_summary:service_action_summary ->
  ?definition:service_action_definition_map ->
  unit ->
  service_action_detail

val make_update_service_action_output :
  ?service_action_detail:service_action_detail -> unit -> update_service_action_output

val make_update_service_action_input :
  ?name:service_action_name ->
  ?definition:service_action_definition_map ->
  ?description:service_action_description ->
  ?accept_language:accept_language ->
  id:id ->
  unit ->
  update_service_action_input

val make_provisioning_artifact_detail :
  ?id:id ->
  ?name:provisioning_artifact_name ->
  ?description:provisioning_artifact_name ->
  ?type_:provisioning_artifact_type ->
  ?created_time:creation_time ->
  ?active:provisioning_artifact_active ->
  ?guidance:provisioning_artifact_guidance ->
  ?source_revision:source_revision ->
  unit ->
  provisioning_artifact_detail

val make_update_provisioning_artifact_output :
  ?provisioning_artifact_detail:provisioning_artifact_detail ->
  ?info:provisioning_artifact_info ->
  ?status:status ->
  unit ->
  update_provisioning_artifact_output

val make_update_provisioning_artifact_input :
  ?accept_language:accept_language ->
  ?name:provisioning_artifact_name ->
  ?description:provisioning_artifact_description ->
  ?active:provisioning_artifact_active ->
  ?guidance:provisioning_artifact_guidance ->
  product_id:id ->
  provisioning_artifact_id:id ->
  unit ->
  update_provisioning_artifact_input

val make_update_provisioned_product_properties_output :
  ?provisioned_product_id:id ->
  ?provisioned_product_properties:provisioned_product_properties ->
  ?record_id:id ->
  ?status:record_status ->
  unit ->
  update_provisioned_product_properties_output

val make_update_provisioned_product_properties_input :
  ?accept_language:accept_language ->
  provisioned_product_id:id ->
  provisioned_product_properties:provisioned_product_properties ->
  idempotency_token:idempotency_token ->
  unit ->
  update_provisioned_product_properties_input

val make_record_tag : ?key:record_tag_key -> ?value:record_tag_value -> unit -> record_tag
val make_record_error : ?code:error_code -> ?description:error_description -> unit -> record_error

val make_record_detail :
  ?record_id:id ->
  ?provisioned_product_name:provisioned_product_name ->
  ?status:record_status ->
  ?created_time:created_time ->
  ?updated_time:updated_time ->
  ?provisioned_product_type:provisioned_product_type ->
  ?record_type:record_type ->
  ?provisioned_product_id:id ->
  ?product_id:id ->
  ?provisioning_artifact_id:id ->
  ?path_id:id ->
  ?record_errors:record_errors ->
  ?record_tags:record_tags ->
  ?launch_role_arn:role_arn ->
  unit ->
  record_detail

val make_update_provisioned_product_output :
  ?record_detail:record_detail -> unit -> update_provisioned_product_output

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_update_provisioning_preferences :
  ?stack_set_accounts:stack_set_accounts ->
  ?stack_set_regions:stack_set_regions ->
  ?stack_set_failure_tolerance_count:stack_set_failure_tolerance_count ->
  ?stack_set_failure_tolerance_percentage:stack_set_failure_tolerance_percentage ->
  ?stack_set_max_concurrency_count:stack_set_max_concurrency_count ->
  ?stack_set_max_concurrency_percentage:stack_set_max_concurrency_percentage ->
  ?stack_set_operation_type:stack_set_operation_type ->
  unit ->
  update_provisioning_preferences

val make_update_provisioning_parameter :
  ?key:parameter_key ->
  ?value:parameter_value ->
  ?use_previous_value:use_previous_value ->
  unit ->
  update_provisioning_parameter

val make_update_provisioned_product_input :
  ?accept_language:accept_language ->
  ?provisioned_product_name:provisioned_product_name_or_arn ->
  ?provisioned_product_id:id ->
  ?product_id:id ->
  ?product_name:product_view_name ->
  ?provisioning_artifact_id:id ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?path_id:id ->
  ?path_name:portfolio_display_name ->
  ?provisioning_parameters:update_provisioning_parameters ->
  ?provisioning_preferences:update_provisioning_preferences ->
  ?tags:tags ->
  update_token:idempotency_token ->
  unit ->
  update_provisioned_product_input

val make_last_sync :
  ?last_sync_time:last_sync_time ->
  ?last_sync_status:last_sync_status ->
  ?last_sync_status_message:last_sync_status_message ->
  ?last_successful_sync_time:last_successful_sync_time ->
  ?last_successful_sync_provisioning_artifact_id:id ->
  unit ->
  last_sync

val make_code_star_parameters :
  connection_arn:code_star_connection_arn ->
  repository:repository ->
  branch:repository_branch ->
  artifact_path:repository_artifact_path ->
  unit ->
  code_star_parameters

val make_source_connection_parameters :
  ?code_star:code_star_parameters -> unit -> source_connection_parameters

val make_source_connection_detail :
  ?type_:source_type ->
  ?connection_parameters:source_connection_parameters ->
  ?last_sync:last_sync ->
  unit ->
  source_connection_detail

val make_product_view_summary :
  ?id:id ->
  ?product_id:id ->
  ?name:product_view_name ->
  ?owner:product_view_owner ->
  ?short_description:product_view_short_description ->
  ?type_:product_type ->
  ?distributor:product_view_distributor ->
  ?has_default_path:has_default_path ->
  ?support_email:support_email ->
  ?support_description:support_description ->
  ?support_url:support_url ->
  unit ->
  product_view_summary

val make_product_view_detail :
  ?product_view_summary:product_view_summary ->
  ?status:status ->
  ?product_ar_n:resource_ar_n ->
  ?created_time:created_time ->
  ?source_connection:source_connection_detail ->
  unit ->
  product_view_detail

val make_update_product_output :
  ?product_view_detail:product_view_detail -> ?tags:tags -> unit -> update_product_output

val make_source_connection :
  ?type_:source_type ->
  connection_parameters:source_connection_parameters ->
  unit ->
  source_connection

val make_update_product_input :
  ?accept_language:accept_language ->
  ?name:product_view_name ->
  ?owner:product_view_owner ->
  ?description:product_view_short_description ->
  ?distributor:product_view_owner ->
  ?support_description:support_description ->
  ?support_email:support_email ->
  ?support_url:support_url ->
  ?add_tags:add_tags ->
  ?remove_tags:tag_keys ->
  ?source_connection:source_connection ->
  id:id ->
  unit ->
  update_product_input

val make_update_portfolio_share_output :
  ?portfolio_share_token:id -> ?status:share_status -> unit -> update_portfolio_share_output

val make_organization_node :
  ?type_:organization_node_type -> ?value:organization_node_value -> unit -> organization_node

val make_update_portfolio_share_input :
  ?accept_language:accept_language ->
  ?account_id:account_id ->
  ?organization_node:organization_node ->
  ?share_tag_options:nullable_boolean ->
  ?share_principals:nullable_boolean ->
  portfolio_id:id ->
  unit ->
  update_portfolio_share_input

val make_portfolio_detail :
  ?id:id ->
  ?ar_n:resource_ar_n ->
  ?display_name:portfolio_display_name ->
  ?description:portfolio_description ->
  ?created_time:creation_time ->
  ?provider_name:provider_name ->
  unit ->
  portfolio_detail

val make_update_portfolio_output :
  ?portfolio_detail:portfolio_detail -> ?tags:tags -> unit -> update_portfolio_output

val make_update_portfolio_input :
  ?accept_language:accept_language ->
  ?display_name:portfolio_display_name ->
  ?description:portfolio_description ->
  ?provider_name:provider_name ->
  ?add_tags:add_tags ->
  ?remove_tags:tag_keys ->
  id:id ->
  unit ->
  update_portfolio_input

val make_constraint_detail :
  ?constraint_id:id ->
  ?type_:constraint_type ->
  ?description:constraint_description ->
  ?owner:account_id ->
  ?product_id:id ->
  ?portfolio_id:id ->
  unit ->
  constraint_detail

val make_update_constraint_output :
  ?constraint_detail:constraint_detail ->
  ?constraint_parameters:constraint_parameters ->
  ?status:status ->
  unit ->
  update_constraint_output

val make_update_constraint_input :
  ?accept_language:accept_language ->
  ?description:constraint_description ->
  ?parameters:constraint_parameters ->
  id:id ->
  unit ->
  update_constraint_input

val make_terminate_provisioned_product_output :
  ?record_detail:record_detail -> unit -> terminate_provisioned_product_output

val make_terminate_provisioned_product_input :
  ?provisioned_product_name:provisioned_product_name_or_arn ->
  ?provisioned_product_id:id ->
  ?ignore_errors:ignore_errors ->
  ?accept_language:accept_language ->
  ?retain_physical_resources:retain_physical_resources ->
  terminate_token:idempotency_token ->
  unit ->
  terminate_provisioned_product_input

val make_provisioned_product_attribute :
  ?name:provisioned_product_name_or_arn ->
  ?arn:provisioned_product_name_or_arn ->
  ?type_:provisioned_product_type ->
  ?id:id ->
  ?status:provisioned_product_status ->
  ?status_message:provisioned_product_status_message ->
  ?created_time:created_time ->
  ?idempotency_token:idempotency_token ->
  ?last_record_id:id ->
  ?last_provisioning_record_id:id ->
  ?last_successful_provisioning_record_id:id ->
  ?tags:tags ->
  ?physical_id:physical_id ->
  ?product_id:id ->
  ?product_name:product_view_name ->
  ?provisioning_artifact_id:id ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?user_arn:user_arn ->
  ?user_arn_session:user_arn_session ->
  unit ->
  provisioned_product_attribute

val make_search_provisioned_products_output :
  ?provisioned_products:provisioned_product_attributes ->
  ?total_results_count:total_results_count ->
  ?next_page_token:page_token ->
  unit ->
  search_provisioned_products_output

val make_access_level_filter :
  ?key:access_level_filter_key -> ?value:access_level_filter_value -> unit -> access_level_filter

val make_search_provisioned_products_input :
  ?accept_language:accept_language ->
  ?access_level_filter:access_level_filter ->
  ?filters:provisioned_product_filters ->
  ?sort_by:sort_field ->
  ?sort_order:sort_order ->
  ?page_size:search_provisioned_products_page_size ->
  ?page_token:page_token ->
  unit ->
  search_provisioned_products_input

val make_search_products_as_admin_output :
  ?product_view_details:product_view_details ->
  ?next_page_token:page_token ->
  unit ->
  search_products_as_admin_output

val make_search_products_as_admin_input :
  ?accept_language:accept_language ->
  ?portfolio_id:id ->
  ?filters:product_view_filters ->
  ?sort_by:product_view_sort_by ->
  ?sort_order:sort_order ->
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?product_source:product_source ->
  unit ->
  search_products_as_admin_input

val make_product_view_aggregation_value :
  ?value:attribute_value ->
  ?approximate_count:approximate_count ->
  unit ->
  product_view_aggregation_value

val make_search_products_output :
  ?product_view_summaries:product_view_summaries ->
  ?product_view_aggregations:product_view_aggregations ->
  ?next_page_token:page_token ->
  unit ->
  search_products_output

val make_search_products_input :
  ?accept_language:accept_language ->
  ?filters:product_view_filters ->
  ?page_size:page_size_max100 ->
  ?sort_by:product_view_sort_by ->
  ?sort_order:sort_order ->
  ?page_token:page_token ->
  unit ->
  search_products_input

val make_provisioned_product_detail :
  ?name:provisioned_product_name_or_arn ->
  ?arn:provisioned_product_name_or_arn ->
  ?type_:provisioned_product_type ->
  ?id:provisioned_product_id ->
  ?status:provisioned_product_status ->
  ?status_message:provisioned_product_status_message ->
  ?created_time:created_time ->
  ?idempotency_token:idempotency_token ->
  ?last_record_id:last_request_id ->
  ?last_provisioning_record_id:id ->
  ?last_successful_provisioning_record_id:id ->
  ?product_id:id ->
  ?provisioning_artifact_id:id ->
  ?launch_role_arn:role_arn ->
  unit ->
  provisioned_product_detail

val make_scan_provisioned_products_output :
  ?provisioned_products:provisioned_product_details ->
  ?next_page_token:page_token ->
  unit ->
  scan_provisioned_products_output

val make_scan_provisioned_products_input :
  ?accept_language:accept_language ->
  ?access_level_filter:access_level_filter ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  unit ->
  scan_provisioned_products_input

val make_reject_portfolio_share_output : unit -> unit

val make_reject_portfolio_share_input :
  ?accept_language:accept_language ->
  ?portfolio_share_type:portfolio_share_type ->
  portfolio_id:id ->
  unit ->
  reject_portfolio_share_input

val make_provision_product_output : ?record_detail:record_detail -> unit -> provision_product_output

val make_provisioning_preferences :
  ?stack_set_accounts:stack_set_accounts ->
  ?stack_set_regions:stack_set_regions ->
  ?stack_set_failure_tolerance_count:stack_set_failure_tolerance_count ->
  ?stack_set_failure_tolerance_percentage:stack_set_failure_tolerance_percentage ->
  ?stack_set_max_concurrency_count:stack_set_max_concurrency_count ->
  ?stack_set_max_concurrency_percentage:stack_set_max_concurrency_percentage ->
  unit ->
  provisioning_preferences

val make_provisioning_parameter :
  ?key:parameter_key -> ?value:parameter_value -> unit -> provisioning_parameter

val make_provision_product_input :
  ?accept_language:accept_language ->
  ?product_id:id ->
  ?product_name:product_view_name ->
  ?provisioning_artifact_id:id ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?path_id:id ->
  ?path_name:portfolio_display_name ->
  ?provisioning_parameters:provisioning_parameters ->
  ?provisioning_preferences:provisioning_preferences ->
  ?tags:tags ->
  ?notification_arns:notification_arns ->
  provisioned_product_name:provisioned_product_name ->
  provision_token:idempotency_token ->
  unit ->
  provision_product_input

val make_notify_update_provisioned_product_engine_workflow_result_output : unit -> unit

val make_record_output :
  ?output_key:output_key ->
  ?output_value:output_value ->
  ?description:description ->
  unit ->
  record_output

val make_notify_update_provisioned_product_engine_workflow_result_input :
  ?failure_reason:engine_workflow_failure_reason ->
  ?outputs:record_outputs ->
  workflow_token:engine_workflow_token ->
  record_id:id ->
  status:engine_workflow_status ->
  idempotency_token:idempotency_token ->
  unit ->
  notify_update_provisioned_product_engine_workflow_result_input

val make_notify_terminate_provisioned_product_engine_workflow_result_output : unit -> unit

val make_notify_terminate_provisioned_product_engine_workflow_result_input :
  ?failure_reason:engine_workflow_failure_reason ->
  workflow_token:engine_workflow_token ->
  record_id:id ->
  status:engine_workflow_status ->
  idempotency_token:idempotency_token ->
  unit ->
  notify_terminate_provisioned_product_engine_workflow_result_input

val make_notify_provision_product_engine_workflow_result_output : unit -> unit

val make_unique_tag_resource_identifier :
  ?key:unique_tag_key -> ?value:unique_tag_value -> unit -> unique_tag_resource_identifier

val make_engine_workflow_resource_identifier :
  ?unique_tag:unique_tag_resource_identifier -> unit -> engine_workflow_resource_identifier

val make_notify_provision_product_engine_workflow_result_input :
  ?failure_reason:engine_workflow_failure_reason ->
  ?resource_identifier:engine_workflow_resource_identifier ->
  ?outputs:record_outputs ->
  workflow_token:engine_workflow_token ->
  record_id:id ->
  status:engine_workflow_status ->
  idempotency_token:idempotency_token ->
  unit ->
  notify_provision_product_engine_workflow_result_input

val make_list_tag_options_output :
  ?tag_option_details:tag_option_details ->
  ?page_token:page_token ->
  unit ->
  list_tag_options_output

val make_list_tag_options_filters :
  ?key:tag_option_key ->
  ?value:tag_option_value ->
  ?active:tag_option_active ->
  unit ->
  list_tag_options_filters

val make_list_tag_options_input :
  ?filters:list_tag_options_filters ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  unit ->
  list_tag_options_input

val make_stack_instance :
  ?account:account_id ->
  ?region:region ->
  ?stack_instance_status:stack_instance_status ->
  unit ->
  stack_instance

val make_list_stack_instances_for_provisioned_product_output :
  ?stack_instances:stack_instances ->
  ?next_page_token:page_token ->
  unit ->
  list_stack_instances_for_provisioned_product_output

val make_list_stack_instances_for_provisioned_product_input :
  ?accept_language:accept_language ->
  ?page_token:page_token ->
  ?page_size:page_size ->
  provisioned_product_id:id ->
  unit ->
  list_stack_instances_for_provisioned_product_input

val make_list_service_actions_for_provisioning_artifact_output :
  ?service_action_summaries:service_action_summaries ->
  ?next_page_token:page_token ->
  unit ->
  list_service_actions_for_provisioning_artifact_output

val make_list_service_actions_for_provisioning_artifact_input :
  ?page_size:page_size ->
  ?page_token:page_token ->
  ?accept_language:accept_language ->
  product_id:id ->
  provisioning_artifact_id:id ->
  unit ->
  list_service_actions_for_provisioning_artifact_input

val make_list_service_actions_output :
  ?service_action_summaries:service_action_summaries ->
  ?next_page_token:page_token ->
  unit ->
  list_service_actions_output

val make_list_service_actions_input :
  ?accept_language:accept_language ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  unit ->
  list_service_actions_input

val make_resource_detail :
  ?id:resource_detail_id ->
  ?ar_n:resource_detail_ar_n ->
  ?name:resource_detail_name ->
  ?description:resource_detail_description ->
  ?created_time:resource_detail_created_time ->
  unit ->
  resource_detail

val make_list_resources_for_tag_option_output :
  ?resource_details:resource_details ->
  ?page_token:page_token ->
  unit ->
  list_resources_for_tag_option_output

val make_list_resources_for_tag_option_input :
  ?resource_type:resource_type ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  tag_option_id:tag_option_id ->
  unit ->
  list_resources_for_tag_option_input

val make_list_record_history_output :
  ?record_details:record_details ->
  ?next_page_token:page_token ->
  unit ->
  list_record_history_output

val make_list_record_history_search_filter :
  ?key:search_filter_key -> ?value:search_filter_value -> unit -> list_record_history_search_filter

val make_list_record_history_input :
  ?accept_language:accept_language ->
  ?access_level_filter:access_level_filter ->
  ?search_filter:list_record_history_search_filter ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  unit ->
  list_record_history_input

val make_provisioning_artifact :
  ?id:id ->
  ?name:provisioning_artifact_name ->
  ?description:provisioning_artifact_description ->
  ?created_time:provisioning_artifact_created_time ->
  ?guidance:provisioning_artifact_guidance ->
  unit ->
  provisioning_artifact

val make_provisioning_artifact_view :
  ?product_view_summary:product_view_summary ->
  ?provisioning_artifact:provisioning_artifact ->
  unit ->
  provisioning_artifact_view

val make_list_provisioning_artifacts_for_service_action_output :
  ?provisioning_artifact_views:provisioning_artifact_views ->
  ?next_page_token:page_token ->
  unit ->
  list_provisioning_artifacts_for_service_action_output

val make_list_provisioning_artifacts_for_service_action_input :
  ?page_size:page_size ->
  ?page_token:page_token ->
  ?accept_language:accept_language ->
  service_action_id:id ->
  unit ->
  list_provisioning_artifacts_for_service_action_input

val make_list_provisioning_artifacts_output :
  ?provisioning_artifact_details:provisioning_artifact_details ->
  ?next_page_token:page_token ->
  unit ->
  list_provisioning_artifacts_output

val make_list_provisioning_artifacts_input :
  ?accept_language:accept_language -> product_id:id -> unit -> list_provisioning_artifacts_input

val make_provisioned_product_plan_summary :
  ?plan_name:provisioned_product_plan_name ->
  ?plan_id:id ->
  ?provision_product_id:id ->
  ?provision_product_name:provisioned_product_name ->
  ?plan_type:provisioned_product_plan_type ->
  ?provisioning_artifact_id:id ->
  unit ->
  provisioned_product_plan_summary

val make_list_provisioned_product_plans_output :
  ?provisioned_product_plans:provisioned_product_plans ->
  ?next_page_token:page_token ->
  unit ->
  list_provisioned_product_plans_output

val make_list_provisioned_product_plans_input :
  ?accept_language:accept_language ->
  ?provision_product_id:id ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  ?access_level_filter:access_level_filter ->
  unit ->
  list_provisioned_product_plans_input

val make_principal :
  ?principal_ar_n:principal_ar_n -> ?principal_type:principal_type -> unit -> principal

val make_list_principals_for_portfolio_output :
  ?principals:principals ->
  ?next_page_token:page_token ->
  unit ->
  list_principals_for_portfolio_output

val make_list_principals_for_portfolio_input :
  ?accept_language:accept_language ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  portfolio_id:id ->
  unit ->
  list_principals_for_portfolio_input

val make_list_portfolios_for_product_output :
  ?portfolio_details:portfolio_details ->
  ?next_page_token:page_token ->
  unit ->
  list_portfolios_for_product_output

val make_list_portfolios_for_product_input :
  ?accept_language:accept_language ->
  ?page_token:page_token ->
  ?page_size:page_size_max100 ->
  product_id:id ->
  unit ->
  list_portfolios_for_product_input

val make_list_portfolios_output :
  ?portfolio_details:portfolio_details ->
  ?next_page_token:page_token ->
  unit ->
  list_portfolios_output

val make_list_portfolios_input :
  ?accept_language:accept_language ->
  ?page_token:page_token ->
  ?page_size:page_size_max100 ->
  unit ->
  list_portfolios_input

val make_list_portfolio_access_output :
  ?account_ids:account_ids -> ?next_page_token:page_token -> unit -> list_portfolio_access_output

val make_list_portfolio_access_input :
  ?accept_language:accept_language ->
  ?organization_parent_id:id ->
  ?page_token:page_token ->
  ?page_size:page_size_max100 ->
  portfolio_id:id ->
  unit ->
  list_portfolio_access_input

val make_list_organization_portfolio_access_output :
  ?organization_nodes:organization_nodes ->
  ?next_page_token:page_token ->
  unit ->
  list_organization_portfolio_access_output

val make_list_organization_portfolio_access_input :
  ?accept_language:accept_language ->
  ?page_token:page_token ->
  ?page_size:page_size ->
  portfolio_id:id ->
  organization_node_type:organization_node_type ->
  unit ->
  list_organization_portfolio_access_input

val make_constraint_summary :
  ?type_:constraint_type -> ?description:constraint_description -> unit -> constraint_summary

val make_launch_path_summary :
  ?id:id ->
  ?constraint_summaries:constraint_summaries ->
  ?tags:tags ->
  ?name:portfolio_name ->
  unit ->
  launch_path_summary

val make_list_launch_paths_output :
  ?launch_path_summaries:launch_path_summaries ->
  ?next_page_token:page_token ->
  unit ->
  list_launch_paths_output

val make_list_launch_paths_input :
  ?accept_language:accept_language ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  product_id:id ->
  unit ->
  list_launch_paths_input

val make_list_constraints_for_portfolio_output :
  ?constraint_details:constraint_details ->
  ?next_page_token:page_token ->
  unit ->
  list_constraints_for_portfolio_output

val make_list_constraints_for_portfolio_input :
  ?accept_language:accept_language ->
  ?product_id:id ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  portfolio_id:id ->
  unit ->
  list_constraints_for_portfolio_input

val make_budget_detail : ?budget_name:budget_name -> unit -> budget_detail

val make_list_budgets_for_resource_output :
  ?budgets:budgets -> ?next_page_token:page_token -> unit -> list_budgets_for_resource_output

val make_list_budgets_for_resource_input :
  ?accept_language:accept_language ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  resource_id:id ->
  unit ->
  list_budgets_for_resource_input

val make_list_accepted_portfolio_shares_output :
  ?portfolio_details:portfolio_details ->
  ?next_page_token:page_token ->
  unit ->
  list_accepted_portfolio_shares_output

val make_list_accepted_portfolio_shares_input :
  ?accept_language:accept_language ->
  ?page_token:page_token ->
  ?page_size:page_size_max100 ->
  ?portfolio_share_type:portfolio_share_type ->
  unit ->
  list_accepted_portfolio_shares_input

val make_import_as_provisioned_product_output :
  ?record_detail:record_detail -> unit -> import_as_provisioned_product_output

val make_import_as_provisioned_product_input :
  ?accept_language:accept_language ->
  product_id:id ->
  provisioning_artifact_id:id ->
  provisioned_product_name:provisioned_product_name ->
  physical_id:physical_id ->
  idempotency_token:idempotency_token ->
  unit ->
  import_as_provisioned_product_input

val make_get_provisioned_product_outputs_output :
  ?outputs:record_outputs ->
  ?next_page_token:page_token ->
  unit ->
  get_provisioned_product_outputs_output

val make_get_provisioned_product_outputs_input :
  ?accept_language:accept_language ->
  ?provisioned_product_id:id ->
  ?provisioned_product_name:provisioned_product_name ->
  ?output_keys:output_keys ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  unit ->
  get_provisioned_product_outputs_input

val make_get_aws_organizations_access_status_output :
  ?access_status:access_status -> unit -> get_aws_organizations_access_status_output

val make_get_aws_organizations_access_status_input : unit -> unit

val make_execute_provisioned_product_service_action_output :
  ?record_detail:record_detail -> unit -> execute_provisioned_product_service_action_output

val make_execute_provisioned_product_service_action_input :
  ?accept_language:accept_language ->
  ?parameters:execution_parameter_map ->
  provisioned_product_id:id ->
  service_action_id:id ->
  execute_token:idempotency_token ->
  unit ->
  execute_provisioned_product_service_action_input

val make_execute_provisioned_product_plan_output :
  ?record_detail:record_detail -> unit -> execute_provisioned_product_plan_output

val make_execute_provisioned_product_plan_input :
  ?accept_language:accept_language ->
  plan_id:id ->
  idempotency_token:idempotency_token ->
  unit ->
  execute_provisioned_product_plan_input

val make_enable_aws_organizations_access_output : unit -> unit
val make_enable_aws_organizations_access_input : unit -> unit
val make_disassociate_tag_option_from_resource_output : unit -> unit

val make_disassociate_tag_option_from_resource_input :
  resource_id:resource_id ->
  tag_option_id:tag_option_id ->
  unit ->
  disassociate_tag_option_from_resource_input

val make_disassociate_service_action_from_provisioning_artifact_output : unit -> unit

val make_disassociate_service_action_from_provisioning_artifact_input :
  ?accept_language:accept_language ->
  ?idempotency_token:idempotency_token ->
  product_id:id ->
  provisioning_artifact_id:id ->
  service_action_id:id ->
  unit ->
  disassociate_service_action_from_provisioning_artifact_input

val make_disassociate_product_from_portfolio_output : unit -> unit

val make_disassociate_product_from_portfolio_input :
  ?accept_language:accept_language ->
  product_id:id ->
  portfolio_id:id ->
  unit ->
  disassociate_product_from_portfolio_input

val make_disassociate_principal_from_portfolio_output : unit -> unit

val make_disassociate_principal_from_portfolio_input :
  ?accept_language:accept_language ->
  ?principal_type:principal_type ->
  portfolio_id:id ->
  principal_ar_n:principal_ar_n ->
  unit ->
  disassociate_principal_from_portfolio_input

val make_disassociate_budget_from_resource_output : unit -> unit

val make_disassociate_budget_from_resource_input :
  budget_name:budget_name -> resource_id:id -> unit -> disassociate_budget_from_resource_input

val make_disable_aws_organizations_access_output : unit -> unit
val make_disable_aws_organizations_access_input : unit -> unit

val make_describe_tag_option_output :
  ?tag_option_detail:tag_option_detail -> unit -> describe_tag_option_output

val make_describe_tag_option_input : id:tag_option_id -> unit -> describe_tag_option_input

val make_execution_parameter :
  ?name:execution_parameter_key ->
  ?type_:execution_parameter_type ->
  ?default_values:execution_parameter_value_list ->
  unit ->
  execution_parameter

val make_describe_service_action_execution_parameters_output :
  ?service_action_parameters:execution_parameters ->
  unit ->
  describe_service_action_execution_parameters_output

val make_describe_service_action_execution_parameters_input :
  ?accept_language:accept_language ->
  provisioned_product_id:id ->
  service_action_id:id ->
  unit ->
  describe_service_action_execution_parameters_input

val make_describe_service_action_output :
  ?service_action_detail:service_action_detail -> unit -> describe_service_action_output

val make_describe_service_action_input :
  ?accept_language:accept_language -> id:id -> unit -> describe_service_action_input

val make_describe_record_output :
  ?record_detail:record_detail ->
  ?record_outputs:record_outputs ->
  ?next_page_token:page_token ->
  unit ->
  describe_record_output

val make_describe_record_input :
  ?accept_language:accept_language ->
  ?page_token:page_token ->
  ?page_size:page_size ->
  id:id ->
  unit ->
  describe_record_input

val make_provisioning_artifact_output :
  ?key:provisioning_artifact_output_key ->
  ?description:output_description ->
  unit ->
  provisioning_artifact_output

val make_provisioning_artifact_preferences :
  ?stack_set_accounts:stack_set_accounts ->
  ?stack_set_regions:stack_set_regions ->
  unit ->
  provisioning_artifact_preferences

val make_tag_option_summary :
  ?key:tag_option_key -> ?values:tag_option_values -> unit -> tag_option_summary

val make_usage_instruction :
  ?type_:instruction_type -> ?value:instruction_value -> unit -> usage_instruction

val make_parameter_constraints :
  ?allowed_values:allowed_values ->
  ?allowed_pattern:string_ ->
  ?constraint_description:string_ ->
  ?max_length:string_ ->
  ?min_length:string_ ->
  ?max_value:string_ ->
  ?min_value:string_ ->
  unit ->
  parameter_constraints

val make_provisioning_artifact_parameter :
  ?parameter_key:parameter_key ->
  ?default_value:default_value ->
  ?parameter_type:parameter_type ->
  ?is_no_echo:no_echo ->
  ?description:description ->
  ?parameter_constraints:parameter_constraints ->
  unit ->
  provisioning_artifact_parameter

val make_describe_provisioning_parameters_output :
  ?provisioning_artifact_parameters:provisioning_artifact_parameters ->
  ?constraint_summaries:constraint_summaries ->
  ?usage_instructions:usage_instructions ->
  ?tag_options:tag_option_summaries ->
  ?provisioning_artifact_preferences:provisioning_artifact_preferences ->
  ?provisioning_artifact_outputs:provisioning_artifact_outputs ->
  ?provisioning_artifact_output_keys:provisioning_artifact_outputs ->
  unit ->
  describe_provisioning_parameters_output

val make_describe_provisioning_parameters_input :
  ?accept_language:accept_language ->
  ?product_id:id ->
  ?product_name:product_view_name ->
  ?provisioning_artifact_id:id ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?path_id:id ->
  ?path_name:portfolio_display_name ->
  unit ->
  describe_provisioning_parameters_input

val make_describe_provisioning_artifact_output :
  ?provisioning_artifact_detail:provisioning_artifact_detail ->
  ?info:provisioning_artifact_info ->
  ?status:status ->
  ?provisioning_artifact_parameters:provisioning_artifact_parameters ->
  unit ->
  describe_provisioning_artifact_output

val make_describe_provisioning_artifact_input :
  ?accept_language:accept_language ->
  ?provisioning_artifact_id:id ->
  ?product_id:id ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?product_name:product_view_name ->
  ?verbose:verbose ->
  ?include_provisioning_artifact_parameters:boolean_ ->
  unit ->
  describe_provisioning_artifact_input

val make_resource_target_definition :
  ?attribute:resource_attribute ->
  ?name:property_name ->
  ?requires_recreation:requires_recreation ->
  unit ->
  resource_target_definition

val make_resource_change_detail :
  ?target:resource_target_definition ->
  ?evaluation:evaluation_type ->
  ?causing_entity:causing_entity ->
  unit ->
  resource_change_detail

val make_resource_change :
  ?action:change_action ->
  ?logical_resource_id:logical_resource_id ->
  ?physical_resource_id:physical_resource_id ->
  ?resource_type:plan_resource_type ->
  ?replacement:replacement ->
  ?scope:scope ->
  ?details:resource_change_details ->
  unit ->
  resource_change

val make_provisioned_product_plan_details :
  ?created_time:created_time ->
  ?path_id:id ->
  ?product_id:id ->
  ?plan_name:provisioned_product_plan_name ->
  ?plan_id:id ->
  ?provision_product_id:id ->
  ?provision_product_name:provisioned_product_name ->
  ?plan_type:provisioned_product_plan_type ->
  ?provisioning_artifact_id:id ->
  ?status:provisioned_product_plan_status ->
  ?updated_time:updated_time ->
  ?notification_arns:notification_arns ->
  ?provisioning_parameters:update_provisioning_parameters ->
  ?tags:tags ->
  ?status_message:status_message ->
  unit ->
  provisioned_product_plan_details

val make_describe_provisioned_product_plan_output :
  ?provisioned_product_plan_details:provisioned_product_plan_details ->
  ?resource_changes:resource_changes ->
  ?next_page_token:page_token ->
  unit ->
  describe_provisioned_product_plan_output

val make_describe_provisioned_product_plan_input :
  ?accept_language:accept_language ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  plan_id:id ->
  unit ->
  describe_provisioned_product_plan_input

val make_cloud_watch_dashboard : ?name:cloud_watch_dashboard_name -> unit -> cloud_watch_dashboard

val make_describe_provisioned_product_output :
  ?provisioned_product_detail:provisioned_product_detail ->
  ?cloud_watch_dashboards:cloud_watch_dashboards ->
  unit ->
  describe_provisioned_product_output

val make_describe_provisioned_product_input :
  ?accept_language:accept_language ->
  ?id:id ->
  ?name:provisioned_product_name ->
  unit ->
  describe_provisioned_product_input

val make_describe_product_view_output :
  ?product_view_summary:product_view_summary ->
  ?provisioning_artifacts:provisioning_artifacts ->
  unit ->
  describe_product_view_output

val make_describe_product_view_input :
  ?accept_language:accept_language -> id:id -> unit -> describe_product_view_input

val make_provisioning_artifact_summary :
  ?id:id ->
  ?name:provisioning_artifact_name ->
  ?description:provisioning_artifact_description ->
  ?created_time:provisioning_artifact_created_time ->
  ?provisioning_artifact_metadata:provisioning_artifact_info ->
  unit ->
  provisioning_artifact_summary

val make_describe_product_as_admin_output :
  ?product_view_detail:product_view_detail ->
  ?provisioning_artifact_summaries:provisioning_artifact_summaries ->
  ?tags:tags ->
  ?tag_options:tag_option_details ->
  ?budgets:budgets ->
  unit ->
  describe_product_as_admin_output

val make_describe_product_as_admin_input :
  ?accept_language:accept_language ->
  ?id:id ->
  ?name:product_view_name ->
  ?source_portfolio_id:id ->
  unit ->
  describe_product_as_admin_input

val make_launch_path : ?id:id -> ?name:portfolio_name -> unit -> launch_path

val make_describe_product_output :
  ?product_view_summary:product_view_summary ->
  ?provisioning_artifacts:provisioning_artifacts ->
  ?budgets:budgets ->
  ?launch_paths:launch_paths ->
  unit ->
  describe_product_output

val make_describe_product_input :
  ?accept_language:accept_language ->
  ?id:id ->
  ?name:product_view_name ->
  unit ->
  describe_product_input

val make_share_error :
  ?accounts:namespaces -> ?message:message -> ?error:error -> unit -> share_error

val make_share_details :
  ?successful_shares:successful_shares -> ?share_errors:share_errors -> unit -> share_details

val make_describe_portfolio_share_status_output :
  ?portfolio_share_token:id ->
  ?portfolio_id:id ->
  ?organization_node_value:organization_node_value ->
  ?status:share_status ->
  ?share_details:share_details ->
  unit ->
  describe_portfolio_share_status_output

val make_describe_portfolio_share_status_input :
  portfolio_share_token:id -> unit -> describe_portfolio_share_status_input

val make_portfolio_share_detail :
  ?principal_id:id ->
  ?type_:describe_portfolio_share_type ->
  ?accepted:boolean_ ->
  ?share_tag_options:boolean_ ->
  ?share_principals:boolean_ ->
  unit ->
  portfolio_share_detail

val make_describe_portfolio_shares_output :
  ?next_page_token:page_token ->
  ?portfolio_share_details:portfolio_share_details ->
  unit ->
  describe_portfolio_shares_output

val make_describe_portfolio_shares_input :
  ?page_token:page_token ->
  ?page_size:page_size_max100 ->
  portfolio_id:id ->
  type_:describe_portfolio_share_type ->
  unit ->
  describe_portfolio_shares_input

val make_describe_portfolio_output :
  ?portfolio_detail:portfolio_detail ->
  ?tags:tags ->
  ?tag_options:tag_option_details ->
  ?budgets:budgets ->
  unit ->
  describe_portfolio_output

val make_describe_portfolio_input :
  ?accept_language:accept_language -> id:id -> unit -> describe_portfolio_input

val make_describe_copy_product_status_output :
  ?copy_product_status:copy_product_status ->
  ?target_product_id:id ->
  ?status_detail:status_detail ->
  unit ->
  describe_copy_product_status_output

val make_describe_copy_product_status_input :
  ?accept_language:accept_language ->
  copy_product_token:id ->
  unit ->
  describe_copy_product_status_input

val make_describe_constraint_output :
  ?constraint_detail:constraint_detail ->
  ?constraint_parameters:constraint_parameters ->
  ?status:status ->
  unit ->
  describe_constraint_output

val make_describe_constraint_input :
  ?accept_language:accept_language -> id:id -> unit -> describe_constraint_input

val make_delete_tag_option_output : unit -> unit
val make_delete_tag_option_input : id:tag_option_id -> unit -> delete_tag_option_input
val make_delete_service_action_output : unit -> unit

val make_delete_service_action_input :
  ?accept_language:accept_language ->
  ?idempotency_token:idempotency_token ->
  id:id ->
  unit ->
  delete_service_action_input

val make_delete_provisioning_artifact_output : unit -> unit

val make_delete_provisioning_artifact_input :
  ?accept_language:accept_language ->
  product_id:id ->
  provisioning_artifact_id:id ->
  unit ->
  delete_provisioning_artifact_input

val make_delete_provisioned_product_plan_output : unit -> unit

val make_delete_provisioned_product_plan_input :
  ?accept_language:accept_language ->
  ?ignore_errors:ignore_errors ->
  plan_id:id ->
  unit ->
  delete_provisioned_product_plan_input

val make_delete_product_output : unit -> unit

val make_delete_product_input :
  ?accept_language:accept_language -> id:id -> unit -> delete_product_input

val make_delete_portfolio_share_output :
  ?portfolio_share_token:id -> unit -> delete_portfolio_share_output

val make_delete_portfolio_share_input :
  ?accept_language:accept_language ->
  ?account_id:account_id ->
  ?organization_node:organization_node ->
  portfolio_id:id ->
  unit ->
  delete_portfolio_share_input

val make_delete_portfolio_output : unit -> unit

val make_delete_portfolio_input :
  ?accept_language:accept_language -> id:id -> unit -> delete_portfolio_input

val make_delete_constraint_output : unit -> unit

val make_delete_constraint_input :
  ?accept_language:accept_language -> id:id -> unit -> delete_constraint_input

val make_create_tag_option_output :
  ?tag_option_detail:tag_option_detail -> unit -> create_tag_option_output

val make_create_tag_option_input :
  key:tag_option_key -> value:tag_option_value -> unit -> create_tag_option_input

val make_create_service_action_output :
  ?service_action_detail:service_action_detail -> unit -> create_service_action_output

val make_create_service_action_input :
  ?description:service_action_description ->
  ?accept_language:accept_language ->
  name:service_action_name ->
  definition_type:service_action_definition_type ->
  definition:service_action_definition_map ->
  idempotency_token:idempotency_token ->
  unit ->
  create_service_action_input

val make_create_provisioning_artifact_output :
  ?provisioning_artifact_detail:provisioning_artifact_detail ->
  ?info:provisioning_artifact_info ->
  ?status:status ->
  unit ->
  create_provisioning_artifact_output

val make_provisioning_artifact_properties :
  ?name:provisioning_artifact_name ->
  ?description:provisioning_artifact_description ->
  ?info:provisioning_artifact_info ->
  ?type_:provisioning_artifact_type ->
  ?disable_template_validation:disable_template_validation ->
  unit ->
  provisioning_artifact_properties

val make_create_provisioning_artifact_input :
  ?accept_language:accept_language ->
  product_id:id ->
  parameters:provisioning_artifact_properties ->
  idempotency_token:idempotency_token ->
  unit ->
  create_provisioning_artifact_input

val make_create_provisioned_product_plan_output :
  ?plan_name:provisioned_product_plan_name ->
  ?plan_id:id ->
  ?provision_product_id:id ->
  ?provisioned_product_name:provisioned_product_name ->
  ?provisioning_artifact_id:id ->
  unit ->
  create_provisioned_product_plan_output

val make_create_provisioned_product_plan_input :
  ?accept_language:accept_language ->
  ?notification_arns:notification_arns ->
  ?path_id:id ->
  ?provisioning_parameters:update_provisioning_parameters ->
  ?tags:tags ->
  plan_name:provisioned_product_plan_name ->
  plan_type:provisioned_product_plan_type ->
  product_id:id ->
  provisioned_product_name:provisioned_product_name ->
  provisioning_artifact_id:id ->
  idempotency_token:idempotency_token ->
  unit ->
  create_provisioned_product_plan_input

val make_create_product_output :
  ?product_view_detail:product_view_detail ->
  ?provisioning_artifact_detail:provisioning_artifact_detail ->
  ?tags:tags ->
  unit ->
  create_product_output

val make_create_product_input :
  ?accept_language:accept_language ->
  ?description:product_view_short_description ->
  ?distributor:product_view_owner ->
  ?support_description:support_description ->
  ?support_email:support_email ->
  ?support_url:support_url ->
  ?tags:add_tags ->
  ?provisioning_artifact_parameters:provisioning_artifact_properties ->
  ?source_connection:source_connection ->
  name:product_view_name ->
  owner:product_view_owner ->
  product_type:product_type ->
  idempotency_token:idempotency_token ->
  unit ->
  create_product_input

val make_create_portfolio_share_output :
  ?portfolio_share_token:id -> unit -> create_portfolio_share_output

val make_create_portfolio_share_input :
  ?accept_language:accept_language ->
  ?account_id:account_id ->
  ?organization_node:organization_node ->
  ?share_tag_options:boolean_ ->
  ?share_principals:boolean_ ->
  portfolio_id:id ->
  unit ->
  create_portfolio_share_input

val make_create_portfolio_output :
  ?portfolio_detail:portfolio_detail -> ?tags:tags -> unit -> create_portfolio_output

val make_create_portfolio_input :
  ?accept_language:accept_language ->
  ?description:portfolio_description ->
  ?tags:add_tags ->
  display_name:portfolio_display_name ->
  provider_name:provider_name ->
  idempotency_token:idempotency_token ->
  unit ->
  create_portfolio_input

val make_create_constraint_output :
  ?constraint_detail:constraint_detail ->
  ?constraint_parameters:constraint_parameters ->
  ?status:status ->
  unit ->
  create_constraint_output

val make_create_constraint_input :
  ?accept_language:accept_language ->
  ?description:constraint_description ->
  portfolio_id:id ->
  product_id:id ->
  parameters:constraint_parameters ->
  type_:constraint_type ->
  idempotency_token:idempotency_token ->
  unit ->
  create_constraint_input

val make_copy_product_output : ?copy_product_token:id -> unit -> copy_product_output

val make_copy_product_input :
  ?accept_language:accept_language ->
  ?target_product_id:id ->
  ?target_product_name:product_view_name ->
  ?source_provisioning_artifact_identifiers:source_provisioning_artifact_properties ->
  ?copy_options:copy_options ->
  source_product_arn:product_arn ->
  idempotency_token:idempotency_token ->
  unit ->
  copy_product_input

val make_failed_service_action_association :
  ?service_action_id:id ->
  ?product_id:id ->
  ?provisioning_artifact_id:id ->
  ?error_code:service_action_association_error_code ->
  ?error_message:service_action_association_error_message ->
  unit ->
  failed_service_action_association

val make_batch_disassociate_service_action_from_provisioning_artifact_output :
  ?failed_service_action_associations:failed_service_action_associations ->
  unit ->
  batch_disassociate_service_action_from_provisioning_artifact_output

val make_service_action_association :
  service_action_id:id ->
  product_id:id ->
  provisioning_artifact_id:id ->
  unit ->
  service_action_association

val make_batch_disassociate_service_action_from_provisioning_artifact_input :
  ?accept_language:accept_language ->
  service_action_associations:service_action_associations ->
  unit ->
  batch_disassociate_service_action_from_provisioning_artifact_input

val make_batch_associate_service_action_with_provisioning_artifact_output :
  ?failed_service_action_associations:failed_service_action_associations ->
  unit ->
  batch_associate_service_action_with_provisioning_artifact_output

val make_batch_associate_service_action_with_provisioning_artifact_input :
  ?accept_language:accept_language ->
  service_action_associations:service_action_associations ->
  unit ->
  batch_associate_service_action_with_provisioning_artifact_input

val make_associate_tag_option_with_resource_output : unit -> unit

val make_associate_tag_option_with_resource_input :
  resource_id:resource_id ->
  tag_option_id:tag_option_id ->
  unit ->
  associate_tag_option_with_resource_input

val make_associate_service_action_with_provisioning_artifact_output : unit -> unit

val make_associate_service_action_with_provisioning_artifact_input :
  ?accept_language:accept_language ->
  ?idempotency_token:idempotency_token ->
  product_id:id ->
  provisioning_artifact_id:id ->
  service_action_id:id ->
  unit ->
  associate_service_action_with_provisioning_artifact_input

val make_associate_product_with_portfolio_output : unit -> unit

val make_associate_product_with_portfolio_input :
  ?accept_language:accept_language ->
  ?source_portfolio_id:id ->
  product_id:id ->
  portfolio_id:id ->
  unit ->
  associate_product_with_portfolio_input

val make_associate_principal_with_portfolio_output : unit -> unit

val make_associate_principal_with_portfolio_input :
  ?accept_language:accept_language ->
  portfolio_id:id ->
  principal_ar_n:principal_ar_n ->
  principal_type:principal_type ->
  unit ->
  associate_principal_with_portfolio_input

val make_associate_budget_with_resource_output : unit -> unit

val make_associate_budget_with_resource_input :
  budget_name:budget_name -> resource_id:id -> unit -> associate_budget_with_resource_input

val make_accept_portfolio_share_output : unit -> unit

val make_accept_portfolio_share_input :
  ?accept_language:accept_language ->
  ?portfolio_share_type:portfolio_share_type ->
  portfolio_id:id ->
  unit ->
  accept_portfolio_share_input
