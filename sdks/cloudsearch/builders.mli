open Types

val make_option_status :
  ?pending_deletion:boolean_ ->
  ?update_version:u_int_value ->
  state:option_state ->
  update_date:update_timestamp ->
  creation_date:update_timestamp ->
  unit ->
  option_status

val make_access_policies_status :
  status:option_status -> options:policy_document -> unit -> access_policies_status

val make_update_service_access_policies_response :
  access_policies:access_policies_status -> unit -> update_service_access_policies_response

val make_update_service_access_policies_request :
  access_policies:policy_document ->
  domain_name:domain_name ->
  unit ->
  update_service_access_policies_request

val make_scaling_parameters :
  ?desired_partition_count:u_int_value ->
  ?desired_replication_count:u_int_value ->
  ?desired_instance_type:partition_instance_type ->
  unit ->
  scaling_parameters

val make_scaling_parameters_status :
  status:option_status -> options:scaling_parameters -> unit -> scaling_parameters_status

val make_update_scaling_parameters_response :
  scaling_parameters:scaling_parameters_status -> unit -> update_scaling_parameters_response

val make_update_scaling_parameters_request :
  scaling_parameters:scaling_parameters ->
  domain_name:domain_name ->
  unit ->
  update_scaling_parameters_request

val make_domain_endpoint_options :
  ?tls_security_policy:tls_security_policy ->
  ?enforce_http_s:boolean_ ->
  unit ->
  domain_endpoint_options

val make_domain_endpoint_options_status :
  status:option_status -> options:domain_endpoint_options -> unit -> domain_endpoint_options_status

val make_update_domain_endpoint_options_response :
  ?domain_endpoint_options:domain_endpoint_options_status ->
  unit ->
  update_domain_endpoint_options_response

val make_update_domain_endpoint_options_request :
  domain_endpoint_options:domain_endpoint_options ->
  domain_name:domain_name ->
  unit ->
  update_domain_endpoint_options_request

val make_availability_options_status :
  status:option_status -> options:multi_a_z -> unit -> availability_options_status

val make_update_availability_options_response :
  ?availability_options:availability_options_status -> unit -> update_availability_options_response

val make_update_availability_options_request :
  multi_a_z:boolean_ -> domain_name:domain_name -> unit -> update_availability_options_request

val make_text_options :
  ?analysis_scheme:word ->
  ?highlight_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?source_field:field_name ->
  ?default_value:field_value ->
  unit ->
  text_options

val make_text_array_options :
  ?analysis_scheme:word ->
  ?highlight_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?source_fields:field_name_comma_list ->
  ?default_value:field_value ->
  unit ->
  text_array_options

val make_document_suggester_options :
  ?sort_expression:string_ ->
  ?fuzzy_matching:suggester_fuzzy_matching ->
  source_field:field_name ->
  unit ->
  document_suggester_options

val make_suggester :
  document_suggester_options:document_suggester_options ->
  suggester_name:standard_name ->
  unit ->
  suggester

val make_suggester_status : status:option_status -> options:suggester -> unit -> suggester_status
val make_service_endpoint : ?endpoint:service_url -> unit -> service_endpoint

val make_literal_options :
  ?sort_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_field:field_name ->
  ?default_value:field_value ->
  unit ->
  literal_options

val make_literal_array_options :
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_fields:field_name_comma_list ->
  ?default_value:field_value ->
  unit ->
  literal_array_options

val make_list_domain_names_response :
  ?domain_names:domain_name_map -> unit -> list_domain_names_response

val make_limits :
  maximum_partition_count:maximum_partition_count ->
  maximum_replication_count:maximum_replication_count ->
  unit ->
  limits

val make_lat_lon_options :
  ?sort_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_field:field_name ->
  ?default_value:field_value ->
  unit ->
  lat_lon_options

val make_int_options :
  ?sort_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_field:field_name ->
  ?default_value:long ->
  unit ->
  int_options

