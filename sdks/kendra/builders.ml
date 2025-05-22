open Smaws_Lib
open Types
let make_data_source_to_index_field_mapping
  ?date_field_format:(date_field_format_ : string option) 
  ~index_field_name:(index_field_name_ : string) 
  ~data_source_field_name:(data_source_field_name_ : string)  () =
  ({
     index_field_name = index_field_name_;
     date_field_format = date_field_format_;
     data_source_field_name = data_source_field_name_
   } : data_source_to_index_field_mapping)
let make_work_docs_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?use_change_log:(use_change_log_ : bool option) 
  ?crawl_comments:(crawl_comments_ : bool option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     field_mappings = field_mappings_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     use_change_log = use_change_log_;
     crawl_comments = crawl_comments_;
     organization_id = organization_id_
   } : work_docs_configuration)
let make_seed_url_configuration
  ?web_crawler_mode:(web_crawler_mode_ : web_crawler_mode option) 
  ~seed_urls:(seed_urls_ : string list)  () =
  ({ web_crawler_mode = web_crawler_mode_; seed_urls = seed_urls_ } : 
  seed_url_configuration)
let make_site_maps_configuration ~site_maps:(site_maps_ : string list)  () =
  ({ site_maps = site_maps_ } : site_maps_configuration)
let make_urls
  ?site_maps_configuration:(site_maps_configuration_ :
                             site_maps_configuration option)
   ?seed_url_configuration:(seed_url_configuration_ :
                             seed_url_configuration option)
   () =
  ({
     site_maps_configuration = site_maps_configuration_;
     seed_url_configuration = seed_url_configuration_
   } : urls)
let make_proxy_configuration ?credentials:(credentials_ : string option) 
  ~port:(port_ : int)  ~host:(host_ : string)  () =
  ({ credentials = credentials_; port = port_; host = host_ } : proxy_configuration)
let make_basic_authentication_configuration
  ~credentials:(credentials_ : string)  ~port:(port_ : int) 
  ~host:(host_ : string)  () =
  ({ credentials = credentials_; port = port_; host = host_ } : basic_authentication_configuration)
let make_authentication_configuration
  ?basic_authentication:(basic_authentication_ :
                          basic_authentication_configuration list option)
   () =
  ({ basic_authentication = basic_authentication_ } : authentication_configuration)
let make_web_crawler_configuration
  ?authentication_configuration:(authentication_configuration_ :
                                  authentication_configuration option)
   ?proxy_configuration:(proxy_configuration_ : proxy_configuration option) 
  ?url_exclusion_patterns:(url_exclusion_patterns_ : string list option) 
  ?url_inclusion_patterns:(url_inclusion_patterns_ : string list option) 
  ?max_urls_per_minute_crawl_rate:(max_urls_per_minute_crawl_rate_ :
                                    int option)
   ?max_content_size_per_page_in_mega_bytes:(max_content_size_per_page_in_mega_bytes_
                                              : float option)
   ?max_links_per_page:(max_links_per_page_ : int option) 
  ?crawl_depth:(crawl_depth_ : int option)  ~urls:(urls_ : urls)  () =
  ({
     authentication_configuration = authentication_configuration_;
     proxy_configuration = proxy_configuration_;
     url_exclusion_patterns = url_exclusion_patterns_;
     url_inclusion_patterns = url_inclusion_patterns_;
     max_urls_per_minute_crawl_rate = max_urls_per_minute_crawl_rate_;
     max_content_size_per_page_in_mega_bytes =
       max_content_size_per_page_in_mega_bytes_;
     max_links_per_page = max_links_per_page_;
     crawl_depth = crawl_depth_;
     urls = urls_
   } : web_crawler_configuration)
let make_warning ?code:(code_ : warning_code option) 
  ?message:(message_ : string option)  () =
  ({ code = code_; message = message_ } : warning)
let make_jwt_token_type_configuration
  ?claim_regex:(claim_regex_ : string option) 
  ?issuer:(issuer_ : string option) 
  ?group_attribute_field:(group_attribute_field_ : string option) 
  ?user_name_attribute_field:(user_name_attribute_field_ : string option) 
  ?secret_manager_arn:(secret_manager_arn_ : string option) 
  ?ur_l:(ur_l_ : string option)  ~key_location:(key_location_ : key_location)
   () =
  ({
     claim_regex = claim_regex_;
     issuer = issuer_;
     group_attribute_field = group_attribute_field_;
     user_name_attribute_field = user_name_attribute_field_;
     secret_manager_arn = secret_manager_arn_;
     ur_l = ur_l_;
     key_location = key_location_
   } : jwt_token_type_configuration)
let make_json_token_type_configuration
  ~group_attribute_field:(group_attribute_field_ : string) 
  ~user_name_attribute_field:(user_name_attribute_field_ : string)  () =
  ({
     group_attribute_field = group_attribute_field_;
     user_name_attribute_field = user_name_attribute_field_
   } : json_token_type_configuration)
let make_user_token_configuration
  ?json_token_type_configuration:(json_token_type_configuration_ :
                                   json_token_type_configuration option)
   ?jwt_token_type_configuration:(jwt_token_type_configuration_ :
                                   jwt_token_type_configuration option)
   () =
  ({
     json_token_type_configuration = json_token_type_configuration_;
     jwt_token_type_configuration = jwt_token_type_configuration_
   } : user_token_configuration)
let make_user_identity_configuration
  ?identity_attribute_name:(identity_attribute_name_ : string option)  () =
  ({ identity_attribute_name = identity_attribute_name_ } : user_identity_configuration)
let make_user_group_resolution_configuration
  ~user_group_resolution_mode:(user_group_resolution_mode_ :
                                user_group_resolution_mode)
   () =
  ({ user_group_resolution_mode = user_group_resolution_mode_ } : user_group_resolution_configuration)
let make_data_source_group ~data_source_id:(data_source_id_ : string) 
  ~group_id:(group_id_ : string)  () =
  ({ data_source_id = data_source_id_; group_id = group_id_ } : data_source_group)
let make_user_context
  ?data_source_groups:(data_source_groups_ : data_source_group list option) 
  ?groups:(groups_ : string list option)  ?user_id:(user_id_ : string option)
   ?token:(token_ : string option)  () =
  ({
     data_source_groups = data_source_groups_;
     groups = groups_;
     user_id = user_id_;
     token = token_
   } : user_context)
let make_s3_path ~key:(key_ : string)  ~bucket:(bucket_ : string)  () =
  ({ key = key_; bucket = bucket_ } : s3_path)
