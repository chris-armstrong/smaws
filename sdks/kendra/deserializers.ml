open Smaws_Lib.Json.DeserializeHelpers
open Types
let organization_id_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson
let data_source_inclusions_exclusions_strings_member_of_yojson =
  string_of_yojson
let data_source_inclusions_exclusions_strings_of_yojson tree path =
  list_of_yojson data_source_inclusions_exclusions_strings_member_of_yojson
    tree path
let data_source_field_name_of_yojson = string_of_yojson
let data_source_date_field_format_of_yojson = string_of_yojson
let index_field_name_of_yojson = string_of_yojson
let data_source_to_index_field_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_field_name =
       (value_for_key index_field_name_of_yojson "IndexFieldName" _list path);
     date_field_format =
       (option_of_yojson
          (value_for_key data_source_date_field_format_of_yojson
             "DateFieldFormat") _list path);
     data_source_field_name =
       (value_for_key data_source_field_name_of_yojson "DataSourceFieldName"
          _list path)
   } : data_source_to_index_field_mapping)
let data_source_to_index_field_mapping_list_of_yojson tree path =
  list_of_yojson data_source_to_index_field_mapping_of_yojson tree path
let work_docs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     use_change_log =
       (option_of_yojson (value_for_key boolean__of_yojson "UseChangeLog")
          _list path);
     crawl_comments =
       (option_of_yojson (value_for_key boolean__of_yojson "CrawlComments")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : work_docs_configuration)
let base_unit_of_yojson = unit_of_yojson
let web_crawler_mode_of_yojson (tree : t) path =
  (match tree with
   | `String "EVERYTHING" -> EVERYTHING
   | `String "SUBDOMAINS" -> SUBDOMAINS
   | `String "HOST_ONLY" -> HOST_ONLY
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "WebCrawlerMode" value)
   | _ -> raise (deserialize_wrong_type_error path "WebCrawlerMode") : 
  web_crawler_mode)
let seed_url_of_yojson = string_of_yojson
let seed_url_list_of_yojson tree path =
  list_of_yojson seed_url_of_yojson tree path
let seed_url_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_crawler_mode =
       (option_of_yojson
          (value_for_key web_crawler_mode_of_yojson "WebCrawlerMode") _list
          path);
     seed_urls =
       (value_for_key seed_url_list_of_yojson "SeedUrls" _list path)
   } : seed_url_configuration)
let site_map_of_yojson = string_of_yojson
let site_maps_list_of_yojson tree path =
  list_of_yojson site_map_of_yojson tree path
let site_maps_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     site_maps =
       (value_for_key site_maps_list_of_yojson "SiteMaps" _list path)
   } : site_maps_configuration)
let urls_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     site_maps_configuration =
       (option_of_yojson
          (value_for_key site_maps_configuration_of_yojson
             "SiteMapsConfiguration") _list path);
     seed_url_configuration =
       (option_of_yojson
          (value_for_key seed_url_configuration_of_yojson
             "SeedUrlConfiguration") _list path)
   } : urls)
let crawl_depth_of_yojson = int_of_yojson
let max_links_per_page_of_yojson = int_of_yojson
let max_content_size_per_page_in_mega_bytes_of_yojson = float_of_yojson
let max_urls_per_minute_crawl_rate_of_yojson = int_of_yojson
let host_of_yojson = string_of_yojson
let port_of_yojson = int_of_yojson
let secret_arn_of_yojson = string_of_yojson
let proxy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credentials =
       (option_of_yojson (value_for_key secret_arn_of_yojson "Credentials")
          _list path);
     port = (value_for_key port_of_yojson "Port" _list path);
     host = (value_for_key host_of_yojson "Host" _list path)
   } : proxy_configuration)
let basic_authentication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credentials =
       (value_for_key secret_arn_of_yojson "Credentials" _list path);
     port = (value_for_key port_of_yojson "Port" _list path);
     host = (value_for_key host_of_yojson "Host" _list path)
   } : basic_authentication_configuration)
let basic_authentication_configuration_list_of_yojson tree path =
  list_of_yojson basic_authentication_configuration_of_yojson tree path
let authentication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     basic_authentication =
       (option_of_yojson
          (value_for_key basic_authentication_configuration_list_of_yojson
             "BasicAuthentication") _list path)
   } : authentication_configuration)
let web_crawler_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_configuration =
       (option_of_yojson
          (value_for_key authentication_configuration_of_yojson
             "AuthenticationConfiguration") _list path);
     proxy_configuration =
       (option_of_yojson
          (value_for_key proxy_configuration_of_yojson "ProxyConfiguration")
          _list path);
     url_exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "UrlExclusionPatterns") _list path);
     url_inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "UrlInclusionPatterns") _list path);
     max_urls_per_minute_crawl_rate =
       (option_of_yojson
          (value_for_key max_urls_per_minute_crawl_rate_of_yojson
             "MaxUrlsPerMinuteCrawlRate") _list path);
     max_content_size_per_page_in_mega_bytes =
       (option_of_yojson
          (value_for_key max_content_size_per_page_in_mega_bytes_of_yojson
             "MaxContentSizePerPageInMegaBytes") _list path);
     max_links_per_page =
       (option_of_yojson
          (value_for_key max_links_per_page_of_yojson "MaxLinksPerPage")
          _list path);
     crawl_depth =
       (option_of_yojson (value_for_key crawl_depth_of_yojson "CrawlDepth")
          _list path);
     urls = (value_for_key urls_of_yojson "Urls" _list path)
   } : web_crawler_configuration)
let warning_message_of_yojson = string_of_yojson
let warning_code_of_yojson (tree : t) path =
  (match tree with
   | `String "QUERY_LANGUAGE_INVALID_SYNTAX" -> QUERY_LANGUAGE_INVALID_SYNTAX
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "WarningCode" value)
   | _ -> raise (deserialize_wrong_type_error path "WarningCode") : warning_code)
let warning_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       (option_of_yojson (value_for_key warning_code_of_yojson "Code") _list
          path);
     message =
       (option_of_yojson (value_for_key warning_message_of_yojson "Message")
          _list path)
   } : warning)
let warning_list_of_yojson tree path =
  list_of_yojson warning_of_yojson tree path
let vpc_security_group_id_of_yojson = string_of_yojson
let visitor_id_of_yojson = string_of_yojson
let value_importance_map_key_of_yojson = string_of_yojson
let importance_of_yojson = int_of_yojson
let value_importance_map_of_yojson tree path =
  map_of_yojson value_importance_map_key_of_yojson importance_of_yojson tree
    path
let error_message_of_yojson = string_of_yojson
let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : validation_exception)
let key_location_of_yojson (tree : t) path =
  (match tree with
   | `String "SECRET_MANAGER" -> SECRET_MANAGER
   | `String "URL" -> URL
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "KeyLocation" value)
   | _ -> raise (deserialize_wrong_type_error path "KeyLocation") : key_location)
let url_of_yojson = string_of_yojson
let role_arn_of_yojson = string_of_yojson
let user_name_attribute_field_of_yojson = string_of_yojson
let group_attribute_field_of_yojson = string_of_yojson
let issuer_of_yojson = string_of_yojson
let claim_regex_of_yojson = string_of_yojson
let jwt_token_type_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     claim_regex =
       (option_of_yojson (value_for_key claim_regex_of_yojson "ClaimRegex")
          _list path);
     issuer =
       (option_of_yojson (value_for_key issuer_of_yojson "Issuer") _list path);
     group_attribute_field =
       (option_of_yojson
          (value_for_key group_attribute_field_of_yojson
             "GroupAttributeField") _list path);
     user_name_attribute_field =
       (option_of_yojson
          (value_for_key user_name_attribute_field_of_yojson
             "UserNameAttributeField") _list path);
     secret_manager_arn =
       (option_of_yojson
          (value_for_key role_arn_of_yojson "SecretManagerArn") _list path);
     ur_l = (option_of_yojson (value_for_key url_of_yojson "URL") _list path);
     key_location =
       (value_for_key key_location_of_yojson "KeyLocation" _list path)
   } : jwt_token_type_configuration)
let string__of_yojson = string_of_yojson
let json_token_type_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_attribute_field =
       (value_for_key string__of_yojson "GroupAttributeField" _list path);
     user_name_attribute_field =
       (value_for_key string__of_yojson "UserNameAttributeField" _list path)
   } : json_token_type_configuration)
let user_token_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     json_token_type_configuration =
       (option_of_yojson
          (value_for_key json_token_type_configuration_of_yojson
             "JsonTokenTypeConfiguration") _list path);
     jwt_token_type_configuration =
       (option_of_yojson
          (value_for_key jwt_token_type_configuration_of_yojson
             "JwtTokenTypeConfiguration") _list path)
   } : user_token_configuration)
let user_token_configuration_list_of_yojson tree path =
  list_of_yojson user_token_configuration_of_yojson tree path
let identity_attribute_name_of_yojson = string_of_yojson
let user_identity_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_attribute_name =
       (option_of_yojson
          (value_for_key identity_attribute_name_of_yojson
             "IdentityAttributeName") _list path)
   } : user_identity_configuration)
let user_id_of_yojson = string_of_yojson
let user_group_resolution_mode_of_yojson (tree : t) path =
  (match tree with
   | `String "NONE" -> NONE
   | `String "AWS_SSO" -> AWS_SSO
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "UserGroupResolutionMode"
            value)
   | _ -> raise (deserialize_wrong_type_error path "UserGroupResolutionMode") : 
  user_group_resolution_mode)
let user_group_resolution_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_group_resolution_mode =
       (value_for_key user_group_resolution_mode_of_yojson
          "UserGroupResolutionMode" _list path)
   } : user_group_resolution_configuration)
let user_context_policy_of_yojson (tree : t) path =
  (match tree with
   | `String "USER_TOKEN" -> USER_TOKEN
   | `String "ATTRIBUTE_FILTER" -> ATTRIBUTE_FILTER
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "UserContextPolicy" value)
   | _ -> raise (deserialize_wrong_type_error path "UserContextPolicy") : 
  user_context_policy)
let token_of_yojson = string_of_yojson
let principal_name_of_yojson = string_of_yojson
let groups_of_yojson tree path =
  list_of_yojson principal_name_of_yojson tree path
let data_source_id_of_yojson = string_of_yojson
let data_source_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id =
       (value_for_key data_source_id_of_yojson "DataSourceId" _list path);
     group_id = (value_for_key principal_name_of_yojson "GroupId" _list path)
   } : data_source_group)
let data_source_groups_of_yojson tree path =
  list_of_yojson data_source_group_of_yojson tree path
let user_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_groups =
       (option_of_yojson
          (value_for_key data_source_groups_of_yojson "DataSourceGroups")
          _list path);
     groups =
       (option_of_yojson (value_for_key groups_of_yojson "Groups") _list path);
     user_id =
       (option_of_yojson (value_for_key principal_name_of_yojson "UserId")
          _list path);
     token =
       (option_of_yojson (value_for_key token_of_yojson "Token") _list path)
   } : user_context)
let user_account_of_yojson = string_of_yojson
let thesaurus_id_of_yojson = string_of_yojson
let thesaurus_name_of_yojson = string_of_yojson
let index_id_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson
let s3_object_key_of_yojson = string_of_yojson
let s3_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = (value_for_key s3_object_key_of_yojson "Key" _list path);
     bucket = (value_for_key s3_bucket_name_of_yojson "Bucket" _list path)
   } : s3_path)
let update_thesaurus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_s3_path =
       (option_of_yojson (value_for_key s3_path_of_yojson "SourceS3Path")
          _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     name =
       (option_of_yojson (value_for_key thesaurus_name_of_yojson "Name")
          _list path);
     id = (value_for_key thesaurus_id_of_yojson "Id" _list path)
   } : update_thesaurus_request)
let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : throttling_exception)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : resource_not_found_exception)
let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : internal_server_exception)
let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : conflict_exception)
let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : access_denied_exception)
let mode_of_yojson (tree : t) path =
  (match tree with
   | `String "LEARN_ONLY" -> LEARN_ONLY
   | `String "ENABLED" -> ENABLED
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "Mode" value)
   | _ -> raise (deserialize_wrong_type_error path "Mode") : mode)
let integer__of_yojson = int_of_yojson
let object_boolean_of_yojson = bool_of_yojson
let minimum_number_of_querying_users_of_yojson = int_of_yojson
let minimum_query_count_of_yojson = int_of_yojson
let document_attribute_key_of_yojson = string_of_yojson
let suggestable_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     suggestable =
       (option_of_yojson
          (value_for_key object_boolean_of_yojson "Suggestable") _list path);
     attribute_name =
       (option_of_yojson
          (value_for_key document_attribute_key_of_yojson "AttributeName")
          _list path)
   } : suggestable_config)
let suggestable_config_list_of_yojson tree path =
  list_of_yojson suggestable_config_of_yojson tree path
let attribute_suggestions_mode_of_yojson (tree : t) path =
  (match tree with
   | `String "INACTIVE" -> INACTIVE
   | `String "ACTIVE" -> ACTIVE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "AttributeSuggestionsMode" value)
   | _ ->
       raise (deserialize_wrong_type_error path "AttributeSuggestionsMode") : 
  attribute_suggestions_mode)
let attribute_suggestions_update_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_suggestions_mode =
       (option_of_yojson
          (value_for_key attribute_suggestions_mode_of_yojson
             "AttributeSuggestionsMode") _list path);
     suggestable_config_list =
       (option_of_yojson
          (value_for_key suggestable_config_list_of_yojson
             "SuggestableConfigList") _list path)
   } : attribute_suggestions_update_config)
let update_query_suggestions_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_suggestions_config =
       (option_of_yojson
          (value_for_key attribute_suggestions_update_config_of_yojson
             "AttributeSuggestionsConfig") _list path);
     minimum_query_count =
       (option_of_yojson
          (value_for_key minimum_query_count_of_yojson "MinimumQueryCount")
          _list path);
     minimum_number_of_querying_users =
       (option_of_yojson
          (value_for_key minimum_number_of_querying_users_of_yojson
             "MinimumNumberOfQueryingUsers") _list path);
     include_queries_without_user_information =
       (option_of_yojson
          (value_for_key object_boolean_of_yojson
             "IncludeQueriesWithoutUserInformation") _list path);
     query_log_look_back_window_in_days =
       (option_of_yojson
          (value_for_key integer__of_yojson "QueryLogLookBackWindowInDays")
          _list path);
     mode =
       (option_of_yojson (value_for_key mode_of_yojson "Mode") _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : update_query_suggestions_config_request)
let query_suggestions_block_list_id_of_yojson = string_of_yojson
let query_suggestions_block_list_name_of_yojson = string_of_yojson
let update_query_suggestions_block_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     source_s3_path =
       (option_of_yojson (value_for_key s3_path_of_yojson "SourceS3Path")
          _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_name_of_yojson "Name")
          _list path);
     id =
       (value_for_key query_suggestions_block_list_id_of_yojson "Id" _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : update_query_suggestions_block_list_request)
let index_name_of_yojson = string_of_yojson
let document_metadata_configuration_name_of_yojson = string_of_yojson
let document_attribute_value_type_of_yojson (tree : t) path =
  (match tree with
   | `String "DATE_VALUE" -> DATE_VALUE
   | `String "LONG_VALUE" -> LONG_VALUE
   | `String "STRING_LIST_VALUE" -> STRING_LIST_VALUE
   | `String "STRING_VALUE" -> STRING_VALUE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "DocumentAttributeValueType" value)
   | _ ->
       raise (deserialize_wrong_type_error path "DocumentAttributeValueType") : 
  document_attribute_value_type)
let document_metadata_boolean_of_yojson = bool_of_yojson
let duration_of_yojson = string_of_yojson
let order_of_yojson (tree : t) path =
  (match tree with
   | `String "DESCENDING" -> DESCENDING
   | `String "ASCENDING" -> ASCENDING
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "Order" value)
   | _ -> raise (deserialize_wrong_type_error path "Order") : order)
let relevance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value_importance_map =
       (option_of_yojson
          (value_for_key value_importance_map_of_yojson "ValueImportanceMap")
          _list path);
     rank_order =
       (option_of_yojson (value_for_key order_of_yojson "RankOrder") _list
          path);
     duration =
       (option_of_yojson (value_for_key duration_of_yojson "Duration") _list
          path);
     importance =
       (option_of_yojson (value_for_key importance_of_yojson "Importance")
          _list path);
     freshness =
       (option_of_yojson
          (value_for_key document_metadata_boolean_of_yojson "Freshness")
          _list path)
   } : relevance)
let search_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sortable =
       (option_of_yojson (value_for_key boolean__of_yojson "Sortable") _list
          path);
     displayable =
       (option_of_yojson (value_for_key boolean__of_yojson "Displayable")
          _list path);
     searchable =
       (option_of_yojson (value_for_key boolean__of_yojson "Searchable")
          _list path);
     facetable =
       (option_of_yojson (value_for_key boolean__of_yojson "Facetable") _list
          path)
   } : search)
let document_metadata_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     search =
       (option_of_yojson (value_for_key search_of_yojson "Search") _list path);
     relevance =
       (option_of_yojson (value_for_key relevance_of_yojson "Relevance")
          _list path);
     type_ =
       (value_for_key document_attribute_value_type_of_yojson "Type" _list
          path);
     name =
       (value_for_key document_metadata_configuration_name_of_yojson "Name"
          _list path)
   } : document_metadata_configuration)
let document_metadata_configuration_list_of_yojson tree path =
  list_of_yojson document_metadata_configuration_of_yojson tree path
let storage_capacity_unit_of_yojson = int_of_yojson
let query_capacity_unit_of_yojson = int_of_yojson
let capacity_units_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_capacity_units =
       (value_for_key query_capacity_unit_of_yojson "QueryCapacityUnits"
          _list path);
     storage_capacity_units =
       (value_for_key storage_capacity_unit_of_yojson "StorageCapacityUnits"
          _list path)
   } : capacity_units_configuration)
let update_index_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_group_resolution_configuration =
       (option_of_yojson
          (value_for_key user_group_resolution_configuration_of_yojson
             "UserGroupResolutionConfiguration") _list path);
     user_context_policy =
       (option_of_yojson
          (value_for_key user_context_policy_of_yojson "UserContextPolicy")
          _list path);
     user_token_configurations =
       (option_of_yojson
          (value_for_key user_token_configuration_list_of_yojson
             "UserTokenConfigurations") _list path);
     capacity_units =
       (option_of_yojson
          (value_for_key capacity_units_configuration_of_yojson
             "CapacityUnits") _list path);
     document_metadata_configuration_updates =
       (option_of_yojson
          (value_for_key document_metadata_configuration_list_of_yojson
             "DocumentMetadataConfigurationUpdates") _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     name =
       (option_of_yojson (value_for_key index_name_of_yojson "Name") _list
          path);
     id = (value_for_key index_id_of_yojson "Id" _list path)
   } : update_index_request)
let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : service_quota_exceeded_exception)
let featured_results_set_id_of_yojson = string_of_yojson
let featured_results_set_name_of_yojson = string_of_yojson
let featured_results_set_description_of_yojson = string_of_yojson
let featured_results_set_status_of_yojson (tree : t) path =
  (match tree with
   | `String "INACTIVE" -> INACTIVE
   | `String "ACTIVE" -> ACTIVE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "FeaturedResultsSetStatus" value)
   | _ ->
       raise (deserialize_wrong_type_error path "FeaturedResultsSetStatus") : 
  featured_results_set_status)
