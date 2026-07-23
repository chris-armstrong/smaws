open Types

val make_access_policy_detail :
  ?type_:access_policy_type ->
  ?name:policy_name ->
  ?policy_version:policy_version ->
  ?description:policy_description ->
  ?policy:Smaws_Lib.Smithy_api.Types.document ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  access_policy_detail

val make_access_policy_stats :
  ?data_policy_count:Smaws_Lib.Smithy_api.Types.long -> unit -> access_policy_stats

val make_access_policy_summary :
  ?type_:access_policy_type ->
  ?name:policy_name ->
  ?policy_version:policy_version ->
  ?description:policy_description ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  access_policy_summary

val make_capacity_limits :
  ?max_indexing_capacity_in_oc_u:indexing_capacity_value ->
  ?max_search_capacity_in_oc_u:search_capacity_value ->
  unit ->
  capacity_limits

val make_account_settings_detail :
  ?capacity_limits:capacity_limits -> unit -> account_settings_detail

val make_collection_error_detail :
  ?id:collection_id ->
  ?name:collection_name ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  collection_error_detail

val make_fips_endpoints :
  ?collection_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?dashboard_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  fips_endpoints

val make_vector_options :
  serverless_vector_acceleration:serverless_vector_acceleration_status -> unit -> vector_options

val make_collection_detail :
  ?id:collection_id ->
  ?name:collection_name ->
  ?status:collection_status ->
  ?type_:collection_type ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?standby_replicas:standby_replicas ->
  ?deletion_protection:deletion_protection ->
  ?vector_options:vector_options ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?collection_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?dashboard_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?fips_endpoints:fips_endpoints ->
  ?failure_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?collection_group_name:collection_group_name ->
  unit ->
  collection_detail

val make_batch_get_collection_response :
  ?collection_details:collection_details ->
  ?collection_error_details:collection_error_details ->
  unit ->
  batch_get_collection_response

val make_batch_get_collection_request :
  ?ids:collection_ids -> ?names:collection_names -> unit -> batch_get_collection_request

val make_collection_group_error_detail :
  ?id:collection_group_id ->
  ?name:collection_group_name ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  collection_group_error_detail

val make_capacity_details :
  ?capacity_in_ocu:Smaws_Lib.Smithy_api.Types.float_ ->
  ?autoscaling_status:autoscaling_status ->
  unit ->
  capacity_details

val make_current_capacity :
  ?search:capacity_details -> ?indexing:capacity_details -> unit -> current_capacity

val make_collection_group_capacity_limits :
  ?max_indexing_capacity_in_oc_u:collection_group_max_indexing_capacity_value ->
  ?max_search_capacity_in_oc_u:collection_group_max_search_capacity_value ->
  ?min_indexing_capacity_in_oc_u:collection_group_min_indexing_capacity_value ->
  ?min_search_capacity_in_oc_u:collection_group_min_search_capacity_value ->
  unit ->
  collection_group_capacity_limits

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_collection_group_detail :
  ?id:collection_group_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:collection_group_name ->
  ?standby_replicas:standby_replicas ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tags ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?capacity_limits:collection_group_capacity_limits ->
  ?current_capacity:current_capacity ->
  ?number_of_collections:Smaws_Lib.Smithy_api.Types.integer ->
  ?generation:serverless_generation ->
  unit ->
  collection_group_detail

val make_batch_get_collection_group_response :
  ?collection_group_details:collection_group_details ->
  ?collection_group_error_details:collection_group_error_details ->
  unit ->
  batch_get_collection_group_response

val make_batch_get_collection_group_request :
  ?ids:collection_group_ids ->
  ?names:collection_group_names ->
  unit ->
  batch_get_collection_group_request

val make_effective_lifecycle_policy_error_detail :
  ?type_:lifecycle_policy_type ->
  ?resource:resource ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  effective_lifecycle_policy_error_detail

