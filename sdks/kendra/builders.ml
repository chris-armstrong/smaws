open Types

let make_s3_path ~bucket:(bucket_ : s3_bucket_name) ~key:(key_ : s3_object_key) () =
  ({ bucket = bucket_; key = key_ } : s3_path)

let make_update_thesaurus_request ?name:(name_ : thesaurus_name option)
    ?description:(description_ : description option) ?role_arn:(role_arn_ : role_arn option)
    ?source_s3_path:(source_s3_path_ : s3_path option) ~id:(id_ : thesaurus_id)
    ~index_id:(index_id_ : index_id) () =
  ({
     id = id_;
     name = name_;
     index_id = index_id_;
     description = description_;
     role_arn = role_arn_;
     source_s3_path = source_s3_path_;
   }
    : update_thesaurus_request)

let make_suggestable_config ?attribute_name:(attribute_name_ : document_attribute_key option)
    ?suggestable:(suggestable_ : object_boolean option) () =
  ({ attribute_name = attribute_name_; suggestable = suggestable_ } : suggestable_config)

let make_attribute_suggestions_update_config
    ?suggestable_config_list:(suggestable_config_list_ : suggestable_config_list option)
    ?attribute_suggestions_mode:(attribute_suggestions_mode_ : attribute_suggestions_mode option) ()
    =
  ({
     suggestable_config_list = suggestable_config_list_;
     attribute_suggestions_mode = attribute_suggestions_mode_;
   }
    : attribute_suggestions_update_config)

let make_update_query_suggestions_config_request ?mode:(mode_ : mode option)
    ?query_log_look_back_window_in_days:(query_log_look_back_window_in_days_ : integer option)
    ?include_queries_without_user_information:
      (include_queries_without_user_information_ : object_boolean option)
    ?minimum_number_of_querying_users:
      (minimum_number_of_querying_users_ : minimum_number_of_querying_users option)
    ?minimum_query_count:(minimum_query_count_ : minimum_query_count option)
    ?attribute_suggestions_config:
      (attribute_suggestions_config_ : attribute_suggestions_update_config option)
    ~index_id:(index_id_ : index_id) () =
  ({
     index_id = index_id_;
     mode = mode_;
     query_log_look_back_window_in_days = query_log_look_back_window_in_days_;
     include_queries_without_user_information = include_queries_without_user_information_;
     minimum_number_of_querying_users = minimum_number_of_querying_users_;
     minimum_query_count = minimum_query_count_;
     attribute_suggestions_config = attribute_suggestions_config_;
   }
    : update_query_suggestions_config_request)

let make_update_query_suggestions_block_list_request
    ?name:(name_ : query_suggestions_block_list_name option)
    ?description:(description_ : description option)
    ?source_s3_path:(source_s3_path_ : s3_path option) ?role_arn:(role_arn_ : role_arn option)
    ~index_id:(index_id_ : index_id) ~id:(id_ : query_suggestions_block_list_id) () =
  ({
     index_id = index_id_;
     id = id_;
     name = name_;
     description = description_;
     source_s3_path = source_s3_path_;
     role_arn = role_arn_;
   }
    : update_query_suggestions_block_list_request)

let make_user_group_resolution_configuration
    ~user_group_resolution_mode:(user_group_resolution_mode_ : user_group_resolution_mode) () =
  ({ user_group_resolution_mode = user_group_resolution_mode_ }
    : user_group_resolution_configuration)

let make_json_token_type_configuration
    ~user_name_attribute_field:(user_name_attribute_field_ : string_)
    ~group_attribute_field:(group_attribute_field_ : string_) () =
  ({
     user_name_attribute_field = user_name_attribute_field_;
     group_attribute_field = group_attribute_field_;
   }
    : json_token_type_configuration)

let make_jwt_token_type_configuration ?ur_l:(ur_l_ : url option)
    ?secret_manager_arn:(secret_manager_arn_ : role_arn option)
    ?user_name_attribute_field:(user_name_attribute_field_ : user_name_attribute_field option)
    ?group_attribute_field:(group_attribute_field_ : group_attribute_field option)
    ?issuer:(issuer_ : issuer option) ?claim_regex:(claim_regex_ : claim_regex option)
    ~key_location:(key_location_ : key_location) () =
  ({
     key_location = key_location_;
     ur_l = ur_l_;
     secret_manager_arn = secret_manager_arn_;
     user_name_attribute_field = user_name_attribute_field_;
     group_attribute_field = group_attribute_field_;
     issuer = issuer_;
     claim_regex = claim_regex_;
   }
    : jwt_token_type_configuration)

let make_user_token_configuration
    ?jwt_token_type_configuration:
      (jwt_token_type_configuration_ : jwt_token_type_configuration option)
    ?json_token_type_configuration:
      (json_token_type_configuration_ : json_token_type_configuration option) () =
  ({
     jwt_token_type_configuration = jwt_token_type_configuration_;
     json_token_type_configuration = json_token_type_configuration_;
   }
    : user_token_configuration)

let make_capacity_units_configuration
    ~storage_capacity_units:(storage_capacity_units_ : storage_capacity_unit)
    ~query_capacity_units:(query_capacity_units_ : query_capacity_unit) () =
  ({
     storage_capacity_units = storage_capacity_units_;
     query_capacity_units = query_capacity_units_;
   }
    : capacity_units_configuration)

let make_search ?facetable:(facetable_ : boolean_ option)
    ?searchable:(searchable_ : boolean_ option) ?displayable:(displayable_ : boolean_ option)
    ?sortable:(sortable_ : boolean_ option) () =
  ({
     facetable = facetable_;
     searchable = searchable_;
     displayable = displayable_;
     sortable = sortable_;
   }
    : search)

let make_relevance ?freshness:(freshness_ : document_metadata_boolean option)
    ?importance:(importance_ : importance option) ?duration:(duration_ : duration option)
    ?rank_order:(rank_order_ : order option)
    ?value_importance_map:(value_importance_map_ : value_importance_map option) () =
  ({
     freshness = freshness_;
     importance = importance_;
     duration = duration_;
     rank_order = rank_order_;
     value_importance_map = value_importance_map_;
   }
    : relevance)

let make_document_metadata_configuration ?relevance:(relevance_ : relevance option)
    ?search:(search_ : search option) ~name:(name_ : document_metadata_configuration_name)
    ~type_:(type__ : document_attribute_value_type) () =
  ({ name = name_; type_ = type__; relevance = relevance_; search = search_ }
    : document_metadata_configuration)

let make_update_index_request ?name:(name_ : index_name option)
    ?role_arn:(role_arn_ : role_arn option) ?description:(description_ : description option)
    ?document_metadata_configuration_updates:
      (document_metadata_configuration_updates_ : document_metadata_configuration_list option)
    ?capacity_units:(capacity_units_ : capacity_units_configuration option)
    ?user_token_configurations:(user_token_configurations_ : user_token_configuration_list option)
    ?user_context_policy:(user_context_policy_ : user_context_policy option)
    ?user_group_resolution_configuration:
      (user_group_resolution_configuration_ : user_group_resolution_configuration option)
    ~id:(id_ : index_id) () =
  ({
     id = id_;
     name = name_;
     role_arn = role_arn_;
     description = description_;
     document_metadata_configuration_updates = document_metadata_configuration_updates_;
     capacity_units = capacity_units_;
     user_token_configurations = user_token_configurations_;
     user_context_policy = user_context_policy_;
     user_group_resolution_configuration = user_group_resolution_configuration_;
   }
    : update_index_request)

let make_conflicting_item ?query_text:(query_text_ : query_text option)
    ?set_name:(set_name_ : string_ option) ?set_id:(set_id_ : string_ option) () =
  ({ query_text = query_text_; set_name = set_name_; set_id = set_id_ } : conflicting_item)

let make_featured_document ?id:(id_ : document_id option) () = ({ id = id_ } : featured_document)

let make_featured_results_set
    ?featured_results_set_id:(featured_results_set_id_ : featured_results_set_id option)
    ?featured_results_set_name:(featured_results_set_name_ : featured_results_set_name option)
    ?description:(description_ : featured_results_set_description option)
    ?status:(status_ : featured_results_set_status option)
    ?query_texts:(query_texts_ : query_text_list option)
    ?featured_documents:(featured_documents_ : featured_document_list option)
    ?last_updated_timestamp:(last_updated_timestamp_ : long option)
    ?creation_timestamp:(creation_timestamp_ : long option) () =
  ({
     featured_results_set_id = featured_results_set_id_;
     featured_results_set_name = featured_results_set_name_;
     description = description_;
     status = status_;
     query_texts = query_texts_;
     featured_documents = featured_documents_;
     last_updated_timestamp = last_updated_timestamp_;
     creation_timestamp = creation_timestamp_;
   }
    : featured_results_set)

let make_update_featured_results_set_response
    ?featured_results_set:(featured_results_set_ : featured_results_set option) () =
  ({ featured_results_set = featured_results_set_ } : update_featured_results_set_response)

let make_update_featured_results_set_request
    ?featured_results_set_name:(featured_results_set_name_ : featured_results_set_name option)
    ?description:(description_ : featured_results_set_description option)
    ?status:(status_ : featured_results_set_status option)
    ?query_texts:(query_texts_ : query_text_list option)
    ?featured_documents:(featured_documents_ : featured_document_list option)
    ~index_id:(index_id_ : index_id)
    ~featured_results_set_id:(featured_results_set_id_ : featured_results_set_id) () =
  ({
     index_id = index_id_;
     featured_results_set_id = featured_results_set_id_;
     featured_results_set_name = featured_results_set_name_;
     description = description_;
     status = status_;
     query_texts = query_texts_;
     featured_documents = featured_documents_;
   }
    : update_featured_results_set_request)

let make_user_identity_configuration
    ?identity_attribute_name:(identity_attribute_name_ : identity_attribute_name option) () =
  ({ identity_attribute_name = identity_attribute_name_ } : user_identity_configuration)

let make_content_source_configuration
    ?data_source_ids:(data_source_ids_ : data_source_id_list option)
    ?faq_ids:(faq_ids_ : faq_ids_list option)
    ?direct_put_content:(direct_put_content_ : boolean_ option) () =
  ({
     data_source_ids = data_source_ids_;
     faq_ids = faq_ids_;
     direct_put_content = direct_put_content_;
   }
    : content_source_configuration)

let make_experience_configuration
    ?content_source_configuration:
      (content_source_configuration_ : content_source_configuration option)
    ?user_identity_configuration:(user_identity_configuration_ : user_identity_configuration option)
    () =
  ({
     content_source_configuration = content_source_configuration_;
     user_identity_configuration = user_identity_configuration_;
   }
    : experience_configuration)

let make_update_experience_request ?name:(name_ : experience_name option)
    ?role_arn:(role_arn_ : role_arn option)
    ?configuration:(configuration_ : experience_configuration option)
    ?description:(description_ : description option) ~id:(id_ : experience_id)
    ~index_id:(index_id_ : index_id) () =
  ({
     id = id_;
     name = name_;
     index_id = index_id_;
     role_arn = role_arn_;
     configuration = configuration_;
     description = description_;
   }
    : update_experience_request)

let make_document_attribute_value
    ?string_value:(string_value_ : document_attribute_string_value option)
    ?string_list_value:(string_list_value_ : document_attribute_string_list_value option)
    ?long_value:(long_value_ : long option) ?date_value:(date_value_ : timestamp option) () =
  ({
     string_value = string_value_;
     string_list_value = string_list_value_;
     long_value = long_value_;
     date_value = date_value_;
   }
    : document_attribute_value)

let make_document_attribute_condition
    ?condition_on_value:(condition_on_value_ : document_attribute_value option)
    ~condition_document_attribute_key:(condition_document_attribute_key_ : document_attribute_key)
    ~operator:(operator_ : condition_operator) () =
  ({
     condition_document_attribute_key = condition_document_attribute_key_;
     operator = operator_;
     condition_on_value = condition_on_value_;
   }
    : document_attribute_condition)

let make_hook_configuration
    ?invocation_condition:(invocation_condition_ : document_attribute_condition option)
    ~lambda_arn:(lambda_arn_ : lambda_arn) ~s3_bucket:(s3_bucket_ : s3_bucket_name) () =
  ({
     invocation_condition = invocation_condition_;
     lambda_arn = lambda_arn_;
     s3_bucket = s3_bucket_;
   }
    : hook_configuration)

let make_document_attribute_target
    ?target_document_attribute_key:(target_document_attribute_key_ : document_attribute_key option)
    ?target_document_attribute_value_deletion:
      (target_document_attribute_value_deletion_ : boolean_ option)
    ?target_document_attribute_value:
      (target_document_attribute_value_ : document_attribute_value option) () =
  ({
     target_document_attribute_key = target_document_attribute_key_;
     target_document_attribute_value_deletion = target_document_attribute_value_deletion_;
     target_document_attribute_value = target_document_attribute_value_;
   }
    : document_attribute_target)

let make_inline_custom_document_enrichment_configuration
    ?condition:(condition_ : document_attribute_condition option)
    ?target:(target_ : document_attribute_target option)
    ?document_content_deletion:(document_content_deletion_ : boolean_ option) () =
  ({
     condition = condition_;
     target = target_;
     document_content_deletion = document_content_deletion_;
   }
    : inline_custom_document_enrichment_configuration)

let make_custom_document_enrichment_configuration
    ?inline_configurations:
      (inline_configurations_ : inline_custom_document_enrichment_configuration_list option)
    ?pre_extraction_hook_configuration:
      (pre_extraction_hook_configuration_ : hook_configuration option)
    ?post_extraction_hook_configuration:
      (post_extraction_hook_configuration_ : hook_configuration option)
    ?role_arn:(role_arn_ : role_arn option) () =
  ({
     inline_configurations = inline_configurations_;
     pre_extraction_hook_configuration = pre_extraction_hook_configuration_;
     post_extraction_hook_configuration = post_extraction_hook_configuration_;
     role_arn = role_arn_;
   }
    : custom_document_enrichment_configuration)