let query_text_of_yojson = string_of_yojson
let query_text_list_of_yojson tree path =
  list_of_yojson query_text_of_yojson tree path
let document_id_of_yojson = string_of_yojson
let featured_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (option_of_yojson (value_for_key document_id_of_yojson "Id") _list
          path)
   } : featured_document)
let featured_document_list_of_yojson tree path =
  list_of_yojson featured_document_of_yojson tree path
let long_of_yojson = long_of_yojson
let featured_results_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_timestamp =
       (option_of_yojson (value_for_key long_of_yojson "CreationTimestamp")
          _list path);
     last_updated_timestamp =
       (option_of_yojson
          (value_for_key long_of_yojson "LastUpdatedTimestamp") _list path);
     featured_documents =
       (option_of_yojson
          (value_for_key featured_document_list_of_yojson "FeaturedDocuments")
          _list path);
     query_texts =
       (option_of_yojson
          (value_for_key query_text_list_of_yojson "QueryTexts") _list path);
     status =
       (option_of_yojson
          (value_for_key featured_results_set_status_of_yojson "Status")
          _list path);
     description =
       (option_of_yojson
          (value_for_key featured_results_set_description_of_yojson
             "Description") _list path);
     featured_results_set_name =
       (option_of_yojson
          (value_for_key featured_results_set_name_of_yojson
             "FeaturedResultsSetName") _list path);
     featured_results_set_id =
       (option_of_yojson
          (value_for_key featured_results_set_id_of_yojson
             "FeaturedResultsSetId") _list path)
   } : featured_results_set)
let update_featured_results_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     featured_results_set =
       (option_of_yojson
          (value_for_key featured_results_set_of_yojson "FeaturedResultsSet")
          _list path)
   } : update_featured_results_set_response)
let update_featured_results_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     featured_documents =
       (option_of_yojson
          (value_for_key featured_document_list_of_yojson "FeaturedDocuments")
          _list path);
     query_texts =
       (option_of_yojson
          (value_for_key query_text_list_of_yojson "QueryTexts") _list path);
     status =
       (option_of_yojson
          (value_for_key featured_results_set_status_of_yojson "Status")
          _list path);
     description =
       (option_of_yojson
          (value_for_key featured_results_set_description_of_yojson
             "Description") _list path);
     featured_results_set_name =
       (option_of_yojson
          (value_for_key featured_results_set_name_of_yojson
             "FeaturedResultsSetName") _list path);
     featured_results_set_id =
       (value_for_key featured_results_set_id_of_yojson
          "FeaturedResultsSetId" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : update_featured_results_set_request)
let conflicting_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     set_id =
       (option_of_yojson (value_for_key string__of_yojson "SetId") _list path);
     set_name =
       (option_of_yojson (value_for_key string__of_yojson "SetName") _list
          path);
     query_text =
       (option_of_yojson (value_for_key query_text_of_yojson "QueryText")
          _list path)
   } : conflicting_item)
let conflicting_items_of_yojson tree path =
  list_of_yojson conflicting_item_of_yojson tree path
let featured_results_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conflicting_items =
       (option_of_yojson
          (value_for_key conflicting_items_of_yojson "ConflictingItems")
          _list path);
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : featured_results_conflict_exception)
let experience_id_of_yojson = string_of_yojson
let experience_name_of_yojson = string_of_yojson
let data_source_id_list_of_yojson tree path =
  list_of_yojson data_source_id_of_yojson tree path
let faq_id_of_yojson = string_of_yojson
let faq_ids_list_of_yojson tree path =
  list_of_yojson faq_id_of_yojson tree path
let content_source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     direct_put_content =
       (option_of_yojson
          (value_for_key boolean__of_yojson "DirectPutContent") _list path);
     faq_ids =
       (option_of_yojson (value_for_key faq_ids_list_of_yojson "FaqIds")
          _list path);
     data_source_ids =
       (option_of_yojson
          (value_for_key data_source_id_list_of_yojson "DataSourceIds") _list
          path)
   } : content_source_configuration)
let experience_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_identity_configuration =
       (option_of_yojson
          (value_for_key user_identity_configuration_of_yojson
             "UserIdentityConfiguration") _list path);
     content_source_configuration =
       (option_of_yojson
          (value_for_key content_source_configuration_of_yojson
             "ContentSourceConfiguration") _list path)
   } : experience_configuration)
let update_experience_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     configuration =
       (option_of_yojson
          (value_for_key experience_configuration_of_yojson "Configuration")
          _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     name =
       (option_of_yojson (value_for_key experience_name_of_yojson "Name")
          _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : update_experience_request)
let data_source_name_of_yojson = string_of_yojson
let documents_metadata_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_prefix =
       (option_of_yojson (value_for_key s3_object_key_of_yojson "S3Prefix")
          _list path)
   } : documents_metadata_configuration)
let access_control_list_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_path =
       (option_of_yojson (value_for_key s3_object_key_of_yojson "KeyPath")
          _list path)
   } : access_control_list_configuration)
let s3_data_source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_control_list_configuration =
       (option_of_yojson
          (value_for_key access_control_list_configuration_of_yojson
             "AccessControlListConfiguration") _list path);
     documents_metadata_configuration =
       (option_of_yojson
          (value_for_key documents_metadata_configuration_of_yojson
             "DocumentsMetadataConfiguration") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     inclusion_prefixes =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPrefixes") _list path);
     bucket_name =
       (value_for_key s3_bucket_name_of_yojson "BucketName" _list path)
   } : s3_data_source_configuration)
let share_point_version_of_yojson (tree : t) path =
  (match tree with
   | `String "SHAREPOINT_2019" -> SHAREPOINT_2019
   | `String "SHAREPOINT_ONLINE" -> SHAREPOINT_ONLINE
   | `String "SHAREPOINT_2016" -> SHAREPOINT_2016
   | `String "SHAREPOINT_2013" -> SHAREPOINT_2013
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "SharePointVersion" value)
   | _ -> raise (deserialize_wrong_type_error path "SharePointVersion") : 
  share_point_version)
let share_point_url_list_of_yojson tree path =
  list_of_yojson url_of_yojson tree path
let subnet_id_of_yojson = string_of_yojson
let subnet_id_list_of_yojson tree path =
  list_of_yojson subnet_id_of_yojson tree path
let security_group_id_list_of_yojson tree path =
  list_of_yojson vpc_security_group_id_of_yojson tree path
let data_source_vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_ids =
       (value_for_key security_group_id_list_of_yojson "SecurityGroupIds"
          _list path);
     subnet_ids =
       (value_for_key subnet_id_list_of_yojson "SubnetIds" _list path)
   } : data_source_vpc_configuration)
let share_point_online_authentication_type_of_yojson (tree : t) path =
  (match tree with
   | `String "OAUTH2" -> OAUTH2
   | `String "HTTP_BASIC" -> HTTP_BASIC
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "SharePointOnlineAuthenticationType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "SharePointOnlineAuthenticationType") : share_point_online_authentication_type)
let share_point_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_configuration =
       (option_of_yojson
          (value_for_key proxy_configuration_of_yojson "ProxyConfiguration")
          _list path);
     authentication_type =
       (option_of_yojson
          (value_for_key share_point_online_authentication_type_of_yojson
             "AuthenticationType") _list path);
     ssl_certificate_s3_path =
       (option_of_yojson
          (value_for_key s3_path_of_yojson "SslCertificateS3Path") _list path);
     disable_local_groups =
       (option_of_yojson
          (value_for_key boolean__of_yojson "DisableLocalGroups") _list path);
     document_title_field_name =
       (option_of_yojson
          (value_for_key data_source_field_name_of_yojson
             "DocumentTitleFieldName") _list path);
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     use_change_log =
       (option_of_yojson (value_for_key boolean__of_yojson "UseChangeLog")
          _list path);
     crawl_attachments =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlAttachments") _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     urls = (value_for_key share_point_url_list_of_yojson "Urls" _list path);
     share_point_version =
       (value_for_key share_point_version_of_yojson "SharePointVersion" _list
          path)
   } : share_point_configuration)
let database_engine_type_of_yojson (tree : t) path =
  (match tree with
   | `String "RDS_POSTGRESQL" -> RDS_POSTGRESQL
   | `String "RDS_MYSQL" -> RDS_MYSQL
   | `String "RDS_AURORA_POSTGRESQL" -> RDS_AURORA_POSTGRESQL
   | `String "RDS_AURORA_MYSQL" -> RDS_AURORA_MYSQL
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "DatabaseEngineType"
            value)
   | _ -> raise (deserialize_wrong_type_error path "DatabaseEngineType") : 
  database_engine_type)
let database_host_of_yojson = string_of_yojson
let database_port_of_yojson = int_of_yojson
let database_name_of_yojson = string_of_yojson
let table_name_of_yojson = string_of_yojson
let connection_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     table_name = (value_for_key table_name_of_yojson "TableName" _list path);
     database_name =
       (value_for_key database_name_of_yojson "DatabaseName" _list path);
     database_port =
       (value_for_key database_port_of_yojson "DatabasePort" _list path);
     database_host =
       (value_for_key database_host_of_yojson "DatabaseHost" _list path)
   } : connection_configuration)
let column_name_of_yojson = string_of_yojson
let change_detecting_columns_of_yojson tree path =
  list_of_yojson column_name_of_yojson tree path
let column_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_detecting_columns =
       (value_for_key change_detecting_columns_of_yojson
          "ChangeDetectingColumns" _list path);
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     document_title_column_name =
       (option_of_yojson
          (value_for_key column_name_of_yojson "DocumentTitleColumnName")
          _list path);
     document_data_column_name =
       (value_for_key column_name_of_yojson "DocumentDataColumnName" _list
          path);
     document_id_column_name =
       (value_for_key column_name_of_yojson "DocumentIdColumnName" _list path)
   } : column_configuration)
let acl_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allowed_groups_column_name =
       (value_for_key column_name_of_yojson "AllowedGroupsColumnName" _list
          path)
   } : acl_configuration)
let query_identifiers_enclosing_option_of_yojson (tree : t) path =
  (match tree with
   | `String "NONE" -> NONE
   | `String "DOUBLE_QUOTES" -> DOUBLE_QUOTES
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "QueryIdentifiersEnclosingOption" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "QueryIdentifiersEnclosingOption") : 
  query_identifiers_enclosing_option)
let sql_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_identifiers_enclosing_option =
       (option_of_yojson
          (value_for_key query_identifiers_enclosing_option_of_yojson
             "QueryIdentifiersEnclosingOption") _list path)
   } : sql_configuration)
let database_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_configuration =
       (option_of_yojson
          (value_for_key sql_configuration_of_yojson "SqlConfiguration")
          _list path);
     acl_configuration =
       (option_of_yojson
          (value_for_key acl_configuration_of_yojson "AclConfiguration")
          _list path);
     column_configuration =
       (value_for_key column_configuration_of_yojson "ColumnConfiguration"
          _list path);
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     connection_configuration =
       (value_for_key connection_configuration_of_yojson
          "ConnectionConfiguration" _list path);
     database_engine_type =
       (value_for_key database_engine_type_of_yojson "DatabaseEngineType"
          _list path)
   } : database_configuration)
let salesforce_standard_object_name_of_yojson (tree : t) path =
  (match tree with
   | `String "USER" -> USER
   | `String "TASK" -> TASK
   | `String "SOLUTION" -> SOLUTION
   | `String "PROFILE" -> PROFILE
   | `String "PRODUCT" -> PRODUCT
   | `String "PRICEBOOK" -> PRICEBOOK
   | `String "PARTNER" -> PARTNER
   | `String "OPPORTUNITY" -> OPPORTUNITY
   | `String "LEAD" -> LEAD
   | `String "IDEA" -> IDEA
   | `String "GROUP" -> GROUP
   | `String "DOCUMENT" -> DOCUMENT
   | `String "CONTRACT" -> CONTRACT
   | `String "CONTACT" -> CONTACT
   | `String "CASE" -> CASE
   | `String "CAMPAIGN" -> CAMPAIGN
   | `String "ACCOUNT" -> ACCOUNT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "SalesforceStandardObjectName" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "SalesforceStandardObjectName") : 
  salesforce_standard_object_name)
let salesforce_standard_object_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     document_title_field_name =
       (option_of_yojson
          (value_for_key data_source_field_name_of_yojson
             "DocumentTitleFieldName") _list path);
     document_data_field_name =
       (value_for_key data_source_field_name_of_yojson
          "DocumentDataFieldName" _list path);
     name =
       (value_for_key salesforce_standard_object_name_of_yojson "Name" _list
          path)
   } : salesforce_standard_object_configuration)
let salesforce_standard_object_configuration_list_of_yojson tree path =
  list_of_yojson salesforce_standard_object_configuration_of_yojson tree path
let salesforce_knowledge_article_state_of_yojson (tree : t) path =
  (match tree with
   | `String "ARCHIVED" -> ARCHIVED
   | `String "PUBLISHED" -> PUBLISHED
   | `String "DRAFT" -> DRAFT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "SalesforceKnowledgeArticleState" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "SalesforceKnowledgeArticleState") : 
  salesforce_knowledge_article_state)
let salesforce_knowledge_article_state_list_of_yojson tree path =
  list_of_yojson salesforce_knowledge_article_state_of_yojson tree path
let salesforce_standard_knowledge_article_type_configuration_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     document_title_field_name =
       (option_of_yojson
          (value_for_key data_source_field_name_of_yojson
             "DocumentTitleFieldName") _list path);
     document_data_field_name =
       (value_for_key data_source_field_name_of_yojson
          "DocumentDataFieldName" _list path)
   } : salesforce_standard_knowledge_article_type_configuration)
let salesforce_custom_knowledge_article_type_name_of_yojson =
  string_of_yojson
let salesforce_custom_knowledge_article_type_configuration_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     document_title_field_name =
       (option_of_yojson
          (value_for_key data_source_field_name_of_yojson
             "DocumentTitleFieldName") _list path);
     document_data_field_name =
       (value_for_key data_source_field_name_of_yojson
          "DocumentDataFieldName" _list path);
     name =
       (value_for_key salesforce_custom_knowledge_article_type_name_of_yojson
          "Name" _list path)
   } : salesforce_custom_knowledge_article_type_configuration)
let salesforce_custom_knowledge_article_type_configuration_list_of_yojson
  tree path =
  list_of_yojson
    salesforce_custom_knowledge_article_type_configuration_of_yojson tree
    path
let salesforce_knowledge_article_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_knowledge_article_type_configurations =
       (option_of_yojson
          (value_for_key
             salesforce_custom_knowledge_article_type_configuration_list_of_yojson
             "CustomKnowledgeArticleTypeConfigurations") _list path);
     standard_knowledge_article_type_configuration =
       (option_of_yojson
          (value_for_key
             salesforce_standard_knowledge_article_type_configuration_of_yojson
             "StandardKnowledgeArticleTypeConfiguration") _list path);
     included_states =
       (value_for_key salesforce_knowledge_article_state_list_of_yojson
          "IncludedStates" _list path)
   } : salesforce_knowledge_article_configuration)
let salesforce_chatter_feed_include_filter_type_of_yojson (tree : t) path =
  (match tree with
   | `String "STANDARD_USER" -> STANDARD_USER
   | `String "ACTIVE_USER" -> ACTIVE_USER
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "SalesforceChatterFeedIncludeFilterType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "SalesforceChatterFeedIncludeFilterType") : salesforce_chatter_feed_include_filter_type)
let salesforce_chatter_feed_include_filter_types_of_yojson tree path =
  list_of_yojson salesforce_chatter_feed_include_filter_type_of_yojson tree
    path
let salesforce_chatter_feed_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_filter_types =
       (option_of_yojson
          (value_for_key
             salesforce_chatter_feed_include_filter_types_of_yojson
             "IncludeFilterTypes") _list path);
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     document_title_field_name =
       (option_of_yojson
          (value_for_key data_source_field_name_of_yojson
             "DocumentTitleFieldName") _list path);
     document_data_field_name =
       (value_for_key data_source_field_name_of_yojson
          "DocumentDataFieldName" _list path)
   } : salesforce_chatter_feed_configuration)
let salesforce_standard_object_attachment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     document_title_field_name =
       (option_of_yojson
          (value_for_key data_source_field_name_of_yojson
             "DocumentTitleFieldName") _list path)
   } : salesforce_standard_object_attachment_configuration)
let salesforce_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclude_attachment_file_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExcludeAttachmentFilePatterns") _list path);
     include_attachment_file_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "IncludeAttachmentFilePatterns") _list path);
     standard_object_attachment_configuration =
       (option_of_yojson
          (value_for_key
             salesforce_standard_object_attachment_configuration_of_yojson
             "StandardObjectAttachmentConfiguration") _list path);
     crawl_attachments =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlAttachments") _list path);
     chatter_feed_configuration =
       (option_of_yojson
          (value_for_key salesforce_chatter_feed_configuration_of_yojson
             "ChatterFeedConfiguration") _list path);
     knowledge_article_configuration =
       (option_of_yojson
          (value_for_key salesforce_knowledge_article_configuration_of_yojson
             "KnowledgeArticleConfiguration") _list path);
     standard_object_configurations =
       (option_of_yojson
          (value_for_key
             salesforce_standard_object_configuration_list_of_yojson
             "StandardObjectConfigurations") _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     server_url = (value_for_key url_of_yojson "ServerUrl" _list path)
   } : salesforce_configuration)
let tenant_domain_of_yojson = string_of_yojson
let one_drive_user_of_yojson = string_of_yojson
let one_drive_user_list_of_yojson tree path =
  list_of_yojson one_drive_user_of_yojson tree path
let one_drive_users_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     one_drive_user_s3_path =
       (option_of_yojson
          (value_for_key s3_path_of_yojson "OneDriveUserS3Path") _list path);
     one_drive_user_list =
       (option_of_yojson
          (value_for_key one_drive_user_list_of_yojson "OneDriveUserList")
          _list path)
   } : one_drive_users)
let one_drive_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_local_groups =
       (option_of_yojson
          (value_for_key boolean__of_yojson "DisableLocalGroups") _list path);
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     one_drive_users =
       (value_for_key one_drive_users_of_yojson "OneDriveUsers" _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     tenant_domain =
       (value_for_key tenant_domain_of_yojson "TenantDomain" _list path)
   } : one_drive_configuration)
let service_now_host_url_of_yojson = string_of_yojson
let service_now_build_version_type_of_yojson (tree : t) path =
  (match tree with
   | `String "OTHERS" -> OTHERS
   | `String "LONDON" -> LONDON
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ServiceNowBuildVersionType" value)
   | _ ->
       raise (deserialize_wrong_type_error path "ServiceNowBuildVersionType") : 
  service_now_build_version_type)
let service_now_knowledge_article_filter_query_of_yojson = string_of_yojson
let service_now_knowledge_article_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_query =
       (option_of_yojson
          (value_for_key service_now_knowledge_article_filter_query_of_yojson
             "FilterQuery") _list path);
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     document_title_field_name =
       (option_of_yojson
          (value_for_key data_source_field_name_of_yojson
             "DocumentTitleFieldName") _list path);
     document_data_field_name =
       (value_for_key data_source_field_name_of_yojson
          "DocumentDataFieldName" _list path);
     exclude_attachment_file_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExcludeAttachmentFilePatterns") _list path);
     include_attachment_file_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "IncludeAttachmentFilePatterns") _list path);
     crawl_attachments =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlAttachments") _list path)
   } : service_now_knowledge_article_configuration)