val make_effective_lifecycle_policy_detail :
  ?type_:lifecycle_policy_type ->
  ?resource:resource ->
  ?policy_name:policy_name ->
  ?resource_type:resource_type ->
  ?retention_period:Smaws_Lib.Smithy_api.Types.string_ ->
  ?no_min_retention_period:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  effective_lifecycle_policy_detail

val make_batch_get_effective_lifecycle_policy_response :
  ?effective_lifecycle_policy_details:effective_lifecycle_policy_details ->
  ?effective_lifecycle_policy_error_details:effective_lifecycle_policy_error_details ->
  unit ->
  batch_get_effective_lifecycle_policy_response

val make_lifecycle_policy_resource_identifier :
  type_:lifecycle_policy_type ->
  resource:resource_name ->
  unit ->
  lifecycle_policy_resource_identifier

val make_batch_get_effective_lifecycle_policy_request :
  resource_identifiers:lifecycle_policy_resource_identifiers ->
  unit ->
  batch_get_effective_lifecycle_policy_request

val make_lifecycle_policy_error_detail :
  ?type_:lifecycle_policy_type ->
  ?name:policy_name ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  lifecycle_policy_error_detail

val make_lifecycle_policy_detail :
  ?type_:lifecycle_policy_type ->
  ?name:policy_name ->
  ?policy_version:policy_version ->
  ?description:policy_description ->
  ?policy:Smaws_Lib.Smithy_api.Types.document ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  lifecycle_policy_detail

val make_batch_get_lifecycle_policy_response :
  ?lifecycle_policy_details:lifecycle_policy_details ->
  ?lifecycle_policy_error_details:lifecycle_policy_error_details ->
  unit ->
  batch_get_lifecycle_policy_response

val make_lifecycle_policy_identifier :
  type_:lifecycle_policy_type -> name:policy_name -> unit -> lifecycle_policy_identifier

val make_batch_get_lifecycle_policy_request :
  identifiers:lifecycle_policy_identifiers -> unit -> batch_get_lifecycle_policy_request

val make_vpc_endpoint_error_detail :
  ?id:vpc_endpoint_id ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  vpc_endpoint_error_detail

val make_vpc_endpoint_detail :
  ?id:vpc_endpoint_id ->
  ?name:vpc_endpoint_name ->
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  ?security_group_ids:security_group_ids ->
  ?status:vpc_endpoint_status ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?failure_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  vpc_endpoint_detail

val make_batch_get_vpc_endpoint_response :
  ?vpc_endpoint_details:vpc_endpoint_details ->
  ?vpc_endpoint_error_details:vpc_endpoint_error_details ->
  unit ->
  batch_get_vpc_endpoint_response

val make_batch_get_vpc_endpoint_request :
  ids:vpc_endpoint_ids -> unit -> batch_get_vpc_endpoint_request

val make_collection_filters :
  ?name:collection_name ->
  ?status:collection_status ->
  ?collection_group_name:collection_group_name ->
  unit ->
  collection_filters

val make_collection_group_summary :
  ?id:collection_group_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:collection_group_name ->
  ?number_of_collections:Smaws_Lib.Smithy_api.Types.integer ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?capacity_limits:collection_group_capacity_limits ->
  ?generation:serverless_generation ->
  unit ->
  collection_group_summary

val make_collection_summary :
  ?id:collection_id ->
  ?name:collection_name ->
  ?status:collection_status ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?collection_group_name:collection_group_name ->
  unit ->
  collection_summary

val make_create_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit -> create_access_policy_response

val make_create_access_policy_request :
  ?description:policy_description ->
  ?client_token:client_token ->
  type_:access_policy_type ->
  name:policy_name ->
  policy:policy_document ->
  unit ->
  create_access_policy_request

val make_create_collection_detail :
  ?id:collection_id ->
  ?name:collection_name ->
  ?status:collection_status ->
  ?type_:collection_type ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?standby_replicas:standby_replicas ->
  ?deletion_protection:deletion_protection ->
  ?vector_options:vector_options ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?collection_group_name:collection_group_name ->
  unit ->
  create_collection_detail