let make_update_thesaurus_request
  ?source_s3_path:(source_s3_path_ : s3_path option) 
  ?role_arn:(role_arn_ : string option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ~index_id:(index_id_ : string)  ~id:(id_ : string)  () =
  ({
     source_s3_path = source_s3_path_;
     role_arn = role_arn_;
     description = description_;
     index_id = index_id_;
     name = name_;
     id = id_
   } : update_thesaurus_request)
let make_suggestable_config ?suggestable:(suggestable_ : bool option) 
  ?attribute_name:(attribute_name_ : string option)  () =
  ({ suggestable = suggestable_; attribute_name = attribute_name_ } : 
  suggestable_config)
let make_attribute_suggestions_update_config
  ?attribute_suggestions_mode:(attribute_suggestions_mode_ :
                                attribute_suggestions_mode option)
   ?suggestable_config_list:(suggestable_config_list_ :
                              suggestable_config list option)
   () =
  ({
     attribute_suggestions_mode = attribute_suggestions_mode_;
     suggestable_config_list = suggestable_config_list_
   } : attribute_suggestions_update_config)
let make_update_query_suggestions_config_request
  ?attribute_suggestions_config:(attribute_suggestions_config_ :
                                  attribute_suggestions_update_config option)
   ?minimum_query_count:(minimum_query_count_ : int option) 
  ?minimum_number_of_querying_users:(minimum_number_of_querying_users_ :
                                      int option)
   ?include_queries_without_user_information:(include_queries_without_user_information_
                                               : bool option)
   ?query_log_look_back_window_in_days:(query_log_look_back_window_in_days_ :
                                         int option)
   ?mode:(mode_ : mode option)  ~index_id:(index_id_ : string)  () =
  ({
     attribute_suggestions_config = attribute_suggestions_config_;
     minimum_query_count = minimum_query_count_;
     minimum_number_of_querying_users = minimum_number_of_querying_users_;
     include_queries_without_user_information =
       include_queries_without_user_information_;
     query_log_look_back_window_in_days = query_log_look_back_window_in_days_;
     mode = mode_;
     index_id = index_id_
   } : update_query_suggestions_config_request)
let make_update_query_suggestions_block_list_request
  ?role_arn:(role_arn_ : string option) 
  ?source_s3_path:(source_s3_path_ : s3_path option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ~id:(id_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     role_arn = role_arn_;
     source_s3_path = source_s3_path_;
     description = description_;
     name = name_;
     id = id_;
     index_id = index_id_
   } : update_query_suggestions_block_list_request)
let make_relevance
  ?value_importance_map:(value_importance_map_ : value_importance_map option)
   ?rank_order:(rank_order_ : order option) 
  ?duration:(duration_ : string option) 
  ?importance:(importance_ : int option) 
  ?freshness:(freshness_ : bool option)  () =
  ({
     value_importance_map = value_importance_map_;
     rank_order = rank_order_;
     duration = duration_;
     importance = importance_;
     freshness = freshness_
   } : relevance)
let make_search ?sortable:(sortable_ : bool option) 
  ?displayable:(displayable_ : bool option) 
  ?searchable:(searchable_ : bool option) 
  ?facetable:(facetable_ : bool option)  () =
  ({
     sortable = sortable_;
     displayable = displayable_;
     searchable = searchable_;
     facetable = facetable_
   } : search)
let make_document_metadata_configuration ?search:(search_ : search option) 
  ?relevance:(relevance_ : relevance option) 
  ~type_:(type__ : document_attribute_value_type)  ~name:(name_ : string)  ()
  =
  ({ search = search_; relevance = relevance_; type_ = type__; name = name_ } : 
  document_metadata_configuration)
let make_capacity_units_configuration
  ~query_capacity_units:(query_capacity_units_ : int) 
  ~storage_capacity_units:(storage_capacity_units_ : int)  () =
  ({
     query_capacity_units = query_capacity_units_;
     storage_capacity_units = storage_capacity_units_
   } : capacity_units_configuration)
let make_update_index_request
  ?user_group_resolution_configuration:(user_group_resolution_configuration_
                                         :
                                         user_group_resolution_configuration
                                           option)
   ?user_context_policy:(user_context_policy_ : user_context_policy option) 
  ?user_token_configurations:(user_token_configurations_ :
                               user_token_configuration list option)
   ?capacity_units:(capacity_units_ : capacity_units_configuration option) 
  ?document_metadata_configuration_updates:(document_metadata_configuration_updates_
                                             :
                                             document_metadata_configuration
                                               list option)
   ?description:(description_ : string option) 
  ?role_arn:(role_arn_ : string option)  ?name:(name_ : string option) 
  ~id:(id_ : string)  () =
  ({
     user_group_resolution_configuration =
       user_group_resolution_configuration_;
     user_context_policy = user_context_policy_;
     user_token_configurations = user_token_configurations_;
     capacity_units = capacity_units_;
     document_metadata_configuration_updates =
       document_metadata_configuration_updates_;
     description = description_;
     role_arn = role_arn_;
     name = name_;
     id = id_
   } : update_index_request)
let make_featured_document ?id:(id_ : string option)  () =
  ({ id = id_ } : featured_document)
let make_featured_results_set
  ?creation_timestamp:(creation_timestamp_ : int option) 
  ?last_updated_timestamp:(last_updated_timestamp_ : int option) 
  ?featured_documents:(featured_documents_ : featured_document list option) 
  ?query_texts:(query_texts_ : string list option) 
  ?status:(status_ : featured_results_set_status option) 
  ?description:(description_ : string option) 
  ?featured_results_set_name:(featured_results_set_name_ : string option) 
  ?featured_results_set_id:(featured_results_set_id_ : string option)  () =
  ({
     creation_timestamp = creation_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
     featured_documents = featured_documents_;
     query_texts = query_texts_;
     status = status_;
     description = description_;
     featured_results_set_name = featured_results_set_name_;
     featured_results_set_id = featured_results_set_id_
   } : featured_results_set)
let make_update_featured_results_set_response
  ?featured_results_set:(featured_results_set_ : featured_results_set option)
   () =
  ({ featured_results_set = featured_results_set_ } : update_featured_results_set_response)
let make_update_featured_results_set_request
  ?featured_documents:(featured_documents_ : featured_document list option) 
  ?query_texts:(query_texts_ : string list option) 
  ?status:(status_ : featured_results_set_status option) 
  ?description:(description_ : string option) 
  ?featured_results_set_name:(featured_results_set_name_ : string option) 
  ~featured_results_set_id:(featured_results_set_id_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({
     featured_documents = featured_documents_;
     query_texts = query_texts_;
     status = status_;
     description = description_;
     featured_results_set_name = featured_results_set_name_;
     featured_results_set_id = featured_results_set_id_;
     index_id = index_id_
   } : update_featured_results_set_request)
let make_conflicting_item ?set_id:(set_id_ : string option) 
  ?set_name:(set_name_ : string option) 
  ?query_text:(query_text_ : string option)  () =
  ({ set_id = set_id_; set_name = set_name_; query_text = query_text_ } : 
  conflicting_item)
let make_content_source_configuration
  ?direct_put_content:(direct_put_content_ : bool option) 
  ?faq_ids:(faq_ids_ : string list option) 
  ?data_source_ids:(data_source_ids_ : string list option)  () =
  ({
     direct_put_content = direct_put_content_;
     faq_ids = faq_ids_;
     data_source_ids = data_source_ids_
   } : content_source_configuration)
let make_experience_configuration
  ?user_identity_configuration:(user_identity_configuration_ :
                                 user_identity_configuration option)
   ?content_source_configuration:(content_source_configuration_ :
                                   content_source_configuration option)
   () =
  ({
     user_identity_configuration = user_identity_configuration_;
     content_source_configuration = content_source_configuration_
   } : experience_configuration)
let make_update_experience_request
  ?description:(description_ : string option) 
  ?configuration:(configuration_ : experience_configuration option) 
  ?role_arn:(role_arn_ : string option)  ?name:(name_ : string option) 
  ~index_id:(index_id_ : string)  ~id:(id_ : string)  () =
  ({
     description = description_;
     configuration = configuration_;
     role_arn = role_arn_;
     index_id = index_id_;
     name = name_;
     id = id_
   } : update_experience_request)
let make_documents_metadata_configuration
  ?s3_prefix:(s3_prefix_ : string option)  () =
  ({ s3_prefix = s3_prefix_ } : documents_metadata_configuration)
let make_access_control_list_configuration
  ?key_path:(key_path_ : string option)  () =
  ({ key_path = key_path_ } : access_control_list_configuration)
let make_s3_data_source_configuration
  ?access_control_list_configuration:(access_control_list_configuration_ :
                                       access_control_list_configuration
                                         option)
   ?documents_metadata_configuration:(documents_metadata_configuration_ :
                                       documents_metadata_configuration
                                         option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?inclusion_prefixes:(inclusion_prefixes_ : string list option) 
  ~bucket_name:(bucket_name_ : string)  () =
  ({
     access_control_list_configuration = access_control_list_configuration_;
     documents_metadata_configuration = documents_metadata_configuration_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     inclusion_prefixes = inclusion_prefixes_;
     bucket_name = bucket_name_
   } : s3_data_source_configuration)
let make_data_source_vpc_configuration
  ~security_group_ids:(security_group_ids_ : string list) 
  ~subnet_ids:(subnet_ids_ : string list)  () =
  ({ security_group_ids = security_group_ids_; subnet_ids = subnet_ids_ } : 
  data_source_vpc_configuration)
let make_share_point_configuration
  ?proxy_configuration:(proxy_configuration_ : proxy_configuration option) 
  ?authentication_type:(authentication_type_ :
                         share_point_online_authentication_type option)
   ?ssl_certificate_s3_path:(ssl_certificate_s3_path_ : s3_path option) 
  ?disable_local_groups:(disable_local_groups_ : bool option) 
  ?document_title_field_name:(document_title_field_name_ : string option) 
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?vpc_configuration:(vpc_configuration_ :
                        data_source_vpc_configuration option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?use_change_log:(use_change_log_ : bool option) 
  ?crawl_attachments:(crawl_attachments_ : bool option) 
  ~secret_arn:(secret_arn_ : string)  ~urls:(urls_ : string list) 
  ~share_point_version:(share_point_version_ : share_point_version)  () =
  ({
     proxy_configuration = proxy_configuration_;
     authentication_type = authentication_type_;
     ssl_certificate_s3_path = ssl_certificate_s3_path_;
     disable_local_groups = disable_local_groups_;
     document_title_field_name = document_title_field_name_;
     field_mappings = field_mappings_;
     vpc_configuration = vpc_configuration_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     use_change_log = use_change_log_;
     crawl_attachments = crawl_attachments_;
     secret_arn = secret_arn_;
     urls = urls_;
     share_point_version = share_point_version_
   } : share_point_configuration)
let make_connection_configuration ~secret_arn:(secret_arn_ : string) 
  ~table_name:(table_name_ : string) 
  ~database_name:(database_name_ : string) 
  ~database_port:(database_port_ : int) 
  ~database_host:(database_host_ : string)  () =
  ({
     secret_arn = secret_arn_;
     table_name = table_name_;
     database_name = database_name_;
     database_port = database_port_;
     database_host = database_host_
   } : connection_configuration)
let make_column_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?document_title_column_name:(document_title_column_name_ : string option) 
  ~change_detecting_columns:(change_detecting_columns_ : string list) 
  ~document_data_column_name:(document_data_column_name_ : string) 
  ~document_id_column_name:(document_id_column_name_ : string)  () =
  ({
     change_detecting_columns = change_detecting_columns_;
     field_mappings = field_mappings_;
     document_title_column_name = document_title_column_name_;
     document_data_column_name = document_data_column_name_;
     document_id_column_name = document_id_column_name_
   } : column_configuration)
let make_acl_configuration
  ~allowed_groups_column_name:(allowed_groups_column_name_ : string)  () =
  ({ allowed_groups_column_name = allowed_groups_column_name_ } : acl_configuration)
let make_sql_configuration
  ?query_identifiers_enclosing_option:(query_identifiers_enclosing_option_ :
                                        query_identifiers_enclosing_option
                                          option)
   () =
  ({ query_identifiers_enclosing_option = query_identifiers_enclosing_option_
   } : sql_configuration)
let make_database_configuration
  ?sql_configuration:(sql_configuration_ : sql_configuration option) 
  ?acl_configuration:(acl_configuration_ : acl_configuration option) 
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ~column_configuration:(column_configuration_ : column_configuration) 
  ~connection_configuration:(connection_configuration_ :
                              connection_configuration)
   ~database_engine_type:(database_engine_type_ : database_engine_type)  () =
  ({
     sql_configuration = sql_configuration_;
     acl_configuration = acl_configuration_;
     column_configuration = column_configuration_;
     vpc_configuration = vpc_configuration_;
     connection_configuration = connection_configuration_;
     database_engine_type = database_engine_type_
   } : database_configuration)
let make_salesforce_standard_object_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?document_title_field_name:(document_title_field_name_ : string option) 
  ~document_data_field_name:(document_data_field_name_ : string) 
  ~name:(name_ : salesforce_standard_object_name)  () =
  ({
     field_mappings = field_mappings_;
     document_title_field_name = document_title_field_name_;
     document_data_field_name = document_data_field_name_;
     name = name_
   } : salesforce_standard_object_configuration)
let make_salesforce_standard_knowledge_article_type_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?document_title_field_name:(document_title_field_name_ : string option) 
  ~document_data_field_name:(document_data_field_name_ : string)  () =
  ({
     field_mappings = field_mappings_;
     document_title_field_name = document_title_field_name_;
     document_data_field_name = document_data_field_name_
   } : salesforce_standard_knowledge_article_type_configuration)
let make_salesforce_custom_knowledge_article_type_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?document_title_field_name:(document_title_field_name_ : string option) 
  ~document_data_field_name:(document_data_field_name_ : string) 
  ~name:(name_ : string)  () =
  ({
     field_mappings = field_mappings_;
     document_title_field_name = document_title_field_name_;
     document_data_field_name = document_data_field_name_;
     name = name_
   } : salesforce_custom_knowledge_article_type_configuration)
let make_salesforce_knowledge_article_configuration
  ?custom_knowledge_article_type_configurations:(custom_knowledge_article_type_configurations_
                                                  :
                                                  salesforce_custom_knowledge_article_type_configuration
                                                    list option)
   ?standard_knowledge_article_type_configuration:(standard_knowledge_article_type_configuration_
                                                    :
                                                    salesforce_standard_knowledge_article_type_configuration
                                                      option)
   ~included_states:(included_states_ :
                      salesforce_knowledge_article_state list)
   () =
  ({
     custom_knowledge_article_type_configurations =
       custom_knowledge_article_type_configurations_;
     standard_knowledge_article_type_configuration =
       standard_knowledge_article_type_configuration_;
     included_states = included_states_
   } : salesforce_knowledge_article_configuration)
let make_salesforce_chatter_feed_configuration
  ?include_filter_types:(include_filter_types_ :
                          salesforce_chatter_feed_include_filter_type list
                            option)
   ?field_mappings:(field_mappings_ :
                     data_source_to_index_field_mapping list option)
   ?document_title_field_name:(document_title_field_name_ : string option) 
  ~document_data_field_name:(document_data_field_name_ : string)  () =
  ({
     include_filter_types = include_filter_types_;
     field_mappings = field_mappings_;
     document_title_field_name = document_title_field_name_;
     document_data_field_name = document_data_field_name_
   } : salesforce_chatter_feed_configuration)
let make_salesforce_standard_object_attachment_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?document_title_field_name:(document_title_field_name_ : string option) 
  () =
  ({
     field_mappings = field_mappings_;
     document_title_field_name = document_title_field_name_
   } : salesforce_standard_object_attachment_configuration)
let make_salesforce_configuration
  ?exclude_attachment_file_patterns:(exclude_attachment_file_patterns_ :
                                      string list option)
   ?include_attachment_file_patterns:(include_attachment_file_patterns_ :
                                       string list option)
   ?standard_object_attachment_configuration:(standard_object_attachment_configuration_
                                               :
                                               salesforce_standard_object_attachment_configuration
                                                 option)
   ?crawl_attachments:(crawl_attachments_ : bool option) 
  ?chatter_feed_configuration:(chatter_feed_configuration_ :
                                salesforce_chatter_feed_configuration option)
   ?knowledge_article_configuration:(knowledge_article_configuration_ :
                                      salesforce_knowledge_article_configuration
                                        option)
   ?standard_object_configurations:(standard_object_configurations_ :
                                     salesforce_standard_object_configuration
                                       list option)
   ~secret_arn:(secret_arn_ : string)  ~server_url:(server_url_ : string)  ()
  =
  ({
     exclude_attachment_file_patterns = exclude_attachment_file_patterns_;
     include_attachment_file_patterns = include_attachment_file_patterns_;
     standard_object_attachment_configuration =
       standard_object_attachment_configuration_;
     crawl_attachments = crawl_attachments_;
     chatter_feed_configuration = chatter_feed_configuration_;
     knowledge_article_configuration = knowledge_article_configuration_;
     standard_object_configurations = standard_object_configurations_;
     secret_arn = secret_arn_;
     server_url = server_url_
   } : salesforce_configuration)
let make_one_drive_users
  ?one_drive_user_s3_path:(one_drive_user_s3_path_ : s3_path option) 
  ?one_drive_user_list:(one_drive_user_list_ : string list option)  () =
  ({
     one_drive_user_s3_path = one_drive_user_s3_path_;
     one_drive_user_list = one_drive_user_list_
   } : one_drive_users)
let make_one_drive_configuration
  ?disable_local_groups:(disable_local_groups_ : bool option) 
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ~one_drive_users:(one_drive_users_ : one_drive_users) 
  ~secret_arn:(secret_arn_ : string) 
  ~tenant_domain:(tenant_domain_ : string)  () =
  ({
     disable_local_groups = disable_local_groups_;
     field_mappings = field_mappings_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     one_drive_users = one_drive_users_;
     secret_arn = secret_arn_;
     tenant_domain = tenant_domain_
   } : one_drive_configuration)
let make_service_now_knowledge_article_configuration
  ?filter_query:(filter_query_ : string option) 
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?document_title_field_name:(document_title_field_name_ : string option) 
  ?exclude_attachment_file_patterns:(exclude_attachment_file_patterns_ :
                                      string list option)
   ?include_attachment_file_patterns:(include_attachment_file_patterns_ :
                                       string list option)
   ?crawl_attachments:(crawl_attachments_ : bool option) 
  ~document_data_field_name:(document_data_field_name_ : string)  () =
  ({
     filter_query = filter_query_;
     field_mappings = field_mappings_;
     document_title_field_name = document_title_field_name_;
     document_data_field_name = document_data_field_name_;
     exclude_attachment_file_patterns = exclude_attachment_file_patterns_;
     include_attachment_file_patterns = include_attachment_file_patterns_;
     crawl_attachments = crawl_attachments_
   } : service_now_knowledge_article_configuration)
let make_service_now_service_catalog_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?document_title_field_name:(document_title_field_name_ : string option) 
  ?exclude_attachment_file_patterns:(exclude_attachment_file_patterns_ :
                                      string list option)
   ?include_attachment_file_patterns:(include_attachment_file_patterns_ :
                                       string list option)
   ?crawl_attachments:(crawl_attachments_ : bool option) 
  ~document_data_field_name:(document_data_field_name_ : string)  () =
  ({
     field_mappings = field_mappings_;
     document_title_field_name = document_title_field_name_;
     document_data_field_name = document_data_field_name_;
     exclude_attachment_file_patterns = exclude_attachment_file_patterns_;
     include_attachment_file_patterns = include_attachment_file_patterns_;
     crawl_attachments = crawl_attachments_
   } : service_now_service_catalog_configuration)
let make_service_now_configuration
  ?authentication_type:(authentication_type_ :
                         service_now_authentication_type option)
   ?service_catalog_configuration:(service_catalog_configuration_ :
                                    service_now_service_catalog_configuration
                                      option)
   ?knowledge_article_configuration:(knowledge_article_configuration_ :
                                      service_now_knowledge_article_configuration
                                        option)
   ~service_now_build_version:(service_now_build_version_ :
                                service_now_build_version_type)
   ~secret_arn:(secret_arn_ : string)  ~host_url:(host_url_ : string)  () =
  ({
     authentication_type = authentication_type_;
     service_catalog_configuration = service_catalog_configuration_;
     knowledge_article_configuration = knowledge_article_configuration_;
     service_now_build_version = service_now_build_version_;
     secret_arn = secret_arn_;
     host_url = host_url_
   } : service_now_configuration)
let make_confluence_space_to_index_field_mapping
  ?index_field_name:(index_field_name_ : string option) 
  ?date_field_format:(date_field_format_ : string option) 
  ?data_source_field_name:(data_source_field_name_ :
                            confluence_space_field_name option)
   () =
  ({
     index_field_name = index_field_name_;
     date_field_format = date_field_format_;
     data_source_field_name = data_source_field_name_
   } : confluence_space_to_index_field_mapping)
let make_confluence_space_configuration
  ?space_field_mappings:(space_field_mappings_ :
                          confluence_space_to_index_field_mapping list option)
   ?exclude_spaces:(exclude_spaces_ : string list option) 
  ?include_spaces:(include_spaces_ : string list option) 
  ?crawl_archived_spaces:(crawl_archived_spaces_ : bool option) 
  ?crawl_personal_spaces:(crawl_personal_spaces_ : bool option)  () =
  ({
     space_field_mappings = space_field_mappings_;
     exclude_spaces = exclude_spaces_;
     include_spaces = include_spaces_;
     crawl_archived_spaces = crawl_archived_spaces_;
     crawl_personal_spaces = crawl_personal_spaces_
   } : confluence_space_configuration)
let make_confluence_page_to_index_field_mapping
  ?index_field_name:(index_field_name_ : string option) 
  ?date_field_format:(date_field_format_ : string option) 
  ?data_source_field_name:(data_source_field_name_ :
                            confluence_page_field_name option)
   () =
  ({
     index_field_name = index_field_name_;
     date_field_format = date_field_format_;
     data_source_field_name = data_source_field_name_
   } : confluence_page_to_index_field_mapping)
let make_confluence_page_configuration
  ?page_field_mappings:(page_field_mappings_ :
                         confluence_page_to_index_field_mapping list option)
   () =
  ({ page_field_mappings = page_field_mappings_ } : confluence_page_configuration)
let make_confluence_blog_to_index_field_mapping
  ?index_field_name:(index_field_name_ : string option) 
  ?date_field_format:(date_field_format_ : string option) 
  ?data_source_field_name:(data_source_field_name_ :
                            confluence_blog_field_name option)
   () =
  ({
     index_field_name = index_field_name_;
     date_field_format = date_field_format_;
     data_source_field_name = data_source_field_name_
   } : confluence_blog_to_index_field_mapping)
let make_confluence_blog_configuration
  ?blog_field_mappings:(blog_field_mappings_ :
                         confluence_blog_to_index_field_mapping list option)
   () =
  ({ blog_field_mappings = blog_field_mappings_ } : confluence_blog_configuration)
let make_confluence_attachment_to_index_field_mapping
  ?index_field_name:(index_field_name_ : string option) 
  ?date_field_format:(date_field_format_ : string option) 
  ?data_source_field_name:(data_source_field_name_ :
                            confluence_attachment_field_name option)
   () =
  ({
     index_field_name = index_field_name_;
     date_field_format = date_field_format_;
     data_source_field_name = data_source_field_name_
   } : confluence_attachment_to_index_field_mapping)
let make_confluence_attachment_configuration
  ?attachment_field_mappings:(attachment_field_mappings_ :
                               confluence_attachment_to_index_field_mapping
                                 list option)
   ?crawl_attachments:(crawl_attachments_ : bool option)  () =
  ({
     attachment_field_mappings = attachment_field_mappings_;
     crawl_attachments = crawl_attachments_
   } : confluence_attachment_configuration)
let make_confluence_configuration
  ?authentication_type:(authentication_type_ :
                         confluence_authentication_type option)
   ?proxy_configuration:(proxy_configuration_ : proxy_configuration option) 
  ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ?attachment_configuration:(attachment_configuration_ :
                               confluence_attachment_configuration option)
   ?blog_configuration:(blog_configuration_ :
                         confluence_blog_configuration option)
   ?page_configuration:(page_configuration_ :
                         confluence_page_configuration option)
   ?space_configuration:(space_configuration_ :
                          confluence_space_configuration option)
   ~version:(version_ : confluence_version) 
  ~secret_arn:(secret_arn_ : string)  ~server_url:(server_url_ : string)  ()
  =
  ({
     authentication_type = authentication_type_;
     proxy_configuration = proxy_configuration_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     vpc_configuration = vpc_configuration_;
     attachment_configuration = attachment_configuration_;
     blog_configuration = blog_configuration_;
     page_configuration = page_configuration_;
     space_configuration = space_configuration_;
     version = version_;
     secret_arn = secret_arn_;
     server_url = server_url_
   } : confluence_configuration)
let make_google_drive_configuration
  ?exclude_shared_drives:(exclude_shared_drives_ : string list option) 
  ?exclude_user_accounts:(exclude_user_accounts_ : string list option) 
  ?exclude_mime_types:(exclude_mime_types_ : string list option) 
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ~secret_arn:(secret_arn_ : string)  () =
  ({
     exclude_shared_drives = exclude_shared_drives_;
     exclude_user_accounts = exclude_user_accounts_;
     exclude_mime_types = exclude_mime_types_;
     field_mappings = field_mappings_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     secret_arn = secret_arn_
   } : google_drive_configuration)
let make_fsx_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?secret_arn:(secret_arn_ : string option) 
  ~vpc_configuration:(vpc_configuration_ : data_source_vpc_configuration) 
  ~file_system_type:(file_system_type_ : fsx_file_system_type) 
  ~file_system_id:(file_system_id_ : string)  () =
  ({
     field_mappings = field_mappings_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     secret_arn = secret_arn_;
     vpc_configuration = vpc_configuration_;
     file_system_type = file_system_type_;
     file_system_id = file_system_id_
   } : fsx_configuration)
let make_slack_configuration
  ?field_mappings:(field_mappings_ :
                    data_source_to_index_field_mapping list option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?public_channel_filter:(public_channel_filter_ : string list option) 
  ?private_channel_filter:(private_channel_filter_ : string list option) 
  ?look_back_period:(look_back_period_ : int option) 
  ?exclude_archived:(exclude_archived_ : bool option) 
  ?crawl_bot_message:(crawl_bot_message_ : bool option) 
  ?use_change_log:(use_change_log_ : bool option) 
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ~since_crawl_date:(since_crawl_date_ : string) 
  ~slack_entity_list:(slack_entity_list_ : slack_entity list) 
  ~secret_arn:(secret_arn_ : string)  ~team_id:(team_id_ : string)  () =
  ({
     field_mappings = field_mappings_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     public_channel_filter = public_channel_filter_;
     private_channel_filter = private_channel_filter_;
     look_back_period = look_back_period_;
     since_crawl_date = since_crawl_date_;
     exclude_archived = exclude_archived_;
     crawl_bot_message = crawl_bot_message_;
     use_change_log = use_change_log_;
     slack_entity_list = slack_entity_list_;
     vpc_configuration = vpc_configuration_;
     secret_arn = secret_arn_;
     team_id = team_id_
   } : slack_configuration)
let make_box_configuration
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?web_link_field_mappings:(web_link_field_mappings_ :
                             data_source_to_index_field_mapping list option)
   ?comment_field_mappings:(comment_field_mappings_ :
                             data_source_to_index_field_mapping list option)
   ?task_field_mappings:(task_field_mappings_ :
                          data_source_to_index_field_mapping list option)
   ?file_field_mappings:(file_field_mappings_ :
                          data_source_to_index_field_mapping list option)
   ?crawl_web_links:(crawl_web_links_ : bool option) 
  ?crawl_tasks:(crawl_tasks_ : bool option) 
  ?crawl_comments:(crawl_comments_ : bool option) 
  ?use_change_log:(use_change_log_ : bool option) 
  ~secret_arn:(secret_arn_ : string) 
  ~enterprise_id:(enterprise_id_ : string)  () =
  ({
     vpc_configuration = vpc_configuration_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     web_link_field_mappings = web_link_field_mappings_;
     comment_field_mappings = comment_field_mappings_;
     task_field_mappings = task_field_mappings_;
     file_field_mappings = file_field_mappings_;
     crawl_web_links = crawl_web_links_;
     crawl_tasks = crawl_tasks_;
     crawl_comments = crawl_comments_;
     use_change_log = use_change_log_;
     secret_arn = secret_arn_;
     enterprise_id = enterprise_id_
   } : box_configuration)
let make_quip_configuration
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?attachment_field_mappings:(attachment_field_mappings_ :
                               data_source_to_index_field_mapping list option)
   ?message_field_mappings:(message_field_mappings_ :
                             data_source_to_index_field_mapping list option)
   ?thread_field_mappings:(thread_field_mappings_ :
                            data_source_to_index_field_mapping list option)
   ?folder_ids:(folder_ids_ : string list option) 
  ?crawl_attachments:(crawl_attachments_ : bool option) 
  ?crawl_chat_rooms:(crawl_chat_rooms_ : bool option) 
  ?crawl_file_comments:(crawl_file_comments_ : bool option) 
  ~secret_arn:(secret_arn_ : string)  ~domain:(domain_ : string)  () =
  ({
     vpc_configuration = vpc_configuration_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     attachment_field_mappings = attachment_field_mappings_;
     message_field_mappings = message_field_mappings_;
     thread_field_mappings = thread_field_mappings_;
     folder_ids = folder_ids_;
     crawl_attachments = crawl_attachments_;
     crawl_chat_rooms = crawl_chat_rooms_;
     crawl_file_comments = crawl_file_comments_;
     secret_arn = secret_arn_;
     domain = domain_
   } : quip_configuration)
let make_jira_configuration
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?work_log_field_mappings:(work_log_field_mappings_ :
                             data_source_to_index_field_mapping list option)
   ?project_field_mappings:(project_field_mappings_ :
                             data_source_to_index_field_mapping list option)
   ?issue_field_mappings:(issue_field_mappings_ :
                           data_source_to_index_field_mapping list option)
   ?comment_field_mappings:(comment_field_mappings_ :
                             data_source_to_index_field_mapping list option)
   ?attachment_field_mappings:(attachment_field_mappings_ :
                                data_source_to_index_field_mapping list
                                  option)
   ?issue_sub_entity_filter:(issue_sub_entity_filter_ :
                              issue_sub_entity list option)
   ?status:(status_ : string list option) 
  ?issue_type:(issue_type_ : string list option) 
  ?project:(project_ : string list option) 
  ?use_change_log:(use_change_log_ : bool option) 
  ~secret_arn:(secret_arn_ : string) 
  ~jira_account_url:(jira_account_url_ : string)  () =
  ({
     vpc_configuration = vpc_configuration_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     work_log_field_mappings = work_log_field_mappings_;
     project_field_mappings = project_field_mappings_;
     issue_field_mappings = issue_field_mappings_;
     comment_field_mappings = comment_field_mappings_;
     attachment_field_mappings = attachment_field_mappings_;
     issue_sub_entity_filter = issue_sub_entity_filter_;
     status = status_;
     issue_type = issue_type_;
     project = project_;
     use_change_log = use_change_log_;
     secret_arn = secret_arn_;
     jira_account_url = jira_account_url_
   } : jira_configuration)
let make_saa_s_configuration ~host_url:(host_url_ : string) 
  ~organization_name:(organization_name_ : string)  () =
  ({ host_url = host_url_; organization_name = organization_name_ } : 
  saa_s_configuration)
let make_on_premise_configuration
  ~ssl_certificate_s3_path:(ssl_certificate_s3_path_ : s3_path) 
  ~organization_name:(organization_name_ : string) 
  ~host_url:(host_url_ : string)  () =
  ({
     ssl_certificate_s3_path = ssl_certificate_s3_path_;
     organization_name = organization_name_;
     host_url = host_url_
   } : on_premise_configuration)
let make_git_hub_document_crawl_properties
  ?crawl_pull_request_comment_attachment:(crawl_pull_request_comment_attachment_
                                           : bool option)
   ?crawl_pull_request_comment:(crawl_pull_request_comment_ : bool option) 
  ?crawl_pull_request:(crawl_pull_request_ : bool option) 
  ?crawl_issue_comment_attachment:(crawl_issue_comment_attachment_ :
                                    bool option)
   ?crawl_issue_comment:(crawl_issue_comment_ : bool option) 
  ?crawl_issue:(crawl_issue_ : bool option) 
  ?crawl_repository_documents:(crawl_repository_documents_ : bool option)  ()
  =
  ({
     crawl_pull_request_comment_attachment =
       crawl_pull_request_comment_attachment_;
     crawl_pull_request_comment = crawl_pull_request_comment_;
     crawl_pull_request = crawl_pull_request_;
     crawl_issue_comment_attachment = crawl_issue_comment_attachment_;
     crawl_issue_comment = crawl_issue_comment_;
     crawl_issue = crawl_issue_;
     crawl_repository_documents = crawl_repository_documents_
   } : git_hub_document_crawl_properties)
let make_git_hub_configuration
  ?git_hub_pull_request_document_attachment_configuration_field_mappings:
  (git_hub_pull_request_document_attachment_configuration_field_mappings_ :
    data_source_to_index_field_mapping list option)
   ?git_hub_pull_request_document_configuration_field_mappings:(git_hub_pull_request_document_configuration_field_mappings_
                                                                 :
                                                                 data_source_to_index_field_mapping
                                                                   list
                                                                   option)
   ?git_hub_pull_request_comment_configuration_field_mappings:(git_hub_pull_request_comment_configuration_field_mappings_
                                                                :
                                                                data_source_to_index_field_mapping
                                                                  list option)
   ?git_hub_issue_attachment_configuration_field_mappings:(git_hub_issue_attachment_configuration_field_mappings_
                                                            :
                                                            data_source_to_index_field_mapping
                                                              list option)
   ?git_hub_issue_comment_configuration_field_mappings:(git_hub_issue_comment_configuration_field_mappings_
                                                         :
                                                         data_source_to_index_field_mapping
                                                           list option)
   ?git_hub_issue_document_configuration_field_mappings:(git_hub_issue_document_configuration_field_mappings_
                                                          :
                                                          data_source_to_index_field_mapping
                                                            list option)
   ?git_hub_commit_configuration_field_mappings:(git_hub_commit_configuration_field_mappings_
                                                  :
                                                  data_source_to_index_field_mapping
                                                    list option)
   ?git_hub_repository_configuration_field_mappings:(git_hub_repository_configuration_field_mappings_
                                                      :
                                                      data_source_to_index_field_mapping
                                                        list option)
   ?vpc_configuration:(vpc_configuration_ :
                        data_source_vpc_configuration option)
   ?exclusion_file_name_patterns:(exclusion_file_name_patterns_ :
                                   string list option)
   ?exclusion_file_type_patterns:(exclusion_file_type_patterns_ :
                                   string list option)
   ?exclusion_folder_name_patterns:(exclusion_folder_name_patterns_ :
                                     string list option)
   ?inclusion_file_name_patterns:(inclusion_file_name_patterns_ :
                                   string list option)
   ?inclusion_file_type_patterns:(inclusion_file_type_patterns_ :
                                   string list option)
   ?inclusion_folder_name_patterns:(inclusion_folder_name_patterns_ :
                                     string list option)
   ?repository_filter:(repository_filter_ : string list option) 
  ?git_hub_document_crawl_properties:(git_hub_document_crawl_properties_ :
                                       git_hub_document_crawl_properties
                                         option)
   ?use_change_log:(use_change_log_ : bool option) 
  ?type_:(type__ : type_ option) 
  ?on_premise_configuration:(on_premise_configuration_ :
                              on_premise_configuration option)
   ?saa_s_configuration:(saa_s_configuration_ : saa_s_configuration option) 
  ~secret_arn:(secret_arn_ : string)  () =
  ({
     git_hub_pull_request_document_attachment_configuration_field_mappings =
       git_hub_pull_request_document_attachment_configuration_field_mappings_;
     git_hub_pull_request_document_configuration_field_mappings =
       git_hub_pull_request_document_configuration_field_mappings_;
     git_hub_pull_request_comment_configuration_field_mappings =
       git_hub_pull_request_comment_configuration_field_mappings_;
     git_hub_issue_attachment_configuration_field_mappings =
       git_hub_issue_attachment_configuration_field_mappings_;
     git_hub_issue_comment_configuration_field_mappings =
       git_hub_issue_comment_configuration_field_mappings_;
     git_hub_issue_document_configuration_field_mappings =
       git_hub_issue_document_configuration_field_mappings_;
     git_hub_commit_configuration_field_mappings =
       git_hub_commit_configuration_field_mappings_;
     git_hub_repository_configuration_field_mappings =
       git_hub_repository_configuration_field_mappings_;
     vpc_configuration = vpc_configuration_;
     exclusion_file_name_patterns = exclusion_file_name_patterns_;
     exclusion_file_type_patterns = exclusion_file_type_patterns_;
     exclusion_folder_name_patterns = exclusion_folder_name_patterns_;
     inclusion_file_name_patterns = inclusion_file_name_patterns_;
     inclusion_file_type_patterns = inclusion_file_type_patterns_;
     inclusion_folder_name_patterns = inclusion_folder_name_patterns_;
     repository_filter = repository_filter_;
     git_hub_document_crawl_properties = git_hub_document_crawl_properties_;
     use_change_log = use_change_log_;
     secret_arn = secret_arn_;
     type_ = type__;
     on_premise_configuration = on_premise_configuration_;
     saa_s_configuration = saa_s_configuration_
   } : git_hub_configuration)
let make_alfresco_configuration
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ?exclusion_patterns:(exclusion_patterns_ : string list option) 
  ?inclusion_patterns:(inclusion_patterns_ : string list option) 
  ?wiki_field_mappings:(wiki_field_mappings_ :
                         data_source_to_index_field_mapping list option)
   ?blog_field_mappings:(blog_field_mappings_ :
                          data_source_to_index_field_mapping list option)
   ?document_library_field_mappings:(document_library_field_mappings_ :
                                      data_source_to_index_field_mapping list
                                        option)
   ?entity_filter:(entity_filter_ : alfresco_entity list option) 
  ?crawl_comments:(crawl_comments_ : bool option) 
  ?crawl_system_folders:(crawl_system_folders_ : bool option) 
  ~ssl_certificate_s3_path:(ssl_certificate_s3_path_ : s3_path) 
  ~secret_arn:(secret_arn_ : string)  ~site_id:(site_id_ : string) 
  ~site_url:(site_url_ : string)  () =
  ({
     vpc_configuration = vpc_configuration_;
     exclusion_patterns = exclusion_patterns_;
     inclusion_patterns = inclusion_patterns_;
     wiki_field_mappings = wiki_field_mappings_;
     blog_field_mappings = blog_field_mappings_;
     document_library_field_mappings = document_library_field_mappings_;
     entity_filter = entity_filter_;
     crawl_comments = crawl_comments_;
     crawl_system_folders = crawl_system_folders_;
     ssl_certificate_s3_path = ssl_certificate_s3_path_;
     secret_arn = secret_arn_;
     site_id = site_id_;
     site_url = site_url_
   } : alfresco_configuration)
let make_template_configuration
  ?template:(template_ : CoreTypes.Document.t option)  () =
  ({ template = template_ } : template_configuration)
let make_data_source_configuration
  ?template_configuration:(template_configuration_ :
                            template_configuration option)
   ?alfresco_configuration:(alfresco_configuration_ :
                             alfresco_configuration option)
   ?git_hub_configuration:(git_hub_configuration_ :
                            git_hub_configuration option)
   ?jira_configuration:(jira_configuration_ : jira_configuration option) 
  ?quip_configuration:(quip_configuration_ : quip_configuration option) 
  ?box_configuration:(box_configuration_ : box_configuration option) 
  ?slack_configuration:(slack_configuration_ : slack_configuration option) 
  ?fsx_configuration:(fsx_configuration_ : fsx_configuration option) 
  ?work_docs_configuration:(work_docs_configuration_ :
                             work_docs_configuration option)
   ?web_crawler_configuration:(web_crawler_configuration_ :
                                web_crawler_configuration option)
   ?google_drive_configuration:(google_drive_configuration_ :
                                 google_drive_configuration option)
   ?confluence_configuration:(confluence_configuration_ :
                               confluence_configuration option)
   ?service_now_configuration:(service_now_configuration_ :
                                service_now_configuration option)
   ?one_drive_configuration:(one_drive_configuration_ :
                              one_drive_configuration option)
   ?salesforce_configuration:(salesforce_configuration_ :
                               salesforce_configuration option)
   ?database_configuration:(database_configuration_ :
                             database_configuration option)
   ?share_point_configuration:(share_point_configuration_ :
                                share_point_configuration option)
   ?s3_configuration:(s3_configuration_ :
                       s3_data_source_configuration option)
   () =
  ({
     template_configuration = template_configuration_;
     alfresco_configuration = alfresco_configuration_;
     git_hub_configuration = git_hub_configuration_;
     jira_configuration = jira_configuration_;
     quip_configuration = quip_configuration_;
     box_configuration = box_configuration_;
     slack_configuration = slack_configuration_;
     fsx_configuration = fsx_configuration_;
     work_docs_configuration = work_docs_configuration_;
     web_crawler_configuration = web_crawler_configuration_;
     google_drive_configuration = google_drive_configuration_;
     confluence_configuration = confluence_configuration_;
     service_now_configuration = service_now_configuration_;
     one_drive_configuration = one_drive_configuration_;
     salesforce_configuration = salesforce_configuration_;
     database_configuration = database_configuration_;
     share_point_configuration = share_point_configuration_;
     s3_configuration = s3_configuration_
   } : data_source_configuration)
let make_document_attribute_value
  ?date_value:(date_value_ : CoreTypes.Timestamp.t option) 
  ?long_value:(long_value_ : int option) 
  ?string_list_value:(string_list_value_ : string list option) 
  ?string_value:(string_value_ : string option)  () =
  ({
     date_value = date_value_;
     long_value = long_value_;
     string_list_value = string_list_value_;
     string_value = string_value_
   } : document_attribute_value)
let make_document_attribute_condition
  ?condition_on_value:(condition_on_value_ : document_attribute_value option)
   ~operator:(operator_ : condition_operator) 
  ~condition_document_attribute_key:(condition_document_attribute_key_ :
                                      string)
   () =
  ({
     condition_on_value = condition_on_value_;
     operator = operator_;
     condition_document_attribute_key = condition_document_attribute_key_
   } : document_attribute_condition)
let make_document_attribute_target
  ?target_document_attribute_value:(target_document_attribute_value_ :
                                     document_attribute_value option)
   ?target_document_attribute_value_deletion:(target_document_attribute_value_deletion_
                                               : bool option)
   ?target_document_attribute_key:(target_document_attribute_key_ :
                                    string option)
   () =
  ({
     target_document_attribute_value = target_document_attribute_value_;
     target_document_attribute_value_deletion =
       target_document_attribute_value_deletion_;
     target_document_attribute_key = target_document_attribute_key_
   } : document_attribute_target)
let make_inline_custom_document_enrichment_configuration
  ?document_content_deletion:(document_content_deletion_ : bool option) 
  ?target:(target_ : document_attribute_target option) 
  ?condition:(condition_ : document_attribute_condition option)  () =
  ({
     document_content_deletion = document_content_deletion_;
     target = target_;
     condition = condition_
   } : inline_custom_document_enrichment_configuration)
let make_hook_configuration
  ?invocation_condition:(invocation_condition_ :
                          document_attribute_condition option)
   ~s3_bucket:(s3_bucket_ : string)  ~lambda_arn:(lambda_arn_ : string)  () =
  ({
     s3_bucket = s3_bucket_;
     lambda_arn = lambda_arn_;
     invocation_condition = invocation_condition_
   } : hook_configuration)
let make_custom_document_enrichment_configuration
  ?role_arn:(role_arn_ : string option) 
  ?post_extraction_hook_configuration:(post_extraction_hook_configuration_ :
                                        hook_configuration option)
   ?pre_extraction_hook_configuration:(pre_extraction_hook_configuration_ :
                                        hook_configuration option)
   ?inline_configurations:(inline_configurations_ :
                            inline_custom_document_enrichment_configuration
                              list option)
   () =
  ({
     role_arn = role_arn_;
     post_extraction_hook_configuration = post_extraction_hook_configuration_;
     pre_extraction_hook_configuration = pre_extraction_hook_configuration_;
     inline_configurations = inline_configurations_
   } : custom_document_enrichment_configuration)
let make_update_data_source_request
  ?custom_document_enrichment_configuration:(custom_document_enrichment_configuration_
                                              :
                                              custom_document_enrichment_configuration
                                                option)
   ?language_code:(language_code_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?schedule:(schedule_ : string option) 
  ?description:(description_ : string option) 
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ?configuration:(configuration_ : data_source_configuration option) 
  ?name:(name_ : string option)  ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({
     custom_document_enrichment_configuration =
       custom_document_enrichment_configuration_;
     language_code = language_code_;
     role_arn = role_arn_;
     schedule = schedule_;
     description = description_;
     vpc_configuration = vpc_configuration_;
     configuration = configuration_;
     index_id = index_id_;
     name = name_;
     id = id_
   } : update_data_source_request)
let make_update_access_control_configuration_response () = (() : unit)
let make_principal ?data_source_id:(data_source_id_ : string option) 
  ~access:(access_ : read_access_type)  ~type_:(type__ : principal_type) 
  ~name:(name_ : string)  () =
  ({
     data_source_id = data_source_id_;
     access = access_;
     type_ = type__;
     name = name_
   } : principal)
let make_hierarchical_principal
  ~principal_list:(principal_list_ : principal list)  () =
  ({ principal_list = principal_list_ } : hierarchical_principal)
let make_update_access_control_configuration_request
  ?hierarchical_access_control_list:(hierarchical_access_control_list_ :
                                      hierarchical_principal list option)
   ?access_control_list:(access_control_list_ : principal list option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ~id:(id_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     hierarchical_access_control_list = hierarchical_access_control_list_;
     access_control_list = access_control_list_;
     description = description_;
     name = name_;
     id = id_;
     index_id = index_id_
   } : update_access_control_configuration_request)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)
let make_time_range ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)  () =
  ({ end_time = end_time_; start_time = start_time_ } : time_range)
let make_thesaurus_summary
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : thesaurus_status option)  ?name:(name_ : string option) 
  ?id:(id_ : string option)  () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     name = name_;
     id = id_
   } : thesaurus_summary)
let make_highlight ?type_:(type__ : highlight_type option) 
  ?top_answer:(top_answer_ : bool option)  ~end_offset:(end_offset_ : int) 
  ~begin_offset:(begin_offset_ : int)  () =
  ({
     type_ = type__;
     top_answer = top_answer_;
     end_offset = end_offset_;
     begin_offset = begin_offset_
   } : highlight)
let make_text_with_highlights
  ?highlights:(highlights_ : highlight list option) 
  ?text:(text_ : string option)  () =
  ({ highlights = highlights_; text = text_ } : text_with_highlights)
let make_text_document_statistics
  ~indexed_text_bytes:(indexed_text_bytes_ : int) 
  ~indexed_text_documents_count:(indexed_text_documents_count_ : int)  () =
  ({
     indexed_text_bytes = indexed_text_bytes_;
     indexed_text_documents_count = indexed_text_documents_count_
   } : text_document_statistics)
let make_tag_resource_response () = (() : unit)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_request ~tags:(tags_ : tag list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)
let make_table_cell ?header:(header_ : bool option) 
  ?highlighted:(highlighted_ : bool option) 
  ?top_answer:(top_answer_ : bool option)  ?value:(value_ : string option) 
  () =
  ({
     header = header_;
     highlighted = highlighted_;
     top_answer = top_answer_;
     value = value_
   } : table_cell)
let make_table_row ?cells:(cells_ : table_cell list option)  () =
  ({ cells = cells_ } : table_row)
let make_table_excerpt
  ?total_number_of_rows:(total_number_of_rows_ : int option) 
  ?rows:(rows_ : table_row list option)  () =
  ({ total_number_of_rows = total_number_of_rows_; rows = rows_ } : table_excerpt)
let make_suggestion_highlight ?end_offset:(end_offset_ : int option) 
  ?begin_offset:(begin_offset_ : int option)  () =
  ({ end_offset = end_offset_; begin_offset = begin_offset_ } : suggestion_highlight)
let make_suggestion_text_with_highlights
  ?highlights:(highlights_ : suggestion_highlight list option) 
  ?text:(text_ : string option)  () =
  ({ highlights = highlights_; text = text_ } : suggestion_text_with_highlights)
let make_suggestion_value
  ?text:(text_ : suggestion_text_with_highlights option)  () =
  ({ text = text_ } : suggestion_value)
let make_document_attribute ~value:(value_ : document_attribute_value) 
  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : document_attribute)
