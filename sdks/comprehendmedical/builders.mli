open Types

val make_trait : ?score:float_ -> ?name:attribute_name -> unit -> trait

val make_attribute :
  ?traits:trait_list ->
  ?category:entity_type ->
  ?text:string_ ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?id:integer ->
  ?relationship_type:relationship_type ->
  ?relationship_score:float_ ->
  ?score:float_ ->
  ?type_:entity_sub_type ->
  unit ->
  attribute

val make_unmapped_attribute :
  ?attribute:attribute -> ?type_:entity_type -> unit -> unmapped_attribute

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

val make_input_data_config : ?s3_key:s3_key -> s3_bucket:s3_bucket -> unit -> input_data_config
val make_output_data_config : ?s3_key:s3_key -> s3_bucket:s3_bucket -> unit -> output_data_config

val make_start_snomedct_inference_job_request :
  ?kms_key:kms_key ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_snomedct_inference_job_request

val make_start_rx_norm_inference_job_response :
  ?job_id:job_id -> unit -> start_rx_norm_inference_job_response

val make_start_rx_norm_inference_job_request :
  ?kms_key:kms_key ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_rx_norm_inference_job_request

val make_start_phi_detection_job_response :
  ?job_id:job_id -> unit -> start_phi_detection_job_response

val make_start_phi_detection_job_request :
  ?kms_key:kms_key ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_phi_detection_job_request

val make_start_icd10cm_inference_job_response :
  ?job_id:job_id -> unit -> start_icd10cm_inference_job_response

val make_start_icd10cm_inference_job_request :
  ?kms_key:kms_key ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_icd10cm_inference_job_request

val make_start_entities_detection_v2_job_response :
  ?job_id:job_id -> unit -> start_entities_detection_v2_job_response

val make_start_entities_detection_v2_job_request :
  ?kms_key:kms_key ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_entities_detection_v2_job_request

val make_snomedct_trait : ?score:float_ -> ?name:snomedct_trait_name -> unit -> snomedct_trait

val make_snomedct_concept :
  ?score:float_ -> ?code:string_ -> ?description:string_ -> unit -> snomedct_concept

val make_snomedct_attribute :
  ?snomedct_concepts:snomedct_concept_list ->
  ?traits:snomedct_trait_list ->
  ?text:string_ ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?id:integer ->
  ?relationship_type:snomedct_relationship_type ->
  ?relationship_score:float_ ->
  ?score:float_ ->
  ?type_:snomedct_attribute_type ->
  ?category:snomedct_entity_category ->
  unit ->
  snomedct_attribute

val make_snomedct_entity :
  ?snomedct_concepts:snomedct_concept_list ->
  ?traits:snomedct_trait_list ->
  ?attributes:snomedct_attribute_list ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?score:float_ ->
  ?type_:snomedct_entity_type ->
  ?category:snomedct_entity_category ->
  ?text:ontology_linking_bounded_length_string ->
  ?id:integer ->
  unit ->
  snomedct_entity

val make_snomedct_details :
  ?version_date:string_ -> ?language:string_ -> ?edition:string_ -> unit -> snomedct_details

val make_rx_norm_trait : ?score:float_ -> ?name:rx_norm_trait_name -> unit -> rx_norm_trait

val make_rx_norm_attribute :
  ?traits:rx_norm_trait_list ->
  ?text:string_ ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?id:integer ->
  ?relationship_score:float_ ->
  ?score:float_ ->
  ?type_:rx_norm_attribute_type ->
  unit ->
  rx_norm_attribute

val make_rx_norm_concept :
  ?score:float_ -> ?code:string_ -> ?description:string_ -> unit -> rx_norm_concept

val make_rx_norm_entity :
  ?rx_norm_concepts:rx_norm_concept_list ->
  ?traits:rx_norm_trait_list ->
  ?attributes:rx_norm_attribute_list ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?score:float_ ->
  ?type_:rx_norm_entity_type ->
  ?category:rx_norm_entity_category ->
  ?text:ontology_linking_bounded_length_string ->
  ?id:integer ->
  unit ->
  rx_norm_entity

val make_comprehend_medical_async_job_properties :
  ?model_version:model_version ->
  ?kms_key:kms_key ->
  ?manifest_file_path:manifest_file_path ->
  ?data_access_role_arn:iam_role_arn ->
  ?language_code:language_code ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?expiration_time:timestamp ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_id:job_id ->
  unit ->
  comprehend_medical_async_job_properties

val make_list_snomedct_inference_jobs_response :
  ?next_token:string_ ->
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  unit ->
  list_snomedct_inference_jobs_response