let service_now_service_catalog_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     document_title_field_name =
       (option_of_yojson
          (value_for_key data_source_field_name_of_yojson
             "DocumentTitleFieldName") _list path);
     document_data_field_name =
       (value_for_key data_source_field_name_of_yojson
          "DocumentDataFieldName" _list path);
     exclude_attachment_file_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExcludeAttachmentFilePatterns") _list path);
     include_attachment_file_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "IncludeAttachmentFilePatterns") _list path);
     crawl_attachments =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlAttachments") _list path)
   } : service_now_service_catalog_configuration)
let service_now_authentication_type_of_yojson (tree : t) path =
  (match tree with
   | `String "OAUTH2" -> OAUTH2
   | `String "HTTP_BASIC" -> HTTP_BASIC
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ServiceNowAuthenticationType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "ServiceNowAuthenticationType") : 
  service_now_authentication_type)
let service_now_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_type =
       (option_of_yojson
          (value_for_key service_now_authentication_type_of_yojson
             "AuthenticationType") _list path);
     service_catalog_configuration =
       (option_of_yojson
          (value_for_key service_now_service_catalog_configuration_of_yojson
             "ServiceCatalogConfiguration") _list path);
     knowledge_article_configuration =
       (option_of_yojson
          (value_for_key
             service_now_knowledge_article_configuration_of_yojson
             "KnowledgeArticleConfiguration") _list path);
     service_now_build_version =
       (value_for_key service_now_build_version_type_of_yojson
          "ServiceNowBuildVersion" _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     host_url =
       (value_for_key service_now_host_url_of_yojson "HostUrl" _list path)
   } : service_now_configuration)
let confluence_version_of_yojson (tree : t) path =
  (match tree with
   | `String "SERVER" -> SERVER
   | `String "CLOUD" -> CLOUD
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ConfluenceVersion" value)
   | _ -> raise (deserialize_wrong_type_error path "ConfluenceVersion") : 
  confluence_version)
let confluence_space_identifier_of_yojson = string_of_yojson
let confluence_space_list_of_yojson tree path =
  list_of_yojson confluence_space_identifier_of_yojson tree path
let confluence_space_field_name_of_yojson (tree : t) path =
  (match tree with
   | `String "URL" -> URL
   | `String "SPACE_KEY" -> SPACE_KEY
   | `String "ITEM_TYPE" -> ITEM_TYPE
   | `String "DISPLAY_URL" -> DISPLAY_URL
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ConfluenceSpaceFieldName" value)
   | _ ->
       raise (deserialize_wrong_type_error path "ConfluenceSpaceFieldName") : 
  confluence_space_field_name)
let confluence_space_to_index_field_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_field_name =
       (option_of_yojson
          (value_for_key index_field_name_of_yojson "IndexFieldName") _list
          path);
     date_field_format =
       (option_of_yojson
          (value_for_key data_source_date_field_format_of_yojson
             "DateFieldFormat") _list path);
     data_source_field_name =
       (option_of_yojson
          (value_for_key confluence_space_field_name_of_yojson
             "DataSourceFieldName") _list path)
   } : confluence_space_to_index_field_mapping)
let confluence_space_field_mappings_list_of_yojson tree path =
  list_of_yojson confluence_space_to_index_field_mapping_of_yojson tree path
let confluence_space_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     space_field_mappings =
       (option_of_yojson
          (value_for_key confluence_space_field_mappings_list_of_yojson
             "SpaceFieldMappings") _list path);
     exclude_spaces =
       (option_of_yojson
          (value_for_key confluence_space_list_of_yojson "ExcludeSpaces")
          _list path);
     include_spaces =
       (option_of_yojson
          (value_for_key confluence_space_list_of_yojson "IncludeSpaces")
          _list path);
     crawl_archived_spaces =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlArchivedSpaces") _list path);
     crawl_personal_spaces =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlPersonalSpaces") _list path)
   } : confluence_space_configuration)
let confluence_page_field_name_of_yojson (tree : t) path =
  (match tree with
   | `String "VERSION" -> VERSION
   | `String "URL" -> URL
   | `String "SPACE_NAME" -> SPACE_NAME
   | `String "SPACE_KEY" -> SPACE_KEY
   | `String "PARENT_ID" -> PARENT_ID
   | `String "MODIFIED_DATE" -> MODIFIED_DATE
   | `String "LABELS" -> LABELS
   | `String "ITEM_TYPE" -> ITEM_TYPE
   | `String "DISPLAY_URL" -> DISPLAY_URL
   | `String "CREATED_DATE" -> CREATED_DATE
   | `String "CONTENT_STATUS" -> CONTENT_STATUS
   | `String "AUTHOR" -> AUTHOR
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ConfluencePageFieldName"
            value)
   | _ -> raise (deserialize_wrong_type_error path "ConfluencePageFieldName") : 
  confluence_page_field_name)
let confluence_page_to_index_field_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_field_name =
       (option_of_yojson
          (value_for_key index_field_name_of_yojson "IndexFieldName") _list
          path);
     date_field_format =
       (option_of_yojson
          (value_for_key data_source_date_field_format_of_yojson
             "DateFieldFormat") _list path);
     data_source_field_name =
       (option_of_yojson
          (value_for_key confluence_page_field_name_of_yojson
             "DataSourceFieldName") _list path)
   } : confluence_page_to_index_field_mapping)
let confluence_page_field_mappings_list_of_yojson tree path =
  list_of_yojson confluence_page_to_index_field_mapping_of_yojson tree path
let confluence_page_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_field_mappings =
       (option_of_yojson
          (value_for_key confluence_page_field_mappings_list_of_yojson
             "PageFieldMappings") _list path)
   } : confluence_page_configuration)
let confluence_blog_field_name_of_yojson (tree : t) path =
  (match tree with
   | `String "VERSION" -> VERSION
   | `String "URL" -> URL
   | `String "SPACE_NAME" -> SPACE_NAME
   | `String "SPACE_KEY" -> SPACE_KEY
   | `String "PUBLISH_DATE" -> PUBLISH_DATE
   | `String "LABELS" -> LABELS
   | `String "ITEM_TYPE" -> ITEM_TYPE
   | `String "DISPLAY_URL" -> DISPLAY_URL
   | `String "AUTHOR" -> AUTHOR
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ConfluenceBlogFieldName"
            value)
   | _ -> raise (deserialize_wrong_type_error path "ConfluenceBlogFieldName") : 
  confluence_blog_field_name)
let confluence_blog_to_index_field_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_field_name =
       (option_of_yojson
          (value_for_key index_field_name_of_yojson "IndexFieldName") _list
          path);
     date_field_format =
       (option_of_yojson
          (value_for_key data_source_date_field_format_of_yojson
             "DateFieldFormat") _list path);
     data_source_field_name =
       (option_of_yojson
          (value_for_key confluence_blog_field_name_of_yojson
             "DataSourceFieldName") _list path)
   } : confluence_blog_to_index_field_mapping)
let confluence_blog_field_mappings_list_of_yojson tree path =
  list_of_yojson confluence_blog_to_index_field_mapping_of_yojson tree path
let confluence_blog_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blog_field_mappings =
       (option_of_yojson
          (value_for_key confluence_blog_field_mappings_list_of_yojson
             "BlogFieldMappings") _list path)
   } : confluence_blog_configuration)
let confluence_attachment_field_name_of_yojson (tree : t) path =
  (match tree with
   | `String "VERSION" -> VERSION
   | `String "URL" -> URL
   | `String "SPACE_NAME" -> SPACE_NAME
   | `String "SPACE_KEY" -> SPACE_KEY
   | `String "PARENT_ID" -> PARENT_ID
   | `String "ITEM_TYPE" -> ITEM_TYPE
   | `String "FILE_SIZE" -> FILE_SIZE
   | `String "DISPLAY_URL" -> DISPLAY_URL
   | `String "CREATED_DATE" -> CREATED_DATE
   | `String "CONTENT_TYPE" -> CONTENT_TYPE
   | `String "AUTHOR" -> AUTHOR
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ConfluenceAttachmentFieldName" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "ConfluenceAttachmentFieldName") : 
  confluence_attachment_field_name)
let confluence_attachment_to_index_field_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_field_name =
       (option_of_yojson
          (value_for_key index_field_name_of_yojson "IndexFieldName") _list
          path);
     date_field_format =
       (option_of_yojson
          (value_for_key data_source_date_field_format_of_yojson
             "DateFieldFormat") _list path);
     data_source_field_name =
       (option_of_yojson
          (value_for_key confluence_attachment_field_name_of_yojson
             "DataSourceFieldName") _list path)
   } : confluence_attachment_to_index_field_mapping)
let confluence_attachment_field_mappings_list_of_yojson tree path =
  list_of_yojson confluence_attachment_to_index_field_mapping_of_yojson tree
    path
let confluence_attachment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_field_mappings =
       (option_of_yojson
          (value_for_key confluence_attachment_field_mappings_list_of_yojson
             "AttachmentFieldMappings") _list path);
     crawl_attachments =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlAttachments") _list path)
   } : confluence_attachment_configuration)
let confluence_authentication_type_of_yojson (tree : t) path =
  (match tree with
   | `String "PAT" -> PAT
   | `String "HTTP_BASIC" -> HTTP_BASIC
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ConfluenceAuthenticationType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "ConfluenceAuthenticationType") : 
  confluence_authentication_type)
let confluence_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_type =
       (option_of_yojson
          (value_for_key confluence_authentication_type_of_yojson
             "AuthenticationType") _list path);
     proxy_configuration =
       (option_of_yojson
          (value_for_key proxy_configuration_of_yojson "ProxyConfiguration")
          _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     attachment_configuration =
       (option_of_yojson
          (value_for_key confluence_attachment_configuration_of_yojson
             "AttachmentConfiguration") _list path);
     blog_configuration =
       (option_of_yojson
          (value_for_key confluence_blog_configuration_of_yojson
             "BlogConfiguration") _list path);
     page_configuration =
       (option_of_yojson
          (value_for_key confluence_page_configuration_of_yojson
             "PageConfiguration") _list path);
     space_configuration =
       (option_of_yojson
          (value_for_key confluence_space_configuration_of_yojson
             "SpaceConfiguration") _list path);
     version =
       (value_for_key confluence_version_of_yojson "Version" _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     server_url = (value_for_key url_of_yojson "ServerUrl" _list path)
   } : confluence_configuration)
let mime_type_of_yojson = string_of_yojson
let exclude_mime_types_list_of_yojson tree path =
  list_of_yojson mime_type_of_yojson tree path
let exclude_user_accounts_list_of_yojson tree path =
  list_of_yojson user_account_of_yojson tree path
let shared_drive_id_of_yojson = string_of_yojson
let exclude_shared_drives_list_of_yojson tree path =
  list_of_yojson shared_drive_id_of_yojson tree path
let google_drive_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclude_shared_drives =
       (option_of_yojson
          (value_for_key exclude_shared_drives_list_of_yojson
             "ExcludeSharedDrives") _list path);
     exclude_user_accounts =
       (option_of_yojson
          (value_for_key exclude_user_accounts_list_of_yojson
             "ExcludeUserAccounts") _list path);
     exclude_mime_types =
       (option_of_yojson
          (value_for_key exclude_mime_types_list_of_yojson "ExcludeMimeTypes")
          _list path);
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path)
   } : google_drive_configuration)
let file_system_id_of_yojson = string_of_yojson
let fsx_file_system_type_of_yojson (tree : t) path =
  (match tree with
   | `String "WINDOWS" -> WINDOWS
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "FsxFileSystemType" value)
   | _ -> raise (deserialize_wrong_type_error path "FsxFileSystemType") : 
  fsx_file_system_type)
let fsx_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     secret_arn =
       (option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn")
          _list path);
     vpc_configuration =
       (value_for_key data_source_vpc_configuration_of_yojson
          "VpcConfiguration" _list path);
     file_system_type =
       (value_for_key fsx_file_system_type_of_yojson "FileSystemType" _list
          path);
     file_system_id =
       (value_for_key file_system_id_of_yojson "FileSystemId" _list path)
   } : fsx_configuration)
let team_id_of_yojson = string_of_yojson
let slack_entity_of_yojson (tree : t) path =
  (match tree with
   | `String "DIRECT_MESSAGE" -> DIRECT_MESSAGE
   | `String "GROUP_MESSAGE" -> GROUP_MESSAGE
   | `String "PRIVATE_CHANNEL" -> PRIVATE_CHANNEL
   | `String "PUBLIC_CHANNEL" -> PUBLIC_CHANNEL
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "SlackEntity" value)
   | _ -> raise (deserialize_wrong_type_error path "SlackEntity") : slack_entity)
let slack_entity_list_of_yojson tree path =
  list_of_yojson slack_entity_of_yojson tree path
let since_crawl_date_of_yojson = string_of_yojson
let look_back_period_of_yojson = int_of_yojson
let private_channel_filter_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let public_channel_filter_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let slack_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FieldMappings") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     public_channel_filter =
       (option_of_yojson
          (value_for_key public_channel_filter_of_yojson
             "PublicChannelFilter") _list path);
     private_channel_filter =
       (option_of_yojson
          (value_for_key private_channel_filter_of_yojson
             "PrivateChannelFilter") _list path);
     look_back_period =
       (option_of_yojson
          (value_for_key look_back_period_of_yojson "LookBackPeriod") _list
          path);
     since_crawl_date =
       (value_for_key since_crawl_date_of_yojson "SinceCrawlDate" _list path);
     exclude_archived =
       (option_of_yojson (value_for_key boolean__of_yojson "ExcludeArchived")
          _list path);
     crawl_bot_message =
       (option_of_yojson (value_for_key boolean__of_yojson "CrawlBotMessage")
          _list path);
     use_change_log =
       (option_of_yojson (value_for_key boolean__of_yojson "UseChangeLog")
          _list path);
     slack_entity_list =
       (value_for_key slack_entity_list_of_yojson "SlackEntityList" _list
          path);
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     team_id = (value_for_key team_id_of_yojson "TeamId" _list path)
   } : slack_configuration)
let enterprise_id_of_yojson = string_of_yojson
let box_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     web_link_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "WebLinkFieldMappings") _list path);
     comment_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "CommentFieldMappings") _list path);
     task_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "TaskFieldMappings") _list path);
     file_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "FileFieldMappings") _list path);
     crawl_web_links =
       (option_of_yojson (value_for_key boolean__of_yojson "CrawlWebLinks")
          _list path);
     crawl_tasks =
       (option_of_yojson (value_for_key boolean__of_yojson "CrawlTasks")
          _list path);
     crawl_comments =
       (option_of_yojson (value_for_key boolean__of_yojson "CrawlComments")
          _list path);
     use_change_log =
       (option_of_yojson (value_for_key boolean__of_yojson "UseChangeLog")
          _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     enterprise_id =
       (value_for_key enterprise_id_of_yojson "EnterpriseId" _list path)
   } : box_configuration)
let domain_of_yojson = string_of_yojson
let folder_id_of_yojson = string_of_yojson
let folder_id_list_of_yojson tree path =
  list_of_yojson folder_id_of_yojson tree path
let quip_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     attachment_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "AttachmentFieldMappings") _list path);
     message_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "MessageFieldMappings") _list path);
     thread_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "ThreadFieldMappings") _list path);
     folder_ids =
       (option_of_yojson (value_for_key folder_id_list_of_yojson "FolderIds")
          _list path);
     crawl_attachments =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlAttachments") _list path);
     crawl_chat_rooms =
       (option_of_yojson (value_for_key boolean__of_yojson "CrawlChatRooms")
          _list path);
     crawl_file_comments =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlFileComments") _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     domain = (value_for_key domain_of_yojson "Domain" _list path)
   } : quip_configuration)
let jira_account_url_of_yojson = string_of_yojson
let project_of_yojson tree path = list_of_yojson string__of_yojson tree path
let issue_type_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let jira_status_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let issue_sub_entity_of_yojson (tree : t) path =
  (match tree with
   | `String "WORKLOGS" -> WORKLOGS
   | `String "ATTACHMENTS" -> ATTACHMENTS
   | `String "COMMENTS" -> COMMENTS
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "IssueSubEntity" value)
   | _ -> raise (deserialize_wrong_type_error path "IssueSubEntity") : 
  issue_sub_entity)
let issue_sub_entity_filter_of_yojson tree path =
  list_of_yojson issue_sub_entity_of_yojson tree path
let jira_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     work_log_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "WorkLogFieldMappings") _list path);
     project_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "ProjectFieldMappings") _list path);
     issue_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "IssueFieldMappings") _list path);
     comment_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "CommentFieldMappings") _list path);
     attachment_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "AttachmentFieldMappings") _list path);
     issue_sub_entity_filter =
       (option_of_yojson
          (value_for_key issue_sub_entity_filter_of_yojson
             "IssueSubEntityFilter") _list path);
     status =
       (option_of_yojson (value_for_key jira_status_of_yojson "Status") _list
          path);
     issue_type =
       (option_of_yojson (value_for_key issue_type_of_yojson "IssueType")
          _list path);
     project =
       (option_of_yojson (value_for_key project_of_yojson "Project") _list
          path);
     use_change_log =
       (option_of_yojson (value_for_key boolean__of_yojson "UseChangeLog")
          _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     jira_account_url =
       (value_for_key jira_account_url_of_yojson "JiraAccountUrl" _list path)
   } : jira_configuration)
let organization_name_of_yojson = string_of_yojson
let saa_s_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_url = (value_for_key url_of_yojson "HostUrl" _list path);
     organization_name =
       (value_for_key organization_name_of_yojson "OrganizationName" _list
          path)
   } : saa_s_configuration)
let on_premise_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ssl_certificate_s3_path =
       (value_for_key s3_path_of_yojson "SslCertificateS3Path" _list path);
     organization_name =
       (value_for_key organization_name_of_yojson "OrganizationName" _list
          path);
     host_url = (value_for_key url_of_yojson "HostUrl" _list path)
   } : on_premise_configuration)
let type__of_yojson (tree : t) path =
  (match tree with
   | `String "ON_PREMISE" -> ON_PREMISE
   | `String "SAAS" -> SAAS
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "Type" value)
   | _ -> raise (deserialize_wrong_type_error path "Type") : type_)
let git_hub_document_crawl_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     crawl_pull_request_comment_attachment =
       (option_of_yojson
          (value_for_key boolean__of_yojson
             "CrawlPullRequestCommentAttachment") _list path);
     crawl_pull_request_comment =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlPullRequestComment") _list
          path);
     crawl_pull_request =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlPullRequest") _list path);
     crawl_issue_comment_attachment =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlIssueCommentAttachment")
          _list path);
     crawl_issue_comment =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlIssueComment") _list path);
     crawl_issue =
       (option_of_yojson (value_for_key boolean__of_yojson "CrawlIssue")
          _list path);
     crawl_repository_documents =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlRepositoryDocuments") _list
          path)
   } : git_hub_document_crawl_properties)
