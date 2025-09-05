open Types
let make_vpc_endpoint_summary ?status:(status_ : vpc_endpoint_status option)
  ?name:(name_ : vpc_endpoint_name option) ?id:(id_ : vpc_endpoint_id option)
  () = ({ status = status_; name = name_; id = id_ } : vpc_endpoint_summary)
let make_vpc_endpoint_filters ?status:(status_ : vpc_endpoint_status option)
  () = ({ status = status_ } : vpc_endpoint_filters)
let make_vpc_endpoint_error_detail
  ?error_code:(error_code_ : Smaws_Lib.Smithy_api.string_ option)
  ?error_message:(error_message_ : Smaws_Lib.Smithy_api.string_ option)
  ?id:(id_ : vpc_endpoint_id option) () =
  ({ error_code = error_code_; error_message = error_message_; id = id_ } : 
  vpc_endpoint_error_detail)
let make_vpc_endpoint_detail
  ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.string_ option)
  ?failure_code:(failure_code_ : Smaws_Lib.Smithy_api.string_ option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?status:(status_ : vpc_endpoint_status option)
  ?security_group_ids:(security_group_ids_ : security_group_ids option)
  ?subnet_ids:(subnet_ids_ : subnet_ids option)
  ?vpc_id:(vpc_id_ : vpc_id option) ?name:(name_ : vpc_endpoint_name option)
  ?id:(id_ : vpc_endpoint_id option) () =
  ({
     failure_message = failure_message_;
     failure_code = failure_code_;
     created_date = created_date_;
     status = status_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     name = name_;
     id = id_
   } : vpc_endpoint_detail)
let make_update_vpc_endpoint_detail
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?security_group_ids:(security_group_ids_ : security_group_ids option)
  ?subnet_ids:(subnet_ids_ : subnet_ids option)
  ?status:(status_ : vpc_endpoint_status option)
  ?name:(name_ : vpc_endpoint_name option) ?id:(id_ : vpc_endpoint_id option)
  () =
  ({
     last_modified_date = last_modified_date_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     status = status_;
     name = name_;
     id = id_
   } : update_vpc_endpoint_detail)
let make_update_vpc_endpoint_response
  ?update_vpc_endpoint_detail:(update_vpc_endpoint_detail_ :
                                update_vpc_endpoint_detail option)
  () =
  ({ update_vpc_endpoint_detail = update_vpc_endpoint_detail_ } : update_vpc_endpoint_response)
let make_update_vpc_endpoint_request
  ?client_token:(client_token_ : client_token option)
  ?remove_security_group_ids:(remove_security_group_ids_ :
                               security_group_ids option)
  ?add_security_group_ids:(add_security_group_ids_ :
                            security_group_ids option)
  ?remove_subnet_ids:(remove_subnet_ids_ : subnet_ids option)
  ?add_subnet_ids:(add_subnet_ids_ : subnet_ids option)
  ~id:(id_ : vpc_endpoint_id) () =
  ({
     client_token = client_token_;
     remove_security_group_ids = remove_security_group_ids_;
     add_security_group_ids = add_security_group_ids_;
     remove_subnet_ids = remove_subnet_ids_;
     add_subnet_ids = add_subnet_ids_;
     id = id_
   } : update_vpc_endpoint_request)
let make_security_policy_detail
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?policy:(policy_ : Smaws_Lib.Smithy_api.document option)
  ?description:(description_ : policy_description option)
  ?policy_version:(policy_version_ : policy_version option)
  ?name:(name_ : policy_name option)
  ?type_:(type__ : security_policy_type option) () =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     policy = policy_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : security_policy_detail)
let make_update_security_policy_response
  ?security_policy_detail:(security_policy_detail_ :
                            security_policy_detail option)
  () =
  ({ security_policy_detail = security_policy_detail_ } : update_security_policy_response)
