(** License Manager client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_service_settings_response : unit -> unit

val make_organization_configuration :
  enable_integration:boolean_ -> unit -> organization_configuration

val make_update_service_settings_request :
  ?s3_bucket_arn:string_ ->
  ?sns_topic_arn:string_ ->
  ?organization_configuration:organization_configuration ->
  ?enable_cross_accounts_discovery:box_boolean ->
  ?enabled_discovery_source_regions:string_list ->
  unit ->
  update_service_settings_request

val make_update_license_specifications_for_resource_response : unit -> unit

val make_license_specification :
  ?ami_association_scope:string_ ->
  license_configuration_arn:string_ ->
  unit ->
  license_specification

val make_update_license_specifications_for_resource_request :
  ?add_license_specifications:license_specifications ->
  ?remove_license_specifications:license_specifications ->
  resource_arn:string_ ->
  unit ->
  update_license_specifications_for_resource_request

val make_update_license_manager_report_generator_response : unit -> unit

val make_report_frequency :
  ?value:integer -> ?period:report_frequency_type -> unit -> report_frequency

val make_report_context :
  ?license_configuration_arns:arn_list ->
  ?license_asset_group_arns:arn_list ->
  ?report_start_date:date_time ->
  ?report_end_date:date_time ->
  unit ->
  report_context

val make_update_license_manager_report_generator_request :
  ?description:string_ ->
  license_manager_report_generator_arn:string_ ->
  report_generator_name:report_generator_name ->
  type_:report_type_list ->
  report_context:report_context ->
  report_frequency:report_frequency ->
  client_token:client_request_token ->
  unit ->
  update_license_manager_report_generator_request

val make_update_license_configuration_response : unit -> unit

val make_product_information_filter :
  ?product_information_filter_value:string_list ->
  product_information_filter_name:string_ ->
  product_information_filter_comparator:string_ ->
  unit ->
  product_information_filter

val make_product_information :
  resource_type:string_ ->
  product_information_filter_list:product_information_filter_list ->
  unit ->
  product_information

val make_update_license_configuration_request :
  ?license_configuration_status:license_configuration_status ->
  ?license_rules:string_list ->
  ?license_count:box_long ->
  ?license_count_hard_limit:box_boolean ->
  ?name:string_ ->
  ?description:string_ ->
  ?product_information_list:product_information_list ->
  ?disassociate_when_not_found:box_boolean ->
  ?license_expiry:box_long ->
  license_configuration_arn:string_ ->
  unit ->
  update_license_configuration_request

val make_update_license_asset_ruleset_response :
  license_asset_ruleset_arn:string_ -> unit -> update_license_asset_ruleset_response

val make_script_rule_statement :
  key_to_match:string_ -> script:string_ -> unit -> script_rule_statement

val make_matching_rule_statement :
  key_to_match:string_ ->
  constraint_:string_ ->
  value_to_match:string_list ->
  unit ->
  matching_rule_statement

val make_or_rule_statement :
  ?matching_rule_statements:matching_rule_statement_list ->
  ?script_rule_statements:script_rule_statement_list ->
  unit ->
  or_rule_statement

val make_and_rule_statement :
  ?matching_rule_statements:matching_rule_statement_list ->
  ?script_rule_statements:script_rule_statement_list ->
  unit ->
  and_rule_statement

val make_instance_rule_statement :
  ?and_rule_statement:and_rule_statement ->
  ?or_rule_statement:or_rule_statement ->
  ?matching_rule_statement:matching_rule_statement ->
  ?script_rule_statement:script_rule_statement ->
  unit ->
  instance_rule_statement

val make_license_rule_statement :
  ?and_rule_statement:and_rule_statement ->
  ?or_rule_statement:or_rule_statement ->
  ?matching_rule_statement:matching_rule_statement ->
  unit ->
  license_rule_statement

val make_license_configuration_rule_statement :
  ?and_rule_statement:and_rule_statement ->
  ?or_rule_statement:or_rule_statement ->
  ?matching_rule_statement:matching_rule_statement ->
  unit ->
  license_configuration_rule_statement

val make_rule_statement :
  ?license_configuration_rule_statement:license_configuration_rule_statement ->
  ?license_rule_statement:license_rule_statement ->
  ?instance_rule_statement:instance_rule_statement ->
  unit ->
  rule_statement

val make_license_asset_rule : rule_statement:rule_statement -> unit -> license_asset_rule

val make_update_license_asset_ruleset_request :
  ?name:license_asset_resource_name ->
  ?description:license_asset_resource_description ->
  rules:license_asset_rule_list ->
  license_asset_ruleset_arn:arn ->
  client_token:string_ ->
  unit ->
  update_license_asset_ruleset_request

val make_update_license_asset_group_response :
  license_asset_group_arn:string_ -> status:string_ -> unit -> update_license_asset_group_response

val make_license_asset_group_property :
  key:string_ -> value:string_ -> unit -> license_asset_group_property

val make_license_asset_group_configuration :
  ?usage_dimension:string_ -> unit -> license_asset_group_configuration

val make_update_license_asset_group_request :
  ?name:license_asset_resource_name ->
  ?description:license_asset_resource_description ->
  ?license_asset_group_configurations:license_asset_group_configuration_list ->
  ?properties:license_asset_group_property_list ->
  ?status:license_asset_group_status ->
  associated_license_asset_ruleset_ar_ns:license_asset_ruleset_arn_list ->
  license_asset_group_arn:arn ->
  client_token:string_ ->
  unit ->
  update_license_asset_group_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:string_ -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : ?key:string_ -> ?value:string_ -> unit -> tag

val make_tag_resource_request :
  resource_arn:string_ -> tags:tag_list -> unit -> tag_resource_request

val make_reject_grant_response :
  ?grant_arn:arn -> ?status:grant_status -> ?version:string_ -> unit -> reject_grant_response

val make_reject_grant_request : grant_arn:arn -> unit -> reject_grant_request

val make_license_configuration_usage :
  ?resource_arn:string_ ->
  ?resource_type:resource_type ->
  ?resource_status:string_ ->
  ?resource_owner_id:string_ ->
  ?association_time:date_time ->
  ?consumed_licenses:box_long ->
  unit ->
  license_configuration_usage

val make_list_usage_for_license_configuration_response :
  ?license_configuration_usage_list:license_configuration_usage_list ->
  ?next_token:string_ ->
  unit ->
  list_usage_for_license_configuration_response

val make_filter : ?name:filter_name -> ?values:filter_values -> unit -> filter

val make_list_usage_for_license_configuration_request :
  ?max_results:box_integer ->
  ?next_token:string_ ->
  ?filters:filters ->
  license_configuration_arn:string_ ->
  unit ->
  list_usage_for_license_configuration_request

val make_token_data :
  ?token_id:string_ ->
  ?token_type:string_ ->
  ?license_arn:string_ ->
  ?expiration_time:iso8601_date_time ->
  ?token_properties:max_size3_string_list ->
  ?role_arns:arn_list ->
  ?status:string_ ->
  unit ->
  token_data

val make_list_tokens_response :
  ?tokens:token_list -> ?next_token:string_ -> unit -> list_tokens_response

val make_list_tokens_request :
  ?token_ids:string_list ->
  ?filters:filter_list ->
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  unit ->
  list_tokens_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:string_ -> unit -> list_tags_for_resource_request

val make_resource_inventory :
  ?resource_id:string_ ->
  ?resource_type:resource_type ->
  ?resource_arn:string_ ->
  ?platform:string_ ->
  ?platform_version:string_ ->
  ?resource_owning_account_id:string_ ->
  ?marketplace_product_codes:string_list ->
  ?usage_operation:string_ ->
  ?ami_id:string_ ->
  ?host_id:string_ ->
  ?region:string_ ->
  ?instance_type:string_ ->
  unit ->
  resource_inventory

val make_list_resource_inventory_response :
  ?resource_inventory_list:resource_inventory_list ->
  ?next_token:string_ ->
  unit ->
  list_resource_inventory_response

val make_inventory_filter :
  ?value:string_ -> name:string_ -> condition:inventory_filter_condition -> unit -> inventory_filter

val make_list_resource_inventory_request :
  ?max_results:box_integer ->
  ?next_token:string_ ->
  ?filters:inventory_filter_list ->
  unit ->
  list_resource_inventory_request

val make_received_metadata :
  ?received_status:received_status ->
  ?received_status_reason:status_reason_message ->
  ?allowed_operations:allowed_operation_list ->
  unit ->
  received_metadata

val make_metadata : ?name:string_ -> ?value:string_ -> unit -> metadata

val make_borrow_configuration :
  allow_early_check_in:box_boolean ->
  max_time_to_live_in_minutes:box_integer ->
  unit ->
  borrow_configuration

val make_provisional_configuration :
  max_time_to_live_in_minutes:box_integer -> unit -> provisional_configuration

val make_consumption_configuration :
  ?renew_type:renew_type ->
  ?provisional_configuration:provisional_configuration ->
  ?borrow_configuration:borrow_configuration ->
  unit ->
  consumption_configuration

val make_entitlement :
  ?value:string_ ->
  ?max_count:long ->
  ?overage:box_boolean ->
  ?allow_check_in:box_boolean ->
  name:string_ ->
  unit_:entitlement_unit ->
  unit ->
  entitlement

val make_datetime_range :
  ?end_:iso8601_date_time -> \#begin:iso8601_date_time -> unit -> datetime_range

val make_issuer_details :
  ?name:string_ -> ?sign_key:string_ -> ?key_fingerprint:string_ -> unit -> issuer_details

val make_granted_license :
  ?license_arn:arn ->
  ?license_name:string_ ->
  ?product_name:string_ ->
  ?product_sk_u:string_ ->
  ?issuer:issuer_details ->
  ?home_region:string_ ->
  ?status:license_status ->
  ?validity:datetime_range ->
  ?beneficiary:string_ ->
  ?entitlements:entitlement_list ->
  ?consumption_configuration:consumption_configuration ->
  ?license_metadata:metadata_list ->
  ?create_time:iso8601_date_time ->
  ?version:string_ ->
  ?received_metadata:received_metadata ->
  unit ->
  granted_license

val make_list_received_licenses_for_organization_response :
  ?licenses:granted_license_list ->
  ?next_token:string_ ->
  unit ->
  list_received_licenses_for_organization_response

val make_list_received_licenses_for_organization_request :
  ?filters:filter_list ->
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  unit ->
  list_received_licenses_for_organization_request

val make_list_received_licenses_response :
  ?licenses:granted_license_list -> ?next_token:string_ -> unit -> list_received_licenses_response

val make_list_received_licenses_request :
  ?license_arns:arn_list ->
  ?filters:filter_list ->
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  unit ->
  list_received_licenses_request

val make_options : ?activation_override_behavior:activation_override_behavior -> unit -> options

val make_grant :
  ?status_reason:status_reason_message ->
  ?options:options ->
  grant_arn:arn ->
  grant_name:string_ ->
  parent_arn:arn ->
  license_arn:arn ->
  grantee_principal_arn:arn ->
  home_region:string_ ->
  grant_status:grant_status ->
  version:string_ ->
  granted_operations:allowed_operation_list ->
  unit ->
  grant

val make_list_received_grants_for_organization_response :
  ?grants:grant_list ->
  ?next_token:string_ ->
  unit ->
  list_received_grants_for_organization_response

val make_list_received_grants_for_organization_request :
  ?filters:filter_list ->
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  license_arn:arn ->
  unit ->
  list_received_grants_for_organization_request

val make_list_received_grants_response :
  ?grants:grant_list -> ?next_token:string_ -> unit -> list_received_grants_response

val make_list_received_grants_request :
  ?grant_arns:arn_list ->
  ?filters:filter_list ->
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  unit ->
  list_received_grants_request

val make_license :
  ?license_arn:arn ->
  ?license_name:string_ ->
  ?product_name:string_ ->
  ?product_sk_u:string_ ->
  ?issuer:issuer_details ->
  ?home_region:string_ ->
  ?status:license_status ->
  ?validity:datetime_range ->
  ?beneficiary:string_ ->
  ?entitlements:entitlement_list ->
  ?consumption_configuration:consumption_configuration ->
  ?license_metadata:metadata_list ->
  ?create_time:iso8601_date_time ->
  ?version:string_ ->
  unit ->
  license

val make_list_license_versions_response :
  ?licenses:license_list -> ?next_token:string_ -> unit -> list_license_versions_response

val make_list_license_versions_request :
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  license_arn:arn ->
  unit ->
  list_license_versions_request

val make_list_license_specifications_for_resource_response :
  ?license_specifications:license_specifications ->
  ?next_token:string_ ->
  unit ->
  list_license_specifications_for_resource_response

val make_list_license_specifications_for_resource_request :
  ?max_results:box_integer ->
  ?next_token:string_ ->
  resource_arn:string_ ->
  unit ->
  list_license_specifications_for_resource_request

val make_list_licenses_response :
  ?licenses:license_list -> ?next_token:string_ -> unit -> list_licenses_response

val make_list_licenses_request :
  ?license_arns:arn_list ->
  ?filters:filter_list ->
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  unit ->
  list_licenses_request

val make_s3_location : ?bucket:string_ -> ?key_prefix:string_ -> unit -> s3_location

val make_report_generator :
  ?report_generator_name:string_ ->
  ?report_type:report_type_list ->
  ?report_context:report_context ->
  ?report_frequency:report_frequency ->
  ?license_manager_report_generator_arn:string_ ->
  ?last_run_status:string_ ->
  ?last_run_failure_reason:string_ ->
  ?last_report_generation_time:string_ ->
  ?report_creator_account:string_ ->
  ?description:string_ ->
  ?s3_location:s3_location ->
  ?create_time:string_ ->
  ?tags:tag_list ->
  unit ->
  report_generator

val make_list_license_manager_report_generators_response :
  ?report_generators:report_generator_list ->
  ?next_token:string_ ->
  unit ->
  list_license_manager_report_generators_response

val make_list_license_manager_report_generators_request :
  ?filters:filter_list ->
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  unit ->
  list_license_manager_report_generators_request

val make_product_code_list_item :
  product_code_id:product_code_id ->
  product_code_type:product_code_type ->
  unit ->
  product_code_list_item

val make_license_conversion_context :
  ?usage_operation:usage_operation ->
  ?product_codes:product_code_list ->
  unit ->
  license_conversion_context

val make_license_conversion_task :
  ?license_conversion_task_id:license_conversion_task_id ->
  ?resource_arn:string_ ->
  ?source_license_context:license_conversion_context ->
  ?destination_license_context:license_conversion_context ->
  ?status:license_conversion_task_status ->
  ?status_message:string_ ->
  ?start_time:date_time ->
  ?license_conversion_time:date_time ->
  ?end_time:date_time ->
  unit ->
  license_conversion_task

val make_list_license_conversion_tasks_response :
  ?license_conversion_tasks:license_conversion_tasks ->
  ?next_token:string_ ->
  unit ->
  list_license_conversion_tasks_response

val make_list_license_conversion_tasks_request :
  ?next_token:string_ ->
  ?max_results:box_integer ->
  ?filters:filters ->
  unit ->
  list_license_conversion_tasks_request

val make_automated_discovery_information :
  ?last_run_time:date_time -> unit -> automated_discovery_information

val make_managed_resource_summary :
  ?resource_type:resource_type -> ?association_count:box_long -> unit -> managed_resource_summary

val make_consumed_license_summary :
  ?resource_type:resource_type -> ?consumed_licenses:box_long -> unit -> consumed_license_summary

val make_license_configuration :
  ?license_configuration_id:string_ ->
  ?license_configuration_arn:string_ ->
  ?name:string_ ->
  ?description:string_ ->
  ?license_counting_type:license_counting_type ->
  ?license_rules:string_list ->
  ?license_count:box_long ->
  ?license_count_hard_limit:box_boolean ->
  ?disassociate_when_not_found:box_boolean ->
  ?consumed_licenses:box_long ->
  ?status:string_ ->
  ?owner_account_id:string_ ->
  ?consumed_license_summary_list:consumed_license_summary_list ->
  ?managed_resource_summary_list:managed_resource_summary_list ->
  ?product_information_list:product_information_list ->
  ?automated_discovery_information:automated_discovery_information ->
  ?license_expiry:box_long ->
  unit ->
  license_configuration

val make_list_license_configurations_for_organization_response :
  ?license_configurations:license_configurations ->
  ?next_token:string_ ->
  unit ->
  list_license_configurations_for_organization_response

val make_list_license_configurations_for_organization_request :
  ?license_configuration_arns:string_list ->
  ?max_results:box_integer ->
  ?next_token:string_ ->
  ?filters:filters ->
  unit ->
  list_license_configurations_for_organization_request

val make_list_license_configurations_response :
  ?license_configurations:license_configurations ->
  ?next_token:string_ ->
  unit ->
  list_license_configurations_response

val make_list_license_configurations_request :
  ?license_configuration_arns:string_list ->
  ?max_results:box_integer ->
  ?next_token:string_ ->
  ?filters:filters ->
  unit ->
  list_license_configurations_request

val make_license_asset_ruleset :
  ?description:string_ ->
  name:string_ ->
  rules:license_asset_rule_list ->
  license_asset_ruleset_arn:arn ->
  unit ->
  license_asset_ruleset

val make_list_license_asset_rulesets_response :
  ?license_asset_rulesets:license_asset_ruleset_list ->
  ?next_token:string_ ->
  unit ->
  list_license_asset_rulesets_response

val make_list_license_asset_rulesets_request :
  ?filters:filters ->
  ?show_aws_managed_license_asset_rulesets:boolean_ ->
  ?max_results:box_integer ->
  ?next_token:string_ ->
  unit ->
  list_license_asset_rulesets_request

val make_license_asset_group :
  ?description:string_ ->
  ?license_asset_group_configurations:license_asset_group_configuration_list ->
  ?properties:license_asset_group_property_list ->
  ?status_message:string_ ->
  ?latest_usage_analysis_time:date_time ->
  ?latest_resource_discovery_time:date_time ->
  name:string_ ->
  associated_license_asset_ruleset_ar_ns:license_asset_ruleset_arn_list ->
  license_asset_group_arn:arn ->
  status:license_asset_group_status ->
  unit ->
  license_asset_group

val make_list_license_asset_groups_response :
  ?license_asset_groups:license_asset_group_list ->
  ?next_token:string_ ->
  unit ->
  list_license_asset_groups_response

val make_list_license_asset_groups_request :
  ?filters:filters ->
  ?max_results:box_integer ->
  ?next_token:string_ ->
  unit ->
  list_license_asset_groups_request

val make_license_operation_failure :
  ?resource_arn:string_ ->
  ?resource_type:resource_type ->
  ?error_message:string_ ->
  ?failure_time:date_time ->
  ?operation_name:string_ ->
  ?resource_owner_id:string_ ->
  ?operation_requested_by:string_ ->
  ?metadata_list:metadata_list ->
  unit ->
  license_operation_failure

val make_list_failures_for_license_configuration_operations_response :
  ?license_operation_failure_list:license_operation_failure_list ->
  ?next_token:string_ ->
  unit ->
  list_failures_for_license_configuration_operations_response

val make_list_failures_for_license_configuration_operations_request :
  ?max_results:box_integer ->
  ?next_token:string_ ->
  license_configuration_arn:string_ ->
  unit ->
  list_failures_for_license_configuration_operations_request

val make_list_distributed_grants_response :
  ?grants:grant_list -> ?next_token:string_ -> unit -> list_distributed_grants_response

val make_list_distributed_grants_request :
  ?grant_arns:arn_list ->
  ?filters:filter_list ->
  ?next_token:string_ ->
  ?max_results:max_size100 ->
  unit ->
  list_distributed_grants_request

val make_license_configuration_association :
  ?resource_arn:string_ ->
  ?resource_type:resource_type ->
  ?resource_owner_id:string_ ->
  ?association_time:date_time ->
  ?ami_association_scope:string_ ->
  unit ->
  license_configuration_association

val make_list_associations_for_license_configuration_response :
  ?license_configuration_associations:license_configuration_associations ->
  ?next_token:string_ ->
  unit ->
  list_associations_for_license_configuration_response

val make_list_associations_for_license_configuration_request :
  ?max_results:box_integer ->
  ?next_token:string_ ->
  license_configuration_arn:string_ ->
  unit ->
  list_associations_for_license_configuration_request

val make_asset : ?asset_arn:string_ -> ?latest_asset_discovery_time:date_time -> unit -> asset

val make_list_assets_for_license_asset_group_response :
  ?assets:asset_list -> ?next_token:string_ -> unit -> list_assets_for_license_asset_group_response

val make_list_assets_for_license_asset_group_request :
  ?max_results:box_integer ->
  ?next_token:string_ ->
  license_asset_group_arn:string_ ->
  asset_type:string_ ->
  unit ->
  list_assets_for_license_asset_group_request

val make_region_status : ?status:string_ -> unit -> region_status

val make_cross_region_discovery_status :
  ?message:region_status_map -> unit -> cross_region_discovery_status

val make_cross_account_discovery_service_status :
  ?message:string_ -> unit -> cross_account_discovery_service_status

val make_service_status :
  ?cross_account_discovery:cross_account_discovery_service_status ->
  ?cross_region_discovery:cross_region_discovery_status ->
  unit ->
  service_status

val make_get_service_settings_response :
  ?s3_bucket_arn:string_ ->
  ?sns_topic_arn:string_ ->
  ?organization_configuration:organization_configuration ->
  ?enable_cross_accounts_discovery:box_boolean ->
  ?license_manager_resource_share_arn:string_ ->
  ?cross_region_discovery_home_region:string_ ->
  ?cross_region_discovery_source_regions:string_list ->
  ?service_status:service_status ->
  unit ->
  get_service_settings_response

val make_get_service_settings_request : unit -> unit

val make_entitlement_usage :
  ?max_count:string_ ->
  name:string_ ->
  consumed_value:string_ ->
  unit_:entitlement_data_unit ->
  unit ->
  entitlement_usage

val make_license_usage : ?entitlement_usages:entitlement_usage_list -> unit -> license_usage

val make_get_license_usage_response :
  ?license_usage:license_usage -> unit -> get_license_usage_response

val make_get_license_usage_request : license_arn:arn -> unit -> get_license_usage_request

val make_get_license_manager_report_generator_response :
  ?report_generator:report_generator -> unit -> get_license_manager_report_generator_response

val make_get_license_manager_report_generator_request :
  license_manager_report_generator_arn:string_ ->
  unit ->
  get_license_manager_report_generator_request

val make_get_license_conversion_task_response :
  ?license_conversion_task_id:license_conversion_task_id ->
  ?resource_arn:string_ ->
  ?source_license_context:license_conversion_context ->
  ?destination_license_context:license_conversion_context ->
  ?status_message:string_ ->
  ?status:license_conversion_task_status ->
  ?start_time:date_time ->
  ?license_conversion_time:date_time ->
  ?end_time:date_time ->
  unit ->
  get_license_conversion_task_response

val make_get_license_conversion_task_request :
  license_conversion_task_id:license_conversion_task_id ->
  unit ->
  get_license_conversion_task_request

val make_get_license_configuration_response :
  ?license_configuration_id:string_ ->
  ?license_configuration_arn:string_ ->
  ?name:string_ ->
  ?description:string_ ->
  ?license_counting_type:license_counting_type ->
  ?license_rules:string_list ->
  ?license_count:box_long ->
  ?license_count_hard_limit:box_boolean ->
  ?consumed_licenses:box_long ->
  ?status:string_ ->
  ?owner_account_id:string_ ->
  ?consumed_license_summary_list:consumed_license_summary_list ->
  ?managed_resource_summary_list:managed_resource_summary_list ->
  ?tags:tag_list ->
  ?product_information_list:product_information_list ->
  ?automated_discovery_information:automated_discovery_information ->
  ?disassociate_when_not_found:box_boolean ->
  ?license_expiry:box_long ->
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

val make_get_license_response : ?license:license -> unit -> get_license_response
val make_get_license_request : ?version:string_ -> license_arn:arn -> unit -> get_license_request
val make_get_grant_response : ?grant:grant -> unit -> get_grant_response
val make_get_grant_request : ?version:string_ -> grant_arn:arn -> unit -> get_grant_request
val make_get_access_token_response : ?access_token:token_string -> unit -> get_access_token_response

val make_get_access_token_request :
  ?token_properties:max_size3_string_list -> token:token_string -> unit -> get_access_token_request

val make_extend_license_consumption_response :
  ?license_consumption_token:string_ ->
  ?expiration:iso8601_date_time ->
  unit ->
  extend_license_consumption_response

val make_extend_license_consumption_request :
  ?dry_run:boolean_ ->
  license_consumption_token:string_ ->
  unit ->
  extend_license_consumption_request

val make_delete_token_response : unit -> unit
val make_delete_token_request : token_id:string_ -> unit -> delete_token_request
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

val make_delete_license_response :
  ?status:license_deletion_status ->
  ?deletion_date:iso8601_date_time ->
  unit ->
  delete_license_response

val make_delete_license_request :
  license_arn:arn -> source_version:string_ -> unit -> delete_license_request

val make_delete_grant_response :
  ?grant_arn:arn -> ?status:grant_status -> ?version:string_ -> unit -> delete_grant_response

val make_delete_grant_request :
  ?status_reason:status_reason_message ->
  grant_arn:arn ->
  version:string_ ->
  unit ->
  delete_grant_request

val make_create_token_response :
  ?token_id:string_ ->
  ?token_type:token_type ->
  ?token:token_string ->
  unit ->
  create_token_response

val make_create_token_request :
  ?role_arns:arn_list ->
  ?expiration_in_days:integer ->
  ?token_properties:max_size3_string_list ->
  license_arn:arn ->
  client_token:client_token ->
  unit ->
  create_token_request

val make_create_license_version_response :
  ?license_arn:arn ->
  ?version:string_ ->
  ?status:license_status ->
  unit ->
  create_license_version_response

val make_issuer : ?sign_key:string_ -> name:string_ -> unit -> issuer

val make_create_license_version_request :
  ?license_metadata:metadata_list ->
  ?source_version:string_ ->
  license_arn:arn ->
  license_name:string_ ->
  product_name:string_ ->
  issuer:issuer ->
  home_region:string_ ->
  validity:datetime_range ->
  entitlements:entitlement_list ->
  consumption_configuration:consumption_configuration ->
  status:license_status ->
  client_token:client_token ->
  unit ->
  create_license_version_request

val make_create_license_manager_report_generator_response :
  ?license_manager_report_generator_arn:string_ ->
  unit ->
  create_license_manager_report_generator_response

val make_create_license_manager_report_generator_request :
  ?description:string_ ->
  ?tags:tag_list ->
  report_generator_name:report_generator_name ->
  type_:report_type_list ->
  report_context:report_context ->
  report_frequency:report_frequency ->
  client_token:client_request_token ->
  unit ->
  create_license_manager_report_generator_request

val make_create_license_conversion_task_for_resource_response :
  ?license_conversion_task_id:license_conversion_task_id ->
  unit ->
  create_license_conversion_task_for_resource_response

val make_create_license_conversion_task_for_resource_request :
  resource_arn:arn ->
  source_license_context:license_conversion_context ->
  destination_license_context:license_conversion_context ->
  unit ->
  create_license_conversion_task_for_resource_request

val make_create_license_configuration_response :
  ?license_configuration_arn:string_ -> unit -> create_license_configuration_response

val make_create_license_configuration_request :
  ?description:string_ ->
  ?license_count:box_long ->
  ?license_count_hard_limit:box_boolean ->
  ?license_rules:string_list ->
  ?tags:tag_list ->
  ?disassociate_when_not_found:box_boolean ->
  ?product_information_list:product_information_list ->
  ?license_expiry:box_long ->
  name:string_ ->
  license_counting_type:license_counting_type ->
  unit ->
  create_license_configuration_request

val make_create_license_asset_ruleset_response :
  license_asset_ruleset_arn:string_ -> unit -> create_license_asset_ruleset_response

val make_create_license_asset_ruleset_request :
  ?description:license_asset_resource_description ->
  ?tags:tag_list ->
  name:license_asset_resource_name ->
  rules:license_asset_rule_list ->
  client_token:string_ ->
  unit ->
  create_license_asset_ruleset_request

val make_create_license_asset_group_response :
  license_asset_group_arn:string_ -> status:string_ -> unit -> create_license_asset_group_response

val make_create_license_asset_group_request :
  ?description:license_asset_resource_description ->
  ?properties:license_asset_group_property_list ->
  ?tags:tag_list ->
  name:license_asset_resource_name ->
  license_asset_group_configurations:license_asset_group_configuration_list ->
  associated_license_asset_ruleset_ar_ns:license_asset_ruleset_arn_list ->
  client_token:string_ ->
  unit ->
  create_license_asset_group_request

val make_create_license_response :
  ?license_arn:arn -> ?status:license_status -> ?version:string_ -> unit -> create_license_response

val make_create_license_request :
  ?license_metadata:metadata_list ->
  ?tags:tag_list ->
  license_name:string_ ->
  product_name:string_ ->
  product_sk_u:string_ ->
  issuer:issuer ->
  home_region:string_ ->
  validity:datetime_range ->
  entitlements:entitlement_list ->
  beneficiary:string_ ->
  consumption_configuration:consumption_configuration ->
  client_token:client_token ->
  unit ->
  create_license_request

val make_create_grant_version_response :
  ?grant_arn:arn ->
  ?status:grant_status ->
  ?version:string_ ->
  unit ->
  create_grant_version_response

val make_create_grant_version_request :
  ?grant_name:string_ ->
  ?allowed_operations:allowed_operation_list ->
  ?status:grant_status ->
  ?status_reason:status_reason_message ->
  ?source_version:string_ ->
  ?options:options ->
  client_token:client_token ->
  grant_arn:arn ->
  unit ->
  create_grant_version_request

val make_create_grant_response :
  ?grant_arn:arn -> ?status:grant_status -> ?version:string_ -> unit -> create_grant_response

val make_create_grant_request :
  ?tags:tag_list ->
  client_token:client_token ->
  grant_name:string_ ->
  license_arn:arn ->
  principals:principal_arn_list ->
  home_region:string_ ->
  allowed_operations:allowed_operation_list ->
  unit ->
  create_grant_request

val make_entitlement_data :
  ?value:string_ -> name:string_ -> unit_:entitlement_data_unit -> unit -> entitlement_data

val make_checkout_license_response :
  ?checkout_type:checkout_type ->
  ?license_consumption_token:string_ ->
  ?entitlements_allowed:entitlement_data_list ->
  ?signed_token:signed_token ->
  ?node_id:string_ ->
  ?issued_at:iso8601_date_time ->
  ?expiration:iso8601_date_time ->
  ?license_arn:string_ ->
  unit ->
  checkout_license_response

val make_checkout_license_request :
  ?beneficiary:string_ ->
  ?node_id:string_ ->
  product_sk_u:string_ ->
  checkout_type:checkout_type ->
  key_fingerprint:string_ ->
  entitlements:entitlement_data_list ->
  client_token:client_token ->
  unit ->
  checkout_license_request

val make_checkout_borrow_license_response :
  ?license_arn:arn ->
  ?license_consumption_token:string_ ->
  ?entitlements_allowed:entitlement_data_list ->
  ?node_id:string_ ->
  ?signed_token:signed_token ->
  ?issued_at:iso8601_date_time ->
  ?expiration:iso8601_date_time ->
  ?checkout_metadata:metadata_list ->
  unit ->
  checkout_borrow_license_response

val make_checkout_borrow_license_request :
  ?node_id:string_ ->
  ?checkout_metadata:metadata_list ->
  license_arn:arn ->
  entitlements:entitlement_data_list ->
  digital_signature_method:digital_signature_method ->
  client_token:client_token ->
  unit ->
  checkout_borrow_license_request

val make_check_in_license_response : unit -> unit

val make_check_in_license_request :
  ?beneficiary:string_ -> license_consumption_token:string_ -> unit -> check_in_license_request

val make_accept_grant_response :
  ?grant_arn:arn -> ?status:grant_status -> ?version:string_ -> unit -> accept_grant_response

val make_accept_grant_request : grant_arn:arn -> unit -> accept_grant_request
(** {1:operations Operations} *)

module AcceptGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_grant_request ->
    ( accept_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_grant_request ->
    ( accept_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Accepts the specified grant.\n"]

module CheckInLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_in_license_request ->
    ( check_in_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_in_license_request ->
    ( check_in_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Checks in the specified license. Check in a license when it is no longer in use.\n"]

module CheckoutBorrowLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `EntitlementNotAllowedException of entitlement_not_allowed_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `UnsupportedDigitalSignatureMethodException of unsupported_digital_signature_method_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    checkout_borrow_license_request ->
    ( checkout_borrow_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `EntitlementNotAllowedException of entitlement_not_allowed_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `UnsupportedDigitalSignatureMethodException of
        unsupported_digital_signature_method_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    checkout_borrow_license_request ->
    ( checkout_borrow_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `EntitlementNotAllowedException of entitlement_not_allowed_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `UnsupportedDigitalSignatureMethodException of
        unsupported_digital_signature_method_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Checks out the specified license for offline use.\n"]

module CheckoutLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `UnsupportedDigitalSignatureMethodException of unsupported_digital_signature_method_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    checkout_license_request ->
    ( checkout_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `UnsupportedDigitalSignatureMethodException of
        unsupported_digital_signature_method_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    checkout_license_request ->
    ( checkout_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `UnsupportedDigitalSignatureMethodException of
        unsupported_digital_signature_method_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Checks out the specified license.\n\n\
  \  If the account that created the license is the same that is performing the check out, you \
   must specify the account as the beneficiary.\n\
  \  \n\
  \   "]

module CreateGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_grant_request ->
    ( create_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_grant_request ->
    ( create_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a grant for the specified license. A grant shares the use of license entitlements with \
   a specific Amazon Web Services account, an organization, or an organizational unit (OU). For \
   more information, see \
   {{:https://docs.aws.amazon.com/license-manager/latest/userguide/granted-licenses.html}Granted \
   licenses in License Manager} in the {i License Manager User Guide}.\n"]

module CreateGrantVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_grant_version_request ->
    ( create_grant_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_grant_version_request ->
    ( create_grant_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new version of the specified grant. For more information, see \
   {{:https://docs.aws.amazon.com/license-manager/latest/userguide/granted-licenses.html}Granted \
   licenses in License Manager} in the {i License Manager User Guide}.\n"]

module CreateLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_request ->
    ( create_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_request ->
    ( create_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a license.\n"]

module CreateLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_asset_group_request ->
    ( create_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_asset_group_request ->
    ( create_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a license asset group.\n"]

module CreateLicenseAssetRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_asset_ruleset_request ->
    ( create_license_asset_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_asset_ruleset_request ->
    ( create_license_asset_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a license asset ruleset.\n"]

module CreateLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_configuration_request ->
    ( create_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_configuration_request ->
    ( create_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a license configuration.\n\n\
  \ A license configuration is an abstraction of a customer license agreement that can be consumed \
   and enforced by License Manager. Components include specifications for the license type \
   (licensing by instance, socket, CPU, or vCPU), allowed tenancy (shared tenancy, Dedicated \
   Instance, Dedicated Host, or all of these), license affinity to host (how long a license must \
   be associated with a host), and the number of licenses purchased and used.\n\
  \ "]

module CreateLicenseConversionTaskForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_conversion_task_for_resource_request ->
    ( create_license_conversion_task_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_conversion_task_for_resource_request ->
    ( create_license_conversion_task_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new license conversion task.\n"]

module CreateLicenseManagerReportGenerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_manager_report_generator_request ->
    ( create_license_manager_report_generator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_manager_report_generator_request ->
    ( create_license_manager_report_generator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a report generator.\n"]

module CreateLicenseVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_version_request ->
    ( create_license_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_version_request ->
    ( create_license_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new version of the specified license.\n"]

module CreateToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_token_request ->
    ( create_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_token_request ->
    ( create_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a long-lived token.\n\n\
  \ A refresh token is a JWT token used to get an access token. With an access token, you can call \
   AssumeRoleWithWebIdentity to get role credentials that you can use to call License Manager to \
   manage the specified license.\n\
  \ "]

module DeleteGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_grant_request ->
    ( delete_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_grant_request ->
    ( delete_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified grant.\n"]

module DeleteLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_request ->
    ( delete_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_request ->
    ( delete_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified license.\n"]

module DeleteLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_asset_group_request ->
    ( delete_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_asset_group_request ->
    ( delete_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a license asset group.\n"]

module DeleteLicenseAssetRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_asset_ruleset_request ->
    ( delete_license_asset_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_asset_ruleset_request ->
    ( delete_license_asset_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a license asset ruleset.\n"]

module DeleteLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_configuration_request ->
    ( delete_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_configuration_request ->
    ( delete_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified license configuration.\n\n\
  \ You cannot delete a license configuration that is in use.\n\
  \ "]

module DeleteLicenseManagerReportGenerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_manager_report_generator_request ->
    ( delete_license_manager_report_generator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_manager_report_generator_request ->
    ( delete_license_manager_report_generator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified report generator.\n\n\
  \ This action deletes the report generator, which stops it from generating future reports. The \
   action cannot be reversed. It has no effect on the previous reports from this generator.\n\
  \ "]

module DeleteToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_token_request ->
    ( delete_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_token_request ->
    ( delete_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified token. Must be called in the license home Region.\n"]

module ExtendLicenseConsumption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    extend_license_consumption_request ->
    ( extend_license_consumption_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    extend_license_consumption_request ->
    ( extend_license_consumption_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Extends the expiration date for license consumption.\n"]

module GetAccessToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_access_token_request ->
    ( get_access_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_access_token_request ->
    ( get_access_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a temporary access token to use with AssumeRoleWithWebIdentity. Access tokens are valid \
   for one hour.\n"]

module GetGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_grant_request ->
    ( get_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_grant_request ->
    ( get_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about the specified grant.\n"]

module GetLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_request ->
    ( get_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_request ->
    ( get_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about the specified license.\n"]

module GetLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_asset_group_request ->
    ( get_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_asset_group_request ->
    ( get_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a license asset group.\n"]

module GetLicenseAssetRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_asset_ruleset_request ->
    ( get_license_asset_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_asset_ruleset_request ->
    ( get_license_asset_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a license asset ruleset.\n"]

module GetLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_configuration_request ->
    ( get_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_configuration_request ->
    ( get_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about the specified license configuration.\n"]

module GetLicenseConversionTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_conversion_task_request ->
    ( get_license_conversion_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_conversion_task_request ->
    ( get_license_conversion_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified license type conversion task.\n"]

module GetLicenseManagerReportGenerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_manager_report_generator_request ->
    ( get_license_manager_report_generator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_manager_report_generator_request ->
    ( get_license_manager_report_generator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified report generator.\n"]

module GetLicenseUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_usage_request ->
    ( get_license_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_usage_request ->
    ( get_license_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about the usage of the specified license.\n"]

module GetServiceSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_settings_request ->
    ( get_service_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_service_settings_request ->
    ( get_service_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the License Manager settings for the current Region.\n"]

module ListAssetsForLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assets_for_license_asset_group_request ->
    ( list_assets_for_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assets_for_license_asset_group_request ->
    ( list_assets_for_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists assets for a license asset group.\n"]

module ListAssociationsForLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associations_for_license_configuration_request ->
    ( list_associations_for_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associations_for_license_configuration_request ->
    ( list_associations_for_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the resource associations for the specified license configuration.\n\n\
  \ Resource associations need not consume licenses from a license configuration. For example, an \
   AMI or a stopped instance might not consume a license (depending on the license rules).\n\
  \ "]

module ListDistributedGrants : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_distributed_grants_request ->
    ( list_distributed_grants_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_distributed_grants_request ->
    ( list_distributed_grants_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the grants distributed for the specified license.\n"]

module ListFailuresForLicenseConfigurationOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_failures_for_license_configuration_operations_request ->
    ( list_failures_for_license_configuration_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_failures_for_license_configuration_operations_request ->
    ( list_failures_for_license_configuration_operations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the license configuration operations that failed.\n"]

module ListLicenseAssetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_asset_groups_request ->
    ( list_license_asset_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_asset_groups_request ->
    ( list_license_asset_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists license asset groups.\n"]

module ListLicenseAssetRulesets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_asset_rulesets_request ->
    ( list_license_asset_rulesets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_asset_rulesets_request ->
    ( list_license_asset_rulesets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists license asset rulesets.\n"]

module ListLicenseConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_configurations_request ->
    ( list_license_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_configurations_request ->
    ( list_license_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the license configurations for your account.\n"]

module ListLicenseConfigurationsForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_configurations_for_organization_request ->
    ( list_license_configurations_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_configurations_for_organization_request ->
    ( list_license_configurations_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists license configurations for an organization.\n"]

module ListLicenseConversionTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_conversion_tasks_request ->
    ( list_license_conversion_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_conversion_tasks_request ->
    ( list_license_conversion_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the license type conversion tasks for your account.\n"]

module ListLicenseManagerReportGenerators : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_manager_report_generators_request ->
    ( list_license_manager_report_generators_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_manager_report_generators_request ->
    ( list_license_manager_report_generators_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the report generators for your account.\n"]

module ListLicenses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_licenses_request ->
    ( list_licenses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_licenses_request ->
    ( list_licenses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the licenses for your account.\n"]

module ListLicenseSpecificationsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_specifications_for_resource_request ->
    ( list_license_specifications_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_specifications_for_resource_request ->
    ( list_license_specifications_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the license configurations for the specified resource.\n"]

module ListLicenseVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_versions_request ->
    ( list_license_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_versions_request ->
    ( list_license_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all versions of the specified license.\n"]

module ListReceivedGrants : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_received_grants_request ->
    ( list_received_grants_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_received_grants_request ->
    ( list_received_grants_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists grants that are received. Received grants are grants created while specifying the \
   recipient as this Amazon Web Services account, your organization, or an organizational unit \
   (OU) to which this member account belongs.\n"]

module ListReceivedGrantsForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_received_grants_for_organization_request ->
    ( list_received_grants_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_received_grants_for_organization_request ->
    ( list_received_grants_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the grants received for all accounts in the organization.\n"]

module ListReceivedLicenses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_received_licenses_request ->
    ( list_received_licenses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_received_licenses_request ->
    ( list_received_licenses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists received licenses.\n"]

module ListReceivedLicensesForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_received_licenses_for_organization_request ->
    ( list_received_licenses_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_received_licenses_for_organization_request ->
    ( list_received_licenses_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the licenses received for all accounts in the organization.\n"]

module ListResourceInventory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FailedDependencyException of failed_dependency_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_inventory_request ->
    ( list_resource_inventory_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FailedDependencyException of failed_dependency_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_inventory_request ->
    ( list_resource_inventory_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FailedDependencyException of failed_dependency_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists resources managed using Systems Manager inventory.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags for the specified resource. For more information about tagging support in \
   License Manager, see the \
   {{:https://docs.aws.amazon.com/license-manager/latest/APIReference/API_TagResource.html}TagResource} \
   operation.\n"]

module ListTokens : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tokens_request ->
    ( list_tokens_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tokens_request ->
    ( list_tokens_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists your tokens.\n"]

module ListUsageForLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_usage_for_license_configuration_request ->
    ( list_usage_for_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_usage_for_license_configuration_request ->
    ( list_usage_for_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all license usage records for a license configuration, displaying license consumption \
   details by resource at a selected point in time. Use this action to audit the current license \
   consumption for any license inventory and configuration.\n"]

module RejectGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_grant_request ->
    ( reject_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_grant_request ->
    ( reject_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rejects the specified grant.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified resource. The following resources support tagging in \
   License Manager:\n\n\
  \ {ul\n\
  \       {-  Licenses\n\
  \           \n\
  \            }\n\
  \       {-  Grants\n\
  \           \n\
  \            }\n\
  \       {-  License configurations\n\
  \           \n\
  \            }\n\
  \       {-  Report generators\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the specified tags from the specified resource.\n"]

module UpdateLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_asset_group_request ->
    ( update_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_asset_group_request ->
    ( update_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a license asset group.\n"]

module UpdateLicenseAssetRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_asset_ruleset_request ->
    ( update_license_asset_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_asset_ruleset_request ->
    ( update_license_asset_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a license asset ruleset.\n"]

module UpdateLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_configuration_request ->
    ( update_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_configuration_request ->
    ( update_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the attributes of an existing license configuration.\n"]

module UpdateLicenseManagerReportGenerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_manager_report_generator_request ->
    ( update_license_manager_report_generator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_manager_report_generator_request ->
    ( update_license_manager_report_generator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a report generator.\n\n\
  \ After you make changes to a report generator, it starts generating new reports within 60 \
   minutes of being updated.\n\
  \ "]

module UpdateLicenseSpecificationsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `LicenseUsageException of license_usage_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_specifications_for_resource_request ->
    ( update_license_specifications_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `LicenseUsageException of license_usage_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_specifications_for_resource_request ->
    ( update_license_specifications_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `LicenseUsageException of license_usage_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or removes the specified license configurations for the specified Amazon Web Services \
   resource.\n\n\
  \ You can update the license specifications of AMIs, instances, and hosts. You cannot update the \
   license specifications for launch templates and CloudFormation templates, as they send license \
   configurations to the operation that creates the resource.\n\
  \ "]

(** {1:Serialization and Deserialization} *)
module UpdateServiceSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_settings_request ->
    ( update_service_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_settings_request ->
    ( update_service_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates License Manager settings for the current Region.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