let repository_name_of_yojson = string_of_yojson
let repository_names_of_yojson tree path =
  list_of_yojson repository_name_of_yojson tree path
let string_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let git_hub_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     git_hub_pull_request_document_attachment_configuration_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "GitHubPullRequestDocumentAttachmentConfigurationFieldMappings")
          _list path);
     git_hub_pull_request_document_configuration_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "GitHubPullRequestDocumentConfigurationFieldMappings") _list
          path);
     git_hub_pull_request_comment_configuration_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "GitHubPullRequestCommentConfigurationFieldMappings") _list path);
     git_hub_issue_attachment_configuration_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "GitHubIssueAttachmentConfigurationFieldMappings") _list path);
     git_hub_issue_comment_configuration_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "GitHubIssueCommentConfigurationFieldMappings") _list path);
     git_hub_issue_document_configuration_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "GitHubIssueDocumentConfigurationFieldMappings") _list path);
     git_hub_commit_configuration_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "GitHubCommitConfigurationFieldMappings") _list path);
     git_hub_repository_configuration_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "GitHubRepositoryConfigurationFieldMappings") _list path);
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     exclusion_file_name_patterns =
       (option_of_yojson
          (value_for_key string_list_of_yojson "ExclusionFileNamePatterns")
          _list path);
     exclusion_file_type_patterns =
       (option_of_yojson
          (value_for_key string_list_of_yojson "ExclusionFileTypePatterns")
          _list path);
     exclusion_folder_name_patterns =
       (option_of_yojson
          (value_for_key string_list_of_yojson "ExclusionFolderNamePatterns")
          _list path);
     inclusion_file_name_patterns =
       (option_of_yojson
          (value_for_key string_list_of_yojson "InclusionFileNamePatterns")
          _list path);
     inclusion_file_type_patterns =
       (option_of_yojson
          (value_for_key string_list_of_yojson "InclusionFileTypePatterns")
          _list path);
     inclusion_folder_name_patterns =
       (option_of_yojson
          (value_for_key string_list_of_yojson "InclusionFolderNamePatterns")
          _list path);
     repository_filter =
       (option_of_yojson
          (value_for_key repository_names_of_yojson "RepositoryFilter") _list
          path);
     git_hub_document_crawl_properties =
       (option_of_yojson
          (value_for_key git_hub_document_crawl_properties_of_yojson
             "GitHubDocumentCrawlProperties") _list path);
     use_change_log =
       (option_of_yojson (value_for_key boolean__of_yojson "UseChangeLog")
          _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     type_ =
       (option_of_yojson (value_for_key type__of_yojson "Type") _list path);
     on_premise_configuration =
       (option_of_yojson
          (value_for_key on_premise_configuration_of_yojson
             "OnPremiseConfiguration") _list path);
     saa_s_configuration =
       (option_of_yojson
          (value_for_key saa_s_configuration_of_yojson "SaaSConfiguration")
          _list path)
   } : git_hub_configuration)
let site_url_of_yojson = string_of_yojson
let site_id_of_yojson = string_of_yojson
let alfresco_entity_of_yojson (tree : t) path =
  (match tree with
   | `String "documentLibrary" -> DocumentLibrary
   | `String "blog" -> Blog
   | `String "wiki" -> Wiki
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "AlfrescoEntity" value)
   | _ -> raise (deserialize_wrong_type_error path "AlfrescoEntity") : 
  alfresco_entity)
let entity_filter_of_yojson tree path =
  list_of_yojson alfresco_entity_of_yojson tree path
let alfresco_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     exclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "ExclusionPatterns") _list path);
     inclusion_patterns =
       (option_of_yojson
          (value_for_key data_source_inclusions_exclusions_strings_of_yojson
             "InclusionPatterns") _list path);
     wiki_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "WikiFieldMappings") _list path);
     blog_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "BlogFieldMappings") _list path);
     document_library_field_mappings =
       (option_of_yojson
          (value_for_key data_source_to_index_field_mapping_list_of_yojson
             "DocumentLibraryFieldMappings") _list path);
     entity_filter =
       (option_of_yojson
          (value_for_key entity_filter_of_yojson "EntityFilter") _list path);
     crawl_comments =
       (option_of_yojson (value_for_key boolean__of_yojson "CrawlComments")
          _list path);
     crawl_system_folders =
       (option_of_yojson
          (value_for_key boolean__of_yojson "CrawlSystemFolders") _list path);
     ssl_certificate_s3_path =
       (value_for_key s3_path_of_yojson "SslCertificateS3Path" _list path);
     secret_arn = (value_for_key secret_arn_of_yojson "SecretArn" _list path);
     site_id = (value_for_key site_id_of_yojson "SiteId" _list path);
     site_url = (value_for_key site_url_of_yojson "SiteUrl" _list path)
   } : alfresco_configuration)
let template_of_yojson = json_of_yojson
let template_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template =
       (option_of_yojson (value_for_key template_of_yojson "Template") _list
          path)
   } : template_configuration)
let data_source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_configuration =
       (option_of_yojson
          (value_for_key template_configuration_of_yojson
             "TemplateConfiguration") _list path);
     alfresco_configuration =
       (option_of_yojson
          (value_for_key alfresco_configuration_of_yojson
             "AlfrescoConfiguration") _list path);
     git_hub_configuration =
       (option_of_yojson
          (value_for_key git_hub_configuration_of_yojson
             "GitHubConfiguration") _list path);
     jira_configuration =
       (option_of_yojson
          (value_for_key jira_configuration_of_yojson "JiraConfiguration")
          _list path);
     quip_configuration =
       (option_of_yojson
          (value_for_key quip_configuration_of_yojson "QuipConfiguration")
          _list path);
     box_configuration =
       (option_of_yojson
          (value_for_key box_configuration_of_yojson "BoxConfiguration")
          _list path);
     slack_configuration =
       (option_of_yojson
          (value_for_key slack_configuration_of_yojson "SlackConfiguration")
          _list path);
     fsx_configuration =
       (option_of_yojson
          (value_for_key fsx_configuration_of_yojson "FsxConfiguration")
          _list path);
     work_docs_configuration =
       (option_of_yojson
          (value_for_key work_docs_configuration_of_yojson
             "WorkDocsConfiguration") _list path);
     web_crawler_configuration =
       (option_of_yojson
          (value_for_key web_crawler_configuration_of_yojson
             "WebCrawlerConfiguration") _list path);
     google_drive_configuration =
       (option_of_yojson
          (value_for_key google_drive_configuration_of_yojson
             "GoogleDriveConfiguration") _list path);
     confluence_configuration =
       (option_of_yojson
          (value_for_key confluence_configuration_of_yojson
             "ConfluenceConfiguration") _list path);
     service_now_configuration =
       (option_of_yojson
          (value_for_key service_now_configuration_of_yojson
             "ServiceNowConfiguration") _list path);
     one_drive_configuration =
       (option_of_yojson
          (value_for_key one_drive_configuration_of_yojson
             "OneDriveConfiguration") _list path);
     salesforce_configuration =
       (option_of_yojson
          (value_for_key salesforce_configuration_of_yojson
             "SalesforceConfiguration") _list path);
     database_configuration =
       (option_of_yojson
          (value_for_key database_configuration_of_yojson
             "DatabaseConfiguration") _list path);
     share_point_configuration =
       (option_of_yojson
          (value_for_key share_point_configuration_of_yojson
             "SharePointConfiguration") _list path);
     s3_configuration =
       (option_of_yojson
          (value_for_key s3_data_source_configuration_of_yojson
             "S3Configuration") _list path)
   } : data_source_configuration)
let scan_schedule_of_yojson = string_of_yojson
let language_code_of_yojson = string_of_yojson
let condition_operator_of_yojson (tree : t) path =
  (match tree with
   | `String "BeginsWith" -> BeginsWith
   | `String "NotExists" -> NotExists
   | `String "Exists" -> Exists
   | `String "NotContains" -> NotContains
   | `String "Contains" -> Contains
   | `String "NotEquals" -> NotEquals
   | `String "Equals" -> Equals
   | `String "LessThanOrEquals" -> LessThanOrEquals
   | `String "LessThan" -> LessThan
   | `String "GreaterThanOrEquals" -> GreaterThanOrEquals
   | `String "GreaterThan" -> GreaterThan
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ConditionOperator" value)
   | _ -> raise (deserialize_wrong_type_error path "ConditionOperator") : 
  condition_operator)
let document_attribute_string_value_of_yojson = string_of_yojson
let document_attribute_string_list_value_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let timestamp__of_yojson = timestamp_epoch_seconds_of_yojson
let document_attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date_value =
       (option_of_yojson (value_for_key timestamp__of_yojson "DateValue")
          _list path);
     long_value =
       (option_of_yojson (value_for_key long_of_yojson "LongValue") _list
          path);
     string_list_value =
       (option_of_yojson
          (value_for_key document_attribute_string_list_value_of_yojson
             "StringListValue") _list path);
     string_value =
       (option_of_yojson
          (value_for_key document_attribute_string_value_of_yojson
             "StringValue") _list path)
   } : document_attribute_value)
let document_attribute_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition_on_value =
       (option_of_yojson
          (value_for_key document_attribute_value_of_yojson
             "ConditionOnValue") _list path);
     operator =
       (value_for_key condition_operator_of_yojson "Operator" _list path);
     condition_document_attribute_key =
       (value_for_key document_attribute_key_of_yojson
          "ConditionDocumentAttributeKey" _list path)
   } : document_attribute_condition)
let document_attribute_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_document_attribute_value =
       (option_of_yojson
          (value_for_key document_attribute_value_of_yojson
             "TargetDocumentAttributeValue") _list path);
     target_document_attribute_value_deletion =
       (option_of_yojson
          (value_for_key boolean__of_yojson
             "TargetDocumentAttributeValueDeletion") _list path);
     target_document_attribute_key =
       (option_of_yojson
          (value_for_key document_attribute_key_of_yojson
             "TargetDocumentAttributeKey") _list path)
   } : document_attribute_target)
let inline_custom_document_enrichment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_content_deletion =
       (option_of_yojson
          (value_for_key boolean__of_yojson "DocumentContentDeletion") _list
          path);
     target =
       (option_of_yojson
          (value_for_key document_attribute_target_of_yojson "Target") _list
          path);
     condition =
       (option_of_yojson
          (value_for_key document_attribute_condition_of_yojson "Condition")
          _list path)
   } : inline_custom_document_enrichment_configuration)
let inline_custom_document_enrichment_configuration_list_of_yojson tree path
  =
  list_of_yojson inline_custom_document_enrichment_configuration_of_yojson
    tree path
let lambda_arn_of_yojson = string_of_yojson
let hook_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket =
       (value_for_key s3_bucket_name_of_yojson "S3Bucket" _list path);
     lambda_arn = (value_for_key lambda_arn_of_yojson "LambdaArn" _list path);
     invocation_condition =
       (option_of_yojson
          (value_for_key document_attribute_condition_of_yojson
             "InvocationCondition") _list path)
   } : hook_configuration)
let custom_document_enrichment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     post_extraction_hook_configuration =
       (option_of_yojson
          (value_for_key hook_configuration_of_yojson
             "PostExtractionHookConfiguration") _list path);
     pre_extraction_hook_configuration =
       (option_of_yojson
          (value_for_key hook_configuration_of_yojson
             "PreExtractionHookConfiguration") _list path);
     inline_configurations =
       (option_of_yojson
          (value_for_key
             inline_custom_document_enrichment_configuration_list_of_yojson
             "InlineConfigurations") _list path)
   } : custom_document_enrichment_configuration)
let update_data_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_document_enrichment_configuration =
       (option_of_yojson
          (value_for_key custom_document_enrichment_configuration_of_yojson
             "CustomDocumentEnrichmentConfiguration") _list path);
     language_code =
       (option_of_yojson
          (value_for_key language_code_of_yojson "LanguageCode") _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     schedule =
       (option_of_yojson (value_for_key scan_schedule_of_yojson "Schedule")
          _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     configuration =
       (option_of_yojson
          (value_for_key data_source_configuration_of_yojson "Configuration")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     name =
       (option_of_yojson (value_for_key data_source_name_of_yojson "Name")
          _list path);
     id = (value_for_key data_source_id_of_yojson "Id" _list path)
   } : update_data_source_request)
let update_access_control_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let access_control_configuration_id_of_yojson = string_of_yojson
let access_control_configuration_name_of_yojson = string_of_yojson
let principal_type_of_yojson (tree : t) path =
  (match tree with
   | `String "GROUP" -> GROUP
   | `String "USER" -> USER
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "PrincipalType" value)
   | _ -> raise (deserialize_wrong_type_error path "PrincipalType") : 
  principal_type)
let read_access_type_of_yojson (tree : t) path =
  (match tree with
   | `String "DENY" -> DENY
   | `String "ALLOW" -> ALLOW
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ReadAccessType" value)
   | _ -> raise (deserialize_wrong_type_error path "ReadAccessType") : 
  read_access_type)
let principal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id =
       (option_of_yojson
          (value_for_key data_source_id_of_yojson "DataSourceId") _list path);
     access = (value_for_key read_access_type_of_yojson "Access" _list path);
     type_ = (value_for_key principal_type_of_yojson "Type" _list path);
     name = (value_for_key principal_name_of_yojson "Name" _list path)
   } : principal)
let principal_list_of_yojson tree path =
  list_of_yojson principal_of_yojson tree path
let hierarchical_principal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_list =
       (value_for_key principal_list_of_yojson "PrincipalList" _list path)
   } : hierarchical_principal)
let hierarchical_principal_list_of_yojson tree path =
  list_of_yojson hierarchical_principal_of_yojson tree path
let update_access_control_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hierarchical_access_control_list =
       (option_of_yojson
          (value_for_key hierarchical_principal_list_of_yojson
             "HierarchicalAccessControlList") _list path);
     access_control_list =
       (option_of_yojson
          (value_for_key principal_list_of_yojson "AccessControlList") _list
          path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name =
       (option_of_yojson
          (value_for_key access_control_configuration_name_of_yojson "Name")
          _list path);
     id =
       (value_for_key access_control_configuration_id_of_yojson "Id" _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : update_access_control_configuration_request)
let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path =
  list_of_yojson tag_key_of_yojson tree path
let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_key_list_of_yojson "TagKeys" _list path);
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : untag_resource_request)
let resource_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : resource_unavailable_exception)
let top_document_attribute_value_count_pairs_size_of_yojson = int_of_yojson
let title_of_yojson = string_of_yojson
let time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "EndTime") _list
          path);
     start_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "StartTime")
          _list path)
   } : time_range)
let thesaurus_status_of_yojson (tree : t) path =
  (match tree with
   | `String "FAILED" -> FAILED
   | `String "ACTIVE_BUT_UPDATE_FAILED" -> ACTIVE_BUT_UPDATE_FAILED
   | `String "UPDATING" -> UPDATING
   | `String "DELETING" -> DELETING
   | `String "ACTIVE" -> ACTIVE
   | `String "CREATING" -> CREATING
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ThesaurusStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "ThesaurusStatus") : 
  thesaurus_status)
let thesaurus_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     status =
       (option_of_yojson (value_for_key thesaurus_status_of_yojson "Status")
          _list path);
     name =
       (option_of_yojson (value_for_key thesaurus_name_of_yojson "Name")
          _list path);
     id =
       (option_of_yojson (value_for_key thesaurus_id_of_yojson "Id") _list
          path)
   } : thesaurus_summary)
let thesaurus_summary_items_of_yojson tree path =
  list_of_yojson thesaurus_summary_of_yojson tree path
let highlight_type_of_yojson (tree : t) path =
  (match tree with
   | `String "THESAURUS_SYNONYM" -> THESAURUS_SYNONYM
   | `String "STANDARD" -> STANDARD
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "HighlightType" value)
   | _ -> raise (deserialize_wrong_type_error path "HighlightType") : 
  highlight_type)
let highlight_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       (option_of_yojson (value_for_key highlight_type_of_yojson "Type")
          _list path);
     top_answer =
       (option_of_yojson (value_for_key boolean__of_yojson "TopAnswer") _list
          path);
     end_offset = (value_for_key integer__of_yojson "EndOffset" _list path);
     begin_offset =
       (value_for_key integer__of_yojson "BeginOffset" _list path)
   } : highlight)
let highlight_list_of_yojson tree path =
  list_of_yojson highlight_of_yojson tree path
let text_with_highlights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     highlights =
       (option_of_yojson
          (value_for_key highlight_list_of_yojson "Highlights") _list path);
     text =
       (option_of_yojson (value_for_key string__of_yojson "Text") _list path)
   } : text_with_highlights)
let indexed_text_documents_count_of_yojson = int_of_yojson
let indexed_text_bytes_of_yojson = long_of_yojson
let text_document_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     indexed_text_bytes =
       (value_for_key indexed_text_bytes_of_yojson "IndexedTextBytes" _list
          path);
     indexed_text_documents_count =
       (value_for_key indexed_text_documents_count_of_yojson
          "IndexedTextDocumentsCount" _list path)
   } : text_document_statistics)
let tag_value_of_yojson = string_of_yojson
let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = (value_for_key tag_value_of_yojson "Value" _list path);
     key = (value_for_key tag_key_of_yojson "Key" _list path)
   } : tag)
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tag_list_of_yojson "Tags" _list path);
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : tag_resource_request)
let table_cell_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header =
       (option_of_yojson (value_for_key boolean__of_yojson "Header") _list
          path);
     highlighted =
       (option_of_yojson (value_for_key boolean__of_yojson "Highlighted")
          _list path);
     top_answer =
       (option_of_yojson (value_for_key boolean__of_yojson "TopAnswer") _list
          path);
     value =
       (option_of_yojson (value_for_key string__of_yojson "Value") _list path)
   } : table_cell)
let table_cell_list_of_yojson tree path =
  list_of_yojson table_cell_of_yojson tree path
let table_row_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cells =
       (option_of_yojson (value_for_key table_cell_list_of_yojson "Cells")
          _list path)
   } : table_row)
let table_row_list_of_yojson tree path =
  list_of_yojson table_row_of_yojson tree path
let table_excerpt_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_number_of_rows =
       (option_of_yojson
          (value_for_key integer__of_yojson "TotalNumberOfRows") _list path);
     rows =
       (option_of_yojson (value_for_key table_row_list_of_yojson "Rows")
          _list path)
   } : table_excerpt)
let suggestion_highlight_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_offset =
       (option_of_yojson (value_for_key integer__of_yojson "EndOffset") _list
          path);
     begin_offset =
       (option_of_yojson (value_for_key integer__of_yojson "BeginOffset")
          _list path)
   } : suggestion_highlight)
let suggestion_highlight_list_of_yojson tree path =
  list_of_yojson suggestion_highlight_of_yojson tree path
let suggestion_text_with_highlights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     highlights =
       (option_of_yojson
          (value_for_key suggestion_highlight_list_of_yojson "Highlights")
          _list path);
     text =
       (option_of_yojson (value_for_key string__of_yojson "Text") _list path)
   } : suggestion_text_with_highlights)
let suggestion_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text =
       (option_of_yojson
          (value_for_key suggestion_text_with_highlights_of_yojson "Text")
          _list path)
   } : suggestion_value)
