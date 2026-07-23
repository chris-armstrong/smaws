open Types

let make_option_status ?update_version:(update_version_ : u_int_value option)
    ?pending_deletion:(pending_deletion_ : boolean_ option)
    ~creation_date:(creation_date_ : update_timestamp)
    ~update_date:(update_date_ : update_timestamp) ~state:(state_ : option_state) () =
  ({
     creation_date = creation_date_;
     update_date = update_date_;
     update_version = update_version_;
     state = state_;
     pending_deletion = pending_deletion_;
   }
    : option_status)

let make_access_policies_status ~options:(options_ : policy_document)
    ~status:(status_ : option_status) () =
  ({ options = options_; status = status_ } : access_policies_status)

let make_update_service_access_policies_response
    ~access_policies:(access_policies_ : access_policies_status) () =
  ({ access_policies = access_policies_ } : update_service_access_policies_response)

let make_update_service_access_policies_request ~domain_name:(domain_name_ : domain_name)
    ~access_policies:(access_policies_ : policy_document) () =
  ({ domain_name = domain_name_; access_policies = access_policies_ }
    : update_service_access_policies_request)

let make_scaling_parameters
    ?desired_instance_type:(desired_instance_type_ : partition_instance_type option)
    ?desired_replication_count:(desired_replication_count_ : u_int_value option)
    ?desired_partition_count:(desired_partition_count_ : u_int_value option) () =
  ({
     desired_instance_type = desired_instance_type_;
     desired_replication_count = desired_replication_count_;
     desired_partition_count = desired_partition_count_;
   }
    : scaling_parameters)

let make_scaling_parameters_status ~options:(options_ : scaling_parameters)
    ~status:(status_ : option_status) () =
  ({ options = options_; status = status_ } : scaling_parameters_status)

let make_update_scaling_parameters_response
    ~scaling_parameters:(scaling_parameters_ : scaling_parameters_status) () =
  ({ scaling_parameters = scaling_parameters_ } : update_scaling_parameters_response)

let make_update_scaling_parameters_request ~domain_name:(domain_name_ : domain_name)
    ~scaling_parameters:(scaling_parameters_ : scaling_parameters) () =
  ({ domain_name = domain_name_; scaling_parameters = scaling_parameters_ }
    : update_scaling_parameters_request)

let make_domain_endpoint_options ?enforce_http_s:(enforce_http_s_ : boolean_ option)
    ?tls_security_policy:(tls_security_policy_ : tls_security_policy option) () =
  ({ enforce_http_s = enforce_http_s_; tls_security_policy = tls_security_policy_ }
    : domain_endpoint_options)

let make_domain_endpoint_options_status ~options:(options_ : domain_endpoint_options)
    ~status:(status_ : option_status) () =
  ({ options = options_; status = status_ } : domain_endpoint_options_status)

let make_update_domain_endpoint_options_response
    ?domain_endpoint_options:(domain_endpoint_options_ : domain_endpoint_options_status option) () =
  ({ domain_endpoint_options = domain_endpoint_options_ } : update_domain_endpoint_options_response)

let make_update_domain_endpoint_options_request ~domain_name:(domain_name_ : domain_name)
    ~domain_endpoint_options:(domain_endpoint_options_ : domain_endpoint_options) () =
  ({ domain_name = domain_name_; domain_endpoint_options = domain_endpoint_options_ }
    : update_domain_endpoint_options_request)

let make_availability_options_status ~options:(options_ : multi_a_z)
    ~status:(status_ : option_status) () =
  ({ options = options_; status = status_ } : availability_options_status)

let make_update_availability_options_response
    ?availability_options:(availability_options_ : availability_options_status option) () =
  ({ availability_options = availability_options_ } : update_availability_options_response)

let make_update_availability_options_request ~domain_name:(domain_name_ : domain_name)
    ~multi_a_z:(multi_a_z_ : boolean_) () =
  ({ domain_name = domain_name_; multi_a_z = multi_a_z_ } : update_availability_options_request)

