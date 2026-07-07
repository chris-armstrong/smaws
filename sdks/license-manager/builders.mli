open Types

val make_update_service_settings_response : unit -> unit

val make_organization_configuration :
  enable_integration:boolean_ -> unit -> organization_configuration

val make_update_service_settings_request :
  ?enabled_discovery_source_regions:string_list ->
  ?enable_cross_accounts_discovery:box_boolean ->
  ?organization_configuration:organization_configuration ->
  ?sns_topic_arn:string_ ->
  ?s3_bucket_arn:string_ ->
  unit ->
  update_service_settings_request

val make_update_license_specifications_for_resource_response : unit -> unit

val make_license_specification :
  ?ami_association_scope:string_ ->
  license_configuration_arn:string_ ->
  unit ->
  license_specification

val make_update_license_specifications_for_resource_request :
  ?remove_license_specifications:license_specifications ->
  ?add_license_specifications:license_specifications ->
  resource_arn:string_ ->
  unit ->
  update_license_specifications_for_resource_request

val make_update_license_manager_report_generator_response : unit -> unit

val make_report_context :
  ?report_end_date:date_time ->
  ?report_start_date:date_time ->
  ?license_asset_group_arns:arn_list ->
  ?license_configuration_arns:arn_list ->
  unit ->
  report_context

val make_report_frequency :
  ?period:report_frequency_type -> ?value:integer -> unit -> report_frequency

val make_update_license_manager_report_generator_request :
  ?description:string_ ->
  client_token:client_request_token ->
  report_frequency:report_frequency ->
  report_context:report_context ->
  type_:report_type_list ->
  report_generator_name:report_generator_name ->
  license_manager_report_generator_arn:string_ ->
  unit ->
  update_license_manager_report_generator_request

val make_update_license_configuration_response : unit -> unit

val make_product_information_filter :
  ?product_information_filter_value:string_list ->
  product_information_filter_comparator:string_ ->
  product_information_filter_name:string_ ->
  unit ->
  product_information_filter

val make_product_information :
  product_information_filter_list:product_information_filter_list ->
  resource_type:string_ ->
  unit ->
  product_information

val make_update_license_configuration_request :
  ?license_expiry:box_long ->
  ?disassociate_when_not_found:box_boolean ->
  ?product_information_list:product_information_list ->
  ?description:string_ ->
  ?name:string_ ->
  ?license_count_hard_limit:box_boolean ->
  ?license_count:box_long ->
  ?license_rules:string_list ->
  ?license_configuration_status:license_configuration_status ->
  license_configuration_arn:string_ ->
  unit ->
  update_license_configuration_request

val make_update_license_asset_ruleset_response :
  license_asset_ruleset_arn:string_ -> unit -> update_license_asset_ruleset_response

val make_matching_rule_statement :
  value_to_match:string_list ->
  constraint_:string_ ->
  key_to_match:string_ ->
  unit ->
  matching_rule_statement

val make_script_rule_statement :
  script:string_ -> key_to_match:string_ -> unit -> script_rule_statement

val make_and_rule_statement :
  ?script_rule_statements:script_rule_statement_list ->
  ?matching_rule_statements:matching_rule_statement_list ->
  unit ->
  and_rule_statement

val make_or_rule_statement :
  ?script_rule_statements:script_rule_statement_list ->
  ?matching_rule_statements:matching_rule_statement_list ->
  unit ->
  or_rule_statement

val make_license_configuration_rule_statement :
  ?matching_rule_statement:matching_rule_statement ->
  ?or_rule_statement:or_rule_statement ->
  ?and_rule_statement:and_rule_statement ->
  unit ->
  license_configuration_rule_statement

val make_license_rule_statement :
  ?matching_rule_statement:matching_rule_statement ->
  ?or_rule_statement:or_rule_statement ->
  ?and_rule_statement:and_rule_statement ->
  unit ->
  license_rule_statement

val make_instance_rule_statement :
  ?script_rule_statement:script_rule_statement ->
  ?matching_rule_statement:matching_rule_statement ->
  ?or_rule_statement:or_rule_statement ->
  ?and_rule_statement:and_rule_statement ->
  unit ->
  instance_rule_statement

val make_rule_statement :
  ?instance_rule_statement:instance_rule_statement ->
  ?license_rule_statement:license_rule_statement ->
  ?license_configuration_rule_statement:license_configuration_rule_statement ->
  unit ->
  rule_statement