let suggestion_type_of_yojson (tree : t) path =
  (match tree with
   | `String "DOCUMENT_ATTRIBUTES" -> DOCUMENT_ATTRIBUTES
   | `String "QUERY" -> QUERY
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "SuggestionType" value)
   | _ -> raise (deserialize_wrong_type_error path "SuggestionType") : 
  suggestion_type)
let suggestion_types_of_yojson tree path =
  list_of_yojson suggestion_type_of_yojson tree path
let suggestion_query_text_of_yojson = string_of_yojson
let result_id_of_yojson = string_of_yojson
let document_attribute_key_list_of_yojson tree path =
  list_of_yojson document_attribute_key_of_yojson tree path
let document_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (value_for_key document_attribute_value_of_yojson "Value" _list path);
     key = (value_for_key document_attribute_key_of_yojson "Key" _list path)
   } : document_attribute)
let document_attribute_list_of_yojson tree path =
  list_of_yojson document_attribute_of_yojson tree path
let source_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_attributes =
       (option_of_yojson
          (value_for_key document_attribute_list_of_yojson
             "AdditionalAttributes") _list path);
     suggestion_attributes =
       (option_of_yojson
          (value_for_key document_attribute_key_list_of_yojson
             "SuggestionAttributes") _list path);
     document_id =
       (option_of_yojson (value_for_key string__of_yojson "DocumentId") _list
          path)
   } : source_document)
let source_documents_of_yojson tree path =
  list_of_yojson source_document_of_yojson tree path
let suggestion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_documents =
       (option_of_yojson
          (value_for_key source_documents_of_yojson "SourceDocuments") _list
          path);
     value =
       (option_of_yojson (value_for_key suggestion_value_of_yojson "Value")
          _list path);
     id =
       (option_of_yojson (value_for_key result_id_of_yojson "Id") _list path)
   } : suggestion)
let suggestion_list_of_yojson tree path =
  list_of_yojson suggestion_of_yojson tree path
let suggested_query_text_of_yojson = string_of_yojson
let query_id_of_yojson = string_of_yojson
let click_feedback_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     click_time = (value_for_key timestamp__of_yojson "ClickTime" _list path);
     result_id = (value_for_key result_id_of_yojson "ResultId" _list path)
   } : click_feedback)
let click_feedback_list_of_yojson tree path =
  list_of_yojson click_feedback_of_yojson tree path
let relevance_type_of_yojson (tree : t) path =
  (match tree with
   | `String "NOT_RELEVANT" -> NOT_RELEVANT
   | `String "RELEVANT" -> RELEVANT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "RelevanceType" value)
   | _ -> raise (deserialize_wrong_type_error path "RelevanceType") : 
  relevance_type)
let relevance_feedback_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relevance_value =
       (value_for_key relevance_type_of_yojson "RelevanceValue" _list path);
     result_id = (value_for_key result_id_of_yojson "ResultId" _list path)
   } : relevance_feedback)
let relevance_feedback_list_of_yojson tree path =
  list_of_yojson relevance_feedback_of_yojson tree path
let submit_feedback_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relevance_feedback_items =
       (option_of_yojson
          (value_for_key relevance_feedback_list_of_yojson
             "RelevanceFeedbackItems") _list path);
     click_feedback_items =
       (option_of_yojson
          (value_for_key click_feedback_list_of_yojson "ClickFeedbackItems")
          _list path);
     query_id = (value_for_key query_id_of_yojson "QueryId" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : submit_feedback_request)
let stop_data_source_sync_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key data_source_id_of_yojson "Id" _list path)
   } : stop_data_source_sync_job_request)
let document_status_of_yojson (tree : t) path =
  (match tree with
   | `String "UPDATE_FAILED" -> UPDATE_FAILED
   | `String "FAILED" -> FAILED
   | `String "UPDATED" -> UPDATED
   | `String "INDEXED" -> INDEXED
   | `String "PROCESSING" -> PROCESSING
   | `String "NOT_FOUND" -> NOT_FOUND
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "DocumentStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "DocumentStatus") : 
  document_status)
let status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       (option_of_yojson (value_for_key string__of_yojson "FailureReason")
          _list path);
     failure_code =
       (option_of_yojson (value_for_key string__of_yojson "FailureCode")
          _list path);
     document_status =
       (option_of_yojson
          (value_for_key document_status_of_yojson "DocumentStatus") _list
          path);
     document_id =
       (option_of_yojson (value_for_key document_id_of_yojson "DocumentId")
          _list path)
   } : status)
let start_data_source_sync_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_id =
       (option_of_yojson (value_for_key string__of_yojson "ExecutionId")
          _list path)
   } : start_data_source_sync_job_response)
let start_data_source_sync_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key data_source_id_of_yojson "Id" _list path)
   } : start_data_source_sync_job_request)
let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : resource_in_use_exception)
let spell_correction_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_query_spell_check_suggestions =
       (value_for_key boolean__of_yojson "IncludeQuerySpellCheckSuggestions"
          _list path)
   } : spell_correction_configuration)
let correction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     corrected_term =
       (option_of_yojson (value_for_key string__of_yojson "CorrectedTerm")
          _list path);
     term =
       (option_of_yojson (value_for_key string__of_yojson "Term") _list path);
     end_offset =
       (option_of_yojson (value_for_key integer__of_yojson "EndOffset") _list
          path);
     begin_offset =
       (option_of_yojson (value_for_key integer__of_yojson "BeginOffset")
          _list path)
   } : correction)
let correction_list_of_yojson tree path =
  list_of_yojson correction_of_yojson tree path
let spell_corrected_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     corrections =
       (option_of_yojson
          (value_for_key correction_list_of_yojson "Corrections") _list path);
     suggested_query_text =
       (option_of_yojson
          (value_for_key suggested_query_text_of_yojson "SuggestedQueryText")
          _list path)
   } : spell_corrected_query)
let spell_corrected_query_list_of_yojson tree path =
  list_of_yojson spell_corrected_query_of_yojson tree path
let sort_order_of_yojson (tree : t) path =
  (match tree with
   | `String "ASC" -> ASC
   | `String "DESC" -> DESC
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "SortOrder" value)
   | _ -> raise (deserialize_wrong_type_error path "SortOrder") : sort_order)
let sorting_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = (value_for_key sort_order_of_yojson "SortOrder" _list path);
     document_attribute_key =
       (value_for_key document_attribute_key_of_yojson "DocumentAttributeKey"
          _list path)
   } : sorting_configuration)
let sorting_configuration_list_of_yojson tree path =
  list_of_yojson sorting_configuration_of_yojson tree path
let snapshots_data_record_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let snapshots_data_records_of_yojson tree path =
  list_of_yojson snapshots_data_record_of_yojson tree path
let snapshots_data_header_fields_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let kms_key_id_of_yojson = string_of_yojson
let server_side_encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id =
       (option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId")
          _list path)
   } : server_side_encryption_configuration)
let score_confidence_of_yojson (tree : t) path =
  (match tree with
   | `String "NOT_AVAILABLE" -> NOT_AVAILABLE
   | `String "LOW" -> LOW
   | `String "MEDIUM" -> MEDIUM
   | `String "HIGH" -> HIGH
   | `String "VERY_HIGH" -> VERY_HIGH
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ScoreConfidence" value)
   | _ -> raise (deserialize_wrong_type_error path "ScoreConfidence") : 
  score_confidence)
let score_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score_confidence =
       (option_of_yojson
          (value_for_key score_confidence_of_yojson "ScoreConfidence") _list
          path)
   } : score_attributes)
let document_title_of_yojson = string_of_yojson
let content_of_yojson = string_of_yojson
let retrieve_result_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score_attributes =
       (option_of_yojson
          (value_for_key score_attributes_of_yojson "ScoreAttributes") _list
          path);
     document_attributes =
       (option_of_yojson
          (value_for_key document_attribute_list_of_yojson
             "DocumentAttributes") _list path);
     document_ur_i =
       (option_of_yojson (value_for_key url_of_yojson "DocumentURI") _list
          path);
     content =
       (option_of_yojson (value_for_key content_of_yojson "Content") _list
          path);
     document_title =
       (option_of_yojson
          (value_for_key document_title_of_yojson "DocumentTitle") _list path);
     document_id =
       (option_of_yojson (value_for_key document_id_of_yojson "DocumentId")
          _list path);
     id =
       (option_of_yojson (value_for_key result_id_of_yojson "Id") _list path)
   } : retrieve_result_item)
let retrieve_result_item_list_of_yojson tree path =
  list_of_yojson retrieve_result_item_of_yojson tree path
let retrieve_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_items =
       (option_of_yojson
          (value_for_key retrieve_result_item_list_of_yojson "ResultItems")
          _list path);
     query_id =
       (option_of_yojson (value_for_key query_id_of_yojson "QueryId") _list
          path)
   } : retrieve_result)
let rec attribute_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     less_than_or_equals =
       (option_of_yojson
          (value_for_key document_attribute_of_yojson "LessThanOrEquals")
          _list path);
     less_than =
       (option_of_yojson
          (value_for_key document_attribute_of_yojson "LessThan") _list path);
     greater_than_or_equals =
       (option_of_yojson
          (value_for_key document_attribute_of_yojson "GreaterThanOrEquals")
          _list path);
     greater_than =
       (option_of_yojson
          (value_for_key document_attribute_of_yojson "GreaterThan") _list
          path);
     contains_any =
       (option_of_yojson
          (value_for_key document_attribute_of_yojson "ContainsAny") _list
          path);
     contains_all =
       (option_of_yojson
          (value_for_key document_attribute_of_yojson "ContainsAll") _list
          path);
     equals_to =
       (option_of_yojson
          (value_for_key document_attribute_of_yojson "EqualsTo") _list path);
     not_filter =
       (option_of_yojson
          (value_for_key attribute_filter_of_yojson "NotFilter") _list path);
     or_all_filters =
       (option_of_yojson
          (value_for_key attribute_filter_list_of_yojson "OrAllFilters")
          _list path);
     and_all_filters =
       (option_of_yojson
          (value_for_key attribute_filter_list_of_yojson "AndAllFilters")
          _list path)
   } : attribute_filter)
and attribute_filter_list_of_yojson tree path =
  list_of_yojson attribute_filter_of_yojson tree path
let document_relevance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relevance = (value_for_key relevance_of_yojson "Relevance" _list path);
     name =
       (value_for_key document_metadata_configuration_name_of_yojson "Name"
          _list path)
   } : document_relevance_configuration)
let document_relevance_override_configuration_list_of_yojson tree path =
  list_of_yojson document_relevance_configuration_of_yojson tree path
let retrieve_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_context =
       (option_of_yojson (value_for_key user_context_of_yojson "UserContext")
          _list path);
     page_size =
       (option_of_yojson (value_for_key integer__of_yojson "PageSize") _list
          path);
     page_number =
       (option_of_yojson (value_for_key integer__of_yojson "PageNumber")
          _list path);
     document_relevance_override_configurations =
       (option_of_yojson
          (value_for_key
             document_relevance_override_configuration_list_of_yojson
             "DocumentRelevanceOverrideConfigurations") _list path);
     requested_document_attributes =
       (option_of_yojson
          (value_for_key document_attribute_key_list_of_yojson
             "RequestedDocumentAttributes") _list path);
     attribute_filter =
       (option_of_yojson
          (value_for_key attribute_filter_of_yojson "AttributeFilter") _list
          path);
     query_text = (value_for_key query_text_of_yojson "QueryText" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : retrieve_request)
let resource_already_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : resource_already_exist_exception)
let query_suggestions_status_of_yojson (tree : t) path =
  (match tree with
   | `String "UPDATING" -> UPDATING
   | `String "ACTIVE" -> ACTIVE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "QuerySuggestionsStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "QuerySuggestionsStatus") : 
  query_suggestions_status)
let query_suggestions_id_of_yojson = string_of_yojson
let query_suggestions_block_list_status_of_yojson (tree : t) path =
  (match tree with
   | `String "FAILED" -> FAILED
   | `String "ACTIVE_BUT_UPDATE_FAILED" -> ACTIVE_BUT_UPDATE_FAILED
   | `String "UPDATING" -> UPDATING
   | `String "DELETING" -> DELETING
   | `String "CREATING" -> CREATING
   | `String "ACTIVE" -> ACTIVE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "QuerySuggestionsBlockListStatus" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "QuerySuggestionsBlockListStatus") : 
  query_suggestions_block_list_status)
let query_suggestions_block_list_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_count =
       (option_of_yojson (value_for_key integer__of_yojson "ItemCount") _list
          path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     status =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_status_of_yojson
             "Status") _list path);
     name =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_name_of_yojson "Name")
          _list path);
     id =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_id_of_yojson "Id")
          _list path)
   } : query_suggestions_block_list_summary)
let query_suggestions_block_list_summary_items_of_yojson tree path =
  list_of_yojson query_suggestions_block_list_summary_of_yojson tree path
let query_result_type_of_yojson (tree : t) path =
  (match tree with
   | `String "ANSWER" -> ANSWER
   | `String "QUESTION_ANSWER" -> QUESTION_ANSWER
   | `String "DOCUMENT" -> DOCUMENT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "QueryResultType" value)
   | _ -> raise (deserialize_wrong_type_error path "QueryResultType") : 
  query_result_type)
let query_result_format_of_yojson (tree : t) path =
  (match tree with
   | `String "TEXT" -> TEXT
   | `String "TABLE" -> TABLE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "QueryResultFormat" value)
   | _ -> raise (deserialize_wrong_type_error path "QueryResultFormat") : 
  query_result_format)
let additional_result_attribute_value_type_of_yojson (tree : t) path =
  (match tree with
   | `String "TEXT_WITH_HIGHLIGHTS_VALUE" -> TEXT_WITH_HIGHLIGHTS_VALUE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "AdditionalResultAttributeValueType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "AdditionalResultAttributeValueType") : additional_result_attribute_value_type)
let additional_result_attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_with_highlights_value =
       (option_of_yojson
          (value_for_key text_with_highlights_of_yojson
             "TextWithHighlightsValue") _list path)
   } : additional_result_attribute_value)
let additional_result_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (value_for_key additional_result_attribute_value_of_yojson "Value"
          _list path);
     value_type =
       (value_for_key additional_result_attribute_value_type_of_yojson
          "ValueType" _list path);
     key = (value_for_key string__of_yojson "Key" _list path)
   } : additional_result_attribute)
let additional_result_attribute_list_of_yojson tree path =
  list_of_yojson additional_result_attribute_of_yojson tree path
let feedback_token_of_yojson = string_of_yojson
let expanded_result_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_attributes =
       (option_of_yojson
          (value_for_key document_attribute_list_of_yojson
             "DocumentAttributes") _list path);
     document_ur_i =
       (option_of_yojson (value_for_key url_of_yojson "DocumentURI") _list
          path);
     document_excerpt =
       (option_of_yojson
          (value_for_key text_with_highlights_of_yojson "DocumentExcerpt")
          _list path);
     document_title =
       (option_of_yojson
          (value_for_key text_with_highlights_of_yojson "DocumentTitle")
          _list path);
     document_id =
       (option_of_yojson (value_for_key document_id_of_yojson "DocumentId")
          _list path);
     id =
       (option_of_yojson (value_for_key result_id_of_yojson "Id") _list path)
   } : expanded_result_item)
let expanded_result_list_of_yojson tree path =
  list_of_yojson expanded_result_item_of_yojson tree path
let collapsed_result_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expanded_results =
       (option_of_yojson
          (value_for_key expanded_result_list_of_yojson "ExpandedResults")
          _list path);
     document_attribute =
       (value_for_key document_attribute_of_yojson "DocumentAttribute" _list
          path)
   } : collapsed_result_detail)
let query_result_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collapsed_result_detail =
       (option_of_yojson
          (value_for_key collapsed_result_detail_of_yojson
             "CollapsedResultDetail") _list path);
     table_excerpt =
       (option_of_yojson
          (value_for_key table_excerpt_of_yojson "TableExcerpt") _list path);
     feedback_token =
       (option_of_yojson
          (value_for_key feedback_token_of_yojson "FeedbackToken") _list path);
     score_attributes =
       (option_of_yojson
          (value_for_key score_attributes_of_yojson "ScoreAttributes") _list
          path);
     document_attributes =
       (option_of_yojson
          (value_for_key document_attribute_list_of_yojson
             "DocumentAttributes") _list path);
     document_ur_i =
       (option_of_yojson (value_for_key url_of_yojson "DocumentURI") _list
          path);
     document_excerpt =
       (option_of_yojson
          (value_for_key text_with_highlights_of_yojson "DocumentExcerpt")
          _list path);
     document_title =
       (option_of_yojson
          (value_for_key text_with_highlights_of_yojson "DocumentTitle")
          _list path);
     document_id =
       (option_of_yojson (value_for_key document_id_of_yojson "DocumentId")
          _list path);
     additional_attributes =
       (option_of_yojson
          (value_for_key additional_result_attribute_list_of_yojson
             "AdditionalAttributes") _list path);
     format =
       (option_of_yojson
          (value_for_key query_result_format_of_yojson "Format") _list path);
     type_ =
       (option_of_yojson (value_for_key query_result_type_of_yojson "Type")
          _list path);
     id =
       (option_of_yojson (value_for_key result_id_of_yojson "Id") _list path)
   } : query_result_item)
let query_result_item_list_of_yojson tree path =
  list_of_yojson query_result_item_of_yojson tree path
let rec document_attribute_value_count_pair_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     facet_results =
       (option_of_yojson
          (value_for_key facet_result_list_of_yojson "FacetResults") _list
          path);
     count =
       (option_of_yojson (value_for_key integer__of_yojson "Count") _list
          path);
     document_attribute_value =
       (option_of_yojson
          (value_for_key document_attribute_value_of_yojson
             "DocumentAttributeValue") _list path)
   } : document_attribute_value_count_pair)
and document_attribute_value_count_pair_list_of_yojson tree path =
  list_of_yojson document_attribute_value_count_pair_of_yojson tree path
and facet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_attribute_value_count_pairs =
       (option_of_yojson
          (value_for_key document_attribute_value_count_pair_list_of_yojson
             "DocumentAttributeValueCountPairs") _list path);
     document_attribute_value_type =
       (option_of_yojson
          (value_for_key document_attribute_value_type_of_yojson
             "DocumentAttributeValueType") _list path);
     document_attribute_key =
       (option_of_yojson
          (value_for_key document_attribute_key_of_yojson
             "DocumentAttributeKey") _list path)
   } : facet_result)
and facet_result_list_of_yojson tree path =
  list_of_yojson facet_result_of_yojson tree path
let featured_results_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feedback_token =
       (option_of_yojson
          (value_for_key feedback_token_of_yojson "FeedbackToken") _list path);
     document_attributes =
       (option_of_yojson
          (value_for_key document_attribute_list_of_yojson
             "DocumentAttributes") _list path);
     document_ur_i =
       (option_of_yojson (value_for_key url_of_yojson "DocumentURI") _list
          path);
     document_excerpt =
       (option_of_yojson
          (value_for_key text_with_highlights_of_yojson "DocumentExcerpt")
          _list path);
     document_title =
       (option_of_yojson
          (value_for_key text_with_highlights_of_yojson "DocumentTitle")
          _list path);
     document_id =
       (option_of_yojson (value_for_key document_id_of_yojson "DocumentId")
          _list path);
     additional_attributes =
       (option_of_yojson
          (value_for_key additional_result_attribute_list_of_yojson
             "AdditionalAttributes") _list path);
     type_ =
       (option_of_yojson (value_for_key query_result_type_of_yojson "Type")
          _list path);
     id =
       (option_of_yojson (value_for_key result_id_of_yojson "Id") _list path)
   } : featured_results_item)
let featured_results_item_list_of_yojson tree path =
  list_of_yojson featured_results_item_of_yojson tree path
let query_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     featured_results_items =
       (option_of_yojson
          (value_for_key featured_results_item_list_of_yojson
             "FeaturedResultsItems") _list path);
     spell_corrected_queries =
       (option_of_yojson
          (value_for_key spell_corrected_query_list_of_yojson
             "SpellCorrectedQueries") _list path);
     warnings =
       (option_of_yojson (value_for_key warning_list_of_yojson "Warnings")
          _list path);
     total_number_of_results =
       (option_of_yojson
          (value_for_key integer__of_yojson "TotalNumberOfResults") _list
          path);
     facet_results =
       (option_of_yojson
          (value_for_key facet_result_list_of_yojson "FacetResults") _list
          path);
     result_items =
       (option_of_yojson
          (value_for_key query_result_item_list_of_yojson "ResultItems")
          _list path);
     query_id =
       (option_of_yojson (value_for_key query_id_of_yojson "QueryId") _list
          path)
   } : query_result)
let rec facet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             top_document_attribute_value_count_pairs_size_of_yojson
             "MaxResults") _list path);
     facets =
       (option_of_yojson (value_for_key facet_list_of_yojson "Facets") _list
          path);
     document_attribute_key =
       (option_of_yojson
          (value_for_key document_attribute_key_of_yojson
             "DocumentAttributeKey") _list path)
   } : facet)
and facet_list_of_yojson tree path = list_of_yojson facet_of_yojson tree path
let missing_attribute_key_strategy_of_yojson (tree : t) path =
  (match tree with
   | `String "EXPAND" -> EXPAND
   | `String "COLLAPSE" -> COLLAPSE
   | `String "IGNORE" -> IGNORE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "MissingAttributeKeyStrategy" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "MissingAttributeKeyStrategy") : 
  missing_attribute_key_strategy)
