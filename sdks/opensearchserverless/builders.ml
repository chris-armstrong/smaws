open Types

let make_access_policy_detail ?type_:(type__ : access_policy_type option)
    ?name:(name_ : policy_name option) ?policy_version:(policy_version_ : policy_version option)
    ?description:(description_ : policy_description option)
    ?policy:(policy_ : Smaws_Lib.Smithy_api.Types.document option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     policy = policy_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
   }
    : access_policy_detail)

let make_access_policy_stats
    ?data_policy_count:(data_policy_count_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({ data_policy_count = data_policy_count_ } : access_policy_stats)

let make_access_policy_summary ?type_:(type__ : access_policy_type option)
    ?name:(name_ : policy_name option) ?policy_version:(policy_version_ : policy_version option)
    ?description:(description_ : policy_description option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
   }
    : access_policy_summary)

let make_capacity_limits
    ?max_indexing_capacity_in_oc_u:(max_indexing_capacity_in_oc_u_ : indexing_capacity_value option)
    ?max_search_capacity_in_oc_u:(max_search_capacity_in_oc_u_ : search_capacity_value option) () =
  ({
     max_indexing_capacity_in_oc_u = max_indexing_capacity_in_oc_u_;
     max_search_capacity_in_oc_u = max_search_capacity_in_oc_u_;
   }
    : capacity_limits)

let make_account_settings_detail ?capacity_limits:(capacity_limits_ : capacity_limits option) () =
  ({ capacity_limits = capacity_limits_ } : account_settings_detail)

let make_collection_error_detail ?id:(id_ : collection_id option)
    ?name:(name_ : collection_name option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; name = name_; error_message = error_message_; error_code = error_code_ }
    : collection_error_detail)

let make_fips_endpoints
    ?collection_endpoint:(collection_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?dashboard_endpoint:(dashboard_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ collection_endpoint = collection_endpoint_; dashboard_endpoint = dashboard_endpoint_ }
    : fips_endpoints)

let make_vector_options
    ~serverless_vector_acceleration:
      (serverless_vector_acceleration_ : serverless_vector_acceleration_status) () =
  ({ serverless_vector_acceleration = serverless_vector_acceleration_ } : vector_options)