val make_license_asset_rule : rule_statement:rule_statement -> unit -> license_asset_rule

val make_update_license_asset_ruleset_request :
  ?description:license_asset_resource_description ->
  ?name:license_asset_resource_name ->
  client_token:string_ ->
  license_asset_ruleset_arn:arn ->
  rules:license_asset_rule_list ->
  unit ->
  update_license_asset_ruleset_request

val make_update_license_asset_group_response :
  status:string_ -> license_asset_group_arn:string_ -> unit -> update_license_asset_group_response

val make_license_asset_group_configuration :
  ?usage_dimension:string_ -> unit -> license_asset_group_configuration

val make_license_asset_group_property :
  value:string_ -> key:string_ -> unit -> license_asset_group_property

val make_update_license_asset_group_request :
  ?status:license_asset_group_status ->
  ?properties:license_asset_group_property_list ->
  ?license_asset_group_configurations:license_asset_group_configuration_list ->
  ?description:license_asset_resource_description ->
  ?name:license_asset_resource_name ->
  client_token:string_ ->
  license_asset_group_arn:arn ->
  associated_license_asset_ruleset_ar_ns:license_asset_ruleset_arn_list ->
  unit ->
  update_license_asset_group_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:string_ -> unit -> untag_resource_request

val make_token_data :
  ?status:string_ ->
  ?role_arns:arn_list ->
  ?token_properties:max_size3_string_list ->
  ?expiration_time:iso8601_date_time ->
  ?license_arn:string_ ->
  ?token_type:string_ ->
  ?token_id:string_ ->
  unit ->
  token_data

val make_tag_resource_response : unit -> unit
val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:string_ -> unit -> tag_resource_request

val make_cross_account_discovery_service_status :
  ?message:string_ -> unit -> cross_account_discovery_service_status

val make_region_status : ?status:string_ -> unit -> region_status

val make_cross_region_discovery_status :
  ?message:region_status_map -> unit -> cross_region_discovery_status

val make_service_status :
  ?cross_region_discovery:cross_region_discovery_status ->
  ?cross_account_discovery:cross_account_discovery_service_status ->
  unit ->
  service_status

val make_s3_location : ?key_prefix:string_ -> ?bucket:string_ -> unit -> s3_location

val make_resource_inventory :
  ?instance_type:string_ ->
  ?region:string_ ->
  ?host_id:string_ ->
  ?ami_id:string_ ->
  ?usage_operation:string_ ->
  ?marketplace_product_codes:string_list ->
  ?resource_owning_account_id:string_ ->
  ?platform_version:string_ ->
  ?platform:string_ ->
  ?resource_arn:string_ ->
  ?resource_type:resource_type ->
  ?resource_id:string_ ->
  unit ->
  resource_inventory

val make_report_generator :
  ?tags:tag_list ->
  ?create_time:string_ ->
  ?s3_location:s3_location ->
  ?description:string_ ->
  ?report_creator_account:string_ ->
  ?last_report_generation_time:string_ ->
  ?last_run_failure_reason:string_ ->
  ?last_run_status:string_ ->
  ?license_manager_report_generator_arn:string_ ->
  ?report_frequency:report_frequency ->
  ?report_context:report_context ->
  ?report_type:report_type_list ->
  ?report_generator_name:string_ ->
  unit ->
  report_generator

val make_reject_grant_response :
  ?version:string_ -> ?status:grant_status -> ?grant_arn:arn -> unit -> reject_grant_response

val make_reject_grant_request : grant_arn:arn -> unit -> reject_grant_request

val make_received_metadata :
  ?allowed_operations:allowed_operation_list ->
  ?received_status_reason:status_reason_message ->
  ?received_status:received_status ->
  unit ->
  received_metadata

val make_provisional_configuration :
  max_time_to_live_in_minutes:box_integer -> unit -> provisional_configuration

val make_product_code_list_item :
  product_code_type:product_code_type ->
  product_code_id:product_code_id ->
  unit ->
  product_code_list_item

val make_options : ?activation_override_behavior:activation_override_behavior -> unit -> options
val make_metadata : ?value:string_ -> ?name:string_ -> unit -> metadata

val make_managed_resource_summary :
  ?association_count:box_long -> ?resource_type:resource_type -> unit -> managed_resource_summary