val make_create_collection_response :
  ?create_collection_detail:create_collection_detail -> unit -> create_collection_response

val make_encryption_config :
  ?a_ws_owned_key:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?kms_key_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  encryption_config

val make_create_collection_request :
  ?type_:collection_type ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tags ->
  ?standby_replicas:standby_replicas ->
  ?vector_options:vector_options ->
  ?collection_group_name:collection_group_name ->
  ?encryption_config:encryption_config ->
  ?deletion_protection:deletion_protection ->
  ?client_token:client_token ->
  name:collection_name ->
  unit ->
  create_collection_request

val make_create_collection_group_detail :
  ?id:collection_group_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:collection_group_name ->
  ?standby_replicas:standby_replicas ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tags ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?capacity_limits:collection_group_capacity_limits ->
  ?generation:serverless_generation ->
  unit ->
  create_collection_group_detail

val make_create_collection_group_response :
  ?create_collection_group_detail:create_collection_group_detail ->
  unit ->
  create_collection_group_response

val make_create_collection_group_request :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tags ->
  ?capacity_limits:collection_group_capacity_limits ->
  ?generation:serverless_generation ->
  ?client_token:client_token ->
  name:collection_group_name ->
  standby_replicas:standby_replicas ->
  unit ->
  create_collection_group_request

val make_create_iam_identity_center_config_options :
  ?user_attribute:iam_identity_center_user_attribute ->
  ?group_attribute:iam_identity_center_group_attribute ->
  instance_arn:iam_identity_center_instance_arn ->
  unit ->
  create_iam_identity_center_config_options

val make_create_index_response : unit -> unit

val make_create_index_request :
  ?index_schema:index_schema ->
  id:collection_id ->
  index_name:index_name ->
  unit ->
  create_index_request

val make_create_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail -> unit -> create_lifecycle_policy_response

val make_create_lifecycle_policy_request :
  ?description:policy_description ->
  ?client_token:client_token ->
  type_:lifecycle_policy_type ->
  name:policy_name ->
  policy:policy_document ->
  unit ->
  create_lifecycle_policy_request

val make_iam_federation_config_options :
  ?group_attribute:iam_federation_group_attribute ->
  ?user_attribute:iam_federation_user_attribute ->
  unit ->
  iam_federation_config_options

val make_iam_identity_center_config_options :
  ?instance_arn:iam_identity_center_instance_arn ->
  ?application_arn:iam_identity_center_application_arn ->
  ?application_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?application_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?user_attribute:iam_identity_center_user_attribute ->
  ?group_attribute:iam_identity_center_group_attribute ->
  unit ->
  iam_identity_center_config_options

val make_saml_config_options :
  ?user_attribute:saml_user_attribute ->
  ?group_attribute:saml_group_attribute ->
  ?open_search_serverless_entity_id:open_search_serverless_entity_id ->
  ?session_timeout:Smaws_Lib.Smithy_api.Types.integer ->
  metadata:saml_metadata ->
  unit ->
  saml_config_options

val make_security_config_detail :
  ?id:security_config_id ->
  ?type_:security_config_type ->
  ?config_version:policy_version ->
  ?description:config_description ->
  ?saml_options:saml_config_options ->
  ?iam_identity_center_options:iam_identity_center_config_options ->
  ?iam_federation_options:iam_federation_config_options ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  security_config_detail

val make_create_security_config_response :
  ?security_config_detail:security_config_detail -> unit -> create_security_config_response

val make_create_security_config_request :
  ?description:config_description ->
  ?saml_options:saml_config_options ->
  ?iam_identity_center_options:create_iam_identity_center_config_options ->
  ?iam_federation_options:iam_federation_config_options ->
  ?client_token:client_token ->
  type_:security_config_type ->
  name:config_name ->
  unit ->
  create_security_config_request