let make_list_domain_names_response ?domain_names:(domain_names_ : domain_name_map option) () =
  ({ domain_names = domain_names_ } : list_domain_names_response)

let make_index_documents_response ?field_names:(field_names_ : field_name_list option) () =
  ({ field_names = field_names_ } : index_documents_response)

let make_index_documents_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : index_documents_request)

let make_document_suggester_options
    ?fuzzy_matching:(fuzzy_matching_ : suggester_fuzzy_matching option)
    ?sort_expression:(sort_expression_ : string_ option) ~source_field:(source_field_ : field_name)
    () =
  ({
     source_field = source_field_;
     fuzzy_matching = fuzzy_matching_;
     sort_expression = sort_expression_;
   }
    : document_suggester_options)

let make_suggester ~suggester_name:(suggester_name_ : standard_name)
    ~document_suggester_options:(document_suggester_options_ : document_suggester_options) () =
  ({ suggester_name = suggester_name_; document_suggester_options = document_suggester_options_ }
    : suggester)

let make_suggester_status ~options:(options_ : suggester) ~status:(status_ : option_status) () =
  ({ options = options_; status = status_ } : suggester_status)

let make_describe_suggesters_response ~suggesters:(suggesters_ : suggester_status_list) () =
  ({ suggesters = suggesters_ } : describe_suggesters_response)

let make_describe_suggesters_request ?suggester_names:(suggester_names_ : standard_name_list option)
    ?deployed:(deployed_ : boolean_ option) ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; suggester_names = suggester_names_; deployed = deployed_ }
    : describe_suggesters_request)

let make_describe_service_access_policies_response
    ~access_policies:(access_policies_ : access_policies_status) () =
  ({ access_policies = access_policies_ } : describe_service_access_policies_response)

let make_describe_service_access_policies_request ?deployed:(deployed_ : boolean_ option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; deployed = deployed_ } : describe_service_access_policies_request)

let make_describe_scaling_parameters_response
    ~scaling_parameters:(scaling_parameters_ : scaling_parameters_status) () =
  ({ scaling_parameters = scaling_parameters_ } : describe_scaling_parameters_response)

let make_describe_scaling_parameters_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : describe_scaling_parameters_request)

let make_date_array_options ?default_value:(default_value_ : field_value option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_fields = source_fields_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
   }
    : date_array_options)

let make_text_array_options ?default_value:(default_value_ : field_value option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?highlight_enabled:(highlight_enabled_ : boolean_ option)
    ?analysis_scheme:(analysis_scheme_ : word option) () =
  ({
     default_value = default_value_;
     source_fields = source_fields_;
     return_enabled = return_enabled_;
     highlight_enabled = highlight_enabled_;
     analysis_scheme = analysis_scheme_;
   }
    : text_array_options)

let make_literal_array_options ?default_value:(default_value_ : field_value option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_fields = source_fields_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
   }
    : literal_array_options)

let make_double_array_options ?default_value:(default_value_ : double option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_fields = source_fields_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
   }
    : double_array_options)

let make_int_array_options ?default_value:(default_value_ : long option)
    ?source_fields:(source_fields_ : field_name_comma_list option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_fields = source_fields_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
   }
    : int_array_options)

let make_lat_lon_options ?default_value:(default_value_ : field_value option)
    ?source_field:(source_field_ : field_name option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?sort_enabled:(sort_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_field = source_field_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
     sort_enabled = sort_enabled_;
   }
    : lat_lon_options)

let make_date_options ?default_value:(default_value_ : field_value option)
    ?source_field:(source_field_ : field_name option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?sort_enabled:(sort_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_field = source_field_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
     sort_enabled = sort_enabled_;
   }
    : date_options)