let make_data_source_vpc_configuration ~subnet_ids:(subnet_ids_ : subnet_id_list)
    ~security_group_ids:(security_group_ids_ : security_group_id_list) () =
  ({ subnet_ids = subnet_ids_; security_group_ids = security_group_ids_ }
    : data_source_vpc_configuration)

let make_template_configuration ?template:(template_ : template option) () =
  ({ template = template_ } : template_configuration)

let make_data_source_to_index_field_mapping
    ?date_field_format:(date_field_format_ : data_source_date_field_format option)
    ~data_source_field_name:(data_source_field_name_ : data_source_field_name)
    ~index_field_name:(index_field_name_ : index_field_name) () =
  ({
     data_source_field_name = data_source_field_name_;
     date_field_format = date_field_format_;
     index_field_name = index_field_name_;
   }
    : data_source_to_index_field_mapping)

let make_alfresco_configuration ?crawl_system_folders:(crawl_system_folders_ : boolean_ option)
    ?crawl_comments:(crawl_comments_ : boolean_ option)
    ?entity_filter:(entity_filter_ : entity_filter option)
    ?document_library_field_mappings:
      (document_library_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?blog_field_mappings:(blog_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?wiki_field_mappings:(wiki_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ~site_url:(site_url_ : site_url) ~site_id:(site_id_ : site_id)
    ~secret_arn:(secret_arn_ : secret_arn)
    ~ssl_certificate_s3_path:(ssl_certificate_s3_path_ : s3_path) () =
  ({
     site_url = site_url_;
     site_id = site_id_;
     secret_arn = secret_arn_;
     ssl_certificate_s3_path = ssl_certificate_s3_path_;
     crawl_system_folders = crawl_system_folders_;
     crawl_comments = crawl_comments_;
     entity_filter = entity_filter_;
     document_library_field_mappings = document_library_field_mappings_;
     blog_field_mappings = blog_field_mappings_;
     wiki_field_mappings = wiki_field_mappings_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     vpc_configuration = vpc_configuration_;
   }
    : alfresco_configuration)

let make_git_hub_document_crawl_properties
    ?crawl_repository_documents:(crawl_repository_documents_ : boolean_ option)
    ?crawl_issue:(crawl_issue_ : boolean_ option)
    ?crawl_issue_comment:(crawl_issue_comment_ : boolean_ option)
    ?crawl_issue_comment_attachment:(crawl_issue_comment_attachment_ : boolean_ option)
    ?crawl_pull_request:(crawl_pull_request_ : boolean_ option)
    ?crawl_pull_request_comment:(crawl_pull_request_comment_ : boolean_ option)
    ?crawl_pull_request_comment_attachment:
      (crawl_pull_request_comment_attachment_ : boolean_ option) () =
  ({
     crawl_repository_documents = crawl_repository_documents_;
     crawl_issue = crawl_issue_;
     crawl_issue_comment = crawl_issue_comment_;
     crawl_issue_comment_attachment = crawl_issue_comment_attachment_;
     crawl_pull_request = crawl_pull_request_;
     crawl_pull_request_comment = crawl_pull_request_comment_;
     crawl_pull_request_comment_attachment = crawl_pull_request_comment_attachment_;
   }
    : git_hub_document_crawl_properties)

let make_on_premise_configuration ~host_url:(host_url_ : url)
    ~organization_name:(organization_name_ : organization_name)
    ~ssl_certificate_s3_path:(ssl_certificate_s3_path_ : s3_path) () =
  ({
     host_url = host_url_;
     organization_name = organization_name_;
     ssl_certificate_s3_path = ssl_certificate_s3_path_;
   }
    : on_premise_configuration)

let make_saa_s_configuration ~organization_name:(organization_name_ : organization_name)
    ~host_url:(host_url_ : url) () =
  ({ organization_name = organization_name_; host_url = host_url_ } : saa_s_configuration)

let make_git_hub_configuration
    ?saa_s_configuration:(saa_s_configuration_ : saa_s_configuration option)
    ?on_premise_configuration:(on_premise_configuration_ : on_premise_configuration option)
    ?type_:(type__ : type_ option) ?use_change_log:(use_change_log_ : boolean_ option)
    ?git_hub_document_crawl_properties:
      (git_hub_document_crawl_properties_ : git_hub_document_crawl_properties option)
    ?repository_filter:(repository_filter_ : repository_names option)
    ?inclusion_folder_name_patterns:(inclusion_folder_name_patterns_ : string_list option)
    ?inclusion_file_type_patterns:(inclusion_file_type_patterns_ : string_list option)
    ?inclusion_file_name_patterns:(inclusion_file_name_patterns_ : string_list option)
    ?exclusion_folder_name_patterns:(exclusion_folder_name_patterns_ : string_list option)
    ?exclusion_file_type_patterns:(exclusion_file_type_patterns_ : string_list option)
    ?exclusion_file_name_patterns:(exclusion_file_name_patterns_ : string_list option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ?git_hub_repository_configuration_field_mappings:
      (git_hub_repository_configuration_field_mappings_ :
         data_source_to_index_field_mapping_list option)
    ?git_hub_commit_configuration_field_mappings:
      (git_hub_commit_configuration_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?git_hub_issue_document_configuration_field_mappings:
      (git_hub_issue_document_configuration_field_mappings_ :
         data_source_to_index_field_mapping_list option)
    ?git_hub_issue_comment_configuration_field_mappings:
      (git_hub_issue_comment_configuration_field_mappings_ :
         data_source_to_index_field_mapping_list option)
    ?git_hub_issue_attachment_configuration_field_mappings:
      (git_hub_issue_attachment_configuration_field_mappings_ :
         data_source_to_index_field_mapping_list option)
    ?git_hub_pull_request_comment_configuration_field_mappings:
      (git_hub_pull_request_comment_configuration_field_mappings_ :
         data_source_to_index_field_mapping_list option)
    ?git_hub_pull_request_document_configuration_field_mappings:
      (git_hub_pull_request_document_configuration_field_mappings_ :
         data_source_to_index_field_mapping_list option)
    ?git_hub_pull_request_document_attachment_configuration_field_mappings:
      (git_hub_pull_request_document_attachment_configuration_field_mappings_ :
         data_source_to_index_field_mapping_list option) ~secret_arn:(secret_arn_ : secret_arn) () =
  ({
     saa_s_configuration = saa_s_configuration_;
     on_premise_configuration = on_premise_configuration_;
     type_ = type__;
     secret_arn = secret_arn_;
     use_change_log = use_change_log_;
     git_hub_document_crawl_properties = git_hub_document_crawl_properties_;
     repository_filter = repository_filter_;
     inclusion_folder_name_patterns = inclusion_folder_name_patterns_;
     inclusion_file_type_patterns = inclusion_file_type_patterns_;
     inclusion_file_name_patterns = inclusion_file_name_patterns_;
     exclusion_folder_name_patterns = exclusion_folder_name_patterns_;
     exclusion_file_type_patterns = exclusion_file_type_patterns_;
     exclusion_file_name_patterns = exclusion_file_name_patterns_;
     vpc_configuration = vpc_configuration_;
     git_hub_repository_configuration_field_mappings =
       git_hub_repository_configuration_field_mappings_;
     git_hub_commit_configuration_field_mappings = git_hub_commit_configuration_field_mappings_;
     git_hub_issue_document_configuration_field_mappings =
       git_hub_issue_document_configuration_field_mappings_;
     git_hub_issue_comment_configuration_field_mappings =
       git_hub_issue_comment_configuration_field_mappings_;
     git_hub_issue_attachment_configuration_field_mappings =
       git_hub_issue_attachment_configuration_field_mappings_;
     git_hub_pull_request_comment_configuration_field_mappings =
       git_hub_pull_request_comment_configuration_field_mappings_;
     git_hub_pull_request_document_configuration_field_mappings =
       git_hub_pull_request_document_configuration_field_mappings_;
     git_hub_pull_request_document_attachment_configuration_field_mappings =
       git_hub_pull_request_document_attachment_configuration_field_mappings_;
   }
    : git_hub_configuration)

let make_jira_configuration ?use_change_log:(use_change_log_ : boolean_ option)
    ?project:(project_ : project option) ?issue_type:(issue_type_ : issue_type option)
    ?status:(status_ : jira_status option)
    ?issue_sub_entity_filter:(issue_sub_entity_filter_ : issue_sub_entity_filter option)
    ?attachment_field_mappings:
      (attachment_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?comment_field_mappings:
      (comment_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?issue_field_mappings:(issue_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?project_field_mappings:
      (project_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?work_log_field_mappings:
      (work_log_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ~jira_account_url:(jira_account_url_ : jira_account_url) ~secret_arn:(secret_arn_ : secret_arn)
    () =
  ({
     jira_account_url = jira_account_url_;
     secret_arn = secret_arn_;
     use_change_log = use_change_log_;
     project = project_;
     issue_type = issue_type_;
     status = status_;
     issue_sub_entity_filter = issue_sub_entity_filter_;
     attachment_field_mappings = attachment_field_mappings_;
     comment_field_mappings = comment_field_mappings_;
     issue_field_mappings = issue_field_mappings_;
     project_field_mappings = project_field_mappings_;
     work_log_field_mappings = work_log_field_mappings_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     vpc_configuration = vpc_configuration_;
   }
    : jira_configuration)

let make_quip_configuration ?crawl_file_comments:(crawl_file_comments_ : boolean_ option)
    ?crawl_chat_rooms:(crawl_chat_rooms_ : boolean_ option)
    ?crawl_attachments:(crawl_attachments_ : boolean_ option)
    ?folder_ids:(folder_ids_ : folder_id_list option)
    ?thread_field_mappings:(thread_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?message_field_mappings:
      (message_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?attachment_field_mappings:
      (attachment_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ~domain:(domain_ : domain) ~secret_arn:(secret_arn_ : secret_arn) () =
  ({
     domain = domain_;
     secret_arn = secret_arn_;
     crawl_file_comments = crawl_file_comments_;
     crawl_chat_rooms = crawl_chat_rooms_;
     crawl_attachments = crawl_attachments_;
     folder_ids = folder_ids_;
     thread_field_mappings = thread_field_mappings_;
     message_field_mappings = message_field_mappings_;
     attachment_field_mappings = attachment_field_mappings_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     vpc_configuration = vpc_configuration_;
   }
    : quip_configuration)

let make_box_configuration ?use_change_log:(use_change_log_ : boolean_ option)
    ?crawl_comments:(crawl_comments_ : boolean_ option)
    ?crawl_tasks:(crawl_tasks_ : boolean_ option)
    ?crawl_web_links:(crawl_web_links_ : boolean_ option)
    ?file_field_mappings:(file_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?task_field_mappings:(task_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?comment_field_mappings:
      (comment_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?web_link_field_mappings:
      (web_link_field_mappings_ : data_source_to_index_field_mapping_list option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ~enterprise_id:(enterprise_id_ : enterprise_id) ~secret_arn:(secret_arn_ : secret_arn) () =
  ({
     enterprise_id = enterprise_id_;
     secret_arn = secret_arn_;
     use_change_log = use_change_log_;
     crawl_comments = crawl_comments_;
     crawl_tasks = crawl_tasks_;
     crawl_web_links = crawl_web_links_;
     file_field_mappings = file_field_mappings_;
     task_field_mappings = task_field_mappings_;
     comment_field_mappings = comment_field_mappings_;
     web_link_field_mappings = web_link_field_mappings_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     vpc_configuration = vpc_configuration_;
   }
    : box_configuration)

let make_slack_configuration
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ?use_change_log:(use_change_log_ : boolean_ option)
    ?crawl_bot_message:(crawl_bot_message_ : boolean_ option)
    ?exclude_archived:(exclude_archived_ : boolean_ option)
    ?look_back_period:(look_back_period_ : look_back_period option)
    ?private_channel_filter:(private_channel_filter_ : private_channel_filter option)
    ?public_channel_filter:(public_channel_filter_ : public_channel_filter option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ~team_id:(team_id_ : team_id) ~secret_arn:(secret_arn_ : secret_arn)
    ~slack_entity_list:(slack_entity_list_ : slack_entity_list)
    ~since_crawl_date:(since_crawl_date_ : since_crawl_date) () =
  ({
     team_id = team_id_;
     secret_arn = secret_arn_;
     vpc_configuration = vpc_configuration_;
     slack_entity_list = slack_entity_list_;
     use_change_log = use_change_log_;
     crawl_bot_message = crawl_bot_message_;
     exclude_archived = exclude_archived_;
     since_crawl_date = since_crawl_date_;
     look_back_period = look_back_period_;
     private_channel_filter = private_channel_filter_;
     public_channel_filter = public_channel_filter_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     field_mappings = field_mappings_;
   }
    : slack_configuration)

let make_fsx_configuration ?secret_arn:(secret_arn_ : secret_arn option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ~file_system_id:(file_system_id_ : file_system_id)
    ~file_system_type:(file_system_type_ : fsx_file_system_type)
    ~vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration) () =
  ({
     file_system_id = file_system_id_;
     file_system_type = file_system_type_;
     vpc_configuration = vpc_configuration_;
     secret_arn = secret_arn_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     field_mappings = field_mappings_;
   }
    : fsx_configuration)

let make_work_docs_configuration ?crawl_comments:(crawl_comments_ : boolean_ option)
    ?use_change_log:(use_change_log_ : boolean_ option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     organization_id = organization_id_;
     crawl_comments = crawl_comments_;
     use_change_log = use_change_log_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     field_mappings = field_mappings_;
   }
    : work_docs_configuration)

let make_basic_authentication_configuration ~host:(host_ : host) ~port:(port_ : port)
    ~credentials:(credentials_ : secret_arn) () =
  ({ host = host_; port = port_; credentials = credentials_ } : basic_authentication_configuration)

let make_authentication_configuration
    ?basic_authentication:(basic_authentication_ : basic_authentication_configuration_list option)
    () =
  ({ basic_authentication = basic_authentication_ } : authentication_configuration)

let make_proxy_configuration ?credentials:(credentials_ : secret_arn option) ~host:(host_ : host)
    ~port:(port_ : port) () =
  ({ host = host_; port = port_; credentials = credentials_ } : proxy_configuration)

let make_site_maps_configuration ~site_maps:(site_maps_ : site_maps_list) () =
  ({ site_maps = site_maps_ } : site_maps_configuration)

let make_seed_url_configuration ?web_crawler_mode:(web_crawler_mode_ : web_crawler_mode option)
    ~seed_urls:(seed_urls_ : seed_url_list) () =
  ({ seed_urls = seed_urls_; web_crawler_mode = web_crawler_mode_ } : seed_url_configuration)

let make_urls ?seed_url_configuration:(seed_url_configuration_ : seed_url_configuration option)
    ?site_maps_configuration:(site_maps_configuration_ : site_maps_configuration option) () =
  ({
     seed_url_configuration = seed_url_configuration_;
     site_maps_configuration = site_maps_configuration_;
   }
    : urls)

let make_web_crawler_configuration ?crawl_depth:(crawl_depth_ : crawl_depth option)
    ?max_links_per_page:(max_links_per_page_ : max_links_per_page option)
    ?max_content_size_per_page_in_mega_bytes:
      (max_content_size_per_page_in_mega_bytes_ : max_content_size_per_page_in_mega_bytes option)
    ?max_urls_per_minute_crawl_rate:
      (max_urls_per_minute_crawl_rate_ : max_urls_per_minute_crawl_rate option)
    ?url_inclusion_patterns:
      (url_inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?url_exclusion_patterns:
      (url_exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration option) ~urls:(urls_ : urls) ()
    =
  ({
     urls = urls_;
     crawl_depth = crawl_depth_;
     max_links_per_page = max_links_per_page_;
     max_content_size_per_page_in_mega_bytes = max_content_size_per_page_in_mega_bytes_;
     max_urls_per_minute_crawl_rate = max_urls_per_minute_crawl_rate_;
     url_inclusion_patterns = url_inclusion_patterns_;
     url_exclusion_patterns = url_exclusion_patterns_;
     proxy_configuration = proxy_configuration_;
     authentication_configuration = authentication_configuration_;
   }
    : web_crawler_configuration)

let make_google_drive_configuration
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ?exclude_mime_types:(exclude_mime_types_ : exclude_mime_types_list option)
    ?exclude_user_accounts:(exclude_user_accounts_ : exclude_user_accounts_list option)
    ?exclude_shared_drives:(exclude_shared_drives_ : exclude_shared_drives_list option)
    ~secret_arn:(secret_arn_ : secret_arn) () =
  ({
     secret_arn = secret_arn_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     field_mappings = field_mappings_;
     exclude_mime_types = exclude_mime_types_;
     exclude_user_accounts = exclude_user_accounts_;
     exclude_shared_drives = exclude_shared_drives_;
   }
    : google_drive_configuration)

let make_confluence_attachment_to_index_field_mapping
    ?data_source_field_name:(data_source_field_name_ : confluence_attachment_field_name option)
    ?date_field_format:(date_field_format_ : data_source_date_field_format option)
    ?index_field_name:(index_field_name_ : index_field_name option) () =
  ({
     data_source_field_name = data_source_field_name_;
     date_field_format = date_field_format_;
     index_field_name = index_field_name_;
   }
    : confluence_attachment_to_index_field_mapping)

let make_confluence_attachment_configuration
    ?crawl_attachments:(crawl_attachments_ : boolean_ option)
    ?attachment_field_mappings:
      (attachment_field_mappings_ : confluence_attachment_field_mappings_list option) () =
  ({
     crawl_attachments = crawl_attachments_;
     attachment_field_mappings = attachment_field_mappings_;
   }
    : confluence_attachment_configuration)

let make_confluence_blog_to_index_field_mapping
    ?data_source_field_name:(data_source_field_name_ : confluence_blog_field_name option)
    ?date_field_format:(date_field_format_ : data_source_date_field_format option)
    ?index_field_name:(index_field_name_ : index_field_name option) () =
  ({
     data_source_field_name = data_source_field_name_;
     date_field_format = date_field_format_;
     index_field_name = index_field_name_;
   }
    : confluence_blog_to_index_field_mapping)

let make_confluence_blog_configuration
    ?blog_field_mappings:(blog_field_mappings_ : confluence_blog_field_mappings_list option) () =
  ({ blog_field_mappings = blog_field_mappings_ } : confluence_blog_configuration)

let make_confluence_page_to_index_field_mapping
    ?data_source_field_name:(data_source_field_name_ : confluence_page_field_name option)
    ?date_field_format:(date_field_format_ : data_source_date_field_format option)
    ?index_field_name:(index_field_name_ : index_field_name option) () =
  ({
     data_source_field_name = data_source_field_name_;
     date_field_format = date_field_format_;
     index_field_name = index_field_name_;
   }
    : confluence_page_to_index_field_mapping)

let make_confluence_page_configuration
    ?page_field_mappings:(page_field_mappings_ : confluence_page_field_mappings_list option) () =
  ({ page_field_mappings = page_field_mappings_ } : confluence_page_configuration)

let make_confluence_space_to_index_field_mapping
    ?data_source_field_name:(data_source_field_name_ : confluence_space_field_name option)
    ?date_field_format:(date_field_format_ : data_source_date_field_format option)
    ?index_field_name:(index_field_name_ : index_field_name option) () =
  ({
     data_source_field_name = data_source_field_name_;
     date_field_format = date_field_format_;
     index_field_name = index_field_name_;
   }
    : confluence_space_to_index_field_mapping)

let make_confluence_space_configuration
    ?crawl_personal_spaces:(crawl_personal_spaces_ : boolean_ option)
    ?crawl_archived_spaces:(crawl_archived_spaces_ : boolean_ option)
    ?include_spaces:(include_spaces_ : confluence_space_list option)
    ?exclude_spaces:(exclude_spaces_ : confluence_space_list option)
    ?space_field_mappings:(space_field_mappings_ : confluence_space_field_mappings_list option) () =
  ({
     crawl_personal_spaces = crawl_personal_spaces_;
     crawl_archived_spaces = crawl_archived_spaces_;
     include_spaces = include_spaces_;
     exclude_spaces = exclude_spaces_;
     space_field_mappings = space_field_mappings_;
   }
    : confluence_space_configuration)

let make_confluence_configuration
    ?space_configuration:(space_configuration_ : confluence_space_configuration option)
    ?page_configuration:(page_configuration_ : confluence_page_configuration option)
    ?blog_configuration:(blog_configuration_ : confluence_blog_configuration option)
    ?attachment_configuration:
      (attachment_configuration_ : confluence_attachment_configuration option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?authentication_type:(authentication_type_ : confluence_authentication_type option)
    ~server_url:(server_url_ : url) ~secret_arn:(secret_arn_ : secret_arn)
    ~version:(version_ : confluence_version) () =
  ({
     server_url = server_url_;
     secret_arn = secret_arn_;
     version = version_;
     space_configuration = space_configuration_;
     page_configuration = page_configuration_;
     blog_configuration = blog_configuration_;
     attachment_configuration = attachment_configuration_;
     vpc_configuration = vpc_configuration_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     proxy_configuration = proxy_configuration_;
     authentication_type = authentication_type_;
   }
    : confluence_configuration)

let make_service_now_service_catalog_configuration
    ?crawl_attachments:(crawl_attachments_ : boolean_ option)
    ?include_attachment_file_patterns:
      (include_attachment_file_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclude_attachment_file_patterns:
      (exclude_attachment_file_patterns_ : data_source_inclusions_exclusions_strings option)
    ?document_title_field_name:(document_title_field_name_ : data_source_field_name option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ~document_data_field_name:(document_data_field_name_ : data_source_field_name) () =
  ({
     crawl_attachments = crawl_attachments_;
     include_attachment_file_patterns = include_attachment_file_patterns_;
     exclude_attachment_file_patterns = exclude_attachment_file_patterns_;
     document_data_field_name = document_data_field_name_;
     document_title_field_name = document_title_field_name_;
     field_mappings = field_mappings_;
   }
    : service_now_service_catalog_configuration)

let make_service_now_knowledge_article_configuration
    ?crawl_attachments:(crawl_attachments_ : boolean_ option)
    ?include_attachment_file_patterns:
      (include_attachment_file_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclude_attachment_file_patterns:
      (exclude_attachment_file_patterns_ : data_source_inclusions_exclusions_strings option)
    ?document_title_field_name:(document_title_field_name_ : data_source_field_name option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ?filter_query:(filter_query_ : service_now_knowledge_article_filter_query option)
    ~document_data_field_name:(document_data_field_name_ : data_source_field_name) () =
  ({
     crawl_attachments = crawl_attachments_;
     include_attachment_file_patterns = include_attachment_file_patterns_;
     exclude_attachment_file_patterns = exclude_attachment_file_patterns_;
     document_data_field_name = document_data_field_name_;
     document_title_field_name = document_title_field_name_;
     field_mappings = field_mappings_;
     filter_query = filter_query_;
   }
    : service_now_knowledge_article_configuration)

let make_service_now_configuration
    ?knowledge_article_configuration:
      (knowledge_article_configuration_ : service_now_knowledge_article_configuration option)
    ?service_catalog_configuration:
      (service_catalog_configuration_ : service_now_service_catalog_configuration option)
    ?authentication_type:(authentication_type_ : service_now_authentication_type option)
    ~host_url:(host_url_ : service_now_host_url) ~secret_arn:(secret_arn_ : secret_arn)
    ~service_now_build_version:(service_now_build_version_ : service_now_build_version_type) () =
  ({
     host_url = host_url_;
     secret_arn = secret_arn_;
     service_now_build_version = service_now_build_version_;
     knowledge_article_configuration = knowledge_article_configuration_;
     service_catalog_configuration = service_catalog_configuration_;
     authentication_type = authentication_type_;
   }
    : service_now_configuration)

let make_one_drive_users ?one_drive_user_list:(one_drive_user_list_ : one_drive_user_list option)
    ?one_drive_user_s3_path:(one_drive_user_s3_path_ : s3_path option) () =
  ({ one_drive_user_list = one_drive_user_list_; one_drive_user_s3_path = one_drive_user_s3_path_ }
    : one_drive_users)

let make_one_drive_configuration
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ?disable_local_groups:(disable_local_groups_ : boolean_ option)
    ~tenant_domain:(tenant_domain_ : tenant_domain) ~secret_arn:(secret_arn_ : secret_arn)
    ~one_drive_users:(one_drive_users_ : one_drive_users) () =
  ({
     tenant_domain = tenant_domain_;
     secret_arn = secret_arn_;
     one_drive_users = one_drive_users_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     field_mappings = field_mappings_;
     disable_local_groups = disable_local_groups_;
   }
    : one_drive_configuration)

let make_salesforce_standard_object_attachment_configuration
    ?document_title_field_name:(document_title_field_name_ : data_source_field_name option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option) () =
  ({ document_title_field_name = document_title_field_name_; field_mappings = field_mappings_ }
    : salesforce_standard_object_attachment_configuration)

let make_salesforce_chatter_feed_configuration
    ?document_title_field_name:(document_title_field_name_ : data_source_field_name option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ?include_filter_types:
      (include_filter_types_ : salesforce_chatter_feed_include_filter_types option)
    ~document_data_field_name:(document_data_field_name_ : data_source_field_name) () =
  ({
     document_data_field_name = document_data_field_name_;
     document_title_field_name = document_title_field_name_;
     field_mappings = field_mappings_;
     include_filter_types = include_filter_types_;
   }
    : salesforce_chatter_feed_configuration)

let make_salesforce_custom_knowledge_article_type_configuration
    ?document_title_field_name:(document_title_field_name_ : data_source_field_name option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ~name:(name_ : salesforce_custom_knowledge_article_type_name)
    ~document_data_field_name:(document_data_field_name_ : data_source_field_name) () =
  ({
     name = name_;
     document_data_field_name = document_data_field_name_;
     document_title_field_name = document_title_field_name_;
     field_mappings = field_mappings_;
   }
    : salesforce_custom_knowledge_article_type_configuration)

let make_salesforce_standard_knowledge_article_type_configuration
    ?document_title_field_name:(document_title_field_name_ : data_source_field_name option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ~document_data_field_name:(document_data_field_name_ : data_source_field_name) () =
  ({
     document_data_field_name = document_data_field_name_;
     document_title_field_name = document_title_field_name_;
     field_mappings = field_mappings_;
   }
    : salesforce_standard_knowledge_article_type_configuration)

let make_salesforce_knowledge_article_configuration
    ?standard_knowledge_article_type_configuration:
      (standard_knowledge_article_type_configuration_ :
         salesforce_standard_knowledge_article_type_configuration option)
    ?custom_knowledge_article_type_configurations:
      (custom_knowledge_article_type_configurations_ :
         salesforce_custom_knowledge_article_type_configuration_list option)
    ~included_states:(included_states_ : salesforce_knowledge_article_state_list) () =
  ({
     included_states = included_states_;
     standard_knowledge_article_type_configuration = standard_knowledge_article_type_configuration_;
     custom_knowledge_article_type_configurations = custom_knowledge_article_type_configurations_;
   }
    : salesforce_knowledge_article_configuration)

let make_salesforce_standard_object_configuration
    ?document_title_field_name:(document_title_field_name_ : data_source_field_name option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ~name:(name_ : salesforce_standard_object_name)
    ~document_data_field_name:(document_data_field_name_ : data_source_field_name) () =
  ({
     name = name_;
     document_data_field_name = document_data_field_name_;
     document_title_field_name = document_title_field_name_;
     field_mappings = field_mappings_;
   }
    : salesforce_standard_object_configuration)

let make_salesforce_configuration
    ?standard_object_configurations:
      (standard_object_configurations_ : salesforce_standard_object_configuration_list option)
    ?knowledge_article_configuration:
      (knowledge_article_configuration_ : salesforce_knowledge_article_configuration option)
    ?chatter_feed_configuration:
      (chatter_feed_configuration_ : salesforce_chatter_feed_configuration option)
    ?crawl_attachments:(crawl_attachments_ : boolean_ option)
    ?standard_object_attachment_configuration:
      (standard_object_attachment_configuration_ :
         salesforce_standard_object_attachment_configuration option)
    ?include_attachment_file_patterns:
      (include_attachment_file_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclude_attachment_file_patterns:
      (exclude_attachment_file_patterns_ : data_source_inclusions_exclusions_strings option)
    ~server_url:(server_url_ : url) ~secret_arn:(secret_arn_ : secret_arn) () =
  ({
     server_url = server_url_;
     secret_arn = secret_arn_;
     standard_object_configurations = standard_object_configurations_;
     knowledge_article_configuration = knowledge_article_configuration_;
     chatter_feed_configuration = chatter_feed_configuration_;
     crawl_attachments = crawl_attachments_;
     standard_object_attachment_configuration = standard_object_attachment_configuration_;
     include_attachment_file_patterns = include_attachment_file_patterns_;
     exclude_attachment_file_patterns = exclude_attachment_file_patterns_;
   }
    : salesforce_configuration)

let make_sql_configuration
    ?query_identifiers_enclosing_option:
      (query_identifiers_enclosing_option_ : query_identifiers_enclosing_option option) () =
  ({ query_identifiers_enclosing_option = query_identifiers_enclosing_option_ } : sql_configuration)

let make_acl_configuration ~allowed_groups_column_name:(allowed_groups_column_name_ : column_name)
    () =
  ({ allowed_groups_column_name = allowed_groups_column_name_ } : acl_configuration)

let make_column_configuration
    ?document_title_column_name:(document_title_column_name_ : column_name option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ~document_id_column_name:(document_id_column_name_ : column_name)
    ~document_data_column_name:(document_data_column_name_ : column_name)
    ~change_detecting_columns:(change_detecting_columns_ : change_detecting_columns) () =
  ({
     document_id_column_name = document_id_column_name_;
     document_data_column_name = document_data_column_name_;
     document_title_column_name = document_title_column_name_;
     field_mappings = field_mappings_;
     change_detecting_columns = change_detecting_columns_;
   }
    : column_configuration)

let make_connection_configuration ~database_host:(database_host_ : database_host)
    ~database_port:(database_port_ : database_port) ~database_name:(database_name_ : database_name)
    ~table_name:(table_name_ : table_name) ~secret_arn:(secret_arn_ : secret_arn) () =
  ({
     database_host = database_host_;
     database_port = database_port_;
     database_name = database_name_;
     table_name = table_name_;
     secret_arn = secret_arn_;
   }
    : connection_configuration)

let make_database_configuration
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ?acl_configuration:(acl_configuration_ : acl_configuration option)
    ?sql_configuration:(sql_configuration_ : sql_configuration option)
    ~database_engine_type:(database_engine_type_ : database_engine_type)
    ~connection_configuration:(connection_configuration_ : connection_configuration)
    ~column_configuration:(column_configuration_ : column_configuration) () =
  ({
     database_engine_type = database_engine_type_;
     connection_configuration = connection_configuration_;
     vpc_configuration = vpc_configuration_;
     column_configuration = column_configuration_;
     acl_configuration = acl_configuration_;
     sql_configuration = sql_configuration_;
   }
    : database_configuration)

let make_share_point_configuration ?crawl_attachments:(crawl_attachments_ : boolean_ option)
    ?use_change_log:(use_change_log_ : boolean_ option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ?field_mappings:(field_mappings_ : data_source_to_index_field_mapping_list option)
    ?document_title_field_name:(document_title_field_name_ : data_source_field_name option)
    ?disable_local_groups:(disable_local_groups_ : boolean_ option)
    ?ssl_certificate_s3_path:(ssl_certificate_s3_path_ : s3_path option)
    ?authentication_type:(authentication_type_ : share_point_online_authentication_type option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ~share_point_version:(share_point_version_ : share_point_version)
    ~urls:(urls_ : share_point_url_list) ~secret_arn:(secret_arn_ : secret_arn) () =
  ({
     share_point_version = share_point_version_;
     urls = urls_;
     secret_arn = secret_arn_;
     crawl_attachments = crawl_attachments_;
     use_change_log = use_change_log_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     vpc_configuration = vpc_configuration_;
     field_mappings = field_mappings_;
     document_title_field_name = document_title_field_name_;
     disable_local_groups = disable_local_groups_;
     ssl_certificate_s3_path = ssl_certificate_s3_path_;
     authentication_type = authentication_type_;
     proxy_configuration = proxy_configuration_;
   }
    : share_point_configuration)

let make_access_control_list_configuration ?key_path:(key_path_ : s3_object_key option) () =
  ({ key_path = key_path_ } : access_control_list_configuration)

let make_documents_metadata_configuration ?s3_prefix:(s3_prefix_ : s3_object_key option) () =
  ({ s3_prefix = s3_prefix_ } : documents_metadata_configuration)

let make_s3_data_source_configuration
    ?inclusion_prefixes:(inclusion_prefixes_ : data_source_inclusions_exclusions_strings option)
    ?inclusion_patterns:(inclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?exclusion_patterns:(exclusion_patterns_ : data_source_inclusions_exclusions_strings option)
    ?documents_metadata_configuration:
      (documents_metadata_configuration_ : documents_metadata_configuration option)
    ?access_control_list_configuration:
      (access_control_list_configuration_ : access_control_list_configuration option)
    ~bucket_name:(bucket_name_ : s3_bucket_name) () =
  ({
     bucket_name = bucket_name_;
     inclusion_prefixes = inclusion_prefixes_;
     inclusion_patterns = inclusion_patterns_;
     exclusion_patterns = exclusion_patterns_;
     documents_metadata_configuration = documents_metadata_configuration_;
     access_control_list_configuration = access_control_list_configuration_;
   }
    : s3_data_source_configuration)

let make_data_source_configuration
    ?s3_configuration:(s3_configuration_ : s3_data_source_configuration option)
    ?share_point_configuration:(share_point_configuration_ : share_point_configuration option)
    ?database_configuration:(database_configuration_ : database_configuration option)
    ?salesforce_configuration:(salesforce_configuration_ : salesforce_configuration option)
    ?one_drive_configuration:(one_drive_configuration_ : one_drive_configuration option)
    ?service_now_configuration:(service_now_configuration_ : service_now_configuration option)
    ?confluence_configuration:(confluence_configuration_ : confluence_configuration option)
    ?google_drive_configuration:(google_drive_configuration_ : google_drive_configuration option)
    ?web_crawler_configuration:(web_crawler_configuration_ : web_crawler_configuration option)
    ?work_docs_configuration:(work_docs_configuration_ : work_docs_configuration option)
    ?fsx_configuration:(fsx_configuration_ : fsx_configuration option)
    ?slack_configuration:(slack_configuration_ : slack_configuration option)
    ?box_configuration:(box_configuration_ : box_configuration option)
    ?quip_configuration:(quip_configuration_ : quip_configuration option)
    ?jira_configuration:(jira_configuration_ : jira_configuration option)
    ?git_hub_configuration:(git_hub_configuration_ : git_hub_configuration option)
    ?alfresco_configuration:(alfresco_configuration_ : alfresco_configuration option)
    ?template_configuration:(template_configuration_ : template_configuration option) () =
  ({
     s3_configuration = s3_configuration_;
     share_point_configuration = share_point_configuration_;
     database_configuration = database_configuration_;
     salesforce_configuration = salesforce_configuration_;
     one_drive_configuration = one_drive_configuration_;
     service_now_configuration = service_now_configuration_;
     confluence_configuration = confluence_configuration_;
     google_drive_configuration = google_drive_configuration_;
     web_crawler_configuration = web_crawler_configuration_;
     work_docs_configuration = work_docs_configuration_;
     fsx_configuration = fsx_configuration_;
     slack_configuration = slack_configuration_;
     box_configuration = box_configuration_;
     quip_configuration = quip_configuration_;
     jira_configuration = jira_configuration_;
     git_hub_configuration = git_hub_configuration_;
     alfresco_configuration = alfresco_configuration_;
     template_configuration = template_configuration_;
   }
    : data_source_configuration)

let make_update_data_source_request ?name:(name_ : data_source_name option)
    ?configuration:(configuration_ : data_source_configuration option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ?description:(description_ : description option) ?schedule:(schedule_ : scan_schedule option)
    ?role_arn:(role_arn_ : role_arn option) ?language_code:(language_code_ : language_code option)
    ?custom_document_enrichment_configuration:
      (custom_document_enrichment_configuration_ : custom_document_enrichment_configuration option)
    ~id:(id_ : data_source_id) ~index_id:(index_id_ : index_id) () =
  ({
     id = id_;
     name = name_;
     index_id = index_id_;
     configuration = configuration_;
     vpc_configuration = vpc_configuration_;
     description = description_;
     schedule = schedule_;
     role_arn = role_arn_;
     language_code = language_code_;
     custom_document_enrichment_configuration = custom_document_enrichment_configuration_;
   }
    : update_data_source_request)

let make_update_access_control_configuration_response () = (() : unit)

let make_principal ?data_source_id:(data_source_id_ : data_source_id option)
    ~name:(name_ : principal_name) ~type_:(type__ : principal_type)
    ~access:(access_ : read_access_type) () =
  ({ name = name_; type_ = type__; access = access_; data_source_id = data_source_id_ } : principal)

let make_hierarchical_principal ~principal_list:(principal_list_ : principal_list) () =
  ({ principal_list = principal_list_ } : hierarchical_principal)

let make_update_access_control_configuration_request
    ?name:(name_ : access_control_configuration_name option)
    ?description:(description_ : description option)
    ?access_control_list:(access_control_list_ : principal_list option)
    ?hierarchical_access_control_list:
      (hierarchical_access_control_list_ : hierarchical_principal_list option)
    ~index_id:(index_id_ : index_id) ~id:(id_ : access_control_configuration_id) () =
  ({
     index_id = index_id_;
     id = id_;
     name = name_;
     description = description_;
     access_control_list = access_control_list_;
     hierarchical_access_control_list = hierarchical_access_control_list_;
   }
    : update_access_control_configuration_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_relevance_feedback ~result_id:(result_id_ : result_id)
    ~relevance_value:(relevance_value_ : relevance_type) () =
  ({ result_id = result_id_; relevance_value = relevance_value_ } : relevance_feedback)

let make_click_feedback ~result_id:(result_id_ : result_id) ~click_time:(click_time_ : timestamp) ()
    =
  ({ result_id = result_id_; click_time = click_time_ } : click_feedback)

let make_submit_feedback_request
    ?click_feedback_items:(click_feedback_items_ : click_feedback_list option)
    ?relevance_feedback_items:(relevance_feedback_items_ : relevance_feedback_list option)
    ~index_id:(index_id_ : index_id) ~query_id:(query_id_ : query_id) () =
  ({
     index_id = index_id_;
     query_id = query_id_;
     click_feedback_items = click_feedback_items_;
     relevance_feedback_items = relevance_feedback_items_;
   }
    : submit_feedback_request)

let make_stop_data_source_sync_job_request ~id:(id_ : data_source_id)
    ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : stop_data_source_sync_job_request)

let make_start_data_source_sync_job_response ?execution_id:(execution_id_ : string_ option) () =
  ({ execution_id = execution_id_ } : start_data_source_sync_job_response)

let make_start_data_source_sync_job_request ~id:(id_ : data_source_id)
    ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : start_data_source_sync_job_request)

let make_score_attributes ?score_confidence:(score_confidence_ : score_confidence option) () =
  ({ score_confidence = score_confidence_ } : score_attributes)

let make_document_attribute ~key:(key_ : document_attribute_key)
    ~value:(value_ : document_attribute_value) () =
  ({ key = key_; value = value_ } : document_attribute)

let make_retrieve_result_item ?id:(id_ : result_id option)
    ?document_id:(document_id_ : document_id option)
    ?document_title:(document_title_ : document_title option) ?content:(content_ : content option)
    ?document_ur_i:(document_ur_i_ : url option)
    ?document_attributes:(document_attributes_ : document_attribute_list option)
    ?score_attributes:(score_attributes_ : score_attributes option) () =
  ({
     id = id_;
     document_id = document_id_;
     document_title = document_title_;
     content = content_;
     document_ur_i = document_ur_i_;
     document_attributes = document_attributes_;
     score_attributes = score_attributes_;
   }
    : retrieve_result_item)

let make_data_source_group ~group_id:(group_id_ : principal_name)
    ~data_source_id:(data_source_id_ : data_source_id) () =
  ({ group_id = group_id_; data_source_id = data_source_id_ } : data_source_group)

let make_user_context ?token:(token_ : token option) ?user_id:(user_id_ : principal_name option)
    ?groups:(groups_ : groups option)
    ?data_source_groups:(data_source_groups_ : data_source_groups option) () =
  ({
     token = token_;
     user_id = user_id_;
     groups = groups_;
     data_source_groups = data_source_groups_;
   }
    : user_context)

let make_document_relevance_configuration ~name:(name_ : document_metadata_configuration_name)
    ~relevance:(relevance_ : relevance) () =
  ({ name = name_; relevance = relevance_ } : document_relevance_configuration)

let make_attribute_filter ?and_all_filters:(and_all_filters_ : attribute_filter_list option)
    ?or_all_filters:(or_all_filters_ : attribute_filter_list option)
    ?not_filter:(not_filter_ : attribute_filter option)
    ?equals_to:(equals_to_ : document_attribute option)
    ?contains_all:(contains_all_ : document_attribute option)
    ?contains_any:(contains_any_ : document_attribute option)
    ?greater_than:(greater_than_ : document_attribute option)
    ?greater_than_or_equals:(greater_than_or_equals_ : document_attribute option)
    ?less_than:(less_than_ : document_attribute option)
    ?less_than_or_equals:(less_than_or_equals_ : document_attribute option) () =
  ({
     and_all_filters = and_all_filters_;
     or_all_filters = or_all_filters_;
     not_filter = not_filter_;
     equals_to = equals_to_;
     contains_all = contains_all_;
     contains_any = contains_any_;
     greater_than = greater_than_;
     greater_than_or_equals = greater_than_or_equals_;
     less_than = less_than_;
     less_than_or_equals = less_than_or_equals_;
   }
    : attribute_filter)

let make_retrieve_request ?attribute_filter:(attribute_filter_ : attribute_filter option)
    ?requested_document_attributes:
      (requested_document_attributes_ : document_attribute_key_list option)
    ?document_relevance_override_configurations:
      (document_relevance_override_configurations_ :
         document_relevance_override_configuration_list option)
    ?page_number:(page_number_ : integer option) ?page_size:(page_size_ : integer option)
    ?user_context:(user_context_ : user_context option) ~index_id:(index_id_ : index_id)
    ~query_text:(query_text_ : query_text) () =
  ({
     index_id = index_id_;
     query_text = query_text_;
     attribute_filter = attribute_filter_;
     requested_document_attributes = requested_document_attributes_;
     document_relevance_override_configurations = document_relevance_override_configurations_;
     page_number = page_number_;
     page_size = page_size_;
     user_context = user_context_;
   }
    : retrieve_request)

let make_highlight ?top_answer:(top_answer_ : boolean_ option)
    ?type_:(type__ : highlight_type option) ~begin_offset:(begin_offset_ : integer)
    ~end_offset:(end_offset_ : integer) () =
  ({
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     top_answer = top_answer_;
     type_ = type__;
   }
    : highlight)

let make_text_with_highlights ?text:(text_ : string_ option)
    ?highlights:(highlights_ : highlight_list option) () =
  ({ text = text_; highlights = highlights_ } : text_with_highlights)

let make_additional_result_attribute_value
    ?text_with_highlights_value:(text_with_highlights_value_ : text_with_highlights option) () =
  ({ text_with_highlights_value = text_with_highlights_value_ } : additional_result_attribute_value)

let make_additional_result_attribute ~key:(key_ : string_)
    ~value_type:(value_type_ : additional_result_attribute_value_type)
    ~value:(value_ : additional_result_attribute_value) () =
  ({ key = key_; value_type = value_type_; value = value_ } : additional_result_attribute)

let make_featured_results_item ?id:(id_ : result_id option)
    ?type_:(type__ : query_result_type option)
    ?additional_attributes:(additional_attributes_ : additional_result_attribute_list option)
    ?document_id:(document_id_ : document_id option)
    ?document_title:(document_title_ : text_with_highlights option)
    ?document_excerpt:(document_excerpt_ : text_with_highlights option)
    ?document_ur_i:(document_ur_i_ : url option)
    ?document_attributes:(document_attributes_ : document_attribute_list option)
    ?feedback_token:(feedback_token_ : feedback_token option) () =
  ({
     id = id_;
     type_ = type__;
     additional_attributes = additional_attributes_;
     document_id = document_id_;
     document_title = document_title_;
     document_excerpt = document_excerpt_;
     document_ur_i = document_ur_i_;
     document_attributes = document_attributes_;
     feedback_token = feedback_token_;
   }
    : featured_results_item)

let make_correction ?begin_offset:(begin_offset_ : integer option)
    ?end_offset:(end_offset_ : integer option) ?term:(term_ : string_ option)
    ?corrected_term:(corrected_term_ : string_ option) () =
  ({
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     term = term_;
     corrected_term = corrected_term_;
   }
    : correction)

let make_spell_corrected_query
    ?suggested_query_text:(suggested_query_text_ : suggested_query_text option)
    ?corrections:(corrections_ : correction_list option) () =
  ({ suggested_query_text = suggested_query_text_; corrections = corrections_ }
    : spell_corrected_query)

let make_warning ?message:(message_ : warning_message option) ?code:(code_ : warning_code option) ()
    =
  ({ message = message_; code = code_ } : warning)

let make_document_attribute_value_count_pair
    ?document_attribute_value:(document_attribute_value_ : document_attribute_value option)
    ?count:(count_ : integer option) ?facet_results:(facet_results_ : facet_result_list option) () =
  ({
     document_attribute_value = document_attribute_value_;
     count = count_;
     facet_results = facet_results_;
   }
    : document_attribute_value_count_pair)

let make_expanded_result_item ?id:(id_ : result_id option)
    ?document_id:(document_id_ : document_id option)
    ?document_title:(document_title_ : text_with_highlights option)
    ?document_excerpt:(document_excerpt_ : text_with_highlights option)
    ?document_ur_i:(document_ur_i_ : url option)
    ?document_attributes:(document_attributes_ : document_attribute_list option) () =
  ({
     id = id_;
     document_id = document_id_;
     document_title = document_title_;
     document_excerpt = document_excerpt_;
     document_ur_i = document_ur_i_;
     document_attributes = document_attributes_;
   }
    : expanded_result_item)

let make_collapsed_result_detail ?expanded_results:(expanded_results_ : expanded_result_list option)
    ~document_attribute:(document_attribute_ : document_attribute) () =
  ({ document_attribute = document_attribute_; expanded_results = expanded_results_ }
    : collapsed_result_detail)

let make_table_cell ?value:(value_ : string_ option) ?top_answer:(top_answer_ : boolean_ option)
    ?highlighted:(highlighted_ : boolean_ option) ?header:(header_ : boolean_ option) () =
  ({ value = value_; top_answer = top_answer_; highlighted = highlighted_; header = header_ }
    : table_cell)

let make_table_row ?cells:(cells_ : table_cell_list option) () = ({ cells = cells_ } : table_row)

let make_table_excerpt ?rows:(rows_ : table_row_list option)
    ?total_number_of_rows:(total_number_of_rows_ : integer option) () =
  ({ rows = rows_; total_number_of_rows = total_number_of_rows_ } : table_excerpt)

let make_query_result_item ?id:(id_ : result_id option) ?type_:(type__ : query_result_type option)
    ?format:(format_ : query_result_format option)
    ?additional_attributes:(additional_attributes_ : additional_result_attribute_list option)
    ?document_id:(document_id_ : document_id option)
    ?document_title:(document_title_ : text_with_highlights option)
    ?document_excerpt:(document_excerpt_ : text_with_highlights option)
    ?document_ur_i:(document_ur_i_ : url option)
    ?document_attributes:(document_attributes_ : document_attribute_list option)
    ?score_attributes:(score_attributes_ : score_attributes option)
    ?feedback_token:(feedback_token_ : feedback_token option)
    ?table_excerpt:(table_excerpt_ : table_excerpt option)
    ?collapsed_result_detail:(collapsed_result_detail_ : collapsed_result_detail option) () =
  ({
     id = id_;
     type_ = type__;
     format = format_;
     additional_attributes = additional_attributes_;
     document_id = document_id_;
     document_title = document_title_;
     document_excerpt = document_excerpt_;
     document_ur_i = document_ur_i_;
     document_attributes = document_attributes_;
     score_attributes = score_attributes_;
     feedback_token = feedback_token_;
     table_excerpt = table_excerpt_;
     collapsed_result_detail = collapsed_result_detail_;
   }
    : query_result_item)

let make_expand_configuration
    ?max_result_items_to_expand:(max_result_items_to_expand_ : integer option)
    ?max_expanded_results_per_item:(max_expanded_results_per_item_ : integer option) () =
  ({
     max_result_items_to_expand = max_result_items_to_expand_;
     max_expanded_results_per_item = max_expanded_results_per_item_;
   }
    : expand_configuration)

let make_sorting_configuration
    ~document_attribute_key:(document_attribute_key_ : document_attribute_key)
    ~sort_order:(sort_order_ : sort_order) () =
  ({ document_attribute_key = document_attribute_key_; sort_order = sort_order_ }
    : sorting_configuration)

let make_collapse_configuration
    ?sorting_configurations:(sorting_configurations_ : sorting_configuration_list option)
    ?missing_attribute_key_strategy:
      (missing_attribute_key_strategy_ : missing_attribute_key_strategy option)
    ?expand:(expand_ : boolean_ option)
    ?expand_configuration:(expand_configuration_ : expand_configuration option)
    ~document_attribute_key:(document_attribute_key_ : document_attribute_key) () =
  ({
     document_attribute_key = document_attribute_key_;
     sorting_configurations = sorting_configurations_;
     missing_attribute_key_strategy = missing_attribute_key_strategy_;
     expand = expand_;
     expand_configuration = expand_configuration_;
   }
    : collapse_configuration)

let make_spell_correction_configuration
    ~include_query_spell_check_suggestions:(include_query_spell_check_suggestions_ : boolean_) () =
  ({ include_query_spell_check_suggestions = include_query_spell_check_suggestions_ }
    : spell_correction_configuration)

let make_facet ?document_attribute_key:(document_attribute_key_ : document_attribute_key option)
    ?facets:(facets_ : facet_list option)
    ?max_results:(max_results_ : top_document_attribute_value_count_pairs_size option) () =
  ({
     document_attribute_key = document_attribute_key_;
     facets = facets_;
     max_results = max_results_;
   }
    : facet)

let make_query_request ?query_text:(query_text_ : query_text option)
    ?attribute_filter:(attribute_filter_ : attribute_filter option)
    ?facets:(facets_ : facet_list option)
    ?requested_document_attributes:
      (requested_document_attributes_ : document_attribute_key_list option)
    ?query_result_type_filter:(query_result_type_filter_ : query_result_type option)
    ?document_relevance_override_configurations:
      (document_relevance_override_configurations_ :
         document_relevance_override_configuration_list option)
    ?page_number:(page_number_ : integer option) ?page_size:(page_size_ : integer option)
    ?sorting_configuration:(sorting_configuration_ : sorting_configuration option)
    ?sorting_configurations:(sorting_configurations_ : sorting_configuration_list option)
    ?user_context:(user_context_ : user_context option)
    ?visitor_id:(visitor_id_ : visitor_id option)
    ?spell_correction_configuration:
      (spell_correction_configuration_ : spell_correction_configuration option)
    ?collapse_configuration:(collapse_configuration_ : collapse_configuration option)
    ~index_id:(index_id_ : index_id) () =
  ({
     index_id = index_id_;
     query_text = query_text_;
     attribute_filter = attribute_filter_;
     facets = facets_;
     requested_document_attributes = requested_document_attributes_;
     query_result_type_filter = query_result_type_filter_;
     document_relevance_override_configurations = document_relevance_override_configurations_;
     page_number = page_number_;
     page_size = page_size_;
     sorting_configuration = sorting_configuration_;
     sorting_configurations = sorting_configurations_;
     user_context = user_context_;
     visitor_id = visitor_id_;
     spell_correction_configuration = spell_correction_configuration_;
     collapse_configuration = collapse_configuration_;
   }
    : query_request)

let make_member_user ~user_id:(user_id_ : user_id) () = ({ user_id = user_id_ } : member_user)

let make_member_group ?data_source_id:(data_source_id_ : data_source_id option)
    ~group_id:(group_id_ : group_id) () =
  ({ group_id = group_id_; data_source_id = data_source_id_ } : member_group)

let make_group_members ?member_groups:(member_groups_ : member_groups option)
    ?member_users:(member_users_ : member_users option)
    ?s3_pathfor_group_members:(s3_pathfor_group_members_ : s3_path option) () =
  ({
     member_groups = member_groups_;
     member_users = member_users_;
     s3_pathfor_group_members = s3_pathfor_group_members_;
   }
    : group_members)

let make_put_principal_mapping_request ?data_source_id:(data_source_id_ : data_source_id option)
    ?ordering_id:(ordering_id_ : principal_ordering_id option)
    ?role_arn:(role_arn_ : role_arn option) ~index_id:(index_id_ : index_id)
    ~group_id:(group_id_ : group_id) ~group_members:(group_members_ : group_members) () =
  ({
     index_id = index_id_;
     data_source_id = data_source_id_;
     group_id = group_id_;
     group_members = group_members_;
     ordering_id = ordering_id_;
     role_arn = role_arn_;
   }
    : put_principal_mapping_request)

let make_thesaurus_summary ?id:(id_ : thesaurus_id option) ?name:(name_ : thesaurus_name option)
    ?status:(status_ : thesaurus_status option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) () =
  ({ id = id_; name = name_; status = status_; created_at = created_at_; updated_at = updated_at_ }
    : thesaurus_summary)

let make_list_thesauri_response ?next_token:(next_token_ : next_token option)
    ?thesaurus_summary_items:(thesaurus_summary_items_ : thesaurus_summary_items option) () =
  ({ next_token = next_token_; thesaurus_summary_items = thesaurus_summary_items_ }
    : list_thesauri_response)

let make_list_thesauri_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_thesauri_request option)
    ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_; next_token = next_token_; max_results = max_results_ }
    : list_thesauri_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_query_suggestions_block_list_summary ?id:(id_ : query_suggestions_block_list_id option)
    ?name:(name_ : query_suggestions_block_list_name option)
    ?status:(status_ : query_suggestions_block_list_status option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?item_count:(item_count_ : integer option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
     item_count = item_count_;
   }
    : query_suggestions_block_list_summary)

let make_list_query_suggestions_block_lists_response
    ?block_list_summary_items:
      (block_list_summary_items_ : query_suggestions_block_list_summary_items option)
    ?next_token:(next_token_ : next_token option) () =
  ({ block_list_summary_items = block_list_summary_items_; next_token = next_token_ }
    : list_query_suggestions_block_lists_response)

let make_list_query_suggestions_block_lists_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_query_suggestions_block_lists option)
    ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_; next_token = next_token_; max_results = max_results_ }
    : list_query_suggestions_block_lists_request)

let make_index_configuration_summary ?name:(name_ : index_name option) ?id:(id_ : index_id option)
    ?edition:(edition_ : index_edition option) ~created_at:(created_at_ : timestamp)
    ~updated_at:(updated_at_ : timestamp) ~status:(status_ : index_status) () =
  ({
     name = name_;
     id = id_;
     edition = edition_;
     created_at = created_at_;
     updated_at = updated_at_;
     status = status_;
   }
    : index_configuration_summary)

let make_list_indices_response
    ?index_configuration_summary_items:
      (index_configuration_summary_items_ : index_configuration_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     index_configuration_summary_items = index_configuration_summary_items_;
     next_token = next_token_;
   }
    : list_indices_response)

let make_list_indices_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_indices_request option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_indices_request)

let make_group_summary ?group_id:(group_id_ : group_id option)
    ?ordering_id:(ordering_id_ : principal_ordering_id option) () =
  ({ group_id = group_id_; ordering_id = ordering_id_ } : group_summary)

let make_list_groups_older_than_ordering_id_response
    ?groups_summaries:(groups_summaries_ : list_of_group_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ groups_summaries = groups_summaries_; next_token = next_token_ }
    : list_groups_older_than_ordering_id_response)

let make_list_groups_older_than_ordering_id_request
    ?data_source_id:(data_source_id_ : data_source_id option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_principals_request option)
    ~index_id:(index_id_ : index_id) ~ordering_id:(ordering_id_ : principal_ordering_id) () =
  ({
     index_id = index_id_;
     data_source_id = data_source_id_;
     ordering_id = ordering_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_groups_older_than_ordering_id_request)

let make_featured_results_set_summary
    ?featured_results_set_id:(featured_results_set_id_ : featured_results_set_id option)
    ?featured_results_set_name:(featured_results_set_name_ : featured_results_set_name option)
    ?status:(status_ : featured_results_set_status option)
    ?last_updated_timestamp:(last_updated_timestamp_ : long option)
    ?creation_timestamp:(creation_timestamp_ : long option) () =
  ({
     featured_results_set_id = featured_results_set_id_;
     featured_results_set_name = featured_results_set_name_;
     status = status_;
     last_updated_timestamp = last_updated_timestamp_;
     creation_timestamp = creation_timestamp_;
   }
    : featured_results_set_summary)

let make_list_featured_results_sets_response
    ?featured_results_set_summary_items:
      (featured_results_set_summary_items_ : featured_results_set_summary_items option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     featured_results_set_summary_items = featured_results_set_summary_items_;
     next_token = next_token_;
   }
    : list_featured_results_sets_response)

let make_list_featured_results_sets_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_featured_results_sets_request option)
    ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_; next_token = next_token_; max_results = max_results_ }
    : list_featured_results_sets_request)

let make_faq_summary ?id:(id_ : faq_id option) ?name:(name_ : faq_name option)
    ?status:(status_ : faq_status option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option)
    ?file_format:(file_format_ : faq_file_format option)
    ?language_code:(language_code_ : language_code option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
     file_format = file_format_;
     language_code = language_code_;
   }
    : faq_summary)

let make_list_faqs_response ?next_token:(next_token_ : next_token option)
    ?faq_summary_items:(faq_summary_items_ : faq_summary_items option) () =
  ({ next_token = next_token_; faq_summary_items = faq_summary_items_ } : list_faqs_response)

let make_list_faqs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_faqs_request option)
    ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_; next_token = next_token_; max_results = max_results_ }
    : list_faqs_request)

let make_experience_endpoint ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?endpoint:(endpoint_ : endpoint option) () =
  ({ endpoint_type = endpoint_type_; endpoint = endpoint_ } : experience_endpoint)

let make_experiences_summary ?name:(name_ : experience_name option) ?id:(id_ : experience_id option)
    ?created_at:(created_at_ : timestamp option) ?status:(status_ : experience_status option)
    ?endpoints:(endpoints_ : experience_endpoints option) () =
  ({ name = name_; id = id_; created_at = created_at_; status = status_; endpoints = endpoints_ }
    : experiences_summary)

let make_list_experiences_response ?summary_items:(summary_items_ : experiences_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summary_items = summary_items_; next_token = next_token_ } : list_experiences_response)

let make_list_experiences_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_experiences_request option)
    ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_; next_token = next_token_; max_results = max_results_ }
    : list_experiences_request)

let make_entity_display_data ?user_name:(user_name_ : name_type option)
    ?group_name:(group_name_ : name_type option)
    ?identified_user_name:(identified_user_name_ : name_type option)
    ?first_name:(first_name_ : name_type option) ?last_name:(last_name_ : name_type option) () =
  ({
     user_name = user_name_;
     group_name = group_name_;
     identified_user_name = identified_user_name_;
     first_name = first_name_;
     last_name = last_name_;
   }
    : entity_display_data)

let make_experience_entities_summary ?entity_id:(entity_id_ : entity_id option)
    ?entity_type:(entity_type_ : entity_type option)
    ?display_data:(display_data_ : entity_display_data option) () =
  ({ entity_id = entity_id_; entity_type = entity_type_; display_data = display_data_ }
    : experience_entities_summary)

let make_list_experience_entities_response
    ?summary_items:(summary_items_ : experience_entities_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summary_items = summary_items_; next_token = next_token_ } : list_experience_entities_response)

let make_list_experience_entities_request ?next_token:(next_token_ : next_token option)
    ~id:(id_ : experience_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_; next_token = next_token_ } : list_experience_entities_request)

let make_personas_summary ?entity_id:(entity_id_ : entity_id option)
    ?persona:(persona_ : persona option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) () =
  ({
     entity_id = entity_id_;
     persona = persona_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : personas_summary)

let make_list_entity_personas_response
    ?summary_items:(summary_items_ : personas_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summary_items = summary_items_; next_token = next_token_ } : list_entity_personas_response)

let make_list_entity_personas_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_entity_personas_request option)
    ~id:(id_ : experience_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_; next_token = next_token_; max_results = max_results_ }
    : list_entity_personas_request)

let make_data_source_sync_job_metrics ?documents_added:(documents_added_ : metric_value option)
    ?documents_modified:(documents_modified_ : metric_value option)
    ?documents_deleted:(documents_deleted_ : metric_value option)
    ?documents_failed:(documents_failed_ : metric_value option)
    ?documents_scanned:(documents_scanned_ : metric_value option) () =
  ({
     documents_added = documents_added_;
     documents_modified = documents_modified_;
     documents_deleted = documents_deleted_;
     documents_failed = documents_failed_;
     documents_scanned = documents_scanned_;
   }
    : data_source_sync_job_metrics)

let make_data_source_sync_job ?execution_id:(execution_id_ : string_ option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?status:(status_ : data_source_sync_job_status option)
    ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option)
    ?data_source_error_code:(data_source_error_code_ : string_ option)
    ?metrics:(metrics_ : data_source_sync_job_metrics option) () =
  ({
     execution_id = execution_id_;
     start_time = start_time_;
     end_time = end_time_;
     status = status_;
     error_message = error_message_;
     error_code = error_code_;
     data_source_error_code = data_source_error_code_;
     metrics = metrics_;
   }
    : data_source_sync_job)

let make_list_data_source_sync_jobs_response
    ?history:(history_ : data_source_sync_job_history_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ history = history_; next_token = next_token_ } : list_data_source_sync_jobs_response)

let make_time_range ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) () =
  ({ start_time = start_time_; end_time = end_time_ } : time_range)

let make_list_data_source_sync_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_data_source_sync_jobs_request option)
    ?start_time_filter:(start_time_filter_ : time_range option)
    ?status_filter:(status_filter_ : data_source_sync_job_status option) ~id:(id_ : data_source_id)
    ~index_id:(index_id_ : index_id) () =
  ({
     id = id_;
     index_id = index_id_;
     next_token = next_token_;
     max_results = max_results_;
     start_time_filter = start_time_filter_;
     status_filter = status_filter_;
   }
    : list_data_source_sync_jobs_request)

let make_data_source_summary ?name:(name_ : data_source_name option)
    ?id:(id_ : data_source_id option) ?type_:(type__ : data_source_type option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?status:(status_ : data_source_status option)
    ?language_code:(language_code_ : language_code option) () =
  ({
     name = name_;
     id = id_;
     type_ = type__;
     created_at = created_at_;
     updated_at = updated_at_;
     status = status_;
     language_code = language_code_;
   }
    : data_source_summary)

let make_list_data_sources_response
    ?summary_items:(summary_items_ : data_source_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summary_items = summary_items_; next_token = next_token_ } : list_data_sources_response)

let make_list_data_sources_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer_for_list_data_sources_request option)
    ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_; next_token = next_token_; max_results = max_results_ }
    : list_data_sources_request)

let make_access_control_configuration_summary ~id:(id_ : access_control_configuration_id) () =
  ({ id = id_ } : access_control_configuration_summary)

let make_list_access_control_configurations_response ?next_token:(next_token_ : string_ option)
    ~access_control_configurations:
      (access_control_configurations_ : access_control_configuration_summary_list) () =
  ({ next_token = next_token_; access_control_configurations = access_control_configurations_ }
    : list_access_control_configurations_response)

let make_list_access_control_configurations_request ?next_token:(next_token_ : string_ option)
    ?max_results:
      (max_results_ : max_results_integer_for_list_access_control_configurations_request option)
    ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_; next_token = next_token_; max_results = max_results_ }
    : list_access_control_configurations_request)

let make_get_snapshots_response ?snap_shot_time_filter:(snap_shot_time_filter_ : time_range option)
    ?snapshots_data_header:(snapshots_data_header_ : snapshots_data_header_fields option)
    ?snapshots_data:(snapshots_data_ : snapshots_data_records option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     snap_shot_time_filter = snap_shot_time_filter_;
     snapshots_data_header = snapshots_data_header_;
     snapshots_data = snapshots_data_;
     next_token = next_token_;
   }
    : get_snapshots_response)

