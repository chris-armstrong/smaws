open Types

let make_option_status ?pending_deletion:(pending_deletion_ : boolean_ option)
    ?update_version:(update_version_ : u_int_value option) ~state:(state_ : option_state)
    ~update_date:(update_date_ : update_timestamp)
    ~creation_date:(creation_date_ : update_timestamp) () =
  ({
     pending_deletion = pending_deletion_;
     state = state_;
     update_version = update_version_;
     update_date = update_date_;
     creation_date = creation_date_;
   }
    : option_status)

let make_access_policies_status ~status:(status_ : option_status)
    ~options:(options_ : policy_document) () =
  ({ status = status_; options = options_ } : access_policies_status)

let make_update_service_access_policies_response
    ~access_policies:(access_policies_ : access_policies_status) () =
  ({ access_policies = access_policies_ } : update_service_access_policies_response)

let make_update_service_access_policies_request
    ~access_policies:(access_policies_ : policy_document) ~domain_name:(domain_name_ : domain_name)
    () =
  ({ access_policies = access_policies_; domain_name = domain_name_ }
    : update_service_access_policies_request)

let make_scaling_parameters ?desired_partition_count:(desired_partition_count_ : u_int_value option)
    ?desired_replication_count:(desired_replication_count_ : u_int_value option)
    ?desired_instance_type:(desired_instance_type_ : partition_instance_type option) () =
  ({
     desired_partition_count = desired_partition_count_;
     desired_replication_count = desired_replication_count_;
     desired_instance_type = desired_instance_type_;
   }
    : scaling_parameters)

let make_scaling_parameters_status ~status:(status_ : option_status)
    ~options:(options_ : scaling_parameters) () =
  ({ status = status_; options = options_ } : scaling_parameters_status)

let make_update_scaling_parameters_response
    ~scaling_parameters:(scaling_parameters_ : scaling_parameters_status) () =
  ({ scaling_parameters = scaling_parameters_ } : update_scaling_parameters_response)

let make_update_scaling_parameters_request
    ~scaling_parameters:(scaling_parameters_ : scaling_parameters)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ scaling_parameters = scaling_parameters_; domain_name = domain_name_ }
    : update_scaling_parameters_request)

let make_domain_endpoint_options
    ?tls_security_policy:(tls_security_policy_ : tls_security_policy option)
    ?enforce_http_s:(enforce_http_s_ : boolean_ option) () =
  ({ tls_security_policy = tls_security_policy_; enforce_http_s = enforce_http_s_ }
    : domain_endpoint_options)

let make_domain_endpoint_options_status ~status:(status_ : option_status)
    ~options:(options_ : domain_endpoint_options) () =
  ({ status = status_; options = options_ } : domain_endpoint_options_status)

let make_update_domain_endpoint_options_response
    ?domain_endpoint_options:(domain_endpoint_options_ : domain_endpoint_options_status option) () =
  ({ domain_endpoint_options = domain_endpoint_options_ } : update_domain_endpoint_options_response)

let make_update_domain_endpoint_options_request
    ~domain_endpoint_options:(domain_endpoint_options_ : domain_endpoint_options)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_endpoint_options = domain_endpoint_options_; domain_name = domain_name_ }
    : update_domain_endpoint_options_request)

let make_availability_options_status ~status:(status_ : option_status)
    ~options:(options_ : multi_a_z) () =
  ({ status = status_; options = options_ } : availability_options_status)

let make_update_availability_options_response
    ?availability_options:(availability_options_ : availability_options_status option) () =
  ({ availability_options = availability_options_ } : update_availability_options_response)

let make_update_availability_options_request ~multi_a_z:(multi_a_z_ : boolean_)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ multi_a_z = multi_a_z_; domain_name = domain_name_ } : update_availability_options_request)