val make_comprehend_medical_async_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  comprehend_medical_async_job_filter

val make_list_snomedct_inference_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:comprehend_medical_async_job_filter ->
  unit ->
  list_snomedct_inference_jobs_request

val make_list_rx_norm_inference_jobs_response :
  ?next_token:string_ ->
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  unit ->
  list_rx_norm_inference_jobs_response

val make_list_rx_norm_inference_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:comprehend_medical_async_job_filter ->
  unit ->
  list_rx_norm_inference_jobs_request

val make_list_phi_detection_jobs_response :
  ?next_token:string_ ->
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  unit ->
  list_phi_detection_jobs_response

val make_list_phi_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:comprehend_medical_async_job_filter ->
  unit ->
  list_phi_detection_jobs_request

val make_list_icd10cm_inference_jobs_response :
  ?next_token:string_ ->
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  unit ->
  list_icd10cm_inference_jobs_response

val make_list_icd10cm_inference_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:comprehend_medical_async_job_filter ->
  unit ->
  list_icd10cm_inference_jobs_request

val make_list_entities_detection_v2_jobs_response :
  ?next_token:string_ ->
  ?comprehend_medical_async_job_properties_list:comprehend_medical_async_job_properties_list ->
  unit ->
  list_entities_detection_v2_jobs_response

val make_list_entities_detection_v2_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:comprehend_medical_async_job_filter ->
  unit ->
  list_entities_detection_v2_jobs_request

val make_characters : ?original_text_characters:integer -> unit -> characters

val make_infer_snomedct_response :
  ?characters:characters ->
  ?snomedct_details:snomedct_details ->
  ?model_version:string_ ->
  ?pagination_token:string_ ->
  entities:snomedct_entity_list ->
  unit ->
  infer_snomedct_response

val make_infer_snomedct_request :
  text:ontology_linking_bounded_length_string -> unit -> infer_snomedct_request

val make_infer_rx_norm_response :
  ?model_version:string_ ->
  ?pagination_token:string_ ->
  entities:rx_norm_entity_list ->
  unit ->
  infer_rx_norm_response

val make_infer_rx_norm_request :
  text:ontology_linking_bounded_length_string -> unit -> infer_rx_norm_request

val make_icd10cm_trait : ?score:float_ -> ?name:icd10cm_trait_name -> unit -> icd10cm_trait

val make_icd10cm_attribute :
  ?relationship_type:icd10cm_relationship_type ->
  ?category:icd10cm_entity_type ->
  ?traits:icd10cm_trait_list ->
  ?text:string_ ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?id:integer ->
  ?relationship_score:float_ ->
  ?score:float_ ->
  ?type_:icd10cm_attribute_type ->
  unit ->
  icd10cm_attribute

val make_icd10cm_concept :
  ?score:float_ -> ?code:string_ -> ?description:string_ -> unit -> icd10cm_concept

val make_icd10cm_entity :
  ?icd10cm_concepts:icd10cm_concept_list ->
  ?traits:icd10cm_trait_list ->
  ?attributes:icd10cm_attribute_list ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?score:float_ ->
  ?type_:icd10cm_entity_type ->
  ?category:icd10cm_entity_category ->
  ?text:ontology_linking_bounded_length_string ->
  ?id:integer ->
  unit ->
  icd10cm_entity

val make_infer_icd10cm_response :
  ?model_version:string_ ->
  ?pagination_token:string_ ->
  entities:icd10cm_entity_list ->
  unit ->
  infer_icd10cm_response

val make_infer_icd10cm_request :
  text:ontology_linking_bounded_length_string -> unit -> infer_icd10cm_request

val make_entity :
  ?attributes:attribute_list ->
  ?traits:trait_list ->
  ?type_:entity_sub_type ->
  ?category:entity_type ->
  ?text:string_ ->
  ?score:float_ ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?id:integer ->
  unit ->
  entity

val make_detect_phi_response :
  ?pagination_token:string_ ->
  model_version:string_ ->
  entities:entity_list ->
  unit ->
  detect_phi_response

val make_detect_phi_request : text:bounded_length_string -> unit -> detect_phi_request

val make_detect_entities_v2_response :
  ?pagination_token:string_ ->
  ?unmapped_attributes:unmapped_attribute_list ->
  model_version:string_ ->
  entities:entity_list ->
  unit ->
  detect_entities_v2_response

val make_detect_entities_v2_request :
  text:bounded_length_string -> unit -> detect_entities_v2_request

val make_detect_entities_response :
  ?pagination_token:string_ ->
  ?unmapped_attributes:unmapped_attribute_list ->
  model_version:string_ ->
  entities:entity_list ->
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