val make_int_array_options :
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_fields:field_name_comma_list ->
  ?default_value:long ->
  unit ->
  int_array_options

val make_double_options :
  ?sort_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_field:field_name ->
  ?default_value:double ->
  unit ->
  double_options

val make_date_options :
  ?sort_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_field:field_name ->
  ?default_value:field_value ->
  unit ->
  date_options

val make_double_array_options :
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_fields:field_name_comma_list ->
  ?default_value:double ->
  unit ->
  double_array_options

val make_date_array_options :
  ?return_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?facet_enabled:boolean_ ->
  ?source_fields:field_name_comma_list ->
  ?default_value:field_value ->
  unit ->
  date_array_options

val make_index_field :
  ?date_array_options:date_array_options ->
  ?text_array_options:text_array_options ->
  ?literal_array_options:literal_array_options ->
  ?double_array_options:double_array_options ->
  ?int_array_options:int_array_options ->
  ?lat_lon_options:lat_lon_options ->
  ?date_options:date_options ->
  ?text_options:text_options ->
  ?literal_options:literal_options ->
  ?double_options:double_options ->
  ?int_options:int_options ->
  index_field_type:index_field_type ->
  index_field_name:dynamic_field_name ->
  unit ->
  index_field

val make_index_field_status :
  status:option_status -> options:index_field -> unit -> index_field_status

val make_index_documents_response : ?field_names:field_name_list -> unit -> index_documents_response
val make_index_documents_request : domain_name:domain_name -> unit -> index_documents_request

val make_expression :
  expression_value:expression_value -> expression_name:standard_name -> unit -> expression

val make_expression_status : status:option_status -> options:expression -> unit -> expression_status

val make_domain_status :
  ?limits:limits ->
  ?search_instance_count:instance_count ->
  ?search_partition_count:partition_count ->
  ?search_instance_type:search_instance_type ->
  ?processing:boolean_ ->
  ?search_service:service_endpoint ->
  ?doc_service:service_endpoint ->
  ?deleted:boolean_ ->
  ?created:boolean_ ->
  ?ar_n:ar_n ->
  requires_index_documents:boolean_ ->
  domain_name:domain_name ->
  domain_id:domain_id ->
  unit ->
  domain_status

val make_describe_suggesters_response :
  suggesters:suggester_status_list -> unit -> describe_suggesters_response

val make_describe_suggesters_request :
  ?deployed:boolean_ ->
  ?suggester_names:standard_name_list ->
  domain_name:domain_name ->
  unit ->
  describe_suggesters_request

val make_describe_service_access_policies_response :
  access_policies:access_policies_status -> unit -> describe_service_access_policies_response

val make_describe_service_access_policies_request :
  ?deployed:boolean_ -> domain_name:domain_name -> unit -> describe_service_access_policies_request

val make_describe_scaling_parameters_response :
  scaling_parameters:scaling_parameters_status -> unit -> describe_scaling_parameters_response

val make_describe_scaling_parameters_request :
  domain_name:domain_name -> unit -> describe_scaling_parameters_request

val make_describe_index_fields_response :
  index_fields:index_field_status_list -> unit -> describe_index_fields_response

val make_describe_index_fields_request :
  ?deployed:boolean_ ->
  ?field_names:dynamic_field_name_list ->
  domain_name:domain_name ->
  unit ->
  describe_index_fields_request

val make_describe_expressions_response :
  expressions:expression_status_list -> unit -> describe_expressions_response

val make_describe_expressions_request :
  ?deployed:boolean_ ->
  ?expression_names:standard_name_list ->
  domain_name:domain_name ->
  unit ->
  describe_expressions_request

val make_describe_domains_response :
  domain_status_list:domain_status_list -> unit -> describe_domains_response

val make_describe_domains_request :
  ?domain_names:domain_name_list -> unit -> describe_domains_request