let make_text_options ?analysis_scheme:(analysis_scheme_ : word option)
    ?highlight_enabled:(highlight_enabled_ : boolean_ option)
    ?sort_enabled:(sort_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?source_field:(source_field_ : field_name option)
    ?default_value:(default_value_ : field_value option) () =
  ({
     analysis_scheme = analysis_scheme_;
     highlight_enabled = highlight_enabled_;
     sort_enabled = sort_enabled_;
     return_enabled = return_enabled_;
     source_field = source_field_;
     default_value = default_value_;
   }
    : text_options)

let make_text_array_options ?analysis_scheme:(analysis_scheme_ : word option)
    ?highlight_enabled:(highlight_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?default_value:(default_value_ : field_value option) () =
  ({
     analysis_scheme = analysis_scheme_;
     highlight_enabled = highlight_enabled_;
     return_enabled = return_enabled_;
     source_fields = source_fields_;
     default_value = default_value_;
   }
    : text_array_options)

let make_document_suggester_options ?sort_expression:(sort_expression_ : string_ option)
    ?fuzzy_matching:(fuzzy_matching_ : suggester_fuzzy_matching option)
    ~source_field:(source_field_ : field_name) () =
  ({
     sort_expression = sort_expression_;
     fuzzy_matching = fuzzy_matching_;
     source_field = source_field_;
   }
    : document_suggester_options)

let make_suggester
    ~document_suggester_options:(document_suggester_options_ : document_suggester_options)
    ~suggester_name:(suggester_name_ : standard_name) () =
  ({ document_suggester_options = document_suggester_options_; suggester_name = suggester_name_ }
    : suggester)

let make_suggester_status ~status:(status_ : option_status) ~options:(options_ : suggester) () =
  ({ status = status_; options = options_ } : suggester_status)

let make_service_endpoint ?endpoint:(endpoint_ : service_url option) () =
  ({ endpoint = endpoint_ } : service_endpoint)

let make_literal_options ?sort_enabled:(sort_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_field:(source_field_ : field_name option)
    ?default_value:(default_value_ : field_value option) () =
  ({
     sort_enabled = sort_enabled_;
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_field = source_field_;
     default_value = default_value_;
   }
    : literal_options)

let make_literal_array_options ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?default_value:(default_value_ : field_value option) () =
  ({
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_fields = source_fields_;
     default_value = default_value_;
   }
    : literal_array_options)

let make_list_domain_names_response ?domain_names:(domain_names_ : domain_name_map option) () =
  ({ domain_names = domain_names_ } : list_domain_names_response)

let make_limits ~maximum_partition_count:(maximum_partition_count_ : maximum_partition_count)
    ~maximum_replication_count:(maximum_replication_count_ : maximum_replication_count) () =
  ({
     maximum_partition_count = maximum_partition_count_;
     maximum_replication_count = maximum_replication_count_;
   }
    : limits)

let make_lat_lon_options ?sort_enabled:(sort_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_field:(source_field_ : field_name option)
    ?default_value:(default_value_ : field_value option) () =
  ({
     sort_enabled = sort_enabled_;
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_field = source_field_;
     default_value = default_value_;
   }
    : lat_lon_options)

let make_int_options ?sort_enabled:(sort_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_field:(source_field_ : field_name option) ?default_value:(default_value_ : long option)
    () =
  ({
     sort_enabled = sort_enabled_;
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_field = source_field_;
     default_value = default_value_;
   }
    : int_options)

let make_int_array_options ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?default_value:(default_value_ : long option) () =
  ({
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_fields = source_fields_;
     default_value = default_value_;
   }
    : int_array_options)

let make_double_options ?sort_enabled:(sort_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_field:(source_field_ : field_name option)
    ?default_value:(default_value_ : double option) () =
  ({
     sort_enabled = sort_enabled_;
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_field = source_field_;
     default_value = default_value_;
   }
    : double_options)

let make_date_options ?sort_enabled:(sort_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_field:(source_field_ : field_name option)
    ?default_value:(default_value_ : field_value option) () =
  ({
     sort_enabled = sort_enabled_;
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_field = source_field_;
     default_value = default_value_;
   }
    : date_options)

let make_double_array_options ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?default_value:(default_value_ : double option) () =
  ({
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_fields = source_fields_;
     default_value = default_value_;
   }
    : double_array_options)

let make_date_array_options ?return_enabled:(return_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?default_value:(default_value_ : field_value option) () =
  ({
     return_enabled = return_enabled_;
     search_enabled = search_enabled_;
     facet_enabled = facet_enabled_;
     source_fields = source_fields_;
     default_value = default_value_;
   }
    : date_array_options)

let make_index_field ?date_array_options:(date_array_options_ : date_array_options option)
    ?text_array_options:(text_array_options_ : text_array_options option)
    ?literal_array_options:(literal_array_options_ : literal_array_options option)
    ?double_array_options:(double_array_options_ : double_array_options option)
    ?int_array_options:(int_array_options_ : int_array_options option)
    ?lat_lon_options:(lat_lon_options_ : lat_lon_options option)
    ?date_options:(date_options_ : date_options option)
    ?text_options:(text_options_ : text_options option)
    ?literal_options:(literal_options_ : literal_options option)
    ?double_options:(double_options_ : double_options option)
    ?int_options:(int_options_ : int_options option)
    ~index_field_type:(index_field_type_ : index_field_type)
    ~index_field_name:(index_field_name_ : dynamic_field_name) () =
  ({
     date_array_options = date_array_options_;
     text_array_options = text_array_options_;
     literal_array_options = literal_array_options_;
     double_array_options = double_array_options_;
     int_array_options = int_array_options_;
     lat_lon_options = lat_lon_options_;
     date_options = date_options_;
     text_options = text_options_;
     literal_options = literal_options_;
     double_options = double_options_;
     int_options = int_options_;
     index_field_type = index_field_type_;
     index_field_name = index_field_name_;
   }
    : index_field)

let make_index_field_status ~status:(status_ : option_status) ~options:(options_ : index_field) () =
  ({ status = status_; options = options_ } : index_field_status)

let make_index_documents_response ?field_names:(field_names_ : field_name_list option) () =
  ({ field_names = field_names_ } : index_documents_response)

let make_index_documents_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : index_documents_request)

let make_expression ~expression_value:(expression_value_ : expression_value)
    ~expression_name:(expression_name_ : standard_name) () =
  ({ expression_value = expression_value_; expression_name = expression_name_ } : expression)

let make_expression_status ~status:(status_ : option_status) ~options:(options_ : expression) () =
  ({ status = status_; options = options_ } : expression_status)

let make_domain_status ?limits:(limits_ : limits option)
    ?search_instance_count:(search_instance_count_ : instance_count option)
    ?search_partition_count:(search_partition_count_ : partition_count option)
    ?search_instance_type:(search_instance_type_ : search_instance_type option)
    ?processing:(processing_ : boolean_ option)
    ?search_service:(search_service_ : service_endpoint option)
    ?doc_service:(doc_service_ : service_endpoint option) ?deleted:(deleted_ : boolean_ option)
    ?created:(created_ : boolean_ option) ?ar_n:(ar_n_ : ar_n option)
    ~requires_index_documents:(requires_index_documents_ : boolean_)
    ~domain_name:(domain_name_ : domain_name) ~domain_id:(domain_id_ : domain_id) () =
  ({
     limits = limits_;
     search_instance_count = search_instance_count_;
     search_partition_count = search_partition_count_;
     search_instance_type = search_instance_type_;
     processing = processing_;
     requires_index_documents = requires_index_documents_;
     search_service = search_service_;
     doc_service = doc_service_;
     deleted = deleted_;
     created = created_;
     ar_n = ar_n_;
     domain_name = domain_name_;
     domain_id = domain_id_;
   }
    : domain_status)

let make_describe_suggesters_response ~suggesters:(suggesters_ : suggester_status_list) () =
  ({ suggesters = suggesters_ } : describe_suggesters_response)

let make_describe_suggesters_request ?deployed:(deployed_ : boolean_ option)
    ?suggester_names:(suggester_names_ : standard_name_list option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ deployed = deployed_; suggester_names = suggester_names_; domain_name = domain_name_ }
    : describe_suggesters_request)

let make_describe_service_access_policies_response
    ~access_policies:(access_policies_ : access_policies_status) () =
  ({ access_policies = access_policies_ } : describe_service_access_policies_response)

let make_describe_service_access_policies_request ?deployed:(deployed_ : boolean_ option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ deployed = deployed_; domain_name = domain_name_ } : describe_service_access_policies_request)

let make_describe_scaling_parameters_response
    ~scaling_parameters:(scaling_parameters_ : scaling_parameters_status) () =
  ({ scaling_parameters = scaling_parameters_ } : describe_scaling_parameters_response)

let make_describe_scaling_parameters_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : describe_scaling_parameters_request)

let make_describe_index_fields_response ~index_fields:(index_fields_ : index_field_status_list) () =
  ({ index_fields = index_fields_ } : describe_index_fields_response)

let make_describe_index_fields_request ?deployed:(deployed_ : boolean_ option)
    ?field_names:(field_names_ : dynamic_field_name_list option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ deployed = deployed_; field_names = field_names_; domain_name = domain_name_ }
    : describe_index_fields_request)

let make_describe_expressions_response ~expressions:(expressions_ : expression_status_list) () =
  ({ expressions = expressions_ } : describe_expressions_response)

let make_describe_expressions_request ?deployed:(deployed_ : boolean_ option)
    ?expression_names:(expression_names_ : standard_name_list option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ deployed = deployed_; expression_names = expression_names_; domain_name = domain_name_ }
    : describe_expressions_request)

let make_describe_domains_response ~domain_status_list:(domain_status_list_ : domain_status_list) ()
    =
  ({ domain_status_list = domain_status_list_ } : describe_domains_response)

let make_describe_domains_request ?domain_names:(domain_names_ : domain_name_list option) () =
  ({ domain_names = domain_names_ } : describe_domains_request)

let make_describe_domain_endpoint_options_response
    ?domain_endpoint_options:(domain_endpoint_options_ : domain_endpoint_options_status option) () =
  ({ domain_endpoint_options = domain_endpoint_options_ }
    : describe_domain_endpoint_options_response)

let make_describe_domain_endpoint_options_request ?deployed:(deployed_ : boolean_ option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ deployed = deployed_; domain_name = domain_name_ } : describe_domain_endpoint_options_request)

let make_describe_availability_options_response
    ?availability_options:(availability_options_ : availability_options_status option) () =
  ({ availability_options = availability_options_ } : describe_availability_options_response)

let make_describe_availability_options_request ?deployed:(deployed_ : boolean_ option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ deployed = deployed_; domain_name = domain_name_ } : describe_availability_options_request)

