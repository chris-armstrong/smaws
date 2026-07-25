open Types

val make_option_status :
  ?update_version:u_int_value ->
  ?pending_deletion:boolean_ ->
  creation_date:update_timestamp ->
  update_date:update_timestamp ->
  state:option_state ->
  unit ->
  option_status

val make_access_policies_status :
  options:policy_document -> status:option_status -> unit -> access_policies_status

val make_update_service_access_policies_response :
  access_policies:access_policies_status -> unit -> update_service_access_policies_response

val make_update_service_access_policies_request :
  domain_name:domain_name ->
  access_policies:policy_document ->
  unit ->
  update_service_access_policies_request

val make_scaling_parameters :
  ?desired_instance_type:partition_instance_type ->
  ?desired_replication_count:u_int_value ->
  ?desired_partition_count:u_int_value ->
  unit ->
  scaling_parameters

val make_scaling_parameters_status :
  options:scaling_parameters -> status:option_status -> unit -> scaling_parameters_status

val make_update_scaling_parameters_response :
  scaling_parameters:scaling_parameters_status -> unit -> update_scaling_parameters_response

val make_update_scaling_parameters_request :
  domain_name:domain_name ->
  scaling_parameters:scaling_parameters ->
  unit ->
  update_scaling_parameters_request

val make_domain_endpoint_options :
  ?enforce_http_s:boolean_ ->
  ?tls_security_policy:tls_security_policy ->
  unit ->
  domain_endpoint_options

val make_domain_endpoint_options_status :
  options:domain_endpoint_options -> status:option_status -> unit -> domain_endpoint_options_status

val make_update_domain_endpoint_options_response :
  ?domain_endpoint_options:domain_endpoint_options_status ->
  unit ->
  update_domain_endpoint_options_response

val make_update_domain_endpoint_options_request :
  domain_name:domain_name ->
  domain_endpoint_options:domain_endpoint_options ->
  unit ->
  update_domain_endpoint_options_request

val make_availability_options_status :
  options:multi_a_z -> status:option_status -> unit -> availability_options_status

val make_update_availability_options_response :
  ?availability_options:availability_options_status -> unit -> update_availability_options_response

val make_update_availability_options_request :
  domain_name:domain_name -> multi_a_z:boolean_ -> unit -> update_availability_options_request

val make_list_domain_names_response :
  ?domain_names:domain_name_map -> unit -> list_domain_names_response

val make_index_documents_response : ?field_names:field_name_list -> unit -> index_documents_response
val make_index_documents_request : domain_name:domain_name -> unit -> index_documents_request

val make_document_suggester_options :
  ?fuzzy_matching:suggester_fuzzy_matching ->
  ?sort_expression:string_ ->
  source_field:field_name ->
  unit ->
  document_suggester_options

val make_suggester :
  suggester_name:standard_name ->
  document_suggester_options:document_suggester_options ->
  unit ->
  suggester

val make_suggester_status : options:suggester -> status:option_status -> unit -> suggester_status

val make_describe_suggesters_response :
  suggesters:suggester_status_list -> unit -> describe_suggesters_response

val make_describe_suggesters_request :
  ?suggester_names:standard_name_list ->
  ?deployed:boolean_ ->
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

val make_date_array_options :
  ?default_value:field_value ->
  ?source_fields:field_name_comma_list ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  unit ->
  date_array_options

val make_text_array_options :
  ?default_value:field_value ->
  ?source_fields:field_name_comma_list ->
  ?return_enabled:boolean_ ->
  ?highlight_enabled:boolean_ ->
  ?analysis_scheme:word ->
  unit ->
  text_array_options

val make_literal_array_options :
  ?default_value:field_value ->
  ?source_fields:field_name_comma_list ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  unit ->
  literal_array_options

val make_double_array_options :
  ?default_value:double ->
  ?source_fields:field_name_comma_list ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  unit ->
  double_array_options

val make_int_array_options :
  ?default_value:long ->
  ?source_fields:field_name_comma_list ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  unit ->
  int_array_options

val make_lat_lon_options :
  ?default_value:field_value ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  lat_lon_options

val make_date_options :
  ?default_value:field_value ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  date_options

val make_text_options :
  ?default_value:field_value ->
  ?source_field:field_name ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  ?highlight_enabled:boolean_ ->
  ?analysis_scheme:word ->
  unit ->
  text_options

val make_literal_options :
  ?default_value:field_value ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  literal_options

val make_double_options :
  ?default_value:double ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  double_options

val make_int_options :
  ?default_value:long ->
  ?source_field:field_name ->
  ?facet_enabled:boolean_ ->
  ?search_enabled:boolean_ ->
  ?return_enabled:boolean_ ->
  ?sort_enabled:boolean_ ->
  unit ->
  int_options

val make_index_field :
  ?int_options:int_options ->
  ?double_options:double_options ->
  ?literal_options:literal_options ->
  ?text_options:text_options ->
  ?date_options:date_options ->
  ?lat_lon_options:lat_lon_options ->
  ?int_array_options:int_array_options ->
  ?double_array_options:double_array_options ->
  ?literal_array_options:literal_array_options ->
  ?text_array_options:text_array_options ->
  ?date_array_options:date_array_options ->
  index_field_name:dynamic_field_name ->
  index_field_type:index_field_type ->
  unit ->
  index_field