let expand_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_expanded_results_per_item =
       (option_of_yojson
          (value_for_key integer__of_yojson "MaxExpandedResultsPerItem")
          _list path);
     max_result_items_to_expand =
       (option_of_yojson
          (value_for_key integer__of_yojson "MaxResultItemsToExpand") _list
          path)
   } : expand_configuration)
let collapse_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expand_configuration =
       (option_of_yojson
          (value_for_key expand_configuration_of_yojson "ExpandConfiguration")
          _list path);
     expand =
       (option_of_yojson (value_for_key boolean__of_yojson "Expand") _list
          path);
     missing_attribute_key_strategy =
       (option_of_yojson
          (value_for_key missing_attribute_key_strategy_of_yojson
             "MissingAttributeKeyStrategy") _list path);
     sorting_configurations =
       (option_of_yojson
          (value_for_key sorting_configuration_list_of_yojson
             "SortingConfigurations") _list path);
     document_attribute_key =
       (value_for_key document_attribute_key_of_yojson "DocumentAttributeKey"
          _list path)
   } : collapse_configuration)
let query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collapse_configuration =
       (option_of_yojson
          (value_for_key collapse_configuration_of_yojson
             "CollapseConfiguration") _list path);
     spell_correction_configuration =
       (option_of_yojson
          (value_for_key spell_correction_configuration_of_yojson
             "SpellCorrectionConfiguration") _list path);
     visitor_id =
       (option_of_yojson (value_for_key visitor_id_of_yojson "VisitorId")
          _list path);
     user_context =
       (option_of_yojson (value_for_key user_context_of_yojson "UserContext")
          _list path);
     sorting_configurations =
       (option_of_yojson
          (value_for_key sorting_configuration_list_of_yojson
             "SortingConfigurations") _list path);
     sorting_configuration =
       (option_of_yojson
          (value_for_key sorting_configuration_of_yojson
             "SortingConfiguration") _list path);
     page_size =
       (option_of_yojson (value_for_key integer__of_yojson "PageSize") _list
          path);
     page_number =
       (option_of_yojson (value_for_key integer__of_yojson "PageNumber")
          _list path);
     document_relevance_override_configurations =
       (option_of_yojson
          (value_for_key
             document_relevance_override_configuration_list_of_yojson
             "DocumentRelevanceOverrideConfigurations") _list path);
     query_result_type_filter =
       (option_of_yojson
          (value_for_key query_result_type_of_yojson "QueryResultTypeFilter")
          _list path);
     requested_document_attributes =
       (option_of_yojson
          (value_for_key document_attribute_key_list_of_yojson
             "RequestedDocumentAttributes") _list path);
     facets =
       (option_of_yojson (value_for_key facet_list_of_yojson "Facets") _list
          path);
     attribute_filter =
       (option_of_yojson
          (value_for_key attribute_filter_of_yojson "AttributeFilter") _list
          path);
     query_text =
       (option_of_yojson (value_for_key query_text_of_yojson "QueryText")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : query_request)
let group_id_of_yojson = string_of_yojson
let member_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id =
       (option_of_yojson
          (value_for_key data_source_id_of_yojson "DataSourceId") _list path);
     group_id = (value_for_key group_id_of_yojson "GroupId" _list path)
   } : member_group)
let member_groups_of_yojson tree path =
  list_of_yojson member_group_of_yojson tree path
let member_user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_id = (value_for_key user_id_of_yojson "UserId" _list path) } : 
    member_user)
let member_users_of_yojson tree path =
  list_of_yojson member_user_of_yojson tree path
let group_members_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_pathfor_group_members =
       (option_of_yojson
          (value_for_key s3_path_of_yojson "S3PathforGroupMembers") _list
          path);
     member_users =
       (option_of_yojson (value_for_key member_users_of_yojson "MemberUsers")
          _list path);
     member_groups =
       (option_of_yojson
          (value_for_key member_groups_of_yojson "MemberGroups") _list path)
   } : group_members)
let principal_ordering_id_of_yojson = long_of_yojson
let put_principal_mapping_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     ordering_id =
       (option_of_yojson
          (value_for_key principal_ordering_id_of_yojson "OrderingId") _list
          path);
     group_members =
       (value_for_key group_members_of_yojson "GroupMembers" _list path);
     group_id = (value_for_key group_id_of_yojson "GroupId" _list path);
     data_source_id =
       (option_of_yojson
          (value_for_key data_source_id_of_yojson "DataSourceId") _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : put_principal_mapping_request)
let principal_mapping_status_of_yojson (tree : t) path =
  (match tree with
   | `String "DELETED" -> DELETED
   | `String "DELETING" -> DELETING
   | `String "PROCESSING" -> PROCESSING
   | `String "SUCCEEDED" -> SUCCEEDED
   | `String "FAILED" -> FAILED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "PrincipalMappingStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "PrincipalMappingStatus") : 
  principal_mapping_status)
let entity_id_of_yojson = string_of_yojson
let persona_of_yojson (tree : t) path =
  (match tree with
   | `String "VIEWER" -> VIEWER
   | `String "OWNER" -> OWNER
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "Persona" value)
   | _ -> raise (deserialize_wrong_type_error path "Persona") : persona)
let personas_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     persona =
       (option_of_yojson (value_for_key persona_of_yojson "Persona") _list
          path);
     entity_id =
       (option_of_yojson (value_for_key entity_id_of_yojson "EntityId") _list
          path)
   } : personas_summary)
let personas_summary_list_of_yojson tree path =
  list_of_yojson personas_summary_of_yojson tree path
let next_token_of_yojson = string_of_yojson
let name_type_of_yojson = string_of_yojson
let metric_value_of_yojson = string_of_yojson
let metric_type_of_yojson (tree : t) path =
  (match tree with
   | `String "TREND_QUERY_DOC_METRICS" -> TREND_QUERY_DOC_METRICS
   | `String "AGG_QUERY_DOC_METRICS" -> AGG_QUERY_DOC_METRICS
   | `String "DOCS_BY_CLICK_COUNT" -> DOCS_BY_CLICK_COUNT
   | `String "QUERIES_BY_ZERO_RESULT_RATE" -> QUERIES_BY_ZERO_RESULT_RATE
   | `String "QUERIES_BY_ZERO_CLICK_RATE" -> QUERIES_BY_ZERO_CLICK_RATE
   | `String "QUERIES_BY_COUNT" -> QUERIES_BY_COUNT
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "MetricType" value)
   | _ -> raise (deserialize_wrong_type_error path "MetricType") : metric_type)
let max_results_integer_for_list_thesauri_request_of_yojson = int_of_yojson
let max_results_integer_for_list_query_suggestions_block_lists_of_yojson =
  int_of_yojson
let max_results_integer_for_list_principals_request_of_yojson = int_of_yojson
let max_results_integer_for_list_indices_request_of_yojson = int_of_yojson
let max_results_integer_for_list_featured_results_sets_request_of_yojson =
  int_of_yojson
let max_results_integer_for_list_faqs_request_of_yojson = int_of_yojson
let max_results_integer_for_list_experiences_request_of_yojson =
  int_of_yojson
let max_results_integer_for_list_entity_personas_request_of_yojson =
  int_of_yojson
let max_results_integer_for_list_data_sources_request_of_yojson =
  int_of_yojson
let max_results_integer_for_list_data_source_sync_jobs_request_of_yojson =
  int_of_yojson
let max_results_integer_for_list_access_control_configurations_request_of_yojson
  = int_of_yojson
let list_thesauri_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     thesaurus_summary_items =
       (option_of_yojson
          (value_for_key thesaurus_summary_items_of_yojson
             "ThesaurusSummaryItems") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_thesauri_response)
let list_thesauri_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_thesauri_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : list_thesauri_request)
let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path)
   } : list_tags_for_resource_response)
let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : list_tags_for_resource_request)
let list_query_suggestions_block_lists_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     block_list_summary_items =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_summary_items_of_yojson
             "BlockListSummaryItems") _list path)
   } : list_query_suggestions_block_lists_response)
let list_query_suggestions_block_lists_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_query_suggestions_block_lists_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : list_query_suggestions_block_lists_request)
let group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ordering_id =
       (option_of_yojson
          (value_for_key principal_ordering_id_of_yojson "OrderingId") _list
          path);
     group_id =
       (option_of_yojson (value_for_key group_id_of_yojson "GroupId") _list
          path)
   } : group_summary)
let list_of_group_summaries_of_yojson tree path =
  list_of_yojson group_summary_of_yojson tree path
let index_edition_of_yojson (tree : t) path =
  (match tree with
   | `String "ENTERPRISE_EDITION" -> ENTERPRISE_EDITION
   | `String "DEVELOPER_EDITION" -> DEVELOPER_EDITION
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "IndexEdition" value)
   | _ -> raise (deserialize_wrong_type_error path "IndexEdition") : 
  index_edition)
let index_status_of_yojson (tree : t) path =
  (match tree with
   | `String "SYSTEM_UPDATING" -> SYSTEM_UPDATING
   | `String "UPDATING" -> UPDATING
   | `String "FAILED" -> FAILED
   | `String "DELETING" -> DELETING
   | `String "ACTIVE" -> ACTIVE
   | `String "CREATING" -> CREATING
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "IndexStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "IndexStatus") : index_status)
let index_configuration_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = (value_for_key index_status_of_yojson "Status" _list path);
     updated_at = (value_for_key timestamp__of_yojson "UpdatedAt" _list path);
     created_at = (value_for_key timestamp__of_yojson "CreatedAt" _list path);
     edition =
       (option_of_yojson (value_for_key index_edition_of_yojson "Edition")
          _list path);
     id =
       (option_of_yojson (value_for_key index_id_of_yojson "Id") _list path);
     name =
       (option_of_yojson (value_for_key index_name_of_yojson "Name") _list
          path)
   } : index_configuration_summary)
let index_configuration_summary_list_of_yojson tree path =
  list_of_yojson index_configuration_summary_of_yojson tree path
let list_indices_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_configuration_summary_items =
       (option_of_yojson
          (value_for_key index_configuration_summary_list_of_yojson
             "IndexConfigurationSummaryItems") _list path)
   } : list_indices_response)
let list_indices_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_indices_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_indices_request)
let list_groups_older_than_ordering_id_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     groups_summaries =
       (option_of_yojson
          (value_for_key list_of_group_summaries_of_yojson "GroupsSummaries")
          _list path)
   } : list_groups_older_than_ordering_id_response)
let list_groups_older_than_ordering_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_principals_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     ordering_id =
       (value_for_key principal_ordering_id_of_yojson "OrderingId" _list path);
     data_source_id =
       (option_of_yojson
          (value_for_key data_source_id_of_yojson "DataSourceId") _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : list_groups_older_than_ordering_id_request)
let featured_results_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_timestamp =
       (option_of_yojson (value_for_key long_of_yojson "CreationTimestamp")
          _list path);
     last_updated_timestamp =
       (option_of_yojson
          (value_for_key long_of_yojson "LastUpdatedTimestamp") _list path);
     status =
       (option_of_yojson
          (value_for_key featured_results_set_status_of_yojson "Status")
          _list path);
     featured_results_set_name =
       (option_of_yojson
          (value_for_key featured_results_set_name_of_yojson
             "FeaturedResultsSetName") _list path);
     featured_results_set_id =
       (option_of_yojson
          (value_for_key featured_results_set_id_of_yojson
             "FeaturedResultsSetId") _list path)
   } : featured_results_set_summary)
let featured_results_set_summary_items_of_yojson tree path =
  list_of_yojson featured_results_set_summary_of_yojson tree path
let list_featured_results_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     featured_results_set_summary_items =
       (option_of_yojson
          (value_for_key featured_results_set_summary_items_of_yojson
             "FeaturedResultsSetSummaryItems") _list path)
   } : list_featured_results_sets_response)
let list_featured_results_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_featured_results_sets_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : list_featured_results_sets_request)
let faq_name_of_yojson = string_of_yojson
let faq_status_of_yojson (tree : t) path =
  (match tree with
   | `String "FAILED" -> FAILED
   | `String "DELETING" -> DELETING
   | `String "ACTIVE" -> ACTIVE
   | `String "UPDATING" -> UPDATING
   | `String "CREATING" -> CREATING
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "FaqStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "FaqStatus") : faq_status)
let faq_file_format_of_yojson (tree : t) path =
  (match tree with
   | `String "JSON" -> JSON
   | `String "CSV_WITH_HEADER" -> CSV_WITH_HEADER
   | `String "CSV" -> CSV
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "FaqFileFormat" value)
   | _ -> raise (deserialize_wrong_type_error path "FaqFileFormat") : 
  faq_file_format)
let faq_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code =
       (option_of_yojson
          (value_for_key language_code_of_yojson "LanguageCode") _list path);
     file_format =
       (option_of_yojson
          (value_for_key faq_file_format_of_yojson "FileFormat") _list path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     status =
       (option_of_yojson (value_for_key faq_status_of_yojson "Status") _list
          path);
     name =
       (option_of_yojson (value_for_key faq_name_of_yojson "Name") _list path);
     id = (option_of_yojson (value_for_key faq_id_of_yojson "Id") _list path)
   } : faq_summary)
let faq_summary_items_of_yojson tree path =
  list_of_yojson faq_summary_of_yojson tree path
let list_faqs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     faq_summary_items =
       (option_of_yojson
          (value_for_key faq_summary_items_of_yojson "FaqSummaryItems") _list
          path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_faqs_response)
let list_faqs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key max_results_integer_for_list_faqs_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : list_faqs_request)
let experience_status_of_yojson (tree : t) path =
  (match tree with
   | `String "FAILED" -> FAILED
   | `String "DELETING" -> DELETING
   | `String "ACTIVE" -> ACTIVE
   | `String "CREATING" -> CREATING
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ExperienceStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "ExperienceStatus") : 
  experience_status)
let endpoint_type_of_yojson (tree : t) path =
  (match tree with
   | `String "HOME" -> HOME
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "EndpointType" value)
   | _ -> raise (deserialize_wrong_type_error path "EndpointType") : 
  endpoint_type)
let endpoint_of_yojson = string_of_yojson
let experience_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint =
       (option_of_yojson (value_for_key endpoint_of_yojson "Endpoint") _list
          path);
     endpoint_type =
       (option_of_yojson
          (value_for_key endpoint_type_of_yojson "EndpointType") _list path)
   } : experience_endpoint)
let experience_endpoints_of_yojson tree path =
  list_of_yojson experience_endpoint_of_yojson tree path
let experiences_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoints =
       (option_of_yojson
          (value_for_key experience_endpoints_of_yojson "Endpoints") _list
          path);
     status =
       (option_of_yojson (value_for_key experience_status_of_yojson "Status")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     id =
       (option_of_yojson (value_for_key experience_id_of_yojson "Id") _list
          path);
     name =
       (option_of_yojson (value_for_key experience_name_of_yojson "Name")
          _list path)
   } : experiences_summary)
let experiences_summary_list_of_yojson tree path =
  list_of_yojson experiences_summary_of_yojson tree path
let list_experiences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     summary_items =
       (option_of_yojson
          (value_for_key experiences_summary_list_of_yojson "SummaryItems")
          _list path)
   } : list_experiences_response)
let list_experiences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_experiences_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : list_experiences_request)
let entity_type_of_yojson (tree : t) path =
  (match tree with
   | `String "GROUP" -> GROUP
   | `String "USER" -> USER
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "EntityType" value)
   | _ -> raise (deserialize_wrong_type_error path "EntityType") : entity_type)
let entity_display_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_name =
       (option_of_yojson (value_for_key name_type_of_yojson "LastName") _list
          path);
     first_name =
       (option_of_yojson (value_for_key name_type_of_yojson "FirstName")
          _list path);
     identified_user_name =
       (option_of_yojson
          (value_for_key name_type_of_yojson "IdentifiedUserName") _list path);
     group_name =
       (option_of_yojson (value_for_key name_type_of_yojson "GroupName")
          _list path);
     user_name =
       (option_of_yojson (value_for_key name_type_of_yojson "UserName") _list
          path)
   } : entity_display_data)
let experience_entities_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_data =
       (option_of_yojson
          (value_for_key entity_display_data_of_yojson "DisplayData") _list
          path);
     entity_type =
       (option_of_yojson (value_for_key entity_type_of_yojson "EntityType")
          _list path);
     entity_id =
       (option_of_yojson (value_for_key entity_id_of_yojson "EntityId") _list
          path)
   } : experience_entities_summary)
let experience_entities_summary_list_of_yojson tree path =
  list_of_yojson experience_entities_summary_of_yojson tree path
let list_experience_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     summary_items =
       (option_of_yojson
          (value_for_key experience_entities_summary_list_of_yojson
             "SummaryItems") _list path)
   } : list_experience_entities_response)
let list_experience_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : list_experience_entities_request)
let list_entity_personas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     summary_items =
       (option_of_yojson
          (value_for_key personas_summary_list_of_yojson "SummaryItems")
          _list path)
   } : list_entity_personas_response)