val make_license_configuration_usage :
  ?consumed_licenses:box_long ->
  ?association_time:date_time ->
  ?resource_owner_id:string_ ->
  ?resource_status:string_ ->
  ?resource_type:resource_type ->
  ?resource_arn:string_ ->
  unit ->
  license_configuration_usage

val make_list_usage_for_license_configuration_response :
  ?next_token:string_ ->
  ?license_configuration_usage_list:license_configuration_usage_list ->
  unit ->
  list_usage_for_license_configuration_response

val make_filter : ?values:filter_values -> ?name:filter_name -> unit -> filter

val make_list_usage_for_license_configuration_request :
  ?filters:filters ->
  ?next_token:string_ ->
  ?max_results:box_integer ->
  license_configuration_arn:string_ ->
  unit ->
  list_usage_for_license_configuration_request

val make_list_tokens_response :
  ?next_token:string_ -> ?tokens:token_list -> unit -> list_tokens_response

val make_list_tokens_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  ?filters:filter_list ->
  ?token_ids:string_list ->
  unit ->
  list_tokens_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:string_ -> unit -> list_tags_for_resource_request

val make_list_resource_inventory_response :
  ?next_token:string_ ->
  ?resource_inventory_list:resource_inventory_list ->
  unit ->
  list_resource_inventory_response

val make_inventory_filter :
  ?value:string_ -> condition:inventory_filter_condition -> name:string_ -> unit -> inventory_filter

val make_list_resource_inventory_request :
  ?filters:inventory_filter_list ->
  ?next_token:string_ ->
  ?max_results:box_integer ->
  unit ->
  list_resource_inventory_request

val make_issuer_details :
  ?key_fingerprint:string_ -> ?sign_key:string_ -> ?name:string_ -> unit -> issuer_details

val make_datetime_range :
  ?end_:iso8601_date_time -> \#begin:iso8601_date_time -> unit -> datetime_range

val make_entitlement :
  ?allow_check_in:box_boolean ->
  ?overage:box_boolean ->
  ?max_count:long ->
  ?value:string_ ->
  unit_:entitlement_unit ->
  name:string_ ->
  unit ->
  entitlement

val make_borrow_configuration :
  max_time_to_live_in_minutes:box_integer ->
  allow_early_check_in:box_boolean ->
  unit ->
  borrow_configuration

val make_consumption_configuration :
  ?borrow_configuration:borrow_configuration ->
  ?provisional_configuration:provisional_configuration ->
  ?renew_type:renew_type ->
  unit ->
  consumption_configuration

val make_granted_license :
  ?received_metadata:received_metadata ->
  ?version:string_ ->
  ?create_time:iso8601_date_time ->
  ?license_metadata:metadata_list ->
  ?consumption_configuration:consumption_configuration ->
  ?entitlements:entitlement_list ->
  ?beneficiary:string_ ->
  ?validity:datetime_range ->
  ?status:license_status ->
  ?home_region:string_ ->
  ?issuer:issuer_details ->
  ?product_sk_u:string_ ->
  ?product_name:string_ ->
  ?license_name:string_ ->
  ?license_arn:arn ->
  unit ->
  granted_license

val make_list_received_licenses_response :
  ?next_token:string_ -> ?licenses:granted_license_list -> unit -> list_received_licenses_response

val make_list_received_licenses_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  ?filters:filter_list ->
  ?license_arns:arn_list ->
  unit ->
  list_received_licenses_request

val make_list_received_licenses_for_organization_response :
  ?next_token:string_ ->
  ?licenses:granted_license_list ->
  unit ->
  list_received_licenses_for_organization_response

val make_list_received_licenses_for_organization_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  ?filters:filter_list ->
  unit ->
  list_received_licenses_for_organization_request

val make_grant :
  ?options:options ->
  ?status_reason:status_reason_message ->
  granted_operations:allowed_operation_list ->
  version:string_ ->
  grant_status:grant_status ->
  home_region:string_ ->
  grantee_principal_arn:arn ->
  license_arn:arn ->
  parent_arn:arn ->
  grant_name:string_ ->
  grant_arn:arn ->
  unit ->
  grant

val make_list_received_grants_response :
  ?next_token:string_ -> ?grants:grant_list -> unit -> list_received_grants_response

val make_list_received_grants_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  ?filters:filter_list ->
  ?grant_arns:arn_list ->
  unit ->
  list_received_grants_request