let make_collection_detail ?id:(id_ : collection_id option) ?name:(name_ : collection_name option)
    ?status:(status_ : collection_status option) ?type_:(type__ : collection_type option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_arn:(kms_key_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?standby_replicas:(standby_replicas_ : standby_replicas option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?vector_options:(vector_options_ : vector_options option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?collection_endpoint:(collection_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?dashboard_endpoint:(dashboard_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?fips_endpoints:(fips_endpoints_ : fips_endpoints option)
    ?failure_code:(failure_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?collection_group_name:(collection_group_name_ : collection_group_name option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     type_ = type__;
     description = description_;
     arn = arn_;
     kms_key_arn = kms_key_arn_;
     standby_replicas = standby_replicas_;
     deletion_protection = deletion_protection_;
     vector_options = vector_options_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
     collection_endpoint = collection_endpoint_;
     dashboard_endpoint = dashboard_endpoint_;
     fips_endpoints = fips_endpoints_;
     failure_code = failure_code_;
     failure_message = failure_message_;
     collection_group_name = collection_group_name_;
   }
    : collection_detail)

let make_batch_get_collection_response
    ?collection_details:(collection_details_ : collection_details option)
    ?collection_error_details:(collection_error_details_ : collection_error_details option) () =
  ({
     collection_details = collection_details_;
     collection_error_details = collection_error_details_;
   }
    : batch_get_collection_response)

let make_batch_get_collection_request ?ids:(ids_ : collection_ids option)
    ?names:(names_ : collection_names option) () =
  ({ ids = ids_; names = names_ } : batch_get_collection_request)

let make_collection_group_error_detail ?id:(id_ : collection_group_id option)
    ?name:(name_ : collection_group_name option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; name = name_; error_message = error_message_; error_code = error_code_ }
    : collection_group_error_detail)

let make_capacity_details
    ?capacity_in_ocu:(capacity_in_ocu_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?autoscaling_status:(autoscaling_status_ : autoscaling_status option) () =
  ({ capacity_in_ocu = capacity_in_ocu_; autoscaling_status = autoscaling_status_ }
    : capacity_details)

let make_current_capacity ?search:(search_ : capacity_details option)
    ?indexing:(indexing_ : capacity_details option) () =
  ({ search = search_; indexing = indexing_ } : current_capacity)

let make_collection_group_capacity_limits
    ?max_indexing_capacity_in_oc_u:
      (max_indexing_capacity_in_oc_u_ : collection_group_max_indexing_capacity_value option)
    ?max_search_capacity_in_oc_u:
      (max_search_capacity_in_oc_u_ : collection_group_max_search_capacity_value option)
    ?min_indexing_capacity_in_oc_u:
      (min_indexing_capacity_in_oc_u_ : collection_group_min_indexing_capacity_value option)
    ?min_search_capacity_in_oc_u:
      (min_search_capacity_in_oc_u_ : collection_group_min_search_capacity_value option) () =
  ({
     max_indexing_capacity_in_oc_u = max_indexing_capacity_in_oc_u_;
     max_search_capacity_in_oc_u = max_search_capacity_in_oc_u_;
     min_indexing_capacity_in_oc_u = min_indexing_capacity_in_oc_u_;
     min_search_capacity_in_oc_u = min_search_capacity_in_oc_u_;
   }
    : collection_group_capacity_limits)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_collection_group_detail ?id:(id_ : collection_group_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : collection_group_name option)
    ?standby_replicas:(standby_replicas_ : standby_replicas option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tags option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?capacity_limits:(capacity_limits_ : collection_group_capacity_limits option)
    ?current_capacity:(current_capacity_ : current_capacity option)
    ?number_of_collections:(number_of_collections_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?generation:(generation_ : serverless_generation option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     standby_replicas = standby_replicas_;
     description = description_;
     tags = tags_;
     created_date = created_date_;
     capacity_limits = capacity_limits_;
     current_capacity = current_capacity_;
     number_of_collections = number_of_collections_;
     generation = generation_;
   }
    : collection_group_detail)

let make_batch_get_collection_group_response
    ?collection_group_details:(collection_group_details_ : collection_group_details option)
    ?collection_group_error_details:
      (collection_group_error_details_ : collection_group_error_details option) () =
  ({
     collection_group_details = collection_group_details_;
     collection_group_error_details = collection_group_error_details_;
   }
    : batch_get_collection_group_response)

let make_batch_get_collection_group_request ?ids:(ids_ : collection_group_ids option)
    ?names:(names_ : collection_group_names option) () =
  ({ ids = ids_; names = names_ } : batch_get_collection_group_request)

let make_effective_lifecycle_policy_error_detail ?type_:(type__ : lifecycle_policy_type option)
    ?resource:(resource_ : resource option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     type_ = type__;
     resource = resource_;
     error_message = error_message_;
     error_code = error_code_;
   }
    : effective_lifecycle_policy_error_detail)

let make_effective_lifecycle_policy_detail ?type_:(type__ : lifecycle_policy_type option)
    ?resource:(resource_ : resource option) ?policy_name:(policy_name_ : policy_name option)
    ?resource_type:(resource_type_ : resource_type option)
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?no_min_retention_period:(no_min_retention_period_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    () =
  ({
     type_ = type__;
     resource = resource_;
     policy_name = policy_name_;
     resource_type = resource_type_;
     retention_period = retention_period_;
     no_min_retention_period = no_min_retention_period_;
   }
    : effective_lifecycle_policy_detail)

let make_batch_get_effective_lifecycle_policy_response
    ?effective_lifecycle_policy_details:
      (effective_lifecycle_policy_details_ : effective_lifecycle_policy_details option)
    ?effective_lifecycle_policy_error_details:
      (effective_lifecycle_policy_error_details_ : effective_lifecycle_policy_error_details option)
    () =
  ({
     effective_lifecycle_policy_details = effective_lifecycle_policy_details_;
     effective_lifecycle_policy_error_details = effective_lifecycle_policy_error_details_;
   }
    : batch_get_effective_lifecycle_policy_response)

let make_lifecycle_policy_resource_identifier ~type_:(type__ : lifecycle_policy_type)
    ~resource:(resource_ : resource_name) () =
  ({ type_ = type__; resource = resource_ } : lifecycle_policy_resource_identifier)

let make_batch_get_effective_lifecycle_policy_request
    ~resource_identifiers:(resource_identifiers_ : lifecycle_policy_resource_identifiers) () =
  ({ resource_identifiers = resource_identifiers_ } : batch_get_effective_lifecycle_policy_request)

let make_lifecycle_policy_error_detail ?type_:(type__ : lifecycle_policy_type option)
    ?name:(name_ : policy_name option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ type_ = type__; name = name_; error_message = error_message_; error_code = error_code_ }
    : lifecycle_policy_error_detail)

let make_lifecycle_policy_detail ?type_:(type__ : lifecycle_policy_type option)
    ?name:(name_ : policy_name option) ?policy_version:(policy_version_ : policy_version option)
    ?description:(description_ : policy_description option)
    ?policy:(policy_ : Smaws_Lib.Smithy_api.Types.document option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     policy = policy_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
   }
    : lifecycle_policy_detail)

let make_batch_get_lifecycle_policy_response
    ?lifecycle_policy_details:(lifecycle_policy_details_ : lifecycle_policy_details option)
    ?lifecycle_policy_error_details:
      (lifecycle_policy_error_details_ : lifecycle_policy_error_details option) () =
  ({
     lifecycle_policy_details = lifecycle_policy_details_;
     lifecycle_policy_error_details = lifecycle_policy_error_details_;
   }
    : batch_get_lifecycle_policy_response)

let make_lifecycle_policy_identifier ~type_:(type__ : lifecycle_policy_type)
    ~name:(name_ : policy_name) () =
  ({ type_ = type__; name = name_ } : lifecycle_policy_identifier)

let make_batch_get_lifecycle_policy_request
    ~identifiers:(identifiers_ : lifecycle_policy_identifiers) () =
  ({ identifiers = identifiers_ } : batch_get_lifecycle_policy_request)

let make_vpc_endpoint_error_detail ?id:(id_ : vpc_endpoint_id option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; error_message = error_message_; error_code = error_code_ }
    : vpc_endpoint_error_detail)

let make_vpc_endpoint_detail ?id:(id_ : vpc_endpoint_id option)
    ?name:(name_ : vpc_endpoint_name option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?status:(status_ : vpc_endpoint_status option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?failure_code:(failure_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     id = id_;
     name = name_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     status = status_;
     created_date = created_date_;
     failure_code = failure_code_;
     failure_message = failure_message_;
   }
    : vpc_endpoint_detail)

let make_batch_get_vpc_endpoint_response
    ?vpc_endpoint_details:(vpc_endpoint_details_ : vpc_endpoint_details option)
    ?vpc_endpoint_error_details:(vpc_endpoint_error_details_ : vpc_endpoint_error_details option) ()
    =
  ({
     vpc_endpoint_details = vpc_endpoint_details_;
     vpc_endpoint_error_details = vpc_endpoint_error_details_;
   }
    : batch_get_vpc_endpoint_response)

let make_batch_get_vpc_endpoint_request ~ids:(ids_ : vpc_endpoint_ids) () =
  ({ ids = ids_ } : batch_get_vpc_endpoint_request)

let make_collection_filters ?name:(name_ : collection_name option)
    ?status:(status_ : collection_status option)
    ?collection_group_name:(collection_group_name_ : collection_group_name option) () =
  ({ name = name_; status = status_; collection_group_name = collection_group_name_ }
    : collection_filters)

let make_collection_group_summary ?id:(id_ : collection_group_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : collection_group_name option)
    ?number_of_collections:(number_of_collections_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?capacity_limits:(capacity_limits_ : collection_group_capacity_limits option)
    ?generation:(generation_ : serverless_generation option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     number_of_collections = number_of_collections_;
     created_date = created_date_;
     capacity_limits = capacity_limits_;
     generation = generation_;
   }
    : collection_group_summary)

let make_collection_summary ?id:(id_ : collection_id option) ?name:(name_ : collection_name option)
    ?status:(status_ : collection_status option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_arn:(kms_key_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?collection_group_name:(collection_group_name_ : collection_group_name option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     arn = arn_;
     kms_key_arn = kms_key_arn_;
     collection_group_name = collection_group_name_;
   }
    : collection_summary)

let make_create_access_policy_response
    ?access_policy_detail:(access_policy_detail_ : access_policy_detail option) () =
  ({ access_policy_detail = access_policy_detail_ } : create_access_policy_response)

let make_create_access_policy_request ?description:(description_ : policy_description option)
    ?client_token:(client_token_ : client_token option) ~type_:(type__ : access_policy_type)
    ~name:(name_ : policy_name) ~policy:(policy_ : policy_document) () =
  ({
     type_ = type__;
     name = name_;
     description = description_;
     policy = policy_;
     client_token = client_token_;
   }
    : create_access_policy_request)

let make_create_collection_detail ?id:(id_ : collection_id option)
    ?name:(name_ : collection_name option) ?status:(status_ : collection_status option)
    ?type_:(type__ : collection_type option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_arn:(kms_key_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?standby_replicas:(standby_replicas_ : standby_replicas option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?vector_options:(vector_options_ : vector_options option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?collection_group_name:(collection_group_name_ : collection_group_name option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     type_ = type__;
     description = description_;
     arn = arn_;
     kms_key_arn = kms_key_arn_;
     standby_replicas = standby_replicas_;
     deletion_protection = deletion_protection_;
     vector_options = vector_options_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
     collection_group_name = collection_group_name_;
   }
    : create_collection_detail)

let make_create_collection_response
    ?create_collection_detail:(create_collection_detail_ : create_collection_detail option) () =
  ({ create_collection_detail = create_collection_detail_ } : create_collection_response)

let make_encryption_config
    ?a_ws_owned_key:(a_ws_owned_key_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?kms_key_arn:(kms_key_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ a_ws_owned_key = a_ws_owned_key_; kms_key_arn = kms_key_arn_ } : encryption_config)

let make_create_collection_request ?type_:(type__ : collection_type option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tags option) ?standby_replicas:(standby_replicas_ : standby_replicas option)
    ?vector_options:(vector_options_ : vector_options option)
    ?collection_group_name:(collection_group_name_ : collection_group_name option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : collection_name) () =
  ({
     name = name_;
     type_ = type__;
     description = description_;
     tags = tags_;
     standby_replicas = standby_replicas_;
     vector_options = vector_options_;
     collection_group_name = collection_group_name_;
     encryption_config = encryption_config_;
     deletion_protection = deletion_protection_;
     client_token = client_token_;
   }
    : create_collection_request)

let make_create_collection_group_detail ?id:(id_ : collection_group_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : collection_group_name option)
    ?standby_replicas:(standby_replicas_ : standby_replicas option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tags option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?capacity_limits:(capacity_limits_ : collection_group_capacity_limits option)
    ?generation:(generation_ : serverless_generation option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     standby_replicas = standby_replicas_;
     description = description_;
     tags = tags_;
     created_date = created_date_;
     capacity_limits = capacity_limits_;
     generation = generation_;
   }
    : create_collection_group_detail)

let make_create_collection_group_response
    ?create_collection_group_detail:
      (create_collection_group_detail_ : create_collection_group_detail option) () =
  ({ create_collection_group_detail = create_collection_group_detail_ }
    : create_collection_group_response)

let make_create_collection_group_request
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tags option)
    ?capacity_limits:(capacity_limits_ : collection_group_capacity_limits option)
    ?generation:(generation_ : serverless_generation option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : collection_group_name)
    ~standby_replicas:(standby_replicas_ : standby_replicas) () =
  ({
     name = name_;
     standby_replicas = standby_replicas_;
     description = description_;
     tags = tags_;
     capacity_limits = capacity_limits_;
     generation = generation_;
     client_token = client_token_;
   }
    : create_collection_group_request)

let make_create_iam_identity_center_config_options
    ?user_attribute:(user_attribute_ : iam_identity_center_user_attribute option)
    ?group_attribute:(group_attribute_ : iam_identity_center_group_attribute option)
    ~instance_arn:(instance_arn_ : iam_identity_center_instance_arn) () =
  ({
     instance_arn = instance_arn_;
     user_attribute = user_attribute_;
     group_attribute = group_attribute_;
   }
    : create_iam_identity_center_config_options)

let make_create_index_response () = (() : unit)

let make_create_index_request ?index_schema:(index_schema_ : index_schema option)
    ~id:(id_ : collection_id) ~index_name:(index_name_ : index_name) () =
  ({ id = id_; index_name = index_name_; index_schema = index_schema_ } : create_index_request)

let make_create_lifecycle_policy_response
    ?lifecycle_policy_detail:(lifecycle_policy_detail_ : lifecycle_policy_detail option) () =
  ({ lifecycle_policy_detail = lifecycle_policy_detail_ } : create_lifecycle_policy_response)

let make_create_lifecycle_policy_request ?description:(description_ : policy_description option)
    ?client_token:(client_token_ : client_token option) ~type_:(type__ : lifecycle_policy_type)
    ~name:(name_ : policy_name) ~policy:(policy_ : policy_document) () =
  ({
     type_ = type__;
     name = name_;
     description = description_;
     policy = policy_;
     client_token = client_token_;
   }
    : create_lifecycle_policy_request)

let make_iam_federation_config_options
    ?group_attribute:(group_attribute_ : iam_federation_group_attribute option)
    ?user_attribute:(user_attribute_ : iam_federation_user_attribute option) () =
  ({ group_attribute = group_attribute_; user_attribute = user_attribute_ }
    : iam_federation_config_options)

let make_iam_identity_center_config_options
    ?instance_arn:(instance_arn_ : iam_identity_center_instance_arn option)
    ?application_arn:(application_arn_ : iam_identity_center_application_arn option)
    ?application_name:(application_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?application_description:(application_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?user_attribute:(user_attribute_ : iam_identity_center_user_attribute option)
    ?group_attribute:(group_attribute_ : iam_identity_center_group_attribute option) () =
  ({
     instance_arn = instance_arn_;
     application_arn = application_arn_;
     application_name = application_name_;
     application_description = application_description_;
     user_attribute = user_attribute_;
     group_attribute = group_attribute_;
   }
    : iam_identity_center_config_options)

let make_saml_config_options ?user_attribute:(user_attribute_ : saml_user_attribute option)
    ?group_attribute:(group_attribute_ : saml_group_attribute option)
    ?open_search_serverless_entity_id:
      (open_search_serverless_entity_id_ : open_search_serverless_entity_id option)
    ?session_timeout:(session_timeout_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~metadata:(metadata_ : saml_metadata) () =
  ({
     metadata = metadata_;
     user_attribute = user_attribute_;
     group_attribute = group_attribute_;
     open_search_serverless_entity_id = open_search_serverless_entity_id_;
     session_timeout = session_timeout_;
   }
    : saml_config_options)

let make_security_config_detail ?id:(id_ : security_config_id option)
    ?type_:(type__ : security_config_type option)
    ?config_version:(config_version_ : policy_version option)
    ?description:(description_ : config_description option)
    ?saml_options:(saml_options_ : saml_config_options option)
    ?iam_identity_center_options:
      (iam_identity_center_options_ : iam_identity_center_config_options option)
    ?iam_federation_options:(iam_federation_options_ : iam_federation_config_options option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     id = id_;
     type_ = type__;
     config_version = config_version_;
     description = description_;
     saml_options = saml_options_;
     iam_identity_center_options = iam_identity_center_options_;
     iam_federation_options = iam_federation_options_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
   }
    : security_config_detail)

let make_create_security_config_response
    ?security_config_detail:(security_config_detail_ : security_config_detail option) () =
  ({ security_config_detail = security_config_detail_ } : create_security_config_response)

let make_create_security_config_request ?description:(description_ : config_description option)
    ?saml_options:(saml_options_ : saml_config_options option)
    ?iam_identity_center_options:
      (iam_identity_center_options_ : create_iam_identity_center_config_options option)
    ?iam_federation_options:(iam_federation_options_ : iam_federation_config_options option)
    ?client_token:(client_token_ : client_token option) ~type_:(type__ : security_config_type)
    ~name:(name_ : config_name) () =
  ({
     type_ = type__;
     name = name_;
     description = description_;
     saml_options = saml_options_;
     iam_identity_center_options = iam_identity_center_options_;
     iam_federation_options = iam_federation_options_;
     client_token = client_token_;
   }
    : create_security_config_request)

let make_security_policy_detail ?type_:(type__ : security_policy_type option)
    ?name:(name_ : policy_name option) ?policy_version:(policy_version_ : policy_version option)
    ?description:(description_ : policy_description option)
    ?policy:(policy_ : Smaws_Lib.Smithy_api.Types.document option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     policy = policy_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
   }
    : security_policy_detail)

let make_create_security_policy_response
    ?security_policy_detail:(security_policy_detail_ : security_policy_detail option) () =
  ({ security_policy_detail = security_policy_detail_ } : create_security_policy_response)

let make_create_security_policy_request ?description:(description_ : policy_description option)
    ?client_token:(client_token_ : client_token option) ~type_:(type__ : security_policy_type)
    ~name:(name_ : policy_name) ~policy:(policy_ : policy_document) () =
  ({
     type_ = type__;
     name = name_;
     description = description_;
     policy = policy_;
     client_token = client_token_;
   }
    : create_security_policy_request)

let make_create_vpc_endpoint_detail ?id:(id_ : vpc_endpoint_id option)
    ?name:(name_ : vpc_endpoint_name option) ?status:(status_ : vpc_endpoint_status option) () =
  ({ id = id_; name = name_; status = status_ } : create_vpc_endpoint_detail)

let make_create_vpc_endpoint_response
    ?create_vpc_endpoint_detail:(create_vpc_endpoint_detail_ : create_vpc_endpoint_detail option) ()
    =
  ({ create_vpc_endpoint_detail = create_vpc_endpoint_detail_ } : create_vpc_endpoint_response)

let make_create_vpc_endpoint_request
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : vpc_endpoint_name)
    ~vpc_id:(vpc_id_ : vpc_id) ~subnet_ids:(subnet_ids_ : subnet_ids) () =
  ({
     name = name_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     client_token = client_token_;
   }
    : create_vpc_endpoint_request)

let make_delete_access_policy_response () = (() : unit)

let make_delete_access_policy_request ?client_token:(client_token_ : client_token option)
    ~type_:(type__ : access_policy_type) ~name:(name_ : policy_name) () =
  ({ type_ = type__; name = name_; client_token = client_token_ } : delete_access_policy_request)

let make_delete_collection_detail ?id:(id_ : collection_id option)
    ?name:(name_ : collection_name option) ?status:(status_ : collection_status option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option) () =
  ({ id = id_; name = name_; status = status_; deletion_protection = deletion_protection_ }
    : delete_collection_detail)

let make_delete_collection_response
    ?delete_collection_detail:(delete_collection_detail_ : delete_collection_detail option) () =
  ({ delete_collection_detail = delete_collection_detail_ } : delete_collection_response)

let make_delete_collection_request ?client_token:(client_token_ : client_token option)
    ~id:(id_ : collection_id) () =
  ({ id = id_; client_token = client_token_ } : delete_collection_request)

let make_delete_collection_group_response () = (() : unit)

let make_delete_collection_group_request ?client_token:(client_token_ : client_token option)
    ~id:(id_ : collection_group_id) () =
  ({ id = id_; client_token = client_token_ } : delete_collection_group_request)

let make_delete_index_response () = (() : unit)

let make_delete_index_request ~id:(id_ : collection_id) ~index_name:(index_name_ : index_name) () =
  ({ id = id_; index_name = index_name_ } : delete_index_request)

let make_delete_lifecycle_policy_response () = (() : unit)

let make_delete_lifecycle_policy_request ?client_token:(client_token_ : client_token option)
    ~type_:(type__ : lifecycle_policy_type) ~name:(name_ : policy_name) () =
  ({ type_ = type__; name = name_; client_token = client_token_ } : delete_lifecycle_policy_request)

let make_delete_security_config_response () = (() : unit)

let make_delete_security_config_request ?client_token:(client_token_ : client_token option)
    ~id:(id_ : security_config_id) () =
  ({ id = id_; client_token = client_token_ } : delete_security_config_request)

let make_delete_security_policy_response () = (() : unit)

let make_delete_security_policy_request ?client_token:(client_token_ : client_token option)
    ~type_:(type__ : security_policy_type) ~name:(name_ : policy_name) () =
  ({ type_ = type__; name = name_; client_token = client_token_ } : delete_security_policy_request)

let make_delete_vpc_endpoint_detail ?id:(id_ : vpc_endpoint_id option)
    ?name:(name_ : vpc_endpoint_name option) ?status:(status_ : vpc_endpoint_status option) () =
  ({ id = id_; name = name_; status = status_ } : delete_vpc_endpoint_detail)

let make_delete_vpc_endpoint_response
    ?delete_vpc_endpoint_detail:(delete_vpc_endpoint_detail_ : delete_vpc_endpoint_detail option) ()
    =
  ({ delete_vpc_endpoint_detail = delete_vpc_endpoint_detail_ } : delete_vpc_endpoint_response)

let make_delete_vpc_endpoint_request ?client_token:(client_token_ : client_token option)
    ~id:(id_ : vpc_endpoint_id) () =
  ({ id = id_; client_token = client_token_ } : delete_vpc_endpoint_request)

let make_get_access_policy_response
    ?access_policy_detail:(access_policy_detail_ : access_policy_detail option) () =
  ({ access_policy_detail = access_policy_detail_ } : get_access_policy_response)

let make_get_access_policy_request ~type_:(type__ : access_policy_type) ~name:(name_ : policy_name)
    () =
  ({ type_ = type__; name = name_ } : get_access_policy_request)

let make_get_account_settings_response
    ?account_settings_detail:(account_settings_detail_ : account_settings_detail option) () =
  ({ account_settings_detail = account_settings_detail_ } : get_account_settings_response)

let make_get_account_settings_request () = (() : unit)

let make_get_index_response ?index_schema:(index_schema_ : index_schema option) () =
  ({ index_schema = index_schema_ } : get_index_response)

let make_get_index_request ~id:(id_ : collection_id) ~index_name:(index_name_ : index_name) () =
  ({ id = id_; index_name = index_name_ } : get_index_request)

let make_lifecycle_policy_stats
    ?retention_policy_count:(retention_policy_count_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({ retention_policy_count = retention_policy_count_ } : lifecycle_policy_stats)

let make_security_config_stats
    ?saml_config_count:(saml_config_count_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({ saml_config_count = saml_config_count_ } : security_config_stats)

let make_security_policy_stats
    ?encryption_policy_count:(encryption_policy_count_ : Smaws_Lib.Smithy_api.Types.long option)
    ?network_policy_count:(network_policy_count_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     encryption_policy_count = encryption_policy_count_;
     network_policy_count = network_policy_count_;
   }
    : security_policy_stats)

let make_get_policies_stats_response
    ?access_policy_stats:(access_policy_stats_ : access_policy_stats option)
    ?security_policy_stats:(security_policy_stats_ : security_policy_stats option)
    ?security_config_stats:(security_config_stats_ : security_config_stats option)
    ?lifecycle_policy_stats:(lifecycle_policy_stats_ : lifecycle_policy_stats option)
    ?total_policy_count:(total_policy_count_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     access_policy_stats = access_policy_stats_;
     security_policy_stats = security_policy_stats_;
     security_config_stats = security_config_stats_;
     lifecycle_policy_stats = lifecycle_policy_stats_;
     total_policy_count = total_policy_count_;
   }
    : get_policies_stats_response)

let make_get_policies_stats_request () = (() : unit)

let make_get_security_config_response
    ?security_config_detail:(security_config_detail_ : security_config_detail option) () =
  ({ security_config_detail = security_config_detail_ } : get_security_config_response)

let make_get_security_config_request ~id:(id_ : security_config_id) () =
  ({ id = id_ } : get_security_config_request)

let make_get_security_policy_response
    ?security_policy_detail:(security_policy_detail_ : security_policy_detail option) () =
  ({ security_policy_detail = security_policy_detail_ } : get_security_policy_response)

let make_get_security_policy_request ~type_:(type__ : security_policy_type)
    ~name:(name_ : policy_name) () =
  ({ type_ = type__; name = name_ } : get_security_policy_request)

let make_lifecycle_policy_summary ?type_:(type__ : lifecycle_policy_type option)
    ?name:(name_ : policy_name option) ?policy_version:(policy_version_ : policy_version option)
    ?description:(description_ : policy_description option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
   }
    : lifecycle_policy_summary)

let make_list_access_policies_response
    ?access_policy_summaries:(access_policy_summaries_ : access_policy_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ access_policy_summaries = access_policy_summaries_; next_token = next_token_ }
    : list_access_policies_response)

let make_list_access_policies_request ?resource:(resource_ : resource_filter option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~type_:(type__ : access_policy_type) () =
  ({ type_ = type__; resource = resource_; next_token = next_token_; max_results = max_results_ }
    : list_access_policies_request)

let make_list_collection_groups_response
    ?collection_group_summaries:(collection_group_summaries_ : collection_group_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ collection_group_summaries = collection_group_summaries_; next_token = next_token_ }
    : list_collection_groups_response)

let make_list_collection_groups_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_collection_groups_request)

let make_list_collections_response
    ?collection_summaries:(collection_summaries_ : collection_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ collection_summaries = collection_summaries_; next_token = next_token_ }
    : list_collections_response)

let make_list_collections_request
    ?collection_filters:(collection_filters_ : collection_filters option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     collection_filters = collection_filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_collections_request)

let make_list_lifecycle_policies_response
    ?lifecycle_policy_summaries:(lifecycle_policy_summaries_ : lifecycle_policy_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ lifecycle_policy_summaries = lifecycle_policy_summaries_; next_token = next_token_ }
    : list_lifecycle_policies_response)

let make_list_lifecycle_policies_request ?resources:(resources_ : lifecycle_resource_filter option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~type_:(type__ : lifecycle_policy_type) () =
  ({ type_ = type__; resources = resources_; next_token = next_token_; max_results = max_results_ }
    : list_lifecycle_policies_request)

let make_security_config_summary ?id:(id_ : security_config_id option)
    ?type_:(type__ : security_config_type option)
    ?config_version:(config_version_ : policy_version option)
    ?description:(description_ : config_description option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     id = id_;
     type_ = type__;
     config_version = config_version_;
     description = description_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
   }
    : security_config_summary)

let make_list_security_configs_response
    ?security_config_summaries:(security_config_summaries_ : security_config_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ security_config_summaries = security_config_summaries_; next_token = next_token_ }
    : list_security_configs_response)

let make_list_security_configs_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~type_:(type__ : security_config_type) () =
  ({ type_ = type__; next_token = next_token_; max_results = max_results_ }
    : list_security_configs_request)

let make_security_policy_summary ?type_:(type__ : security_policy_type option)
    ?name:(name_ : policy_name option) ?policy_version:(policy_version_ : policy_version option)
    ?description:(description_ : policy_description option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
   }
    : security_policy_summary)

let make_list_security_policies_response
    ?security_policy_summaries:(security_policy_summaries_ : security_policy_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ security_policy_summaries = security_policy_summaries_; next_token = next_token_ }
    : list_security_policies_response)