let make_update_security_policy_request
  ?client_token:(client_token_ : client_token option)
  ?policy:(policy_ : policy_document option)
  ?description:(description_ : policy_description option)
  ~policy_version:(policy_version_ : policy_version)
  ~name:(name_ : policy_name) ~type_:(type__ : security_policy_type) () =
  ({
     client_token = client_token_;
     policy = policy_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : update_security_policy_request)
let make_saml_config_options
  ?session_timeout:(session_timeout_ : Smaws_Lib.Smithy_api.integer option)
  ?open_search_serverless_entity_id:(open_search_serverless_entity_id_ :
                                      open_search_serverless_entity_id option)
  ?group_attribute:(group_attribute_ : saml_group_attribute option)
  ?user_attribute:(user_attribute_ : saml_user_attribute option)
  ~metadata:(metadata_ : saml_metadata) () =
  ({
     session_timeout = session_timeout_;
     open_search_serverless_entity_id = open_search_serverless_entity_id_;
     group_attribute = group_attribute_;
     user_attribute = user_attribute_;
     metadata = metadata_
   } : saml_config_options)
let make_iam_identity_center_config_options
  ?group_attribute:(group_attribute_ :
                     iam_identity_center_group_attribute option)
  ?user_attribute:(user_attribute_ :
                    iam_identity_center_user_attribute option)
  ?application_description:(application_description_ :
                             Smaws_Lib.Smithy_api.string_ option)
  ?application_name:(application_name_ : Smaws_Lib.Smithy_api.string_ option)
  ?application_arn:(application_arn_ :
                     iam_identity_center_application_arn option)
  ?instance_arn:(instance_arn_ : iam_identity_center_instance_arn option) ()
  =
  ({
     group_attribute = group_attribute_;
     user_attribute = user_attribute_;
     application_description = application_description_;
     application_name = application_name_;
     application_arn = application_arn_;
     instance_arn = instance_arn_
   } : iam_identity_center_config_options)
let make_security_config_detail
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?iam_identity_center_options:(iam_identity_center_options_ :
                                 iam_identity_center_config_options option)
  ?saml_options:(saml_options_ : saml_config_options option)
  ?description:(description_ : config_description option)
  ?config_version:(config_version_ : policy_version option)
  ?type_:(type__ : security_config_type option)
  ?id:(id_ : security_config_id option) () =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     iam_identity_center_options = iam_identity_center_options_;
     saml_options = saml_options_;
     description = description_;
     config_version = config_version_;
     type_ = type__;
     id = id_
   } : security_config_detail)
let make_update_security_config_response
  ?security_config_detail:(security_config_detail_ :
                            security_config_detail option)
  () =
  ({ security_config_detail = security_config_detail_ } : update_security_config_response)
let make_update_iam_identity_center_config_options
  ?group_attribute:(group_attribute_ :
                     iam_identity_center_group_attribute option)
  ?user_attribute:(user_attribute_ :
                    iam_identity_center_user_attribute option)
  () =
  ({ group_attribute = group_attribute_; user_attribute = user_attribute_ } : 
  update_iam_identity_center_config_options)
let make_update_security_config_request
  ?client_token:(client_token_ : client_token option)
  ?iam_identity_center_options_updates:(iam_identity_center_options_updates_
                                         :
                                         update_iam_identity_center_config_options
                                           option)
  ?saml_options:(saml_options_ : saml_config_options option)
  ?description:(description_ : config_description option)
  ~config_version:(config_version_ : policy_version)
  ~id:(id_ : security_config_id) () =
  ({
     client_token = client_token_;
     iam_identity_center_options_updates =
       iam_identity_center_options_updates_;
     saml_options = saml_options_;
     description = description_;
     config_version = config_version_;
     id = id_
   } : update_security_config_request)
let make_lifecycle_policy_detail
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?policy:(policy_ : Smaws_Lib.Smithy_api.document option)
  ?description:(description_ : policy_description option)
  ?policy_version:(policy_version_ : policy_version option)
  ?name:(name_ : policy_name option)
  ?type_:(type__ : lifecycle_policy_type option) () =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     policy = policy_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : lifecycle_policy_detail)
let make_update_lifecycle_policy_response
  ?lifecycle_policy_detail:(lifecycle_policy_detail_ :
                             lifecycle_policy_detail option)
  () =
  ({ lifecycle_policy_detail = lifecycle_policy_detail_ } : update_lifecycle_policy_response)
let make_update_lifecycle_policy_request
  ?client_token:(client_token_ : client_token option)
  ?policy:(policy_ : policy_document option)
  ?description:(description_ : policy_description option)
  ~policy_version:(policy_version_ : policy_version)
  ~name:(name_ : policy_name) ~type_:(type__ : lifecycle_policy_type) () =
  ({
     client_token = client_token_;
     policy = policy_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : update_lifecycle_policy_request)
let make_update_collection_detail
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?arn:(arn_ : Smaws_Lib.Smithy_api.string_ option)
  ?description:(description_ : Smaws_Lib.Smithy_api.string_ option)
  ?type_:(type__ : collection_type option)
  ?status:(status_ : collection_status option)
  ?name:(name_ : collection_name option) ?id:(id_ : collection_id option) ()
  =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     arn = arn_;
     description = description_;
     type_ = type__;
     status = status_;
     name = name_;
     id = id_
   } : update_collection_detail)
