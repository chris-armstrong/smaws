open Types

val make_usage_instruction :
  ?value:instruction_value -> ?type_:instruction_type -> unit -> usage_instruction

val make_tag_option_detail :
  ?owner:owner ->
  ?id:tag_option_id ->
  ?active:tag_option_active ->
  ?value:tag_option_value ->
  ?key:tag_option_key ->
  unit ->
  tag_option_detail

val make_update_tag_option_output :
  ?tag_option_detail:tag_option_detail -> unit -> update_tag_option_output

val make_update_tag_option_input :
  ?active:tag_option_active ->
  ?value:tag_option_value ->
  id:tag_option_id ->
  unit ->
  update_tag_option_input

val make_service_action_summary :
  ?definition_type:service_action_definition_type ->
  ?description:service_action_description ->
  ?name:service_action_name ->
  ?id:id ->
  unit ->
  service_action_summary

val make_service_action_detail :
  ?definition:service_action_definition_map ->
  ?service_action_summary:service_action_summary ->
  unit ->
  service_action_detail

val make_update_service_action_output :
  ?service_action_detail:service_action_detail -> unit -> update_service_action_output

val make_update_service_action_input :
  ?accept_language:accept_language ->
  ?description:service_action_description ->
  ?definition:service_action_definition_map ->
  ?name:service_action_name ->
  id:id ->
  unit ->
  update_service_action_input

val make_update_provisioning_preferences :
  ?stack_set_operation_type:stack_set_operation_type ->
  ?stack_set_max_concurrency_percentage:stack_set_max_concurrency_percentage ->
  ?stack_set_max_concurrency_count:stack_set_max_concurrency_count ->
  ?stack_set_failure_tolerance_percentage:stack_set_failure_tolerance_percentage ->
  ?stack_set_failure_tolerance_count:stack_set_failure_tolerance_count ->
  ?stack_set_regions:stack_set_regions ->
  ?stack_set_accounts:stack_set_accounts ->
  unit ->
  update_provisioning_preferences

val make_update_provisioning_parameter :
  ?use_previous_value:use_previous_value ->
  ?value:parameter_value ->
  ?key:parameter_key ->
  unit ->
  update_provisioning_parameter

val make_provisioning_artifact_detail :
  ?source_revision:source_revision ->
  ?guidance:provisioning_artifact_guidance ->
  ?active:provisioning_artifact_active ->
  ?created_time:creation_time ->
  ?type_:provisioning_artifact_type ->
  ?description:provisioning_artifact_name ->
  ?name:provisioning_artifact_name ->
  ?id:id ->
  unit ->
  provisioning_artifact_detail

val make_update_provisioning_artifact_output :
  ?status:status ->
  ?info:provisioning_artifact_info ->
  ?provisioning_artifact_detail:provisioning_artifact_detail ->
  unit ->
  update_provisioning_artifact_output

val make_update_provisioning_artifact_input :
  ?guidance:provisioning_artifact_guidance ->
  ?active:provisioning_artifact_active ->
  ?description:provisioning_artifact_description ->
  ?name:provisioning_artifact_name ->
  ?accept_language:accept_language ->
  provisioning_artifact_id:id ->
  product_id:id ->
  unit ->
  update_provisioning_artifact_input

val make_update_provisioned_product_properties_output :
  ?status:record_status ->
  ?record_id:id ->
  ?provisioned_product_properties:provisioned_product_properties ->
  ?provisioned_product_id:id ->
  unit ->
  update_provisioned_product_properties_output

val make_update_provisioned_product_properties_input :
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  provisioned_product_properties:provisioned_product_properties ->
  provisioned_product_id:id ->
  unit ->
  update_provisioned_product_properties_input

val make_record_error : ?description:error_description -> ?code:error_code -> unit -> record_error
val make_record_tag : ?value:record_tag_value -> ?key:record_tag_key -> unit -> record_tag

val make_record_detail :
  ?launch_role_arn:role_arn ->
  ?record_tags:record_tags ->
  ?record_errors:record_errors ->
  ?path_id:id ->
  ?provisioning_artifact_id:id ->
  ?product_id:id ->
  ?provisioned_product_id:id ->
  ?record_type:record_type ->
  ?provisioned_product_type:provisioned_product_type ->
  ?updated_time:updated_time ->
  ?created_time:created_time ->
  ?status:record_status ->
  ?provisioned_product_name:provisioned_product_name ->
  ?record_id:id ->
  unit ->
  record_detail

val make_update_provisioned_product_output :
  ?record_detail:record_detail -> unit -> update_provisioned_product_output

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_update_provisioned_product_input :
  ?tags:tags ->
  ?provisioning_preferences:update_provisioning_preferences ->
  ?provisioning_parameters:update_provisioning_parameters ->
  ?path_name:portfolio_display_name ->
  ?path_id:id ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?provisioning_artifact_id:id ->
  ?product_name:product_view_name ->
  ?product_id:id ->
  ?provisioned_product_id:id ->
  ?provisioned_product_name:provisioned_product_name_or_arn ->
  ?accept_language:accept_language ->
  update_token:idempotency_token ->
  unit ->
  update_provisioned_product_input

val make_product_view_summary :
  ?support_url:support_url ->
  ?support_description:support_description ->
  ?support_email:support_email ->
  ?has_default_path:has_default_path ->
  ?distributor:product_view_distributor ->
  ?type_:product_type ->
  ?short_description:product_view_short_description ->
  ?owner:product_view_owner ->
  ?name:product_view_name ->
  ?product_id:id ->
  ?id:id ->
  unit ->
  product_view_summary

val make_code_star_parameters :
  artifact_path:repository_artifact_path ->
  branch:repository_branch ->
  repository:repository ->
  connection_arn:code_star_connection_arn ->
  unit ->
  code_star_parameters

val make_source_connection_parameters :
  ?code_star:code_star_parameters -> unit -> source_connection_parameters

