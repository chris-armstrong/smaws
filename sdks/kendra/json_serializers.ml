open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let s3_object_key_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let s3_path_to_yojson (x : s3_path) =
  assoc_to_yojson
    [
      ("Bucket", Some (s3_bucket_name_to_yojson x.bucket));
      ("Key", Some (s3_object_key_to_yojson x.key));
    ]

let role_arn_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson
let index_id_to_yojson = string_to_yojson
let thesaurus_name_to_yojson = string_to_yojson
let thesaurus_id_to_yojson = string_to_yojson

let update_thesaurus_request_to_yojson (x : update_thesaurus_request) =
  assoc_to_yojson
    [
      ("Id", Some (thesaurus_id_to_yojson x.id));
      ("Name", option_to_yojson thesaurus_name_to_yojson x.name);
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("SourceS3Path", option_to_yojson s3_path_to_yojson x.source_s3_path);
    ]

let attribute_suggestions_mode_to_yojson (x : attribute_suggestions_mode) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let object_boolean_to_yojson = bool_to_yojson
let document_attribute_key_to_yojson = string_to_yojson

let suggestable_config_to_yojson (x : suggestable_config) =
  assoc_to_yojson
    [
      ("AttributeName", option_to_yojson document_attribute_key_to_yojson x.attribute_name);
      ("Suggestable", option_to_yojson object_boolean_to_yojson x.suggestable);
    ]

let suggestable_config_list_to_yojson tree = list_to_yojson suggestable_config_to_yojson tree

let attribute_suggestions_update_config_to_yojson (x : attribute_suggestions_update_config) =
  assoc_to_yojson
    [
      ( "SuggestableConfigList",
        option_to_yojson suggestable_config_list_to_yojson x.suggestable_config_list );
      ( "AttributeSuggestionsMode",
        option_to_yojson attribute_suggestions_mode_to_yojson x.attribute_suggestions_mode );
    ]

let minimum_query_count_to_yojson = int_to_yojson
let minimum_number_of_querying_users_to_yojson = int_to_yojson
let integer_to_yojson = int_to_yojson

let mode_to_yojson (x : mode) =
  match x with ENABLED -> `String "ENABLED" | LEARN_ONLY -> `String "LEARN_ONLY"

let update_query_suggestions_config_request_to_yojson (x : update_query_suggestions_config_request)
    =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Mode", option_to_yojson mode_to_yojson x.mode);
      ( "QueryLogLookBackWindowInDays",
        option_to_yojson integer_to_yojson x.query_log_look_back_window_in_days );
      ( "IncludeQueriesWithoutUserInformation",
        option_to_yojson object_boolean_to_yojson x.include_queries_without_user_information );
      ( "MinimumNumberOfQueryingUsers",
        option_to_yojson minimum_number_of_querying_users_to_yojson
          x.minimum_number_of_querying_users );
      ("MinimumQueryCount", option_to_yojson minimum_query_count_to_yojson x.minimum_query_count);
      ( "AttributeSuggestionsConfig",
        option_to_yojson attribute_suggestions_update_config_to_yojson
          x.attribute_suggestions_config );
    ]

let query_suggestions_block_list_name_to_yojson = string_to_yojson
let query_suggestions_block_list_id_to_yojson = string_to_yojson