let make_text_options ?default_value:(default_value_ : field_value option)
    ?source_field:(source_field_ : field_name option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?sort_enabled:(sort_enabled_ : boolean_ option)
    ?highlight_enabled:(highlight_enabled_ : boolean_ option)
    ?analysis_scheme:(analysis_scheme_ : word option) () =
  ({
     default_value = default_value_;
     source_field = source_field_;
     return_enabled = return_enabled_;
     sort_enabled = sort_enabled_;
     highlight_enabled = highlight_enabled_;
     analysis_scheme = analysis_scheme_;
   }
    : text_options)

let make_literal_options ?default_value:(default_value_ : field_value option)
    ?source_field:(source_field_ : field_name option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?sort_enabled:(sort_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_field = source_field_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
     sort_enabled = sort_enabled_;
   }
    : literal_options)

let make_double_options ?default_value:(default_value_ : double option)
    ?source_field:(source_field_ : field_name option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?sort_enabled:(sort_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_field = source_field_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
     sort_enabled = sort_enabled_;
   }
    : double_options)

let make_int_options ?default_value:(default_value_ : long option)
    ?source_field:(source_field_ : field_name option)
    ?facet_enabled:(facet_enabled_ : boolean_ option)
    ?search_enabled:(search_enabled_ : boolean_ option)
    ?return_enabled:(return_enabled_ : boolean_ option)
    ?sort_enabled:(sort_enabled_ : boolean_ option) () =
  ({
     default_value = default_value_;
     source_field = source_field_;
     facet_enabled = facet_enabled_;
     search_enabled = search_enabled_;
     return_enabled = return_enabled_;
     sort_enabled = sort_enabled_;
   }
    : int_options)

let make_index_field ?int_options:(int_options_ : int_options option)
    ?double_options:(double_options_ : double_options option)
    ?literal_options:(literal_options_ : literal_options option)
    ?text_options:(text_options_ : text_options option)
    ?date_options:(date_options_ : date_options option)
    ?lat_lon_options:(lat_lon_options_ : lat_lon_options option)
    ?int_array_options:(int_array_options_ : int_array_options option)
    ?double_array_options:(double_array_options_ : double_array_options option)
    ?literal_array_options:(literal_array_options_ : literal_array_options option)
    ?text_array_options:(text_array_options_ : text_array_options option)
    ?date_array_options:(date_array_options_ : date_array_options option)
    ~index_field_name:(index_field_name_ : dynamic_field_name)
    ~index_field_type:(index_field_type_ : index_field_type) () =
  ({
     index_field_name = index_field_name_;
     index_field_type = index_field_type_;
     int_options = int_options_;
     double_options = double_options_;
     literal_options = literal_options_;
     text_options = text_options_;
     date_options = date_options_;
     lat_lon_options = lat_lon_options_;
     int_array_options = int_array_options_;
     double_array_options = double_array_options_;
     literal_array_options = literal_array_options_;
     text_array_options = text_array_options_;
     date_array_options = date_array_options_;
   }
    : index_field)

let make_index_field_status ~options:(options_ : index_field) ~status:(status_ : option_status) () =
  ({ options = options_; status = status_ } : index_field_status)

let make_describe_index_fields_response ~index_fields:(index_fields_ : index_field_status_list) () =
  ({ index_fields = index_fields_ } : describe_index_fields_response)

let make_describe_index_fields_request ?field_names:(field_names_ : dynamic_field_name_list option)
    ?deployed:(deployed_ : boolean_ option) ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; field_names = field_names_; deployed = deployed_ }
    : describe_index_fields_request)

let make_expression ~expression_name:(expression_name_ : standard_name)
    ~expression_value:(expression_value_ : expression_value) () =
  ({ expression_name = expression_name_; expression_value = expression_value_ } : expression)

let make_expression_status ~options:(options_ : expression) ~status:(status_ : option_status) () =
  ({ options = options_; status = status_ } : expression_status)

let make_describe_expressions_response ~expressions:(expressions_ : expression_status_list) () =
  ({ expressions = expressions_ } : describe_expressions_response)

let make_describe_expressions_request
    ?expression_names:(expression_names_ : standard_name_list option)
    ?deployed:(deployed_ : boolean_ option) ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; expression_names = expression_names_; deployed = deployed_ }
    : describe_expressions_request)