val make_list_received_grants_for_organization_response :
  ?next_token:string_ ->
  ?grants:grant_list ->
  unit ->
  list_received_grants_for_organization_response

val make_list_received_grants_for_organization_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  ?filters:filter_list ->
  license_arn:arn ->
  unit ->
  list_received_grants_for_organization_request

val make_license :
  ?version:string_ ->
  ?create_time:iso8601_date_time ->
  ?license_metadata:metadata_list ->
  ?consumption_configuration:consumption_configuration ->
  ?entitlements:entitlement_list ->
  ?beneficiary:string_ ->
  ?validity:datetime_range ->
  ?status:license_status ->
  ?home_region:string_ ->
  ?issuer:issuer_details ->
  ?product_sk_u:string_ ->
  ?product_name:string_ ->
  ?license_name:string_ ->
  ?license_arn:arn ->
  unit ->
  license

val make_list_licenses_response :
  ?next_token:string_ -> ?licenses:license_list -> unit -> list_licenses_response

val make_list_licenses_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  ?filters:filter_list ->
  ?license_arns:arn_list ->
  unit ->
  list_licenses_request

val make_list_license_versions_response :
  ?next_token:string_ -> ?licenses:license_list -> unit -> list_license_versions_response

val make_list_license_versions_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  license_arn:arn ->
  unit ->
  list_license_versions_request

val make_list_license_specifications_for_resource_response :
  ?next_token:string_ ->
  ?license_specifications:license_specifications ->
  unit ->
  list_license_specifications_for_resource_response

val make_list_license_specifications_for_resource_request :
  ?next_token:string_ ->
  ?max_results:box_integer ->
  resource_arn:string_ ->
  unit ->
  list_license_specifications_for_resource_request

val make_list_license_manager_report_generators_response :
  ?next_token:string_ ->
  ?report_generators:report_generator_list ->
  unit ->
  list_license_manager_report_generators_response

val make_list_license_manager_report_generators_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  ?filters:filter_list ->
  unit ->
  list_license_manager_report_generators_request

val make_license_conversion_context :
  ?product_codes:product_code_list ->
  ?usage_operation:usage_operation ->
  unit ->
  license_conversion_context

val make_license_conversion_task :
  ?end_time:date_time ->
  ?license_conversion_time:date_time ->
  ?start_time:date_time ->
  ?status_message:string_ ->
  ?status:license_conversion_task_status ->
  ?destination_license_context:license_conversion_context ->
  ?source_license_context:license_conversion_context ->
  ?resource_arn:string_ ->
  ?license_conversion_task_id:license_conversion_task_id ->
  unit ->
  license_conversion_task

val make_list_license_conversion_tasks_response :
  ?next_token:string_ ->
  ?license_conversion_tasks:license_conversion_tasks ->
  unit ->
  list_license_conversion_tasks_response

val make_list_license_conversion_tasks_request :
  ?filters:filters ->
  ?max_results:box_integer ->
  ?next_token:string_ ->
  unit ->
  list_license_conversion_tasks_request

val make_consumed_license_summary :
  ?consumed_licenses:box_long -> ?resource_type:resource_type -> unit -> consumed_license_summary

val make_automated_discovery_information :
  ?last_run_time:date_time -> unit -> automated_discovery_information

val make_license_configuration :
  ?license_expiry:box_long ->
  ?automated_discovery_information:automated_discovery_information ->
  ?product_information_list:product_information_list ->
  ?managed_resource_summary_list:managed_resource_summary_list ->
  ?consumed_license_summary_list:consumed_license_summary_list ->
  ?owner_account_id:string_ ->
  ?status:string_ ->
  ?consumed_licenses:box_long ->
  ?disassociate_when_not_found:box_boolean ->
  ?license_count_hard_limit:box_boolean ->
  ?license_count:box_long ->
  ?license_rules:string_list ->
  ?license_counting_type:license_counting_type ->
  ?description:string_ ->
  ?name:string_ ->
  ?license_configuration_arn:string_ ->
  ?license_configuration_id:string_ ->
  unit ->
  license_configuration

val make_list_license_configurations_response :
  ?next_token:string_ ->
  ?license_configurations:license_configurations ->
  unit ->
  list_license_configurations_response