let make_update_collection_response
  ?update_collection_detail:(update_collection_detail_ :
                              update_collection_detail option)
  () =
  ({ update_collection_detail = update_collection_detail_ } : update_collection_response)
let make_update_collection_request
  ?client_token:(client_token_ : client_token option)
  ?description:(description_ : Smaws_Lib.Smithy_api.string_ option)
  ~id:(id_ : collection_id) () =
  ({ client_token = client_token_; description = description_; id = id_ } : 
  update_collection_request)
let make_capacity_limits
  ?max_search_capacity_in_oc_u:(max_search_capacity_in_oc_u_ :
                                 search_capacity_value option)
  ?max_indexing_capacity_in_oc_u:(max_indexing_capacity_in_oc_u_ :
                                   indexing_capacity_value option)
  () =
  ({
     max_search_capacity_in_oc_u = max_search_capacity_in_oc_u_;
     max_indexing_capacity_in_oc_u = max_indexing_capacity_in_oc_u_
   } : capacity_limits)
let make_account_settings_detail
  ?capacity_limits:(capacity_limits_ : capacity_limits option) () =
  ({ capacity_limits = capacity_limits_ } : account_settings_detail)
let make_update_account_settings_response
  ?account_settings_detail:(account_settings_detail_ :
                             account_settings_detail option)
  () =
  ({ account_settings_detail = account_settings_detail_ } : update_account_settings_response)
let make_update_account_settings_request
  ?capacity_limits:(capacity_limits_ : capacity_limits option) () =
  ({ capacity_limits = capacity_limits_ } : update_account_settings_request)
let make_access_policy_detail
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?policy:(policy_ : Smaws_Lib.Smithy_api.document option)
  ?description:(description_ : policy_description option)
  ?policy_version:(policy_version_ : policy_version option)
  ?name:(name_ : policy_name option)
  ?type_:(type__ : access_policy_type option) () =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     policy = policy_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : access_policy_detail)
let make_update_access_policy_response
  ?access_policy_detail:(access_policy_detail_ : access_policy_detail option)
  () =
  ({ access_policy_detail = access_policy_detail_ } : update_access_policy_response)
let make_update_access_policy_request
  ?client_token:(client_token_ : client_token option)
  ?policy:(policy_ : policy_document option)
  ?description:(description_ : policy_description option)
  ~policy_version:(policy_version_ : policy_version)
  ~name:(name_ : policy_name) ~type_:(type__ : access_policy_type) () =
  ({
     client_token = client_token_;
     policy = policy_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : update_access_policy_request)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys)
  ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)
let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_response () = (() : unit)
let make_tag_resource_request ~tags:(tags_ : tags)
  ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)
let make_security_policy_summary
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?description:(description_ : policy_description option)
  ?policy_version:(policy_version_ : policy_version option)
  ?name:(name_ : policy_name option)
  ?type_:(type__ : security_policy_type option) () =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : security_policy_summary)
let make_security_policy_stats
  ?network_policy_count:(network_policy_count_ :
                          Smaws_Lib.Smithy_api.long option)
  ?encryption_policy_count:(encryption_policy_count_ :
                             Smaws_Lib.Smithy_api.long option)
  () =
  ({
     network_policy_count = network_policy_count_;
     encryption_policy_count = encryption_policy_count_
   } : security_policy_stats)
let make_security_config_summary
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?description:(description_ : config_description option)
  ?config_version:(config_version_ : policy_version option)
  ?type_:(type__ : security_config_type option)
  ?id:(id_ : security_config_id option) () =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     description = description_;
     config_version = config_version_;
     type_ = type__;
     id = id_
   } : security_config_summary)
let make_security_config_stats
  ?saml_config_count:(saml_config_count_ : Smaws_Lib.Smithy_api.long option)
  () = ({ saml_config_count = saml_config_count_ } : security_config_stats)
let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn)
  () = ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)
let make_access_policy_stats
  ?data_policy_count:(data_policy_count_ : Smaws_Lib.Smithy_api.long option)
  () = ({ data_policy_count = data_policy_count_ } : access_policy_stats)
let make_lifecycle_policy_stats
  ?retention_policy_count:(retention_policy_count_ :
                            Smaws_Lib.Smithy_api.long option)
  () =
  ({ retention_policy_count = retention_policy_count_ } : lifecycle_policy_stats)