let make_source_document
  ?additional_attributes:(additional_attributes_ :
                           document_attribute list option)
   ?suggestion_attributes:(suggestion_attributes_ : string list option) 
  ?document_id:(document_id_ : string option)  () =
  ({
     additional_attributes = additional_attributes_;
     suggestion_attributes = suggestion_attributes_;
     document_id = document_id_
   } : source_document)
let make_suggestion
  ?source_documents:(source_documents_ : source_document list option) 
  ?value:(value_ : suggestion_value option)  ?id:(id_ : string option)  () =
  ({ source_documents = source_documents_; value = value_; id = id_ } : 
  suggestion)
let make_click_feedback ~click_time:(click_time_ : CoreTypes.Timestamp.t) 
  ~result_id:(result_id_ : string)  () =
  ({ click_time = click_time_; result_id = result_id_ } : click_feedback)
let make_relevance_feedback
  ~relevance_value:(relevance_value_ : relevance_type) 
  ~result_id:(result_id_ : string)  () =
  ({ relevance_value = relevance_value_; result_id = result_id_ } : relevance_feedback)
let make_submit_feedback_request
  ?relevance_feedback_items:(relevance_feedback_items_ :
                              relevance_feedback list option)
   ?click_feedback_items:(click_feedback_items_ : click_feedback list option)
   ~query_id:(query_id_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     relevance_feedback_items = relevance_feedback_items_;
     click_feedback_items = click_feedback_items_;
     query_id = query_id_;
     index_id = index_id_
   } : submit_feedback_request)