val make_last_sync :
  ?last_successful_sync_provisioning_artifact_id:id ->
  ?last_successful_sync_time:last_successful_sync_time ->
  ?last_sync_status_message:last_sync_status_message ->
  ?last_sync_status:last_sync_status ->
  ?last_sync_time:last_sync_time ->
  unit ->
  last_sync

val make_source_connection_detail :
  ?last_sync:last_sync ->
  ?connection_parameters:source_connection_parameters ->
  ?type_:source_type ->
  unit ->
  source_connection_detail

val make_product_view_detail :
  ?source_connection:source_connection_detail ->
  ?created_time:created_time ->
  ?product_ar_n:resource_ar_n ->
  ?status:status ->
  ?product_view_summary:product_view_summary ->
  unit ->
  product_view_detail

val make_update_product_output :
  ?tags:tags -> ?product_view_detail:product_view_detail -> unit -> update_product_output

val make_source_connection :
  ?type_:source_type ->
  connection_parameters:source_connection_parameters ->
  unit ->
  source_connection

val make_update_product_input :
  ?source_connection:source_connection ->
  ?remove_tags:tag_keys ->
  ?add_tags:add_tags ->
  ?support_url:support_url ->
  ?support_email:support_email ->
  ?support_description:support_description ->
  ?distributor:product_view_owner ->
  ?description:product_view_short_description ->
  ?owner:product_view_owner ->
  ?name:product_view_name ->
  ?accept_language:accept_language ->
  id:id ->
  unit ->
  update_product_input

val make_update_portfolio_share_output :
  ?status:share_status -> ?portfolio_share_token:id -> unit -> update_portfolio_share_output

val make_organization_node :
  ?value:organization_node_value -> ?type_:organization_node_type -> unit -> organization_node

val make_update_portfolio_share_input :
  ?share_principals:nullable_boolean ->
  ?share_tag_options:nullable_boolean ->
  ?organization_node:organization_node ->
  ?account_id:account_id ->
  ?accept_language:accept_language ->
  portfolio_id:id ->
  unit ->
  update_portfolio_share_input

val make_portfolio_detail :
  ?provider_name:provider_name ->
  ?created_time:creation_time ->
  ?description:portfolio_description ->
  ?display_name:portfolio_display_name ->
  ?ar_n:resource_ar_n ->
  ?id:id ->
  unit ->
  portfolio_detail

val make_update_portfolio_output :
  ?tags:tags -> ?portfolio_detail:portfolio_detail -> unit -> update_portfolio_output

val make_update_portfolio_input :
  ?remove_tags:tag_keys ->
  ?add_tags:add_tags ->
  ?provider_name:provider_name ->
  ?description:portfolio_description ->
  ?display_name:portfolio_display_name ->
  ?accept_language:accept_language ->
  id:id ->
  unit ->
  update_portfolio_input

val make_constraint_detail :
  ?portfolio_id:id ->
  ?product_id:id ->
  ?owner:account_id ->
  ?description:constraint_description ->
  ?type_:constraint_type ->
  ?constraint_id:id ->
  unit ->
  constraint_detail

val make_update_constraint_output :
  ?status:status ->
  ?constraint_parameters:constraint_parameters ->
  ?constraint_detail:constraint_detail ->
  unit ->
  update_constraint_output

val make_update_constraint_input :
  ?parameters:constraint_parameters ->
  ?description:constraint_description ->
  ?accept_language:accept_language ->
  id:id ->
  unit ->
  update_constraint_input

val make_unique_tag_resource_identifier :
  ?value:unique_tag_value -> ?key:unique_tag_key -> unit -> unique_tag_resource_identifier

val make_terminate_provisioned_product_output :
  ?record_detail:record_detail -> unit -> terminate_provisioned_product_output

val make_terminate_provisioned_product_input :
  ?retain_physical_resources:retain_physical_resources ->
  ?accept_language:accept_language ->
  ?ignore_errors:ignore_errors ->
  ?provisioned_product_id:id ->
  ?provisioned_product_name:provisioned_product_name_or_arn ->
  terminate_token:idempotency_token ->
  unit ->
  terminate_provisioned_product_input

val make_tag_option_summary :
  ?values:tag_option_values -> ?key:tag_option_key -> unit -> tag_option_summary

val make_stack_instance :
  ?stack_instance_status:stack_instance_status ->
  ?region:region ->
  ?account:account_id ->
  unit ->
  stack_instance

val make_share_error :
  ?error:error -> ?message:message -> ?accounts:namespaces -> unit -> share_error

val make_share_details :
  ?share_errors:share_errors -> ?successful_shares:successful_shares -> unit -> share_details

val make_service_action_association :
  provisioning_artifact_id:id ->
  product_id:id ->
  service_action_id:id ->
  unit ->
  service_action_association

val make_provisioned_product_attribute :
  ?user_arn_session:user_arn_session ->
  ?user_arn:user_arn ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?provisioning_artifact_id:id ->
  ?product_name:product_view_name ->
  ?product_id:id ->
  ?physical_id:physical_id ->
  ?tags:tags ->
  ?last_successful_provisioning_record_id:id ->
  ?last_provisioning_record_id:id ->
  ?last_record_id:id ->
  ?idempotency_token:idempotency_token ->
  ?created_time:created_time ->
  ?status_message:provisioned_product_status_message ->
  ?status:provisioned_product_status ->
  ?id:id ->
  ?type_:provisioned_product_type ->
  ?arn:provisioned_product_name_or_arn ->
  ?name:provisioned_product_name_or_arn ->
  unit ->
  provisioned_product_attribute

val make_search_provisioned_products_output :
  ?next_page_token:page_token ->
  ?total_results_count:total_results_count ->
  ?provisioned_products:provisioned_product_attributes ->
  unit ->
  search_provisioned_products_output

val make_access_level_filter :
  ?value:access_level_filter_value -> ?key:access_level_filter_key -> unit -> access_level_filter