let make_limits ~maximum_replication_count:(maximum_replication_count_ : maximum_replication_count)
    ~maximum_partition_count:(maximum_partition_count_ : maximum_partition_count) () =
  ({
     maximum_replication_count = maximum_replication_count_;
     maximum_partition_count = maximum_partition_count_;
   }
    : limits)

let make_service_endpoint ?endpoint:(endpoint_ : service_url option) () =
  ({ endpoint = endpoint_ } : service_endpoint)

let make_domain_status ?ar_n:(ar_n_ : ar_n option) ?created:(created_ : boolean_ option)
    ?deleted:(deleted_ : boolean_ option) ?doc_service:(doc_service_ : service_endpoint option)
    ?search_service:(search_service_ : service_endpoint option)
    ?processing:(processing_ : boolean_ option)
    ?search_instance_type:(search_instance_type_ : search_instance_type option)
    ?search_partition_count:(search_partition_count_ : partition_count option)
    ?search_instance_count:(search_instance_count_ : instance_count option)
    ?limits:(limits_ : limits option) ~domain_id:(domain_id_ : domain_id)
    ~domain_name:(domain_name_ : domain_name)
    ~requires_index_documents:(requires_index_documents_ : boolean_) () =
  ({
     domain_id = domain_id_;
     domain_name = domain_name_;
     ar_n = ar_n_;
     created = created_;
     deleted = deleted_;
     doc_service = doc_service_;
     search_service = search_service_;
     requires_index_documents = requires_index_documents_;
     processing = processing_;
     search_instance_type = search_instance_type_;
     search_partition_count = search_partition_count_;
     search_instance_count = search_instance_count_;
     limits = limits_;
   }
    : domain_status)

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
  ({ domain_name = domain_name_; deployed = deployed_ } : describe_domain_endpoint_options_request)

let make_describe_availability_options_response
    ?availability_options:(availability_options_ : availability_options_status option) () =
  ({ availability_options = availability_options_ } : describe_availability_options_response)

let make_describe_availability_options_request ?deployed:(deployed_ : boolean_ option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; deployed = deployed_ } : describe_availability_options_request)

let make_analysis_options ?synonyms:(synonyms_ : string_ option)
    ?stopwords:(stopwords_ : string_ option)
    ?stemming_dictionary:(stemming_dictionary_ : string_ option)
    ?japanese_tokenization_dictionary:(japanese_tokenization_dictionary_ : string_ option)
    ?algorithmic_stemming:(algorithmic_stemming_ : algorithmic_stemming option) () =
  ({
     synonyms = synonyms_;
     stopwords = stopwords_;
     stemming_dictionary = stemming_dictionary_;
     japanese_tokenization_dictionary = japanese_tokenization_dictionary_;
     algorithmic_stemming = algorithmic_stemming_;
   }
    : analysis_options)

let make_analysis_scheme ?analysis_options:(analysis_options_ : analysis_options option)
    ~analysis_scheme_name:(analysis_scheme_name_ : standard_name)
    ~analysis_scheme_language:(analysis_scheme_language_ : analysis_scheme_language) () =
  ({
     analysis_scheme_name = analysis_scheme_name_;
     analysis_scheme_language = analysis_scheme_language_;
     analysis_options = analysis_options_;
   }
    : analysis_scheme)

let make_analysis_scheme_status ~options:(options_ : analysis_scheme)
    ~status:(status_ : option_status) () =
  ({ options = options_; status = status_ } : analysis_scheme_status)

let make_describe_analysis_schemes_response
    ~analysis_schemes:(analysis_schemes_ : analysis_scheme_status_list) () =
  ({ analysis_schemes = analysis_schemes_ } : describe_analysis_schemes_response)

let make_describe_analysis_schemes_request
    ?analysis_scheme_names:(analysis_scheme_names_ : standard_name_list option)
    ?deployed:(deployed_ : boolean_ option) ~domain_name:(domain_name_ : domain_name) () =
  ({
     domain_name = domain_name_;
     analysis_scheme_names = analysis_scheme_names_;
     deployed = deployed_;
   }
    : describe_analysis_schemes_request)