val make_list_license_configurations_request :
  ?filters:filters ->
  ?next_token:string_ ->
  ?max_results:box_integer ->
  ?license_configuration_arns:string_list ->
  unit ->
  list_license_configurations_request

val make_list_license_configurations_for_organization_response :
  ?next_token:string_ ->
  ?license_configurations:license_configurations ->
  unit ->
  list_license_configurations_for_organization_response

val make_list_license_configurations_for_organization_request :
  ?filters:filters ->
  ?next_token:string_ ->
  ?max_results:box_integer ->
  ?license_configuration_arns:string_list ->
  unit ->
  list_license_configurations_for_organization_request

val make_license_asset_ruleset :
  ?description:string_ ->
  license_asset_ruleset_arn:arn ->
  rules:license_asset_rule_list ->
  name:string_ ->
  unit ->
  license_asset_ruleset

val make_list_license_asset_rulesets_response :
  ?next_token:string_ ->
  ?license_asset_rulesets:license_asset_ruleset_list ->
  unit ->
  list_license_asset_rulesets_response

val make_list_license_asset_rulesets_request :
  ?next_token:string_ ->
  ?max_results:box_integer ->
  ?show_aws_managed_license_asset_rulesets:boolean_ ->
  ?filters:filters ->
  unit ->
  list_license_asset_rulesets_request

val make_license_asset_group :
  ?latest_resource_discovery_time:date_time ->
  ?latest_usage_analysis_time:date_time ->
  ?status_message:string_ ->
  ?properties:license_asset_group_property_list ->
  ?license_asset_group_configurations:license_asset_group_configuration_list ->
  ?description:string_ ->
  status:license_asset_group_status ->
  license_asset_group_arn:arn ->
  associated_license_asset_ruleset_ar_ns:license_asset_ruleset_arn_list ->
  name:string_ ->
  unit ->
  license_asset_group

val make_list_license_asset_groups_response :
  ?next_token:string_ ->
  ?license_asset_groups:license_asset_group_list ->
  unit ->
  list_license_asset_groups_response

val make_list_license_asset_groups_request :
  ?next_token:string_ ->
  ?max_results:box_integer ->
  ?filters:filters ->
  unit ->
  list_license_asset_groups_request

val make_license_operation_failure :
  ?metadata_list:metadata_list ->
  ?operation_requested_by:string_ ->
  ?resource_owner_id:string_ ->
  ?operation_name:string_ ->
  ?failure_time:date_time ->
  ?error_message:string_ ->
  ?resource_type:resource_type ->
  ?resource_arn:string_ ->
  unit ->
  license_operation_failure

val make_list_failures_for_license_configuration_operations_response :
  ?next_token:string_ ->
  ?license_operation_failure_list:license_operation_failure_list ->
  unit ->
  list_failures_for_license_configuration_operations_response

val make_list_failures_for_license_configuration_operations_request :
  ?next_token:string_ ->
  ?max_results:box_integer ->
  license_configuration_arn:string_ ->
  unit ->
  list_failures_for_license_configuration_operations_request

val make_list_distributed_grants_response :
  ?next_token:string_ -> ?grants:grant_list -> unit -> list_distributed_grants_response

val make_list_distributed_grants_request :
  ?max_results:max_size100 ->
  ?next_token:string_ ->
  ?filters:filter_list ->
  ?grant_arns:arn_list ->
  unit ->
  list_distributed_grants_request

val make_license_configuration_association :
  ?ami_association_scope:string_ ->
  ?association_time:date_time ->
  ?resource_owner_id:string_ ->
  ?resource_type:resource_type ->
  ?resource_arn:string_ ->
  unit ->
  license_configuration_association

val make_list_associations_for_license_configuration_response :
  ?next_token:string_ ->
  ?license_configuration_associations:license_configuration_associations ->
  unit ->
  list_associations_for_license_configuration_response

val make_list_associations_for_license_configuration_request :
  ?next_token:string_ ->
  ?max_results:box_integer ->
  license_configuration_arn:string_ ->
  unit ->
  list_associations_for_license_configuration_request

val make_asset : ?latest_asset_discovery_time:date_time -> ?asset_arn:string_ -> unit -> asset

val make_list_assets_for_license_asset_group_response :
  ?next_token:string_ -> ?assets:asset_list -> unit -> list_assets_for_license_asset_group_response