val make_search_provisioned_products_input :
  ?page_token:page_token ->
  ?page_size:search_provisioned_products_page_size ->
  ?sort_order:sort_order ->
  ?sort_by:sort_field ->
  ?filters:provisioned_product_filters ->
  ?access_level_filter:access_level_filter ->
  ?accept_language:accept_language ->
  unit ->
  search_provisioned_products_input

val make_product_view_aggregation_value :
  ?approximate_count:approximate_count ->
  ?value:attribute_value ->
  unit ->
  product_view_aggregation_value

val make_search_products_output :
  ?next_page_token:page_token ->
  ?product_view_aggregations:product_view_aggregations ->
  ?product_view_summaries:product_view_summaries ->
  unit ->
  search_products_output

val make_search_products_input :
  ?page_token:page_token ->
  ?sort_order:sort_order ->
  ?sort_by:product_view_sort_by ->
  ?page_size:page_size_max100 ->
  ?filters:product_view_filters ->
  ?accept_language:accept_language ->
  unit ->
  search_products_input

val make_search_products_as_admin_output :
  ?next_page_token:page_token ->
  ?product_view_details:product_view_details ->
  unit ->
  search_products_as_admin_output

val make_search_products_as_admin_input :
  ?product_source:product_source ->
  ?page_size:page_size ->
  ?page_token:page_token ->
  ?sort_order:sort_order ->
  ?sort_by:product_view_sort_by ->
  ?filters:product_view_filters ->
  ?portfolio_id:id ->
  ?accept_language:accept_language ->
  unit ->
  search_products_as_admin_input

val make_provisioned_product_detail :
  ?launch_role_arn:role_arn ->
  ?provisioning_artifact_id:id ->
  ?product_id:id ->
  ?last_successful_provisioning_record_id:id ->
  ?last_provisioning_record_id:id ->
  ?last_record_id:last_request_id ->
  ?idempotency_token:idempotency_token ->
  ?created_time:created_time ->
  ?status_message:provisioned_product_status_message ->
  ?status:provisioned_product_status ->
  ?id:provisioned_product_id ->
  ?type_:provisioned_product_type ->
  ?arn:provisioned_product_name_or_arn ->
  ?name:provisioned_product_name_or_arn ->
  unit ->
  provisioned_product_detail

val make_scan_provisioned_products_output :
  ?next_page_token:page_token ->
  ?provisioned_products:provisioned_product_details ->
  unit ->
  scan_provisioned_products_output

val make_scan_provisioned_products_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?access_level_filter:access_level_filter ->
  ?accept_language:accept_language ->
  unit ->
  scan_provisioned_products_input

val make_resource_target_definition :
  ?requires_recreation:requires_recreation ->
  ?name:property_name ->
  ?attribute:resource_attribute ->
  unit ->
  resource_target_definition

val make_resource_detail :
  ?created_time:resource_detail_created_time ->
  ?description:resource_detail_description ->
  ?name:resource_detail_name ->
  ?ar_n:resource_detail_ar_n ->
  ?id:resource_detail_id ->
  unit ->
  resource_detail

val make_resource_change_detail :
  ?causing_entity:causing_entity ->
  ?evaluation:evaluation_type ->
  ?target:resource_target_definition ->
  unit ->
  resource_change_detail

val make_resource_change :
  ?details:resource_change_details ->
  ?scope:scope ->
  ?replacement:replacement ->
  ?resource_type:plan_resource_type ->
  ?physical_resource_id:physical_resource_id ->
  ?logical_resource_id:logical_resource_id ->
  ?action:change_action ->
  unit ->
  resource_change

val make_reject_portfolio_share_output : unit -> unit

val make_reject_portfolio_share_input :
  ?portfolio_share_type:portfolio_share_type ->
  ?accept_language:accept_language ->
  portfolio_id:id ->
  unit ->
  reject_portfolio_share_input

val make_record_output :
  ?description:description ->
  ?output_value:output_value ->
  ?output_key:output_key ->
  unit ->
  record_output

val make_provisioning_preferences :
  ?stack_set_max_concurrency_percentage:stack_set_max_concurrency_percentage ->
  ?stack_set_max_concurrency_count:stack_set_max_concurrency_count ->
  ?stack_set_failure_tolerance_percentage:stack_set_failure_tolerance_percentage ->
  ?stack_set_failure_tolerance_count:stack_set_failure_tolerance_count ->
  ?stack_set_regions:stack_set_regions ->
  ?stack_set_accounts:stack_set_accounts ->
  unit ->
  provisioning_preferences

val make_provisioning_parameter :
  ?value:parameter_value -> ?key:parameter_key -> unit -> provisioning_parameter

val make_provisioning_artifact :
  ?guidance:provisioning_artifact_guidance ->
  ?created_time:provisioning_artifact_created_time ->
  ?description:provisioning_artifact_description ->
  ?name:provisioning_artifact_name ->
  ?id:id ->
  unit ->
  provisioning_artifact

val make_provisioning_artifact_view :
  ?provisioning_artifact:provisioning_artifact ->
  ?product_view_summary:product_view_summary ->
  unit ->
  provisioning_artifact_view

val make_provisioning_artifact_summary :
  ?provisioning_artifact_metadata:provisioning_artifact_info ->
  ?created_time:provisioning_artifact_created_time ->
  ?description:provisioning_artifact_description ->
  ?name:provisioning_artifact_name ->
  ?id:id ->
  unit ->
  provisioning_artifact_summary

val make_provisioning_artifact_properties :
  ?disable_template_validation:disable_template_validation ->
  ?type_:provisioning_artifact_type ->
  ?info:provisioning_artifact_info ->
  ?description:provisioning_artifact_description ->
  ?name:provisioning_artifact_name ->
  unit ->
  provisioning_artifact_properties

val make_provisioning_artifact_preferences :
  ?stack_set_regions:stack_set_regions ->
  ?stack_set_accounts:stack_set_accounts ->
  unit ->
  provisioning_artifact_preferences