let make_get_snapshots_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : integer option) ~index_id:(index_id_ : index_id)
    ~interval:(interval_ : interval) ~metric_type:(metric_type_ : metric_type) () =
  ({
     index_id = index_id_;
     interval = interval_;
     metric_type = metric_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_snapshots_request)

let make_source_document ?document_id:(document_id_ : string_ option)
    ?suggestion_attributes:(suggestion_attributes_ : document_attribute_key_list option)
    ?additional_attributes:(additional_attributes_ : document_attribute_list option) () =
  ({
     document_id = document_id_;
     suggestion_attributes = suggestion_attributes_;
     additional_attributes = additional_attributes_;
   }
    : source_document)

let make_suggestion_highlight ?begin_offset:(begin_offset_ : integer option)
    ?end_offset:(end_offset_ : integer option) () =
  ({ begin_offset = begin_offset_; end_offset = end_offset_ } : suggestion_highlight)

let make_suggestion_text_with_highlights ?text:(text_ : string_ option)
    ?highlights:(highlights_ : suggestion_highlight_list option) () =
  ({ text = text_; highlights = highlights_ } : suggestion_text_with_highlights)

let make_suggestion_value ?text:(text_ : suggestion_text_with_highlights option) () =
  ({ text = text_ } : suggestion_value)

let make_suggestion ?id:(id_ : result_id option) ?value:(value_ : suggestion_value option)
    ?source_documents:(source_documents_ : source_documents option) () =
  ({ id = id_; value = value_; source_documents = source_documents_ } : suggestion)

let make_get_query_suggestions_response
    ?query_suggestions_id:(query_suggestions_id_ : query_suggestions_id option)
    ?suggestions:(suggestions_ : suggestion_list option) () =
  ({ query_suggestions_id = query_suggestions_id_; suggestions = suggestions_ }
    : get_query_suggestions_response)

let make_attribute_suggestions_get_config
    ?suggestion_attributes:(suggestion_attributes_ : document_attribute_key_list option)
    ?additional_response_attributes:
      (additional_response_attributes_ : document_attribute_key_list option)
    ?attribute_filter:(attribute_filter_ : attribute_filter option)
    ?user_context:(user_context_ : user_context option) () =
  ({
     suggestion_attributes = suggestion_attributes_;
     additional_response_attributes = additional_response_attributes_;
     attribute_filter = attribute_filter_;
     user_context = user_context_;
   }
    : attribute_suggestions_get_config)

let make_get_query_suggestions_request
    ?max_suggestions_count:(max_suggestions_count_ : integer option)
    ?suggestion_types:(suggestion_types_ : suggestion_types option)
    ?attribute_suggestions_config:
      (attribute_suggestions_config_ : attribute_suggestions_get_config option)
    ~index_id:(index_id_ : index_id) ~query_text:(query_text_ : suggestion_query_text) () =
  ({
     index_id = index_id_;
     query_text = query_text_;
     max_suggestions_count = max_suggestions_count_;
     suggestion_types = suggestion_types_;
     attribute_suggestions_config = attribute_suggestions_config_;
   }
    : get_query_suggestions_request)

let make_failed_entity ?entity_id:(entity_id_ : entity_id option)
    ?error_message:(error_message_ : error_message option) () =
  ({ entity_id = entity_id_; error_message = error_message_ } : failed_entity)

let make_disassociate_personas_from_entities_response
    ?failed_entity_list:(failed_entity_list_ : failed_entity_list option) () =
  ({ failed_entity_list = failed_entity_list_ } : disassociate_personas_from_entities_response)

let make_disassociate_personas_from_entities_request ~id:(id_ : experience_id)
    ~index_id:(index_id_ : index_id) ~entity_ids:(entity_ids_ : entity_ids_list) () =
  ({ id = id_; index_id = index_id_; entity_ids = entity_ids_ }
    : disassociate_personas_from_entities_request)

let make_disassociate_entities_from_experience_response
    ?failed_entity_list:(failed_entity_list_ : failed_entity_list option) () =
  ({ failed_entity_list = failed_entity_list_ } : disassociate_entities_from_experience_response)

let make_entity_configuration ~entity_id:(entity_id_ : entity_id)
    ~entity_type:(entity_type_ : entity_type) () =
  ({ entity_id = entity_id_; entity_type = entity_type_ } : entity_configuration)

let make_disassociate_entities_from_experience_request ~id:(id_ : experience_id)
    ~index_id:(index_id_ : index_id) ~entity_list:(entity_list_ : disassociate_entity_list) () =
  ({ id = id_; index_id = index_id_; entity_list = entity_list_ }
    : disassociate_entities_from_experience_request)

let make_describe_thesaurus_response ?id:(id_ : thesaurus_id option)
    ?index_id:(index_id_ : index_id option) ?name:(name_ : thesaurus_name option)
    ?description:(description_ : description option) ?status:(status_ : thesaurus_status option)
    ?error_message:(error_message_ : error_message option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?role_arn:(role_arn_ : role_arn option) ?source_s3_path:(source_s3_path_ : s3_path option)
    ?file_size_bytes:(file_size_bytes_ : long option) ?term_count:(term_count_ : long option)
    ?synonym_rule_count:(synonym_rule_count_ : long option) () =
  ({
     id = id_;
     index_id = index_id_;
     name = name_;
     description = description_;
     status = status_;
     error_message = error_message_;
     created_at = created_at_;
     updated_at = updated_at_;
     role_arn = role_arn_;
     source_s3_path = source_s3_path_;
     file_size_bytes = file_size_bytes_;
     term_count = term_count_;
     synonym_rule_count = synonym_rule_count_;
   }
    : describe_thesaurus_response)

let make_describe_thesaurus_request ~id:(id_ : thesaurus_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : describe_thesaurus_request)

let make_attribute_suggestions_describe_config
    ?suggestable_config_list:(suggestable_config_list_ : suggestable_config_list option)
    ?attribute_suggestions_mode:(attribute_suggestions_mode_ : attribute_suggestions_mode option) ()
    =
  ({
     suggestable_config_list = suggestable_config_list_;
     attribute_suggestions_mode = attribute_suggestions_mode_;
   }
    : attribute_suggestions_describe_config)

let make_describe_query_suggestions_config_response ?mode:(mode_ : mode option)
    ?status:(status_ : query_suggestions_status option)
    ?query_log_look_back_window_in_days:(query_log_look_back_window_in_days_ : integer option)
    ?include_queries_without_user_information:
      (include_queries_without_user_information_ : object_boolean option)
    ?minimum_number_of_querying_users:
      (minimum_number_of_querying_users_ : minimum_number_of_querying_users option)
    ?minimum_query_count:(minimum_query_count_ : minimum_query_count option)
    ?last_suggestions_build_time:(last_suggestions_build_time_ : timestamp option)
    ?last_clear_time:(last_clear_time_ : timestamp option)
    ?total_suggestions_count:(total_suggestions_count_ : integer option)
    ?attribute_suggestions_config:
      (attribute_suggestions_config_ : attribute_suggestions_describe_config option) () =
  ({
     mode = mode_;
     status = status_;
     query_log_look_back_window_in_days = query_log_look_back_window_in_days_;
     include_queries_without_user_information = include_queries_without_user_information_;
     minimum_number_of_querying_users = minimum_number_of_querying_users_;
     minimum_query_count = minimum_query_count_;
     last_suggestions_build_time = last_suggestions_build_time_;
     last_clear_time = last_clear_time_;
     total_suggestions_count = total_suggestions_count_;
     attribute_suggestions_config = attribute_suggestions_config_;
   }
    : describe_query_suggestions_config_response)

let make_describe_query_suggestions_config_request ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_ } : describe_query_suggestions_config_request)