let update_query_suggestions_block_list_request_to_yojson
    (x : update_query_suggestions_block_list_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Id", Some (query_suggestions_block_list_id_to_yojson x.id));
      ("Name", option_to_yojson query_suggestions_block_list_name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("SourceS3Path", option_to_yojson s3_path_to_yojson x.source_s3_path);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let user_group_resolution_mode_to_yojson (x : user_group_resolution_mode) =
  match x with AWS_SSO -> `String "AWS_SSO" | NONE -> `String "NONE"

let user_group_resolution_configuration_to_yojson (x : user_group_resolution_configuration) =
  assoc_to_yojson
    [
      ( "UserGroupResolutionMode",
        Some (user_group_resolution_mode_to_yojson x.user_group_resolution_mode) );
    ]

let user_context_policy_to_yojson (x : user_context_policy) =
  match x with ATTRIBUTE_FILTER -> `String "ATTRIBUTE_FILTER" | USER_TOKEN -> `String "USER_TOKEN"

let string__to_yojson = string_to_yojson

let json_token_type_configuration_to_yojson (x : json_token_type_configuration) =
  assoc_to_yojson
    [
      ("UserNameAttributeField", Some (string__to_yojson x.user_name_attribute_field));
      ("GroupAttributeField", Some (string__to_yojson x.group_attribute_field));
    ]

let claim_regex_to_yojson = string_to_yojson
let issuer_to_yojson = string_to_yojson
let group_attribute_field_to_yojson = string_to_yojson
let user_name_attribute_field_to_yojson = string_to_yojson
let url_to_yojson = string_to_yojson

let key_location_to_yojson (x : key_location) =
  match x with URL -> `String "URL" | SECRET_MANAGER -> `String "SECRET_MANAGER"

let jwt_token_type_configuration_to_yojson (x : jwt_token_type_configuration) =
  assoc_to_yojson
    [
      ("KeyLocation", Some (key_location_to_yojson x.key_location));
      ("URL", option_to_yojson url_to_yojson x.ur_l);
      ("SecretManagerArn", option_to_yojson role_arn_to_yojson x.secret_manager_arn);
      ( "UserNameAttributeField",
        option_to_yojson user_name_attribute_field_to_yojson x.user_name_attribute_field );
      ( "GroupAttributeField",
        option_to_yojson group_attribute_field_to_yojson x.group_attribute_field );
      ("Issuer", option_to_yojson issuer_to_yojson x.issuer);
      ("ClaimRegex", option_to_yojson claim_regex_to_yojson x.claim_regex);
    ]

let user_token_configuration_to_yojson (x : user_token_configuration) =
  assoc_to_yojson
    [
      ( "JwtTokenTypeConfiguration",
        option_to_yojson jwt_token_type_configuration_to_yojson x.jwt_token_type_configuration );
      ( "JsonTokenTypeConfiguration",
        option_to_yojson json_token_type_configuration_to_yojson x.json_token_type_configuration );
    ]

let user_token_configuration_list_to_yojson tree =
  list_to_yojson user_token_configuration_to_yojson tree

let query_capacity_unit_to_yojson = int_to_yojson
let storage_capacity_unit_to_yojson = int_to_yojson

let capacity_units_configuration_to_yojson (x : capacity_units_configuration) =
  assoc_to_yojson
    [
      ("StorageCapacityUnits", Some (storage_capacity_unit_to_yojson x.storage_capacity_units));
      ("QueryCapacityUnits", Some (query_capacity_unit_to_yojson x.query_capacity_units));
    ]

let boolean__to_yojson = bool_to_yojson

let search_to_yojson (x : search) =
  assoc_to_yojson
    [
      ("Facetable", option_to_yojson boolean__to_yojson x.facetable);
      ("Searchable", option_to_yojson boolean__to_yojson x.searchable);
      ("Displayable", option_to_yojson boolean__to_yojson x.displayable);
      ("Sortable", option_to_yojson boolean__to_yojson x.sortable);
    ]

let importance_to_yojson = int_to_yojson
let value_importance_map_key_to_yojson = string_to_yojson

let value_importance_map_to_yojson tree =
  map_to_yojson value_importance_map_key_to_yojson importance_to_yojson tree

let order_to_yojson (x : order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let duration_to_yojson = string_to_yojson
let document_metadata_boolean_to_yojson = bool_to_yojson

let relevance_to_yojson (x : relevance) =
  assoc_to_yojson
    [
      ("Freshness", option_to_yojson document_metadata_boolean_to_yojson x.freshness);
      ("Importance", option_to_yojson importance_to_yojson x.importance);
      ("Duration", option_to_yojson duration_to_yojson x.duration);
      ("RankOrder", option_to_yojson order_to_yojson x.rank_order);
      ("ValueImportanceMap", option_to_yojson value_importance_map_to_yojson x.value_importance_map);
    ]

let document_attribute_value_type_to_yojson (x : document_attribute_value_type) =
  match x with
  | STRING_VALUE -> `String "STRING_VALUE"
  | STRING_LIST_VALUE -> `String "STRING_LIST_VALUE"
  | LONG_VALUE -> `String "LONG_VALUE"
  | DATE_VALUE -> `String "DATE_VALUE"

let document_metadata_configuration_name_to_yojson = string_to_yojson

let document_metadata_configuration_to_yojson (x : document_metadata_configuration) =
  assoc_to_yojson
    [
      ("Name", Some (document_metadata_configuration_name_to_yojson x.name));
      ("Type", Some (document_attribute_value_type_to_yojson x.type_));
      ("Relevance", option_to_yojson relevance_to_yojson x.relevance);
      ("Search", option_to_yojson search_to_yojson x.search);
    ]

let document_metadata_configuration_list_to_yojson tree =
  list_to_yojson document_metadata_configuration_to_yojson tree

let index_name_to_yojson = string_to_yojson

let update_index_request_to_yojson (x : update_index_request) =
  assoc_to_yojson
    [
      ("Id", Some (index_id_to_yojson x.id));
      ("Name", option_to_yojson index_name_to_yojson x.name);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "DocumentMetadataConfigurationUpdates",
        option_to_yojson document_metadata_configuration_list_to_yojson
          x.document_metadata_configuration_updates );
      ("CapacityUnits", option_to_yojson capacity_units_configuration_to_yojson x.capacity_units);
      ( "UserTokenConfigurations",
        option_to_yojson user_token_configuration_list_to_yojson x.user_token_configurations );
      ("UserContextPolicy", option_to_yojson user_context_policy_to_yojson x.user_context_policy);
      ( "UserGroupResolutionConfiguration",
        option_to_yojson user_group_resolution_configuration_to_yojson
          x.user_group_resolution_configuration );
    ]

let query_text_to_yojson = string_to_yojson

let conflicting_item_to_yojson (x : conflicting_item) =
  assoc_to_yojson
    [
      ("QueryText", option_to_yojson query_text_to_yojson x.query_text);
      ("SetName", option_to_yojson string__to_yojson x.set_name);
      ("SetId", option_to_yojson string__to_yojson x.set_id);
    ]

let conflicting_items_to_yojson tree = list_to_yojson conflicting_item_to_yojson tree

let featured_results_conflict_exception_to_yojson (x : featured_results_conflict_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ConflictingItems", option_to_yojson conflicting_items_to_yojson x.conflicting_items);
    ]

let long_to_yojson = long_to_yojson
let document_id_to_yojson = string_to_yojson

let featured_document_to_yojson (x : featured_document) =
  assoc_to_yojson [ ("Id", option_to_yojson document_id_to_yojson x.id) ]

let featured_document_list_to_yojson tree = list_to_yojson featured_document_to_yojson tree
let query_text_list_to_yojson tree = list_to_yojson query_text_to_yojson tree

let featured_results_set_status_to_yojson (x : featured_results_set_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let featured_results_set_description_to_yojson = string_to_yojson
let featured_results_set_name_to_yojson = string_to_yojson
let featured_results_set_id_to_yojson = string_to_yojson

let featured_results_set_to_yojson (x : featured_results_set) =
  assoc_to_yojson
    [
      ( "FeaturedResultsSetId",
        option_to_yojson featured_results_set_id_to_yojson x.featured_results_set_id );
      ( "FeaturedResultsSetName",
        option_to_yojson featured_results_set_name_to_yojson x.featured_results_set_name );
      ("Description", option_to_yojson featured_results_set_description_to_yojson x.description);
      ("Status", option_to_yojson featured_results_set_status_to_yojson x.status);
      ("QueryTexts", option_to_yojson query_text_list_to_yojson x.query_texts);
      ("FeaturedDocuments", option_to_yojson featured_document_list_to_yojson x.featured_documents);
      ("LastUpdatedTimestamp", option_to_yojson long_to_yojson x.last_updated_timestamp);
      ("CreationTimestamp", option_to_yojson long_to_yojson x.creation_timestamp);
    ]

let update_featured_results_set_response_to_yojson (x : update_featured_results_set_response) =
  assoc_to_yojson
    [
      ("FeaturedResultsSet", option_to_yojson featured_results_set_to_yojson x.featured_results_set);
    ]

let update_featured_results_set_request_to_yojson (x : update_featured_results_set_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("FeaturedResultsSetId", Some (featured_results_set_id_to_yojson x.featured_results_set_id));
      ( "FeaturedResultsSetName",
        option_to_yojson featured_results_set_name_to_yojson x.featured_results_set_name );
      ("Description", option_to_yojson featured_results_set_description_to_yojson x.description);
      ("Status", option_to_yojson featured_results_set_status_to_yojson x.status);
      ("QueryTexts", option_to_yojson query_text_list_to_yojson x.query_texts);
      ("FeaturedDocuments", option_to_yojson featured_document_list_to_yojson x.featured_documents);
    ]

let identity_attribute_name_to_yojson = string_to_yojson

let user_identity_configuration_to_yojson (x : user_identity_configuration) =
  assoc_to_yojson
    [
      ( "IdentityAttributeName",
        option_to_yojson identity_attribute_name_to_yojson x.identity_attribute_name );
    ]

let faq_id_to_yojson = string_to_yojson
let faq_ids_list_to_yojson tree = list_to_yojson faq_id_to_yojson tree
let data_source_id_to_yojson = string_to_yojson
let data_source_id_list_to_yojson tree = list_to_yojson data_source_id_to_yojson tree

let content_source_configuration_to_yojson (x : content_source_configuration) =
  assoc_to_yojson
    [
      ("DataSourceIds", option_to_yojson data_source_id_list_to_yojson x.data_source_ids);
      ("FaqIds", option_to_yojson faq_ids_list_to_yojson x.faq_ids);
      ("DirectPutContent", option_to_yojson boolean__to_yojson x.direct_put_content);
    ]

let experience_configuration_to_yojson (x : experience_configuration) =
  assoc_to_yojson
    [
      ( "ContentSourceConfiguration",
        option_to_yojson content_source_configuration_to_yojson x.content_source_configuration );
      ( "UserIdentityConfiguration",
        option_to_yojson user_identity_configuration_to_yojson x.user_identity_configuration );
    ]

let experience_name_to_yojson = string_to_yojson
let experience_id_to_yojson = string_to_yojson

let update_experience_request_to_yojson (x : update_experience_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id));
      ("Name", option_to_yojson experience_name_to_yojson x.name);
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Configuration", option_to_yojson experience_configuration_to_yojson x.configuration);
      ("Description", option_to_yojson description_to_yojson x.description);
    ]

let lambda_arn_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let document_attribute_string_list_value_to_yojson tree = list_to_yojson string__to_yojson tree
let document_attribute_string_value_to_yojson = string_to_yojson

let document_attribute_value_to_yojson (x : document_attribute_value) =
  assoc_to_yojson
    [
      ("StringValue", option_to_yojson document_attribute_string_value_to_yojson x.string_value);
      ( "StringListValue",
        option_to_yojson document_attribute_string_list_value_to_yojson x.string_list_value );
      ("LongValue", option_to_yojson long_to_yojson x.long_value);
      ("DateValue", option_to_yojson timestamp_to_yojson x.date_value);
    ]

let condition_operator_to_yojson (x : condition_operator) =
  match x with
  | GreaterThan -> `String "GreaterThan"
  | GreaterThanOrEquals -> `String "GreaterThanOrEquals"
  | LessThan -> `String "LessThan"
  | LessThanOrEquals -> `String "LessThanOrEquals"
  | Equals -> `String "Equals"
  | NotEquals -> `String "NotEquals"
  | Contains -> `String "Contains"
  | NotContains -> `String "NotContains"
  | Exists -> `String "Exists"
  | NotExists -> `String "NotExists"
  | BeginsWith -> `String "BeginsWith"

let document_attribute_condition_to_yojson (x : document_attribute_condition) =
  assoc_to_yojson
    [
      ( "ConditionDocumentAttributeKey",
        Some (document_attribute_key_to_yojson x.condition_document_attribute_key) );
      ("Operator", Some (condition_operator_to_yojson x.operator));
      ("ConditionOnValue", option_to_yojson document_attribute_value_to_yojson x.condition_on_value);
    ]

let hook_configuration_to_yojson (x : hook_configuration) =
  assoc_to_yojson
    [
      ( "InvocationCondition",
        option_to_yojson document_attribute_condition_to_yojson x.invocation_condition );
      ("LambdaArn", Some (lambda_arn_to_yojson x.lambda_arn));
      ("S3Bucket", Some (s3_bucket_name_to_yojson x.s3_bucket));
    ]

let document_attribute_target_to_yojson (x : document_attribute_target) =
  assoc_to_yojson
    [
      ( "TargetDocumentAttributeKey",
        option_to_yojson document_attribute_key_to_yojson x.target_document_attribute_key );
      ( "TargetDocumentAttributeValueDeletion",
        option_to_yojson boolean__to_yojson x.target_document_attribute_value_deletion );
      ( "TargetDocumentAttributeValue",
        option_to_yojson document_attribute_value_to_yojson x.target_document_attribute_value );
    ]

let inline_custom_document_enrichment_configuration_to_yojson
    (x : inline_custom_document_enrichment_configuration) =
  assoc_to_yojson
    [
      ("Condition", option_to_yojson document_attribute_condition_to_yojson x.condition);
      ("Target", option_to_yojson document_attribute_target_to_yojson x.target);
      ("DocumentContentDeletion", option_to_yojson boolean__to_yojson x.document_content_deletion);
    ]

let inline_custom_document_enrichment_configuration_list_to_yojson tree =
  list_to_yojson inline_custom_document_enrichment_configuration_to_yojson tree

let custom_document_enrichment_configuration_to_yojson
    (x : custom_document_enrichment_configuration) =
  assoc_to_yojson
    [
      ( "InlineConfigurations",
        option_to_yojson inline_custom_document_enrichment_configuration_list_to_yojson
          x.inline_configurations );
      ( "PreExtractionHookConfiguration",
        option_to_yojson hook_configuration_to_yojson x.pre_extraction_hook_configuration );
      ( "PostExtractionHookConfiguration",
        option_to_yojson hook_configuration_to_yojson x.post_extraction_hook_configuration );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
    ]

let language_code_to_yojson = string_to_yojson
let scan_schedule_to_yojson = string_to_yojson
let vpc_security_group_id_to_yojson = string_to_yojson
let security_group_id_list_to_yojson tree = list_to_yojson vpc_security_group_id_to_yojson tree
let subnet_id_to_yojson = string_to_yojson
let subnet_id_list_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let data_source_vpc_configuration_to_yojson (x : data_source_vpc_configuration) =
  assoc_to_yojson
    [
      ("SubnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ("SecurityGroupIds", Some (security_group_id_list_to_yojson x.security_group_ids));
    ]

let template_to_yojson = json_to_yojson

let template_configuration_to_yojson (x : template_configuration) =
  assoc_to_yojson [ ("Template", option_to_yojson template_to_yojson x.template) ]

let data_source_inclusions_exclusions_strings_member_to_yojson = string_to_yojson

let data_source_inclusions_exclusions_strings_to_yojson tree =
  list_to_yojson data_source_inclusions_exclusions_strings_member_to_yojson tree

let index_field_name_to_yojson = string_to_yojson
let data_source_date_field_format_to_yojson = string_to_yojson
let data_source_field_name_to_yojson = string_to_yojson

let data_source_to_index_field_mapping_to_yojson (x : data_source_to_index_field_mapping) =
  assoc_to_yojson
    [
      ("DataSourceFieldName", Some (data_source_field_name_to_yojson x.data_source_field_name));
      ( "DateFieldFormat",
        option_to_yojson data_source_date_field_format_to_yojson x.date_field_format );
      ("IndexFieldName", Some (index_field_name_to_yojson x.index_field_name));
    ]

let data_source_to_index_field_mapping_list_to_yojson tree =
  list_to_yojson data_source_to_index_field_mapping_to_yojson tree

let alfresco_entity_to_yojson (x : alfresco_entity) =
  match x with
  | Wiki -> `String "wiki"
  | Blog -> `String "blog"
  | DocumentLibrary -> `String "documentLibrary"

let entity_filter_to_yojson tree = list_to_yojson alfresco_entity_to_yojson tree
let secret_arn_to_yojson = string_to_yojson
let site_id_to_yojson = string_to_yojson
let site_url_to_yojson = string_to_yojson

let alfresco_configuration_to_yojson (x : alfresco_configuration) =
  assoc_to_yojson
    [
      ("SiteUrl", Some (site_url_to_yojson x.site_url));
      ("SiteId", Some (site_id_to_yojson x.site_id));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("SslCertificateS3Path", Some (s3_path_to_yojson x.ssl_certificate_s3_path));
      ("CrawlSystemFolders", option_to_yojson boolean__to_yojson x.crawl_system_folders);
      ("CrawlComments", option_to_yojson boolean__to_yojson x.crawl_comments);
      ("EntityFilter", option_to_yojson entity_filter_to_yojson x.entity_filter);
      ( "DocumentLibraryFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.document_library_field_mappings );
      ( "BlogFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.blog_field_mappings );
      ( "WikiFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.wiki_field_mappings );
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let repository_name_to_yojson = string_to_yojson
let repository_names_to_yojson tree = list_to_yojson repository_name_to_yojson tree

let git_hub_document_crawl_properties_to_yojson (x : git_hub_document_crawl_properties) =
  assoc_to_yojson
    [
      ("CrawlRepositoryDocuments", option_to_yojson boolean__to_yojson x.crawl_repository_documents);
      ("CrawlIssue", option_to_yojson boolean__to_yojson x.crawl_issue);
      ("CrawlIssueComment", option_to_yojson boolean__to_yojson x.crawl_issue_comment);
      ( "CrawlIssueCommentAttachment",
        option_to_yojson boolean__to_yojson x.crawl_issue_comment_attachment );
      ("CrawlPullRequest", option_to_yojson boolean__to_yojson x.crawl_pull_request);
      ("CrawlPullRequestComment", option_to_yojson boolean__to_yojson x.crawl_pull_request_comment);
      ( "CrawlPullRequestCommentAttachment",
        option_to_yojson boolean__to_yojson x.crawl_pull_request_comment_attachment );
    ]

let type__to_yojson (x : type_) =
  match x with SAAS -> `String "SAAS" | ON_PREMISE -> `String "ON_PREMISE"

let organization_name_to_yojson = string_to_yojson

let on_premise_configuration_to_yojson (x : on_premise_configuration) =
  assoc_to_yojson
    [
      ("HostUrl", Some (url_to_yojson x.host_url));
      ("OrganizationName", Some (organization_name_to_yojson x.organization_name));
      ("SslCertificateS3Path", Some (s3_path_to_yojson x.ssl_certificate_s3_path));
    ]

let saa_s_configuration_to_yojson (x : saa_s_configuration) =
  assoc_to_yojson
    [
      ("OrganizationName", Some (organization_name_to_yojson x.organization_name));
      ("HostUrl", Some (url_to_yojson x.host_url));
    ]

let git_hub_configuration_to_yojson (x : git_hub_configuration) =
  assoc_to_yojson
    [
      ("SaaSConfiguration", option_to_yojson saa_s_configuration_to_yojson x.saa_s_configuration);
      ( "OnPremiseConfiguration",
        option_to_yojson on_premise_configuration_to_yojson x.on_premise_configuration );
      ("Type", option_to_yojson type__to_yojson x.type_);
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("UseChangeLog", option_to_yojson boolean__to_yojson x.use_change_log);
      ( "GitHubDocumentCrawlProperties",
        option_to_yojson git_hub_document_crawl_properties_to_yojson
          x.git_hub_document_crawl_properties );
      ("RepositoryFilter", option_to_yojson repository_names_to_yojson x.repository_filter);
      ( "InclusionFolderNamePatterns",
        option_to_yojson string_list_to_yojson x.inclusion_folder_name_patterns );
      ( "InclusionFileTypePatterns",
        option_to_yojson string_list_to_yojson x.inclusion_file_type_patterns );
      ( "InclusionFileNamePatterns",
        option_to_yojson string_list_to_yojson x.inclusion_file_name_patterns );
      ( "ExclusionFolderNamePatterns",
        option_to_yojson string_list_to_yojson x.exclusion_folder_name_patterns );
      ( "ExclusionFileTypePatterns",
        option_to_yojson string_list_to_yojson x.exclusion_file_type_patterns );
      ( "ExclusionFileNamePatterns",
        option_to_yojson string_list_to_yojson x.exclusion_file_name_patterns );
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
      ( "GitHubRepositoryConfigurationFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.git_hub_repository_configuration_field_mappings );
      ( "GitHubCommitConfigurationFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.git_hub_commit_configuration_field_mappings );
      ( "GitHubIssueDocumentConfigurationFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.git_hub_issue_document_configuration_field_mappings );
      ( "GitHubIssueCommentConfigurationFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.git_hub_issue_comment_configuration_field_mappings );
      ( "GitHubIssueAttachmentConfigurationFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.git_hub_issue_attachment_configuration_field_mappings );
      ( "GitHubPullRequestCommentConfigurationFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.git_hub_pull_request_comment_configuration_field_mappings );
      ( "GitHubPullRequestDocumentConfigurationFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.git_hub_pull_request_document_configuration_field_mappings );
      ( "GitHubPullRequestDocumentAttachmentConfigurationFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.git_hub_pull_request_document_attachment_configuration_field_mappings );
    ]

let issue_sub_entity_to_yojson (x : issue_sub_entity) =
  match x with
  | COMMENTS -> `String "COMMENTS"
  | ATTACHMENTS -> `String "ATTACHMENTS"
  | WORKLOGS -> `String "WORKLOGS"

let issue_sub_entity_filter_to_yojson tree = list_to_yojson issue_sub_entity_to_yojson tree
let jira_status_to_yojson tree = list_to_yojson string__to_yojson tree
let issue_type_to_yojson tree = list_to_yojson string__to_yojson tree
let project_to_yojson tree = list_to_yojson string__to_yojson tree
let jira_account_url_to_yojson = string_to_yojson

let jira_configuration_to_yojson (x : jira_configuration) =
  assoc_to_yojson
    [
      ("JiraAccountUrl", Some (jira_account_url_to_yojson x.jira_account_url));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("UseChangeLog", option_to_yojson boolean__to_yojson x.use_change_log);
      ("Project", option_to_yojson project_to_yojson x.project);
      ("IssueType", option_to_yojson issue_type_to_yojson x.issue_type);
      ("Status", option_to_yojson jira_status_to_yojson x.status);
      ( "IssueSubEntityFilter",
        option_to_yojson issue_sub_entity_filter_to_yojson x.issue_sub_entity_filter );
      ( "AttachmentFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.attachment_field_mappings );
      ( "CommentFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.comment_field_mappings
      );
      ( "IssueFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.issue_field_mappings );
      ( "ProjectFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.project_field_mappings
      );
      ( "WorkLogFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.work_log_field_mappings
      );
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
    ]

let folder_id_to_yojson = string_to_yojson
let folder_id_list_to_yojson tree = list_to_yojson folder_id_to_yojson tree
let domain_to_yojson = string_to_yojson

let quip_configuration_to_yojson (x : quip_configuration) =
  assoc_to_yojson
    [
      ("Domain", Some (domain_to_yojson x.domain));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("CrawlFileComments", option_to_yojson boolean__to_yojson x.crawl_file_comments);
      ("CrawlChatRooms", option_to_yojson boolean__to_yojson x.crawl_chat_rooms);
      ("CrawlAttachments", option_to_yojson boolean__to_yojson x.crawl_attachments);
      ("FolderIds", option_to_yojson folder_id_list_to_yojson x.folder_ids);
      ( "ThreadFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.thread_field_mappings
      );
      ( "MessageFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.message_field_mappings
      );
      ( "AttachmentFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson
          x.attachment_field_mappings );
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
    ]

let enterprise_id_to_yojson = string_to_yojson

let box_configuration_to_yojson (x : box_configuration) =
  assoc_to_yojson
    [
      ("EnterpriseId", Some (enterprise_id_to_yojson x.enterprise_id));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("UseChangeLog", option_to_yojson boolean__to_yojson x.use_change_log);
      ("CrawlComments", option_to_yojson boolean__to_yojson x.crawl_comments);
      ("CrawlTasks", option_to_yojson boolean__to_yojson x.crawl_tasks);
      ("CrawlWebLinks", option_to_yojson boolean__to_yojson x.crawl_web_links);
      ( "FileFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.file_field_mappings );
      ( "TaskFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.task_field_mappings );
      ( "CommentFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.comment_field_mappings
      );
      ( "WebLinkFieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.web_link_field_mappings
      );
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
    ]

let public_channel_filter_to_yojson tree = list_to_yojson string__to_yojson tree
let private_channel_filter_to_yojson tree = list_to_yojson string__to_yojson tree
let look_back_period_to_yojson = int_to_yojson
let since_crawl_date_to_yojson = string_to_yojson

let slack_entity_to_yojson (x : slack_entity) =
  match x with
  | PUBLIC_CHANNEL -> `String "PUBLIC_CHANNEL"
  | PRIVATE_CHANNEL -> `String "PRIVATE_CHANNEL"
  | GROUP_MESSAGE -> `String "GROUP_MESSAGE"
  | DIRECT_MESSAGE -> `String "DIRECT_MESSAGE"

let slack_entity_list_to_yojson tree = list_to_yojson slack_entity_to_yojson tree
let team_id_to_yojson = string_to_yojson

let slack_configuration_to_yojson (x : slack_configuration) =
  assoc_to_yojson
    [
      ("TeamId", Some (team_id_to_yojson x.team_id));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
      ("SlackEntityList", Some (slack_entity_list_to_yojson x.slack_entity_list));
      ("UseChangeLog", option_to_yojson boolean__to_yojson x.use_change_log);
      ("CrawlBotMessage", option_to_yojson boolean__to_yojson x.crawl_bot_message);
      ("ExcludeArchived", option_to_yojson boolean__to_yojson x.exclude_archived);
      ("SinceCrawlDate", Some (since_crawl_date_to_yojson x.since_crawl_date));
      ("LookBackPeriod", option_to_yojson look_back_period_to_yojson x.look_back_period);
      ( "PrivateChannelFilter",
        option_to_yojson private_channel_filter_to_yojson x.private_channel_filter );
      ( "PublicChannelFilter",
        option_to_yojson public_channel_filter_to_yojson x.public_channel_filter );
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
    ]

let fsx_file_system_type_to_yojson (x : fsx_file_system_type) =
  match x with WINDOWS -> `String "WINDOWS"

let file_system_id_to_yojson = string_to_yojson

let fsx_configuration_to_yojson (x : fsx_configuration) =
  assoc_to_yojson
    [
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ("FileSystemType", Some (fsx_file_system_type_to_yojson x.file_system_type));
      ("VpcConfiguration", Some (data_source_vpc_configuration_to_yojson x.vpc_configuration));
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
    ]

let organization_id_to_yojson = string_to_yojson

let work_docs_configuration_to_yojson (x : work_docs_configuration) =
  assoc_to_yojson
    [
      ("OrganizationId", Some (organization_id_to_yojson x.organization_id));
      ("CrawlComments", option_to_yojson boolean__to_yojson x.crawl_comments);
      ("UseChangeLog", option_to_yojson boolean__to_yojson x.use_change_log);
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
    ]

let port_to_yojson = int_to_yojson
let host_to_yojson = string_to_yojson

let basic_authentication_configuration_to_yojson (x : basic_authentication_configuration) =
  assoc_to_yojson
    [
      ("Host", Some (host_to_yojson x.host));
      ("Port", Some (port_to_yojson x.port));
      ("Credentials", Some (secret_arn_to_yojson x.credentials));
    ]

let basic_authentication_configuration_list_to_yojson tree =
  list_to_yojson basic_authentication_configuration_to_yojson tree

let authentication_configuration_to_yojson (x : authentication_configuration) =
  assoc_to_yojson
    [
      ( "BasicAuthentication",
        option_to_yojson basic_authentication_configuration_list_to_yojson x.basic_authentication );
    ]

let proxy_configuration_to_yojson (x : proxy_configuration) =
  assoc_to_yojson
    [
      ("Host", Some (host_to_yojson x.host));
      ("Port", Some (port_to_yojson x.port));
      ("Credentials", option_to_yojson secret_arn_to_yojson x.credentials);
    ]

let max_urls_per_minute_crawl_rate_to_yojson = int_to_yojson
let max_content_size_per_page_in_mega_bytes_to_yojson = float_to_yojson
let max_links_per_page_to_yojson = int_to_yojson
let crawl_depth_to_yojson = int_to_yojson
let site_map_to_yojson = string_to_yojson
let site_maps_list_to_yojson tree = list_to_yojson site_map_to_yojson tree

let site_maps_configuration_to_yojson (x : site_maps_configuration) =
  assoc_to_yojson [ ("SiteMaps", Some (site_maps_list_to_yojson x.site_maps)) ]

let web_crawler_mode_to_yojson (x : web_crawler_mode) =
  match x with
  | HOST_ONLY -> `String "HOST_ONLY"
  | SUBDOMAINS -> `String "SUBDOMAINS"
  | EVERYTHING -> `String "EVERYTHING"

let seed_url_to_yojson = string_to_yojson
let seed_url_list_to_yojson tree = list_to_yojson seed_url_to_yojson tree

let seed_url_configuration_to_yojson (x : seed_url_configuration) =
  assoc_to_yojson
    [
      ("SeedUrls", Some (seed_url_list_to_yojson x.seed_urls));
      ("WebCrawlerMode", option_to_yojson web_crawler_mode_to_yojson x.web_crawler_mode);
    ]

let urls_to_yojson (x : urls) =
  assoc_to_yojson
    [
      ( "SeedUrlConfiguration",
        option_to_yojson seed_url_configuration_to_yojson x.seed_url_configuration );
      ( "SiteMapsConfiguration",
        option_to_yojson site_maps_configuration_to_yojson x.site_maps_configuration );
    ]

let web_crawler_configuration_to_yojson (x : web_crawler_configuration) =
  assoc_to_yojson
    [
      ("Urls", Some (urls_to_yojson x.urls));
      ("CrawlDepth", option_to_yojson crawl_depth_to_yojson x.crawl_depth);
      ("MaxLinksPerPage", option_to_yojson max_links_per_page_to_yojson x.max_links_per_page);
      ( "MaxContentSizePerPageInMegaBytes",
        option_to_yojson max_content_size_per_page_in_mega_bytes_to_yojson
          x.max_content_size_per_page_in_mega_bytes );
      ( "MaxUrlsPerMinuteCrawlRate",
        option_to_yojson max_urls_per_minute_crawl_rate_to_yojson x.max_urls_per_minute_crawl_rate
      );
      ( "UrlInclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson
          x.url_inclusion_patterns );
      ( "UrlExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson
          x.url_exclusion_patterns );
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_to_yojson x.authentication_configuration );
    ]

let shared_drive_id_to_yojson = string_to_yojson
let exclude_shared_drives_list_to_yojson tree = list_to_yojson shared_drive_id_to_yojson tree
let user_account_to_yojson = string_to_yojson
let exclude_user_accounts_list_to_yojson tree = list_to_yojson user_account_to_yojson tree
let mime_type_to_yojson = string_to_yojson
let exclude_mime_types_list_to_yojson tree = list_to_yojson mime_type_to_yojson tree

let google_drive_configuration_to_yojson (x : google_drive_configuration) =
  assoc_to_yojson
    [
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
      ("ExcludeMimeTypes", option_to_yojson exclude_mime_types_list_to_yojson x.exclude_mime_types);
      ( "ExcludeUserAccounts",
        option_to_yojson exclude_user_accounts_list_to_yojson x.exclude_user_accounts );
      ( "ExcludeSharedDrives",
        option_to_yojson exclude_shared_drives_list_to_yojson x.exclude_shared_drives );
    ]

let confluence_authentication_type_to_yojson (x : confluence_authentication_type) =
  match x with HTTP_BASIC -> `String "HTTP_BASIC" | PAT -> `String "PAT"

let confluence_attachment_field_name_to_yojson (x : confluence_attachment_field_name) =
  match x with
  | AUTHOR -> `String "AUTHOR"
  | CONTENT_TYPE -> `String "CONTENT_TYPE"
  | CREATED_DATE -> `String "CREATED_DATE"
  | DISPLAY_URL -> `String "DISPLAY_URL"
  | FILE_SIZE -> `String "FILE_SIZE"
  | ITEM_TYPE -> `String "ITEM_TYPE"
  | PARENT_ID -> `String "PARENT_ID"
  | SPACE_KEY -> `String "SPACE_KEY"
  | SPACE_NAME -> `String "SPACE_NAME"
  | URL -> `String "URL"
  | VERSION -> `String "VERSION"

let confluence_attachment_to_index_field_mapping_to_yojson
    (x : confluence_attachment_to_index_field_mapping) =
  assoc_to_yojson
    [
      ( "DataSourceFieldName",
        option_to_yojson confluence_attachment_field_name_to_yojson x.data_source_field_name );
      ( "DateFieldFormat",
        option_to_yojson data_source_date_field_format_to_yojson x.date_field_format );
      ("IndexFieldName", option_to_yojson index_field_name_to_yojson x.index_field_name);
    ]

let confluence_attachment_field_mappings_list_to_yojson tree =
  list_to_yojson confluence_attachment_to_index_field_mapping_to_yojson tree

let confluence_attachment_configuration_to_yojson (x : confluence_attachment_configuration) =
  assoc_to_yojson
    [
      ("CrawlAttachments", option_to_yojson boolean__to_yojson x.crawl_attachments);
      ( "AttachmentFieldMappings",
        option_to_yojson confluence_attachment_field_mappings_list_to_yojson
          x.attachment_field_mappings );
    ]

let confluence_blog_field_name_to_yojson (x : confluence_blog_field_name) =
  match x with
  | AUTHOR -> `String "AUTHOR"
  | DISPLAY_URL -> `String "DISPLAY_URL"
  | ITEM_TYPE -> `String "ITEM_TYPE"
  | LABELS -> `String "LABELS"
  | PUBLISH_DATE -> `String "PUBLISH_DATE"
  | SPACE_KEY -> `String "SPACE_KEY"
  | SPACE_NAME -> `String "SPACE_NAME"
  | URL -> `String "URL"
  | VERSION -> `String "VERSION"

let confluence_blog_to_index_field_mapping_to_yojson (x : confluence_blog_to_index_field_mapping) =
  assoc_to_yojson
    [
      ( "DataSourceFieldName",
        option_to_yojson confluence_blog_field_name_to_yojson x.data_source_field_name );
      ( "DateFieldFormat",
        option_to_yojson data_source_date_field_format_to_yojson x.date_field_format );
      ("IndexFieldName", option_to_yojson index_field_name_to_yojson x.index_field_name);
    ]

let confluence_blog_field_mappings_list_to_yojson tree =
  list_to_yojson confluence_blog_to_index_field_mapping_to_yojson tree

let confluence_blog_configuration_to_yojson (x : confluence_blog_configuration) =
  assoc_to_yojson
    [
      ( "BlogFieldMappings",
        option_to_yojson confluence_blog_field_mappings_list_to_yojson x.blog_field_mappings );
    ]

let confluence_page_field_name_to_yojson (x : confluence_page_field_name) =
  match x with
  | AUTHOR -> `String "AUTHOR"
  | CONTENT_STATUS -> `String "CONTENT_STATUS"
  | CREATED_DATE -> `String "CREATED_DATE"
  | DISPLAY_URL -> `String "DISPLAY_URL"
  | ITEM_TYPE -> `String "ITEM_TYPE"
  | LABELS -> `String "LABELS"
  | MODIFIED_DATE -> `String "MODIFIED_DATE"
  | PARENT_ID -> `String "PARENT_ID"
  | SPACE_KEY -> `String "SPACE_KEY"
  | SPACE_NAME -> `String "SPACE_NAME"
  | URL -> `String "URL"
  | VERSION -> `String "VERSION"

let confluence_page_to_index_field_mapping_to_yojson (x : confluence_page_to_index_field_mapping) =
  assoc_to_yojson
    [
      ( "DataSourceFieldName",
        option_to_yojson confluence_page_field_name_to_yojson x.data_source_field_name );
      ( "DateFieldFormat",
        option_to_yojson data_source_date_field_format_to_yojson x.date_field_format );
      ("IndexFieldName", option_to_yojson index_field_name_to_yojson x.index_field_name);
    ]

let confluence_page_field_mappings_list_to_yojson tree =
  list_to_yojson confluence_page_to_index_field_mapping_to_yojson tree

let confluence_page_configuration_to_yojson (x : confluence_page_configuration) =
  assoc_to_yojson
    [
      ( "PageFieldMappings",
        option_to_yojson confluence_page_field_mappings_list_to_yojson x.page_field_mappings );
    ]

let confluence_space_field_name_to_yojson (x : confluence_space_field_name) =
  match x with
  | DISPLAY_URL -> `String "DISPLAY_URL"
  | ITEM_TYPE -> `String "ITEM_TYPE"
  | SPACE_KEY -> `String "SPACE_KEY"
  | URL -> `String "URL"

let confluence_space_to_index_field_mapping_to_yojson (x : confluence_space_to_index_field_mapping)
    =
  assoc_to_yojson
    [
      ( "DataSourceFieldName",
        option_to_yojson confluence_space_field_name_to_yojson x.data_source_field_name );
      ( "DateFieldFormat",
        option_to_yojson data_source_date_field_format_to_yojson x.date_field_format );
      ("IndexFieldName", option_to_yojson index_field_name_to_yojson x.index_field_name);
    ]

let confluence_space_field_mappings_list_to_yojson tree =
  list_to_yojson confluence_space_to_index_field_mapping_to_yojson tree

let confluence_space_identifier_to_yojson = string_to_yojson
let confluence_space_list_to_yojson tree = list_to_yojson confluence_space_identifier_to_yojson tree

let confluence_space_configuration_to_yojson (x : confluence_space_configuration) =
  assoc_to_yojson
    [
      ("CrawlPersonalSpaces", option_to_yojson boolean__to_yojson x.crawl_personal_spaces);
      ("CrawlArchivedSpaces", option_to_yojson boolean__to_yojson x.crawl_archived_spaces);
      ("IncludeSpaces", option_to_yojson confluence_space_list_to_yojson x.include_spaces);
      ("ExcludeSpaces", option_to_yojson confluence_space_list_to_yojson x.exclude_spaces);
      ( "SpaceFieldMappings",
        option_to_yojson confluence_space_field_mappings_list_to_yojson x.space_field_mappings );
    ]

let confluence_version_to_yojson (x : confluence_version) =
  match x with CLOUD -> `String "CLOUD" | SERVER -> `String "SERVER"

let confluence_configuration_to_yojson (x : confluence_configuration) =
  assoc_to_yojson
    [
      ("ServerUrl", Some (url_to_yojson x.server_url));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("Version", Some (confluence_version_to_yojson x.version));
      ( "SpaceConfiguration",
        option_to_yojson confluence_space_configuration_to_yojson x.space_configuration );
      ( "PageConfiguration",
        option_to_yojson confluence_page_configuration_to_yojson x.page_configuration );
      ( "BlogConfiguration",
        option_to_yojson confluence_blog_configuration_to_yojson x.blog_configuration );
      ( "AttachmentConfiguration",
        option_to_yojson confluence_attachment_configuration_to_yojson x.attachment_configuration );
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ( "AuthenticationType",
        option_to_yojson confluence_authentication_type_to_yojson x.authentication_type );
    ]

let service_now_authentication_type_to_yojson (x : service_now_authentication_type) =
  match x with HTTP_BASIC -> `String "HTTP_BASIC" | OAUTH2 -> `String "OAUTH2"

let service_now_service_catalog_configuration_to_yojson
    (x : service_now_service_catalog_configuration) =
  assoc_to_yojson
    [
      ("CrawlAttachments", option_to_yojson boolean__to_yojson x.crawl_attachments);
      ( "IncludeAttachmentFilePatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson
          x.include_attachment_file_patterns );
      ( "ExcludeAttachmentFilePatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson
          x.exclude_attachment_file_patterns );
      ("DocumentDataFieldName", Some (data_source_field_name_to_yojson x.document_data_field_name));
      ( "DocumentTitleFieldName",
        option_to_yojson data_source_field_name_to_yojson x.document_title_field_name );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
    ]

let service_now_knowledge_article_filter_query_to_yojson = string_to_yojson

let service_now_knowledge_article_configuration_to_yojson
    (x : service_now_knowledge_article_configuration) =
  assoc_to_yojson
    [
      ("CrawlAttachments", option_to_yojson boolean__to_yojson x.crawl_attachments);
      ( "IncludeAttachmentFilePatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson
          x.include_attachment_file_patterns );
      ( "ExcludeAttachmentFilePatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson
          x.exclude_attachment_file_patterns );
      ("DocumentDataFieldName", Some (data_source_field_name_to_yojson x.document_data_field_name));
      ( "DocumentTitleFieldName",
        option_to_yojson data_source_field_name_to_yojson x.document_title_field_name );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
      ( "FilterQuery",
        option_to_yojson service_now_knowledge_article_filter_query_to_yojson x.filter_query );
    ]

let service_now_build_version_type_to_yojson (x : service_now_build_version_type) =
  match x with LONDON -> `String "LONDON" | OTHERS -> `String "OTHERS"

let service_now_host_url_to_yojson = string_to_yojson

let service_now_configuration_to_yojson (x : service_now_configuration) =
  assoc_to_yojson
    [
      ("HostUrl", Some (service_now_host_url_to_yojson x.host_url));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ( "ServiceNowBuildVersion",
        Some (service_now_build_version_type_to_yojson x.service_now_build_version) );
      ( "KnowledgeArticleConfiguration",
        option_to_yojson service_now_knowledge_article_configuration_to_yojson
          x.knowledge_article_configuration );
      ( "ServiceCatalogConfiguration",
        option_to_yojson service_now_service_catalog_configuration_to_yojson
          x.service_catalog_configuration );
      ( "AuthenticationType",
        option_to_yojson service_now_authentication_type_to_yojson x.authentication_type );
    ]

let one_drive_user_to_yojson = string_to_yojson
let one_drive_user_list_to_yojson tree = list_to_yojson one_drive_user_to_yojson tree

let one_drive_users_to_yojson (x : one_drive_users) =
  assoc_to_yojson
    [
      ("OneDriveUserList", option_to_yojson one_drive_user_list_to_yojson x.one_drive_user_list);
      ("OneDriveUserS3Path", option_to_yojson s3_path_to_yojson x.one_drive_user_s3_path);
    ]

let tenant_domain_to_yojson = string_to_yojson

let one_drive_configuration_to_yojson (x : one_drive_configuration) =
  assoc_to_yojson
    [
      ("TenantDomain", Some (tenant_domain_to_yojson x.tenant_domain));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("OneDriveUsers", Some (one_drive_users_to_yojson x.one_drive_users));
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
      ("DisableLocalGroups", option_to_yojson boolean__to_yojson x.disable_local_groups);
    ]

let salesforce_standard_object_attachment_configuration_to_yojson
    (x : salesforce_standard_object_attachment_configuration) =
  assoc_to_yojson
    [
      ( "DocumentTitleFieldName",
        option_to_yojson data_source_field_name_to_yojson x.document_title_field_name );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
    ]

let salesforce_chatter_feed_include_filter_type_to_yojson
    (x : salesforce_chatter_feed_include_filter_type) =
  match x with ACTIVE_USER -> `String "ACTIVE_USER" | STANDARD_USER -> `String "STANDARD_USER"

let salesforce_chatter_feed_include_filter_types_to_yojson tree =
  list_to_yojson salesforce_chatter_feed_include_filter_type_to_yojson tree

let salesforce_chatter_feed_configuration_to_yojson (x : salesforce_chatter_feed_configuration) =
  assoc_to_yojson
    [
      ("DocumentDataFieldName", Some (data_source_field_name_to_yojson x.document_data_field_name));
      ( "DocumentTitleFieldName",
        option_to_yojson data_source_field_name_to_yojson x.document_title_field_name );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
      ( "IncludeFilterTypes",
        option_to_yojson salesforce_chatter_feed_include_filter_types_to_yojson
          x.include_filter_types );
    ]

let salesforce_custom_knowledge_article_type_name_to_yojson = string_to_yojson

let salesforce_custom_knowledge_article_type_configuration_to_yojson
    (x : salesforce_custom_knowledge_article_type_configuration) =
  assoc_to_yojson
    [
      ("Name", Some (salesforce_custom_knowledge_article_type_name_to_yojson x.name));
      ("DocumentDataFieldName", Some (data_source_field_name_to_yojson x.document_data_field_name));
      ( "DocumentTitleFieldName",
        option_to_yojson data_source_field_name_to_yojson x.document_title_field_name );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
    ]

let salesforce_custom_knowledge_article_type_configuration_list_to_yojson tree =
  list_to_yojson salesforce_custom_knowledge_article_type_configuration_to_yojson tree

let salesforce_standard_knowledge_article_type_configuration_to_yojson
    (x : salesforce_standard_knowledge_article_type_configuration) =
  assoc_to_yojson
    [
      ("DocumentDataFieldName", Some (data_source_field_name_to_yojson x.document_data_field_name));
      ( "DocumentTitleFieldName",
        option_to_yojson data_source_field_name_to_yojson x.document_title_field_name );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
    ]

let salesforce_knowledge_article_state_to_yojson (x : salesforce_knowledge_article_state) =
  match x with
  | DRAFT -> `String "DRAFT"
  | PUBLISHED -> `String "PUBLISHED"
  | ARCHIVED -> `String "ARCHIVED"

let salesforce_knowledge_article_state_list_to_yojson tree =
  list_to_yojson salesforce_knowledge_article_state_to_yojson tree

let salesforce_knowledge_article_configuration_to_yojson
    (x : salesforce_knowledge_article_configuration) =
  assoc_to_yojson
    [
      ("IncludedStates", Some (salesforce_knowledge_article_state_list_to_yojson x.included_states));
      ( "StandardKnowledgeArticleTypeConfiguration",
        option_to_yojson salesforce_standard_knowledge_article_type_configuration_to_yojson
          x.standard_knowledge_article_type_configuration );
      ( "CustomKnowledgeArticleTypeConfigurations",
        option_to_yojson salesforce_custom_knowledge_article_type_configuration_list_to_yojson
          x.custom_knowledge_article_type_configurations );
    ]

let salesforce_standard_object_name_to_yojson (x : salesforce_standard_object_name) =
  match x with
  | ACCOUNT -> `String "ACCOUNT"
  | CAMPAIGN -> `String "CAMPAIGN"
  | CASE -> `String "CASE"
  | CONTACT -> `String "CONTACT"
  | CONTRACT -> `String "CONTRACT"
  | DOCUMENT -> `String "DOCUMENT"
  | GROUP -> `String "GROUP"
  | IDEA -> `String "IDEA"
  | LEAD -> `String "LEAD"
  | OPPORTUNITY -> `String "OPPORTUNITY"
  | PARTNER -> `String "PARTNER"
  | PRICEBOOK -> `String "PRICEBOOK"
  | PRODUCT -> `String "PRODUCT"
  | PROFILE -> `String "PROFILE"
  | SOLUTION -> `String "SOLUTION"
  | TASK -> `String "TASK"
  | USER -> `String "USER"

let salesforce_standard_object_configuration_to_yojson
    (x : salesforce_standard_object_configuration) =
  assoc_to_yojson
    [
      ("Name", Some (salesforce_standard_object_name_to_yojson x.name));
      ("DocumentDataFieldName", Some (data_source_field_name_to_yojson x.document_data_field_name));
      ( "DocumentTitleFieldName",
        option_to_yojson data_source_field_name_to_yojson x.document_title_field_name );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
    ]

let salesforce_standard_object_configuration_list_to_yojson tree =
  list_to_yojson salesforce_standard_object_configuration_to_yojson tree

let salesforce_configuration_to_yojson (x : salesforce_configuration) =
  assoc_to_yojson
    [
      ("ServerUrl", Some (url_to_yojson x.server_url));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ( "StandardObjectConfigurations",
        option_to_yojson salesforce_standard_object_configuration_list_to_yojson
          x.standard_object_configurations );
      ( "KnowledgeArticleConfiguration",
        option_to_yojson salesforce_knowledge_article_configuration_to_yojson
          x.knowledge_article_configuration );
      ( "ChatterFeedConfiguration",
        option_to_yojson salesforce_chatter_feed_configuration_to_yojson
          x.chatter_feed_configuration );
      ("CrawlAttachments", option_to_yojson boolean__to_yojson x.crawl_attachments);
      ( "StandardObjectAttachmentConfiguration",
        option_to_yojson salesforce_standard_object_attachment_configuration_to_yojson
          x.standard_object_attachment_configuration );
      ( "IncludeAttachmentFilePatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson
          x.include_attachment_file_patterns );
      ( "ExcludeAttachmentFilePatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson
          x.exclude_attachment_file_patterns );
    ]

let query_identifiers_enclosing_option_to_yojson (x : query_identifiers_enclosing_option) =
  match x with DOUBLE_QUOTES -> `String "DOUBLE_QUOTES" | NONE -> `String "NONE"

let sql_configuration_to_yojson (x : sql_configuration) =
  assoc_to_yojson
    [
      ( "QueryIdentifiersEnclosingOption",
        option_to_yojson query_identifiers_enclosing_option_to_yojson
          x.query_identifiers_enclosing_option );
    ]

let column_name_to_yojson = string_to_yojson

let acl_configuration_to_yojson (x : acl_configuration) =
  assoc_to_yojson
    [ ("AllowedGroupsColumnName", Some (column_name_to_yojson x.allowed_groups_column_name)) ]

let change_detecting_columns_to_yojson tree = list_to_yojson column_name_to_yojson tree

let column_configuration_to_yojson (x : column_configuration) =
  assoc_to_yojson
    [
      ("DocumentIdColumnName", Some (column_name_to_yojson x.document_id_column_name));
      ("DocumentDataColumnName", Some (column_name_to_yojson x.document_data_column_name));
      ( "DocumentTitleColumnName",
        option_to_yojson column_name_to_yojson x.document_title_column_name );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
      ( "ChangeDetectingColumns",
        Some (change_detecting_columns_to_yojson x.change_detecting_columns) );
    ]

let table_name_to_yojson = string_to_yojson
let database_name_to_yojson = string_to_yojson
let database_port_to_yojson = int_to_yojson
let database_host_to_yojson = string_to_yojson

let connection_configuration_to_yojson (x : connection_configuration) =
  assoc_to_yojson
    [
      ("DatabaseHost", Some (database_host_to_yojson x.database_host));
      ("DatabasePort", Some (database_port_to_yojson x.database_port));
      ("DatabaseName", Some (database_name_to_yojson x.database_name));
      ("TableName", Some (table_name_to_yojson x.table_name));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
    ]

let database_engine_type_to_yojson (x : database_engine_type) =
  match x with
  | RDS_AURORA_MYSQL -> `String "RDS_AURORA_MYSQL"
  | RDS_AURORA_POSTGRESQL -> `String "RDS_AURORA_POSTGRESQL"
  | RDS_MYSQL -> `String "RDS_MYSQL"
  | RDS_POSTGRESQL -> `String "RDS_POSTGRESQL"

let database_configuration_to_yojson (x : database_configuration) =
  assoc_to_yojson
    [
      ("DatabaseEngineType", Some (database_engine_type_to_yojson x.database_engine_type));
      ( "ConnectionConfiguration",
        Some (connection_configuration_to_yojson x.connection_configuration) );
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
      ("ColumnConfiguration", Some (column_configuration_to_yojson x.column_configuration));
      ("AclConfiguration", option_to_yojson acl_configuration_to_yojson x.acl_configuration);
      ("SqlConfiguration", option_to_yojson sql_configuration_to_yojson x.sql_configuration);
    ]

let share_point_online_authentication_type_to_yojson (x : share_point_online_authentication_type) =
  match x with HTTP_BASIC -> `String "HTTP_BASIC" | OAUTH2 -> `String "OAUTH2"

let share_point_url_list_to_yojson tree = list_to_yojson url_to_yojson tree

let share_point_version_to_yojson (x : share_point_version) =
  match x with
  | SHAREPOINT_2013 -> `String "SHAREPOINT_2013"
  | SHAREPOINT_2016 -> `String "SHAREPOINT_2016"
  | SHAREPOINT_ONLINE -> `String "SHAREPOINT_ONLINE"
  | SHAREPOINT_2019 -> `String "SHAREPOINT_2019"

let share_point_configuration_to_yojson (x : share_point_configuration) =
  assoc_to_yojson
    [
      ("SharePointVersion", Some (share_point_version_to_yojson x.share_point_version));
      ("Urls", Some (share_point_url_list_to_yojson x.urls));
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("CrawlAttachments", option_to_yojson boolean__to_yojson x.crawl_attachments);
      ("UseChangeLog", option_to_yojson boolean__to_yojson x.use_change_log);
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
      ( "FieldMappings",
        option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings );
      ( "DocumentTitleFieldName",
        option_to_yojson data_source_field_name_to_yojson x.document_title_field_name );
      ("DisableLocalGroups", option_to_yojson boolean__to_yojson x.disable_local_groups);
      ("SslCertificateS3Path", option_to_yojson s3_path_to_yojson x.ssl_certificate_s3_path);
      ( "AuthenticationType",
        option_to_yojson share_point_online_authentication_type_to_yojson x.authentication_type );
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
    ]

let access_control_list_configuration_to_yojson (x : access_control_list_configuration) =
  assoc_to_yojson [ ("KeyPath", option_to_yojson s3_object_key_to_yojson x.key_path) ]

let documents_metadata_configuration_to_yojson (x : documents_metadata_configuration) =
  assoc_to_yojson [ ("S3Prefix", option_to_yojson s3_object_key_to_yojson x.s3_prefix) ]

let s3_data_source_configuration_to_yojson (x : s3_data_source_configuration) =
  assoc_to_yojson
    [
      ("BucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
      ( "InclusionPrefixes",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_prefixes );
      ( "InclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns );
      ( "ExclusionPatterns",
        option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns );
      ( "DocumentsMetadataConfiguration",
        option_to_yojson documents_metadata_configuration_to_yojson
          x.documents_metadata_configuration );
      ( "AccessControlListConfiguration",
        option_to_yojson access_control_list_configuration_to_yojson
          x.access_control_list_configuration );
    ]

let data_source_configuration_to_yojson (x : data_source_configuration) =
  assoc_to_yojson
    [
      ("S3Configuration", option_to_yojson s3_data_source_configuration_to_yojson x.s3_configuration);
      ( "SharePointConfiguration",
        option_to_yojson share_point_configuration_to_yojson x.share_point_configuration );
      ( "DatabaseConfiguration",
        option_to_yojson database_configuration_to_yojson x.database_configuration );
      ( "SalesforceConfiguration",
        option_to_yojson salesforce_configuration_to_yojson x.salesforce_configuration );
      ( "OneDriveConfiguration",
        option_to_yojson one_drive_configuration_to_yojson x.one_drive_configuration );
      ( "ServiceNowConfiguration",
        option_to_yojson service_now_configuration_to_yojson x.service_now_configuration );
      ( "ConfluenceConfiguration",
        option_to_yojson confluence_configuration_to_yojson x.confluence_configuration );
      ( "GoogleDriveConfiguration",
        option_to_yojson google_drive_configuration_to_yojson x.google_drive_configuration );
      ( "WebCrawlerConfiguration",
        option_to_yojson web_crawler_configuration_to_yojson x.web_crawler_configuration );
      ( "WorkDocsConfiguration",
        option_to_yojson work_docs_configuration_to_yojson x.work_docs_configuration );
      ("FsxConfiguration", option_to_yojson fsx_configuration_to_yojson x.fsx_configuration);
      ("SlackConfiguration", option_to_yojson slack_configuration_to_yojson x.slack_configuration);
      ("BoxConfiguration", option_to_yojson box_configuration_to_yojson x.box_configuration);
      ("QuipConfiguration", option_to_yojson quip_configuration_to_yojson x.quip_configuration);
      ("JiraConfiguration", option_to_yojson jira_configuration_to_yojson x.jira_configuration);
      ( "GitHubConfiguration",
        option_to_yojson git_hub_configuration_to_yojson x.git_hub_configuration );
      ( "AlfrescoConfiguration",
        option_to_yojson alfresco_configuration_to_yojson x.alfresco_configuration );
      ( "TemplateConfiguration",
        option_to_yojson template_configuration_to_yojson x.template_configuration );
    ]

let data_source_name_to_yojson = string_to_yojson

let update_data_source_request_to_yojson (x : update_data_source_request) =
  assoc_to_yojson
    [
      ("Id", Some (data_source_id_to_yojson x.id));
      ("Name", option_to_yojson data_source_name_to_yojson x.name);
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Configuration", option_to_yojson data_source_configuration_to_yojson x.configuration);
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Schedule", option_to_yojson scan_schedule_to_yojson x.schedule);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "CustomDocumentEnrichmentConfiguration",
        option_to_yojson custom_document_enrichment_configuration_to_yojson
          x.custom_document_enrichment_configuration );
    ]

let update_access_control_configuration_response_to_yojson = unit_to_yojson

let read_access_type_to_yojson (x : read_access_type) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let principal_type_to_yojson (x : principal_type) =
  match x with USER -> `String "USER" | GROUP -> `String "GROUP"

let principal_name_to_yojson = string_to_yojson

let principal_to_yojson (x : principal) =
  assoc_to_yojson
    [
      ("Name", Some (principal_name_to_yojson x.name));
      ("Type", Some (principal_type_to_yojson x.type_));
      ("Access", Some (read_access_type_to_yojson x.access));
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
    ]

let principal_list_to_yojson tree = list_to_yojson principal_to_yojson tree

let hierarchical_principal_to_yojson (x : hierarchical_principal) =
  assoc_to_yojson [ ("PrincipalList", Some (principal_list_to_yojson x.principal_list)) ]

let hierarchical_principal_list_to_yojson tree =
  list_to_yojson hierarchical_principal_to_yojson tree

let access_control_configuration_name_to_yojson = string_to_yojson
let access_control_configuration_id_to_yojson = string_to_yojson

let update_access_control_configuration_request_to_yojson
    (x : update_access_control_configuration_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Id", Some (access_control_configuration_id_to_yojson x.id));
      ("Name", option_to_yojson access_control_configuration_name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("AccessControlList", option_to_yojson principal_list_to_yojson x.access_control_list);
      ( "HierarchicalAccessControlList",
        option_to_yojson hierarchical_principal_list_to_yojson x.hierarchical_access_control_list );
    ]

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let amazon_resource_name_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let relevance_type_to_yojson (x : relevance_type) =
  match x with RELEVANT -> `String "RELEVANT" | NOT_RELEVANT -> `String "NOT_RELEVANT"

let result_id_to_yojson = string_to_yojson

let relevance_feedback_to_yojson (x : relevance_feedback) =
  assoc_to_yojson
    [
      ("ResultId", Some (result_id_to_yojson x.result_id));
      ("RelevanceValue", Some (relevance_type_to_yojson x.relevance_value));
    ]

let relevance_feedback_list_to_yojson tree = list_to_yojson relevance_feedback_to_yojson tree

let click_feedback_to_yojson (x : click_feedback) =
  assoc_to_yojson
    [
      ("ResultId", Some (result_id_to_yojson x.result_id));
      ("ClickTime", Some (timestamp_to_yojson x.click_time));
    ]

let click_feedback_list_to_yojson tree = list_to_yojson click_feedback_to_yojson tree
let query_id_to_yojson = string_to_yojson

let submit_feedback_request_to_yojson (x : submit_feedback_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("QueryId", Some (query_id_to_yojson x.query_id));
      ("ClickFeedbackItems", option_to_yojson click_feedback_list_to_yojson x.click_feedback_items);
      ( "RelevanceFeedbackItems",
        option_to_yojson relevance_feedback_list_to_yojson x.relevance_feedback_items );
    ]

let stop_data_source_sync_job_request_to_yojson (x : stop_data_source_sync_job_request) =
  assoc_to_yojson
    [
      ("Id", Some (data_source_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id));
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let start_data_source_sync_job_response_to_yojson (x : start_data_source_sync_job_response) =
  assoc_to_yojson [ ("ExecutionId", option_to_yojson string__to_yojson x.execution_id) ]

let start_data_source_sync_job_request_to_yojson (x : start_data_source_sync_job_request) =
  assoc_to_yojson
    [
      ("Id", Some (data_source_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id));
    ]

let score_confidence_to_yojson (x : score_confidence) =
  match x with
  | VERY_HIGH -> `String "VERY_HIGH"
  | HIGH -> `String "HIGH"
  | MEDIUM -> `String "MEDIUM"
  | LOW -> `String "LOW"
  | NOT_AVAILABLE -> `String "NOT_AVAILABLE"

let score_attributes_to_yojson (x : score_attributes) =
  assoc_to_yojson
    [ ("ScoreConfidence", option_to_yojson score_confidence_to_yojson x.score_confidence) ]

let document_attribute_to_yojson (x : document_attribute) =
  assoc_to_yojson
    [
      ("Key", Some (document_attribute_key_to_yojson x.key));
      ("Value", Some (document_attribute_value_to_yojson x.value));
    ]

let document_attribute_list_to_yojson tree = list_to_yojson document_attribute_to_yojson tree
let content_to_yojson = string_to_yojson
let document_title_to_yojson = string_to_yojson

let retrieve_result_item_to_yojson (x : retrieve_result_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson result_id_to_yojson x.id);
      ("DocumentId", option_to_yojson document_id_to_yojson x.document_id);
      ("DocumentTitle", option_to_yojson document_title_to_yojson x.document_title);
      ("Content", option_to_yojson content_to_yojson x.content);
      ("DocumentURI", option_to_yojson url_to_yojson x.document_ur_i);
      ( "DocumentAttributes",
        option_to_yojson document_attribute_list_to_yojson x.document_attributes );
      ("ScoreAttributes", option_to_yojson score_attributes_to_yojson x.score_attributes);
    ]

let retrieve_result_item_list_to_yojson tree = list_to_yojson retrieve_result_item_to_yojson tree

let retrieve_result_to_yojson (x : retrieve_result) =
  assoc_to_yojson
    [
      ("QueryId", option_to_yojson query_id_to_yojson x.query_id);
      ("ResultItems", option_to_yojson retrieve_result_item_list_to_yojson x.result_items);
    ]

let data_source_group_to_yojson (x : data_source_group) =
  assoc_to_yojson
    [
      ("GroupId", Some (principal_name_to_yojson x.group_id));
      ("DataSourceId", Some (data_source_id_to_yojson x.data_source_id));
    ]

let data_source_groups_to_yojson tree = list_to_yojson data_source_group_to_yojson tree
let groups_to_yojson tree = list_to_yojson principal_name_to_yojson tree
let token_to_yojson = string_to_yojson

let user_context_to_yojson (x : user_context) =
  assoc_to_yojson
    [
      ("Token", option_to_yojson token_to_yojson x.token);
      ("UserId", option_to_yojson principal_name_to_yojson x.user_id);
      ("Groups", option_to_yojson groups_to_yojson x.groups);
      ("DataSourceGroups", option_to_yojson data_source_groups_to_yojson x.data_source_groups);
    ]

let document_relevance_configuration_to_yojson (x : document_relevance_configuration) =
  assoc_to_yojson
    [
      ("Name", Some (document_metadata_configuration_name_to_yojson x.name));
      ("Relevance", Some (relevance_to_yojson x.relevance));
    ]

let document_relevance_override_configuration_list_to_yojson tree =
  list_to_yojson document_relevance_configuration_to_yojson tree

let document_attribute_key_list_to_yojson tree =
  list_to_yojson document_attribute_key_to_yojson tree

let rec attribute_filter_list_to_yojson tree = list_to_yojson attribute_filter_to_yojson tree

and attribute_filter_to_yojson (x : attribute_filter) =
  assoc_to_yojson
    [
      ("AndAllFilters", option_to_yojson attribute_filter_list_to_yojson x.and_all_filters);
      ("OrAllFilters", option_to_yojson attribute_filter_list_to_yojson x.or_all_filters);
      ("NotFilter", option_to_yojson attribute_filter_to_yojson x.not_filter);
      ("EqualsTo", option_to_yojson document_attribute_to_yojson x.equals_to);
      ("ContainsAll", option_to_yojson document_attribute_to_yojson x.contains_all);
      ("ContainsAny", option_to_yojson document_attribute_to_yojson x.contains_any);
      ("GreaterThan", option_to_yojson document_attribute_to_yojson x.greater_than);
      ("GreaterThanOrEquals", option_to_yojson document_attribute_to_yojson x.greater_than_or_equals);
      ("LessThan", option_to_yojson document_attribute_to_yojson x.less_than);
      ("LessThanOrEquals", option_to_yojson document_attribute_to_yojson x.less_than_or_equals);
    ]

let retrieve_request_to_yojson (x : retrieve_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("QueryText", Some (query_text_to_yojson x.query_text));
      ("AttributeFilter", option_to_yojson attribute_filter_to_yojson x.attribute_filter);
      ( "RequestedDocumentAttributes",
        option_to_yojson document_attribute_key_list_to_yojson x.requested_document_attributes );
      ( "DocumentRelevanceOverrideConfigurations",
        option_to_yojson document_relevance_override_configuration_list_to_yojson
          x.document_relevance_override_configurations );
      ("PageNumber", option_to_yojson integer_to_yojson x.page_number);
      ("PageSize", option_to_yojson integer_to_yojson x.page_size);
      ("UserContext", option_to_yojson user_context_to_yojson x.user_context);
    ]

let feedback_token_to_yojson = string_to_yojson

let highlight_type_to_yojson (x : highlight_type) =
  match x with STANDARD -> `String "STANDARD" | THESAURUS_SYNONYM -> `String "THESAURUS_SYNONYM"

let highlight_to_yojson (x : highlight) =
  assoc_to_yojson
    [
      ("BeginOffset", Some (integer_to_yojson x.begin_offset));
      ("EndOffset", Some (integer_to_yojson x.end_offset));
      ("TopAnswer", option_to_yojson boolean__to_yojson x.top_answer);
      ("Type", option_to_yojson highlight_type_to_yojson x.type_);
    ]

let highlight_list_to_yojson tree = list_to_yojson highlight_to_yojson tree

let text_with_highlights_to_yojson (x : text_with_highlights) =
  assoc_to_yojson
    [
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Highlights", option_to_yojson highlight_list_to_yojson x.highlights);
    ]

let additional_result_attribute_value_to_yojson (x : additional_result_attribute_value) =
  assoc_to_yojson
    [
      ( "TextWithHighlightsValue",
        option_to_yojson text_with_highlights_to_yojson x.text_with_highlights_value );
    ]

let additional_result_attribute_value_type_to_yojson (x : additional_result_attribute_value_type) =
  match x with TEXT_WITH_HIGHLIGHTS_VALUE -> `String "TEXT_WITH_HIGHLIGHTS_VALUE"

let additional_result_attribute_to_yojson (x : additional_result_attribute) =
  assoc_to_yojson
    [
      ("Key", Some (string__to_yojson x.key));
      ("ValueType", Some (additional_result_attribute_value_type_to_yojson x.value_type));
      ("Value", Some (additional_result_attribute_value_to_yojson x.value));
    ]

let additional_result_attribute_list_to_yojson tree =
  list_to_yojson additional_result_attribute_to_yojson tree

let query_result_type_to_yojson (x : query_result_type) =
  match x with
  | DOCUMENT -> `String "DOCUMENT"
  | QUESTION_ANSWER -> `String "QUESTION_ANSWER"
  | ANSWER -> `String "ANSWER"

let featured_results_item_to_yojson (x : featured_results_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson result_id_to_yojson x.id);
      ("Type", option_to_yojson query_result_type_to_yojson x.type_);
      ( "AdditionalAttributes",
        option_to_yojson additional_result_attribute_list_to_yojson x.additional_attributes );
      ("DocumentId", option_to_yojson document_id_to_yojson x.document_id);
      ("DocumentTitle", option_to_yojson text_with_highlights_to_yojson x.document_title);
      ("DocumentExcerpt", option_to_yojson text_with_highlights_to_yojson x.document_excerpt);
      ("DocumentURI", option_to_yojson url_to_yojson x.document_ur_i);
      ( "DocumentAttributes",
        option_to_yojson document_attribute_list_to_yojson x.document_attributes );
      ("FeedbackToken", option_to_yojson feedback_token_to_yojson x.feedback_token);
    ]

let featured_results_item_list_to_yojson tree = list_to_yojson featured_results_item_to_yojson tree

let correction_to_yojson (x : correction) =
  assoc_to_yojson
    [
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Term", option_to_yojson string__to_yojson x.term);
      ("CorrectedTerm", option_to_yojson string__to_yojson x.corrected_term);
    ]

let correction_list_to_yojson tree = list_to_yojson correction_to_yojson tree
let suggested_query_text_to_yojson = string_to_yojson

let spell_corrected_query_to_yojson (x : spell_corrected_query) =
  assoc_to_yojson
    [
      ("SuggestedQueryText", option_to_yojson suggested_query_text_to_yojson x.suggested_query_text);
      ("Corrections", option_to_yojson correction_list_to_yojson x.corrections);
    ]

let spell_corrected_query_list_to_yojson tree = list_to_yojson spell_corrected_query_to_yojson tree

let warning_code_to_yojson (x : warning_code) =
  match x with QUERY_LANGUAGE_INVALID_SYNTAX -> `String "QUERY_LANGUAGE_INVALID_SYNTAX"

let warning_message_to_yojson = string_to_yojson

let warning_to_yojson (x : warning) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson warning_message_to_yojson x.message);
      ("Code", option_to_yojson warning_code_to_yojson x.code);
    ]

let warning_list_to_yojson tree = list_to_yojson warning_to_yojson tree

let rec facet_result_list_to_yojson tree = list_to_yojson facet_result_to_yojson tree

and facet_result_to_yojson (x : facet_result) =
  assoc_to_yojson
    [
      ( "DocumentAttributeKey",
        option_to_yojson document_attribute_key_to_yojson x.document_attribute_key );
      ( "DocumentAttributeValueType",
        option_to_yojson document_attribute_value_type_to_yojson x.document_attribute_value_type );
      ( "DocumentAttributeValueCountPairs",
        option_to_yojson document_attribute_value_count_pair_list_to_yojson
          x.document_attribute_value_count_pairs );
    ]

and document_attribute_value_count_pair_list_to_yojson tree =
  list_to_yojson document_attribute_value_count_pair_to_yojson tree

and document_attribute_value_count_pair_to_yojson (x : document_attribute_value_count_pair) =
  assoc_to_yojson
    [
      ( "DocumentAttributeValue",
        option_to_yojson document_attribute_value_to_yojson x.document_attribute_value );
      ("Count", option_to_yojson integer_to_yojson x.count);
      ("FacetResults", option_to_yojson facet_result_list_to_yojson x.facet_results);
    ]

let expanded_result_item_to_yojson (x : expanded_result_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson result_id_to_yojson x.id);
      ("DocumentId", option_to_yojson document_id_to_yojson x.document_id);
      ("DocumentTitle", option_to_yojson text_with_highlights_to_yojson x.document_title);
      ("DocumentExcerpt", option_to_yojson text_with_highlights_to_yojson x.document_excerpt);
      ("DocumentURI", option_to_yojson url_to_yojson x.document_ur_i);
      ( "DocumentAttributes",
        option_to_yojson document_attribute_list_to_yojson x.document_attributes );
    ]

let expanded_result_list_to_yojson tree = list_to_yojson expanded_result_item_to_yojson tree

let collapsed_result_detail_to_yojson (x : collapsed_result_detail) =
  assoc_to_yojson
    [
      ("DocumentAttribute", Some (document_attribute_to_yojson x.document_attribute));
      ("ExpandedResults", option_to_yojson expanded_result_list_to_yojson x.expanded_results);
    ]

let table_cell_to_yojson (x : table_cell) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("TopAnswer", option_to_yojson boolean__to_yojson x.top_answer);
      ("Highlighted", option_to_yojson boolean__to_yojson x.highlighted);
      ("Header", option_to_yojson boolean__to_yojson x.header);
    ]

let table_cell_list_to_yojson tree = list_to_yojson table_cell_to_yojson tree

let table_row_to_yojson (x : table_row) =
  assoc_to_yojson [ ("Cells", option_to_yojson table_cell_list_to_yojson x.cells) ]

let table_row_list_to_yojson tree = list_to_yojson table_row_to_yojson tree

let table_excerpt_to_yojson (x : table_excerpt) =
  assoc_to_yojson
    [
      ("Rows", option_to_yojson table_row_list_to_yojson x.rows);
      ("TotalNumberOfRows", option_to_yojson integer_to_yojson x.total_number_of_rows);
    ]

let query_result_format_to_yojson (x : query_result_format) =
  match x with TABLE -> `String "TABLE" | TEXT -> `String "TEXT"

let query_result_item_to_yojson (x : query_result_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson result_id_to_yojson x.id);
      ("Type", option_to_yojson query_result_type_to_yojson x.type_);
      ("Format", option_to_yojson query_result_format_to_yojson x.format);
      ( "AdditionalAttributes",
        option_to_yojson additional_result_attribute_list_to_yojson x.additional_attributes );
      ("DocumentId", option_to_yojson document_id_to_yojson x.document_id);
      ("DocumentTitle", option_to_yojson text_with_highlights_to_yojson x.document_title);
      ("DocumentExcerpt", option_to_yojson text_with_highlights_to_yojson x.document_excerpt);
      ("DocumentURI", option_to_yojson url_to_yojson x.document_ur_i);
      ( "DocumentAttributes",
        option_to_yojson document_attribute_list_to_yojson x.document_attributes );
      ("ScoreAttributes", option_to_yojson score_attributes_to_yojson x.score_attributes);
      ("FeedbackToken", option_to_yojson feedback_token_to_yojson x.feedback_token);
      ("TableExcerpt", option_to_yojson table_excerpt_to_yojson x.table_excerpt);
      ( "CollapsedResultDetail",
        option_to_yojson collapsed_result_detail_to_yojson x.collapsed_result_detail );
    ]

let query_result_item_list_to_yojson tree = list_to_yojson query_result_item_to_yojson tree

let query_result_to_yojson (x : query_result) =
  assoc_to_yojson
    [
      ("QueryId", option_to_yojson query_id_to_yojson x.query_id);
      ("ResultItems", option_to_yojson query_result_item_list_to_yojson x.result_items);
      ("FacetResults", option_to_yojson facet_result_list_to_yojson x.facet_results);
      ("TotalNumberOfResults", option_to_yojson integer_to_yojson x.total_number_of_results);
      ("Warnings", option_to_yojson warning_list_to_yojson x.warnings);
      ( "SpellCorrectedQueries",
        option_to_yojson spell_corrected_query_list_to_yojson x.spell_corrected_queries );
      ( "FeaturedResultsItems",
        option_to_yojson featured_results_item_list_to_yojson x.featured_results_items );
    ]

let expand_configuration_to_yojson (x : expand_configuration) =
  assoc_to_yojson
    [
      ("MaxResultItemsToExpand", option_to_yojson integer_to_yojson x.max_result_items_to_expand);
      ( "MaxExpandedResultsPerItem",
        option_to_yojson integer_to_yojson x.max_expanded_results_per_item );
    ]

let missing_attribute_key_strategy_to_yojson (x : missing_attribute_key_strategy) =
  match x with
  | IGNORE -> `String "IGNORE"
  | COLLAPSE -> `String "COLLAPSE"
  | EXPAND -> `String "EXPAND"

let sort_order_to_yojson (x : sort_order) =
  match x with DESC -> `String "DESC" | ASC -> `String "ASC"

let sorting_configuration_to_yojson (x : sorting_configuration) =
  assoc_to_yojson
    [
      ("DocumentAttributeKey", Some (document_attribute_key_to_yojson x.document_attribute_key));
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let sorting_configuration_list_to_yojson tree = list_to_yojson sorting_configuration_to_yojson tree

let collapse_configuration_to_yojson (x : collapse_configuration) =
  assoc_to_yojson
    [
      ("DocumentAttributeKey", Some (document_attribute_key_to_yojson x.document_attribute_key));
      ( "SortingConfigurations",
        option_to_yojson sorting_configuration_list_to_yojson x.sorting_configurations );
      ( "MissingAttributeKeyStrategy",
        option_to_yojson missing_attribute_key_strategy_to_yojson x.missing_attribute_key_strategy
      );
      ("Expand", option_to_yojson boolean__to_yojson x.expand);
      ("ExpandConfiguration", option_to_yojson expand_configuration_to_yojson x.expand_configuration);
    ]

let spell_correction_configuration_to_yojson (x : spell_correction_configuration) =
  assoc_to_yojson
    [
      ( "IncludeQuerySpellCheckSuggestions",
        Some (boolean__to_yojson x.include_query_spell_check_suggestions) );
    ]

let visitor_id_to_yojson = string_to_yojson
let top_document_attribute_value_count_pairs_size_to_yojson = int_to_yojson

let rec facet_list_to_yojson tree = list_to_yojson facet_to_yojson tree

and facet_to_yojson (x : facet) =
  assoc_to_yojson
    [
      ( "DocumentAttributeKey",
        option_to_yojson document_attribute_key_to_yojson x.document_attribute_key );
      ("Facets", option_to_yojson facet_list_to_yojson x.facets);
      ( "MaxResults",
        option_to_yojson top_document_attribute_value_count_pairs_size_to_yojson x.max_results );
    ]

let query_request_to_yojson (x : query_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("QueryText", option_to_yojson query_text_to_yojson x.query_text);
      ("AttributeFilter", option_to_yojson attribute_filter_to_yojson x.attribute_filter);
      ("Facets", option_to_yojson facet_list_to_yojson x.facets);
      ( "RequestedDocumentAttributes",
        option_to_yojson document_attribute_key_list_to_yojson x.requested_document_attributes );
      ( "QueryResultTypeFilter",
        option_to_yojson query_result_type_to_yojson x.query_result_type_filter );
      ( "DocumentRelevanceOverrideConfigurations",
        option_to_yojson document_relevance_override_configuration_list_to_yojson
          x.document_relevance_override_configurations );
      ("PageNumber", option_to_yojson integer_to_yojson x.page_number);
      ("PageSize", option_to_yojson integer_to_yojson x.page_size);
      ( "SortingConfiguration",
        option_to_yojson sorting_configuration_to_yojson x.sorting_configuration );
      ( "SortingConfigurations",
        option_to_yojson sorting_configuration_list_to_yojson x.sorting_configurations );
      ("UserContext", option_to_yojson user_context_to_yojson x.user_context);
      ("VisitorId", option_to_yojson visitor_id_to_yojson x.visitor_id);
      ( "SpellCorrectionConfiguration",
        option_to_yojson spell_correction_configuration_to_yojson x.spell_correction_configuration
      );
      ( "CollapseConfiguration",
        option_to_yojson collapse_configuration_to_yojson x.collapse_configuration );
    ]

let principal_ordering_id_to_yojson = long_to_yojson
let user_id_to_yojson = string_to_yojson

let member_user_to_yojson (x : member_user) =
  assoc_to_yojson [ ("UserId", Some (user_id_to_yojson x.user_id)) ]

let member_users_to_yojson tree = list_to_yojson member_user_to_yojson tree
let group_id_to_yojson = string_to_yojson

let member_group_to_yojson (x : member_group) =
  assoc_to_yojson
    [
      ("GroupId", Some (group_id_to_yojson x.group_id));
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
    ]

let member_groups_to_yojson tree = list_to_yojson member_group_to_yojson tree

let group_members_to_yojson (x : group_members) =
  assoc_to_yojson
    [
      ("MemberGroups", option_to_yojson member_groups_to_yojson x.member_groups);
      ("MemberUsers", option_to_yojson member_users_to_yojson x.member_users);
      ("S3PathforGroupMembers", option_to_yojson s3_path_to_yojson x.s3_pathfor_group_members);
    ]

let put_principal_mapping_request_to_yojson (x : put_principal_mapping_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
      ("GroupId", Some (group_id_to_yojson x.group_id));
      ("GroupMembers", Some (group_members_to_yojson x.group_members));
      ("OrderingId", option_to_yojson principal_ordering_id_to_yojson x.ordering_id);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
    ]

let thesaurus_status_to_yojson (x : thesaurus_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE_BUT_UPDATE_FAILED -> `String "ACTIVE_BUT_UPDATE_FAILED"
  | FAILED -> `String "FAILED"

let thesaurus_summary_to_yojson (x : thesaurus_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson thesaurus_id_to_yojson x.id);
      ("Name", option_to_yojson thesaurus_name_to_yojson x.name);
      ("Status", option_to_yojson thesaurus_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let thesaurus_summary_items_to_yojson tree = list_to_yojson thesaurus_summary_to_yojson tree
let next_token_to_yojson = string_to_yojson

let list_thesauri_response_to_yojson (x : list_thesauri_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ThesaurusSummaryItems",
        option_to_yojson thesaurus_summary_items_to_yojson x.thesaurus_summary_items );
    ]

let max_results_integer_for_list_thesauri_request_to_yojson = int_to_yojson

let list_thesauri_request_to_yojson (x : list_thesauri_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_thesauri_request_to_yojson x.max_results );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let query_suggestions_block_list_status_to_yojson (x : query_suggestions_block_list_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE_BUT_UPDATE_FAILED -> `String "ACTIVE_BUT_UPDATE_FAILED"
  | FAILED -> `String "FAILED"

let query_suggestions_block_list_summary_to_yojson (x : query_suggestions_block_list_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson query_suggestions_block_list_id_to_yojson x.id);
      ("Name", option_to_yojson query_suggestions_block_list_name_to_yojson x.name);
      ("Status", option_to_yojson query_suggestions_block_list_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("ItemCount", option_to_yojson integer_to_yojson x.item_count);
    ]

let query_suggestions_block_list_summary_items_to_yojson tree =
  list_to_yojson query_suggestions_block_list_summary_to_yojson tree

let list_query_suggestions_block_lists_response_to_yojson
    (x : list_query_suggestions_block_lists_response) =
  assoc_to_yojson
    [
      ( "BlockListSummaryItems",
        option_to_yojson query_suggestions_block_list_summary_items_to_yojson
          x.block_list_summary_items );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_for_list_query_suggestions_block_lists_to_yojson = int_to_yojson

let list_query_suggestions_block_lists_request_to_yojson
    (x : list_query_suggestions_block_lists_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_query_suggestions_block_lists_to_yojson
          x.max_results );
    ]

let index_status_to_yojson (x : index_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"
  | UPDATING -> `String "UPDATING"
  | SYSTEM_UPDATING -> `String "SYSTEM_UPDATING"

let index_edition_to_yojson (x : index_edition) =
  match x with
  | DEVELOPER_EDITION -> `String "DEVELOPER_EDITION"
  | ENTERPRISE_EDITION -> `String "ENTERPRISE_EDITION"
  | GEN_AI_ENTERPRISE_EDITION -> `String "GEN_AI_ENTERPRISE_EDITION"

let index_configuration_summary_to_yojson (x : index_configuration_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson index_name_to_yojson x.name);
      ("Id", option_to_yojson index_id_to_yojson x.id);
      ("Edition", option_to_yojson index_edition_to_yojson x.edition);
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("UpdatedAt", Some (timestamp_to_yojson x.updated_at));
      ("Status", Some (index_status_to_yojson x.status));
    ]

let index_configuration_summary_list_to_yojson tree =
  list_to_yojson index_configuration_summary_to_yojson tree

let list_indices_response_to_yojson (x : list_indices_response) =
  assoc_to_yojson
    [
      ( "IndexConfigurationSummaryItems",
        option_to_yojson index_configuration_summary_list_to_yojson
          x.index_configuration_summary_items );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_for_list_indices_request_to_yojson = int_to_yojson

let list_indices_request_to_yojson (x : list_indices_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_indices_request_to_yojson x.max_results );
    ]

let group_summary_to_yojson (x : group_summary) =
  assoc_to_yojson
    [
      ("GroupId", option_to_yojson group_id_to_yojson x.group_id);
      ("OrderingId", option_to_yojson principal_ordering_id_to_yojson x.ordering_id);
    ]

let list_of_group_summaries_to_yojson tree = list_to_yojson group_summary_to_yojson tree

let list_groups_older_than_ordering_id_response_to_yojson
    (x : list_groups_older_than_ordering_id_response) =
  assoc_to_yojson
    [
      ("GroupsSummaries", option_to_yojson list_of_group_summaries_to_yojson x.groups_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_for_list_principals_request_to_yojson = int_to_yojson

let list_groups_older_than_ordering_id_request_to_yojson
    (x : list_groups_older_than_ordering_id_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
      ("OrderingId", Some (principal_ordering_id_to_yojson x.ordering_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_principals_request_to_yojson x.max_results );
    ]

let featured_results_set_summary_to_yojson (x : featured_results_set_summary) =
  assoc_to_yojson
    [
      ( "FeaturedResultsSetId",
        option_to_yojson featured_results_set_id_to_yojson x.featured_results_set_id );
      ( "FeaturedResultsSetName",
        option_to_yojson featured_results_set_name_to_yojson x.featured_results_set_name );
      ("Status", option_to_yojson featured_results_set_status_to_yojson x.status);
      ("LastUpdatedTimestamp", option_to_yojson long_to_yojson x.last_updated_timestamp);
      ("CreationTimestamp", option_to_yojson long_to_yojson x.creation_timestamp);
    ]

let featured_results_set_summary_items_to_yojson tree =
  list_to_yojson featured_results_set_summary_to_yojson tree

let list_featured_results_sets_response_to_yojson (x : list_featured_results_sets_response) =
  assoc_to_yojson
    [
      ( "FeaturedResultsSetSummaryItems",
        option_to_yojson featured_results_set_summary_items_to_yojson
          x.featured_results_set_summary_items );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_for_list_featured_results_sets_request_to_yojson = int_to_yojson

let list_featured_results_sets_request_to_yojson (x : list_featured_results_sets_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_featured_results_sets_request_to_yojson
          x.max_results );
    ]

let faq_file_format_to_yojson (x : faq_file_format) =
  match x with
  | CSV -> `String "CSV"
  | CSV_WITH_HEADER -> `String "CSV_WITH_HEADER"
  | JSON -> `String "JSON"

let faq_status_to_yojson (x : faq_status) =
  match x with
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"

let faq_name_to_yojson = string_to_yojson

let faq_summary_to_yojson (x : faq_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson faq_id_to_yojson x.id);
      ("Name", option_to_yojson faq_name_to_yojson x.name);
      ("Status", option_to_yojson faq_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("FileFormat", option_to_yojson faq_file_format_to_yojson x.file_format);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
    ]

let faq_summary_items_to_yojson tree = list_to_yojson faq_summary_to_yojson tree

let list_faqs_response_to_yojson (x : list_faqs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FaqSummaryItems", option_to_yojson faq_summary_items_to_yojson x.faq_summary_items);
    ]

let max_results_integer_for_list_faqs_request_to_yojson = int_to_yojson

let list_faqs_request_to_yojson (x : list_faqs_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_faqs_request_to_yojson x.max_results );
    ]

let endpoint_to_yojson = string_to_yojson
let endpoint_type_to_yojson (x : endpoint_type) = match x with HOME -> `String "HOME"

let experience_endpoint_to_yojson (x : experience_endpoint) =
  assoc_to_yojson
    [
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
    ]

let experience_endpoints_to_yojson tree = list_to_yojson experience_endpoint_to_yojson tree

let experience_status_to_yojson (x : experience_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"

let experiences_summary_to_yojson (x : experiences_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson experience_name_to_yojson x.name);
      ("Id", option_to_yojson experience_id_to_yojson x.id);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Status", option_to_yojson experience_status_to_yojson x.status);
      ("Endpoints", option_to_yojson experience_endpoints_to_yojson x.endpoints);
    ]

let experiences_summary_list_to_yojson tree = list_to_yojson experiences_summary_to_yojson tree

let list_experiences_response_to_yojson (x : list_experiences_response) =
  assoc_to_yojson
    [
      ("SummaryItems", option_to_yojson experiences_summary_list_to_yojson x.summary_items);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_for_list_experiences_request_to_yojson = int_to_yojson

let list_experiences_request_to_yojson (x : list_experiences_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_experiences_request_to_yojson x.max_results );
    ]

let name_type_to_yojson = string_to_yojson

let entity_display_data_to_yojson (x : entity_display_data) =
  assoc_to_yojson
    [
      ("UserName", option_to_yojson name_type_to_yojson x.user_name);
      ("GroupName", option_to_yojson name_type_to_yojson x.group_name);
      ("IdentifiedUserName", option_to_yojson name_type_to_yojson x.identified_user_name);
      ("FirstName", option_to_yojson name_type_to_yojson x.first_name);
      ("LastName", option_to_yojson name_type_to_yojson x.last_name);
    ]

let entity_type_to_yojson (x : entity_type) =
  match x with USER -> `String "USER" | GROUP -> `String "GROUP"

let entity_id_to_yojson = string_to_yojson

let experience_entities_summary_to_yojson (x : experience_entities_summary) =
  assoc_to_yojson
    [
      ("EntityId", option_to_yojson entity_id_to_yojson x.entity_id);
      ("EntityType", option_to_yojson entity_type_to_yojson x.entity_type);
      ("DisplayData", option_to_yojson entity_display_data_to_yojson x.display_data);
    ]

let experience_entities_summary_list_to_yojson tree =
  list_to_yojson experience_entities_summary_to_yojson tree

let list_experience_entities_response_to_yojson (x : list_experience_entities_response) =
  assoc_to_yojson
    [
      ("SummaryItems", option_to_yojson experience_entities_summary_list_to_yojson x.summary_items);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_experience_entities_request_to_yojson (x : list_experience_entities_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let persona_to_yojson (x : persona) =
  match x with OWNER -> `String "OWNER" | VIEWER -> `String "VIEWER"

let personas_summary_to_yojson (x : personas_summary) =
  assoc_to_yojson
    [
      ("EntityId", option_to_yojson entity_id_to_yojson x.entity_id);
      ("Persona", option_to_yojson persona_to_yojson x.persona);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let personas_summary_list_to_yojson tree = list_to_yojson personas_summary_to_yojson tree

let list_entity_personas_response_to_yojson (x : list_entity_personas_response) =
  assoc_to_yojson
    [
      ("SummaryItems", option_to_yojson personas_summary_list_to_yojson x.summary_items);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_for_list_entity_personas_request_to_yojson = int_to_yojson

let list_entity_personas_request_to_yojson (x : list_entity_personas_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_entity_personas_request_to_yojson
          x.max_results );
    ]

let metric_value_to_yojson = string_to_yojson

let data_source_sync_job_metrics_to_yojson (x : data_source_sync_job_metrics) =
  assoc_to_yojson
    [
      ("DocumentsAdded", option_to_yojson metric_value_to_yojson x.documents_added);
      ("DocumentsModified", option_to_yojson metric_value_to_yojson x.documents_modified);
      ("DocumentsDeleted", option_to_yojson metric_value_to_yojson x.documents_deleted);
      ("DocumentsFailed", option_to_yojson metric_value_to_yojson x.documents_failed);
      ("DocumentsScanned", option_to_yojson metric_value_to_yojson x.documents_scanned);
    ]

let error_code_to_yojson (x : error_code) =
  match x with
  | INTERNAL_ERROR -> `String "InternalError"
  | INVALID_REQUEST -> `String "InvalidRequest"

let data_source_sync_job_status_to_yojson (x : data_source_sync_job_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | SYNCING -> `String "SYNCING"
  | INCOMPLETE -> `String "INCOMPLETE"
  | STOPPING -> `String "STOPPING"
  | ABORTED -> `String "ABORTED"
  | SYNCING_INDEXING -> `String "SYNCING_INDEXING"

let data_source_sync_job_to_yojson (x : data_source_sync_job) =
  assoc_to_yojson
    [
      ("ExecutionId", option_to_yojson string__to_yojson x.execution_id);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Status", option_to_yojson data_source_sync_job_status_to_yojson x.status);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("DataSourceErrorCode", option_to_yojson string__to_yojson x.data_source_error_code);
      ("Metrics", option_to_yojson data_source_sync_job_metrics_to_yojson x.metrics);
    ]

let data_source_sync_job_history_list_to_yojson tree =
  list_to_yojson data_source_sync_job_to_yojson tree

let list_data_source_sync_jobs_response_to_yojson (x : list_data_source_sync_jobs_response) =
  assoc_to_yojson
    [
      ("History", option_to_yojson data_source_sync_job_history_list_to_yojson x.history);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let time_range_to_yojson (x : time_range) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
    ]

let max_results_integer_for_list_data_source_sync_jobs_request_to_yojson = int_to_yojson

let list_data_source_sync_jobs_request_to_yojson (x : list_data_source_sync_jobs_request) =
  assoc_to_yojson
    [
      ("Id", Some (data_source_id_to_yojson x.id));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_data_source_sync_jobs_request_to_yojson
          x.max_results );
      ("StartTimeFilter", option_to_yojson time_range_to_yojson x.start_time_filter);
      ("StatusFilter", option_to_yojson data_source_sync_job_status_to_yojson x.status_filter);
    ]

let data_source_status_to_yojson (x : data_source_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"

let data_source_type_to_yojson (x : data_source_type) =
  match x with
  | S3 -> `String "S3"
  | SHAREPOINT -> `String "SHAREPOINT"
  | DATABASE -> `String "DATABASE"
  | SALESFORCE -> `String "SALESFORCE"
  | ONEDRIVE -> `String "ONEDRIVE"
  | SERVICENOW -> `String "SERVICENOW"
  | CUSTOM -> `String "CUSTOM"
  | CONFLUENCE -> `String "CONFLUENCE"
  | GOOGLEDRIVE -> `String "GOOGLEDRIVE"
  | WEBCRAWLER -> `String "WEBCRAWLER"
  | WORKDOCS -> `String "WORKDOCS"
  | FSX -> `String "FSX"
  | SLACK -> `String "SLACK"
  | BOX -> `String "BOX"
  | QUIP -> `String "QUIP"
  | JIRA -> `String "JIRA"
  | GITHUB -> `String "GITHUB"
  | ALFRESCO -> `String "ALFRESCO"
  | TEMPLATE -> `String "TEMPLATE"

let data_source_summary_to_yojson (x : data_source_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson data_source_name_to_yojson x.name);
      ("Id", option_to_yojson data_source_id_to_yojson x.id);
      ("Type", option_to_yojson data_source_type_to_yojson x.type_);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("Status", option_to_yojson data_source_status_to_yojson x.status);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
    ]

let data_source_summary_list_to_yojson tree = list_to_yojson data_source_summary_to_yojson tree

let list_data_sources_response_to_yojson (x : list_data_sources_response) =
  assoc_to_yojson
    [
      ("SummaryItems", option_to_yojson data_source_summary_list_to_yojson x.summary_items);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_integer_for_list_data_sources_request_to_yojson = int_to_yojson

let list_data_sources_request_to_yojson (x : list_data_sources_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_data_sources_request_to_yojson x.max_results
      );
    ]

let access_control_configuration_summary_to_yojson (x : access_control_configuration_summary) =
  assoc_to_yojson [ ("Id", Some (access_control_configuration_id_to_yojson x.id)) ]

let access_control_configuration_summary_list_to_yojson tree =
  list_to_yojson access_control_configuration_summary_to_yojson tree

let list_access_control_configurations_response_to_yojson
    (x : list_access_control_configurations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "AccessControlConfigurations",
        Some (access_control_configuration_summary_list_to_yojson x.access_control_configurations)
      );
    ]

let max_results_integer_for_list_access_control_configurations_request_to_yojson = int_to_yojson

let list_access_control_configurations_request_to_yojson
    (x : list_access_control_configurations_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson
          max_results_integer_for_list_access_control_configurations_request_to_yojson x.max_results
      );
    ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let snapshots_data_record_to_yojson tree = list_to_yojson string__to_yojson tree
let snapshots_data_records_to_yojson tree = list_to_yojson snapshots_data_record_to_yojson tree
let snapshots_data_header_fields_to_yojson tree = list_to_yojson string__to_yojson tree

let get_snapshots_response_to_yojson (x : get_snapshots_response) =
  assoc_to_yojson
    [
      ("SnapShotTimeFilter", option_to_yojson time_range_to_yojson x.snap_shot_time_filter);
      ( "SnapshotsDataHeader",
        option_to_yojson snapshots_data_header_fields_to_yojson x.snapshots_data_header );
      ("SnapshotsData", option_to_yojson snapshots_data_records_to_yojson x.snapshots_data);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let metric_type_to_yojson (x : metric_type) =
  match x with
  | QUERIES_BY_COUNT -> `String "QUERIES_BY_COUNT"
  | QUERIES_BY_ZERO_CLICK_RATE -> `String "QUERIES_BY_ZERO_CLICK_RATE"
  | QUERIES_BY_ZERO_RESULT_RATE -> `String "QUERIES_BY_ZERO_RESULT_RATE"
  | DOCS_BY_CLICK_COUNT -> `String "DOCS_BY_CLICK_COUNT"
  | AGG_QUERY_DOC_METRICS -> `String "AGG_QUERY_DOC_METRICS"
  | TREND_QUERY_DOC_METRICS -> `String "TREND_QUERY_DOC_METRICS"

let interval_to_yojson (x : interval) =
  match x with
  | THIS_MONTH -> `String "THIS_MONTH"
  | THIS_WEEK -> `String "THIS_WEEK"
  | ONE_WEEK_AGO -> `String "ONE_WEEK_AGO"
  | TWO_WEEKS_AGO -> `String "TWO_WEEKS_AGO"
  | ONE_MONTH_AGO -> `String "ONE_MONTH_AGO"
  | TWO_MONTHS_AGO -> `String "TWO_MONTHS_AGO"

let get_snapshots_request_to_yojson (x : get_snapshots_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Interval", Some (interval_to_yojson x.interval));
      ("MetricType", Some (metric_type_to_yojson x.metric_type));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let source_document_to_yojson (x : source_document) =
  assoc_to_yojson
    [
      ("DocumentId", option_to_yojson string__to_yojson x.document_id);
      ( "SuggestionAttributes",
        option_to_yojson document_attribute_key_list_to_yojson x.suggestion_attributes );
      ( "AdditionalAttributes",
        option_to_yojson document_attribute_list_to_yojson x.additional_attributes );
    ]

let source_documents_to_yojson tree = list_to_yojson source_document_to_yojson tree

let suggestion_highlight_to_yojson (x : suggestion_highlight) =
  assoc_to_yojson
    [
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
    ]

let suggestion_highlight_list_to_yojson tree = list_to_yojson suggestion_highlight_to_yojson tree

let suggestion_text_with_highlights_to_yojson (x : suggestion_text_with_highlights) =
  assoc_to_yojson
    [
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Highlights", option_to_yojson suggestion_highlight_list_to_yojson x.highlights);
    ]

let suggestion_value_to_yojson (x : suggestion_value) =
  assoc_to_yojson [ ("Text", option_to_yojson suggestion_text_with_highlights_to_yojson x.text) ]

let suggestion_to_yojson (x : suggestion) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson result_id_to_yojson x.id);
      ("Value", option_to_yojson suggestion_value_to_yojson x.value);
      ("SourceDocuments", option_to_yojson source_documents_to_yojson x.source_documents);
    ]

let suggestion_list_to_yojson tree = list_to_yojson suggestion_to_yojson tree
let query_suggestions_id_to_yojson = string_to_yojson

let get_query_suggestions_response_to_yojson (x : get_query_suggestions_response) =
  assoc_to_yojson
    [
      ("QuerySuggestionsId", option_to_yojson query_suggestions_id_to_yojson x.query_suggestions_id);
      ("Suggestions", option_to_yojson suggestion_list_to_yojson x.suggestions);
    ]

let attribute_suggestions_get_config_to_yojson (x : attribute_suggestions_get_config) =
  assoc_to_yojson
    [
      ( "SuggestionAttributes",
        option_to_yojson document_attribute_key_list_to_yojson x.suggestion_attributes );
      ( "AdditionalResponseAttributes",
        option_to_yojson document_attribute_key_list_to_yojson x.additional_response_attributes );
      ("AttributeFilter", option_to_yojson attribute_filter_to_yojson x.attribute_filter);
      ("UserContext", option_to_yojson user_context_to_yojson x.user_context);
    ]

let suggestion_type_to_yojson (x : suggestion_type) =
  match x with QUERY -> `String "QUERY" | DOCUMENT_ATTRIBUTES -> `String "DOCUMENT_ATTRIBUTES"

let suggestion_types_to_yojson tree = list_to_yojson suggestion_type_to_yojson tree
let suggestion_query_text_to_yojson = string_to_yojson

let get_query_suggestions_request_to_yojson (x : get_query_suggestions_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("QueryText", Some (suggestion_query_text_to_yojson x.query_text));
      ("MaxSuggestionsCount", option_to_yojson integer_to_yojson x.max_suggestions_count);
      ("SuggestionTypes", option_to_yojson suggestion_types_to_yojson x.suggestion_types);
      ( "AttributeSuggestionsConfig",
        option_to_yojson attribute_suggestions_get_config_to_yojson x.attribute_suggestions_config
      );
    ]

let failed_entity_to_yojson (x : failed_entity) =
  assoc_to_yojson
    [
      ("EntityId", option_to_yojson entity_id_to_yojson x.entity_id);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let failed_entity_list_to_yojson tree = list_to_yojson failed_entity_to_yojson tree

let disassociate_personas_from_entities_response_to_yojson
    (x : disassociate_personas_from_entities_response) =
  assoc_to_yojson
    [ ("FailedEntityList", option_to_yojson failed_entity_list_to_yojson x.failed_entity_list) ]

let entity_ids_list_to_yojson tree = list_to_yojson entity_id_to_yojson tree

let disassociate_personas_from_entities_request_to_yojson
    (x : disassociate_personas_from_entities_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("EntityIds", Some (entity_ids_list_to_yojson x.entity_ids));
    ]

let disassociate_entities_from_experience_response_to_yojson
    (x : disassociate_entities_from_experience_response) =
  assoc_to_yojson
    [ ("FailedEntityList", option_to_yojson failed_entity_list_to_yojson x.failed_entity_list) ]

let entity_configuration_to_yojson (x : entity_configuration) =
  assoc_to_yojson
    [
      ("EntityId", Some (entity_id_to_yojson x.entity_id));
      ("EntityType", Some (entity_type_to_yojson x.entity_type));
    ]

let disassociate_entity_list_to_yojson tree = list_to_yojson entity_configuration_to_yojson tree

let disassociate_entities_from_experience_request_to_yojson
    (x : disassociate_entities_from_experience_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("EntityList", Some (disassociate_entity_list_to_yojson x.entity_list));
    ]

let describe_thesaurus_response_to_yojson (x : describe_thesaurus_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson thesaurus_id_to_yojson x.id);
      ("IndexId", option_to_yojson index_id_to_yojson x.index_id);
      ("Name", option_to_yojson thesaurus_name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson thesaurus_status_to_yojson x.status);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("SourceS3Path", option_to_yojson s3_path_to_yojson x.source_s3_path);
      ("FileSizeBytes", option_to_yojson long_to_yojson x.file_size_bytes);
      ("TermCount", option_to_yojson long_to_yojson x.term_count);
      ("SynonymRuleCount", option_to_yojson long_to_yojson x.synonym_rule_count);
    ]

let describe_thesaurus_request_to_yojson (x : describe_thesaurus_request) =
  assoc_to_yojson
    [
      ("Id", Some (thesaurus_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id));
    ]

let attribute_suggestions_describe_config_to_yojson (x : attribute_suggestions_describe_config) =
  assoc_to_yojson
    [
      ( "SuggestableConfigList",
        option_to_yojson suggestable_config_list_to_yojson x.suggestable_config_list );
      ( "AttributeSuggestionsMode",
        option_to_yojson attribute_suggestions_mode_to_yojson x.attribute_suggestions_mode );
    ]

let query_suggestions_status_to_yojson (x : query_suggestions_status) =
  match x with ACTIVE -> `String "ACTIVE" | UPDATING -> `String "UPDATING"

let describe_query_suggestions_config_response_to_yojson
    (x : describe_query_suggestions_config_response) =
  assoc_to_yojson
    [
      ("Mode", option_to_yojson mode_to_yojson x.mode);
      ("Status", option_to_yojson query_suggestions_status_to_yojson x.status);
      ( "QueryLogLookBackWindowInDays",
        option_to_yojson integer_to_yojson x.query_log_look_back_window_in_days );
      ( "IncludeQueriesWithoutUserInformation",
        option_to_yojson object_boolean_to_yojson x.include_queries_without_user_information );
      ( "MinimumNumberOfQueryingUsers",
        option_to_yojson minimum_number_of_querying_users_to_yojson
          x.minimum_number_of_querying_users );
      ("MinimumQueryCount", option_to_yojson minimum_query_count_to_yojson x.minimum_query_count);
      ( "LastSuggestionsBuildTime",
        option_to_yojson timestamp_to_yojson x.last_suggestions_build_time );
      ("LastClearTime", option_to_yojson timestamp_to_yojson x.last_clear_time);
      ("TotalSuggestionsCount", option_to_yojson integer_to_yojson x.total_suggestions_count);
      ( "AttributeSuggestionsConfig",
        option_to_yojson attribute_suggestions_describe_config_to_yojson
          x.attribute_suggestions_config );
    ]

let describe_query_suggestions_config_request_to_yojson
    (x : describe_query_suggestions_config_request) =
  assoc_to_yojson [ ("IndexId", Some (index_id_to_yojson x.index_id)) ]

let describe_query_suggestions_block_list_response_to_yojson
    (x : describe_query_suggestions_block_list_response) =
  assoc_to_yojson
    [
      ("IndexId", option_to_yojson index_id_to_yojson x.index_id);
      ("Id", option_to_yojson query_suggestions_block_list_id_to_yojson x.id);
      ("Name", option_to_yojson query_suggestions_block_list_name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson query_suggestions_block_list_status_to_yojson x.status);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("SourceS3Path", option_to_yojson s3_path_to_yojson x.source_s3_path);
      ("ItemCount", option_to_yojson integer_to_yojson x.item_count);
      ("FileSizeBytes", option_to_yojson long_to_yojson x.file_size_bytes);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
    ]

let describe_query_suggestions_block_list_request_to_yojson
    (x : describe_query_suggestions_block_list_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Id", Some (query_suggestions_block_list_id_to_yojson x.id));
    ]

let failure_reason_to_yojson = string_to_yojson

let principal_mapping_status_to_yojson (x : principal_mapping_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | PROCESSING -> `String "PROCESSING"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"

let group_ordering_id_summary_to_yojson (x : group_ordering_id_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson principal_mapping_status_to_yojson x.status);
      ("LastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ("ReceivedAt", option_to_yojson timestamp_to_yojson x.received_at);
      ("OrderingId", option_to_yojson principal_ordering_id_to_yojson x.ordering_id);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let group_ordering_id_summaries_to_yojson tree =
  list_to_yojson group_ordering_id_summary_to_yojson tree

let describe_principal_mapping_response_to_yojson (x : describe_principal_mapping_response) =
  assoc_to_yojson
    [
      ("IndexId", option_to_yojson index_id_to_yojson x.index_id);
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
      ("GroupId", option_to_yojson group_id_to_yojson x.group_id);
      ( "GroupOrderingIdSummaries",
        option_to_yojson group_ordering_id_summaries_to_yojson x.group_ordering_id_summaries );
    ]

let describe_principal_mapping_request_to_yojson (x : describe_principal_mapping_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
      ("GroupId", Some (group_id_to_yojson x.group_id));
    ]

let indexed_text_bytes_to_yojson = long_to_yojson
let indexed_text_documents_count_to_yojson = int_to_yojson

let text_document_statistics_to_yojson (x : text_document_statistics) =
  assoc_to_yojson
    [
      ( "IndexedTextDocumentsCount",
        Some (indexed_text_documents_count_to_yojson x.indexed_text_documents_count) );
      ("IndexedTextBytes", Some (indexed_text_bytes_to_yojson x.indexed_text_bytes));
    ]

let indexed_question_answers_count_to_yojson = int_to_yojson

let faq_statistics_to_yojson (x : faq_statistics) =
  assoc_to_yojson
    [
      ( "IndexedQuestionAnswersCount",
        Some (indexed_question_answers_count_to_yojson x.indexed_question_answers_count) );
    ]

let index_statistics_to_yojson (x : index_statistics) =
  assoc_to_yojson
    [
      ("FaqStatistics", Some (faq_statistics_to_yojson x.faq_statistics));
      ( "TextDocumentStatistics",
        Some (text_document_statistics_to_yojson x.text_document_statistics) );
    ]

let kms_key_id_to_yojson = string_to_yojson

let server_side_encryption_configuration_to_yojson (x : server_side_encryption_configuration) =
  assoc_to_yojson [ ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id) ]

let describe_index_response_to_yojson (x : describe_index_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson index_name_to_yojson x.name);
      ("Id", option_to_yojson index_id_to_yojson x.id);
      ("Edition", option_to_yojson index_edition_to_yojson x.edition);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "ServerSideEncryptionConfiguration",
        option_to_yojson server_side_encryption_configuration_to_yojson
          x.server_side_encryption_configuration );
      ("Status", option_to_yojson index_status_to_yojson x.status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ( "DocumentMetadataConfigurations",
        option_to_yojson document_metadata_configuration_list_to_yojson
          x.document_metadata_configurations );
      ("IndexStatistics", option_to_yojson index_statistics_to_yojson x.index_statistics);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("CapacityUnits", option_to_yojson capacity_units_configuration_to_yojson x.capacity_units);
      ( "UserTokenConfigurations",
        option_to_yojson user_token_configuration_list_to_yojson x.user_token_configurations );
      ("UserContextPolicy", option_to_yojson user_context_policy_to_yojson x.user_context_policy);
      ( "UserGroupResolutionConfiguration",
        option_to_yojson user_group_resolution_configuration_to_yojson
          x.user_group_resolution_configuration );
    ]

let describe_index_request_to_yojson (x : describe_index_request) =
  assoc_to_yojson [ ("Id", Some (index_id_to_yojson x.id)) ]

let featured_document_missing_to_yojson (x : featured_document_missing) =
  assoc_to_yojson [ ("Id", option_to_yojson document_id_to_yojson x.id) ]

let featured_document_missing_list_to_yojson tree =
  list_to_yojson featured_document_missing_to_yojson tree

let featured_document_with_metadata_to_yojson (x : featured_document_with_metadata) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson document_id_to_yojson x.id);
      ("Title", option_to_yojson string__to_yojson x.title);
      ("URI", option_to_yojson url_to_yojson x.ur_i);
    ]

let featured_document_with_metadata_list_to_yojson tree =
  list_to_yojson featured_document_with_metadata_to_yojson tree

let describe_featured_results_set_response_to_yojson (x : describe_featured_results_set_response) =
  assoc_to_yojson
    [
      ( "FeaturedResultsSetId",
        option_to_yojson featured_results_set_id_to_yojson x.featured_results_set_id );
      ( "FeaturedResultsSetName",
        option_to_yojson featured_results_set_name_to_yojson x.featured_results_set_name );
      ("Description", option_to_yojson featured_results_set_description_to_yojson x.description);
      ("Status", option_to_yojson featured_results_set_status_to_yojson x.status);
      ("QueryTexts", option_to_yojson query_text_list_to_yojson x.query_texts);
      ( "FeaturedDocumentsWithMetadata",
        option_to_yojson featured_document_with_metadata_list_to_yojson
          x.featured_documents_with_metadata );
      ( "FeaturedDocumentsMissing",
        option_to_yojson featured_document_missing_list_to_yojson x.featured_documents_missing );
      ("LastUpdatedTimestamp", option_to_yojson long_to_yojson x.last_updated_timestamp);
      ("CreationTimestamp", option_to_yojson long_to_yojson x.creation_timestamp);
    ]

let describe_featured_results_set_request_to_yojson (x : describe_featured_results_set_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("FeaturedResultsSetId", Some (featured_results_set_id_to_yojson x.featured_results_set_id));
    ]

let describe_faq_response_to_yojson (x : describe_faq_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson faq_id_to_yojson x.id);
      ("IndexId", option_to_yojson index_id_to_yojson x.index_id);
      ("Name", option_to_yojson faq_name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("S3Path", option_to_yojson s3_path_to_yojson x.s3_path);
      ("Status", option_to_yojson faq_status_to_yojson x.status);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("FileFormat", option_to_yojson faq_file_format_to_yojson x.file_format);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
    ]

let describe_faq_request_to_yojson (x : describe_faq_request) =
  assoc_to_yojson
    [ ("Id", Some (faq_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id)) ]

let describe_experience_response_to_yojson (x : describe_experience_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson experience_id_to_yojson x.id);
      ("IndexId", option_to_yojson index_id_to_yojson x.index_id);
      ("Name", option_to_yojson experience_name_to_yojson x.name);
      ("Endpoints", option_to_yojson experience_endpoints_to_yojson x.endpoints);
      ("Configuration", option_to_yojson experience_configuration_to_yojson x.configuration);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson experience_status_to_yojson x.status);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let describe_experience_request_to_yojson (x : describe_experience_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id));
    ]

let describe_data_source_response_to_yojson (x : describe_data_source_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson data_source_id_to_yojson x.id);
      ("IndexId", option_to_yojson index_id_to_yojson x.index_id);
      ("Name", option_to_yojson data_source_name_to_yojson x.name);
      ("Type", option_to_yojson data_source_type_to_yojson x.type_);
      ("Configuration", option_to_yojson data_source_configuration_to_yojson x.configuration);
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson data_source_status_to_yojson x.status);
      ("Schedule", option_to_yojson scan_schedule_to_yojson x.schedule);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "CustomDocumentEnrichmentConfiguration",
        option_to_yojson custom_document_enrichment_configuration_to_yojson
          x.custom_document_enrichment_configuration );
    ]

let describe_data_source_request_to_yojson (x : describe_data_source_request) =
  assoc_to_yojson
    [
      ("Id", Some (data_source_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id));
    ]

let describe_access_control_configuration_response_to_yojson
    (x : describe_access_control_configuration_response) =
  assoc_to_yojson
    [
      ("Name", Some (access_control_configuration_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("AccessControlList", option_to_yojson principal_list_to_yojson x.access_control_list);
      ( "HierarchicalAccessControlList",
        option_to_yojson hierarchical_principal_list_to_yojson x.hierarchical_access_control_list );
    ]

let describe_access_control_configuration_request_to_yojson
    (x : describe_access_control_configuration_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Id", Some (access_control_configuration_id_to_yojson x.id));
    ]

let delete_thesaurus_request_to_yojson (x : delete_thesaurus_request) =
  assoc_to_yojson
    [
      ("Id", Some (thesaurus_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id));
    ]

let delete_query_suggestions_block_list_request_to_yojson
    (x : delete_query_suggestions_block_list_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Id", Some (query_suggestions_block_list_id_to_yojson x.id));
    ]

let delete_principal_mapping_request_to_yojson (x : delete_principal_mapping_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
      ("GroupId", Some (group_id_to_yojson x.group_id));
      ("OrderingId", option_to_yojson principal_ordering_id_to_yojson x.ordering_id);
    ]

let delete_index_request_to_yojson (x : delete_index_request) =
  assoc_to_yojson [ ("Id", Some (index_id_to_yojson x.id)) ]

let delete_faq_request_to_yojson (x : delete_faq_request) =
  assoc_to_yojson
    [ ("Id", Some (faq_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id)) ]

let delete_experience_response_to_yojson = unit_to_yojson

let delete_experience_request_to_yojson (x : delete_experience_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id));
    ]

let delete_data_source_request_to_yojson (x : delete_data_source_request) =
  assoc_to_yojson
    [
      ("Id", Some (data_source_id_to_yojson x.id)); ("IndexId", Some (index_id_to_yojson x.index_id));
    ]

let delete_access_control_configuration_response_to_yojson = unit_to_yojson

let delete_access_control_configuration_request_to_yojson
    (x : delete_access_control_configuration_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Id", Some (access_control_configuration_id_to_yojson x.id));
    ]

let create_thesaurus_response_to_yojson (x : create_thesaurus_response) =
  assoc_to_yojson [ ("Id", option_to_yojson thesaurus_id_to_yojson x.id) ]

let client_token_name_to_yojson = string_to_yojson

let create_thesaurus_request_to_yojson (x : create_thesaurus_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Name", Some (thesaurus_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SourceS3Path", Some (s3_path_to_yojson x.source_s3_path));
      ( "ClientToken",
        Some
          (client_token_name_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_query_suggestions_block_list_response_to_yojson
    (x : create_query_suggestions_block_list_response) =
  assoc_to_yojson [ ("Id", option_to_yojson query_suggestions_block_list_id_to_yojson x.id) ]

let create_query_suggestions_block_list_request_to_yojson
    (x : create_query_suggestions_block_list_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Name", Some (query_suggestions_block_list_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("SourceS3Path", Some (s3_path_to_yojson x.source_s3_path));
      ( "ClientToken",
        Some
          (client_token_name_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let resource_already_exist_exception_to_yojson (x : resource_already_exist_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_index_response_to_yojson (x : create_index_response) =
  assoc_to_yojson [ ("Id", option_to_yojson index_id_to_yojson x.id) ]

let create_index_request_to_yojson (x : create_index_request) =
  assoc_to_yojson
    [
      ("Name", Some (index_name_to_yojson x.name));
      ("Edition", option_to_yojson index_edition_to_yojson x.edition);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "ServerSideEncryptionConfiguration",
        option_to_yojson server_side_encryption_configuration_to_yojson
          x.server_side_encryption_configuration );
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ClientToken",
        Some
          (client_token_name_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "UserTokenConfigurations",
        option_to_yojson user_token_configuration_list_to_yojson x.user_token_configurations );
      ("UserContextPolicy", option_to_yojson user_context_policy_to_yojson x.user_context_policy);
      ( "UserGroupResolutionConfiguration",
        option_to_yojson user_group_resolution_configuration_to_yojson
          x.user_group_resolution_configuration );
    ]

let create_featured_results_set_response_to_yojson (x : create_featured_results_set_response) =
  assoc_to_yojson
    [
      ("FeaturedResultsSet", option_to_yojson featured_results_set_to_yojson x.featured_results_set);
    ]

let create_featured_results_set_request_to_yojson (x : create_featured_results_set_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ( "FeaturedResultsSetName",
        Some (featured_results_set_name_to_yojson x.featured_results_set_name) );
      ("Description", option_to_yojson featured_results_set_description_to_yojson x.description);
      ("ClientToken", option_to_yojson client_token_name_to_yojson x.client_token);
      ("Status", option_to_yojson featured_results_set_status_to_yojson x.status);
      ("QueryTexts", option_to_yojson query_text_list_to_yojson x.query_texts);
      ("FeaturedDocuments", option_to_yojson featured_document_list_to_yojson x.featured_documents);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_faq_response_to_yojson (x : create_faq_response) =
  assoc_to_yojson [ ("Id", option_to_yojson faq_id_to_yojson x.id) ]

let create_faq_request_to_yojson (x : create_faq_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Name", Some (faq_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("S3Path", Some (s3_path_to_yojson x.s3_path));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FileFormat", option_to_yojson faq_file_format_to_yojson x.file_format);
      ( "ClientToken",
        Some
          (client_token_name_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
    ]

let create_experience_response_to_yojson (x : create_experience_response) =
  assoc_to_yojson [ ("Id", Some (experience_id_to_yojson x.id)) ]

let create_experience_request_to_yojson (x : create_experience_request) =
  assoc_to_yojson
    [
      ("Name", Some (experience_name_to_yojson x.name));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Configuration", option_to_yojson experience_configuration_to_yojson x.configuration);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ClientToken",
        Some
          (client_token_name_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_data_source_response_to_yojson (x : create_data_source_response) =
  assoc_to_yojson [ ("Id", Some (data_source_id_to_yojson x.id)) ]

let create_data_source_request_to_yojson (x : create_data_source_request) =
  assoc_to_yojson
    [
      ("Name", Some (data_source_name_to_yojson x.name));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Type", Some (data_source_type_to_yojson x.type_));
      ("Configuration", option_to_yojson data_source_configuration_to_yojson x.configuration);
      ( "VpcConfiguration",
        option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Schedule", option_to_yojson scan_schedule_to_yojson x.schedule);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_name_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "CustomDocumentEnrichmentConfiguration",
        option_to_yojson custom_document_enrichment_configuration_to_yojson
          x.custom_document_enrichment_configuration );
    ]

let create_access_control_configuration_response_to_yojson
    (x : create_access_control_configuration_response) =
  assoc_to_yojson [ ("Id", Some (access_control_configuration_id_to_yojson x.id)) ]

let create_access_control_configuration_request_to_yojson
    (x : create_access_control_configuration_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Name", Some (access_control_configuration_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("AccessControlList", option_to_yojson principal_list_to_yojson x.access_control_list);
      ( "HierarchicalAccessControlList",
        option_to_yojson hierarchical_principal_list_to_yojson x.hierarchical_access_control_list );
      ( "ClientToken",
        Some
          (client_token_name_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let clear_query_suggestions_request_to_yojson (x : clear_query_suggestions_request) =
  assoc_to_yojson [ ("IndexId", Some (index_id_to_yojson x.index_id)) ]

let batch_put_document_response_failed_document_to_yojson
    (x : batch_put_document_response_failed_document) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson document_id_to_yojson x.id);
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let batch_put_document_response_failed_documents_to_yojson tree =
  list_to_yojson batch_put_document_response_failed_document_to_yojson tree

let batch_put_document_response_to_yojson (x : batch_put_document_response) =
  assoc_to_yojson
    [
      ( "FailedDocuments",
        option_to_yojson batch_put_document_response_failed_documents_to_yojson x.failed_documents
      );
    ]

let content_type_to_yojson (x : content_type) =
  match x with
  | PDF -> `String "PDF"
  | HTML -> `String "HTML"
  | MS_WORD -> `String "MS_WORD"
  | PLAIN_TEXT -> `String "PLAIN_TEXT"
  | PPT -> `String "PPT"
  | RTF -> `String "RTF"
  | XML -> `String "XML"
  | XSLT -> `String "XSLT"
  | MS_EXCEL -> `String "MS_EXCEL"
  | CSV -> `String "CSV"
  | JSON -> `String "JSON"
  | MD -> `String "MD"

let blob_to_yojson = blob_to_yojson
let title_to_yojson = string_to_yojson

let document_to_yojson (x : document) =
  assoc_to_yojson
    [
      ("Id", Some (document_id_to_yojson x.id));
      ("Title", option_to_yojson title_to_yojson x.title);
      ("Blob", option_to_yojson blob_to_yojson x.blob);
      ("S3Path", option_to_yojson s3_path_to_yojson x.s3_path);
      ("Attributes", option_to_yojson document_attribute_list_to_yojson x.attributes);
      ("AccessControlList", option_to_yojson principal_list_to_yojson x.access_control_list);
      ( "HierarchicalAccessControlList",
        option_to_yojson hierarchical_principal_list_to_yojson x.hierarchical_access_control_list );
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ( "AccessControlConfigurationId",
        option_to_yojson access_control_configuration_id_to_yojson x.access_control_configuration_id
      );
    ]

let document_list_to_yojson tree = list_to_yojson document_to_yojson tree

let batch_put_document_request_to_yojson (x : batch_put_document_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Documents", Some (document_list_to_yojson x.documents));
      ( "CustomDocumentEnrichmentConfiguration",
        option_to_yojson custom_document_enrichment_configuration_to_yojson
          x.custom_document_enrichment_configuration );
    ]

let document_status_to_yojson (x : document_status) =
  match x with
  | NOT_FOUND -> `String "NOT_FOUND"
  | PROCESSING -> `String "PROCESSING"
  | INDEXED -> `String "INDEXED"
  | UPDATED -> `String "UPDATED"
  | FAILED -> `String "FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let status_to_yojson (x : status) =
  assoc_to_yojson
    [
      ("DocumentId", option_to_yojson document_id_to_yojson x.document_id);
      ("DocumentStatus", option_to_yojson document_status_to_yojson x.document_status);
      ("FailureCode", option_to_yojson string__to_yojson x.failure_code);
      ("FailureReason", option_to_yojson string__to_yojson x.failure_reason);
    ]

let document_status_list_to_yojson tree = list_to_yojson status_to_yojson tree

let batch_get_document_status_response_error_to_yojson
    (x : batch_get_document_status_response_error) =
  assoc_to_yojson
    [
      ("DocumentId", option_to_yojson document_id_to_yojson x.document_id);
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let batch_get_document_status_response_errors_to_yojson tree =
  list_to_yojson batch_get_document_status_response_error_to_yojson tree

let batch_get_document_status_response_to_yojson (x : batch_get_document_status_response) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson batch_get_document_status_response_errors_to_yojson x.errors);
      ("DocumentStatusList", option_to_yojson document_status_list_to_yojson x.document_status_list);
    ]

let document_info_to_yojson (x : document_info) =
  assoc_to_yojson
    [
      ("DocumentId", Some (document_id_to_yojson x.document_id));
      ("Attributes", option_to_yojson document_attribute_list_to_yojson x.attributes);
    ]

let document_info_list_to_yojson tree = list_to_yojson document_info_to_yojson tree

let batch_get_document_status_request_to_yojson (x : batch_get_document_status_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("DocumentInfoList", Some (document_info_list_to_yojson x.document_info_list));
    ]

let batch_delete_featured_results_set_error_to_yojson (x : batch_delete_featured_results_set_error)
    =
  assoc_to_yojson
    [
      ("Id", Some (featured_results_set_id_to_yojson x.id));
      ("ErrorCode", Some (error_code_to_yojson x.error_code));
      ("ErrorMessage", Some (error_message_to_yojson x.error_message));
    ]

let batch_delete_featured_results_set_errors_to_yojson tree =
  list_to_yojson batch_delete_featured_results_set_error_to_yojson tree

let batch_delete_featured_results_set_response_to_yojson
    (x : batch_delete_featured_results_set_response) =
  assoc_to_yojson [ ("Errors", Some (batch_delete_featured_results_set_errors_to_yojson x.errors)) ]

let featured_results_set_id_list_to_yojson tree =
  list_to_yojson featured_results_set_id_to_yojson tree

let batch_delete_featured_results_set_request_to_yojson
    (x : batch_delete_featured_results_set_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ( "FeaturedResultsSetIds",
        Some (featured_results_set_id_list_to_yojson x.featured_results_set_ids) );
    ]

let batch_delete_document_response_failed_document_to_yojson
    (x : batch_delete_document_response_failed_document) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson document_id_to_yojson x.id);
      ("DataSourceId", option_to_yojson data_source_id_to_yojson x.data_source_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let batch_delete_document_response_failed_documents_to_yojson tree =
  list_to_yojson batch_delete_document_response_failed_document_to_yojson tree

let batch_delete_document_response_to_yojson (x : batch_delete_document_response) =
  assoc_to_yojson
    [
      ( "FailedDocuments",
        option_to_yojson batch_delete_document_response_failed_documents_to_yojson
          x.failed_documents );
    ]

let data_source_sync_job_id_to_yojson = string_to_yojson

let data_source_sync_job_metric_target_to_yojson (x : data_source_sync_job_metric_target) =
  assoc_to_yojson
    [
      ("DataSourceId", Some (data_source_id_to_yojson x.data_source_id));
      ( "DataSourceSyncJobId",
        option_to_yojson data_source_sync_job_id_to_yojson x.data_source_sync_job_id );
    ]

let document_id_list_to_yojson tree = list_to_yojson document_id_to_yojson tree

let batch_delete_document_request_to_yojson (x : batch_delete_document_request) =
  assoc_to_yojson
    [
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("DocumentIdList", Some (document_id_list_to_yojson x.document_id_list));
      ( "DataSourceSyncJobMetricTarget",
        option_to_yojson data_source_sync_job_metric_target_to_yojson
          x.data_source_sync_job_metric_target );
    ]

let associate_personas_to_entities_response_to_yojson (x : associate_personas_to_entities_response)
    =
  assoc_to_yojson
    [ ("FailedEntityList", option_to_yojson failed_entity_list_to_yojson x.failed_entity_list) ]

let entity_persona_configuration_to_yojson (x : entity_persona_configuration) =
  assoc_to_yojson
    [
      ("EntityId", Some (entity_id_to_yojson x.entity_id));
      ("Persona", Some (persona_to_yojson x.persona));
    ]

let entity_persona_configuration_list_to_yojson tree =
  list_to_yojson entity_persona_configuration_to_yojson tree

let associate_personas_to_entities_request_to_yojson (x : associate_personas_to_entities_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("Personas", Some (entity_persona_configuration_list_to_yojson x.personas));
    ]

let associate_entities_to_experience_failed_entity_list_to_yojson tree =
  list_to_yojson failed_entity_to_yojson tree

let associate_entities_to_experience_response_to_yojson
    (x : associate_entities_to_experience_response) =
  assoc_to_yojson
    [
      ( "FailedEntityList",
        option_to_yojson associate_entities_to_experience_failed_entity_list_to_yojson
          x.failed_entity_list );
    ]

let associate_entity_list_to_yojson tree = list_to_yojson entity_configuration_to_yojson tree

let associate_entities_to_experience_request_to_yojson
    (x : associate_entities_to_experience_request) =
  assoc_to_yojson
    [
      ("Id", Some (experience_id_to_yojson x.id));
      ("IndexId", Some (index_id_to_yojson x.index_id));
      ("EntityList", Some (associate_entity_list_to_yojson x.entity_list));
    ]