val make_security_policy_detail :
  ?type_:security_policy_type ->
  ?name:policy_name ->
  ?policy_version:policy_version ->
  ?description:policy_description ->
  ?policy:Smaws_Lib.Smithy_api.Types.document ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  security_policy_detail

val make_create_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit -> create_security_policy_response

val make_create_security_policy_request :
  ?description:policy_description ->
  ?client_token:client_token ->
  type_:security_policy_type ->
  name:policy_name ->
  policy:policy_document ->
  unit ->
  create_security_policy_request

val make_create_vpc_endpoint_detail :
  ?id:vpc_endpoint_id ->
  ?name:vpc_endpoint_name ->
  ?status:vpc_endpoint_status ->
  unit ->
  create_vpc_endpoint_detail

val make_create_vpc_endpoint_response :
  ?create_vpc_endpoint_detail:create_vpc_endpoint_detail -> unit -> create_vpc_endpoint_response

val make_create_vpc_endpoint_request :
  ?security_group_ids:security_group_ids ->
  ?client_token:client_token ->
  name:vpc_endpoint_name ->
  vpc_id:vpc_id ->
  subnet_ids:subnet_ids ->
  unit ->
  create_vpc_endpoint_request

val make_delete_access_policy_response : unit -> unit

val make_delete_access_policy_request :
  ?client_token:client_token ->
  type_:access_policy_type ->
  name:policy_name ->
  unit ->
  delete_access_policy_request

val make_delete_collection_detail :
  ?id:collection_id ->
  ?name:collection_name ->
  ?status:collection_status ->
  ?deletion_protection:deletion_protection ->
  unit ->
  delete_collection_detail

val make_delete_collection_response :
  ?delete_collection_detail:delete_collection_detail -> unit -> delete_collection_response

val make_delete_collection_request :
  ?client_token:client_token -> id:collection_id -> unit -> delete_collection_request

val make_delete_collection_group_response : unit -> unit

val make_delete_collection_group_request :
  ?client_token:client_token -> id:collection_group_id -> unit -> delete_collection_group_request

val make_delete_index_response : unit -> unit

val make_delete_index_request :
  id:collection_id -> index_name:index_name -> unit -> delete_index_request

val make_delete_lifecycle_policy_response : unit -> unit

val make_delete_lifecycle_policy_request :
  ?client_token:client_token ->
  type_:lifecycle_policy_type ->
  name:policy_name ->
  unit ->
  delete_lifecycle_policy_request

val make_delete_security_config_response : unit -> unit

val make_delete_security_config_request :
  ?client_token:client_token -> id:security_config_id -> unit -> delete_security_config_request

val make_delete_security_policy_response : unit -> unit

val make_delete_security_policy_request :
  ?client_token:client_token ->
  type_:security_policy_type ->
  name:policy_name ->
  unit ->
  delete_security_policy_request

val make_delete_vpc_endpoint_detail :
  ?id:vpc_endpoint_id ->
  ?name:vpc_endpoint_name ->
  ?status:vpc_endpoint_status ->
  unit ->
  delete_vpc_endpoint_detail

val make_delete_vpc_endpoint_response :
  ?delete_vpc_endpoint_detail:delete_vpc_endpoint_detail -> unit -> delete_vpc_endpoint_response

val make_delete_vpc_endpoint_request :
  ?client_token:client_token -> id:vpc_endpoint_id -> unit -> delete_vpc_endpoint_request

val make_get_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit -> get_access_policy_response

val make_get_access_policy_request :
  type_:access_policy_type -> name:policy_name -> unit -> get_access_policy_request

val make_get_account_settings_response :
  ?account_settings_detail:account_settings_detail -> unit -> get_account_settings_response

val make_get_account_settings_request : unit -> unit
val make_get_index_response : ?index_schema:index_schema -> unit -> get_index_response
val make_get_index_request : id:collection_id -> index_name:index_name -> unit -> get_index_request