let make_delete_suggester_response ~suggester:(suggester_ : suggester_status) () =
  ({ suggester = suggester_ } : delete_suggester_response)

let make_delete_suggester_request ~domain_name:(domain_name_ : domain_name)
    ~suggester_name:(suggester_name_ : standard_name) () =
  ({ domain_name = domain_name_; suggester_name = suggester_name_ } : delete_suggester_request)

let make_delete_index_field_response ~index_field:(index_field_ : index_field_status) () =
  ({ index_field = index_field_ } : delete_index_field_response)

let make_delete_index_field_request ~domain_name:(domain_name_ : domain_name)
    ~index_field_name:(index_field_name_ : dynamic_field_name) () =
  ({ domain_name = domain_name_; index_field_name = index_field_name_ }
    : delete_index_field_request)

let make_delete_expression_response ~expression:(expression_ : expression_status) () =
  ({ expression = expression_ } : delete_expression_response)

let make_delete_expression_request ~domain_name:(domain_name_ : domain_name)
    ~expression_name:(expression_name_ : standard_name) () =
  ({ domain_name = domain_name_; expression_name = expression_name_ } : delete_expression_request)

let make_delete_domain_response ?domain_status:(domain_status_ : domain_status option) () =
  ({ domain_status = domain_status_ } : delete_domain_response)

let make_delete_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : delete_domain_request)

let make_delete_analysis_scheme_response
    ~analysis_scheme:(analysis_scheme_ : analysis_scheme_status) () =
  ({ analysis_scheme = analysis_scheme_ } : delete_analysis_scheme_response)

let make_delete_analysis_scheme_request ~domain_name:(domain_name_ : domain_name)
    ~analysis_scheme_name:(analysis_scheme_name_ : standard_name) () =
  ({ domain_name = domain_name_; analysis_scheme_name = analysis_scheme_name_ }
    : delete_analysis_scheme_request)

let make_define_suggester_response ~suggester:(suggester_ : suggester_status) () =
  ({ suggester = suggester_ } : define_suggester_response)

let make_define_suggester_request ~domain_name:(domain_name_ : domain_name)
    ~suggester:(suggester_ : suggester) () =
  ({ domain_name = domain_name_; suggester = suggester_ } : define_suggester_request)

let make_define_index_field_response ~index_field:(index_field_ : index_field_status) () =
  ({ index_field = index_field_ } : define_index_field_response)

let make_define_index_field_request ~domain_name:(domain_name_ : domain_name)
    ~index_field:(index_field_ : index_field) () =
  ({ domain_name = domain_name_; index_field = index_field_ } : define_index_field_request)

let make_define_expression_response ~expression:(expression_ : expression_status) () =
  ({ expression = expression_ } : define_expression_response)

let make_define_expression_request ~domain_name:(domain_name_ : domain_name)
    ~expression:(expression_ : expression) () =
  ({ domain_name = domain_name_; expression = expression_ } : define_expression_request)

let make_define_analysis_scheme_response
    ~analysis_scheme:(analysis_scheme_ : analysis_scheme_status) () =
  ({ analysis_scheme = analysis_scheme_ } : define_analysis_scheme_response)

let make_define_analysis_scheme_request ~domain_name:(domain_name_ : domain_name)
    ~analysis_scheme:(analysis_scheme_ : analysis_scheme) () =
  ({ domain_name = domain_name_; analysis_scheme = analysis_scheme_ }
    : define_analysis_scheme_request)

let make_create_domain_response ?domain_status:(domain_status_ : domain_status option) () =
  ({ domain_status = domain_status_ } : create_domain_response)

let make_create_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : create_domain_request)

let make_build_suggesters_response ?field_names:(field_names_ : field_name_list option) () =
  ({ field_names = field_names_ } : build_suggesters_response)

let make_build_suggesters_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : build_suggesters_request)