let make_get_policies_stats_response
  ?total_policy_count:(total_policy_count_ :
                        Smaws_Lib.Smithy_api.long option)
  ?lifecycle_policy_stats:(lifecycle_policy_stats_ :
                            lifecycle_policy_stats option)
  ?security_config_stats:(security_config_stats_ :
                           security_config_stats option)
  ?security_policy_stats:(security_policy_stats_ :
                           security_policy_stats option)
  ?access_policy_stats:(access_policy_stats_ : access_policy_stats option) ()
  =
  ({
     total_policy_count = total_policy_count_;
     lifecycle_policy_stats = lifecycle_policy_stats_;
     security_config_stats = security_config_stats_;
     security_policy_stats = security_policy_stats_;
     access_policy_stats = access_policy_stats_
   } : get_policies_stats_response)
let make_get_policies_stats_request () = (() : unit)
let make_get_account_settings_response
  ?account_settings_detail:(account_settings_detail_ :
                             account_settings_detail option)
  () =
  ({ account_settings_detail = account_settings_detail_ } : get_account_settings_response)
let make_get_account_settings_request () = (() : unit)
let make_create_security_policy_response
  ?security_policy_detail:(security_policy_detail_ :
                            security_policy_detail option)
  () =
  ({ security_policy_detail = security_policy_detail_ } : create_security_policy_response)
let make_create_security_policy_request
  ?client_token:(client_token_ : client_token option)
  ?description:(description_ : policy_description option)
  ~policy:(policy_ : policy_document) ~name:(name_ : policy_name)
  ~type_:(type__ : security_policy_type) () =
  ({
     client_token = client_token_;
     policy = policy_;
     description = description_;
     name = name_;
     type_ = type__
   } : create_security_policy_request)
let make_create_lifecycle_policy_response
  ?lifecycle_policy_detail:(lifecycle_policy_detail_ :
                             lifecycle_policy_detail option)
  () =
  ({ lifecycle_policy_detail = lifecycle_policy_detail_ } : create_lifecycle_policy_response)
let make_create_lifecycle_policy_request
  ?client_token:(client_token_ : client_token option)
  ?description:(description_ : policy_description option)
  ~policy:(policy_ : policy_document) ~name:(name_ : policy_name)
  ~type_:(type__ : lifecycle_policy_type) () =
  ({
     client_token = client_token_;
     policy = policy_;
     description = description_;
     name = name_;
     type_ = type__
   } : create_lifecycle_policy_request)
let make_batch_get_vpc_endpoint_response
  ?vpc_endpoint_error_details:(vpc_endpoint_error_details_ :
                                vpc_endpoint_error_details option)
  ?vpc_endpoint_details:(vpc_endpoint_details_ : vpc_endpoint_details option)
  () =
  ({
     vpc_endpoint_error_details = vpc_endpoint_error_details_;
     vpc_endpoint_details = vpc_endpoint_details_
   } : batch_get_vpc_endpoint_response)
let make_batch_get_vpc_endpoint_request ~ids:(ids_ : vpc_endpoint_ids) () =
  ({ ids = ids_ } : batch_get_vpc_endpoint_request)
let make_lifecycle_policy_error_detail
  ?error_code:(error_code_ : Smaws_Lib.Smithy_api.string_ option)
  ?error_message:(error_message_ : Smaws_Lib.Smithy_api.string_ option)
  ?name:(name_ : policy_name option)
  ?type_:(type__ : lifecycle_policy_type option) () =
  ({
     error_code = error_code_;
     error_message = error_message_;
     name = name_;
     type_ = type__
   } : lifecycle_policy_error_detail)
let make_batch_get_lifecycle_policy_response
  ?lifecycle_policy_error_details:(lifecycle_policy_error_details_ :
                                    lifecycle_policy_error_details option)
  ?lifecycle_policy_details:(lifecycle_policy_details_ :
                              lifecycle_policy_details option)
  () =
  ({
     lifecycle_policy_error_details = lifecycle_policy_error_details_;
     lifecycle_policy_details = lifecycle_policy_details_
   } : batch_get_lifecycle_policy_response)
let make_lifecycle_policy_identifier ~name:(name_ : policy_name)
  ~type_:(type__ : lifecycle_policy_type) () =
  ({ name = name_; type_ = type__ } : lifecycle_policy_identifier)