let make_stop_data_source_sync_job_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : stop_data_source_sync_job_request)
let make_status ?failure_reason:(failure_reason_ : string option) 
  ?failure_code:(failure_code_ : string option) 
  ?document_status:(document_status_ : document_status option) 
  ?document_id:(document_id_ : string option)  () =
  ({
     failure_reason = failure_reason_;
     failure_code = failure_code_;
     document_status = document_status_;
     document_id = document_id_
   } : status)
let make_start_data_source_sync_job_response
  ?execution_id:(execution_id_ : string option)  () =
  ({ execution_id = execution_id_ } : start_data_source_sync_job_response)
let make_start_data_source_sync_job_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : start_data_source_sync_job_request)
let make_spell_correction_configuration
  ~include_query_spell_check_suggestions:(include_query_spell_check_suggestions_
                                           : bool)
   () =
  ({
     include_query_spell_check_suggestions =
       include_query_spell_check_suggestions_
   } : spell_correction_configuration)
let make_correction ?corrected_term:(corrected_term_ : string option) 
  ?term:(term_ : string option)  ?end_offset:(end_offset_ : int option) 
  ?begin_offset:(begin_offset_ : int option)  () =
  ({
     corrected_term = corrected_term_;
     term = term_;
     end_offset = end_offset_;
     begin_offset = begin_offset_
   } : correction)