val make_list_assets_for_license_asset_group_request :
  ?next_token:string_ ->
  ?max_results:box_integer ->
  asset_type:string_ ->
  license_asset_group_arn:string_ ->
  unit ->
  list_assets_for_license_asset_group_request

val make_entitlement_usage :
  ?max_count:string_ ->
  unit_:entitlement_data_unit ->
  consumed_value:string_ ->
  name:string_ ->
  unit ->
  entitlement_usage

val make_license_usage : ?entitlement_usages:entitlement_usage_list -> unit -> license_usage
val make_issuer : ?sign_key:string_ -> name:string_ -> unit -> issuer

val make_get_service_settings_response :
  ?service_status:service_status ->
  ?cross_region_discovery_source_regions:string_list ->
  ?cross_region_discovery_home_region:string_ ->
  ?license_manager_resource_share_arn:string_ ->
  ?enable_cross_accounts_discovery:box_boolean ->
  ?organization_configuration:organization_configuration ->
  ?sns_topic_arn:string_ ->
  ?s3_bucket_arn:string_ ->
  unit ->
  get_service_settings_response

val make_get_service_settings_request : unit -> unit

val make_get_license_usage_response :
  ?license_usage:license_usage -> unit -> get_license_usage_response

val make_get_license_usage_request : license_arn:arn -> unit -> get_license_usage_request
val make_get_license_response : ?license:license -> unit -> get_license_response
val make_get_license_request : ?version:string_ -> license_arn:arn -> unit -> get_license_request

val make_get_license_manager_report_generator_response :
  ?report_generator:report_generator -> unit -> get_license_manager_report_generator_response

val make_get_license_manager_report_generator_request :
  license_manager_report_generator_arn:string_ ->
  unit ->
  get_license_manager_report_generator_request

val make_get_license_conversion_task_response :
  ?end_time:date_time ->
  ?license_conversion_time:date_time ->
  ?start_time:date_time ->
  ?status:license_conversion_task_status ->
  ?status_message:string_ ->
  ?destination_license_context:license_conversion_context ->
  ?source_license_context:license_conversion_context ->
  ?resource_arn:string_ ->
  ?license_conversion_task_id:license_conversion_task_id ->
  unit ->
  get_license_conversion_task_response

val make_get_license_conversion_task_request :
  license_conversion_task_id:license_conversion_task_id ->
  unit ->
  get_license_conversion_task_request

val make_get_license_configuration_response :
  ?license_expiry:box_long ->
  ?disassociate_when_not_found:box_boolean ->
  ?automated_discovery_information:automated_discovery_information ->
  ?product_information_list:product_information_list ->
  ?tags:tag_list ->
  ?managed_resource_summary_list:managed_resource_summary_list ->
  ?consumed_license_summary_list:consumed_license_summary_list ->
  ?owner_account_id:string_ ->
  ?status:string_ ->
  ?consumed_licenses:box_long ->
  ?license_count_hard_limit:box_boolean ->
  ?license_count:box_long ->
  ?license_rules:string_list ->
  ?license_counting_type:license_counting_type ->
  ?description:string_ ->
  ?name:string_ ->
  ?license_configuration_arn:string_ ->
  ?license_configuration_id:string_ ->
  unit ->
  get_license_configuration_response

val make_get_license_configuration_request :
  license_configuration_arn:string_ -> unit -> get_license_configuration_request

val make_get_license_asset_ruleset_response :
  license_asset_ruleset:license_asset_ruleset -> unit -> get_license_asset_ruleset_response

val make_get_license_asset_ruleset_request :
  license_asset_ruleset_arn:arn -> unit -> get_license_asset_ruleset_request

val make_get_license_asset_group_response :
  license_asset_group:license_asset_group -> unit -> get_license_asset_group_response

val make_get_license_asset_group_request :
  license_asset_group_arn:arn -> unit -> get_license_asset_group_request

val make_get_grant_response : ?grant:grant -> unit -> get_grant_response
val make_get_grant_request : ?version:string_ -> grant_arn:arn -> unit -> get_grant_request
val make_get_access_token_response : ?access_token:token_string -> unit -> get_access_token_response

val make_get_access_token_request :
  ?token_properties:max_size3_string_list -> token:token_string -> unit -> get_access_token_request

val make_extend_license_consumption_response :
  ?expiration:iso8601_date_time ->
  ?license_consumption_token:string_ ->
  unit ->
  extend_license_consumption_response