let make_list_security_policies_request ?resource:(resource_ : resource_filter option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~type_:(type__ : security_policy_type) () =
  ({ type_ = type__; resource = resource_; next_token = next_token_; max_results = max_results_ }
    : list_security_policies_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_vpc_endpoint_summary ?id:(id_ : vpc_endpoint_id option)
    ?name:(name_ : vpc_endpoint_name option) ?status:(status_ : vpc_endpoint_status option) () =
  ({ id = id_; name = name_; status = status_ } : vpc_endpoint_summary)

let make_list_vpc_endpoints_response
    ?vpc_endpoint_summaries:(vpc_endpoint_summaries_ : vpc_endpoint_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ vpc_endpoint_summaries = vpc_endpoint_summaries_; next_token = next_token_ }
    : list_vpc_endpoints_response)

let make_vpc_endpoint_filters ?status:(status_ : vpc_endpoint_status option) () =
  ({ status = status_ } : vpc_endpoint_filters)

let make_list_vpc_endpoints_request
    ?vpc_endpoint_filters:(vpc_endpoint_filters_ : vpc_endpoint_filters option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     vpc_endpoint_filters = vpc_endpoint_filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_vpc_endpoints_request)

let make_update_vpc_endpoint_detail ?id:(id_ : vpc_endpoint_id option)
    ?name:(name_ : vpc_endpoint_name option) ?status:(status_ : vpc_endpoint_status option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     last_modified_date = last_modified_date_;
   }
    : update_vpc_endpoint_detail)