let make_spell_corrected_query
  ?corrections:(corrections_ : correction list option) 
  ?suggested_query_text:(suggested_query_text_ : string option)  () =
  ({ corrections = corrections_; suggested_query_text = suggested_query_text_
   } : spell_corrected_query)
let make_sorting_configuration ~sort_order:(sort_order_ : sort_order) 
  ~document_attribute_key:(document_attribute_key_ : string)  () =
  ({
     sort_order = sort_order_;
     document_attribute_key = document_attribute_key_
   } : sorting_configuration)
let make_server_side_encryption_configuration
  ?kms_key_id:(kms_key_id_ : string option)  () =
  ({ kms_key_id = kms_key_id_ } : server_side_encryption_configuration)
let make_score_attributes
  ?score_confidence:(score_confidence_ : score_confidence option)  () =
  ({ score_confidence = score_confidence_ } : score_attributes)
let make_retrieve_result_item
  ?score_attributes:(score_attributes_ : score_attributes option) 
  ?document_attributes:(document_attributes_ :
                         document_attribute list option)
   ?document_ur_i:(document_ur_i_ : string option) 
  ?content:(content_ : string option) 
  ?document_title:(document_title_ : string option) 
  ?document_id:(document_id_ : string option)  ?id:(id_ : string option)  ()
  =
  ({
     score_attributes = score_attributes_;
     document_attributes = document_attributes_;
     document_ur_i = document_ur_i_;
     content = content_;
     document_title = document_title_;
     document_id = document_id_;
     id = id_
   } : retrieve_result_item)
let make_attribute_filter
  ?less_than_or_equals:(less_than_or_equals_ : document_attribute option) 
  ?less_than:(less_than_ : document_attribute option) 
  ?greater_than_or_equals:(greater_than_or_equals_ :
                            document_attribute option)
   ?greater_than:(greater_than_ : document_attribute option) 
  ?contains_any:(contains_any_ : document_attribute option) 
  ?contains_all:(contains_all_ : document_attribute option) 
  ?equals_to:(equals_to_ : document_attribute option) 
  ?not_filter:(not_filter_ : attribute_filter option) 
  ?or_all_filters:(or_all_filters_ : attribute_filter list option) 
  ?and_all_filters:(and_all_filters_ : attribute_filter list option)  () =
  ({
     less_than_or_equals = less_than_or_equals_;
     less_than = less_than_;
     greater_than_or_equals = greater_than_or_equals_;
     greater_than = greater_than_;
     contains_any = contains_any_;
     contains_all = contains_all_;
     equals_to = equals_to_;
     not_filter = not_filter_;
     or_all_filters = or_all_filters_;
     and_all_filters = and_all_filters_
   } : attribute_filter)
let make_document_relevance_configuration ~relevance:(relevance_ : relevance)
   ~name:(name_ : string)  () =
  ({ relevance = relevance_; name = name_ } : document_relevance_configuration)
let make_retrieve_request ?user_context:(user_context_ : user_context option)
   ?page_size:(page_size_ : int option) 
  ?page_number:(page_number_ : int option) 
  ?document_relevance_override_configurations:(document_relevance_override_configurations_
                                                :
                                                document_relevance_configuration
                                                  list option)
   ?requested_document_attributes:(requested_document_attributes_ :
                                    string list option)
   ?attribute_filter:(attribute_filter_ : attribute_filter option) 
  ~query_text:(query_text_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     user_context = user_context_;
     page_size = page_size_;
     page_number = page_number_;
     document_relevance_override_configurations =
       document_relevance_override_configurations_;
     requested_document_attributes = requested_document_attributes_;
     attribute_filter = attribute_filter_;
     query_text = query_text_;
     index_id = index_id_
   } : retrieve_request)
let make_query_suggestions_block_list_summary
  ?item_count:(item_count_ : int option) 
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : query_suggestions_block_list_status option) 
  ?name:(name_ : string option)  ?id:(id_ : string option)  () =
  ({
     item_count = item_count_;
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     name = name_;
     id = id_
   } : query_suggestions_block_list_summary)
let make_additional_result_attribute_value
  ?text_with_highlights_value:(text_with_highlights_value_ :
                                text_with_highlights option)
   () =
  ({ text_with_highlights_value = text_with_highlights_value_ } : additional_result_attribute_value)
let make_additional_result_attribute
  ~value:(value_ : additional_result_attribute_value) 
  ~value_type:(value_type_ : additional_result_attribute_value_type) 
  ~key:(key_ : string)  () =
  ({ value = value_; value_type = value_type_; key = key_ } : additional_result_attribute)
let make_expanded_result_item
  ?document_attributes:(document_attributes_ :
                         document_attribute list option)
   ?document_ur_i:(document_ur_i_ : string option) 
  ?document_excerpt:(document_excerpt_ : text_with_highlights option) 
  ?document_title:(document_title_ : text_with_highlights option) 
  ?document_id:(document_id_ : string option)  ?id:(id_ : string option)  ()
  =
  ({
     document_attributes = document_attributes_;
     document_ur_i = document_ur_i_;
     document_excerpt = document_excerpt_;
     document_title = document_title_;
     document_id = document_id_;
     id = id_
   } : expanded_result_item)
let make_collapsed_result_detail
  ?expanded_results:(expanded_results_ : expanded_result_item list option) 
  ~document_attribute:(document_attribute_ : document_attribute)  () =
  ({
     expanded_results = expanded_results_;
     document_attribute = document_attribute_
   } : collapsed_result_detail)
let make_query_result_item
  ?collapsed_result_detail:(collapsed_result_detail_ :
                             collapsed_result_detail option)
   ?table_excerpt:(table_excerpt_ : table_excerpt option) 
  ?feedback_token:(feedback_token_ : string option) 
  ?score_attributes:(score_attributes_ : score_attributes option) 
  ?document_attributes:(document_attributes_ :
                         document_attribute list option)
   ?document_ur_i:(document_ur_i_ : string option) 
  ?document_excerpt:(document_excerpt_ : text_with_highlights option) 
  ?document_title:(document_title_ : text_with_highlights option) 
  ?document_id:(document_id_ : string option) 
  ?additional_attributes:(additional_attributes_ :
                           additional_result_attribute list option)
   ?format:(format_ : query_result_format option) 
  ?type_:(type__ : query_result_type option)  ?id:(id_ : string option)  () =
  ({
     collapsed_result_detail = collapsed_result_detail_;
     table_excerpt = table_excerpt_;
     feedback_token = feedback_token_;
     score_attributes = score_attributes_;
     document_attributes = document_attributes_;
     document_ur_i = document_ur_i_;
     document_excerpt = document_excerpt_;
     document_title = document_title_;
     document_id = document_id_;
     additional_attributes = additional_attributes_;
     format = format_;
     type_ = type__;
     id = id_
   } : query_result_item)
let make_document_attribute_value_count_pair
  ?facet_results:(facet_results_ : facet_result list option) 
  ?count:(count_ : int option) 
  ?document_attribute_value:(document_attribute_value_ :
                              document_attribute_value option)
   () =
  ({
     facet_results = facet_results_;
     count = count_;
     document_attribute_value = document_attribute_value_
   } : document_attribute_value_count_pair)
let make_featured_results_item
  ?feedback_token:(feedback_token_ : string option) 
  ?document_attributes:(document_attributes_ :
                         document_attribute list option)
   ?document_ur_i:(document_ur_i_ : string option) 
  ?document_excerpt:(document_excerpt_ : text_with_highlights option) 
  ?document_title:(document_title_ : text_with_highlights option) 
  ?document_id:(document_id_ : string option) 
  ?additional_attributes:(additional_attributes_ :
                           additional_result_attribute list option)
   ?type_:(type__ : query_result_type option)  ?id:(id_ : string option)  ()
  =
  ({
     feedback_token = feedback_token_;
     document_attributes = document_attributes_;
     document_ur_i = document_ur_i_;
     document_excerpt = document_excerpt_;
     document_title = document_title_;
     document_id = document_id_;
     additional_attributes = additional_attributes_;
     type_ = type__;
     id = id_
   } : featured_results_item)
let make_facet ?max_results:(max_results_ : int option) 
  ?facets:(facets_ : facet list option) 
  ?document_attribute_key:(document_attribute_key_ : string option)  () =
  ({
     max_results = max_results_;
     facets = facets_;
     document_attribute_key = document_attribute_key_
   } : facet)
let make_expand_configuration
  ?max_expanded_results_per_item:(max_expanded_results_per_item_ :
                                   int option)
   ?max_result_items_to_expand:(max_result_items_to_expand_ : int option)  ()
  =
  ({
     max_expanded_results_per_item = max_expanded_results_per_item_;
     max_result_items_to_expand = max_result_items_to_expand_
   } : expand_configuration)
let make_collapse_configuration
  ?expand_configuration:(expand_configuration_ : expand_configuration option)
   ?expand:(expand_ : bool option) 
  ?missing_attribute_key_strategy:(missing_attribute_key_strategy_ :
                                    missing_attribute_key_strategy option)
   ?sorting_configurations:(sorting_configurations_ :
                             sorting_configuration list option)
   ~document_attribute_key:(document_attribute_key_ : string)  () =
  ({
     expand_configuration = expand_configuration_;
     expand = expand_;
     missing_attribute_key_strategy = missing_attribute_key_strategy_;
     sorting_configurations = sorting_configurations_;
     document_attribute_key = document_attribute_key_
   } : collapse_configuration)
let make_query_request
  ?collapse_configuration:(collapse_configuration_ :
                            collapse_configuration option)
   ?spell_correction_configuration:(spell_correction_configuration_ :
                                     spell_correction_configuration option)
   ?visitor_id:(visitor_id_ : string option) 
  ?user_context:(user_context_ : user_context option) 
  ?sorting_configurations:(sorting_configurations_ :
                            sorting_configuration list option)
   ?sorting_configuration:(sorting_configuration_ :
                            sorting_configuration option)
   ?page_size:(page_size_ : int option) 
  ?page_number:(page_number_ : int option) 
  ?document_relevance_override_configurations:(document_relevance_override_configurations_
                                                :
                                                document_relevance_configuration
                                                  list option)
   ?query_result_type_filter:(query_result_type_filter_ :
                               query_result_type option)
   ?requested_document_attributes:(requested_document_attributes_ :
                                    string list option)
   ?facets:(facets_ : facet list option) 
  ?attribute_filter:(attribute_filter_ : attribute_filter option) 
  ?query_text:(query_text_ : string option)  ~index_id:(index_id_ : string) 
  () =
  ({
     collapse_configuration = collapse_configuration_;
     spell_correction_configuration = spell_correction_configuration_;
     visitor_id = visitor_id_;
     user_context = user_context_;
     sorting_configurations = sorting_configurations_;
     sorting_configuration = sorting_configuration_;
     page_size = page_size_;
     page_number = page_number_;
     document_relevance_override_configurations =
       document_relevance_override_configurations_;
     query_result_type_filter = query_result_type_filter_;
     requested_document_attributes = requested_document_attributes_;
     facets = facets_;
     attribute_filter = attribute_filter_;
     query_text = query_text_;
     index_id = index_id_
   } : query_request)