val make_extend_license_consumption_request :
  ?dry_run:boolean_ ->
  license_consumption_token:string_ ->
  unit ->
  extend_license_consumption_request

val make_entitlement_data :
  ?value:string_ -> unit_:entitlement_data_unit -> name:string_ -> unit -> entitlement_data

val make_delete_token_response : unit -> unit
val make_delete_token_request : token_id:string_ -> unit -> delete_token_request

val make_delete_license_response :
  ?deletion_date:iso8601_date_time ->
  ?status:license_deletion_status ->
  unit ->
  delete_license_response

val make_delete_license_request :
  source_version:string_ -> license_arn:arn -> unit -> delete_license_request

val make_delete_license_manager_report_generator_response : unit -> unit

val make_delete_license_manager_report_generator_request :
  license_manager_report_generator_arn:string_ ->
  unit ->
  delete_license_manager_report_generator_request

val make_delete_license_configuration_response : unit -> unit

val make_delete_license_configuration_request :
  license_configuration_arn:string_ -> unit -> delete_license_configuration_request

val make_delete_license_asset_ruleset_response : unit -> unit

val make_delete_license_asset_ruleset_request :
  license_asset_ruleset_arn:arn -> unit -> delete_license_asset_ruleset_request

val make_delete_license_asset_group_response :
  status:license_asset_group_status -> unit -> delete_license_asset_group_response

val make_delete_license_asset_group_request :
  license_asset_group_arn:arn -> unit -> delete_license_asset_group_request

val make_delete_grant_response :
  ?version:string_ -> ?status:grant_status -> ?grant_arn:arn -> unit -> delete_grant_response

val make_delete_grant_request :
  ?status_reason:status_reason_message ->
  version:string_ ->
  grant_arn:arn ->
  unit ->
  delete_grant_request

val make_create_token_response :
  ?token:token_string ->
  ?token_type:token_type ->
  ?token_id:string_ ->
  unit ->
  create_token_response

val make_create_token_request :
  ?token_properties:max_size3_string_list ->
  ?expiration_in_days:integer ->
  ?role_arns:arn_list ->
  client_token:client_token ->
  license_arn:arn ->
  unit ->
  create_token_request

val make_create_license_version_response :
  ?status:license_status ->
  ?version:string_ ->
  ?license_arn:arn ->
  unit ->
  create_license_version_response

val make_create_license_version_request :
  ?source_version:string_ ->
  ?license_metadata:metadata_list ->
  client_token:client_token ->
  status:license_status ->
  consumption_configuration:consumption_configuration ->
  entitlements:entitlement_list ->
  validity:datetime_range ->
  home_region:string_ ->
  issuer:issuer ->
  product_name:string_ ->
  license_name:string_ ->
  license_arn:arn ->
  unit ->
  create_license_version_request

val make_create_license_response :
  ?version:string_ -> ?status:license_status -> ?license_arn:arn -> unit -> create_license_response

val make_create_license_request :
  ?tags:tag_list ->
  ?license_metadata:metadata_list ->
  client_token:client_token ->
  consumption_configuration:consumption_configuration ->
  beneficiary:string_ ->
  entitlements:entitlement_list ->
  validity:datetime_range ->
  home_region:string_ ->
  issuer:issuer ->
  product_sk_u:string_ ->
  product_name:string_ ->
  license_name:string_ ->
  unit ->
  create_license_request

val make_create_license_manager_report_generator_response :
  ?license_manager_report_generator_arn:string_ ->
  unit ->
  create_license_manager_report_generator_response

val make_create_license_manager_report_generator_request :
  ?tags:tag_list ->
  ?description:string_ ->
  client_token:client_request_token ->
  report_frequency:report_frequency ->
  report_context:report_context ->
  type_:report_type_list ->
  report_generator_name:report_generator_name ->
  unit ->
  create_license_manager_report_generator_request

val make_create_license_conversion_task_for_resource_response :
  ?license_conversion_task_id:license_conversion_task_id ->
  unit ->
  create_license_conversion_task_for_resource_response

val make_create_license_conversion_task_for_resource_request :
  destination_license_context:license_conversion_context ->
  source_license_context:license_conversion_context ->
  resource_arn:arn ->
  unit ->
  create_license_conversion_task_for_resource_request