let make_batch_get_lifecycle_policy_request
  ~identifiers:(identifiers_ : lifecycle_policy_identifiers) () =
  ({ identifiers = identifiers_ } : batch_get_lifecycle_policy_request)
let make_effective_lifecycle_policy_detail
  ?no_min_retention_period:(no_min_retention_period_ :
                             Smaws_Lib.Smithy_api.boolean_ option)
  ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.string_ option)
  ?resource_type:(resource_type_ : resource_type option)
  ?policy_name:(policy_name_ : policy_name option)
  ?resource:(resource_ : resource option)
  ?type_:(type__ : lifecycle_policy_type option) () =
  ({
     no_min_retention_period = no_min_retention_period_;
     retention_period = retention_period_;
     resource_type = resource_type_;
     policy_name = policy_name_;
     resource = resource_;
     type_ = type__
   } : effective_lifecycle_policy_detail)
let make_effective_lifecycle_policy_error_detail
  ?error_code:(error_code_ : Smaws_Lib.Smithy_api.string_ option)
  ?error_message:(error_message_ : Smaws_Lib.Smithy_api.string_ option)
  ?resource:(resource_ : resource option)
  ?type_:(type__ : lifecycle_policy_type option) () =
  ({
     error_code = error_code_;
     error_message = error_message_;
     resource = resource_;
     type_ = type__
   } : effective_lifecycle_policy_error_detail)
let make_batch_get_effective_lifecycle_policy_response
  ?effective_lifecycle_policy_error_details:(effective_lifecycle_policy_error_details_
                                              :
                                              effective_lifecycle_policy_error_details
                                                option)
  ?effective_lifecycle_policy_details:(effective_lifecycle_policy_details_ :
                                        effective_lifecycle_policy_details
                                          option)
  () =
  ({
     effective_lifecycle_policy_error_details =
       effective_lifecycle_policy_error_details_;
     effective_lifecycle_policy_details = effective_lifecycle_policy_details_
   } : batch_get_effective_lifecycle_policy_response)
let make_lifecycle_policy_resource_identifier
  ~resource:(resource_ : resource_name)
  ~type_:(type__ : lifecycle_policy_type) () =
  ({ resource = resource_; type_ = type__ } : lifecycle_policy_resource_identifier)
let make_batch_get_effective_lifecycle_policy_request
  ~resource_identifiers:(resource_identifiers_ :
                          lifecycle_policy_resource_identifiers)
  () =
  ({ resource_identifiers = resource_identifiers_ } : batch_get_effective_lifecycle_policy_request)
let make_collection_detail
  ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.string_ option)
  ?failure_code:(failure_code_ : Smaws_Lib.Smithy_api.string_ option)
  ?dashboard_endpoint:(dashboard_endpoint_ :
                        Smaws_Lib.Smithy_api.string_ option)
  ?collection_endpoint:(collection_endpoint_ :
                         Smaws_Lib.Smithy_api.string_ option)
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?standby_replicas:(standby_replicas_ : standby_replicas option)
  ?kms_key_arn:(kms_key_arn_ : Smaws_Lib.Smithy_api.string_ option)
  ?arn:(arn_ : Smaws_Lib.Smithy_api.string_ option)
  ?description:(description_ : Smaws_Lib.Smithy_api.string_ option)
  ?type_:(type__ : collection_type option)
  ?status:(status_ : collection_status option)
  ?name:(name_ : collection_name option) ?id:(id_ : collection_id option) ()
  =
  ({
     failure_message = failure_message_;
     failure_code = failure_code_;
     dashboard_endpoint = dashboard_endpoint_;
     collection_endpoint = collection_endpoint_;
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     standby_replicas = standby_replicas_;
     kms_key_arn = kms_key_arn_;
     arn = arn_;
     description = description_;
     type_ = type__;
     status = status_;
     name = name_;
     id = id_
   } : collection_detail)
let make_collection_error_detail
  ?error_code:(error_code_ : Smaws_Lib.Smithy_api.string_ option)
  ?error_message:(error_message_ : Smaws_Lib.Smithy_api.string_ option)
  ?name:(name_ : collection_name option) ?id:(id_ : collection_id option) ()
  =
  ({
     error_code = error_code_;
     error_message = error_message_;
     name = name_;
     id = id_
   } : collection_error_detail)
let make_batch_get_collection_response
  ?collection_error_details:(collection_error_details_ :
                              collection_error_details option)
  ?collection_details:(collection_details_ : collection_details option) () =
  ({
     collection_error_details = collection_error_details_;
     collection_details = collection_details_
   } : batch_get_collection_response)