let list_entity_personas_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_entity_personas_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : list_entity_personas_request)
let data_source_type_of_yojson (tree : t) path =
  (match tree with
   | `String "TEMPLATE" -> TEMPLATE
   | `String "ALFRESCO" -> ALFRESCO
   | `String "GITHUB" -> GITHUB
   | `String "JIRA" -> JIRA
   | `String "QUIP" -> QUIP
   | `String "BOX" -> BOX
   | `String "SLACK" -> SLACK
   | `String "FSX" -> FSX
   | `String "WORKDOCS" -> WORKDOCS
   | `String "WEBCRAWLER" -> WEBCRAWLER
   | `String "GOOGLEDRIVE" -> GOOGLEDRIVE
   | `String "CONFLUENCE" -> CONFLUENCE
   | `String "CUSTOM" -> CUSTOM
   | `String "SERVICENOW" -> SERVICENOW
   | `String "ONEDRIVE" -> ONEDRIVE
   | `String "SALESFORCE" -> SALESFORCE
   | `String "DATABASE" -> DATABASE
   | `String "SHAREPOINT" -> SHAREPOINT
   | `String "S3" -> S3
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "DataSourceType" value)
   | _ -> raise (deserialize_wrong_type_error path "DataSourceType") : 
  data_source_type)
let data_source_status_of_yojson (tree : t) path =
  (match tree with
   | `String "ACTIVE" -> ACTIVE
   | `String "UPDATING" -> UPDATING
   | `String "FAILED" -> FAILED
   | `String "DELETING" -> DELETING
   | `String "CREATING" -> CREATING
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "DataSourceStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "DataSourceStatus") : 
  data_source_status)
let data_source_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code =
       (option_of_yojson
          (value_for_key language_code_of_yojson "LanguageCode") _list path);
     status =
       (option_of_yojson
          (value_for_key data_source_status_of_yojson "Status") _list path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     type_ =
       (option_of_yojson (value_for_key data_source_type_of_yojson "Type")
          _list path);
     id =
       (option_of_yojson (value_for_key data_source_id_of_yojson "Id") _list
          path);
     name =
       (option_of_yojson (value_for_key data_source_name_of_yojson "Name")
          _list path)
   } : data_source_summary)
let data_source_summary_list_of_yojson tree path =
  list_of_yojson data_source_summary_of_yojson tree path
let list_data_sources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     summary_items =
       (option_of_yojson
          (value_for_key data_source_summary_list_of_yojson "SummaryItems")
          _list path)
   } : list_data_sources_response)
let list_data_sources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_data_sources_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : list_data_sources_request)
let data_source_sync_job_status_of_yojson (tree : t) path =
  (match tree with
   | `String "SYNCING_INDEXING" -> SYNCING_INDEXING
   | `String "ABORTED" -> ABORTED
   | `String "STOPPING" -> STOPPING
   | `String "INCOMPLETE" -> INCOMPLETE
   | `String "SYNCING" -> SYNCING
   | `String "SUCCEEDED" -> SUCCEEDED
   | `String "FAILED" -> FAILED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "DataSourceSyncJobStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "DataSourceSyncJobStatus") : 
  data_source_sync_job_status)
let error_code_of_yojson (tree : t) path =
  (match tree with
   | `String "INVALID_REQUEST" -> INVALID_REQUEST
   | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "ErrorCode" value)
   | _ -> raise (deserialize_wrong_type_error path "ErrorCode") : error_code)
let data_source_sync_job_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     documents_scanned =
       (option_of_yojson
          (value_for_key metric_value_of_yojson "DocumentsScanned") _list
          path);
     documents_failed =
       (option_of_yojson
          (value_for_key metric_value_of_yojson "DocumentsFailed") _list path);
     documents_deleted =
       (option_of_yojson
          (value_for_key metric_value_of_yojson "DocumentsDeleted") _list
          path);
     documents_modified =
       (option_of_yojson
          (value_for_key metric_value_of_yojson "DocumentsModified") _list
          path);
     documents_added =
       (option_of_yojson
          (value_for_key metric_value_of_yojson "DocumentsAdded") _list path)
   } : data_source_sync_job_metrics)
let data_source_sync_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metrics =
       (option_of_yojson
          (value_for_key data_source_sync_job_metrics_of_yojson "Metrics")
          _list path);
     data_source_error_code =
       (option_of_yojson
          (value_for_key string__of_yojson "DataSourceErrorCode") _list path);
     error_code =
       (option_of_yojson (value_for_key error_code_of_yojson "ErrorCode")
          _list path);
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     status =
       (option_of_yojson
          (value_for_key data_source_sync_job_status_of_yojson "Status")
          _list path);
     end_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "EndTime") _list
          path);
     start_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "StartTime")
          _list path);
     execution_id =
       (option_of_yojson (value_for_key string__of_yojson "ExecutionId")
          _list path)
   } : data_source_sync_job)
let data_source_sync_job_history_list_of_yojson tree path =
  list_of_yojson data_source_sync_job_of_yojson tree path
let list_data_source_sync_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     history =
       (option_of_yojson
          (value_for_key data_source_sync_job_history_list_of_yojson
             "History") _list path)
   } : list_data_source_sync_jobs_response)
let list_data_source_sync_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_filter =
       (option_of_yojson
          (value_for_key data_source_sync_job_status_of_yojson "StatusFilter")
          _list path);
     start_time_filter =
       (option_of_yojson
          (value_for_key time_range_of_yojson "StartTimeFilter") _list path);
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_data_source_sync_jobs_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key data_source_id_of_yojson "Id" _list path)
   } : list_data_source_sync_jobs_request)
let access_control_configuration_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (value_for_key access_control_configuration_id_of_yojson "Id" _list
          path)
   } : access_control_configuration_summary)
let access_control_configuration_summary_list_of_yojson tree path =
  list_of_yojson access_control_configuration_summary_of_yojson tree path
let list_access_control_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_control_configurations =
       (value_for_key access_control_configuration_summary_list_of_yojson
          "AccessControlConfigurations" _list path);
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path)
   } : list_access_control_configurations_response)
let list_access_control_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             max_results_integer_for_list_access_control_configurations_request_of_yojson
             "MaxResults") _list path);
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : list_access_control_configurations_request)
let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : invalid_request_exception)
let interval_of_yojson (tree : t) path =
  (match tree with
   | `String "TWO_MONTHS_AGO" -> TWO_MONTHS_AGO
   | `String "ONE_MONTH_AGO" -> ONE_MONTH_AGO
   | `String "TWO_WEEKS_AGO" -> TWO_WEEKS_AGO
   | `String "ONE_WEEK_AGO" -> ONE_WEEK_AGO
   | `String "THIS_WEEK" -> THIS_WEEK
   | `String "THIS_MONTH" -> THIS_MONTH
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "Interval" value)
   | _ -> raise (deserialize_wrong_type_error path "Interval") : interval)
let indexed_question_answers_count_of_yojson = int_of_yojson
let faq_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     indexed_question_answers_count =
       (value_for_key indexed_question_answers_count_of_yojson
          "IndexedQuestionAnswersCount" _list path)
   } : faq_statistics)
let index_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_document_statistics =
       (value_for_key text_document_statistics_of_yojson
          "TextDocumentStatistics" _list path);
     faq_statistics =
       (value_for_key faq_statistics_of_yojson "FaqStatistics" _list path)
   } : index_statistics)
let failure_reason_of_yojson = string_of_yojson
let group_ordering_id_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       (option_of_yojson
          (value_for_key failure_reason_of_yojson "FailureReason") _list path);
     ordering_id =
       (option_of_yojson
          (value_for_key principal_ordering_id_of_yojson "OrderingId") _list
          path);
     received_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "ReceivedAt")
          _list path);
     last_updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "LastUpdatedAt")
          _list path);
     status =
       (option_of_yojson
          (value_for_key principal_mapping_status_of_yojson "Status") _list
          path)
   } : group_ordering_id_summary)
let group_ordering_id_summaries_of_yojson tree path =
  list_of_yojson group_ordering_id_summary_of_yojson tree path
let get_snapshots_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     snapshots_data =
       (option_of_yojson
          (value_for_key snapshots_data_records_of_yojson "SnapshotsData")
          _list path);
     snapshots_data_header =
       (option_of_yojson
          (value_for_key snapshots_data_header_fields_of_yojson
             "SnapshotsDataHeader") _list path);
     snap_shot_time_filter =
       (option_of_yojson
          (value_for_key time_range_of_yojson "SnapShotTimeFilter") _list
          path)
   } : get_snapshots_response)
let get_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key integer__of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     metric_type =
       (value_for_key metric_type_of_yojson "MetricType" _list path);
     interval = (value_for_key interval_of_yojson "Interval" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : get_snapshots_request)
let get_query_suggestions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     suggestions =
       (option_of_yojson
          (value_for_key suggestion_list_of_yojson "Suggestions") _list path);
     query_suggestions_id =
       (option_of_yojson
          (value_for_key query_suggestions_id_of_yojson "QuerySuggestionsId")
          _list path)
   } : get_query_suggestions_response)
let attribute_suggestions_get_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_context =
       (option_of_yojson (value_for_key user_context_of_yojson "UserContext")
          _list path);
     attribute_filter =
       (option_of_yojson
          (value_for_key attribute_filter_of_yojson "AttributeFilter") _list
          path);
     additional_response_attributes =
       (option_of_yojson
          (value_for_key document_attribute_key_list_of_yojson
             "AdditionalResponseAttributes") _list path);
     suggestion_attributes =
       (option_of_yojson
          (value_for_key document_attribute_key_list_of_yojson
             "SuggestionAttributes") _list path)
   } : attribute_suggestions_get_config)
let get_query_suggestions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_suggestions_config =
       (option_of_yojson
          (value_for_key attribute_suggestions_get_config_of_yojson
             "AttributeSuggestionsConfig") _list path);
     suggestion_types =
       (option_of_yojson
          (value_for_key suggestion_types_of_yojson "SuggestionTypes") _list
          path);
     max_suggestions_count =
       (option_of_yojson
          (value_for_key integer__of_yojson "MaxSuggestionsCount") _list path);
     query_text =
       (value_for_key suggestion_query_text_of_yojson "QueryText" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : get_query_suggestions_request)
let featured_results_set_id_list_of_yojson tree path =
  list_of_yojson featured_results_set_id_of_yojson tree path
let featured_document_with_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ur_i = (option_of_yojson (value_for_key url_of_yojson "URI") _list path);
     title =
       (option_of_yojson (value_for_key string__of_yojson "Title") _list path);
     id =
       (option_of_yojson (value_for_key document_id_of_yojson "Id") _list
          path)
   } : featured_document_with_metadata)
let featured_document_with_metadata_list_of_yojson tree path =
  list_of_yojson featured_document_with_metadata_of_yojson tree path
let featured_document_missing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (option_of_yojson (value_for_key document_id_of_yojson "Id") _list
          path)
   } : featured_document_missing)
let featured_document_missing_list_of_yojson tree path =
  list_of_yojson featured_document_missing_of_yojson tree path
let failed_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     entity_id =
       (option_of_yojson (value_for_key entity_id_of_yojson "EntityId") _list
          path)
   } : failed_entity)
let failed_entity_list_of_yojson tree path =
  list_of_yojson failed_entity_of_yojson tree path
let entity_persona_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     persona = (value_for_key persona_of_yojson "Persona" _list path);
     entity_id = (value_for_key entity_id_of_yojson "EntityId" _list path)
   } : entity_persona_configuration)
let entity_persona_configuration_list_of_yojson tree path =
  list_of_yojson entity_persona_configuration_of_yojson tree path
let entity_ids_list_of_yojson tree path =
  list_of_yojson entity_id_of_yojson tree path
let entity_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_type =
       (value_for_key entity_type_of_yojson "EntityType" _list path);
     entity_id = (value_for_key entity_id_of_yojson "EntityId" _list path)
   } : entity_configuration)
let document_status_list_of_yojson tree path =
  list_of_yojson status_of_yojson tree path
let blob_of_yojson = blob_of_yojson
let content_type_of_yojson (tree : t) path =
  (match tree with
   | `String "MD" -> MD
   | `String "JSON" -> JSON
   | `String "CSV" -> CSV
   | `String "MS_EXCEL" -> MS_EXCEL
   | `String "XSLT" -> XSLT
   | `String "XML" -> XML
   | `String "RTF" -> RTF
   | `String "PPT" -> PPT
   | `String "PLAIN_TEXT" -> PLAIN_TEXT
   | `String "MS_WORD" -> MS_WORD
   | `String "HTML" -> HTML
   | `String "PDF" -> PDF
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "ContentType" value)
   | _ -> raise (deserialize_wrong_type_error path "ContentType") : content_type)
let document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_control_configuration_id =
       (option_of_yojson
          (value_for_key access_control_configuration_id_of_yojson
             "AccessControlConfigurationId") _list path);
     content_type =
       (option_of_yojson (value_for_key content_type_of_yojson "ContentType")
          _list path);
     hierarchical_access_control_list =
       (option_of_yojson
          (value_for_key hierarchical_principal_list_of_yojson
             "HierarchicalAccessControlList") _list path);
     access_control_list =
       (option_of_yojson
          (value_for_key principal_list_of_yojson "AccessControlList") _list
          path);
     attributes =
       (option_of_yojson
          (value_for_key document_attribute_list_of_yojson "Attributes")
          _list path);
     s3_path =
       (option_of_yojson (value_for_key s3_path_of_yojson "S3Path") _list
          path);
     blob =
       (option_of_yojson (value_for_key blob_of_yojson "Blob") _list path);
     title =
       (option_of_yojson (value_for_key title_of_yojson "Title") _list path);
     id = (value_for_key document_id_of_yojson "Id" _list path)
   } : document)
let document_list_of_yojson tree path =
  list_of_yojson document_of_yojson tree path
let document_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (option_of_yojson
          (value_for_key document_attribute_list_of_yojson "Attributes")
          _list path);
     document_id =
       (value_for_key document_id_of_yojson "DocumentId" _list path)
   } : document_info)
let document_info_list_of_yojson tree path =
  list_of_yojson document_info_of_yojson tree path
let document_id_list_of_yojson tree path =
  list_of_yojson document_id_of_yojson tree path
let disassociate_personas_from_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_entity_list =
       (option_of_yojson
          (value_for_key failed_entity_list_of_yojson "FailedEntityList")
          _list path)
   } : disassociate_personas_from_entities_response)
let disassociate_personas_from_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_ids =
       (value_for_key entity_ids_list_of_yojson "EntityIds" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : disassociate_personas_from_entities_request)
let disassociate_entity_list_of_yojson tree path =
  list_of_yojson entity_configuration_of_yojson tree path
let disassociate_entities_from_experience_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_entity_list =
       (option_of_yojson
          (value_for_key failed_entity_list_of_yojson "FailedEntityList")
          _list path)
   } : disassociate_entities_from_experience_response)
let disassociate_entities_from_experience_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_list =
       (value_for_key disassociate_entity_list_of_yojson "EntityList" _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : disassociate_entities_from_experience_request)
let describe_thesaurus_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     synonym_rule_count =
       (option_of_yojson (value_for_key long_of_yojson "SynonymRuleCount")
          _list path);
     term_count =
       (option_of_yojson (value_for_key long_of_yojson "TermCount") _list
          path);
     file_size_bytes =
       (option_of_yojson (value_for_key long_of_yojson "FileSizeBytes") _list
          path);
     source_s3_path =
       (option_of_yojson (value_for_key s3_path_of_yojson "SourceS3Path")
          _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     status =
       (option_of_yojson (value_for_key thesaurus_status_of_yojson "Status")
          _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name =
       (option_of_yojson (value_for_key thesaurus_name_of_yojson "Name")
          _list path);
     index_id =
       (option_of_yojson (value_for_key index_id_of_yojson "IndexId") _list
          path);
     id =
       (option_of_yojson (value_for_key thesaurus_id_of_yojson "Id") _list
          path)
   } : describe_thesaurus_response)
let describe_thesaurus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key thesaurus_id_of_yojson "Id" _list path)
   } : describe_thesaurus_request)
let attribute_suggestions_describe_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_suggestions_mode =
       (option_of_yojson
          (value_for_key attribute_suggestions_mode_of_yojson
             "AttributeSuggestionsMode") _list path);
     suggestable_config_list =
       (option_of_yojson
          (value_for_key suggestable_config_list_of_yojson
             "SuggestableConfigList") _list path)
   } : attribute_suggestions_describe_config)
let describe_query_suggestions_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_suggestions_config =
       (option_of_yojson
          (value_for_key attribute_suggestions_describe_config_of_yojson
             "AttributeSuggestionsConfig") _list path);
     total_suggestions_count =
       (option_of_yojson
          (value_for_key integer__of_yojson "TotalSuggestionsCount") _list
          path);
     last_clear_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "LastClearTime")
          _list path);
     last_suggestions_build_time =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "LastSuggestionsBuildTime")
          _list path);
     minimum_query_count =
       (option_of_yojson
          (value_for_key minimum_query_count_of_yojson "MinimumQueryCount")
          _list path);
     minimum_number_of_querying_users =
       (option_of_yojson
          (value_for_key minimum_number_of_querying_users_of_yojson
             "MinimumNumberOfQueryingUsers") _list path);
     include_queries_without_user_information =
       (option_of_yojson
          (value_for_key object_boolean_of_yojson
             "IncludeQueriesWithoutUserInformation") _list path);
     query_log_look_back_window_in_days =
       (option_of_yojson
          (value_for_key integer__of_yojson "QueryLogLookBackWindowInDays")
          _list path);
     status =
       (option_of_yojson
          (value_for_key query_suggestions_status_of_yojson "Status") _list
          path);
     mode =
       (option_of_yojson (value_for_key mode_of_yojson "Mode") _list path)
   } : describe_query_suggestions_config_response)
let describe_query_suggestions_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ index_id = (value_for_key index_id_of_yojson "IndexId" _list path) } : 
    describe_query_suggestions_config_request)
let describe_query_suggestions_block_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     file_size_bytes =
       (option_of_yojson (value_for_key long_of_yojson "FileSizeBytes") _list
          path);
     item_count =
       (option_of_yojson (value_for_key integer__of_yojson "ItemCount") _list
          path);
     source_s3_path =
       (option_of_yojson (value_for_key s3_path_of_yojson "SourceS3Path")
          _list path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     status =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_status_of_yojson
             "Status") _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_name_of_yojson "Name")
          _list path);
     id =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_id_of_yojson "Id")
          _list path);
     index_id =
       (option_of_yojson (value_for_key index_id_of_yojson "IndexId") _list
          path)
   } : describe_query_suggestions_block_list_response)
let describe_query_suggestions_block_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (value_for_key query_suggestions_block_list_id_of_yojson "Id" _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : describe_query_suggestions_block_list_request)
let describe_principal_mapping_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_ordering_id_summaries =
       (option_of_yojson
          (value_for_key group_ordering_id_summaries_of_yojson
             "GroupOrderingIdSummaries") _list path);
     group_id =
       (option_of_yojson (value_for_key group_id_of_yojson "GroupId") _list
          path);
     data_source_id =
       (option_of_yojson
          (value_for_key data_source_id_of_yojson "DataSourceId") _list path);
     index_id =
       (option_of_yojson (value_for_key index_id_of_yojson "IndexId") _list
          path)
   } : describe_principal_mapping_response)