let make_describe_query_suggestions_block_list_response ?index_id:(index_id_ : index_id option)
    ?id:(id_ : query_suggestions_block_list_id option)
    ?name:(name_ : query_suggestions_block_list_name option)
    ?description:(description_ : description option)
    ?status:(status_ : query_suggestions_block_list_status option)
    ?error_message:(error_message_ : error_message option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?source_s3_path:(source_s3_path_ : s3_path option) ?item_count:(item_count_ : integer option)
    ?file_size_bytes:(file_size_bytes_ : long option) ?role_arn:(role_arn_ : role_arn option) () =
  ({
     index_id = index_id_;
     id = id_;
     name = name_;
     description = description_;
     status = status_;
     error_message = error_message_;
     created_at = created_at_;
     updated_at = updated_at_;
     source_s3_path = source_s3_path_;
     item_count = item_count_;
     file_size_bytes = file_size_bytes_;
     role_arn = role_arn_;
   }
    : describe_query_suggestions_block_list_response)

let make_describe_query_suggestions_block_list_request ~index_id:(index_id_ : index_id)
    ~id:(id_ : query_suggestions_block_list_id) () =
  ({ index_id = index_id_; id = id_ } : describe_query_suggestions_block_list_request)

let make_group_ordering_id_summary ?status:(status_ : principal_mapping_status option)
    ?last_updated_at:(last_updated_at_ : timestamp option)
    ?received_at:(received_at_ : timestamp option)
    ?ordering_id:(ordering_id_ : principal_ordering_id option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     status = status_;
     last_updated_at = last_updated_at_;
     received_at = received_at_;
     ordering_id = ordering_id_;
     failure_reason = failure_reason_;
   }
    : group_ordering_id_summary)

