open Types

val make_trait : ?name:attribute_name -> ?score:float_ -> unit -> trait

val make_attribute :
  ?type_:entity_sub_type ->
  ?score:float_ ->
  ?relationship_score:float_ ->
  ?relationship_type:relationship_type ->
  ?id:integer ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?text:string_ ->
  ?category:entity_type ->
  ?traits:trait_list ->
  unit ->
  attribute

val make_characters : ?original_text_characters:integer -> unit -> characters

val make_comprehend_medical_async_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  comprehend_medical_async_job_filter

val make_output_data_config : ?s3_key:s3_key -> s3_bucket:s3_bucket -> unit -> output_data_config
val make_input_data_config : ?s3_key:s3_key -> s3_bucket:s3_bucket -> unit -> input_data_config

val make_comprehend_medical_async_job_properties :
  ?job_id:job_id ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?expiration_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?language_code:language_code ->
  ?data_access_role_arn:iam_role_arn ->
  ?manifest_file_path:manifest_file_path ->
  ?kms_key:kms_key ->
  ?model_version:model_version ->
  unit ->
  comprehend_medical_async_job_properties

val make_stop_snomedct_inference_job_response :
  ?job_id:job_id -> unit -> stop_snomedct_inference_job_response

val make_stop_snomedct_inference_job_request :
  job_id:job_id -> unit -> stop_snomedct_inference_job_request

val make_stop_rx_norm_inference_job_response :
  ?job_id:job_id -> unit -> stop_rx_norm_inference_job_response

val make_stop_rx_norm_inference_job_request :
  job_id:job_id -> unit -> stop_rx_norm_inference_job_request

val make_stop_phi_detection_job_response : ?job_id:job_id -> unit -> stop_phi_detection_job_response
val make_stop_phi_detection_job_request : job_id:job_id -> unit -> stop_phi_detection_job_request

val make_stop_icd10cm_inference_job_response :
  ?job_id:job_id -> unit -> stop_icd10cm_inference_job_response

val make_stop_icd10cm_inference_job_request :
  job_id:job_id -> unit -> stop_icd10cm_inference_job_request

val make_stop_entities_detection_v2_job_response :
  ?job_id:job_id -> unit -> stop_entities_detection_v2_job_response

val make_stop_entities_detection_v2_job_request :
  job_id:job_id -> unit -> stop_entities_detection_v2_job_request

val make_start_snomedct_inference_job_response :
  ?job_id:job_id -> unit -> start_snomedct_inference_job_response

val make_start_snomedct_inference_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?kms_key:kms_key ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_snomedct_inference_job_request

val make_start_rx_norm_inference_job_response :
  ?job_id:job_id -> unit -> start_rx_norm_inference_job_response

val make_start_rx_norm_inference_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?kms_key:kms_key ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_rx_norm_inference_job_request

val make_start_phi_detection_job_response :
  ?job_id:job_id -> unit -> start_phi_detection_job_response

val make_start_phi_detection_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?kms_key:kms_key ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_phi_detection_job_request

val make_start_icd10cm_inference_job_response :
  ?job_id:job_id -> unit -> start_icd10cm_inference_job_response

val make_start_icd10cm_inference_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?kms_key:kms_key ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_icd10cm_inference_job_request

val make_start_entities_detection_v2_job_response :
  ?job_id:job_id -> unit -> start_entities_detection_v2_job_response

val make_start_entities_detection_v2_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?kms_key:kms_key ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_entities_detection_v2_job_request

val make_list_snomedct_inference_jobs_response :
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_snomedct_inference_jobs_response

val make_list_snomedct_inference_jobs_request :
  ?filter:comprehend_medical_async_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_snomedct_inference_jobs_request

val make_list_rx_norm_inference_jobs_response :
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_rx_norm_inference_jobs_response

val make_list_rx_norm_inference_jobs_request :
  ?filter:comprehend_medical_async_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_rx_norm_inference_jobs_request