val make_parameter_constraints :
  ?min_value:string_ ->
  ?max_value:string_ ->
  ?min_length:string_ ->
  ?max_length:string_ ->
  ?constraint_description:string_ ->
  ?allowed_pattern:string_ ->
  ?allowed_values:allowed_values ->
  unit ->
  parameter_constraints

val make_provisioning_artifact_parameter :
  ?parameter_constraints:parameter_constraints ->
  ?description:description ->
  ?is_no_echo:no_echo ->
  ?parameter_type:parameter_type ->
  ?default_value:default_value ->
  ?parameter_key:parameter_key ->
  unit ->
  provisioning_artifact_parameter

val make_provisioning_artifact_output :
  ?description:output_description ->
  ?key:provisioning_artifact_output_key ->
  unit ->
  provisioning_artifact_output

val make_provisioned_product_plan_summary :
  ?provisioning_artifact_id:id ->
  ?plan_type:provisioned_product_plan_type ->
  ?provision_product_name:provisioned_product_name ->
  ?provision_product_id:id ->
  ?plan_id:id ->
  ?plan_name:provisioned_product_plan_name ->
  unit ->
  provisioned_product_plan_summary

val make_provisioned_product_plan_details :
  ?status_message:status_message ->
  ?tags:tags ->
  ?provisioning_parameters:update_provisioning_parameters ->
  ?notification_arns:notification_arns ->
  ?updated_time:updated_time ->
  ?status:provisioned_product_plan_status ->
  ?provisioning_artifact_id:id ->
  ?plan_type:provisioned_product_plan_type ->
  ?provision_product_name:provisioned_product_name ->
  ?provision_product_id:id ->
  ?plan_id:id ->
  ?plan_name:provisioned_product_plan_name ->
  ?product_id:id ->
  ?path_id:id ->
  ?created_time:created_time ->
  unit ->
  provisioned_product_plan_details

val make_provision_product_output : ?record_detail:record_detail -> unit -> provision_product_output

val make_provision_product_input :
  ?notification_arns:notification_arns ->
  ?tags:tags ->
  ?provisioning_preferences:provisioning_preferences ->
  ?provisioning_parameters:provisioning_parameters ->
  ?path_name:portfolio_display_name ->
  ?path_id:id ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?provisioning_artifact_id:id ->
  ?product_name:product_view_name ->
  ?product_id:id ->
  ?accept_language:accept_language ->
  provision_token:idempotency_token ->
  provisioned_product_name:provisioned_product_name ->
  unit ->
  provision_product_input

val make_principal :
  ?principal_type:principal_type -> ?principal_ar_n:principal_ar_n -> unit -> principal

val make_portfolio_share_detail :
  ?share_principals:boolean_ ->
  ?share_tag_options:boolean_ ->
  ?accepted:boolean_ ->
  ?type_:describe_portfolio_share_type ->
  ?principal_id:id ->
  unit ->
  portfolio_share_detail

val make_notify_update_provisioned_product_engine_workflow_result_output : unit -> unit

val make_notify_update_provisioned_product_engine_workflow_result_input :
  ?outputs:record_outputs ->
  ?failure_reason:engine_workflow_failure_reason ->
  idempotency_token:idempotency_token ->
  status:engine_workflow_status ->
  record_id:id ->
  workflow_token:engine_workflow_token ->
  unit ->
  notify_update_provisioned_product_engine_workflow_result_input

val make_notify_terminate_provisioned_product_engine_workflow_result_output : unit -> unit

val make_notify_terminate_provisioned_product_engine_workflow_result_input :
  ?failure_reason:engine_workflow_failure_reason ->
  idempotency_token:idempotency_token ->
  status:engine_workflow_status ->
  record_id:id ->
  workflow_token:engine_workflow_token ->
  unit ->
  notify_terminate_provisioned_product_engine_workflow_result_input

val make_notify_provision_product_engine_workflow_result_output : unit -> unit

val make_engine_workflow_resource_identifier :
  ?unique_tag:unique_tag_resource_identifier -> unit -> engine_workflow_resource_identifier

val make_notify_provision_product_engine_workflow_result_input :
  ?outputs:record_outputs ->
  ?resource_identifier:engine_workflow_resource_identifier ->
  ?failure_reason:engine_workflow_failure_reason ->
  idempotency_token:idempotency_token ->
  status:engine_workflow_status ->
  record_id:id ->
  workflow_token:engine_workflow_token ->
  unit ->
  notify_provision_product_engine_workflow_result_input

val make_list_tag_options_output :
  ?page_token:page_token ->
  ?tag_option_details:tag_option_details ->
  unit ->
  list_tag_options_output

val make_list_tag_options_filters :
  ?active:tag_option_active ->
  ?value:tag_option_value ->
  ?key:tag_option_key ->
  unit ->
  list_tag_options_filters

val make_list_tag_options_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?filters:list_tag_options_filters ->
  unit ->
  list_tag_options_input

val make_list_stack_instances_for_provisioned_product_output :
  ?next_page_token:page_token ->
  ?stack_instances:stack_instances ->
  unit ->
  list_stack_instances_for_provisioned_product_output

val make_list_stack_instances_for_provisioned_product_input :
  ?page_size:page_size ->
  ?page_token:page_token ->
  ?accept_language:accept_language ->
  provisioned_product_id:id ->
  unit ->
  list_stack_instances_for_provisioned_product_input

val make_list_service_actions_output :
  ?next_page_token:page_token ->
  ?service_action_summaries:service_action_summaries ->
  unit ->
  list_service_actions_output

val make_list_service_actions_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?accept_language:accept_language ->
  unit ->
  list_service_actions_input

val make_list_service_actions_for_provisioning_artifact_output :
  ?next_page_token:page_token ->
  ?service_action_summaries:service_action_summaries ->
  unit ->
  list_service_actions_for_provisioning_artifact_output

val make_list_service_actions_for_provisioning_artifact_input :
  ?accept_language:accept_language ->
  ?page_token:page_token ->
  ?page_size:page_size ->
  provisioning_artifact_id:id ->
  product_id:id ->
  unit ->
  list_service_actions_for_provisioning_artifact_input