val make_create_license_configuration_response :
  ?license_configuration_arn:string_ -> unit -> create_license_configuration_response

val make_create_license_configuration_request :
  ?license_expiry:box_long ->
  ?product_information_list:product_information_list ->
  ?disassociate_when_not_found:box_boolean ->
  ?tags:tag_list ->
  ?license_rules:string_list ->
  ?license_count_hard_limit:box_boolean ->
  ?license_count:box_long ->
  ?description:string_ ->
  license_counting_type:license_counting_type ->
  name:string_ ->
  unit ->
  create_license_configuration_request

val make_create_license_asset_ruleset_response :
  license_asset_ruleset_arn:string_ -> unit -> create_license_asset_ruleset_response

val make_create_license_asset_ruleset_request :
  ?tags:tag_list ->
  ?description:license_asset_resource_description ->
  client_token:string_ ->
  rules:license_asset_rule_list ->
  name:license_asset_resource_name ->
  unit ->
  create_license_asset_ruleset_request

val make_create_license_asset_group_response :
  status:string_ -> license_asset_group_arn:string_ -> unit -> create_license_asset_group_response

val make_create_license_asset_group_request :
  ?tags:tag_list ->
  ?properties:license_asset_group_property_list ->
  ?description:license_asset_resource_description ->
  client_token:string_ ->
  associated_license_asset_ruleset_ar_ns:license_asset_ruleset_arn_list ->
  license_asset_group_configurations:license_asset_group_configuration_list ->
  name:license_asset_resource_name ->
  unit ->
  create_license_asset_group_request

val make_create_grant_version_response :
  ?version:string_ ->
  ?status:grant_status ->
  ?grant_arn:arn ->
  unit ->
  create_grant_version_response

val make_create_grant_version_request :
  ?options:options ->
  ?source_version:string_ ->
  ?status_reason:status_reason_message ->
  ?status:grant_status ->
  ?allowed_operations:allowed_operation_list ->
  ?grant_name:string_ ->
  grant_arn:arn ->
  client_token:client_token ->
  unit ->
  create_grant_version_request

val make_create_grant_response :
  ?version:string_ -> ?status:grant_status -> ?grant_arn:arn -> unit -> create_grant_response

val make_create_grant_request :
  ?tags:tag_list ->
  allowed_operations:allowed_operation_list ->
  home_region:string_ ->
  principals:principal_arn_list ->
  license_arn:arn ->
  grant_name:string_ ->
  client_token:client_token ->
  unit ->
  create_grant_request

val make_checkout_license_response :
  ?license_arn:string_ ->
  ?expiration:iso8601_date_time ->
  ?issued_at:iso8601_date_time ->
  ?node_id:string_ ->
  ?signed_token:signed_token ->
  ?entitlements_allowed:entitlement_data_list ->
  ?license_consumption_token:string_ ->
  ?checkout_type:checkout_type ->
  unit ->
  checkout_license_response

val make_checkout_license_request :
  ?node_id:string_ ->
  ?beneficiary:string_ ->
  client_token:client_token ->
  entitlements:entitlement_data_list ->
  key_fingerprint:string_ ->
  checkout_type:checkout_type ->
  product_sk_u:string_ ->
  unit ->
  checkout_license_request

val make_checkout_borrow_license_response :
  ?checkout_metadata:metadata_list ->
  ?expiration:iso8601_date_time ->
  ?issued_at:iso8601_date_time ->
  ?signed_token:signed_token ->
  ?node_id:string_ ->
  ?entitlements_allowed:entitlement_data_list ->
  ?license_consumption_token:string_ ->
  ?license_arn:arn ->
  unit ->
  checkout_borrow_license_response

val make_checkout_borrow_license_request :
  ?checkout_metadata:metadata_list ->
  ?node_id:string_ ->
  client_token:client_token ->
  digital_signature_method:digital_signature_method ->
  entitlements:entitlement_data_list ->
  license_arn:arn ->
  unit ->
  checkout_borrow_license_request

val make_check_in_license_response : unit -> unit

val make_check_in_license_request :
  ?beneficiary:string_ -> license_consumption_token:string_ -> unit -> check_in_license_request

val make_accept_grant_response :
  ?version:string_ -> ?status:grant_status -> ?grant_arn:arn -> unit -> accept_grant_response

val make_accept_grant_request : grant_arn:arn -> unit -> accept_grant_request