let make_batch_get_collection_request
  ?names:(names_ : collection_names option)
  ?ids:(ids_ : collection_ids option) () =
  ({ names = names_; ids = ids_ } : batch_get_collection_request)
let make_list_vpc_endpoints_response
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?vpc_endpoint_summaries:(vpc_endpoint_summaries_ :
                            vpc_endpoint_summaries option)
  () =
  ({
     next_token = next_token_;
     vpc_endpoint_summaries = vpc_endpoint_summaries_
   } : list_vpc_endpoints_response)
let make_list_vpc_endpoints_request
  ?max_results:(max_results_ : Smaws_Lib.Smithy_api.integer option)
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?vpc_endpoint_filters:(vpc_endpoint_filters_ : vpc_endpoint_filters option)
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     vpc_endpoint_filters = vpc_endpoint_filters_
   } : list_vpc_endpoints_request)
let make_list_security_policies_response
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?security_policy_summaries:(security_policy_summaries_ :
                               security_policy_summaries option)
  () =
  ({
     next_token = next_token_;
     security_policy_summaries = security_policy_summaries_
   } : list_security_policies_response)
let make_list_security_policies_request
  ?max_results:(max_results_ : Smaws_Lib.Smithy_api.integer option)
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?resource:(resource_ : resource_filter option)
  ~type_:(type__ : security_policy_type) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource = resource_;
     type_ = type__
   } : list_security_policies_request)
let make_list_security_configs_response
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?security_config_summaries:(security_config_summaries_ :
                               security_config_summaries option)
  () =
  ({
     next_token = next_token_;
     security_config_summaries = security_config_summaries_
   } : list_security_configs_response)
let make_list_security_configs_request
  ?max_results:(max_results_ : Smaws_Lib.Smithy_api.integer option)
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ~type_:(type__ : security_config_type) () =
  ({ max_results = max_results_; next_token = next_token_; type_ = type__ } : 
  list_security_configs_request)
let make_lifecycle_policy_summary
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?description:(description_ : policy_description option)
  ?policy_version:(policy_version_ : policy_version option)
  ?name:(name_ : policy_name option)
  ?type_:(type__ : lifecycle_policy_type option) () =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : lifecycle_policy_summary)
let make_list_lifecycle_policies_response
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?lifecycle_policy_summaries:(lifecycle_policy_summaries_ :
                                lifecycle_policy_summaries option)
  () =
  ({
     next_token = next_token_;
     lifecycle_policy_summaries = lifecycle_policy_summaries_
   } : list_lifecycle_policies_response)
let make_list_lifecycle_policies_request
  ?max_results:(max_results_ : Smaws_Lib.Smithy_api.integer option)
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?resources:(resources_ : lifecycle_resource_filter option)
  ~type_:(type__ : lifecycle_policy_type) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resources = resources_;
     type_ = type__
   } : list_lifecycle_policies_request)
let make_collection_summary ?arn:(arn_ : Smaws_Lib.Smithy_api.string_ option)
  ?status:(status_ : collection_status option)
  ?name:(name_ : collection_name option) ?id:(id_ : collection_id option) ()
  =
  ({ arn = arn_; status = status_; name = name_; id = id_ } : collection_summary)
let make_list_collections_response
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?collection_summaries:(collection_summaries_ : collection_summaries option)
  () =
  ({ next_token = next_token_; collection_summaries = collection_summaries_ } : 
  list_collections_response)
let make_collection_filters ?status:(status_ : collection_status option)
  ?name:(name_ : collection_name option) () =
  ({ status = status_; name = name_ } : collection_filters)
let make_list_collections_request
  ?max_results:(max_results_ : Smaws_Lib.Smithy_api.integer option)
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?collection_filters:(collection_filters_ : collection_filters option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     collection_filters = collection_filters_
   } : list_collections_request)
let make_access_policy_summary
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?description:(description_ : policy_description option)
  ?policy_version:(policy_version_ : policy_version option)
  ?name:(name_ : policy_name option)
  ?type_:(type__ : access_policy_type option) () =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     description = description_;
     policy_version = policy_version_;
     name = name_;
     type_ = type__
   } : access_policy_summary)
let make_list_access_policies_response
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?access_policy_summaries:(access_policy_summaries_ :
                             access_policy_summaries option)
  () =
  ({
     next_token = next_token_;
     access_policy_summaries = access_policy_summaries_
   } : list_access_policies_response)