val make_list_resources_for_tag_option_output :
  ?page_token:page_token ->
  ?resource_details:resource_details ->
  unit ->
  list_resources_for_tag_option_output

val make_list_resources_for_tag_option_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?resource_type:resource_type ->
  tag_option_id:tag_option_id ->
  unit ->
  list_resources_for_tag_option_input

val make_list_record_history_search_filter :
  ?value:search_filter_value -> ?key:search_filter_key -> unit -> list_record_history_search_filter

val make_list_record_history_output :
  ?next_page_token:page_token ->
  ?record_details:record_details ->
  unit ->
  list_record_history_output

val make_list_record_history_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?search_filter:list_record_history_search_filter ->
  ?access_level_filter:access_level_filter ->
  ?accept_language:accept_language ->
  unit ->
  list_record_history_input

val make_list_provisioning_artifacts_output :
  ?next_page_token:page_token ->
  ?provisioning_artifact_details:provisioning_artifact_details ->
  unit ->
  list_provisioning_artifacts_output

val make_list_provisioning_artifacts_input :
  ?accept_language:accept_language -> product_id:id -> unit -> list_provisioning_artifacts_input

val make_list_provisioning_artifacts_for_service_action_output :
  ?next_page_token:page_token ->
  ?provisioning_artifact_views:provisioning_artifact_views ->
  unit ->
  list_provisioning_artifacts_for_service_action_output

val make_list_provisioning_artifacts_for_service_action_input :
  ?accept_language:accept_language ->
  ?page_token:page_token ->
  ?page_size:page_size ->
  service_action_id:id ->
  unit ->
  list_provisioning_artifacts_for_service_action_input

val make_list_provisioned_product_plans_output :
  ?next_page_token:page_token ->
  ?provisioned_product_plans:provisioned_product_plans ->
  unit ->
  list_provisioned_product_plans_output

val make_list_provisioned_product_plans_input :
  ?access_level_filter:access_level_filter ->
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?provision_product_id:id ->
  ?accept_language:accept_language ->
  unit ->
  list_provisioned_product_plans_input

val make_list_principals_for_portfolio_output :
  ?next_page_token:page_token ->
  ?principals:principals ->
  unit ->
  list_principals_for_portfolio_output

val make_list_principals_for_portfolio_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?accept_language:accept_language ->
  portfolio_id:id ->
  unit ->
  list_principals_for_portfolio_input

val make_list_portfolios_output :
  ?next_page_token:page_token ->
  ?portfolio_details:portfolio_details ->
  unit ->
  list_portfolios_output

val make_list_portfolios_input :
  ?page_size:page_size_max100 ->
  ?page_token:page_token ->
  ?accept_language:accept_language ->
  unit ->
  list_portfolios_input

val make_list_portfolios_for_product_output :
  ?next_page_token:page_token ->
  ?portfolio_details:portfolio_details ->
  unit ->
  list_portfolios_for_product_output

val make_list_portfolios_for_product_input :
  ?page_size:page_size_max100 ->
  ?page_token:page_token ->
  ?accept_language:accept_language ->
  product_id:id ->
  unit ->
  list_portfolios_for_product_input

val make_list_portfolio_access_output :
  ?next_page_token:page_token -> ?account_ids:account_ids -> unit -> list_portfolio_access_output

val make_list_portfolio_access_input :
  ?page_size:page_size_max100 ->
  ?page_token:page_token ->
  ?organization_parent_id:id ->
  ?accept_language:accept_language ->
  portfolio_id:id ->
  unit ->
  list_portfolio_access_input

val make_list_organization_portfolio_access_output :
  ?next_page_token:page_token ->
  ?organization_nodes:organization_nodes ->
  unit ->
  list_organization_portfolio_access_output

val make_list_organization_portfolio_access_input :
  ?page_size:page_size ->
  ?page_token:page_token ->
  ?accept_language:accept_language ->
  organization_node_type:organization_node_type ->
  portfolio_id:id ->
  unit ->
  list_organization_portfolio_access_input

val make_constraint_summary :
  ?description:constraint_description -> ?type_:constraint_type -> unit -> constraint_summary

val make_launch_path_summary :
  ?name:portfolio_name ->
  ?tags:tags ->
  ?constraint_summaries:constraint_summaries ->
  ?id:id ->
  unit ->
  launch_path_summary

val make_list_launch_paths_output :
  ?next_page_token:page_token ->
  ?launch_path_summaries:launch_path_summaries ->
  unit ->
  list_launch_paths_output

val make_list_launch_paths_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?accept_language:accept_language ->
  product_id:id ->
  unit ->
  list_launch_paths_input

val make_list_constraints_for_portfolio_output :
  ?next_page_token:page_token ->
  ?constraint_details:constraint_details ->
  unit ->
  list_constraints_for_portfolio_output

val make_list_constraints_for_portfolio_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?product_id:id ->
  ?accept_language:accept_language ->
  portfolio_id:id ->
  unit ->
  list_constraints_for_portfolio_input

val make_budget_detail : ?budget_name:budget_name -> unit -> budget_detail

val make_list_budgets_for_resource_output :
  ?next_page_token:page_token -> ?budgets:budgets -> unit -> list_budgets_for_resource_output

val make_list_budgets_for_resource_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?accept_language:accept_language ->
  resource_id:id ->
  unit ->
  list_budgets_for_resource_input

val make_list_accepted_portfolio_shares_output :
  ?next_page_token:page_token ->
  ?portfolio_details:portfolio_details ->
  unit ->
  list_accepted_portfolio_shares_output

val make_list_accepted_portfolio_shares_input :
  ?portfolio_share_type:portfolio_share_type ->
  ?page_size:page_size_max100 ->
  ?page_token:page_token ->
  ?accept_language:accept_language ->
  unit ->
  list_accepted_portfolio_shares_input

