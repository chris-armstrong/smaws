(** Service Catalog client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AcceptPortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_portfolio_share_input ->
    ( accept_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_portfolio_share_input ->
    ( accept_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Accepts an offer to share the specified portfolio.\n"]

module AssociateBudgetWithResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_budget_with_resource_input ->
    ( associate_budget_with_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_budget_with_resource_input ->
    ( associate_budget_with_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the specified budget with the specified resource.\n"]

module AssociatePrincipalWithPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_principal_with_portfolio_input ->
    ( associate_principal_with_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_principal_with_portfolio_input ->
    ( associate_principal_with_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified principal ARN with the specified portfolio.\n\n\
  \ If you share the portfolio with principal name sharing enabled, the [PrincipalARN] association \
   is included in the share. \n\
  \ \n\
  \  The [PortfolioID], [PrincipalARN], and [PrincipalType] parameters are required. \n\
  \  \n\
  \   You can associate a maximum of 10 Principals with a portfolio using [PrincipalType] as \
   [IAM_PATTERN]. \n\
  \   \n\
  \     When you associate a principal with portfolio, a potential privilege escalation path may \
   occur when that portfolio is then shared with other accounts. For a user in a recipient account \
   who is {i not} an Service Catalog Admin, but still has the ability to create Principals \
   (Users/Groups/Roles), that user could create a role that matches a principal name association \
   for the portfolio. Although this user may not know which principal names are associated through \
   Service Catalog, they may be able to guess the user. If this potential escalation path is a \
   concern, then Service Catalog recommends using [PrincipalType] as [IAM]. With this \
   configuration, the [PrincipalARN] must already exist in the recipient account before it can be \
   associated. \n\
  \     \n\
  \      "]

module AssociateProductWithPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_product_with_portfolio_input ->
    ( associate_product_with_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_product_with_portfolio_input ->
    ( associate_product_with_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified product with the specified portfolio.\n\n\
  \ A delegated admin is authorized to invoke this command.\n\
  \ "]

module AssociateServiceActionWithProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_service_action_with_provisioning_artifact_input ->
    ( associate_service_action_with_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_service_action_with_provisioning_artifact_input ->
    ( associate_service_action_with_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates a self-service action with a provisioning artifact.\n"]

module AssociateTagOptionWithResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_tag_option_with_resource_input ->
    ( associate_tag_option_with_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_tag_option_with_resource_input ->
    ( associate_tag_option_with_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associate the specified TagOption with the specified portfolio or product.\n"]

module BatchAssociateServiceActionWithProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_service_action_with_provisioning_artifact_input ->
    ( batch_associate_service_action_with_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_service_action_with_provisioning_artifact_input ->
    ( batch_associate_service_action_with_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates multiple self-service actions with provisioning artifacts.\n"]

module BatchDisassociateServiceActionFromProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_service_action_from_provisioning_artifact_input ->
    ( batch_disassociate_service_action_from_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_service_action_from_provisioning_artifact_input ->
    ( batch_disassociate_service_action_from_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a batch of self-service actions from the specified provisioning artifact.\n"]

module CopyProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_product_input ->
    ( copy_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_product_input ->
    ( copy_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the specified source product to the specified target product or a new product.\n\n\
  \ You can copy a product to the same account or another account. You can copy a product to the \
   same Region or another Region. If you copy a product to another account, you must first share \
   the product in a portfolio using [CreatePortfolioShare].\n\
  \ \n\
  \  This operation is performed asynchronously. To track the progress of the operation, use \
   [DescribeCopyProductStatus].\n\
  \  "]

module CreateConstraint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_constraint_input ->
    ( create_constraint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_constraint_input ->
    ( create_constraint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a constraint.\n\n A delegated admin is authorized to invoke this command.\n "]

module CreatePortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_portfolio_input ->
    ( create_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_portfolio_input ->
    ( create_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a portfolio.\n\n A delegated admin is authorized to invoke this command.\n "]

module CreatePortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_portfolio_share_input ->
    ( create_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_portfolio_share_input ->
    ( create_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shares the specified portfolio with the specified account or organization node. Shares to an \
   organization node can only be created by the management account of an organization or by a \
   delegated administrator. You can share portfolios to an organization, an organizational unit, \
   or a specific account.\n\n\
  \ Note that if a delegated admin is de-registered, they can no longer create portfolio shares.\n\
  \ \n\
  \   [AWSOrganizationsAccess] must be enabled in order to create a portfolio share to an \
   organization node.\n\
  \  \n\
  \   You can't share a shared resource, including portfolios that contain a shared product.\n\
  \   \n\
  \    If the portfolio share with the specified account or organization node already exists, this \
   action will have no effect and will not return an error. To update an existing share, you must \
   use the [ UpdatePortfolioShare] API instead. \n\
  \    \n\
  \      When you associate a principal with portfolio, a potential privilege escalation path may \
   occur when that portfolio is then shared with other accounts. For a user in a recipient account \
   who is {i not} an Service Catalog Admin, but still has the ability to create Principals \
   (Users/Groups/Roles), that user could create a role that matches a principal name association \
   for the portfolio. Although this user may not know which principal names are associated through \
   Service Catalog, they may be able to guess the user. If this potential escalation path is a \
   concern, then Service Catalog recommends using [PrincipalType] as [IAM]. With this \
   configuration, the [PrincipalARN] must already exist in the recipient account before it can be \
   associated. \n\
  \      \n\
  \       "]

module CreateProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_product_input ->
    ( create_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_product_input ->
    ( create_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a product.\n\n\
  \ A delegated admin is authorized to invoke this command.\n\
  \ \n\
  \  The user or role that performs this operation must have the [cloudformation:GetTemplate] IAM \
   policy permission. This policy permission is required when using the [ImportFromPhysicalId] \
   template source in the information data section.\n\
  \  "]

module CreateProvisionedProductPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_provisioned_product_plan_input ->
    ( create_provisioned_product_plan_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_provisioned_product_plan_input ->
    ( create_provisioned_product_plan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a plan.\n\n\
  \ A plan includes the list of resources to be created (when provisioning a new product) or \
   modified (when updating a provisioned product) when the plan is executed.\n\
  \ \n\
  \  You can create one plan for each provisioned product. To create a plan for an existing \
   provisioned product, the product status must be AVAILABLE or TAINTED.\n\
  \  \n\
  \   To view the resource changes in the change set, use [DescribeProvisionedProductPlan]. To \
   create or modify the provisioned product, use [ExecuteProvisionedProductPlan].\n\
  \   "]

module CreateProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_provisioning_artifact_input ->
    ( create_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_provisioning_artifact_input ->
    ( create_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a provisioning artifact (also known as a version) for the specified product.\n\n\
  \ You cannot create a provisioning artifact for a product that was shared with you.\n\
  \ \n\
  \  The user or role that performs this operation must have the [cloudformation:GetTemplate] IAM \
   policy permission. This policy permission is required when using the [ImportFromPhysicalId] \
   template source in the information data section.\n\
  \  "]

module CreateServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_action_input ->
    ( create_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_service_action_input ->
    ( create_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a self-service action.\n"]

module CreateTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tag_option_input ->
    ( create_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tag_option_input ->
    ( create_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a TagOption.\n"]

module DeleteConstraint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_constraint_input ->
    ( delete_constraint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_constraint_input ->
    ( delete_constraint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified constraint.\n\n A delegated admin is authorized to invoke this command.\n "]

module DeletePortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_portfolio_input ->
    ( delete_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_portfolio_input ->
    ( delete_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified portfolio.\n\n\
  \ You cannot delete a portfolio if it was shared with you or if it has associated products, \
   users, constraints, or shared accounts.\n\
  \ \n\
  \  A delegated admin is authorized to invoke this command.\n\
  \  "]

module DeletePortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_portfolio_share_input ->
    ( delete_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_portfolio_share_input ->
    ( delete_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops sharing the specified portfolio with the specified account or organization node. Shares \
   to an organization node can only be deleted by the management account of an organization or by \
   a delegated administrator.\n\n\
  \ Note that if a delegated admin is de-registered, portfolio shares created from that account \
   are removed.\n\
  \ "]

module DeleteProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_product_input ->
    ( delete_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_product_input ->
    ( delete_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified product.\n\n\
  \ You cannot delete a product if it was shared with you or is associated with a portfolio.\n\
  \ \n\
  \  A delegated admin is authorized to invoke this command.\n\
  \  "]

module DeleteProvisionedProductPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_provisioned_product_plan_input ->
    ( delete_provisioned_product_plan_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_provisioned_product_plan_input ->
    ( delete_provisioned_product_plan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified plan.\n"]

module DeleteProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_provisioning_artifact_input ->
    ( delete_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_provisioning_artifact_input ->
    ( delete_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified provisioning artifact (also known as a version) for the specified \
   product.\n\n\
  \ You cannot delete a provisioning artifact associated with a product that was shared with you. \
   You cannot delete the last provisioning artifact for a product, because a product must have at \
   least one provisioning artifact.\n\
  \ "]

module DeleteServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_action_input ->
    ( delete_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_service_action_input ->
    ( delete_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a self-service action.\n"]

module DeleteTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tag_option_input ->
    ( delete_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tag_option_input ->
    ( delete_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified TagOption.\n\n\
  \ You cannot delete a TagOption if it is associated with a product or portfolio.\n\
  \ "]

module DescribeConstraint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_constraint_input ->
    ( describe_constraint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_constraint_input ->
    ( describe_constraint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified constraint.\n"]

module DescribeCopyProductStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_copy_product_status_input ->
    ( describe_copy_product_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_copy_product_status_input ->
    ( describe_copy_product_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the status of the specified copy product operation.\n"]

module DescribePortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_input ->
    ( describe_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_input ->
    ( describe_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified portfolio.\n\n\
  \ A delegated admin is authorized to invoke this command.\n\
  \ "]

module DescribePortfolioShares : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_shares_input ->
    ( describe_portfolio_shares_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_shares_input ->
    ( describe_portfolio_shares_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a summary of each of the portfolio shares that were created for the specified \
   portfolio.\n\n\
  \ You can use this API to determine which accounts or organizational nodes this portfolio have \
   been shared, whether the recipient entity has imported the share, and whether TagOptions are \
   included with the share.\n\
  \ \n\
  \  The [PortfolioId] and [Type] parameters are both required.\n\
  \  "]

module DescribePortfolioShareStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_share_status_input ->
    ( describe_portfolio_share_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_portfolio_share_status_input ->
    ( describe_portfolio_share_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the status of the specified portfolio share operation. This API can only be called by the \
   management account in the organization or by a delegated admin.\n"]

module DescribeProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_product_input ->
    ( describe_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_product_input ->
    ( describe_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified product.\n\n\
  \   Running this operation with administrator access results in a failure. \
   [DescribeProductAsAdmin] should be used instead. \n\
  \  \n\
  \   "]

module DescribeProductAsAdmin : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_product_as_admin_input ->
    ( describe_product_as_admin_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_product_as_admin_input ->
    ( describe_product_as_admin_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified product. This operation is run with administrator access.\n"]

module DescribeProductView : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_product_view_input ->
    ( describe_product_view_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_product_view_input ->
    ( describe_product_view_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified product.\n"]

module DescribeProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioned_product_input ->
    ( describe_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioned_product_input ->
    ( describe_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified provisioned product.\n"]

module DescribeProvisionedProductPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioned_product_plan_input ->
    ( describe_provisioned_product_plan_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioned_product_plan_input ->
    ( describe_provisioned_product_plan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the resource changes for the specified plan.\n"]

module DescribeProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioning_artifact_input ->
    ( describe_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioning_artifact_input ->
    ( describe_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified provisioning artifact (also known as a version) for the \
   specified product.\n"]

module DescribeProvisioningParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioning_parameters_input ->
    ( describe_provisioning_parameters_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_provisioning_parameters_input ->
    ( describe_provisioning_parameters_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the configuration required to provision the specified product using the \
   specified provisioning artifact.\n\n\
  \ If the output contains a TagOption key with an empty list of values, there is a TagOption \
   conflict for that key. The end user cannot take action to fix the conflict, and launch is not \
   blocked. In subsequent calls to [ProvisionProduct], do not include conflicted TagOption keys as \
   tags, or this causes the error \"Parameter validation failed: Missing required parameter in \
   Tags\\[{i N}\\]:{i Value}\". Tag the provisioned product with the value \
   [sc-tagoption-conflict-portfolioId-productId].\n\
  \ "]

module DescribeRecord : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_record_input ->
    ( describe_record_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_record_input ->
    ( describe_record_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the specified request operation.\n\n\
  \ Use this operation after calling a request operation (for example, [ProvisionProduct], \
   [TerminateProvisionedProduct], or [UpdateProvisionedProduct]). \n\
  \ \n\
  \   If a provisioned product was transferred to a new owner using \
   [UpdateProvisionedProductProperties], the new owner will be able to describe all past records \
   for that product. The previous owner will no longer be able to describe the records, but will \
   be able to use [ListRecordHistory] to see the product's history from when he was the owner.\n\
  \   \n\
  \    "]

module DescribeServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_action_input ->
    ( describe_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_action_input ->
    ( describe_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a self-service action.\n"]

module DescribeServiceActionExecutionParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_action_execution_parameters_input ->
    ( describe_service_action_execution_parameters_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_action_execution_parameters_input ->
    ( describe_service_action_execution_parameters_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Finds the default parameters for a specific self-service action on a specific provisioned \
   product and returns a map of the results to the user.\n"]

module DescribeTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tag_option_input ->
    ( describe_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tag_option_input ->
    ( describe_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified TagOption.\n"]

module DisableAWSOrganizationsAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidStateException of invalid_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_aws_organizations_access_input ->
    ( disable_aws_organizations_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_aws_organizations_access_input ->
    ( disable_aws_organizations_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disable portfolio sharing through the Organizations service. This command will not delete your \
   current shares, but prevents you from creating new shares throughout your organization. Current \
   shares are not kept in sync with your organization structure if the structure changes after \
   calling this API. Only the management account in the organization can call this API.\n\n\
  \ You cannot call this API if there are active delegated administrators in the organization.\n\
  \ \n\
  \  Note that a delegated administrator is not authorized to invoke \
   [DisableAWSOrganizationsAccess].\n\
  \  \n\
  \    If you share an Service Catalog portfolio in an organization within Organizations, and then \
   disable Organizations access for Service Catalog, the portfolio access permissions will not \
   sync with the latest changes to the organization structure. Specifically, accounts that you \
   removed from the organization after disabling Service Catalog access will retain access to the \
   previously shared portfolio.\n\
  \    \n\
  \     "]

module DisassociateBudgetFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_budget_from_resource_input ->
    ( disassociate_budget_from_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_budget_from_resource_input ->
    ( disassociate_budget_from_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified budget from the specified resource.\n"]

module DisassociatePrincipalFromPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_principal_from_portfolio_input ->
    ( disassociate_principal_from_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_principal_from_portfolio_input ->
    ( disassociate_principal_from_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a previously associated principal ARN from a specified portfolio.\n\n\
  \ The [PrincipalType] and [PrincipalARN] must match the [AssociatePrincipalWithPortfolio] call \
   request details. For example, to disassociate an association created with a [PrincipalARN] of \
   [PrincipalType] IAM you must use the [PrincipalType] IAM when calling \
   [DisassociatePrincipalFromPortfolio]. \n\
  \ \n\
  \  For portfolios that have been shared with principal name sharing enabled: after \
   disassociating a principal, share recipient accounts will no longer be able to provision \
   products in this portfolio using a role matching the name of the associated principal. \n\
  \  \n\
  \   For more information, review \
   {{:https://docs.aws.amazon.com/cli/latest/reference/servicecatalog/associate-principal-with-portfolio.html#options}associate-principal-with-portfolio} \
   in the Amazon Web Services CLI Command Reference. \n\
  \   \n\
  \     If you disassociate a principal from a portfolio, with PrincipalType as [IAM], the same \
   principal will still have access to the portfolio if it matches one of the associated \
   principals of type [IAM_PATTERN]. To fully remove access for a principal, verify all the \
   associated Principals of type [IAM_PATTERN], and then ensure you disassociate any [IAM_PATTERN] \
   principals that match the principal whose access you are removing.\n\
  \     \n\
  \      "]

module DisassociateProductFromPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_product_from_portfolio_input ->
    ( disassociate_product_from_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_product_from_portfolio_input ->
    ( disassociate_product_from_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates the specified product from the specified portfolio. \n\n\
  \ A delegated admin is authorized to invoke this command.\n\
  \ "]

module DisassociateServiceActionFromProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_service_action_from_provisioning_artifact_input ->
    ( disassociate_service_action_from_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_service_action_from_provisioning_artifact_input ->
    ( disassociate_service_action_from_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates the specified self-service action association from the specified provisioning \
   artifact.\n"]

module DisassociateTagOptionFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_tag_option_from_resource_input ->
    ( disassociate_tag_option_from_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_tag_option_from_resource_input ->
    ( disassociate_tag_option_from_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified TagOption from the specified resource.\n"]

module EnableAWSOrganizationsAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidStateException of invalid_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_aws_organizations_access_input ->
    ( enable_aws_organizations_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_aws_organizations_access_input ->
    ( enable_aws_organizations_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enable portfolio sharing feature through Organizations. This API will allow Service Catalog to \
   receive updates on your organization in order to sync your shares with the current structure. \
   This API can only be called by the management account in the organization.\n\n\
  \ When you call this API, Service Catalog calls [organizations:EnableAWSServiceAccess] on your \
   behalf so that your shares stay in sync with any changes in your Organizations structure.\n\
  \ \n\
  \  Note that a delegated administrator is not authorized to invoke [EnableAWSOrganizationsAccess].\n\
  \  \n\
  \    If you have previously disabled Organizations access for Service Catalog, and then enable \
   access again, the portfolio access permissions might not sync with the latest changes to the \
   organization structure. Specifically, accounts that you removed from the organization after \
   disabling Service Catalog access, and before you enabled access again, can retain access to the \
   previously shared portfolio. As a result, an account that has been removed from the \
   organization might still be able to create or manage Amazon Web Services resources when it is \
   no longer authorized to do so. Amazon Web Services is working to resolve this issue.\n\
  \    \n\
  \     "]

module ExecuteProvisionedProductPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_provisioned_product_plan_input ->
    ( execute_provisioned_product_plan_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_provisioned_product_plan_input ->
    ( execute_provisioned_product_plan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provisions or modifies a product based on the resource changes for the specified plan.\n"]

module ExecuteProvisionedProductServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_provisioned_product_service_action_input ->
    ( execute_provisioned_product_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_provisioned_product_service_action_input ->
    ( execute_provisioned_product_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Executes a self-service action against a provisioned product.\n"]

module GetAWSOrganizationsAccessStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_aws_organizations_access_status_input ->
    ( get_aws_organizations_access_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_aws_organizations_access_status_input ->
    ( get_aws_organizations_access_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get the Access Status for Organizations portfolio share feature. This API can only be called by \
   the management account in the organization or by a delegated admin.\n"]

module GetProvisionedProductOutputs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_provisioned_product_outputs_input ->
    ( get_provisioned_product_outputs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_provisioned_product_outputs_input ->
    ( get_provisioned_product_outputs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API takes either a [ProvisonedProductId] or a [ProvisionedProductName], along with a list \
   of one or more output keys, and responds with the key/value pairs of those outputs.\n"]

module ImportAsProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_as_provisioned_product_input ->
    ( import_as_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_as_provisioned_product_input ->
    ( import_as_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Requests the import of a resource as an Service Catalog provisioned product that is associated \
   to an Service Catalog product and provisioning artifact. Once imported, all supported \
   governance actions are supported on the provisioned product. \n\n\
  \  Resource import only supports CloudFormation stack ARNs. CloudFormation StackSets, and \
   non-root nested stacks, are not supported. \n\
  \ \n\
  \   The CloudFormation stack must have one of the following statuses to be imported: \
   [CREATE_COMPLETE], [UPDATE_COMPLETE], [UPDATE_ROLLBACK_COMPLETE], [IMPORT_COMPLETE], and \
   [IMPORT_ROLLBACK_COMPLETE]. \n\
  \  \n\
  \    Import of the resource requires that the CloudFormation stack template matches the \
   associated Service Catalog product provisioning artifact. \n\
  \   \n\
  \      When you import an existing CloudFormation stack into a portfolio, Service Catalog does \
   not apply the product's associated constraints during the import process. Service Catalog \
   applies the constraints after you call [UpdateProvisionedProduct] for the provisioned product. \n\
  \     \n\
  \        The user or role that performs this operation must have the \
   [cloudformation:GetTemplate] and [cloudformation:DescribeStacks] IAM policy permissions. \n\
  \       \n\
  \        You can only import one provisioned product at a time. The product's CloudFormation \
   stack must have the [IMPORT_COMPLETE] status before you import another. \n\
  \        "]

module ListAcceptedPortfolioShares : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `OperationNotSupportedException of operation_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accepted_portfolio_shares_input ->
    ( list_accepted_portfolio_shares_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accepted_portfolio_shares_input ->
    ( list_accepted_portfolio_shares_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all imported portfolios for which account-to-account shares were accepted by this \
   account. By specifying the [PortfolioShareType], you can list portfolios for which \
   organizational shares were accepted by this account.\n"]

module ListBudgetsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_budgets_for_resource_input ->
    ( list_budgets_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_budgets_for_resource_input ->
    ( list_budgets_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the budgets associated to the specified resource.\n"]

module ListConstraintsForPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_constraints_for_portfolio_input ->
    ( list_constraints_for_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_constraints_for_portfolio_input ->
    ( list_constraints_for_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the constraints for the specified portfolio and product.\n"]

module ListLaunchPaths : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_launch_paths_input ->
    ( list_launch_paths_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_launch_paths_input ->
    ( list_launch_paths_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists the paths to the specified product. A path describes how the user gets access to a \
   specified product and is necessary when provisioning a product. A path also determines the \
   constraints that are put on a product. A path is dependent on a specific product, porfolio, and \
   principal. \n\n\
  \   When provisioning a product that's been added to a portfolio, you must grant your user, \
   group, or role access to the portfolio. For more information, see \
   {{:https://docs.aws.amazon.com/servicecatalog/latest/adminguide/catalogs_portfolios_users.html}Granting \
   users access} in the {i Service Catalog User Guide}. \n\
  \  \n\
  \   "]

module ListOrganizationPortfolioAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_organization_portfolio_access_input ->
    ( list_organization_portfolio_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_organization_portfolio_access_input ->
    ( list_organization_portfolio_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the organization nodes that have access to the specified portfolio. This API can only be \
   called by the management account in the organization or by a delegated admin.\n\n\
  \ If a delegated admin is de-registered, they can no longer perform this operation.\n\
  \ "]

module ListPortfolioAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_portfolio_access_input ->
    ( list_portfolio_access_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_portfolio_access_input ->
    ( list_portfolio_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the account IDs that have access to the specified portfolio.\n\n\
  \ A delegated admin can list the accounts that have access to the shared portfolio. Note that if \
   a delegated admin is de-registered, they can no longer perform this operation.\n\
  \ "]

module ListPortfolios : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_portfolios_input ->
    ( list_portfolios_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_portfolios_input ->
    ( list_portfolios_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all portfolios in the catalog.\n"]

module ListPortfoliosForProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_portfolios_for_product_input ->
    ( list_portfolios_for_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_portfolios_for_product_input ->
    ( list_portfolios_for_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all portfolios that the specified product is associated with.\n"]

module ListPrincipalsForPortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_principals_for_portfolio_input ->
    ( list_principals_for_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_principals_for_portfolio_input ->
    ( list_principals_for_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all [PrincipalARN]s and corresponding [PrincipalType]s associated with the specified \
   portfolio.\n"]

module ListProvisionedProductPlans : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_provisioned_product_plans_input ->
    ( list_provisioned_product_plans_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_provisioned_product_plans_input ->
    ( list_provisioned_product_plans_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the plans for the specified provisioned product or all plans to which the user has access.\n"]

module ListProvisioningArtifacts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_provisioning_artifacts_input ->
    ( list_provisioning_artifacts_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_provisioning_artifacts_input ->
    ( list_provisioning_artifacts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all provisioning artifacts (also known as versions) for the specified product.\n"]

module ListProvisioningArtifactsForServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_provisioning_artifacts_for_service_action_input ->
    ( list_provisioning_artifacts_for_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_provisioning_artifacts_for_service_action_input ->
    ( list_provisioning_artifacts_for_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all provisioning artifacts (also known as versions) for the specified self-service action.\n"]

module ListRecordHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_record_history_input ->
    ( list_record_history_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_record_history_input ->
    ( list_record_history_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the specified requests or all performed requests.\n"]

module ListResourcesForTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resources_for_tag_option_input ->
    ( list_resources_for_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resources_for_tag_option_input ->
    ( list_resources_for_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the resources associated with the specified TagOption.\n"]

module ListServiceActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_actions_input ->
    ( list_service_actions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_service_actions_input ->
    ( list_service_actions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all self-service actions.\n"]

module ListServiceActionsForProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_actions_for_provisioning_artifact_input ->
    ( list_service_actions_for_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_service_actions_for_provisioning_artifact_input ->
    ( list_service_actions_for_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of self-service actions associated with the specified Product ID and \
   Provisioning Artifact ID.\n"]

module ListStackInstancesForProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_instances_for_provisioned_product_input ->
    ( list_stack_instances_for_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_instances_for_provisioned_product_input ->
    ( list_stack_instances_for_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns summary information about stack instances that are associated with the specified \
   [CFN_STACKSET] type provisioned product. You can filter for stack instances that are associated \
   with a specific Amazon Web Services account name or Region. \n"]

module ListTagOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tag_options_input ->
    ( list_tag_options_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tag_options_input ->
    ( list_tag_options_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the specified TagOptions or all TagOptions.\n"]

module NotifyProvisionProductEngineWorkflowResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_provision_product_engine_workflow_result_input ->
    ( notify_provision_product_engine_workflow_result_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    notify_provision_product_engine_workflow_result_input ->
    ( notify_provision_product_engine_workflow_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Notifies the result of the provisioning engine execution. \n"]

module NotifyTerminateProvisionedProductEngineWorkflowResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_terminate_provisioned_product_engine_workflow_result_input ->
    ( notify_terminate_provisioned_product_engine_workflow_result_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    notify_terminate_provisioned_product_engine_workflow_result_input ->
    ( notify_terminate_provisioned_product_engine_workflow_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Notifies the result of the terminate engine execution. \n"]

module NotifyUpdateProvisionedProductEngineWorkflowResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    notify_update_provisioned_product_engine_workflow_result_input ->
    ( notify_update_provisioned_product_engine_workflow_result_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    notify_update_provisioned_product_engine_workflow_result_input ->
    ( notify_update_provisioned_product_engine_workflow_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Notifies the result of the update engine execution. \n"]

module ProvisionProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    provision_product_input ->
    ( provision_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    provision_product_input ->
    ( provision_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Provisions the specified product. \n\n\
  \  A provisioned product is a resourced instance of a product. For example, provisioning a \
   product that's based on an CloudFormation template launches an CloudFormation stack and its \
   underlying resources. You can check the status of this request using [DescribeRecord]. \n\
  \ \n\
  \   If the request contains a tag key with an empty list of values, there's a tag conflict for \
   that key. Don't include conflicted keys as tags, or this will cause the error \"Parameter \
   validation failed: Missing required parameter in Tags\\[{i N}\\]:{i Value}\". \n\
  \  \n\
  \     When provisioning a product that's been added to a portfolio, you must grant your user, \
   group, or role access to the portfolio. For more information, see \
   {{:https://docs.aws.amazon.com/servicecatalog/latest/adminguide/catalogs_portfolios_users.html}Granting \
   users access} in the {i Service Catalog User Guide}. \n\
  \    \n\
  \     "]

module RejectPortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_portfolio_share_input ->
    ( reject_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_portfolio_share_input ->
    ( reject_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rejects an offer to share the specified portfolio.\n"]

module ScanProvisionedProducts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    scan_provisioned_products_input ->
    ( scan_provisioned_products_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    scan_provisioned_products_input ->
    ( scan_provisioned_products_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the provisioned products that are available (not terminated).\n\n\
  \ To use additional filtering, see [SearchProvisionedProducts].\n\
  \ "]

module SearchProducts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_products_input ->
    ( search_products_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_products_input ->
    ( search_products_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the products to which the caller has access.\n"]

module SearchProductsAsAdmin : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_products_as_admin_input ->
    ( search_products_as_admin_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_products_as_admin_input ->
    ( search_products_as_admin_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the products for the specified portfolio or all products.\n"]

module SearchProvisionedProducts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_provisioned_products_input ->
    ( search_provisioned_products_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_provisioned_products_input ->
    ( search_provisioned_products_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the provisioned products that meet the specified criteria.\n"]

module TerminateProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_provisioned_product_input ->
    ( terminate_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_provisioned_product_input ->
    ( terminate_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates the specified provisioned product.\n\n\
  \ This operation does not delete any records associated with the provisioned product.\n\
  \ \n\
  \  You can check the status of this request using [DescribeRecord].\n\
  \  "]

module UpdateConstraint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_constraint_input ->
    ( update_constraint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_constraint_input ->
    ( update_constraint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified constraint.\n"]

module UpdatePortfolio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_portfolio_input ->
    ( update_portfolio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_portfolio_input ->
    ( update_portfolio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified portfolio.\n\n You cannot update a product that was shared with you.\n "]

module UpdatePortfolioShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_portfolio_share_input ->
    ( update_portfolio_share_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_portfolio_share_input ->
    ( update_portfolio_share_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified portfolio share. You can use this API to enable or disable [TagOptions] \
   sharing or Principal sharing for an existing portfolio share. \n\n\
  \ The portfolio share cannot be updated if the [CreatePortfolioShare] operation is \
   [IN_PROGRESS], as the share is not available to recipient entities. In this case, you must wait \
   for the portfolio share to be completed.\n\
  \ \n\
  \  You must provide the [accountId] or organization node in the input, but not both.\n\
  \  \n\
  \   If the portfolio is shared to both an external account and an organization node, and both \
   shares need to be updated, you must invoke [UpdatePortfolioShare] separately for each share \
   type. \n\
  \   \n\
  \    This API cannot be used for removing the portfolio share. You must use \
   [DeletePortfolioShare] API for that action. \n\
  \    \n\
  \      When you associate a principal with portfolio, a potential privilege escalation path may \
   occur when that portfolio is then shared with other accounts. For a user in a recipient account \
   who is {i not} an Service Catalog Admin, but still has the ability to create Principals \
   (Users/Groups/Roles), that user could create a role that matches a principal name association \
   for the portfolio. Although this user may not know which principal names are associated through \
   Service Catalog, they may be able to guess the user. If this potential escalation path is a \
   concern, then Service Catalog recommends using [PrincipalType] as [IAM]. With this \
   configuration, the [PrincipalARN] must already exist in the recipient account before it can be \
   associated. \n\
  \      \n\
  \       "]

module UpdateProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_product_input ->
    ( update_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_product_input ->
    ( update_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified product.\n"]

module UpdateProvisionedProduct : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_product_input ->
    ( update_provisioned_product_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_product_input ->
    ( update_provisioned_product_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests updates to the configuration of the specified provisioned product.\n\n\
  \ If there are tags associated with the object, they cannot be updated or added. Depending on \
   the specific updates requested, this operation can update with no interruption, with some \
   interruption, or replace the provisioned product entirely.\n\
  \ \n\
  \  You can check the status of this request using [DescribeRecord].\n\
  \  "]

module UpdateProvisionedProductProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_product_properties_input ->
    ( update_provisioned_product_properties_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_provisioned_product_properties_input ->
    ( update_provisioned_product_properties_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Requests updates to the properties of the specified provisioned product.\n"]

module UpdateProvisioningArtifact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_provisioning_artifact_input ->
    ( update_provisioning_artifact_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_provisioning_artifact_input ->
    ( update_provisioning_artifact_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified provisioning artifact (also known as a version) for the specified \
   product.\n\n\
  \ You cannot update a provisioning artifact for a product that was shared with you.\n\
  \ "]

module UpdateServiceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_action_input ->
    ( update_service_action_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_action_input ->
    ( update_service_action_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a self-service action.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateTagOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateResourceException of duplicate_resource_exception
    | `InvalidParametersException of invalid_parameters_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_tag_option_input ->
    ( update_tag_option_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_tag_option_input ->
    ( update_tag_option_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateResourceException of duplicate_resource_exception
      | `InvalidParametersException of invalid_parameters_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagOptionNotMigratedException of tag_option_not_migrated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified TagOption.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