let make_describe_principal_mapping_response ?index_id:(index_id_ : index_id option)
    ?data_source_id:(data_source_id_ : data_source_id option)
    ?group_id:(group_id_ : group_id option)
    ?group_ordering_id_summaries:(group_ordering_id_summaries_ : group_ordering_id_summaries option)
    () =
  ({
     index_id = index_id_;
     data_source_id = data_source_id_;
     group_id = group_id_;
     group_ordering_id_summaries = group_ordering_id_summaries_;
   }
    : describe_principal_mapping_response)

let make_describe_principal_mapping_request
    ?data_source_id:(data_source_id_ : data_source_id option) ~index_id:(index_id_ : index_id)
    ~group_id:(group_id_ : group_id) () =
  ({ index_id = index_id_; data_source_id = data_source_id_; group_id = group_id_ }
    : describe_principal_mapping_request)

let make_text_document_statistics
    ~indexed_text_documents_count:(indexed_text_documents_count_ : indexed_text_documents_count)
    ~indexed_text_bytes:(indexed_text_bytes_ : indexed_text_bytes) () =
  ({
     indexed_text_documents_count = indexed_text_documents_count_;
     indexed_text_bytes = indexed_text_bytes_;
   }
    : text_document_statistics)

let make_faq_statistics
    ~indexed_question_answers_count:
      (indexed_question_answers_count_ : indexed_question_answers_count) () =
  ({ indexed_question_answers_count = indexed_question_answers_count_ } : faq_statistics)