let make_member_group ?data_source_id:(data_source_id_ : string option) 
  ~group_id:(group_id_ : string)  () =
  ({ data_source_id = data_source_id_; group_id = group_id_ } : member_group)
let make_member_user ~user_id:(user_id_ : string)  () =
  ({ user_id = user_id_ } : member_user)
let make_group_members
  ?s3_pathfor_group_members:(s3_pathfor_group_members_ : s3_path option) 
  ?member_users:(member_users_ : member_user list option) 
  ?member_groups:(member_groups_ : member_group list option)  () =
  ({
     s3_pathfor_group_members = s3_pathfor_group_members_;
     member_users = member_users_;
     member_groups = member_groups_
   } : group_members)
let make_put_principal_mapping_request ?role_arn:(role_arn_ : string option) 
  ?ordering_id:(ordering_id_ : int option) 
  ?data_source_id:(data_source_id_ : string option) 
  ~group_members:(group_members_ : group_members) 
  ~group_id:(group_id_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     role_arn = role_arn_;
     ordering_id = ordering_id_;
     group_members = group_members_;
     group_id = group_id_;
     data_source_id = data_source_id_;
     index_id = index_id_
   } : put_principal_mapping_request)
let make_personas_summary
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?persona:(persona_ : persona option) 
  ?entity_id:(entity_id_ : string option)  () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     persona = persona_;
     entity_id = entity_id_
   } : personas_summary)
let make_list_thesauri_response
  ?thesaurus_summary_items:(thesaurus_summary_items_ :
                             thesaurus_summary list option)
   ?next_token:(next_token_ : string option)  () =
  ({
     thesaurus_summary_items = thesaurus_summary_items_;
     next_token = next_token_
   } : list_thesauri_response)
let make_list_thesauri_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_
   } : list_thesauri_request)
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option)  ()
  = ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)
let make_list_query_suggestions_block_lists_response
  ?next_token:(next_token_ : string option) 
  ?block_list_summary_items:(block_list_summary_items_ :
                              query_suggestions_block_list_summary list
                                option)
   () =
  ({
     next_token = next_token_;
     block_list_summary_items = block_list_summary_items_
   } : list_query_suggestions_block_lists_response)
let make_list_query_suggestions_block_lists_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_
   } : list_query_suggestions_block_lists_request)
let make_group_summary ?ordering_id:(ordering_id_ : int option) 
  ?group_id:(group_id_ : string option)  () =
  ({ ordering_id = ordering_id_; group_id = group_id_ } : group_summary)
let make_index_configuration_summary
  ?edition:(edition_ : index_edition option)  ?id:(id_ : string option) 
  ?name:(name_ : string option)  ~status:(status_ : index_status) 
  ~updated_at:(updated_at_ : CoreTypes.Timestamp.t) 
  ~created_at:(created_at_ : CoreTypes.Timestamp.t)  () =
  ({
     status = status_;
     updated_at = updated_at_;
     created_at = created_at_;
     edition = edition_;
     id = id_;
     name = name_
   } : index_configuration_summary)
let make_list_indices_response ?next_token:(next_token_ : string option) 
  ?index_configuration_summary_items:(index_configuration_summary_items_ :
                                       index_configuration_summary list
                                         option)
   () =
  ({
     next_token = next_token_;
     index_configuration_summary_items = index_configuration_summary_items_
   } : list_indices_response)
let make_list_indices_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  () =
  ({ max_results = max_results_; next_token = next_token_ } : list_indices_request)
let make_list_groups_older_than_ordering_id_response
  ?next_token:(next_token_ : string option) 
  ?groups_summaries:(groups_summaries_ : group_summary list option)  () =
  ({ next_token = next_token_; groups_summaries = groups_summaries_ } : 
  list_groups_older_than_ordering_id_response)
let make_list_groups_older_than_ordering_id_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?data_source_id:(data_source_id_ : string option) 
  ~ordering_id:(ordering_id_ : int)  ~index_id:(index_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     ordering_id = ordering_id_;
     data_source_id = data_source_id_;
     index_id = index_id_
   } : list_groups_older_than_ordering_id_request)
let make_featured_results_set_summary
  ?creation_timestamp:(creation_timestamp_ : int option) 
  ?last_updated_timestamp:(last_updated_timestamp_ : int option) 
  ?status:(status_ : featured_results_set_status option) 
  ?featured_results_set_name:(featured_results_set_name_ : string option) 
  ?featured_results_set_id:(featured_results_set_id_ : string option)  () =
  ({
     creation_timestamp = creation_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
     status = status_;
     featured_results_set_name = featured_results_set_name_;
     featured_results_set_id = featured_results_set_id_
   } : featured_results_set_summary)
let make_list_featured_results_sets_response
  ?next_token:(next_token_ : string option) 
  ?featured_results_set_summary_items:(featured_results_set_summary_items_ :
                                        featured_results_set_summary list
                                          option)
   () =
  ({
     next_token = next_token_;
     featured_results_set_summary_items = featured_results_set_summary_items_
   } : list_featured_results_sets_response)
let make_list_featured_results_sets_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_
   } : list_featured_results_sets_request)
let make_faq_summary ?language_code:(language_code_ : string option) 
  ?file_format:(file_format_ : faq_file_format option) 
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : faq_status option)  ?name:(name_ : string option) 
  ?id:(id_ : string option)  () =
  ({
     language_code = language_code_;
     file_format = file_format_;
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     name = name_;
     id = id_
   } : faq_summary)
let make_list_faqs_response
  ?faq_summary_items:(faq_summary_items_ : faq_summary list option) 
  ?next_token:(next_token_ : string option)  () =
  ({ faq_summary_items = faq_summary_items_; next_token = next_token_ } : 
  list_faqs_response)
let make_list_faqs_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_
   } : list_faqs_request)
let make_experience_endpoint ?endpoint:(endpoint_ : string option) 
  ?endpoint_type:(endpoint_type_ : endpoint_type option)  () =
  ({ endpoint = endpoint_; endpoint_type = endpoint_type_ } : experience_endpoint)
let make_experiences_summary
  ?endpoints:(endpoints_ : experience_endpoint list option) 
  ?status:(status_ : experience_status option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?id:(id_ : string option)  ?name:(name_ : string option)  () =
  ({
     endpoints = endpoints_;
     status = status_;
     created_at = created_at_;
     id = id_;
     name = name_
   } : experiences_summary)
let make_list_experiences_response ?next_token:(next_token_ : string option) 
  ?summary_items:(summary_items_ : experiences_summary list option)  () =
  ({ next_token = next_token_; summary_items = summary_items_ } : list_experiences_response)
let make_list_experiences_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_
   } : list_experiences_request)
let make_entity_display_data ?last_name:(last_name_ : string option) 
  ?first_name:(first_name_ : string option) 
  ?identified_user_name:(identified_user_name_ : string option) 
  ?group_name:(group_name_ : string option) 
  ?user_name:(user_name_ : string option)  () =
  ({
     last_name = last_name_;
     first_name = first_name_;
     identified_user_name = identified_user_name_;
     group_name = group_name_;
     user_name = user_name_
   } : entity_display_data)
let make_experience_entities_summary
  ?display_data:(display_data_ : entity_display_data option) 
  ?entity_type:(entity_type_ : entity_type option) 
  ?entity_id:(entity_id_ : string option)  () =
  ({
     display_data = display_data_;
     entity_type = entity_type_;
     entity_id = entity_id_
   } : experience_entities_summary)
let make_list_experience_entities_response
  ?next_token:(next_token_ : string option) 
  ?summary_items:(summary_items_ : experience_entities_summary list option) 
  () =
  ({ next_token = next_token_; summary_items = summary_items_ } : list_experience_entities_response)
let make_list_experience_entities_request
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ next_token = next_token_; index_id = index_id_; id = id_ } : list_experience_entities_request)
let make_list_entity_personas_response
  ?next_token:(next_token_ : string option) 
  ?summary_items:(summary_items_ : personas_summary list option)  () =
  ({ next_token = next_token_; summary_items = summary_items_ } : list_entity_personas_response)
let make_list_entity_personas_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_;
     id = id_
   } : list_entity_personas_request)
let make_data_source_summary ?language_code:(language_code_ : string option) 
  ?status:(status_ : data_source_status option) 
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?type_:(type__ : data_source_type option)  ?id:(id_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     language_code = language_code_;
     status = status_;
     updated_at = updated_at_;
     created_at = created_at_;
     type_ = type__;
     id = id_;
     name = name_
   } : data_source_summary)
let make_list_data_sources_response ?next_token:(next_token_ : string option)
   ?summary_items:(summary_items_ : data_source_summary list option)  () =
  ({ next_token = next_token_; summary_items = summary_items_ } : list_data_sources_response)
let make_list_data_sources_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_
   } : list_data_sources_request)
let make_data_source_sync_job_metrics
  ?documents_scanned:(documents_scanned_ : string option) 
  ?documents_failed:(documents_failed_ : string option) 
  ?documents_deleted:(documents_deleted_ : string option) 
  ?documents_modified:(documents_modified_ : string option) 
  ?documents_added:(documents_added_ : string option)  () =
  ({
     documents_scanned = documents_scanned_;
     documents_failed = documents_failed_;
     documents_deleted = documents_deleted_;
     documents_modified = documents_modified_;
     documents_added = documents_added_
   } : data_source_sync_job_metrics)
let make_data_source_sync_job
  ?metrics:(metrics_ : data_source_sync_job_metrics option) 
  ?data_source_error_code:(data_source_error_code_ : string option) 
  ?error_code:(error_code_ : error_code option) 
  ?error_message:(error_message_ : string option) 
  ?status:(status_ : data_source_sync_job_status option) 
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?execution_id:(execution_id_ : string option)  () =
  ({
     metrics = metrics_;
     data_source_error_code = data_source_error_code_;
     error_code = error_code_;
     error_message = error_message_;
     status = status_;
     end_time = end_time_;
     start_time = start_time_;
     execution_id = execution_id_
   } : data_source_sync_job)
let make_list_data_source_sync_jobs_response
  ?next_token:(next_token_ : string option) 
  ?history:(history_ : data_source_sync_job list option)  () =
  ({ next_token = next_token_; history = history_ } : list_data_source_sync_jobs_response)
let make_list_data_source_sync_jobs_request
  ?status_filter:(status_filter_ : data_source_sync_job_status option) 
  ?start_time_filter:(start_time_filter_ : time_range option) 
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({
     status_filter = status_filter_;
     start_time_filter = start_time_filter_;
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_;
     id = id_
   } : list_data_source_sync_jobs_request)
let make_access_control_configuration_summary ~id:(id_ : string)  () =
  ({ id = id_ } : access_control_configuration_summary)
let make_list_access_control_configurations_response
  ?next_token:(next_token_ : string option) 
  ~access_control_configurations:(access_control_configurations_ :
                                   access_control_configuration_summary list)
   () =
  ({
     access_control_configurations = access_control_configurations_;
     next_token = next_token_
   } : list_access_control_configurations_response)
let make_list_access_control_configurations_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~index_id:(index_id_ : string) 
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     index_id = index_id_
   } : list_access_control_configurations_request)
let make_faq_statistics
  ~indexed_question_answers_count:(indexed_question_answers_count_ : int)  ()
  =
  ({ indexed_question_answers_count = indexed_question_answers_count_ } : 
  faq_statistics)
let make_index_statistics
  ~text_document_statistics:(text_document_statistics_ :
                              text_document_statistics)
   ~faq_statistics:(faq_statistics_ : faq_statistics)  () =
  ({
     text_document_statistics = text_document_statistics_;
     faq_statistics = faq_statistics_
   } : index_statistics)
let make_group_ordering_id_summary
  ?failure_reason:(failure_reason_ : string option) 
  ?ordering_id:(ordering_id_ : int option) 
  ?received_at:(received_at_ : CoreTypes.Timestamp.t option) 
  ?last_updated_at:(last_updated_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : principal_mapping_status option)  () =
  ({
     failure_reason = failure_reason_;
     ordering_id = ordering_id_;
     received_at = received_at_;
     last_updated_at = last_updated_at_;
     status = status_
   } : group_ordering_id_summary)
let make_get_snapshots_response ?next_token:(next_token_ : string option) 
  ?snapshots_data:(snapshots_data_ : string list list option) 
  ?snapshots_data_header:(snapshots_data_header_ : string list option) 
  ?snap_shot_time_filter:(snap_shot_time_filter_ : time_range option)  () =
  ({
     next_token = next_token_;
     snapshots_data = snapshots_data_;
     snapshots_data_header = snapshots_data_header_;
     snap_shot_time_filter = snap_shot_time_filter_
   } : get_snapshots_response)
let make_get_snapshots_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~metric_type:(metric_type_ : metric_type)  ~interval:(interval_ : interval)
   ~index_id:(index_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     metric_type = metric_type_;
     interval = interval_;
     index_id = index_id_
   } : get_snapshots_request)
let make_get_query_suggestions_response
  ?suggestions:(suggestions_ : suggestion list option) 
  ?query_suggestions_id:(query_suggestions_id_ : string option)  () =
  ({ suggestions = suggestions_; query_suggestions_id = query_suggestions_id_
   } : get_query_suggestions_response)
let make_attribute_suggestions_get_config
  ?user_context:(user_context_ : user_context option) 
  ?attribute_filter:(attribute_filter_ : attribute_filter option) 
  ?additional_response_attributes:(additional_response_attributes_ :
                                    string list option)
   ?suggestion_attributes:(suggestion_attributes_ : string list option)  () =
  ({
     user_context = user_context_;
     attribute_filter = attribute_filter_;
     additional_response_attributes = additional_response_attributes_;
     suggestion_attributes = suggestion_attributes_
   } : attribute_suggestions_get_config)