val make_launch_path : ?name:portfolio_name -> ?id:id -> unit -> launch_path

val make_import_as_provisioned_product_output :
  ?record_detail:record_detail -> unit -> import_as_provisioned_product_output

val make_import_as_provisioned_product_input :
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  physical_id:physical_id ->
  provisioned_product_name:provisioned_product_name ->
  provisioning_artifact_id:id ->
  product_id:id ->
  unit ->
  import_as_provisioned_product_input

val make_get_provisioned_product_outputs_output :
  ?next_page_token:page_token ->
  ?outputs:record_outputs ->
  unit ->
  get_provisioned_product_outputs_output

val make_get_provisioned_product_outputs_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?output_keys:output_keys ->
  ?provisioned_product_name:provisioned_product_name ->
  ?provisioned_product_id:id ->
  ?accept_language:accept_language ->
  unit ->
  get_provisioned_product_outputs_input

val make_get_aws_organizations_access_status_output :
  ?access_status:access_status -> unit -> get_aws_organizations_access_status_output

val make_get_aws_organizations_access_status_input : unit -> unit

val make_failed_service_action_association :
  ?error_message:service_action_association_error_message ->
  ?error_code:service_action_association_error_code ->
  ?provisioning_artifact_id:id ->
  ?product_id:id ->
  ?service_action_id:id ->
  unit ->
  failed_service_action_association

val make_execution_parameter :
  ?default_values:execution_parameter_value_list ->
  ?type_:execution_parameter_type ->
  ?name:execution_parameter_key ->
  unit ->
  execution_parameter

val make_execute_provisioned_product_service_action_output :
  ?record_detail:record_detail -> unit -> execute_provisioned_product_service_action_output

val make_execute_provisioned_product_service_action_input :
  ?parameters:execution_parameter_map ->
  ?accept_language:accept_language ->
  execute_token:idempotency_token ->
  service_action_id:id ->
  provisioned_product_id:id ->
  unit ->
  execute_provisioned_product_service_action_input

val make_execute_provisioned_product_plan_output :
  ?record_detail:record_detail -> unit -> execute_provisioned_product_plan_output

val make_execute_provisioned_product_plan_input :
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  plan_id:id ->
  unit ->
  execute_provisioned_product_plan_input

val make_enable_aws_organizations_access_output : unit -> unit
val make_enable_aws_organizations_access_input : unit -> unit
val make_disassociate_tag_option_from_resource_output : unit -> unit

val make_disassociate_tag_option_from_resource_input :
  tag_option_id:tag_option_id ->
  resource_id:resource_id ->
  unit ->
  disassociate_tag_option_from_resource_input

val make_disassociate_service_action_from_provisioning_artifact_output : unit -> unit

val make_disassociate_service_action_from_provisioning_artifact_input :
  ?idempotency_token:idempotency_token ->
  ?accept_language:accept_language ->
  service_action_id:id ->
  provisioning_artifact_id:id ->
  product_id:id ->
  unit ->
  disassociate_service_action_from_provisioning_artifact_input

val make_disassociate_product_from_portfolio_output : unit -> unit

val make_disassociate_product_from_portfolio_input :
  ?accept_language:accept_language ->
  portfolio_id:id ->
  product_id:id ->
  unit ->
  disassociate_product_from_portfolio_input

val make_disassociate_principal_from_portfolio_output : unit -> unit

val make_disassociate_principal_from_portfolio_input :
  ?principal_type:principal_type ->
  ?accept_language:accept_language ->
  principal_ar_n:principal_ar_n ->
  portfolio_id:id ->
  unit ->
  disassociate_principal_from_portfolio_input

val make_disassociate_budget_from_resource_output : unit -> unit

val make_disassociate_budget_from_resource_input :
  resource_id:id -> budget_name:budget_name -> unit -> disassociate_budget_from_resource_input

val make_disable_aws_organizations_access_output : unit -> unit
val make_disable_aws_organizations_access_input : unit -> unit

val make_describe_tag_option_output :
  ?tag_option_detail:tag_option_detail -> unit -> describe_tag_option_output

val make_describe_tag_option_input : id:tag_option_id -> unit -> describe_tag_option_input

val make_describe_service_action_output :
  ?service_action_detail:service_action_detail -> unit -> describe_service_action_output

val make_describe_service_action_input :
  ?accept_language:accept_language -> id:id -> unit -> describe_service_action_input

val make_describe_service_action_execution_parameters_output :
  ?service_action_parameters:execution_parameters ->
  unit ->
  describe_service_action_execution_parameters_output

val make_describe_service_action_execution_parameters_input :
  ?accept_language:accept_language ->
  service_action_id:id ->
  provisioned_product_id:id ->
  unit ->
  describe_service_action_execution_parameters_input

val make_describe_record_output :
  ?next_page_token:page_token ->
  ?record_outputs:record_outputs ->
  ?record_detail:record_detail ->
  unit ->
  describe_record_output

val make_describe_record_input :
  ?page_size:page_size ->
  ?page_token:page_token ->
  ?accept_language:accept_language ->
  id:id ->
  unit ->
  describe_record_input

val make_describe_provisioning_parameters_output :
  ?provisioning_artifact_output_keys:provisioning_artifact_outputs ->
  ?provisioning_artifact_outputs:provisioning_artifact_outputs ->
  ?provisioning_artifact_preferences:provisioning_artifact_preferences ->
  ?tag_options:tag_option_summaries ->
  ?usage_instructions:usage_instructions ->
  ?constraint_summaries:constraint_summaries ->
  ?provisioning_artifact_parameters:provisioning_artifact_parameters ->
  unit ->
  describe_provisioning_parameters_output

val make_describe_provisioning_parameters_input :
  ?path_name:portfolio_display_name ->
  ?path_id:id ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?provisioning_artifact_id:id ->
  ?product_name:product_view_name ->
  ?product_id:id ->
  ?accept_language:accept_language ->
  unit ->
  describe_provisioning_parameters_input