let make_analysis_options
    ?algorithmic_stemming:(algorithmic_stemming_ : algorithmic_stemming option)
    ?japanese_tokenization_dictionary:(japanese_tokenization_dictionary_ : string_ option)
    ?stemming_dictionary:(stemming_dictionary_ : string_ option)
    ?stopwords:(stopwords_ : string_ option) ?synonyms:(synonyms_ : string_ option) () =
  ({
     algorithmic_stemming = algorithmic_stemming_;
     japanese_tokenization_dictionary = japanese_tokenization_dictionary_;
     stemming_dictionary = stemming_dictionary_;
     stopwords = stopwords_;
     synonyms = synonyms_;
   }
    : analysis_options)

let make_analysis_scheme ?analysis_options:(analysis_options_ : analysis_options option)
    ~analysis_scheme_language:(analysis_scheme_language_ : analysis_scheme_language)
    ~analysis_scheme_name:(analysis_scheme_name_ : standard_name) () =
  ({
     analysis_options = analysis_options_;
     analysis_scheme_language = analysis_scheme_language_;
     analysis_scheme_name = analysis_scheme_name_;
   }
    : analysis_scheme)

let make_analysis_scheme_status ~status:(status_ : option_status)
    ~options:(options_ : analysis_scheme) () =
  ({ status = status_; options = options_ } : analysis_scheme_status)