let make_update_vpc_endpoint_response
    ?update_vpc_endpoint_detail:(update_vpc_endpoint_detail_ : update_vpc_endpoint_detail option) ()
    =
  ({ update_vpc_endpoint_detail = update_vpc_endpoint_detail_ } : update_vpc_endpoint_response)

let make_update_vpc_endpoint_request ?add_subnet_ids:(add_subnet_ids_ : subnet_ids option)
    ?remove_subnet_ids:(remove_subnet_ids_ : subnet_ids option)
    ?add_security_group_ids:(add_security_group_ids_ : security_group_ids option)
    ?remove_security_group_ids:(remove_security_group_ids_ : security_group_ids option)
    ?client_token:(client_token_ : client_token option) ~id:(id_ : vpc_endpoint_id) () =
  ({
     id = id_;
     add_subnet_ids = add_subnet_ids_;
     remove_subnet_ids = remove_subnet_ids_;
     add_security_group_ids = add_security_group_ids_;
     remove_security_group_ids = remove_security_group_ids_;
     client_token = client_token_;
   }
    : update_vpc_endpoint_request)

let make_update_account_settings_response
    ?account_settings_detail:(account_settings_detail_ : account_settings_detail option) () =
  ({ account_settings_detail = account_settings_detail_ } : update_account_settings_response)