let make_get_query_suggestions_request
  ?attribute_suggestions_config:(attribute_suggestions_config_ :
                                  attribute_suggestions_get_config option)
   ?suggestion_types:(suggestion_types_ : suggestion_type list option) 
  ?max_suggestions_count:(max_suggestions_count_ : int option) 
  ~query_text:(query_text_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     attribute_suggestions_config = attribute_suggestions_config_;
     suggestion_types = suggestion_types_;
     max_suggestions_count = max_suggestions_count_;
     query_text = query_text_;
     index_id = index_id_
   } : get_query_suggestions_request)
let make_featured_document_with_metadata ?ur_i:(ur_i_ : string option) 
  ?title:(title_ : string option)  ?id:(id_ : string option)  () =
  ({ ur_i = ur_i_; title = title_; id = id_ } : featured_document_with_metadata)
let make_featured_document_missing ?id:(id_ : string option)  () =
  ({ id = id_ } : featured_document_missing)
let make_failed_entity ?error_message:(error_message_ : string option) 
  ?entity_id:(entity_id_ : string option)  () =
  ({ error_message = error_message_; entity_id = entity_id_ } : failed_entity)
let make_entity_persona_configuration ~persona:(persona_ : persona) 
  ~entity_id:(entity_id_ : string)  () =
  ({ persona = persona_; entity_id = entity_id_ } : entity_persona_configuration)
let make_entity_configuration ~entity_type:(entity_type_ : entity_type) 
  ~entity_id:(entity_id_ : string)  () =
  ({ entity_type = entity_type_; entity_id = entity_id_ } : entity_configuration)
let make_document
  ?access_control_configuration_id:(access_control_configuration_id_ :
                                     string option)
   ?content_type:(content_type_ : content_type option) 
  ?hierarchical_access_control_list:(hierarchical_access_control_list_ :
                                      hierarchical_principal list option)
   ?access_control_list:(access_control_list_ : principal list option) 
  ?attributes:(attributes_ : document_attribute list option) 
  ?s3_path:(s3_path_ : s3_path option)  ?blob:(blob_ : bytes option) 
  ?title:(title_ : string option)  ~id:(id_ : string)  () =
  ({
     access_control_configuration_id = access_control_configuration_id_;
     content_type = content_type_;
     hierarchical_access_control_list = hierarchical_access_control_list_;
     access_control_list = access_control_list_;
     attributes = attributes_;
     s3_path = s3_path_;
     blob = blob_;
     title = title_;
     id = id_
   } : document)
let make_document_info
  ?attributes:(attributes_ : document_attribute list option) 
  ~document_id:(document_id_ : string)  () =
  ({ attributes = attributes_; document_id = document_id_ } : document_info)
let make_disassociate_personas_from_entities_response
  ?failed_entity_list:(failed_entity_list_ : failed_entity list option)  () =
  ({ failed_entity_list = failed_entity_list_ } : disassociate_personas_from_entities_response)
let make_disassociate_personas_from_entities_request
  ~entity_ids:(entity_ids_ : string list)  ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ entity_ids = entity_ids_; index_id = index_id_; id = id_ } : disassociate_personas_from_entities_request)
let make_disassociate_entities_from_experience_response
  ?failed_entity_list:(failed_entity_list_ : failed_entity list option)  () =
  ({ failed_entity_list = failed_entity_list_ } : disassociate_entities_from_experience_response)
let make_disassociate_entities_from_experience_request
  ~entity_list:(entity_list_ : entity_configuration list) 
  ~index_id:(index_id_ : string)  ~id:(id_ : string)  () =
  ({ entity_list = entity_list_; index_id = index_id_; id = id_ } : disassociate_entities_from_experience_request)
let make_describe_thesaurus_response
  ?synonym_rule_count:(synonym_rule_count_ : int option) 
  ?term_count:(term_count_ : int option) 
  ?file_size_bytes:(file_size_bytes_ : int option) 
  ?source_s3_path:(source_s3_path_ : s3_path option) 
  ?role_arn:(role_arn_ : string option) 
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?error_message:(error_message_ : string option) 
  ?status:(status_ : thesaurus_status option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?index_id:(index_id_ : string option)  ?id:(id_ : string option)  () =
  ({
     synonym_rule_count = synonym_rule_count_;
     term_count = term_count_;
     file_size_bytes = file_size_bytes_;
     source_s3_path = source_s3_path_;
     role_arn = role_arn_;
     updated_at = updated_at_;
     created_at = created_at_;
     error_message = error_message_;
     status = status_;
     description = description_;
     name = name_;
     index_id = index_id_;
     id = id_
   } : describe_thesaurus_response)
let make_describe_thesaurus_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : describe_thesaurus_request)
let make_attribute_suggestions_describe_config
  ?attribute_suggestions_mode:(attribute_suggestions_mode_ :
                                attribute_suggestions_mode option)
   ?suggestable_config_list:(suggestable_config_list_ :
                              suggestable_config list option)
   () =
  ({
     attribute_suggestions_mode = attribute_suggestions_mode_;
     suggestable_config_list = suggestable_config_list_
   } : attribute_suggestions_describe_config)
let make_describe_query_suggestions_config_response
  ?attribute_suggestions_config:(attribute_suggestions_config_ :
                                  attribute_suggestions_describe_config
                                    option)
   ?total_suggestions_count:(total_suggestions_count_ : int option) 
  ?last_clear_time:(last_clear_time_ : CoreTypes.Timestamp.t option) 
  ?last_suggestions_build_time:(last_suggestions_build_time_ :
                                 CoreTypes.Timestamp.t option)
   ?minimum_query_count:(minimum_query_count_ : int option) 
  ?minimum_number_of_querying_users:(minimum_number_of_querying_users_ :
                                      int option)
   ?include_queries_without_user_information:(include_queries_without_user_information_
                                               : bool option)
   ?query_log_look_back_window_in_days:(query_log_look_back_window_in_days_ :
                                         int option)
   ?status:(status_ : query_suggestions_status option) 
  ?mode:(mode_ : mode option)  () =
  ({
     attribute_suggestions_config = attribute_suggestions_config_;
     total_suggestions_count = total_suggestions_count_;
     last_clear_time = last_clear_time_;
     last_suggestions_build_time = last_suggestions_build_time_;
     minimum_query_count = minimum_query_count_;
     minimum_number_of_querying_users = minimum_number_of_querying_users_;
     include_queries_without_user_information =
       include_queries_without_user_information_;
     query_log_look_back_window_in_days = query_log_look_back_window_in_days_;
     status = status_;
     mode = mode_
   } : describe_query_suggestions_config_response)
let make_describe_query_suggestions_config_request
  ~index_id:(index_id_ : string)  () =
  ({ index_id = index_id_ } : describe_query_suggestions_config_request)
let make_describe_query_suggestions_block_list_response
  ?role_arn:(role_arn_ : string option) 
  ?file_size_bytes:(file_size_bytes_ : int option) 
  ?item_count:(item_count_ : int option) 
  ?source_s3_path:(source_s3_path_ : s3_path option) 
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?error_message:(error_message_ : string option) 
  ?status:(status_ : query_suggestions_block_list_status option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?id:(id_ : string option)  ?index_id:(index_id_ : string option)  () =
  ({
     role_arn = role_arn_;
     file_size_bytes = file_size_bytes_;
     item_count = item_count_;
     source_s3_path = source_s3_path_;
     updated_at = updated_at_;
     created_at = created_at_;
     error_message = error_message_;
     status = status_;
     description = description_;
     name = name_;
     id = id_;
     index_id = index_id_
   } : describe_query_suggestions_block_list_response)
let make_describe_query_suggestions_block_list_request ~id:(id_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({ id = id_; index_id = index_id_ } : describe_query_suggestions_block_list_request)
let make_describe_principal_mapping_response
  ?group_ordering_id_summaries:(group_ordering_id_summaries_ :
                                 group_ordering_id_summary list option)
   ?group_id:(group_id_ : string option) 
  ?data_source_id:(data_source_id_ : string option) 
  ?index_id:(index_id_ : string option)  () =
  ({
     group_ordering_id_summaries = group_ordering_id_summaries_;
     group_id = group_id_;
     data_source_id = data_source_id_;
     index_id = index_id_
   } : describe_principal_mapping_response)
let make_describe_principal_mapping_request
  ?data_source_id:(data_source_id_ : string option) 
  ~group_id:(group_id_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     group_id = group_id_;
     data_source_id = data_source_id_;
     index_id = index_id_
   } : describe_principal_mapping_request)
let make_describe_index_response
  ?user_group_resolution_configuration:(user_group_resolution_configuration_
                                         :
                                         user_group_resolution_configuration
                                           option)
   ?user_context_policy:(user_context_policy_ : user_context_policy option) 
  ?user_token_configurations:(user_token_configurations_ :
                               user_token_configuration list option)
   ?capacity_units:(capacity_units_ : capacity_units_configuration option) 
  ?error_message:(error_message_ : string option) 
  ?index_statistics:(index_statistics_ : index_statistics option) 
  ?document_metadata_configurations:(document_metadata_configurations_ :
                                      document_metadata_configuration list
                                        option)
   ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?description:(description_ : string option) 
  ?status:(status_ : index_status option) 
  ?server_side_encryption_configuration:(server_side_encryption_configuration_
                                          :
                                          server_side_encryption_configuration
                                            option)
   ?role_arn:(role_arn_ : string option) 
  ?edition:(edition_ : index_edition option)  ?id:(id_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     user_group_resolution_configuration =
       user_group_resolution_configuration_;
     user_context_policy = user_context_policy_;
     user_token_configurations = user_token_configurations_;
     capacity_units = capacity_units_;
     error_message = error_message_;
     index_statistics = index_statistics_;
     document_metadata_configurations = document_metadata_configurations_;
     updated_at = updated_at_;
     created_at = created_at_;
     description = description_;
     status = status_;
     server_side_encryption_configuration =
       server_side_encryption_configuration_;
     role_arn = role_arn_;
     edition = edition_;
     id = id_;
     name = name_
   } : describe_index_response)
let make_describe_index_request ~id:(id_ : string)  () =
  ({ id = id_ } : describe_index_request)
let make_describe_featured_results_set_response
  ?creation_timestamp:(creation_timestamp_ : int option) 
  ?last_updated_timestamp:(last_updated_timestamp_ : int option) 
  ?featured_documents_missing:(featured_documents_missing_ :
                                featured_document_missing list option)
   ?featured_documents_with_metadata:(featured_documents_with_metadata_ :
                                       featured_document_with_metadata list
                                         option)
   ?query_texts:(query_texts_ : string list option) 
  ?status:(status_ : featured_results_set_status option) 
  ?description:(description_ : string option) 
  ?featured_results_set_name:(featured_results_set_name_ : string option) 
  ?featured_results_set_id:(featured_results_set_id_ : string option)  () =
  ({
     creation_timestamp = creation_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
     featured_documents_missing = featured_documents_missing_;
     featured_documents_with_metadata = featured_documents_with_metadata_;
     query_texts = query_texts_;
     status = status_;
     description = description_;
     featured_results_set_name = featured_results_set_name_;
     featured_results_set_id = featured_results_set_id_
   } : describe_featured_results_set_response)
let make_describe_featured_results_set_request
  ~featured_results_set_id:(featured_results_set_id_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({ featured_results_set_id = featured_results_set_id_; index_id = index_id_
   } : describe_featured_results_set_request)
let make_describe_faq_response
  ?language_code:(language_code_ : string option) 
  ?file_format:(file_format_ : faq_file_format option) 
  ?error_message:(error_message_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?status:(status_ : faq_status option)  ?s3_path:(s3_path_ : s3_path option)
   ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?index_id:(index_id_ : string option)  ?id:(id_ : string option)  () =
  ({
     language_code = language_code_;
     file_format = file_format_;
     error_message = error_message_;
     role_arn = role_arn_;
     status = status_;
     s3_path = s3_path_;
     updated_at = updated_at_;
     created_at = created_at_;
     description = description_;
     name = name_;
     index_id = index_id_;
     id = id_
   } : describe_faq_response)
let make_describe_faq_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : describe_faq_request)
let make_describe_experience_response
  ?error_message:(error_message_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?status:(status_ : experience_status option) 
  ?description:(description_ : string option) 
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?configuration:(configuration_ : experience_configuration option) 
  ?endpoints:(endpoints_ : experience_endpoint list option) 
  ?name:(name_ : string option)  ?index_id:(index_id_ : string option) 
  ?id:(id_ : string option)  () =
  ({
     error_message = error_message_;
     role_arn = role_arn_;
     status = status_;
     description = description_;
     updated_at = updated_at_;
     created_at = created_at_;
     configuration = configuration_;
     endpoints = endpoints_;
     name = name_;
     index_id = index_id_;
     id = id_
   } : describe_experience_response)
let make_describe_experience_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : describe_experience_request)
let make_describe_data_source_response
  ?custom_document_enrichment_configuration:(custom_document_enrichment_configuration_
                                              :
                                              custom_document_enrichment_configuration
                                                option)
   ?language_code:(language_code_ : string option) 
  ?error_message:(error_message_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?schedule:(schedule_ : string option) 
  ?status:(status_ : data_source_status option) 
  ?description:(description_ : string option) 
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ?configuration:(configuration_ : data_source_configuration option) 
  ?type_:(type__ : data_source_type option)  ?name:(name_ : string option) 
  ?index_id:(index_id_ : string option)  ?id:(id_ : string option)  () =
  ({
     custom_document_enrichment_configuration =
       custom_document_enrichment_configuration_;
     language_code = language_code_;
     error_message = error_message_;
     role_arn = role_arn_;
     schedule = schedule_;
     status = status_;
     description = description_;
     updated_at = updated_at_;
     created_at = created_at_;
     vpc_configuration = vpc_configuration_;
     configuration = configuration_;
     type_ = type__;
     name = name_;
     index_id = index_id_;
     id = id_
   } : describe_data_source_response)
let make_describe_data_source_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : describe_data_source_request)
let make_describe_access_control_configuration_response
  ?hierarchical_access_control_list:(hierarchical_access_control_list_ :
                                      hierarchical_principal list option)
   ?access_control_list:(access_control_list_ : principal list option) 
  ?error_message:(error_message_ : string option) 
  ?description:(description_ : string option)  ~name:(name_ : string)  () =
  ({
     hierarchical_access_control_list = hierarchical_access_control_list_;
     access_control_list = access_control_list_;
     error_message = error_message_;
     description = description_;
     name = name_
   } : describe_access_control_configuration_response)
let make_describe_access_control_configuration_request ~id:(id_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({ id = id_; index_id = index_id_ } : describe_access_control_configuration_request)
let make_delete_thesaurus_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : delete_thesaurus_request)
let make_delete_query_suggestions_block_list_request ~id:(id_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({ id = id_; index_id = index_id_ } : delete_query_suggestions_block_list_request)
let make_delete_principal_mapping_request
  ?ordering_id:(ordering_id_ : int option) 
  ?data_source_id:(data_source_id_ : string option) 
  ~group_id:(group_id_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     ordering_id = ordering_id_;
     group_id = group_id_;
     data_source_id = data_source_id_;
     index_id = index_id_
   } : delete_principal_mapping_request)
let make_delete_index_request ~id:(id_ : string)  () =
  ({ id = id_ } : delete_index_request)
let make_delete_faq_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : delete_faq_request)
let make_delete_experience_response () = (() : unit)
let make_delete_experience_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : delete_experience_request)
let make_delete_data_source_request ~index_id:(index_id_ : string) 
  ~id:(id_ : string)  () =
  ({ index_id = index_id_; id = id_ } : delete_data_source_request)