let make_describe_analysis_schemes_response
    ~analysis_schemes:(analysis_schemes_ : analysis_scheme_status_list) () =
  ({ analysis_schemes = analysis_schemes_ } : describe_analysis_schemes_response)

let make_describe_analysis_schemes_request ?deployed:(deployed_ : boolean_ option)
    ?analysis_scheme_names:(analysis_scheme_names_ : standard_name_list option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({
     deployed = deployed_;
     analysis_scheme_names = analysis_scheme_names_;
     domain_name = domain_name_;
   }
    : describe_analysis_schemes_request)

let make_delete_suggester_response ~suggester:(suggester_ : suggester_status) () =
  ({ suggester = suggester_ } : delete_suggester_response)

let make_delete_suggester_request ~suggester_name:(suggester_name_ : standard_name)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ suggester_name = suggester_name_; domain_name = domain_name_ } : delete_suggester_request)

let make_delete_index_field_response ~index_field:(index_field_ : index_field_status) () =
  ({ index_field = index_field_ } : delete_index_field_response)

let make_delete_index_field_request ~index_field_name:(index_field_name_ : dynamic_field_name)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ index_field_name = index_field_name_; domain_name = domain_name_ }
    : delete_index_field_request)

let make_delete_expression_response ~expression:(expression_ : expression_status) () =
  ({ expression = expression_ } : delete_expression_response)