let make_update_account_settings_request
    ?capacity_limits:(capacity_limits_ : capacity_limits option) () =
  ({ capacity_limits = capacity_limits_ } : update_account_settings_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn) ~tag_keys:(tag_keys_ : tag_keys)
    () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_update_access_policy_response
    ?access_policy_detail:(access_policy_detail_ : access_policy_detail option) () =
  ({ access_policy_detail = access_policy_detail_ } : update_access_policy_response)

let make_update_access_policy_request ?description:(description_ : policy_description option)
    ?policy:(policy_ : policy_document option) ?client_token:(client_token_ : client_token option)
    ~type_:(type__ : access_policy_type) ~name:(name_ : policy_name)
    ~policy_version:(policy_version_ : policy_version) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     policy = policy_;
     client_token = client_token_;
   }
    : update_access_policy_request)

let make_update_collection_detail ?id:(id_ : collection_id option)
    ?name:(name_ : collection_name option) ?status:(status_ : collection_status option)
    ?type_:(type__ : collection_type option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vector_options:(vector_options_ : vector_options option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     type_ = type__;
     description = description_;
     vector_options = vector_options_;
     arn = arn_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
     deletion_protection = deletion_protection_;
   }
    : update_collection_detail)

let make_update_collection_response
    ?update_collection_detail:(update_collection_detail_ : update_collection_detail option) () =
  ({ update_collection_detail = update_collection_detail_ } : update_collection_response)