let describe_principal_mapping_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id = (value_for_key group_id_of_yojson "GroupId" _list path);
     data_source_id =
       (option_of_yojson
          (value_for_key data_source_id_of_yojson "DataSourceId") _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : describe_principal_mapping_request)
let describe_index_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_group_resolution_configuration =
       (option_of_yojson
          (value_for_key user_group_resolution_configuration_of_yojson
             "UserGroupResolutionConfiguration") _list path);
     user_context_policy =
       (option_of_yojson
          (value_for_key user_context_policy_of_yojson "UserContextPolicy")
          _list path);
     user_token_configurations =
       (option_of_yojson
          (value_for_key user_token_configuration_list_of_yojson
             "UserTokenConfigurations") _list path);
     capacity_units =
       (option_of_yojson
          (value_for_key capacity_units_configuration_of_yojson
             "CapacityUnits") _list path);
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     index_statistics =
       (option_of_yojson
          (value_for_key index_statistics_of_yojson "IndexStatistics") _list
          path);
     document_metadata_configurations =
       (option_of_yojson
          (value_for_key document_metadata_configuration_list_of_yojson
             "DocumentMetadataConfigurations") _list path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     status =
       (option_of_yojson (value_for_key index_status_of_yojson "Status")
          _list path);
     server_side_encryption_configuration =
       (option_of_yojson
          (value_for_key server_side_encryption_configuration_of_yojson
             "ServerSideEncryptionConfiguration") _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     edition =
       (option_of_yojson (value_for_key index_edition_of_yojson "Edition")
          _list path);
     id =
       (option_of_yojson (value_for_key index_id_of_yojson "Id") _list path);
     name =
       (option_of_yojson (value_for_key index_name_of_yojson "Name") _list
          path)
   } : describe_index_response)
let describe_index_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key index_id_of_yojson "Id" _list path) } : describe_index_request)
let describe_featured_results_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_timestamp =
       (option_of_yojson (value_for_key long_of_yojson "CreationTimestamp")
          _list path);
     last_updated_timestamp =
       (option_of_yojson
          (value_for_key long_of_yojson "LastUpdatedTimestamp") _list path);
     featured_documents_missing =
       (option_of_yojson
          (value_for_key featured_document_missing_list_of_yojson
             "FeaturedDocumentsMissing") _list path);
     featured_documents_with_metadata =
       (option_of_yojson
          (value_for_key featured_document_with_metadata_list_of_yojson
             "FeaturedDocumentsWithMetadata") _list path);
     query_texts =
       (option_of_yojson
          (value_for_key query_text_list_of_yojson "QueryTexts") _list path);
     status =
       (option_of_yojson
          (value_for_key featured_results_set_status_of_yojson "Status")
          _list path);
     description =
       (option_of_yojson
          (value_for_key featured_results_set_description_of_yojson
             "Description") _list path);
     featured_results_set_name =
       (option_of_yojson
          (value_for_key featured_results_set_name_of_yojson
             "FeaturedResultsSetName") _list path);
     featured_results_set_id =
       (option_of_yojson
          (value_for_key featured_results_set_id_of_yojson
             "FeaturedResultsSetId") _list path)
   } : describe_featured_results_set_response)
let describe_featured_results_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     featured_results_set_id =
       (value_for_key featured_results_set_id_of_yojson
          "FeaturedResultsSetId" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : describe_featured_results_set_request)
let describe_faq_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code =
       (option_of_yojson
          (value_for_key language_code_of_yojson "LanguageCode") _list path);
     file_format =
       (option_of_yojson
          (value_for_key faq_file_format_of_yojson "FileFormat") _list path);
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     status =
       (option_of_yojson (value_for_key faq_status_of_yojson "Status") _list
          path);
     s3_path =
       (option_of_yojson (value_for_key s3_path_of_yojson "S3Path") _list
          path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name =
       (option_of_yojson (value_for_key faq_name_of_yojson "Name") _list path);
     index_id =
       (option_of_yojson (value_for_key index_id_of_yojson "IndexId") _list
          path);
     id = (option_of_yojson (value_for_key faq_id_of_yojson "Id") _list path)
   } : describe_faq_response)
let describe_faq_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key faq_id_of_yojson "Id" _list path)
   } : describe_faq_request)
let describe_experience_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     status =
       (option_of_yojson (value_for_key experience_status_of_yojson "Status")
          _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     configuration =
       (option_of_yojson
          (value_for_key experience_configuration_of_yojson "Configuration")
          _list path);
     endpoints =
       (option_of_yojson
          (value_for_key experience_endpoints_of_yojson "Endpoints") _list
          path);
     name =
       (option_of_yojson (value_for_key experience_name_of_yojson "Name")
          _list path);
     index_id =
       (option_of_yojson (value_for_key index_id_of_yojson "IndexId") _list
          path);
     id =
       (option_of_yojson (value_for_key experience_id_of_yojson "Id") _list
          path)
   } : describe_experience_response)
let describe_experience_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : describe_experience_request)
let describe_data_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_document_enrichment_configuration =
       (option_of_yojson
          (value_for_key custom_document_enrichment_configuration_of_yojson
             "CustomDocumentEnrichmentConfiguration") _list path);
     language_code =
       (option_of_yojson
          (value_for_key language_code_of_yojson "LanguageCode") _list path);
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     schedule =
       (option_of_yojson (value_for_key scan_schedule_of_yojson "Schedule")
          _list path);
     status =
       (option_of_yojson
          (value_for_key data_source_status_of_yojson "Status") _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     updated_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdatedAt")
          _list path);
     created_at =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreatedAt")
          _list path);
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     configuration =
       (option_of_yojson
          (value_for_key data_source_configuration_of_yojson "Configuration")
          _list path);
     type_ =
       (option_of_yojson (value_for_key data_source_type_of_yojson "Type")
          _list path);
     name =
       (option_of_yojson (value_for_key data_source_name_of_yojson "Name")
          _list path);
     index_id =
       (option_of_yojson (value_for_key index_id_of_yojson "IndexId") _list
          path);
     id =
       (option_of_yojson (value_for_key data_source_id_of_yojson "Id") _list
          path)
   } : describe_data_source_response)
let describe_data_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key data_source_id_of_yojson "Id" _list path)
   } : describe_data_source_request)
let describe_access_control_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hierarchical_access_control_list =
       (option_of_yojson
          (value_for_key hierarchical_principal_list_of_yojson
             "HierarchicalAccessControlList") _list path);
     access_control_list =
       (option_of_yojson
          (value_for_key principal_list_of_yojson "AccessControlList") _list
          path);
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name =
       (value_for_key access_control_configuration_name_of_yojson "Name"
          _list path)
   } : describe_access_control_configuration_response)
let describe_access_control_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (value_for_key access_control_configuration_id_of_yojson "Id" _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : describe_access_control_configuration_request)
let delete_thesaurus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key thesaurus_id_of_yojson "Id" _list path)
   } : delete_thesaurus_request)
let delete_query_suggestions_block_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (value_for_key query_suggestions_block_list_id_of_yojson "Id" _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : delete_query_suggestions_block_list_request)
let delete_principal_mapping_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ordering_id =
       (option_of_yojson
          (value_for_key principal_ordering_id_of_yojson "OrderingId") _list
          path);
     group_id = (value_for_key group_id_of_yojson "GroupId" _list path);
     data_source_id =
       (option_of_yojson
          (value_for_key data_source_id_of_yojson "DataSourceId") _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : delete_principal_mapping_request)
let delete_index_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key index_id_of_yojson "Id" _list path) } : delete_index_request)
let delete_faq_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key faq_id_of_yojson "Id" _list path)
   } : delete_faq_request)
let delete_experience_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_experience_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : delete_experience_request)
let delete_data_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key data_source_id_of_yojson "Id" _list path)
   } : delete_data_source_request)
let delete_access_control_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_access_control_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (value_for_key access_control_configuration_id_of_yojson "Id" _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : delete_access_control_configuration_request)
let data_source_sync_job_id_of_yojson = string_of_yojson
let data_source_sync_job_metric_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_sync_job_id =
       (option_of_yojson
          (value_for_key data_source_sync_job_id_of_yojson
             "DataSourceSyncJobId") _list path);
     data_source_id =
       (value_for_key data_source_id_of_yojson "DataSourceId" _list path)
   } : data_source_sync_job_metric_target)
let create_thesaurus_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (option_of_yojson (value_for_key thesaurus_id_of_yojson "Id") _list
          path)
   } : create_thesaurus_response)
let client_token_name_of_yojson = string_of_yojson
let create_thesaurus_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       (option_of_yojson
          (value_for_key client_token_name_of_yojson "ClientToken") _list
          path);
     source_s3_path =
       (value_for_key s3_path_of_yojson "SourceS3Path" _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     role_arn = (value_for_key role_arn_of_yojson "RoleArn" _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name = (value_for_key thesaurus_name_of_yojson "Name" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : create_thesaurus_request)
let create_query_suggestions_block_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (option_of_yojson
          (value_for_key query_suggestions_block_list_id_of_yojson "Id")
          _list path)
   } : create_query_suggestions_block_list_response)
let create_query_suggestions_block_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     role_arn = (value_for_key role_arn_of_yojson "RoleArn" _list path);
     client_token =
       (option_of_yojson
          (value_for_key client_token_name_of_yojson "ClientToken") _list
          path);
     source_s3_path =
       (value_for_key s3_path_of_yojson "SourceS3Path" _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name =
       (value_for_key query_suggestions_block_list_name_of_yojson "Name"
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : create_query_suggestions_block_list_request)
let create_index_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (option_of_yojson (value_for_key index_id_of_yojson "Id") _list path)
   } : create_index_response)
let create_index_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_group_resolution_configuration =
       (option_of_yojson
          (value_for_key user_group_resolution_configuration_of_yojson
             "UserGroupResolutionConfiguration") _list path);
     user_context_policy =
       (option_of_yojson
          (value_for_key user_context_policy_of_yojson "UserContextPolicy")
          _list path);
     user_token_configurations =
       (option_of_yojson
          (value_for_key user_token_configuration_list_of_yojson
             "UserTokenConfigurations") _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     client_token =
       (option_of_yojson
          (value_for_key client_token_name_of_yojson "ClientToken") _list
          path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     server_side_encryption_configuration =
       (option_of_yojson
          (value_for_key server_side_encryption_configuration_of_yojson
             "ServerSideEncryptionConfiguration") _list path);
     role_arn = (value_for_key role_arn_of_yojson "RoleArn" _list path);
     edition =
       (option_of_yojson (value_for_key index_edition_of_yojson "Edition")
          _list path);
     name = (value_for_key index_name_of_yojson "Name" _list path)
   } : create_index_request)
let create_featured_results_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     featured_results_set =
       (option_of_yojson
          (value_for_key featured_results_set_of_yojson "FeaturedResultsSet")
          _list path)
   } : create_featured_results_set_response)
let create_featured_results_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     featured_documents =
       (option_of_yojson
          (value_for_key featured_document_list_of_yojson "FeaturedDocuments")
          _list path);
     query_texts =
       (option_of_yojson
          (value_for_key query_text_list_of_yojson "QueryTexts") _list path);
     status =
       (option_of_yojson
          (value_for_key featured_results_set_status_of_yojson "Status")
          _list path);
     client_token =
       (option_of_yojson
          (value_for_key client_token_name_of_yojson "ClientToken") _list
          path);
     description =
       (option_of_yojson
          (value_for_key featured_results_set_description_of_yojson
             "Description") _list path);
     featured_results_set_name =
       (value_for_key featured_results_set_name_of_yojson
          "FeaturedResultsSetName" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : create_featured_results_set_request)
let create_faq_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (option_of_yojson (value_for_key faq_id_of_yojson "Id") _list path)
   } : create_faq_response)
let create_faq_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code =
       (option_of_yojson
          (value_for_key language_code_of_yojson "LanguageCode") _list path);
     client_token =
       (option_of_yojson
          (value_for_key client_token_name_of_yojson "ClientToken") _list
          path);
     file_format =
       (option_of_yojson
          (value_for_key faq_file_format_of_yojson "FileFormat") _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     role_arn = (value_for_key role_arn_of_yojson "RoleArn" _list path);
     s3_path = (value_for_key s3_path_of_yojson "S3Path" _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name = (value_for_key faq_name_of_yojson "Name" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : create_faq_request)
let create_experience_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key experience_id_of_yojson "Id" _list path) } : 
    create_experience_response)
let create_experience_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       (option_of_yojson
          (value_for_key client_token_name_of_yojson "ClientToken") _list
          path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     configuration =
       (option_of_yojson
          (value_for_key experience_configuration_of_yojson "Configuration")
          _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     name = (value_for_key experience_name_of_yojson "Name" _list path)
   } : create_experience_request)
let create_data_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key data_source_id_of_yojson "Id" _list path) } : 
    create_data_source_response)
let create_data_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_document_enrichment_configuration =
       (option_of_yojson
          (value_for_key custom_document_enrichment_configuration_of_yojson
             "CustomDocumentEnrichmentConfiguration") _list path);
     language_code =
       (option_of_yojson
          (value_for_key language_code_of_yojson "LanguageCode") _list path);
     client_token =
       (option_of_yojson
          (value_for_key client_token_name_of_yojson "ClientToken") _list
          path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     schedule =
       (option_of_yojson (value_for_key scan_schedule_of_yojson "Schedule")
          _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     vpc_configuration =
       (option_of_yojson
          (value_for_key data_source_vpc_configuration_of_yojson
             "VpcConfiguration") _list path);
     configuration =
       (option_of_yojson
          (value_for_key data_source_configuration_of_yojson "Configuration")
          _list path);
     type_ = (value_for_key data_source_type_of_yojson "Type" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     name = (value_for_key data_source_name_of_yojson "Name" _list path)
   } : create_data_source_request)
let create_access_control_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       (value_for_key access_control_configuration_id_of_yojson "Id" _list
          path)
   } : create_access_control_configuration_response)
let create_access_control_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       (option_of_yojson
          (value_for_key client_token_name_of_yojson "ClientToken") _list
          path);
     hierarchical_access_control_list =
       (option_of_yojson
          (value_for_key hierarchical_principal_list_of_yojson
             "HierarchicalAccessControlList") _list path);
     access_control_list =
       (option_of_yojson
          (value_for_key principal_list_of_yojson "AccessControlList") _list
          path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     name =
       (value_for_key access_control_configuration_name_of_yojson "Name"
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : create_access_control_configuration_request)
let clear_query_suggestions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ index_id = (value_for_key index_id_of_yojson "IndexId" _list path) } : 
    clear_query_suggestions_request)
let batch_put_document_response_failed_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     error_code =
       (option_of_yojson (value_for_key error_code_of_yojson "ErrorCode")
          _list path);
     id =
       (option_of_yojson (value_for_key document_id_of_yojson "Id") _list
          path)
   } : batch_put_document_response_failed_document)
let batch_put_document_response_failed_documents_of_yojson tree path =
  list_of_yojson batch_put_document_response_failed_document_of_yojson tree
    path
let batch_put_document_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_documents =
       (option_of_yojson
          (value_for_key
             batch_put_document_response_failed_documents_of_yojson
             "FailedDocuments") _list path)
   } : batch_put_document_response)
let batch_put_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_document_enrichment_configuration =
       (option_of_yojson
          (value_for_key custom_document_enrichment_configuration_of_yojson
             "CustomDocumentEnrichmentConfiguration") _list path);
     documents =
       (value_for_key document_list_of_yojson "Documents" _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : batch_put_document_request)
let batch_get_document_status_response_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     error_code =
       (option_of_yojson (value_for_key error_code_of_yojson "ErrorCode")
          _list path);
     document_id =
       (option_of_yojson (value_for_key document_id_of_yojson "DocumentId")
          _list path)
   } : batch_get_document_status_response_error)
let batch_get_document_status_response_errors_of_yojson tree path =
  list_of_yojson batch_get_document_status_response_error_of_yojson tree path
let batch_get_document_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_status_list =
       (option_of_yojson
          (value_for_key document_status_list_of_yojson "DocumentStatusList")
          _list path);
     errors =
       (option_of_yojson
          (value_for_key batch_get_document_status_response_errors_of_yojson
             "Errors") _list path)
   } : batch_get_document_status_response)
let batch_get_document_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_info_list =
       (value_for_key document_info_list_of_yojson "DocumentInfoList" _list
          path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : batch_get_document_status_request)
let batch_delete_featured_results_set_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       (value_for_key error_message_of_yojson "ErrorMessage" _list path);
     error_code = (value_for_key error_code_of_yojson "ErrorCode" _list path);
     id = (value_for_key featured_results_set_id_of_yojson "Id" _list path)
   } : batch_delete_featured_results_set_error)
let batch_delete_featured_results_set_errors_of_yojson tree path =
  list_of_yojson batch_delete_featured_results_set_error_of_yojson tree path
let batch_delete_featured_results_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       (value_for_key batch_delete_featured_results_set_errors_of_yojson
          "Errors" _list path)
   } : batch_delete_featured_results_set_response)
let batch_delete_featured_results_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     featured_results_set_ids =
       (value_for_key featured_results_set_id_list_of_yojson
          "FeaturedResultsSetIds" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : batch_delete_featured_results_set_request)
let batch_delete_document_response_failed_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       (option_of_yojson
          (value_for_key error_message_of_yojson "ErrorMessage") _list path);
     error_code =
       (option_of_yojson (value_for_key error_code_of_yojson "ErrorCode")
          _list path);
     id =
       (option_of_yojson (value_for_key document_id_of_yojson "Id") _list
          path)
   } : batch_delete_document_response_failed_document)
let batch_delete_document_response_failed_documents_of_yojson tree path =
  list_of_yojson batch_delete_document_response_failed_document_of_yojson
    tree path
let batch_delete_document_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_documents =
       (option_of_yojson
          (value_for_key
             batch_delete_document_response_failed_documents_of_yojson
             "FailedDocuments") _list path)
   } : batch_delete_document_response)
let batch_delete_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_sync_job_metric_target =
       (option_of_yojson
          (value_for_key data_source_sync_job_metric_target_of_yojson
             "DataSourceSyncJobMetricTarget") _list path);
     document_id_list =
       (value_for_key document_id_list_of_yojson "DocumentIdList" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path)
   } : batch_delete_document_request)
let associate_personas_to_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_entity_list =
       (option_of_yojson
          (value_for_key failed_entity_list_of_yojson "FailedEntityList")
          _list path)
   } : associate_personas_to_entities_response)
let associate_personas_to_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     personas =
       (value_for_key entity_persona_configuration_list_of_yojson "Personas"
          _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : associate_personas_to_entities_request)
let associate_entity_list_of_yojson tree path =
  list_of_yojson entity_configuration_of_yojson tree path
let associate_entities_to_experience_failed_entity_list_of_yojson tree path =
  list_of_yojson failed_entity_of_yojson tree path
let associate_entities_to_experience_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_entity_list =
       (option_of_yojson
          (value_for_key
             associate_entities_to_experience_failed_entity_list_of_yojson
             "FailedEntityList") _list path)
   } : associate_entities_to_experience_response)
let associate_entities_to_experience_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_list =
       (value_for_key associate_entity_list_of_yojson "EntityList" _list path);
     index_id = (value_for_key index_id_of_yojson "IndexId" _list path);
     id = (value_for_key experience_id_of_yojson "Id" _list path)
   } : associate_entities_to_experience_request)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson