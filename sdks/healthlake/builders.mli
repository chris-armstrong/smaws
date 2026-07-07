open Types

val make_kms_encryption_config :
  ?kms_key_id:encryption_key_i_d -> cmk_type:cmk_type -> unit -> kms_encryption_config

val make_sse_configuration :
  kms_encryption_config:kms_encryption_config -> unit -> sse_configuration

val make_preload_data_config : preload_data_type:preload_data_type -> unit -> preload_data_config

val make_identity_provider_configuration :
  ?idp_lambda_arn:lambda_arn ->
  ?metadata:configuration_metadata ->
  ?fine_grained_authorization_enabled:boolean_ ->
  authorization_strategy:authorization_strategy ->
  unit ->
  identity_provider_configuration

val make_error_cause :
  ?error_category:error_category -> ?error_message:error_message -> unit -> error_cause

val make_nlp_configuration : ?status:nlp_status -> unit -> nlp_configuration
val make_analytics_configuration : ?status:analytics_status -> unit -> analytics_configuration
val make_profile_configuration : ?default_profiles:default_profiles -> unit -> profile_configuration

val make_datastore_properties :
  ?profile_configuration:profile_configuration ->
  ?analytics_configuration:analytics_configuration ->
  ?nlp_configuration:nlp_configuration ->
  ?error_cause:error_cause ->
  ?identity_provider_configuration:identity_provider_configuration ->
  ?preload_data_config:preload_data_config ->
  ?sse_configuration:sse_configuration ->
  ?created_at:timestamp ->
  ?datastore_name:datastore_name ->
  datastore_endpoint:string_ ->
  datastore_type_version:fhir_version ->
  datastore_status:datastore_status ->
  datastore_arn:datastore_arn ->
  datastore_id:datastore_id ->
  unit ->
  datastore_properties

val make_update_fhir_datastore_response :
  datastore_properties:datastore_properties -> unit -> update_fhir_datastore_response

val make_update_fhir_datastore_request :
  ?identity_provider_configuration:identity_provider_configuration ->
  ?profile_configuration:profile_configuration ->
  ?analytics_configuration:analytics_configuration ->
  ?nlp_configuration:nlp_configuration ->
  ?datastore_name:datastore_name ->
  datastore_id:datastore_id ->
  unit ->
  update_fhir_datastore_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_start_fhir_import_job_response :
  ?datastore_id:datastore_id ->
  job_status:job_status ->
  job_id:job_id ->
  unit ->
  start_fhir_import_job_response

val make_s3_configuration :
  kms_key_id:encryption_key_i_d -> s3_uri:s3_uri -> unit -> s3_configuration

val make_start_fhir_import_job_request :
  ?validation_level:validation_level ->
  ?client_token:client_token_string ->
  ?job_name:job_name ->
  data_access_role_arn:iam_role_arn ->
  datastore_id:datastore_id ->
  job_output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_fhir_import_job_request

val make_start_fhir_export_job_response :
  ?datastore_id:datastore_id ->
  job_status:job_status ->
  job_id:job_id ->
  unit ->
  start_fhir_export_job_response

val make_start_fhir_export_job_request :
  ?client_token:client_token_string ->
  ?job_name:job_name ->
  data_access_role_arn:iam_role_arn ->
  datastore_id:datastore_id ->
  output_data_config:output_data_config ->
  unit ->
  start_fhir_export_job_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_job_progress_report :
  ?throughput:generic_double ->
  ?total_number_of_files_read_with_customer_error:generic_long ->
  ?total_number_of_resources_with_customer_error:generic_long ->
  ?total_number_of_resources_imported:generic_long ->
  ?total_number_of_resources_scanned:generic_long ->
  ?total_number_of_imported_files:generic_long ->
  ?total_size_of_scanned_files_in_m_b:generic_double ->
  ?total_number_of_scanned_files:generic_long ->
  unit ->
  job_progress_report