let make_update_collection_request
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vector_options:(vector_options_ : vector_options option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?client_token:(client_token_ : client_token option) ~id:(id_ : collection_id) () =
  ({
     id = id_;
     description = description_;
     vector_options = vector_options_;
     deletion_protection = deletion_protection_;
     client_token = client_token_;
   }
    : update_collection_request)

let make_update_collection_group_detail ?id:(id_ : collection_group_id option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : collection_group_name option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?capacity_limits:(capacity_limits_ : collection_group_capacity_limits option)
    ?created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?last_modified_date:(last_modified_date_ : Smaws_Lib.Smithy_api.Types.long option)
    ?generation:(generation_ : serverless_generation option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     description = description_;
     capacity_limits = capacity_limits_;
     created_date = created_date_;
     last_modified_date = last_modified_date_;
     generation = generation_;
   }
    : update_collection_group_detail)

let make_update_collection_group_response
    ?update_collection_group_detail:
      (update_collection_group_detail_ : update_collection_group_detail option) () =
  ({ update_collection_group_detail = update_collection_group_detail_ }
    : update_collection_group_response)

let make_update_collection_group_request
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?capacity_limits:(capacity_limits_ : collection_group_capacity_limits option)
    ?client_token:(client_token_ : client_token option) ~id:(id_ : collection_group_id) () =
  ({
     id = id_;
     description = description_;
     capacity_limits = capacity_limits_;
     client_token = client_token_;
   }
    : update_collection_group_request)

let make_update_iam_identity_center_config_options
    ?user_attribute:(user_attribute_ : iam_identity_center_user_attribute option)
    ?group_attribute:(group_attribute_ : iam_identity_center_group_attribute option) () =
  ({ user_attribute = user_attribute_; group_attribute = group_attribute_ }
    : update_iam_identity_center_config_options)

let make_update_index_response () = (() : unit)

let make_update_index_request ?index_schema:(index_schema_ : index_schema option)
    ~id:(id_ : collection_id) ~index_name:(index_name_ : index_name) () =
  ({ id = id_; index_name = index_name_; index_schema = index_schema_ } : update_index_request)

let make_update_lifecycle_policy_response
    ?lifecycle_policy_detail:(lifecycle_policy_detail_ : lifecycle_policy_detail option) () =
  ({ lifecycle_policy_detail = lifecycle_policy_detail_ } : update_lifecycle_policy_response)

let make_update_lifecycle_policy_request ?description:(description_ : policy_description option)
    ?policy:(policy_ : policy_document option) ?client_token:(client_token_ : client_token option)
    ~type_:(type__ : lifecycle_policy_type) ~name:(name_ : policy_name)
    ~policy_version:(policy_version_ : policy_version) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     policy = policy_;
     client_token = client_token_;
   }
    : update_lifecycle_policy_request)