val make_lifecycle_policy_stats :
  ?retention_policy_count:Smaws_Lib.Smithy_api.Types.long -> unit -> lifecycle_policy_stats

val make_security_config_stats :
  ?saml_config_count:Smaws_Lib.Smithy_api.Types.long -> unit -> security_config_stats

val make_security_policy_stats :
  ?encryption_policy_count:Smaws_Lib.Smithy_api.Types.long ->
  ?network_policy_count:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  security_policy_stats

val make_get_policies_stats_response :
  ?access_policy_stats:access_policy_stats ->
  ?security_policy_stats:security_policy_stats ->
  ?security_config_stats:security_config_stats ->
  ?lifecycle_policy_stats:lifecycle_policy_stats ->
  ?total_policy_count:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  get_policies_stats_response

val make_get_policies_stats_request : unit -> unit

val make_get_security_config_response :
  ?security_config_detail:security_config_detail -> unit -> get_security_config_response

val make_get_security_config_request : id:security_config_id -> unit -> get_security_config_request

val make_get_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit -> get_security_policy_response

val make_get_security_policy_request :
  type_:security_policy_type -> name:policy_name -> unit -> get_security_policy_request

val make_lifecycle_policy_summary :
  ?type_:lifecycle_policy_type ->
  ?name:policy_name ->
  ?policy_version:policy_version ->
  ?description:policy_description ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  lifecycle_policy_summary

val make_list_access_policies_response :
  ?access_policy_summaries:access_policy_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_access_policies_response

val make_list_access_policies_request :
  ?resource:resource_filter ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  type_:access_policy_type ->
  unit ->
  list_access_policies_request

val make_list_collection_groups_response :
  ?collection_group_summaries:collection_group_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_collection_groups_response

val make_list_collection_groups_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_collection_groups_request

val make_list_collections_response :
  ?collection_summaries:collection_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_collections_response

val make_list_collections_request :
  ?collection_filters:collection_filters ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_collections_request

val make_list_lifecycle_policies_response :
  ?lifecycle_policy_summaries:lifecycle_policy_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_lifecycle_policies_response

val make_list_lifecycle_policies_request :
  ?resources:lifecycle_resource_filter ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  type_:lifecycle_policy_type ->
  unit ->
  list_lifecycle_policies_request

val make_security_config_summary :
  ?id:security_config_id ->
  ?type_:security_config_type ->
  ?config_version:policy_version ->
  ?description:config_description ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  security_config_summary

val make_list_security_configs_response :
  ?security_config_summaries:security_config_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_security_configs_response

val make_list_security_configs_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  type_:security_config_type ->
  unit ->
  list_security_configs_request

val make_security_policy_summary :
  ?type_:security_policy_type ->
  ?name:policy_name ->
  ?policy_version:policy_version ->
  ?description:policy_description ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  security_policy_summary

val make_list_security_policies_response :
  ?security_policy_summaries:security_policy_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_security_policies_response

val make_list_security_policies_request :
  ?resource:resource_filter ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  type_:security_policy_type ->
  unit ->
  list_security_policies_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_vpc_endpoint_summary :
  ?id:vpc_endpoint_id ->
  ?name:vpc_endpoint_name ->
  ?status:vpc_endpoint_status ->
  unit ->
  vpc_endpoint_summary

val make_list_vpc_endpoints_response :
  ?vpc_endpoint_summaries:vpc_endpoint_summaries ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_vpc_endpoints_response

val make_vpc_endpoint_filters : ?status:vpc_endpoint_status -> unit -> vpc_endpoint_filters

val make_list_vpc_endpoints_request :
  ?vpc_endpoint_filters:vpc_endpoint_filters ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_vpc_endpoints_request

val make_update_vpc_endpoint_detail :
  ?id:vpc_endpoint_id ->
  ?name:vpc_endpoint_name ->
  ?status:vpc_endpoint_status ->
  ?subnet_ids:subnet_ids ->
  ?security_group_ids:security_group_ids ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  update_vpc_endpoint_detail