val make_import_job_properties :
  ?validation_level:validation_level ->
  ?message:message ->
  ?data_access_role_arn:iam_role_arn ->
  ?job_progress_report:job_progress_report ->
  ?job_output_data_config:output_data_config ->
  ?end_time:timestamp ->
  ?job_name:job_name ->
  input_data_config:input_data_config ->
  datastore_id:datastore_id ->
  submit_time:timestamp ->
  job_status:job_status ->
  job_id:job_id ->
  unit ->
  import_job_properties

val make_list_fhir_import_jobs_response :
  ?next_token:next_token ->
  import_job_properties_list:import_job_properties_list ->
  unit ->
  list_fhir_import_jobs_response

val make_list_fhir_import_jobs_request :
  ?submitted_after:timestamp ->
  ?submitted_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?max_results:max_results_integer ->
  ?next_token:next_token ->
  datastore_id:datastore_id ->
  unit ->
  list_fhir_import_jobs_request

val make_export_job_properties :
  ?message:message ->
  ?data_access_role_arn:iam_role_arn ->
  ?end_time:timestamp ->
  ?job_name:job_name ->
  output_data_config:output_data_config ->
  datastore_id:datastore_id ->
  submit_time:timestamp ->
  job_status:job_status ->
  job_id:job_id ->
  unit ->
  export_job_properties

val make_list_fhir_export_jobs_response :
  ?next_token:next_token ->
  export_job_properties_list:export_job_properties_list ->
  unit ->
  list_fhir_export_jobs_response

val make_list_fhir_export_jobs_request :
  ?submitted_after:timestamp ->
  ?submitted_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?max_results:max_results_integer ->
  ?next_token:next_token ->
  datastore_id:datastore_id ->
  unit ->
  list_fhir_export_jobs_request

val make_list_fhir_datastores_response :
  ?next_token:next_token ->
  datastore_properties_list:datastore_properties_list ->
  unit ->
  list_fhir_datastores_response

val make_datastore_filter :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?datastore_status:datastore_status ->
  ?datastore_name:datastore_name ->
  unit ->
  datastore_filter

val make_list_fhir_datastores_request :
  ?max_results:max_results_integer ->
  ?next_token:next_token ->
  ?filter:datastore_filter ->
  unit ->
  list_fhir_datastores_request

val make_describe_fhir_import_job_response :
  import_job_properties:import_job_properties -> unit -> describe_fhir_import_job_response

val make_describe_fhir_import_job_request :
  job_id:job_id -> datastore_id:datastore_id -> unit -> describe_fhir_import_job_request

val make_describe_fhir_export_job_response :
  export_job_properties:export_job_properties -> unit -> describe_fhir_export_job_response

val make_describe_fhir_export_job_request :
  job_id:job_id -> datastore_id:datastore_id -> unit -> describe_fhir_export_job_request

val make_describe_fhir_datastore_response :
  datastore_properties:datastore_properties -> unit -> describe_fhir_datastore_response

val make_describe_fhir_datastore_request :
  datastore_id:datastore_id -> unit -> describe_fhir_datastore_request

val make_delete_fhir_datastore_response :
  datastore_endpoint:bounded_length_string ->
  datastore_status:datastore_status ->
  datastore_arn:datastore_arn ->
  datastore_id:datastore_id ->
  unit ->
  delete_fhir_datastore_response

val make_delete_fhir_datastore_request :
  datastore_id:datastore_id -> unit -> delete_fhir_datastore_request

val make_create_fhir_datastore_response :
  datastore_endpoint:bounded_length_string ->
  datastore_status:datastore_status ->
  datastore_arn:datastore_arn ->
  datastore_id:datastore_id ->
  unit ->
  create_fhir_datastore_response

val make_create_fhir_datastore_request :
  ?profile_configuration:profile_configuration ->
  ?nlp_configuration:nlp_configuration ->
  ?analytics_configuration:analytics_configuration ->
  ?identity_provider_configuration:identity_provider_configuration ->
  ?tags:tag_list ->
  ?client_token:client_token_string ->
  ?preload_data_config:preload_data_config ->
  ?sse_configuration:sse_configuration ->
  ?datastore_name:datastore_name ->
  datastore_type_version:fhir_version ->
  unit ->
  create_fhir_datastore_request