let make_delete_expression_request ~expression_name:(expression_name_ : standard_name)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ expression_name = expression_name_; domain_name = domain_name_ } : delete_expression_request)

let make_delete_domain_response ?domain_status:(domain_status_ : domain_status option) () =
  ({ domain_status = domain_status_ } : delete_domain_response)

let make_delete_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : delete_domain_request)

let make_delete_analysis_scheme_response
    ~analysis_scheme:(analysis_scheme_ : analysis_scheme_status) () =
  ({ analysis_scheme = analysis_scheme_ } : delete_analysis_scheme_response)

let make_delete_analysis_scheme_request
    ~analysis_scheme_name:(analysis_scheme_name_ : standard_name)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ analysis_scheme_name = analysis_scheme_name_; domain_name = domain_name_ }
    : delete_analysis_scheme_request)

let make_define_suggester_response ~suggester:(suggester_ : suggester_status) () =
  ({ suggester = suggester_ } : define_suggester_response)

let make_define_suggester_request ~suggester:(suggester_ : suggester)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ suggester = suggester_; domain_name = domain_name_ } : define_suggester_request)

let make_define_index_field_response ~index_field:(index_field_ : index_field_status) () =
  ({ index_field = index_field_ } : define_index_field_response)

let make_define_index_field_request ~index_field:(index_field_ : index_field)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ index_field = index_field_; domain_name = domain_name_ } : define_index_field_request)

let make_define_expression_response ~expression:(expression_ : expression_status) () =
  ({ expression = expression_ } : define_expression_response)

let make_define_expression_request ~expression:(expression_ : expression)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ expression = expression_; domain_name = domain_name_ } : define_expression_request)

let make_define_analysis_scheme_response
    ~analysis_scheme:(analysis_scheme_ : analysis_scheme_status) () =
  ({ analysis_scheme = analysis_scheme_ } : define_analysis_scheme_response)

let make_define_analysis_scheme_request ~analysis_scheme:(analysis_scheme_ : analysis_scheme)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ analysis_scheme = analysis_scheme_; domain_name = domain_name_ }
    : define_analysis_scheme_request)

let make_create_domain_response ?domain_status:(domain_status_ : domain_status option) () =
  ({ domain_status = domain_status_ } : create_domain_response)

let make_create_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : create_domain_request)

let make_build_suggesters_response ?field_names:(field_names_ : field_name_list option) () =
  ({ field_names = field_names_ } : build_suggesters_response)

let make_build_suggesters_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : build_suggesters_request)