val make_list_phi_detection_jobs_response :
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_phi_detection_jobs_response

val make_list_phi_detection_jobs_request :
  ?filter:comprehend_medical_async_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_phi_detection_jobs_request

val make_list_icd10cm_inference_jobs_response :
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_icd10cm_inference_jobs_response

val make_list_icd10cm_inference_jobs_request :
  ?filter:comprehend_medical_async_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_icd10cm_inference_jobs_request

val make_list_entities_detection_v2_jobs_response :
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_entities_detection_v2_jobs_response

val make_list_entities_detection_v2_jobs_request :
  ?filter:comprehend_medical_async_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_entities_detection_v2_jobs_request

val make_snomedct_details :
  ?edition:string_ -> ?language:string_ -> ?version_date:string_ -> unit -> snomedct_details

val make_snomedct_concept :
  ?description:string_ -> ?code:string_ -> ?score:float_ -> unit -> snomedct_concept

val make_snomedct_trait : ?name:snomedct_trait_name -> ?score:float_ -> unit -> snomedct_trait

val make_snomedct_attribute :
  ?category:snomedct_entity_category ->
  ?type_:snomedct_attribute_type ->
  ?score:float_ ->
  ?relationship_score:float_ ->
  ?relationship_type:snomedct_relationship_type ->
  ?id:integer ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?text:string_ ->
  ?traits:snomedct_trait_list ->
  ?snomedct_concepts:snomedct_concept_list ->
  unit ->
  snomedct_attribute

val make_snomedct_entity :
  ?id:integer ->
  ?text:ontology_linking_bounded_length_string ->
  ?category:snomedct_entity_category ->
  ?type_:snomedct_entity_type ->
  ?score:float_ ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?attributes:snomedct_attribute_list ->
  ?traits:snomedct_trait_list ->
  ?snomedct_concepts:snomedct_concept_list ->
  unit ->
  snomedct_entity

val make_infer_snomedct_response :
  ?pagination_token:string_ ->
  ?model_version:string_ ->
  ?snomedct_details:snomedct_details ->
  ?characters:characters ->
  entities:snomedct_entity_list ->
  unit ->
  infer_snomedct_response

val make_infer_snomedct_request :
  text:ontology_linking_bounded_length_string -> unit -> infer_snomedct_request

val make_rx_norm_concept :
  ?description:string_ -> ?code:string_ -> ?score:float_ -> unit -> rx_norm_concept

val make_rx_norm_trait : ?name:rx_norm_trait_name -> ?score:float_ -> unit -> rx_norm_trait

val make_rx_norm_attribute :
  ?type_:rx_norm_attribute_type ->
  ?score:float_ ->
  ?relationship_score:float_ ->
  ?id:integer ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?text:string_ ->
  ?traits:rx_norm_trait_list ->
  unit ->
  rx_norm_attribute

val make_rx_norm_entity :
  ?id:integer ->
  ?text:ontology_linking_bounded_length_string ->
  ?category:rx_norm_entity_category ->
  ?type_:rx_norm_entity_type ->
  ?score:float_ ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?attributes:rx_norm_attribute_list ->
  ?traits:rx_norm_trait_list ->
  ?rx_norm_concepts:rx_norm_concept_list ->
  unit ->
  rx_norm_entity

val make_infer_rx_norm_response :
  ?pagination_token:string_ ->
  ?model_version:string_ ->
  entities:rx_norm_entity_list ->
  unit ->
  infer_rx_norm_response

val make_infer_rx_norm_request :
  text:ontology_linking_bounded_length_string -> unit -> infer_rx_norm_request

val make_icd10cm_concept :
  ?description:string_ -> ?code:string_ -> ?score:float_ -> unit -> icd10cm_concept

val make_icd10cm_trait : ?name:icd10cm_trait_name -> ?score:float_ -> unit -> icd10cm_trait