let make_delete_access_control_configuration_response () = (() : unit)
let make_delete_access_control_configuration_request ~id:(id_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({ id = id_; index_id = index_id_ } : delete_access_control_configuration_request)
let make_data_source_sync_job_metric_target
  ?data_source_sync_job_id:(data_source_sync_job_id_ : string option) 
  ~data_source_id:(data_source_id_ : string)  () =
  ({
     data_source_sync_job_id = data_source_sync_job_id_;
     data_source_id = data_source_id_
   } : data_source_sync_job_metric_target)
let make_create_thesaurus_response ?id:(id_ : string option)  () =
  ({ id = id_ } : create_thesaurus_response)
let make_create_thesaurus_request
  ?client_token:(client_token_ : string option) 
  ?tags:(tags_ : tag list option) 
  ?description:(description_ : string option) 
  ~source_s3_path:(source_s3_path_ : s3_path)  ~role_arn:(role_arn_ : string)
   ~name:(name_ : string)  ~index_id:(index_id_ : string)  () =
  ({
     client_token = client_token_;
     source_s3_path = source_s3_path_;
     tags = tags_;
     role_arn = role_arn_;
     description = description_;
     name = name_;
     index_id = index_id_
   } : create_thesaurus_request)
let make_create_query_suggestions_block_list_response
  ?id:(id_ : string option)  () =
  ({ id = id_ } : create_query_suggestions_block_list_response)
let make_create_query_suggestions_block_list_request
  ?tags:(tags_ : tag list option) 
  ?client_token:(client_token_ : string option) 
  ?description:(description_ : string option)  ~role_arn:(role_arn_ : string)
   ~source_s3_path:(source_s3_path_ : s3_path)  ~name:(name_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({
     tags = tags_;
     role_arn = role_arn_;
     client_token = client_token_;
     source_s3_path = source_s3_path_;
     description = description_;
     name = name_;
     index_id = index_id_
   } : create_query_suggestions_block_list_request)
let make_create_index_response ?id:(id_ : string option)  () =
  ({ id = id_ } : create_index_response)
let make_create_index_request
  ?user_group_resolution_configuration:(user_group_resolution_configuration_
                                         :
                                         user_group_resolution_configuration
                                           option)
   ?user_context_policy:(user_context_policy_ : user_context_policy option) 
  ?user_token_configurations:(user_token_configurations_ :
                               user_token_configuration list option)
   ?tags:(tags_ : tag list option) 
  ?client_token:(client_token_ : string option) 
  ?description:(description_ : string option) 
  ?server_side_encryption_configuration:(server_side_encryption_configuration_
                                          :
                                          server_side_encryption_configuration
                                            option)
   ?edition:(edition_ : index_edition option)  ~role_arn:(role_arn_ : string)
   ~name:(name_ : string)  () =
  ({
     user_group_resolution_configuration =
       user_group_resolution_configuration_;
     user_context_policy = user_context_policy_;
     user_token_configurations = user_token_configurations_;
     tags = tags_;
     client_token = client_token_;
     description = description_;
     server_side_encryption_configuration =
       server_side_encryption_configuration_;
     role_arn = role_arn_;
     edition = edition_;
     name = name_
   } : create_index_request)
let make_create_featured_results_set_response
  ?featured_results_set:(featured_results_set_ : featured_results_set option)
   () =
  ({ featured_results_set = featured_results_set_ } : create_featured_results_set_response)
let make_create_featured_results_set_request ?tags:(tags_ : tag list option) 
  ?featured_documents:(featured_documents_ : featured_document list option) 
  ?query_texts:(query_texts_ : string list option) 
  ?status:(status_ : featured_results_set_status option) 
  ?client_token:(client_token_ : string option) 
  ?description:(description_ : string option) 
  ~featured_results_set_name:(featured_results_set_name_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({
     tags = tags_;
     featured_documents = featured_documents_;
     query_texts = query_texts_;
     status = status_;
     client_token = client_token_;
     description = description_;
     featured_results_set_name = featured_results_set_name_;
     index_id = index_id_
   } : create_featured_results_set_request)
let make_create_faq_response ?id:(id_ : string option)  () =
  ({ id = id_ } : create_faq_response)
let make_create_faq_request ?language_code:(language_code_ : string option) 
  ?client_token:(client_token_ : string option) 
  ?file_format:(file_format_ : faq_file_format option) 
  ?tags:(tags_ : tag list option) 
  ?description:(description_ : string option)  ~role_arn:(role_arn_ : string)
   ~s3_path:(s3_path_ : s3_path)  ~name:(name_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({
     language_code = language_code_;
     client_token = client_token_;
     file_format = file_format_;
     tags = tags_;
     role_arn = role_arn_;
     s3_path = s3_path_;
     description = description_;
     name = name_;
     index_id = index_id_
   } : create_faq_request)
let make_create_experience_response ~id:(id_ : string)  () =
  ({ id = id_ } : create_experience_response)
let make_create_experience_request
  ?client_token:(client_token_ : string option) 
  ?description:(description_ : string option) 
  ?configuration:(configuration_ : experience_configuration option) 
  ?role_arn:(role_arn_ : string option)  ~index_id:(index_id_ : string) 
  ~name:(name_ : string)  () =
  ({
     client_token = client_token_;
     description = description_;
     configuration = configuration_;
     role_arn = role_arn_;
     index_id = index_id_;
     name = name_
   } : create_experience_request)
let make_create_data_source_response ~id:(id_ : string)  () =
  ({ id = id_ } : create_data_source_response)
let make_create_data_source_request
  ?custom_document_enrichment_configuration:(custom_document_enrichment_configuration_
                                              :
                                              custom_document_enrichment_configuration
                                                option)
   ?language_code:(language_code_ : string option) 
  ?client_token:(client_token_ : string option) 
  ?tags:(tags_ : tag list option)  ?role_arn:(role_arn_ : string option) 
  ?schedule:(schedule_ : string option) 
  ?description:(description_ : string option) 
  ?vpc_configuration:(vpc_configuration_ :
                       data_source_vpc_configuration option)
   ?configuration:(configuration_ : data_source_configuration option) 
  ~type_:(type__ : data_source_type)  ~index_id:(index_id_ : string) 
  ~name:(name_ : string)  () =
  ({
     custom_document_enrichment_configuration =
       custom_document_enrichment_configuration_;
     language_code = language_code_;
     client_token = client_token_;
     tags = tags_;
     role_arn = role_arn_;
     schedule = schedule_;
     description = description_;
     vpc_configuration = vpc_configuration_;
     configuration = configuration_;
     type_ = type__;
     index_id = index_id_;
     name = name_
   } : create_data_source_request)
let make_create_access_control_configuration_response ~id:(id_ : string)  ()
  = ({ id = id_ } : create_access_control_configuration_response)
let make_create_access_control_configuration_request
  ?client_token:(client_token_ : string option) 
  ?hierarchical_access_control_list:(hierarchical_access_control_list_ :
                                      hierarchical_principal list option)
   ?access_control_list:(access_control_list_ : principal list option) 
  ?description:(description_ : string option)  ~name:(name_ : string) 
  ~index_id:(index_id_ : string)  () =
  ({
     client_token = client_token_;
     hierarchical_access_control_list = hierarchical_access_control_list_;
     access_control_list = access_control_list_;
     description = description_;
     name = name_;
     index_id = index_id_
   } : create_access_control_configuration_request)
let make_clear_query_suggestions_request ~index_id:(index_id_ : string)  () =
  ({ index_id = index_id_ } : clear_query_suggestions_request)
let make_batch_put_document_response_failed_document
  ?error_message:(error_message_ : string option) 
  ?error_code:(error_code_ : error_code option)  ?id:(id_ : string option) 
  () =
  ({ error_message = error_message_; error_code = error_code_; id = id_ } : 
  batch_put_document_response_failed_document)
let make_batch_put_document_response
  ?failed_documents:(failed_documents_ :
                      batch_put_document_response_failed_document list option)
   () =
  ({ failed_documents = failed_documents_ } : batch_put_document_response)
let make_batch_put_document_request
  ?custom_document_enrichment_configuration:(custom_document_enrichment_configuration_
                                              :
                                              custom_document_enrichment_configuration
                                                option)
   ?role_arn:(role_arn_ : string option) 
  ~documents:(documents_ : document list)  ~index_id:(index_id_ : string)  ()
  =
  ({
     custom_document_enrichment_configuration =
       custom_document_enrichment_configuration_;
     documents = documents_;
     role_arn = role_arn_;
     index_id = index_id_
   } : batch_put_document_request)
let make_batch_get_document_status_response_error
  ?error_message:(error_message_ : string option) 
  ?error_code:(error_code_ : error_code option) 
  ?document_id:(document_id_ : string option)  () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     document_id = document_id_
   } : batch_get_document_status_response_error)
let make_batch_get_document_status_response
  ?document_status_list:(document_status_list_ : status list option) 
  ?errors:(errors_ : batch_get_document_status_response_error list option) 
  () =
  ({ document_status_list = document_status_list_; errors = errors_ } : 
  batch_get_document_status_response)
let make_batch_get_document_status_request
  ~document_info_list:(document_info_list_ : document_info list) 
  ~index_id:(index_id_ : string)  () =
  ({ document_info_list = document_info_list_; index_id = index_id_ } : 
  batch_get_document_status_request)
let make_batch_delete_featured_results_set_error
  ~error_message:(error_message_ : string) 
  ~error_code:(error_code_ : error_code)  ~id:(id_ : string)  () =
  ({ error_message = error_message_; error_code = error_code_; id = id_ } : 
  batch_delete_featured_results_set_error)
let make_batch_delete_featured_results_set_response
  ~errors:(errors_ : batch_delete_featured_results_set_error list)  () =
  ({ errors = errors_ } : batch_delete_featured_results_set_response)
let make_batch_delete_featured_results_set_request
  ~featured_results_set_ids:(featured_results_set_ids_ : string list) 
  ~index_id:(index_id_ : string)  () =
  ({
     featured_results_set_ids = featured_results_set_ids_;
     index_id = index_id_
   } : batch_delete_featured_results_set_request)
let make_batch_delete_document_response_failed_document
  ?error_message:(error_message_ : string option) 
  ?error_code:(error_code_ : error_code option)  ?id:(id_ : string option) 
  () =
  ({ error_message = error_message_; error_code = error_code_; id = id_ } : 
  batch_delete_document_response_failed_document)
let make_batch_delete_document_response
  ?failed_documents:(failed_documents_ :
                      batch_delete_document_response_failed_document list
                        option)
   () =
  ({ failed_documents = failed_documents_ } : batch_delete_document_response)
let make_batch_delete_document_request
  ?data_source_sync_job_metric_target:(data_source_sync_job_metric_target_ :
                                        data_source_sync_job_metric_target
                                          option)
   ~document_id_list:(document_id_list_ : string list) 
  ~index_id:(index_id_ : string)  () =
  ({
     data_source_sync_job_metric_target = data_source_sync_job_metric_target_;
     document_id_list = document_id_list_;
     index_id = index_id_
   } : batch_delete_document_request)
let make_associate_personas_to_entities_response
  ?failed_entity_list:(failed_entity_list_ : failed_entity list option)  () =
  ({ failed_entity_list = failed_entity_list_ } : associate_personas_to_entities_response)
let make_associate_personas_to_entities_request
  ~personas:(personas_ : entity_persona_configuration list) 
  ~index_id:(index_id_ : string)  ~id:(id_ : string)  () =
  ({ personas = personas_; index_id = index_id_; id = id_ } : associate_personas_to_entities_request)
let make_associate_entities_to_experience_response
  ?failed_entity_list:(failed_entity_list_ : failed_entity list option)  () =
  ({ failed_entity_list = failed_entity_list_ } : associate_entities_to_experience_response)
let make_associate_entities_to_experience_request
  ~entity_list:(entity_list_ : entity_configuration list) 
  ~index_id:(index_id_ : string)  ~id:(id_ : string)  () =
  ({ entity_list = entity_list_; index_id = index_id_; id = id_ } : associate_entities_to_experience_request)