val make_describe_domain_endpoint_options_response :
  ?domain_endpoint_options:domain_endpoint_options_status ->
  unit ->
  describe_domain_endpoint_options_response

val make_describe_domain_endpoint_options_request :
  ?deployed:boolean_ -> domain_name:domain_name -> unit -> describe_domain_endpoint_options_request

val make_describe_availability_options_response :
  ?availability_options:availability_options_status ->
  unit ->
  describe_availability_options_response

val make_describe_availability_options_request :
  ?deployed:boolean_ -> domain_name:domain_name -> unit -> describe_availability_options_request

val make_analysis_options :
  ?algorithmic_stemming:algorithmic_stemming ->
  ?japanese_tokenization_dictionary:string_ ->
  ?stemming_dictionary:string_ ->
  ?stopwords:string_ ->
  ?synonyms:string_ ->
  unit ->
  analysis_options

val make_analysis_scheme :
  ?analysis_options:analysis_options ->
  analysis_scheme_language:analysis_scheme_language ->
  analysis_scheme_name:standard_name ->
  unit ->
  analysis_scheme

val make_analysis_scheme_status :
  status:option_status -> options:analysis_scheme -> unit -> analysis_scheme_status

val make_describe_analysis_schemes_response :
  analysis_schemes:analysis_scheme_status_list -> unit -> describe_analysis_schemes_response

val make_describe_analysis_schemes_request :
  ?deployed:boolean_ ->
  ?analysis_scheme_names:standard_name_list ->
  domain_name:domain_name ->
  unit ->
  describe_analysis_schemes_request

val make_delete_suggester_response : suggester:suggester_status -> unit -> delete_suggester_response

val make_delete_suggester_request :
  suggester_name:standard_name -> domain_name:domain_name -> unit -> delete_suggester_request

val make_delete_index_field_response :
  index_field:index_field_status -> unit -> delete_index_field_response

val make_delete_index_field_request :
  index_field_name:dynamic_field_name ->
  domain_name:domain_name ->
  unit ->
  delete_index_field_request

val make_delete_expression_response :
  expression:expression_status -> unit -> delete_expression_response

val make_delete_expression_request :
  expression_name:standard_name -> domain_name:domain_name -> unit -> delete_expression_request

val make_delete_domain_response : ?domain_status:domain_status -> unit -> delete_domain_response
val make_delete_domain_request : domain_name:domain_name -> unit -> delete_domain_request

val make_delete_analysis_scheme_response :
  analysis_scheme:analysis_scheme_status -> unit -> delete_analysis_scheme_response

val make_delete_analysis_scheme_request :
  analysis_scheme_name:standard_name ->
  domain_name:domain_name ->
  unit ->
  delete_analysis_scheme_request

val make_define_suggester_response : suggester:suggester_status -> unit -> define_suggester_response

val make_define_suggester_request :
  suggester:suggester -> domain_name:domain_name -> unit -> define_suggester_request

val make_define_index_field_response :
  index_field:index_field_status -> unit -> define_index_field_response

val make_define_index_field_request :
  index_field:index_field -> domain_name:domain_name -> unit -> define_index_field_request

val make_define_expression_response :
  expression:expression_status -> unit -> define_expression_response

val make_define_expression_request :
  expression:expression -> domain_name:domain_name -> unit -> define_expression_request

val make_define_analysis_scheme_response :
  analysis_scheme:analysis_scheme_status -> unit -> define_analysis_scheme_response

val make_define_analysis_scheme_request :
  analysis_scheme:analysis_scheme ->
  domain_name:domain_name ->
  unit ->
  define_analysis_scheme_request

val make_create_domain_response : ?domain_status:domain_status -> unit -> create_domain_response
val make_create_domain_request : domain_name:domain_name -> unit -> create_domain_request

val make_build_suggesters_response :
  ?field_names:field_name_list -> unit -> build_suggesters_response

val make_build_suggesters_request : domain_name:domain_name -> unit -> build_suggesters_request