val make_icd10cm_attribute :
  ?type_:icd10cm_attribute_type ->
  ?score:float_ ->
  ?relationship_score:float_ ->
  ?id:integer ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?text:string_ ->
  ?traits:icd10cm_trait_list ->
  ?category:icd10cm_entity_type ->
  ?relationship_type:icd10cm_relationship_type ->
  unit ->
  icd10cm_attribute

val make_icd10cm_entity :
  ?id:integer ->
  ?text:ontology_linking_bounded_length_string ->
  ?category:icd10cm_entity_category ->
  ?type_:icd10cm_entity_type ->
  ?score:float_ ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?attributes:icd10cm_attribute_list ->
  ?traits:icd10cm_trait_list ->
  ?icd10cm_concepts:icd10cm_concept_list ->
  unit ->
  icd10cm_entity

val make_infer_icd10cm_response :
  ?pagination_token:string_ ->
  ?model_version:string_ ->
  entities:icd10cm_entity_list ->
  unit ->
  infer_icd10cm_response

val make_infer_icd10cm_request :
  text:ontology_linking_bounded_length_string -> unit -> infer_icd10cm_request

val make_entity :
  ?id:integer ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?score:float_ ->
  ?text:string_ ->
  ?category:entity_type ->
  ?type_:entity_sub_type ->
  ?traits:trait_list ->
  ?attributes:attribute_list ->
  unit ->
  entity

val make_detect_phi_response :
  ?pagination_token:string_ ->
  entities:entity_list ->
  model_version:string_ ->
  unit ->
  detect_phi_response

val make_detect_phi_request : text:bounded_length_string -> unit -> detect_phi_request

val make_unmapped_attribute :
  ?type_:entity_type -> ?attribute:attribute -> unit -> unmapped_attribute

val make_detect_entities_v2_response :
  ?unmapped_attributes:unmapped_attribute_list ->
  ?pagination_token:string_ ->
  entities:entity_list ->
  model_version:string_ ->
  unit ->
  detect_entities_v2_response

val make_detect_entities_v2_request :
  text:bounded_length_string -> unit -> detect_entities_v2_request

val make_detect_entities_response :
  ?unmapped_attributes:unmapped_attribute_list ->
  ?pagination_token:string_ ->
  entities:entity_list ->
  model_version:string_ ->
  unit ->
  detect_entities_response

val make_detect_entities_request : text:bounded_length_string -> unit -> detect_entities_request

val make_describe_snomedct_inference_job_response :
  ?comprehend_medical_async_job_properties:comprehend_medical_async_job_properties ->
  unit ->
  describe_snomedct_inference_job_response

val make_describe_snomedct_inference_job_request :
  job_id:job_id -> unit -> describe_snomedct_inference_job_request

val make_describe_rx_norm_inference_job_response :
  ?comprehend_medical_async_job_properties:comprehend_medical_async_job_properties ->
  unit ->
  describe_rx_norm_inference_job_response

val make_describe_rx_norm_inference_job_request :
  job_id:job_id -> unit -> describe_rx_norm_inference_job_request

val make_describe_phi_detection_job_response :
  ?comprehend_medical_async_job_properties:comprehend_medical_async_job_properties ->
  unit ->
  describe_phi_detection_job_response

val make_describe_phi_detection_job_request :
  job_id:job_id -> unit -> describe_phi_detection_job_request

val make_describe_icd10cm_inference_job_response :
  ?comprehend_medical_async_job_properties:comprehend_medical_async_job_properties ->
  unit ->
  describe_icd10cm_inference_job_response

val make_describe_icd10cm_inference_job_request :
  job_id:job_id -> unit -> describe_icd10cm_inference_job_request

val make_describe_entities_detection_v2_job_response :
  ?comprehend_medical_async_job_properties:comprehend_medical_async_job_properties ->
  unit ->
  describe_entities_detection_v2_job_response

val make_describe_entities_detection_v2_job_request :
  job_id:job_id -> unit -> describe_entities_detection_v2_job_request