let make_index_statistics ~faq_statistics:(faq_statistics_ : faq_statistics)
    ~text_document_statistics:(text_document_statistics_ : text_document_statistics) () =
  ({ faq_statistics = faq_statistics_; text_document_statistics = text_document_statistics_ }
    : index_statistics)

let make_server_side_encryption_configuration ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({ kms_key_id = kms_key_id_ } : server_side_encryption_configuration)

let make_describe_index_response ?name:(name_ : index_name option) ?id:(id_ : index_id option)
    ?edition:(edition_ : index_edition option) ?role_arn:(role_arn_ : role_arn option)
    ?server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration option)
    ?status:(status_ : index_status option) ?description:(description_ : description option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?document_metadata_configurations:
      (document_metadata_configurations_ : document_metadata_configuration_list option)
    ?index_statistics:(index_statistics_ : index_statistics option)
    ?error_message:(error_message_ : error_message option)
    ?capacity_units:(capacity_units_ : capacity_units_configuration option)
    ?user_token_configurations:(user_token_configurations_ : user_token_configuration_list option)
    ?user_context_policy:(user_context_policy_ : user_context_policy option)
    ?user_group_resolution_configuration:
      (user_group_resolution_configuration_ : user_group_resolution_configuration option) () =
  ({
     name = name_;
     id = id_;
     edition = edition_;
     role_arn = role_arn_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     status = status_;
     description = description_;
     created_at = created_at_;
     updated_at = updated_at_;
     document_metadata_configurations = document_metadata_configurations_;
     index_statistics = index_statistics_;
     error_message = error_message_;
     capacity_units = capacity_units_;
     user_token_configurations = user_token_configurations_;
     user_context_policy = user_context_policy_;
     user_group_resolution_configuration = user_group_resolution_configuration_;
   }
    : describe_index_response)

let make_describe_index_request ~id:(id_ : index_id) () = ({ id = id_ } : describe_index_request)

let make_featured_document_missing ?id:(id_ : document_id option) () =
  ({ id = id_ } : featured_document_missing)

let make_featured_document_with_metadata ?id:(id_ : document_id option)
    ?title:(title_ : string_ option) ?ur_i:(ur_i_ : url option) () =
  ({ id = id_; title = title_; ur_i = ur_i_ } : featured_document_with_metadata)

let make_describe_featured_results_set_response
    ?featured_results_set_id:(featured_results_set_id_ : featured_results_set_id option)
    ?featured_results_set_name:(featured_results_set_name_ : featured_results_set_name option)
    ?description:(description_ : featured_results_set_description option)
    ?status:(status_ : featured_results_set_status option)
    ?query_texts:(query_texts_ : query_text_list option)
    ?featured_documents_with_metadata:
      (featured_documents_with_metadata_ : featured_document_with_metadata_list option)
    ?featured_documents_missing:
      (featured_documents_missing_ : featured_document_missing_list option)
    ?last_updated_timestamp:(last_updated_timestamp_ : long option)
    ?creation_timestamp:(creation_timestamp_ : long option) () =
  ({
     featured_results_set_id = featured_results_set_id_;
     featured_results_set_name = featured_results_set_name_;
     description = description_;
     status = status_;
     query_texts = query_texts_;
     featured_documents_with_metadata = featured_documents_with_metadata_;
     featured_documents_missing = featured_documents_missing_;
     last_updated_timestamp = last_updated_timestamp_;
     creation_timestamp = creation_timestamp_;
   }
    : describe_featured_results_set_response)

let make_describe_featured_results_set_request ~index_id:(index_id_ : index_id)
    ~featured_results_set_id:(featured_results_set_id_ : featured_results_set_id) () =
  ({ index_id = index_id_; featured_results_set_id = featured_results_set_id_ }
    : describe_featured_results_set_request)

let make_describe_faq_response ?id:(id_ : faq_id option) ?index_id:(index_id_ : index_id option)
    ?name:(name_ : faq_name option) ?description:(description_ : description option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?s3_path:(s3_path_ : s3_path option) ?status:(status_ : faq_status option)
    ?role_arn:(role_arn_ : role_arn option) ?error_message:(error_message_ : error_message option)
    ?file_format:(file_format_ : faq_file_format option)
    ?language_code:(language_code_ : language_code option) () =
  ({
     id = id_;
     index_id = index_id_;
     name = name_;
     description = description_;
     created_at = created_at_;
     updated_at = updated_at_;
     s3_path = s3_path_;
     status = status_;
     role_arn = role_arn_;
     error_message = error_message_;
     file_format = file_format_;
     language_code = language_code_;
   }
    : describe_faq_response)

let make_describe_faq_request ~id:(id_ : faq_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : describe_faq_request)

let make_describe_experience_response ?id:(id_ : experience_id option)
    ?index_id:(index_id_ : index_id option) ?name:(name_ : experience_name option)
    ?endpoints:(endpoints_ : experience_endpoints option)
    ?configuration:(configuration_ : experience_configuration option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?description:(description_ : description option) ?status:(status_ : experience_status option)
    ?role_arn:(role_arn_ : role_arn option) ?error_message:(error_message_ : error_message option)
    () =
  ({
     id = id_;
     index_id = index_id_;
     name = name_;
     endpoints = endpoints_;
     configuration = configuration_;
     created_at = created_at_;
     updated_at = updated_at_;
     description = description_;
     status = status_;
     role_arn = role_arn_;
     error_message = error_message_;
   }
    : describe_experience_response)

let make_describe_experience_request ~id:(id_ : experience_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : describe_experience_request)

let make_describe_data_source_response ?id:(id_ : data_source_id option)
    ?index_id:(index_id_ : index_id option) ?name:(name_ : data_source_name option)
    ?type_:(type__ : data_source_type option)
    ?configuration:(configuration_ : data_source_configuration option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?description:(description_ : description option) ?status:(status_ : data_source_status option)
    ?schedule:(schedule_ : scan_schedule option) ?role_arn:(role_arn_ : role_arn option)
    ?error_message:(error_message_ : error_message option)
    ?language_code:(language_code_ : language_code option)
    ?custom_document_enrichment_configuration:
      (custom_document_enrichment_configuration_ : custom_document_enrichment_configuration option)
    () =
  ({
     id = id_;
     index_id = index_id_;
     name = name_;
     type_ = type__;
     configuration = configuration_;
     vpc_configuration = vpc_configuration_;
     created_at = created_at_;
     updated_at = updated_at_;
     description = description_;
     status = status_;
     schedule = schedule_;
     role_arn = role_arn_;
     error_message = error_message_;
     language_code = language_code_;
     custom_document_enrichment_configuration = custom_document_enrichment_configuration_;
   }
    : describe_data_source_response)

let make_describe_data_source_request ~id:(id_ : data_source_id) ~index_id:(index_id_ : index_id) ()
    =
  ({ id = id_; index_id = index_id_ } : describe_data_source_request)

let make_describe_access_control_configuration_response
    ?description:(description_ : description option)
    ?error_message:(error_message_ : error_message option)
    ?access_control_list:(access_control_list_ : principal_list option)
    ?hierarchical_access_control_list:
      (hierarchical_access_control_list_ : hierarchical_principal_list option)
    ~name:(name_ : access_control_configuration_name) () =
  ({
     name = name_;
     description = description_;
     error_message = error_message_;
     access_control_list = access_control_list_;
     hierarchical_access_control_list = hierarchical_access_control_list_;
   }
    : describe_access_control_configuration_response)

let make_describe_access_control_configuration_request ~index_id:(index_id_ : index_id)
    ~id:(id_ : access_control_configuration_id) () =
  ({ index_id = index_id_; id = id_ } : describe_access_control_configuration_request)

let make_delete_thesaurus_request ~id:(id_ : thesaurus_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : delete_thesaurus_request)

let make_delete_query_suggestions_block_list_request ~index_id:(index_id_ : index_id)
    ~id:(id_ : query_suggestions_block_list_id) () =
  ({ index_id = index_id_; id = id_ } : delete_query_suggestions_block_list_request)

let make_delete_principal_mapping_request ?data_source_id:(data_source_id_ : data_source_id option)
    ?ordering_id:(ordering_id_ : principal_ordering_id option) ~index_id:(index_id_ : index_id)
    ~group_id:(group_id_ : group_id) () =
  ({
     index_id = index_id_;
     data_source_id = data_source_id_;
     group_id = group_id_;
     ordering_id = ordering_id_;
   }
    : delete_principal_mapping_request)

let make_delete_index_request ~id:(id_ : index_id) () = ({ id = id_ } : delete_index_request)

let make_delete_faq_request ~id:(id_ : faq_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : delete_faq_request)

let make_delete_experience_response () = (() : unit)

let make_delete_experience_request ~id:(id_ : experience_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : delete_experience_request)

let make_delete_data_source_request ~id:(id_ : data_source_id) ~index_id:(index_id_ : index_id) () =
  ({ id = id_; index_id = index_id_ } : delete_data_source_request)

let make_delete_access_control_configuration_response () = (() : unit)

let make_delete_access_control_configuration_request ~index_id:(index_id_ : index_id)
    ~id:(id_ : access_control_configuration_id) () =
  ({ index_id = index_id_; id = id_ } : delete_access_control_configuration_request)

let make_create_thesaurus_response ?id:(id_ : thesaurus_id option) () =
  ({ id = id_ } : create_thesaurus_response)

let make_create_thesaurus_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token_name option)
    ~index_id:(index_id_ : index_id) ~name:(name_ : thesaurus_name) ~role_arn:(role_arn_ : role_arn)
    ~source_s3_path:(source_s3_path_ : s3_path) () =
  ({
     index_id = index_id_;
     name = name_;
     description = description_;
     role_arn = role_arn_;
     tags = tags_;
     source_s3_path = source_s3_path_;
     client_token = client_token_;
   }
    : create_thesaurus_request)

let make_create_query_suggestions_block_list_response
    ?id:(id_ : query_suggestions_block_list_id option) () =
  ({ id = id_ } : create_query_suggestions_block_list_response)

let make_create_query_suggestions_block_list_request
    ?description:(description_ : description option)
    ?client_token:(client_token_ : client_token_name option) ?tags:(tags_ : tag_list option)
    ~index_id:(index_id_ : index_id) ~name:(name_ : query_suggestions_block_list_name)
    ~source_s3_path:(source_s3_path_ : s3_path) ~role_arn:(role_arn_ : role_arn) () =
  ({
     index_id = index_id_;
     name = name_;
     description = description_;
     source_s3_path = source_s3_path_;
     client_token = client_token_;
     role_arn = role_arn_;
     tags = tags_;
   }
    : create_query_suggestions_block_list_request)

let make_create_index_response ?id:(id_ : index_id option) () =
  ({ id = id_ } : create_index_response)

let make_create_index_request ?edition:(edition_ : index_edition option)
    ?server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration option)
    ?description:(description_ : description option)
    ?client_token:(client_token_ : client_token_name option) ?tags:(tags_ : tag_list option)
    ?user_token_configurations:(user_token_configurations_ : user_token_configuration_list option)
    ?user_context_policy:(user_context_policy_ : user_context_policy option)
    ?user_group_resolution_configuration:
      (user_group_resolution_configuration_ : user_group_resolution_configuration option)
    ~name:(name_ : index_name) ~role_arn:(role_arn_ : role_arn) () =
  ({
     name = name_;
     edition = edition_;
     role_arn = role_arn_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     description = description_;
     client_token = client_token_;
     tags = tags_;
     user_token_configurations = user_token_configurations_;
     user_context_policy = user_context_policy_;
     user_group_resolution_configuration = user_group_resolution_configuration_;
   }
    : create_index_request)

let make_create_featured_results_set_response
    ?featured_results_set:(featured_results_set_ : featured_results_set option) () =
  ({ featured_results_set = featured_results_set_ } : create_featured_results_set_response)

let make_create_featured_results_set_request
    ?description:(description_ : featured_results_set_description option)
    ?client_token:(client_token_ : client_token_name option)
    ?status:(status_ : featured_results_set_status option)
    ?query_texts:(query_texts_ : query_text_list option)
    ?featured_documents:(featured_documents_ : featured_document_list option)
    ?tags:(tags_ : tag_list option) ~index_id:(index_id_ : index_id)
    ~featured_results_set_name:(featured_results_set_name_ : featured_results_set_name) () =
  ({
     index_id = index_id_;
     featured_results_set_name = featured_results_set_name_;
     description = description_;
     client_token = client_token_;
     status = status_;
     query_texts = query_texts_;
     featured_documents = featured_documents_;
     tags = tags_;
   }
    : create_featured_results_set_request)

let make_create_faq_response ?id:(id_ : faq_id option) () = ({ id = id_ } : create_faq_response)

let make_create_faq_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ?file_format:(file_format_ : faq_file_format option)
    ?client_token:(client_token_ : client_token_name option)
    ?language_code:(language_code_ : language_code option) ~index_id:(index_id_ : index_id)
    ~name:(name_ : faq_name) ~s3_path:(s3_path_ : s3_path) ~role_arn:(role_arn_ : role_arn) () =
  ({
     index_id = index_id_;
     name = name_;
     description = description_;
     s3_path = s3_path_;
     role_arn = role_arn_;
     tags = tags_;
     file_format = file_format_;
     client_token = client_token_;
     language_code = language_code_;
   }
    : create_faq_request)

let make_create_experience_response ~id:(id_ : experience_id) () =
  ({ id = id_ } : create_experience_response)

let make_create_experience_request ?role_arn:(role_arn_ : role_arn option)
    ?configuration:(configuration_ : experience_configuration option)
    ?description:(description_ : description option)
    ?client_token:(client_token_ : client_token_name option) ~name:(name_ : experience_name)
    ~index_id:(index_id_ : index_id) () =
  ({
     name = name_;
     index_id = index_id_;
     role_arn = role_arn_;
     configuration = configuration_;
     description = description_;
     client_token = client_token_;
   }
    : create_experience_request)

let make_create_data_source_response ~id:(id_ : data_source_id) () =
  ({ id = id_ } : create_data_source_response)

let make_create_data_source_request
    ?configuration:(configuration_ : data_source_configuration option)
    ?vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration option)
    ?description:(description_ : description option) ?schedule:(schedule_ : scan_schedule option)
    ?role_arn:(role_arn_ : role_arn option) ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token_name option)
    ?language_code:(language_code_ : language_code option)
    ?custom_document_enrichment_configuration:
      (custom_document_enrichment_configuration_ : custom_document_enrichment_configuration option)
    ~name:(name_ : data_source_name) ~index_id:(index_id_ : index_id)
    ~type_:(type__ : data_source_type) () =
  ({
     name = name_;
     index_id = index_id_;
     type_ = type__;
     configuration = configuration_;
     vpc_configuration = vpc_configuration_;
     description = description_;
     schedule = schedule_;
     role_arn = role_arn_;
     tags = tags_;
     client_token = client_token_;
     language_code = language_code_;
     custom_document_enrichment_configuration = custom_document_enrichment_configuration_;
   }
    : create_data_source_request)

