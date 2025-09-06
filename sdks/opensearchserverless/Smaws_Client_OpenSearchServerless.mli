(** OpenSearchServerless client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_vpc_endpoint_summary :
  ?status:vpc_endpoint_status ->
  ?name:vpc_endpoint_name ->
  ?id:vpc_endpoint_id ->
  unit ->
  vpc_endpoint_summary

val make_vpc_endpoint_filters : ?status:vpc_endpoint_status -> unit -> vpc_endpoint_filters

val make_vpc_endpoint_error_detail :
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:vpc_endpoint_id ->
  unit ->
  vpc_endpoint_error_detail

val make_vpc_endpoint_detail :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?failure_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?status:vpc_endpoint_status ->
  ?security_group_ids:security_group_ids ->
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  ?name:vpc_endpoint_name ->
  ?id:vpc_endpoint_id ->
  unit ->
  vpc_endpoint_detail

val make_update_vpc_endpoint_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?security_group_ids:security_group_ids ->
  ?subnet_ids:subnet_ids ->
  ?status:vpc_endpoint_status ->
  ?name:vpc_endpoint_name ->
  ?id:vpc_endpoint_id ->
  unit ->
  update_vpc_endpoint_detail

val make_update_vpc_endpoint_response :
  ?update_vpc_endpoint_detail:update_vpc_endpoint_detail -> unit -> update_vpc_endpoint_response

val make_update_vpc_endpoint_request :
  ?client_token:client_token ->
  ?remove_security_group_ids:security_group_ids ->
  ?add_security_group_ids:security_group_ids ->
  ?remove_subnet_ids:subnet_ids ->
  ?add_subnet_ids:subnet_ids ->
  id:vpc_endpoint_id ->
  unit ->
  update_vpc_endpoint_request

val make_security_policy_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?policy:Smaws_Lib.Smithy_api.Types.document ->
  ?description:policy_description ->
  ?policy_version:policy_version ->
  ?name:policy_name ->
  ?type_:security_policy_type ->
  unit ->
  security_policy_detail

val make_update_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit -> update_security_policy_response

val make_update_security_policy_request :
  ?client_token:client_token ->
  ?policy:policy_document ->
  ?description:policy_description ->
  policy_version:policy_version ->
  name:policy_name ->
  type_:security_policy_type ->
  unit ->
  update_security_policy_request

val make_saml_config_options :
  ?session_timeout:Smaws_Lib.Smithy_api.Types.integer ->
  ?open_search_serverless_entity_id:open_search_serverless_entity_id ->
  ?group_attribute:saml_group_attribute ->
  ?user_attribute:saml_user_attribute ->
  metadata:saml_metadata ->
  unit ->
  saml_config_options

val make_iam_identity_center_config_options :
  ?group_attribute:iam_identity_center_group_attribute ->
  ?user_attribute:iam_identity_center_user_attribute ->
  ?application_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?application_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?application_arn:iam_identity_center_application_arn ->
  ?instance_arn:iam_identity_center_instance_arn ->
  unit ->
  iam_identity_center_config_options

val make_security_config_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?iam_identity_center_options:iam_identity_center_config_options ->
  ?saml_options:saml_config_options ->
  ?description:config_description ->
  ?config_version:policy_version ->
  ?type_:security_config_type ->
  ?id:security_config_id ->
  unit ->
  security_config_detail

val make_update_security_config_response :
  ?security_config_detail:security_config_detail -> unit -> update_security_config_response

val make_update_iam_identity_center_config_options :
  ?group_attribute:iam_identity_center_group_attribute ->
  ?user_attribute:iam_identity_center_user_attribute ->
  unit ->
  update_iam_identity_center_config_options

val make_update_security_config_request :
  ?client_token:client_token ->
  ?iam_identity_center_options_updates:update_iam_identity_center_config_options ->
  ?saml_options:saml_config_options ->
  ?description:config_description ->
  config_version:policy_version ->
  id:security_config_id ->
  unit ->
  update_security_config_request

val make_lifecycle_policy_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?policy:Smaws_Lib.Smithy_api.Types.document ->
  ?description:policy_description ->
  ?policy_version:policy_version ->
  ?name:policy_name ->
  ?type_:lifecycle_policy_type ->
  unit ->
  lifecycle_policy_detail

val make_update_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail -> unit -> update_lifecycle_policy_response

val make_update_lifecycle_policy_request :
  ?client_token:client_token ->
  ?policy:policy_document ->
  ?description:policy_description ->
  policy_version:policy_version ->
  name:policy_name ->
  type_:lifecycle_policy_type ->
  unit ->
  update_lifecycle_policy_request

val make_update_collection_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:collection_name ->
  ?id:collection_id ->
  unit ->
  update_collection_detail

val make_update_collection_response :
  ?update_collection_detail:update_collection_detail -> unit -> update_collection_response

val make_update_collection_request :
  ?client_token:client_token ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  id:collection_id ->
  unit ->
  update_collection_request

val make_capacity_limits :
  ?max_search_capacity_in_oc_u:search_capacity_value ->
  ?max_indexing_capacity_in_oc_u:indexing_capacity_value ->
  unit ->
  capacity_limits

val make_account_settings_detail :
  ?capacity_limits:capacity_limits -> unit -> account_settings_detail

val make_update_account_settings_response :
  ?account_settings_detail:account_settings_detail -> unit -> update_account_settings_response

val make_update_account_settings_request :
  ?capacity_limits:capacity_limits -> unit -> update_account_settings_request

val make_access_policy_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?policy:Smaws_Lib.Smithy_api.Types.document ->
  ?description:policy_description ->
  ?policy_version:policy_version ->
  ?name:policy_name ->
  ?type_:access_policy_type ->
  unit ->
  access_policy_detail

val make_update_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit -> update_access_policy_response

val make_update_access_policy_request :
  ?client_token:client_token ->
  ?policy:policy_document ->
  ?description:policy_description ->
  policy_version:policy_version ->
  name:policy_name ->
  type_:access_policy_type ->
  unit ->
  update_access_policy_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:arn -> unit -> untag_resource_request

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tags -> resource_arn:arn -> unit -> tag_resource_request

val make_security_policy_summary :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?description:policy_description ->
  ?policy_version:policy_version ->
  ?name:policy_name ->
  ?type_:security_policy_type ->
  unit ->
  security_policy_summary

val make_security_policy_stats :
  ?network_policy_count:Smaws_Lib.Smithy_api.Types.long ->
  ?encryption_policy_count:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  security_policy_stats

val make_security_config_summary :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?description:config_description ->
  ?config_version:policy_version ->
  ?type_:security_config_type ->
  ?id:security_config_id ->
  unit ->
  security_config_summary

val make_security_config_stats :
  ?saml_config_count:Smaws_Lib.Smithy_api.Types.long -> unit -> security_config_stats

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_access_policy_stats :
  ?data_policy_count:Smaws_Lib.Smithy_api.Types.long -> unit -> access_policy_stats

val make_lifecycle_policy_stats :
  ?retention_policy_count:Smaws_Lib.Smithy_api.Types.long -> unit -> lifecycle_policy_stats

val make_get_policies_stats_response :
  ?total_policy_count:Smaws_Lib.Smithy_api.Types.long ->
  ?lifecycle_policy_stats:lifecycle_policy_stats ->
  ?security_config_stats:security_config_stats ->
  ?security_policy_stats:security_policy_stats ->
  ?access_policy_stats:access_policy_stats ->
  unit ->
  get_policies_stats_response

val make_get_policies_stats_request : unit -> unit

val make_get_account_settings_response :
  ?account_settings_detail:account_settings_detail -> unit -> get_account_settings_response

val make_get_account_settings_request : unit -> unit

val make_create_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit -> create_security_policy_response

val make_create_security_policy_request :
  ?client_token:client_token ->
  ?description:policy_description ->
  policy:policy_document ->
  name:policy_name ->
  type_:security_policy_type ->
  unit ->
  create_security_policy_request

val make_create_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail -> unit -> create_lifecycle_policy_response

val make_create_lifecycle_policy_request :
  ?client_token:client_token ->
  ?description:policy_description ->
  policy:policy_document ->
  name:policy_name ->
  type_:lifecycle_policy_type ->
  unit ->
  create_lifecycle_policy_request

val make_batch_get_vpc_endpoint_response :
  ?vpc_endpoint_error_details:vpc_endpoint_error_details ->
  ?vpc_endpoint_details:vpc_endpoint_details ->
  unit ->
  batch_get_vpc_endpoint_response

val make_batch_get_vpc_endpoint_request :
  ids:vpc_endpoint_ids -> unit -> batch_get_vpc_endpoint_request

val make_lifecycle_policy_error_detail :
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:policy_name ->
  ?type_:lifecycle_policy_type ->
  unit ->
  lifecycle_policy_error_detail

val make_batch_get_lifecycle_policy_response :
  ?lifecycle_policy_error_details:lifecycle_policy_error_details ->
  ?lifecycle_policy_details:lifecycle_policy_details ->
  unit ->
  batch_get_lifecycle_policy_response

val make_lifecycle_policy_identifier :
  name:policy_name -> type_:lifecycle_policy_type -> unit -> lifecycle_policy_identifier

val make_batch_get_lifecycle_policy_request :
  identifiers:lifecycle_policy_identifiers -> unit -> batch_get_lifecycle_policy_request

val make_effective_lifecycle_policy_detail :
  ?no_min_retention_period:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?retention_period:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_type:resource_type ->
  ?policy_name:policy_name ->
  ?resource:resource ->
  ?type_:lifecycle_policy_type ->
  unit ->
  effective_lifecycle_policy_detail

val make_effective_lifecycle_policy_error_detail :
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource:resource ->
  ?type_:lifecycle_policy_type ->
  unit ->
  effective_lifecycle_policy_error_detail

val make_batch_get_effective_lifecycle_policy_response :
  ?effective_lifecycle_policy_error_details:effective_lifecycle_policy_error_details ->
  ?effective_lifecycle_policy_details:effective_lifecycle_policy_details ->
  unit ->
  batch_get_effective_lifecycle_policy_response

val make_lifecycle_policy_resource_identifier :
  resource:resource_name ->
  type_:lifecycle_policy_type ->
  unit ->
  lifecycle_policy_resource_identifier

val make_batch_get_effective_lifecycle_policy_request :
  resource_identifiers:lifecycle_policy_resource_identifiers ->
  unit ->
  batch_get_effective_lifecycle_policy_request

val make_collection_detail :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?failure_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?dashboard_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?collection_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?standby_replicas:standby_replicas ->
  ?kms_key_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:collection_name ->
  ?id:collection_id ->
  unit ->
  collection_detail

val make_collection_error_detail :
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:collection_name ->
  ?id:collection_id ->
  unit ->
  collection_error_detail

val make_batch_get_collection_response :
  ?collection_error_details:collection_error_details ->
  ?collection_details:collection_details ->
  unit ->
  batch_get_collection_response

val make_batch_get_collection_request :
  ?names:collection_names -> ?ids:collection_ids -> unit -> batch_get_collection_request

val make_list_vpc_endpoints_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_endpoint_summaries:vpc_endpoint_summaries ->
  unit ->
  list_vpc_endpoints_response

val make_list_vpc_endpoints_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_endpoint_filters:vpc_endpoint_filters ->
  unit ->
  list_vpc_endpoints_request

val make_list_security_policies_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?security_policy_summaries:security_policy_summaries ->
  unit ->
  list_security_policies_response

val make_list_security_policies_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource:resource_filter ->
  type_:security_policy_type ->
  unit ->
  list_security_policies_request

val make_list_security_configs_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?security_config_summaries:security_config_summaries ->
  unit ->
  list_security_configs_response

val make_list_security_configs_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:security_config_type ->
  unit ->
  list_security_configs_request

val make_lifecycle_policy_summary :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?description:policy_description ->
  ?policy_version:policy_version ->
  ?name:policy_name ->
  ?type_:lifecycle_policy_type ->
  unit ->
  lifecycle_policy_summary

val make_list_lifecycle_policies_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lifecycle_policy_summaries:lifecycle_policy_summaries ->
  unit ->
  list_lifecycle_policies_response

val make_list_lifecycle_policies_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resources:lifecycle_resource_filter ->
  type_:lifecycle_policy_type ->
  unit ->
  list_lifecycle_policies_request

val make_collection_summary :
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:collection_status ->
  ?name:collection_name ->
  ?id:collection_id ->
  unit ->
  collection_summary

val make_list_collections_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?collection_summaries:collection_summaries ->
  unit ->
  list_collections_response

val make_collection_filters :
  ?status:collection_status -> ?name:collection_name -> unit -> collection_filters

val make_list_collections_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?collection_filters:collection_filters ->
  unit ->
  list_collections_request

val make_access_policy_summary :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?description:policy_description ->
  ?policy_version:policy_version ->
  ?name:policy_name ->
  ?type_:access_policy_type ->
  unit ->
  access_policy_summary

val make_list_access_policies_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?access_policy_summaries:access_policy_summaries ->
  unit ->
  list_access_policies_response

val make_list_access_policies_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource:resource_filter ->
  type_:access_policy_type ->
  unit ->
  list_access_policies_request

val make_get_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit -> get_security_policy_response

val make_get_security_policy_request :
  name:policy_name -> type_:security_policy_type -> unit -> get_security_policy_request

val make_get_security_config_response :
  ?security_config_detail:security_config_detail -> unit -> get_security_config_response

val make_get_security_config_request : id:security_config_id -> unit -> get_security_config_request

val make_get_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit -> get_access_policy_response

val make_get_access_policy_request :
  name:policy_name -> type_:access_policy_type -> unit -> get_access_policy_request

val make_delete_vpc_endpoint_detail :
  ?status:vpc_endpoint_status ->
  ?name:vpc_endpoint_name ->
  ?id:vpc_endpoint_id ->
  unit ->
  delete_vpc_endpoint_detail

val make_delete_vpc_endpoint_response :
  ?delete_vpc_endpoint_detail:delete_vpc_endpoint_detail -> unit -> delete_vpc_endpoint_response

val make_delete_vpc_endpoint_request :
  ?client_token:client_token -> id:vpc_endpoint_id -> unit -> delete_vpc_endpoint_request

val make_delete_security_policy_response : unit -> unit

val make_delete_security_policy_request :
  ?client_token:client_token ->
  name:policy_name ->
  type_:security_policy_type ->
  unit ->
  delete_security_policy_request

val make_delete_security_config_response : unit -> unit

val make_delete_security_config_request :
  ?client_token:client_token -> id:security_config_id -> unit -> delete_security_config_request

val make_delete_lifecycle_policy_response : unit -> unit

val make_delete_lifecycle_policy_request :
  ?client_token:client_token ->
  name:policy_name ->
  type_:lifecycle_policy_type ->
  unit ->
  delete_lifecycle_policy_request

val make_delete_collection_detail :
  ?status:collection_status ->
  ?name:collection_name ->
  ?id:collection_id ->
  unit ->
  delete_collection_detail

val make_delete_collection_response :
  ?delete_collection_detail:delete_collection_detail -> unit -> delete_collection_response

val make_delete_collection_request :
  ?client_token:client_token -> id:collection_id -> unit -> delete_collection_request

val make_delete_access_policy_response : unit -> unit

val make_delete_access_policy_request :
  ?client_token:client_token ->
  name:policy_name ->
  type_:access_policy_type ->
  unit ->
  delete_access_policy_request

val make_create_vpc_endpoint_detail :
  ?status:vpc_endpoint_status ->
  ?name:vpc_endpoint_name ->
  ?id:vpc_endpoint_id ->
  unit ->
  create_vpc_endpoint_detail

val make_create_vpc_endpoint_response :
  ?create_vpc_endpoint_detail:create_vpc_endpoint_detail -> unit -> create_vpc_endpoint_response

val make_create_vpc_endpoint_request :
  ?client_token:client_token ->
  ?security_group_ids:security_group_ids ->
  subnet_ids:subnet_ids ->
  vpc_id:vpc_id ->
  name:vpc_endpoint_name ->
  unit ->
  create_vpc_endpoint_request

val make_create_security_config_response :
  ?security_config_detail:security_config_detail -> unit -> create_security_config_response

val make_create_iam_identity_center_config_options :
  ?group_attribute:iam_identity_center_group_attribute ->
  ?user_attribute:iam_identity_center_user_attribute ->
  instance_arn:iam_identity_center_instance_arn ->
  unit ->
  create_iam_identity_center_config_options

val make_create_security_config_request :
  ?client_token:client_token ->
  ?iam_identity_center_options:create_iam_identity_center_config_options ->
  ?saml_options:saml_config_options ->
  ?description:config_description ->
  name:config_name ->
  type_:security_config_type ->
  unit ->
  create_security_config_request

val make_create_collection_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.Types.long ->
  ?created_date:Smaws_Lib.Smithy_api.Types.long ->
  ?standby_replicas:standby_replicas ->
  ?kms_key_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:collection_name ->
  ?id:collection_id ->
  unit ->
  create_collection_detail

val make_create_collection_response :
  ?create_collection_detail:create_collection_detail -> unit -> create_collection_response

val make_create_collection_request :
  ?client_token:client_token ->
  ?standby_replicas:standby_replicas ->
  ?tags:tags ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:collection_type ->
  name:collection_name ->
  unit ->
  create_collection_request

val make_create_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit -> create_access_policy_response

val make_create_access_policy_request :
  ?client_token:client_token ->
  ?description:policy_description ->
  policy:policy_document ->
  name:policy_name ->
  type_:access_policy_type ->
  unit ->
  create_access_policy_request
(** {1:operations Operations} *)

module CreateAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    create_access_policy_request ->
    ( create_access_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a data access policy for OpenSearch Serverless. Access policies limit access to \
   collections and the resources within them, and allow a user to access that data irrespective of \
   the access mechanism or network source. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data \
   access control for Amazon OpenSearch Serverless}.\n"]

module CreateCollection : sig
  val request :
    Smaws_Lib.Context.t ->
    create_collection_request ->
    ( create_collection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `OcuLimitExceededException of ocu_limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a new OpenSearch Serverless collection. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating \
   and managing Amazon OpenSearch Serverless collections}.\n"]

module CreateSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    create_security_config_request ->
    ( create_security_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Specifies a security configuration for OpenSearch Serverless. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML \
   authentication for Amazon OpenSearch Serverless}. \n"]

module CreateVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
    create_vpc_endpoint_request ->
    ( create_vpc_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Creates an OpenSearch Serverless-managed interface VPC endpoint. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access \
   Amazon OpenSearch Serverless using an interface endpoint}.\n"]

module DeleteAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_access_policy_request ->
    ( delete_access_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes an OpenSearch Serverless access policy. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data \
   access control for Amazon OpenSearch Serverless}.\n"]

module DeleteCollection : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_collection_request ->
    ( delete_collection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes an OpenSearch Serverless collection. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating \
   and managing Amazon OpenSearch Serverless collections}.\n"]

module DeleteLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_lifecycle_policy_request ->
    ( delete_lifecycle_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes an OpenSearch Serverless lifecycle policy. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-delete}Deleting \
   data lifecycle policies}.\n"]

module DeleteSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_security_config_request ->
    ( delete_security_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes a security configuration for OpenSearch Serverless. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML \
   authentication for Amazon OpenSearch Serverless}.\n"]

module DeleteSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_security_policy_request ->
    ( delete_security_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Deletes an OpenSearch Serverless security policy.\n"]

module DeleteVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_vpc_endpoint_request ->
    ( delete_vpc_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes an OpenSearch Serverless-managed interface endpoint. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access \
   Amazon OpenSearch Serverless using an interface endpoint}.\n"]

module GetAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    get_access_policy_request ->
    ( get_access_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns an OpenSearch Serverless access policy. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data \
   access control for Amazon OpenSearch Serverless}.\n"]

module GetSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    get_security_config_request ->
    ( get_security_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns information about an OpenSearch Serverless security configuration. For more \
   information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML \
   authentication for Amazon OpenSearch Serverless}.\n"]

module GetSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    get_security_policy_request ->
    ( get_security_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns information about a configured OpenSearch Serverless security policy. For more \
   information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network \
   access for Amazon OpenSearch Serverless} and \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption \
   at rest for Amazon OpenSearch Serverless}.\n"]

module ListAccessPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
    list_access_policies_request ->
    ( list_access_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Returns information about a list of OpenSearch Serverless access policies.\n"]

module ListCollections : sig
  val request :
    Smaws_Lib.Context.t ->
    list_collections_request ->
    ( list_collections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Lists all OpenSearch Serverless collections. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating \
   and managing Amazon OpenSearch Serverless collections}.\n\n\
  \  Make sure to include an empty request body \\{\\} if you don't include any collection filters \
   in the request.\n\
  \  \n\
  \   "]

module ListLifecyclePolicies : sig
  val request :
    Smaws_Lib.Context.t ->
    list_lifecycle_policies_request ->
    ( list_lifecycle_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of OpenSearch Serverless lifecycle policies. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing \
   data lifecycle policies}.\n"]

module ListSecurityConfigs : sig
  val request :
    Smaws_Lib.Context.t ->
    list_security_configs_request ->
    ( list_security_configs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns information about configured OpenSearch Serverless security configurations. For more \
   information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML \
   authentication for Amazon OpenSearch Serverless}.\n"]

module ListSecurityPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
    list_security_policies_request ->
    ( list_security_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Returns information about configured OpenSearch Serverless security policies.\n"]

module ListVpcEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
    list_vpc_endpoints_request ->
    ( list_vpc_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the OpenSearch Serverless-managed interface VPC endpoints associated with the current \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access \
   Amazon OpenSearch Serverless using an interface endpoint}.\n"]

module BatchGetCollection : sig
  val request :
    Smaws_Lib.Context.t ->
    batch_get_collection_request ->
    ( batch_get_collection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns attributes for one or more collections, including the collection endpoint and the \
   OpenSearch Dashboards endpoint. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating \
   and managing Amazon OpenSearch Serverless collections}.\n"]

module BatchGetEffectiveLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    batch_get_effective_lifecycle_policy_request ->
    ( batch_get_effective_lifecycle_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of successful and failed retrievals for the OpenSearch Serverless indexes. For \
   more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing \
   data lifecycle policies}.\n"]

module BatchGetLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    batch_get_lifecycle_policy_request ->
    ( batch_get_lifecycle_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns one or more configured OpenSearch Serverless lifecycle policies. For more information, \
   see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing \
   data lifecycle policies}.\n"]

module BatchGetVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
    batch_get_vpc_endpoint_request ->
    ( batch_get_vpc_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns attributes for one or more VPC endpoints associated with the current account. For more \
   information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access \
   Amazon OpenSearch Serverless using an interface endpoint}.\n"]

module CreateLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    create_lifecycle_policy_request ->
    ( create_lifecycle_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a lifecyle policy to be applied to OpenSearch Serverless indexes. Lifecycle policies \
   define the number of days or hours to retain the data on an OpenSearch Serverless index. For \
   more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-create}Creating \
   data lifecycle policies}.\n"]

module CreateSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    create_security_policy_request ->
    ( create_security_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a security policy to be used by one or more OpenSearch Serverless collections. Security \
   policies provide access to a collection and its OpenSearch Dashboards endpoint from public \
   networks or specific VPC endpoints. They also allow you to secure a collection with a KMS \
   encryption key. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network \
   access for Amazon OpenSearch Serverless} and \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption \
   at rest for Amazon OpenSearch Serverless}.\n"]

module GetAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
    get_account_settings_request ->
    ( get_account_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Returns account-level settings related to OpenSearch Serverless.\n"]

module GetPoliciesStats : sig
  val request :
    Smaws_Lib.Context.t ->
    get_policies_stats_request ->
    ( get_policies_stats_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception ]
    )
    result
end
[@@ocaml.doc
  "Returns statistical information about your OpenSearch Serverless access policies, security \
   configurations, and security policies.\n"]

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the tags for an OpenSearch Serverless resource. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging \
   Amazon OpenSearch Serverless collections}.\n"]

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Associates tags with an OpenSearch Serverless resource. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging \
   Amazon OpenSearch Serverless collections}.\n"]

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Removes a tag or set of tags from an OpenSearch Serverless resource. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging \
   Amazon OpenSearch Serverless collections}.\n"]

module UpdateAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    update_access_policy_request ->
    ( update_access_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Updates an OpenSearch Serverless access policy. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data \
   access control for Amazon OpenSearch Serverless}.\n"]

module UpdateAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
    update_account_settings_request ->
    ( update_account_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Update the OpenSearch Serverless settings for the current Amazon Web Services account. For more \
   information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing \
   capacity limits for Amazon OpenSearch Serverless}.\n"]

module UpdateCollection : sig
  val request :
    Smaws_Lib.Context.t ->
    update_collection_request ->
    ( update_collection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Updates an OpenSearch Serverless collection.\n"]

module UpdateLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    update_lifecycle_policy_request ->
    ( update_lifecycle_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Updates an OpenSearch Serverless access policy. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-update}Updating \
   data lifecycle policies}.\n"]

module UpdateSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    update_security_config_request ->
    ( update_security_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Updates a security configuration for OpenSearch Serverless. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML \
   authentication for Amazon OpenSearch Serverless}.\n"]

module UpdateSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    update_security_policy_request ->
    ( update_security_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Updates an OpenSearch Serverless security policy. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network \
   access for Amazon OpenSearch Serverless} and \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption \
   at rest for Amazon OpenSearch Serverless}.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
    update_vpc_endpoint_request ->
    ( update_vpc_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Updates an OpenSearch Serverless-managed interface endpoint. For more information, see \
   {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access \
   Amazon OpenSearch Serverless using an interface endpoint}.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