let make_list_access_policies_request
  ?max_results:(max_results_ : Smaws_Lib.Smithy_api.integer option)
  ?next_token:(next_token_ : Smaws_Lib.Smithy_api.string_ option)
  ?resource:(resource_ : resource_filter option)
  ~type_:(type__ : access_policy_type) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource = resource_;
     type_ = type__
   } : list_access_policies_request)
let make_get_security_policy_response
  ?security_policy_detail:(security_policy_detail_ :
                            security_policy_detail option)
  () =
  ({ security_policy_detail = security_policy_detail_ } : get_security_policy_response)
let make_get_security_policy_request ~name:(name_ : policy_name)
  ~type_:(type__ : security_policy_type) () =
  ({ name = name_; type_ = type__ } : get_security_policy_request)
let make_get_security_config_response
  ?security_config_detail:(security_config_detail_ :
                            security_config_detail option)
  () =
  ({ security_config_detail = security_config_detail_ } : get_security_config_response)
let make_get_security_config_request ~id:(id_ : security_config_id) () =
  ({ id = id_ } : get_security_config_request)
let make_get_access_policy_response
  ?access_policy_detail:(access_policy_detail_ : access_policy_detail option)
  () =
  ({ access_policy_detail = access_policy_detail_ } : get_access_policy_response)
let make_get_access_policy_request ~name:(name_ : policy_name)
  ~type_:(type__ : access_policy_type) () =
  ({ name = name_; type_ = type__ } : get_access_policy_request)
let make_delete_vpc_endpoint_detail
  ?status:(status_ : vpc_endpoint_status option)
  ?name:(name_ : vpc_endpoint_name option) ?id:(id_ : vpc_endpoint_id option)
  () =
  ({ status = status_; name = name_; id = id_ } : delete_vpc_endpoint_detail)
let make_delete_vpc_endpoint_response
  ?delete_vpc_endpoint_detail:(delete_vpc_endpoint_detail_ :
                                delete_vpc_endpoint_detail option)
  () =
  ({ delete_vpc_endpoint_detail = delete_vpc_endpoint_detail_ } : delete_vpc_endpoint_response)
let make_delete_vpc_endpoint_request
  ?client_token:(client_token_ : client_token option)
  ~id:(id_ : vpc_endpoint_id) () =
  ({ client_token = client_token_; id = id_ } : delete_vpc_endpoint_request)
let make_delete_security_policy_response () = (() : unit)
let make_delete_security_policy_request
  ?client_token:(client_token_ : client_token option)
  ~name:(name_ : policy_name) ~type_:(type__ : security_policy_type) () =
  ({ client_token = client_token_; name = name_; type_ = type__ } : delete_security_policy_request)
let make_delete_security_config_response () = (() : unit)
let make_delete_security_config_request
  ?client_token:(client_token_ : client_token option)
  ~id:(id_ : security_config_id) () =
  ({ client_token = client_token_; id = id_ } : delete_security_config_request)
let make_delete_lifecycle_policy_response () = (() : unit)
let make_delete_lifecycle_policy_request
  ?client_token:(client_token_ : client_token option)
  ~name:(name_ : policy_name) ~type_:(type__ : lifecycle_policy_type) () =
  ({ client_token = client_token_; name = name_; type_ = type__ } : delete_lifecycle_policy_request)
let make_delete_collection_detail
  ?status:(status_ : collection_status option)
  ?name:(name_ : collection_name option) ?id:(id_ : collection_id option) ()
  = ({ status = status_; name = name_; id = id_ } : delete_collection_detail)
let make_delete_collection_response
  ?delete_collection_detail:(delete_collection_detail_ :
                              delete_collection_detail option)
  () =
  ({ delete_collection_detail = delete_collection_detail_ } : delete_collection_response)
let make_delete_collection_request
  ?client_token:(client_token_ : client_token option)
  ~id:(id_ : collection_id) () =
  ({ client_token = client_token_; id = id_ } : delete_collection_request)
let make_delete_access_policy_response () = (() : unit)
let make_delete_access_policy_request
  ?client_token:(client_token_ : client_token option)
  ~name:(name_ : policy_name) ~type_:(type__ : access_policy_type) () =
  ({ client_token = client_token_; name = name_; type_ = type__ } : delete_access_policy_request)
let make_create_vpc_endpoint_detail
  ?status:(status_ : vpc_endpoint_status option)
  ?name:(name_ : vpc_endpoint_name option) ?id:(id_ : vpc_endpoint_id option)
  () =
  ({ status = status_; name = name_; id = id_ } : create_vpc_endpoint_detail)