val make_describe_provisioning_artifact_output :
  ?provisioning_artifact_parameters:provisioning_artifact_parameters ->
  ?status:status ->
  ?info:provisioning_artifact_info ->
  ?provisioning_artifact_detail:provisioning_artifact_detail ->
  unit ->
  describe_provisioning_artifact_output

val make_describe_provisioning_artifact_input :
  ?include_provisioning_artifact_parameters:boolean_ ->
  ?verbose:verbose ->
  ?product_name:product_view_name ->
  ?provisioning_artifact_name:provisioning_artifact_name ->
  ?product_id:id ->
  ?provisioning_artifact_id:id ->
  ?accept_language:accept_language ->
  unit ->
  describe_provisioning_artifact_input

val make_describe_provisioned_product_plan_output :
  ?next_page_token:page_token ->
  ?resource_changes:resource_changes ->
  ?provisioned_product_plan_details:provisioned_product_plan_details ->
  unit ->
  describe_provisioned_product_plan_output

val make_describe_provisioned_product_plan_input :
  ?page_token:page_token ->
  ?page_size:page_size ->
  ?accept_language:accept_language ->
  plan_id:id ->
  unit ->
  describe_provisioned_product_plan_input

val make_cloud_watch_dashboard : ?name:cloud_watch_dashboard_name -> unit -> cloud_watch_dashboard

val make_describe_provisioned_product_output :
  ?cloud_watch_dashboards:cloud_watch_dashboards ->
  ?provisioned_product_detail:provisioned_product_detail ->
  unit ->
  describe_provisioned_product_output

val make_describe_provisioned_product_input :
  ?name:provisioned_product_name ->
  ?id:id ->
  ?accept_language:accept_language ->
  unit ->
  describe_provisioned_product_input

val make_describe_product_view_output :
  ?provisioning_artifacts:provisioning_artifacts ->
  ?product_view_summary:product_view_summary ->
  unit ->
  describe_product_view_output

val make_describe_product_view_input :
  ?accept_language:accept_language -> id:id -> unit -> describe_product_view_input

val make_describe_product_output :
  ?launch_paths:launch_paths ->
  ?budgets:budgets ->
  ?provisioning_artifacts:provisioning_artifacts ->
  ?product_view_summary:product_view_summary ->
  unit ->
  describe_product_output

val make_describe_product_input :
  ?name:product_view_name ->
  ?id:id ->
  ?accept_language:accept_language ->
  unit ->
  describe_product_input

val make_describe_product_as_admin_output :
  ?budgets:budgets ->
  ?tag_options:tag_option_details ->
  ?tags:tags ->
  ?provisioning_artifact_summaries:provisioning_artifact_summaries ->
  ?product_view_detail:product_view_detail ->
  unit ->
  describe_product_as_admin_output

val make_describe_product_as_admin_input :
  ?source_portfolio_id:id ->
  ?name:product_view_name ->
  ?id:id ->
  ?accept_language:accept_language ->
  unit ->
  describe_product_as_admin_input

val make_describe_portfolio_shares_output :
  ?portfolio_share_details:portfolio_share_details ->
  ?next_page_token:page_token ->
  unit ->
  describe_portfolio_shares_output

val make_describe_portfolio_shares_input :
  ?page_size:page_size_max100 ->
  ?page_token:page_token ->
  type_:describe_portfolio_share_type ->
  portfolio_id:id ->
  unit ->
  describe_portfolio_shares_input

val make_describe_portfolio_share_status_output :
  ?share_details:share_details ->
  ?status:share_status ->
  ?organization_node_value:organization_node_value ->
  ?portfolio_id:id ->
  ?portfolio_share_token:id ->
  unit ->
  describe_portfolio_share_status_output

val make_describe_portfolio_share_status_input :
  portfolio_share_token:id -> unit -> describe_portfolio_share_status_input

val make_describe_portfolio_output :
  ?budgets:budgets ->
  ?tag_options:tag_option_details ->
  ?tags:tags ->
  ?portfolio_detail:portfolio_detail ->
  unit ->
  describe_portfolio_output

val make_describe_portfolio_input :
  ?accept_language:accept_language -> id:id -> unit -> describe_portfolio_input

val make_describe_copy_product_status_output :
  ?status_detail:status_detail ->
  ?target_product_id:id ->
  ?copy_product_status:copy_product_status ->
  unit ->
  describe_copy_product_status_output

val make_describe_copy_product_status_input :
  ?accept_language:accept_language ->
  copy_product_token:id ->
  unit ->
  describe_copy_product_status_input

val make_describe_constraint_output :
  ?status:status ->
  ?constraint_parameters:constraint_parameters ->
  ?constraint_detail:constraint_detail ->
  unit ->
  describe_constraint_output

val make_describe_constraint_input :
  ?accept_language:accept_language -> id:id -> unit -> describe_constraint_input

val make_delete_tag_option_output : unit -> unit
val make_delete_tag_option_input : id:tag_option_id -> unit -> delete_tag_option_input
val make_delete_service_action_output : unit -> unit

val make_delete_service_action_input :
  ?idempotency_token:idempotency_token ->
  ?accept_language:accept_language ->
  id:id ->
  unit ->
  delete_service_action_input

val make_delete_provisioning_artifact_output : unit -> unit

val make_delete_provisioning_artifact_input :
  ?accept_language:accept_language ->
  provisioning_artifact_id:id ->
  product_id:id ->
  unit ->
  delete_provisioning_artifact_input

val make_delete_provisioned_product_plan_output : unit -> unit

val make_delete_provisioned_product_plan_input :
  ?ignore_errors:ignore_errors ->
  ?accept_language:accept_language ->
  plan_id:id ->
  unit ->
  delete_provisioned_product_plan_input

val make_delete_product_output : unit -> unit

val make_delete_product_input :
  ?accept_language:accept_language -> id:id -> unit -> delete_product_input

val make_delete_portfolio_share_output :
  ?portfolio_share_token:id -> unit -> delete_portfolio_share_output