let make_update_security_config_response
    ?security_config_detail:(security_config_detail_ : security_config_detail option) () =
  ({ security_config_detail = security_config_detail_ } : update_security_config_response)

let make_update_security_config_request ?description:(description_ : config_description option)
    ?saml_options:(saml_options_ : saml_config_options option)
    ?iam_identity_center_options_updates:
      (iam_identity_center_options_updates_ : update_iam_identity_center_config_options option)
    ?iam_federation_options:(iam_federation_options_ : iam_federation_config_options option)
    ?client_token:(client_token_ : client_token option) ~id:(id_ : security_config_id)
    ~config_version:(config_version_ : policy_version) () =
  ({
     id = id_;
     config_version = config_version_;
     description = description_;
     saml_options = saml_options_;
     iam_identity_center_options_updates = iam_identity_center_options_updates_;
     iam_federation_options = iam_federation_options_;
     client_token = client_token_;
   }
    : update_security_config_request)

let make_update_security_policy_response
    ?security_policy_detail:(security_policy_detail_ : security_policy_detail option) () =
  ({ security_policy_detail = security_policy_detail_ } : update_security_policy_response)

let make_update_security_policy_request ?description:(description_ : policy_description option)
    ?policy:(policy_ : policy_document option) ?client_token:(client_token_ : client_token option)
    ~type_:(type__ : security_policy_type) ~name:(name_ : policy_name)
    ~policy_version:(policy_version_ : policy_version) () =
  ({
     type_ = type__;
     name = name_;
     policy_version = policy_version_;
     description = description_;
     policy = policy_;
     client_token = client_token_;
   }
    : update_security_policy_request)