let make_create_vpc_endpoint_response
  ?create_vpc_endpoint_detail:(create_vpc_endpoint_detail_ :
                                create_vpc_endpoint_detail option)
  () =
  ({ create_vpc_endpoint_detail = create_vpc_endpoint_detail_ } : create_vpc_endpoint_response)
let make_create_vpc_endpoint_request
  ?client_token:(client_token_ : client_token option)
  ?security_group_ids:(security_group_ids_ : security_group_ids option)
  ~subnet_ids:(subnet_ids_ : subnet_ids) ~vpc_id:(vpc_id_ : vpc_id)
  ~name:(name_ : vpc_endpoint_name) () =
  ({
     client_token = client_token_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     name = name_
   } : create_vpc_endpoint_request)
let make_create_security_config_response
  ?security_config_detail:(security_config_detail_ :
                            security_config_detail option)
  () =
  ({ security_config_detail = security_config_detail_ } : create_security_config_response)
let make_create_iam_identity_center_config_options
  ?group_attribute:(group_attribute_ :
                     iam_identity_center_group_attribute option)
  ?user_attribute:(user_attribute_ :
                    iam_identity_center_user_attribute option)
  ~instance_arn:(instance_arn_ : iam_identity_center_instance_arn) () =
  ({
     group_attribute = group_attribute_;
     user_attribute = user_attribute_;
     instance_arn = instance_arn_
   } : create_iam_identity_center_config_options)
let make_create_security_config_request
  ?client_token:(client_token_ : client_token option)
  ?iam_identity_center_options:(iam_identity_center_options_ :
                                 create_iam_identity_center_config_options
                                   option)
  ?saml_options:(saml_options_ : saml_config_options option)
  ?description:(description_ : config_description option)
  ~name:(name_ : config_name) ~type_:(type__ : security_config_type) () =
  ({
     client_token = client_token_;
     iam_identity_center_options = iam_identity_center_options_;
     saml_options = saml_options_;
     description = description_;
     name = name_;
     type_ = type__
   } : create_security_config_request)
let make_create_collection_detail
  ?last_modified_date:(last_modified_date_ :
                        Smaws_Lib.Smithy_api.long option)
  ?created_date:(created_date_ : Smaws_Lib.Smithy_api.long option)
  ?standby_replicas:(standby_replicas_ : standby_replicas option)
  ?kms_key_arn:(kms_key_arn_ : Smaws_Lib.Smithy_api.string_ option)
  ?arn:(arn_ : Smaws_Lib.Smithy_api.string_ option)
  ?description:(description_ : Smaws_Lib.Smithy_api.string_ option)
  ?type_:(type__ : collection_type option)
  ?status:(status_ : collection_status option)
  ?name:(name_ : collection_name option) ?id:(id_ : collection_id option) ()
  =
  ({
     last_modified_date = last_modified_date_;
     created_date = created_date_;
     standby_replicas = standby_replicas_;
     kms_key_arn = kms_key_arn_;
     arn = arn_;
     description = description_;
     type_ = type__;
     status = status_;
     name = name_;
     id = id_
   } : create_collection_detail)
let make_create_collection_response
  ?create_collection_detail:(create_collection_detail_ :
                              create_collection_detail option)
  () =
  ({ create_collection_detail = create_collection_detail_ } : create_collection_response)
let make_create_collection_request
  ?client_token:(client_token_ : client_token option)
  ?standby_replicas:(standby_replicas_ : standby_replicas option)
  ?tags:(tags_ : tags option)
  ?description:(description_ : Smaws_Lib.Smithy_api.string_ option)
  ?type_:(type__ : collection_type option) ~name:(name_ : collection_name) ()
  =
  ({
     client_token = client_token_;
     standby_replicas = standby_replicas_;
     tags = tags_;
     description = description_;
     type_ = type__;
     name = name_
   } : create_collection_request)
let make_create_access_policy_response
  ?access_policy_detail:(access_policy_detail_ : access_policy_detail option)
  () =
  ({ access_policy_detail = access_policy_detail_ } : create_access_policy_response)
let make_create_access_policy_request
  ?client_token:(client_token_ : client_token option)
  ?description:(description_ : policy_description option)
  ~policy:(policy_ : policy_document) ~name:(name_ : policy_name)
  ~type_:(type__ : access_policy_type) () =
  ({
     client_token = client_token_;
     policy = policy_;
     description = description_;
     name = name_;
     type_ = type__
   } : create_access_policy_request)