let make_create_access_control_configuration_response ~id:(id_ : access_control_configuration_id) ()
    =
  ({ id = id_ } : create_access_control_configuration_response)

let make_create_access_control_configuration_request
    ?description:(description_ : description option)
    ?access_control_list:(access_control_list_ : principal_list option)
    ?hierarchical_access_control_list:
      (hierarchical_access_control_list_ : hierarchical_principal_list option)
    ?client_token:(client_token_ : client_token_name option) ~index_id:(index_id_ : index_id)
    ~name:(name_ : access_control_configuration_name) () =
  ({
     index_id = index_id_;
     name = name_;
     description = description_;
     access_control_list = access_control_list_;
     hierarchical_access_control_list = hierarchical_access_control_list_;
     client_token = client_token_;
   }
    : create_access_control_configuration_request)

let make_clear_query_suggestions_request ~index_id:(index_id_ : index_id) () =
  ({ index_id = index_id_ } : clear_query_suggestions_request)

let make_batch_put_document_response_failed_document ?id:(id_ : document_id option)
    ?data_source_id:(data_source_id_ : data_source_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     id = id_;
     data_source_id = data_source_id_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : batch_put_document_response_failed_document)

let make_batch_put_document_response
    ?failed_documents:(failed_documents_ : batch_put_document_response_failed_documents option) () =
  ({ failed_documents = failed_documents_ } : batch_put_document_response)