val make_index_field_status :
  options:index_field -> status:option_status -> unit -> index_field_status

val make_describe_index_fields_response :
  index_fields:index_field_status_list -> unit -> describe_index_fields_response

val make_describe_index_fields_request :
  ?field_names:dynamic_field_name_list ->
  ?deployed:boolean_ ->
  domain_name:domain_name ->
  unit ->
  describe_index_fields_request

val make_expression :
  expression_name:standard_name -> expression_value:expression_value -> unit -> expression

val make_expression_status : options:expression -> status:option_status -> unit -> expression_status

val make_describe_expressions_response :
  expressions:expression_status_list -> unit -> describe_expressions_response

val make_describe_expressions_request :
  ?expression_names:standard_name_list ->
  ?deployed:boolean_ ->
  domain_name:domain_name ->
  unit ->
  describe_expressions_request

val make_limits :
  maximum_replication_count:maximum_replication_count ->
  maximum_partition_count:maximum_partition_count ->
  unit ->
  limits

val make_service_endpoint : ?endpoint:service_url -> unit -> service_endpoint

val make_domain_status :
  ?ar_n:ar_n ->
  ?created:boolean_ ->
  ?deleted:boolean_ ->
  ?doc_service:service_endpoint ->
  ?search_service:service_endpoint ->
  ?processing:boolean_ ->
  ?search_instance_type:search_instance_type ->
  ?search_partition_count:partition_count ->
  ?search_instance_count:instance_count ->
  ?limits:limits ->
  domain_id:domain_id ->
  domain_name:domain_name ->
  requires_index_documents:boolean_ ->
  unit ->
  domain_status

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
  ?synonyms:string_ ->
  ?stopwords:string_ ->
  ?stemming_dictionary:string_ ->
  ?japanese_tokenization_dictionary:string_ ->
  ?algorithmic_stemming:algorithmic_stemming ->
  unit ->
  analysis_options

val make_analysis_scheme :
  ?analysis_options:analysis_options ->
  analysis_scheme_name:standard_name ->
  analysis_scheme_language:analysis_scheme_language ->
  unit ->
  analysis_scheme

val make_analysis_scheme_status :
  options:analysis_scheme -> status:option_status -> unit -> analysis_scheme_status

val make_describe_analysis_schemes_response :
  analysis_schemes:analysis_scheme_status_list -> unit -> describe_analysis_schemes_response

val make_describe_analysis_schemes_request :
  ?analysis_scheme_names:standard_name_list ->
  ?deployed:boolean_ ->
  domain_name:domain_name ->
  unit ->
  describe_analysis_schemes_request

val make_delete_suggester_response : suggester:suggester_status -> unit -> delete_suggester_response

val make_delete_suggester_request :
  domain_name:domain_name -> suggester_name:standard_name -> unit -> delete_suggester_request

val make_delete_index_field_response :
  index_field:index_field_status -> unit -> delete_index_field_response

val make_delete_index_field_request :
  domain_name:domain_name ->
  index_field_name:dynamic_field_name ->
  unit ->
  delete_index_field_request

val make_delete_expression_response :
  expression:expression_status -> unit -> delete_expression_response

val make_delete_expression_request :
  domain_name:domain_name -> expression_name:standard_name -> unit -> delete_expression_request

val make_delete_domain_response : ?domain_status:domain_status -> unit -> delete_domain_response
val make_delete_domain_request : domain_name:domain_name -> unit -> delete_domain_request

val make_delete_analysis_scheme_response :
  analysis_scheme:analysis_scheme_status -> unit -> delete_analysis_scheme_response

val make_delete_analysis_scheme_request :
  domain_name:domain_name ->
  analysis_scheme_name:standard_name ->
  unit ->
  delete_analysis_scheme_request

val make_define_suggester_response : suggester:suggester_status -> unit -> define_suggester_response

val make_define_suggester_request :
  domain_name:domain_name -> suggester:suggester -> unit -> define_suggester_request

val make_define_index_field_response :
  index_field:index_field_status -> unit -> define_index_field_response

val make_define_index_field_request :
  domain_name:domain_name -> index_field:index_field -> unit -> define_index_field_request

val make_define_expression_response :
  expression:expression_status -> unit -> define_expression_response

val make_define_expression_request :
  domain_name:domain_name -> expression:expression -> unit -> define_expression_request

val make_define_analysis_scheme_response :
  analysis_scheme:analysis_scheme_status -> unit -> define_analysis_scheme_response

val make_define_analysis_scheme_request :
  domain_name:domain_name ->
  analysis_scheme:analysis_scheme ->
  unit ->
  define_analysis_scheme_request

val make_create_domain_response : ?domain_status:domain_status -> unit -> create_domain_response
val make_create_domain_request : domain_name:domain_name -> unit -> create_domain_request

val make_build_suggesters_response :
  ?field_names:field_name_list -> unit -> build_suggesters_response

val make_build_suggesters_request : domain_name:domain_name -> unit -> build_suggesters_request