val make_delete_portfolio_share_input :
  ?organization_node:organization_node ->
  ?account_id:account_id ->
  ?accept_language:accept_language ->
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
  value:tag_option_value -> key:tag_option_key -> unit -> create_tag_option_input

val make_create_service_action_output :
  ?service_action_detail:service_action_detail -> unit -> create_service_action_output

val make_create_service_action_input :
  ?accept_language:accept_language ->
  ?description:service_action_description ->
  idempotency_token:idempotency_token ->
  definition:service_action_definition_map ->
  definition_type:service_action_definition_type ->
  name:service_action_name ->
  unit ->
  create_service_action_input

val make_create_provisioning_artifact_output :
  ?status:status ->
  ?info:provisioning_artifact_info ->
  ?provisioning_artifact_detail:provisioning_artifact_detail ->
  unit ->
  create_provisioning_artifact_output

val make_create_provisioning_artifact_input :
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  parameters:provisioning_artifact_properties ->
  product_id:id ->
  unit ->
  create_provisioning_artifact_input

val make_create_provisioned_product_plan_output :
  ?provisioning_artifact_id:id ->
  ?provisioned_product_name:provisioned_product_name ->
  ?provision_product_id:id ->
  ?plan_id:id ->
  ?plan_name:provisioned_product_plan_name ->
  unit ->
  create_provisioned_product_plan_output

val make_create_provisioned_product_plan_input :
  ?tags:tags ->
  ?provisioning_parameters:update_provisioning_parameters ->
  ?path_id:id ->
  ?notification_arns:notification_arns ->
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  provisioning_artifact_id:id ->
  provisioned_product_name:provisioned_product_name ->
  product_id:id ->
  plan_type:provisioned_product_plan_type ->
  plan_name:provisioned_product_plan_name ->
  unit ->
  create_provisioned_product_plan_input

val make_create_product_output :
  ?tags:tags ->
  ?provisioning_artifact_detail:provisioning_artifact_detail ->
  ?product_view_detail:product_view_detail ->
  unit ->
  create_product_output

val make_create_product_input :
  ?source_connection:source_connection ->
  ?provisioning_artifact_parameters:provisioning_artifact_properties ->
  ?tags:add_tags ->
  ?support_url:support_url ->
  ?support_email:support_email ->
  ?support_description:support_description ->
  ?distributor:product_view_owner ->
  ?description:product_view_short_description ->
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  product_type:product_type ->
  owner:product_view_owner ->
  name:product_view_name ->
  unit ->
  create_product_input

val make_create_portfolio_share_output :
  ?portfolio_share_token:id -> unit -> create_portfolio_share_output

val make_create_portfolio_share_input :
  ?share_principals:boolean_ ->
  ?share_tag_options:boolean_ ->
  ?organization_node:organization_node ->
  ?account_id:account_id ->
  ?accept_language:accept_language ->
  portfolio_id:id ->
  unit ->
  create_portfolio_share_input

val make_create_portfolio_output :
  ?tags:tags -> ?portfolio_detail:portfolio_detail -> unit -> create_portfolio_output

val make_create_portfolio_input :
  ?tags:add_tags ->
  ?description:portfolio_description ->
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  provider_name:provider_name ->
  display_name:portfolio_display_name ->
  unit ->
  create_portfolio_input

val make_create_constraint_output :
  ?status:status ->
  ?constraint_parameters:constraint_parameters ->
  ?constraint_detail:constraint_detail ->
  unit ->
  create_constraint_output

val make_create_constraint_input :
  ?description:constraint_description ->
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  type_:constraint_type ->
  parameters:constraint_parameters ->
  product_id:id ->
  portfolio_id:id ->
  unit ->
  create_constraint_input

val make_copy_product_output : ?copy_product_token:id -> unit -> copy_product_output

val make_copy_product_input :
  ?copy_options:copy_options ->
  ?source_provisioning_artifact_identifiers:source_provisioning_artifact_properties ->
  ?target_product_name:product_view_name ->
  ?target_product_id:id ->
  ?accept_language:accept_language ->
  idempotency_token:idempotency_token ->
  source_product_arn:product_arn ->
  unit ->
  copy_product_input

val make_batch_disassociate_service_action_from_provisioning_artifact_output :
  ?failed_service_action_associations:failed_service_action_associations ->
  unit ->
  batch_disassociate_service_action_from_provisioning_artifact_output

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
  tag_option_id:tag_option_id ->
  resource_id:resource_id ->
  unit ->
  associate_tag_option_with_resource_input

val make_associate_service_action_with_provisioning_artifact_output : unit -> unit

val make_associate_service_action_with_provisioning_artifact_input :
  ?idempotency_token:idempotency_token ->
  ?accept_language:accept_language ->
  service_action_id:id ->
  provisioning_artifact_id:id ->
  product_id:id ->
  unit ->
  associate_service_action_with_provisioning_artifact_input

val make_associate_product_with_portfolio_output : unit -> unit

val make_associate_product_with_portfolio_input :
  ?source_portfolio_id:id ->
  ?accept_language:accept_language ->
  portfolio_id:id ->
  product_id:id ->
  unit ->
  associate_product_with_portfolio_input

val make_associate_principal_with_portfolio_output : unit -> unit

val make_associate_principal_with_portfolio_input :
  ?accept_language:accept_language ->
  principal_type:principal_type ->
  principal_ar_n:principal_ar_n ->
  portfolio_id:id ->
  unit ->
  associate_principal_with_portfolio_input

val make_associate_budget_with_resource_output : unit -> unit

val make_associate_budget_with_resource_input :
  resource_id:id -> budget_name:budget_name -> unit -> associate_budget_with_resource_input

val make_accept_portfolio_share_output : unit -> unit

val make_accept_portfolio_share_input :
  ?portfolio_share_type:portfolio_share_type ->
  ?accept_language:accept_language ->
  portfolio_id:id ->
  unit ->
  accept_portfolio_share_input