let make_document ?title:(title_ : title option) ?blob:(blob_ : blob option)
    ?s3_path:(s3_path_ : s3_path option) ?attributes:(attributes_ : document_attribute_list option)
    ?access_control_list:(access_control_list_ : principal_list option)
    ?hierarchical_access_control_list:
      (hierarchical_access_control_list_ : hierarchical_principal_list option)
    ?content_type:(content_type_ : content_type option)
    ?access_control_configuration_id:
      (access_control_configuration_id_ : access_control_configuration_id option)
    ~id:(id_ : document_id) () =
  ({
     id = id_;
     title = title_;
     blob = blob_;
     s3_path = s3_path_;
     attributes = attributes_;
     access_control_list = access_control_list_;
     hierarchical_access_control_list = hierarchical_access_control_list_;
     content_type = content_type_;
     access_control_configuration_id = access_control_configuration_id_;
   }
    : document)

let make_batch_put_document_request ?role_arn:(role_arn_ : role_arn option)
    ?custom_document_enrichment_configuration:
      (custom_document_enrichment_configuration_ : custom_document_enrichment_configuration option)
    ~index_id:(index_id_ : index_id) ~documents:(documents_ : document_list) () =
  ({
     index_id = index_id_;
     role_arn = role_arn_;
     documents = documents_;
     custom_document_enrichment_configuration = custom_document_enrichment_configuration_;
   }
    : batch_put_document_request)

let make_status ?document_id:(document_id_ : document_id option)
    ?document_status:(document_status_ : document_status option)
    ?failure_code:(failure_code_ : string_ option)
    ?failure_reason:(failure_reason_ : string_ option) () =
  ({
     document_id = document_id_;
     document_status = document_status_;
     failure_code = failure_code_;
     failure_reason = failure_reason_;
   }
    : status)

let make_batch_get_document_status_response_error ?document_id:(document_id_ : document_id option)
    ?data_source_id:(data_source_id_ : data_source_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     document_id = document_id_;
     data_source_id = data_source_id_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : batch_get_document_status_response_error)

let make_batch_get_document_status_response
    ?errors:(errors_ : batch_get_document_status_response_errors option)
    ?document_status_list:(document_status_list_ : document_status_list option) () =
  ({ errors = errors_; document_status_list = document_status_list_ }
    : batch_get_document_status_response)

let make_document_info ?attributes:(attributes_ : document_attribute_list option)
    ~document_id:(document_id_ : document_id) () =
  ({ document_id = document_id_; attributes = attributes_ } : document_info)

let make_batch_get_document_status_request ~index_id:(index_id_ : index_id)
    ~document_info_list:(document_info_list_ : document_info_list) () =
  ({ index_id = index_id_; document_info_list = document_info_list_ }
    : batch_get_document_status_request)

let make_batch_delete_featured_results_set_error ~id:(id_ : featured_results_set_id)
    ~error_code:(error_code_ : error_code) ~error_message:(error_message_ : error_message) () =
  ({ id = id_; error_code = error_code_; error_message = error_message_ }
    : batch_delete_featured_results_set_error)

let make_batch_delete_featured_results_set_response
    ~errors:(errors_ : batch_delete_featured_results_set_errors) () =
  ({ errors = errors_ } : batch_delete_featured_results_set_response)

let make_batch_delete_featured_results_set_request ~index_id:(index_id_ : index_id)
    ~featured_results_set_ids:(featured_results_set_ids_ : featured_results_set_id_list) () =
  ({ index_id = index_id_; featured_results_set_ids = featured_results_set_ids_ }
    : batch_delete_featured_results_set_request)

let make_batch_delete_document_response_failed_document ?id:(id_ : document_id option)
    ?data_source_id:(data_source_id_ : data_source_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     id = id_;
     data_source_id = data_source_id_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : batch_delete_document_response_failed_document)

let make_batch_delete_document_response
    ?failed_documents:(failed_documents_ : batch_delete_document_response_failed_documents option)
    () =
  ({ failed_documents = failed_documents_ } : batch_delete_document_response)

let make_data_source_sync_job_metric_target
    ?data_source_sync_job_id:(data_source_sync_job_id_ : data_source_sync_job_id option)
    ~data_source_id:(data_source_id_ : data_source_id) () =
  ({ data_source_id = data_source_id_; data_source_sync_job_id = data_source_sync_job_id_ }
    : data_source_sync_job_metric_target)

let make_batch_delete_document_request
    ?data_source_sync_job_metric_target:
      (data_source_sync_job_metric_target_ : data_source_sync_job_metric_target option)
    ~index_id:(index_id_ : index_id) ~document_id_list:(document_id_list_ : document_id_list) () =
  ({
     index_id = index_id_;
     document_id_list = document_id_list_;
     data_source_sync_job_metric_target = data_source_sync_job_metric_target_;
   }
    : batch_delete_document_request)

let make_associate_personas_to_entities_response
    ?failed_entity_list:(failed_entity_list_ : failed_entity_list option) () =
  ({ failed_entity_list = failed_entity_list_ } : associate_personas_to_entities_response)

let make_entity_persona_configuration ~entity_id:(entity_id_ : entity_id)
    ~persona:(persona_ : persona) () =
  ({ entity_id = entity_id_; persona = persona_ } : entity_persona_configuration)

let make_associate_personas_to_entities_request ~id:(id_ : experience_id)
    ~index_id:(index_id_ : index_id) ~personas:(personas_ : entity_persona_configuration_list) () =
  ({ id = id_; index_id = index_id_; personas = personas_ }
    : associate_personas_to_entities_request)

let make_associate_entities_to_experience_response
    ?failed_entity_list:
      (failed_entity_list_ : associate_entities_to_experience_failed_entity_list option) () =
  ({ failed_entity_list = failed_entity_list_ } : associate_entities_to_experience_response)

let make_associate_entities_to_experience_request ~id:(id_ : experience_id)
    ~index_id:(index_id_ : index_id) ~entity_list:(entity_list_ : associate_entity_list) () =
  ({ id = id_; index_id = index_id_; entity_list = entity_list_ }
    : associate_entities_to_experience_request)