val make_update_vpc_endpoint_response :
  ?update_vpc_endpoint_detail:update_vpc_endpoint_detail -> unit -> update_vpc_endpoint_response

val make_update_vpc_endpoint_request :
  ?add_subnet_ids:subnet_ids ->
  ?remove_subnet_ids:subnet_ids ->
  ?add_security_group_ids:security_group_ids ->
  ?remove_security_group_ids:security_group_ids ->
  ?client_token:client_token ->
  id:vpc_endpoint_id ->
  unit ->
  update_vpc_endpoint_request

val make_update_account_settings_response :
  ?account_settings_detail:account_settings_detail -> unit -> update_account_settings_response

val make_update_account_settings_request :
  ?capacity_limits:capacity_limits -> unit -> update_account_settings_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : resource_arn:arn -> tags:tags -> unit -> tag_resource_request

val make_update_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit -> update_access_policy_response

val make_update_access_policy_request :
  ?description:policy_description ->
  ?policy:policy_document ->
  ?client_token:client_token ->
  type_:access_policy_type ->
  name:policy_name ->
  policy_version:policy_version ->
  unit ->
  update_access_policy_request

val make_update_collection_detail :
  ?id:collection_id ->
  ?name:collection_name ->
  ?status:collection_status ->
  ?type_:collection_type ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vector_options:vector_options ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?deletion_protection:deletion_protection ->
  unit ->
  update_collection_detail

val make_update_collection_response :
  ?update_collection_detail:update_collection_detail -> unit -> update_collection_response

val make_update_collection_request :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vector_options:vector_options ->
  ?deletion_protection:deletion_protection ->
  ?client_token:client_token ->
  id:collection_id ->
  unit ->
  update_collection_request

val make_update_collection_group_detail :
  ?id:collection_group_id ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:collection_group_name ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?capacity_limits:collection_group_capacity_limits ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?generation:serverless_generation ->
  unit ->
  update_collection_group_detail

val make_update_collection_group_response :
  ?update_collection_group_detail:update_collection_group_detail ->
  unit ->
  update_collection_group_response

val make_update_collection_group_request :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?capacity_limits:collection_group_capacity_limits ->
  ?client_token:client_token ->
  id:collection_group_id ->
  unit ->
  update_collection_group_request

val make_update_iam_identity_center_config_options :
  ?user_attribute:iam_identity_center_user_attribute ->
  ?group_attribute:iam_identity_center_group_attribute ->
  unit ->
  update_iam_identity_center_config_options

val make_update_index_response : unit -> unit

val make_update_index_request :
  ?index_schema:index_schema ->
  id:collection_id ->
  index_name:index_name ->
  unit ->
  update_index_request

val make_update_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail -> unit -> update_lifecycle_policy_response

val make_update_lifecycle_policy_request :
  ?description:policy_description ->
  ?policy:policy_document ->
  ?client_token:client_token ->
  type_:lifecycle_policy_type ->
  name:policy_name ->
  policy_version:policy_version ->
  unit ->
  update_lifecycle_policy_request

val make_update_security_config_response :
  ?security_config_detail:security_config_detail -> unit -> update_security_config_response

val make_update_security_config_request :
  ?description:config_description ->
  ?saml_options:saml_config_options ->
  ?iam_identity_center_options_updates:update_iam_identity_center_config_options ->
  ?iam_federation_options:iam_federation_config_options ->
  ?client_token:client_token ->
  id:security_config_id ->
  config_version:policy_version ->
  unit ->
  update_security_config_request

val make_update_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit -> update_security_policy_response

val make_update_security_policy_request :
  ?description:policy_description ->
  ?policy:policy_document ->
  ?client_token:client_token ->
  type_:security_policy_type ->
  name:policy_name ->
  policy_version:policy_version ->
  unit ->
  update_security_policy_request
