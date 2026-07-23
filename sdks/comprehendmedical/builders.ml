open Types

let make_trait ?name:(name_ : attribute_name option) ?score:(score_ : float_ option) () =
  ({ name = name_; score = score_ } : trait)

let make_attribute ?type_:(type__ : entity_sub_type option) ?score:(score_ : float_ option)
    ?relationship_score:(relationship_score_ : float_ option)
    ?relationship_type:(relationship_type_ : relationship_type option) ?id:(id_ : integer option)
    ?begin_offset:(begin_offset_ : integer option) ?end_offset:(end_offset_ : integer option)
    ?text:(text_ : string_ option) ?category:(category_ : entity_type option)
    ?traits:(traits_ : trait_list option) () =
  ({
     type_ = type__;
     score = score_;
     relationship_score = relationship_score_;
     relationship_type = relationship_type_;
     id = id_;
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     text = text_;
     category = category_;
     traits = traits_;
   }
    : attribute)

let make_characters ?original_text_characters:(original_text_characters_ : integer option) () =
  ({ original_text_characters = original_text_characters_ } : characters)

let make_comprehend_medical_async_job_filter ?job_name:(job_name_ : job_name option)
    ?job_status:(job_status_ : job_status option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?submit_time_after:(submit_time_after_ : timestamp option) () =
  ({
     job_name = job_name_;
     job_status = job_status_;
     submit_time_before = submit_time_before_;
     submit_time_after = submit_time_after_;
   }
    : comprehend_medical_async_job_filter)

let make_output_data_config ?s3_key:(s3_key_ : s3_key option) ~s3_bucket:(s3_bucket_ : s3_bucket) ()
    =
  ({ s3_bucket = s3_bucket_; s3_key = s3_key_ } : output_data_config)

let make_input_data_config ?s3_key:(s3_key_ : s3_key option) ~s3_bucket:(s3_bucket_ : s3_bucket) ()
    =
  ({ s3_bucket = s3_bucket_; s3_key = s3_key_ } : input_data_config)

let make_comprehend_medical_async_job_properties ?job_id:(job_id_ : job_id option)
    ?job_name:(job_name_ : job_name option) ?job_status:(job_status_ : job_status option)
    ?message:(message_ : any_length_string option) ?submit_time:(submit_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?expiration_time:(expiration_time_ : timestamp option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?language_code:(language_code_ : language_code option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?manifest_file_path:(manifest_file_path_ : manifest_file_path option)
    ?kms_key:(kms_key_ : kms_key option) ?model_version:(model_version_ : model_version option) () =
  ({
     job_id = job_id_;
     job_name = job_name_;
     job_status = job_status_;
     message = message_;
     submit_time = submit_time_;
     end_time = end_time_;
     expiration_time = expiration_time_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     language_code = language_code_;
     data_access_role_arn = data_access_role_arn_;
     manifest_file_path = manifest_file_path_;
     kms_key = kms_key_;
     model_version = model_version_;
   }
    : comprehend_medical_async_job_properties)

let make_stop_snomedct_inference_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : stop_snomedct_inference_job_response)

let make_stop_snomedct_inference_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_snomedct_inference_job_request)

let make_stop_rx_norm_inference_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : stop_rx_norm_inference_job_response)

let make_stop_rx_norm_inference_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_rx_norm_inference_job_request)

let make_stop_phi_detection_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : stop_phi_detection_job_response)

let make_stop_phi_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_phi_detection_job_request)

let make_stop_icd10cm_inference_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : stop_icd10cm_inference_job_response)

let make_stop_icd10cm_inference_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_icd10cm_inference_job_request)

let make_stop_entities_detection_v2_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : stop_entities_detection_v2_job_response)

let make_stop_entities_detection_v2_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_entities_detection_v2_job_request)

let make_start_snomedct_inference_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_snomedct_inference_job_response)

let make_start_snomedct_inference_job_request ?job_name:(job_name_ : job_name option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?kms_key:(kms_key_ : kms_key option) ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~language_code:(language_code_ : language_code) () =
  ({
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     data_access_role_arn = data_access_role_arn_;
     job_name = job_name_;
     client_request_token = client_request_token_;
     kms_key = kms_key_;
     language_code = language_code_;
   }
    : start_snomedct_inference_job_request)

let make_start_rx_norm_inference_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_rx_norm_inference_job_response)

let make_start_rx_norm_inference_job_request ?job_name:(job_name_ : job_name option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?kms_key:(kms_key_ : kms_key option) ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~language_code:(language_code_ : language_code) () =
  ({
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     data_access_role_arn = data_access_role_arn_;
     job_name = job_name_;
     client_request_token = client_request_token_;
     kms_key = kms_key_;
     language_code = language_code_;
   }
    : start_rx_norm_inference_job_request)

let make_start_phi_detection_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_phi_detection_job_response)

let make_start_phi_detection_job_request ?job_name:(job_name_ : job_name option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?kms_key:(kms_key_ : kms_key option) ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~language_code:(language_code_ : language_code) () =
  ({
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     data_access_role_arn = data_access_role_arn_;
     job_name = job_name_;
     client_request_token = client_request_token_;
     kms_key = kms_key_;
     language_code = language_code_;
   }
    : start_phi_detection_job_request)

let make_start_icd10cm_inference_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_icd10cm_inference_job_response)

let make_start_icd10cm_inference_job_request ?job_name:(job_name_ : job_name option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?kms_key:(kms_key_ : kms_key option) ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~language_code:(language_code_ : language_code) () =
  ({
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     data_access_role_arn = data_access_role_arn_;
     job_name = job_name_;
     client_request_token = client_request_token_;
     kms_key = kms_key_;
     language_code = language_code_;
   }
    : start_icd10cm_inference_job_request)

let make_start_entities_detection_v2_job_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_entities_detection_v2_job_response)

let make_start_entities_detection_v2_job_request ?job_name:(job_name_ : job_name option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?kms_key:(kms_key_ : kms_key option) ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~language_code:(language_code_ : language_code) () =
  ({
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     data_access_role_arn = data_access_role_arn_;
     job_name = job_name_;
     client_request_token = client_request_token_;
     kms_key = kms_key_;
     language_code = language_code_;
   }
    : start_entities_detection_v2_job_request)

let make_list_snomedct_inference_jobs_response
    ?comprehend_medical_async_job_properties_list:
      (comprehend_medical_async_job_properties_list_ :
         comprehend_medical_async_job_properties_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     comprehend_medical_async_job_properties_list = comprehend_medical_async_job_properties_list_;
     next_token = next_token_;
   }
    : list_snomedct_inference_jobs_response)

let make_list_snomedct_inference_jobs_request
    ?filter:(filter_ : comprehend_medical_async_job_filter option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_snomedct_inference_jobs_request)

let make_list_rx_norm_inference_jobs_response
    ?comprehend_medical_async_job_properties_list:
      (comprehend_medical_async_job_properties_list_ :
         comprehend_medical_async_job_properties_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     comprehend_medical_async_job_properties_list = comprehend_medical_async_job_properties_list_;
     next_token = next_token_;
   }
    : list_rx_norm_inference_jobs_response)

let make_list_rx_norm_inference_jobs_request
    ?filter:(filter_ : comprehend_medical_async_job_filter option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_rx_norm_inference_jobs_request)

let make_list_phi_detection_jobs_response
    ?comprehend_medical_async_job_properties_list:
      (comprehend_medical_async_job_properties_list_ :
         comprehend_medical_async_job_properties_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     comprehend_medical_async_job_properties_list = comprehend_medical_async_job_properties_list_;
     next_token = next_token_;
   }
    : list_phi_detection_jobs_response)

let make_list_phi_detection_jobs_request
    ?filter:(filter_ : comprehend_medical_async_job_filter option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_phi_detection_jobs_request)

let make_list_icd10cm_inference_jobs_response
    ?comprehend_medical_async_job_properties_list:
      (comprehend_medical_async_job_properties_list_ :
         comprehend_medical_async_job_properties_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     comprehend_medical_async_job_properties_list = comprehend_medical_async_job_properties_list_;
     next_token = next_token_;
   }
    : list_icd10cm_inference_jobs_response)

let make_list_icd10cm_inference_jobs_request
    ?filter:(filter_ : comprehend_medical_async_job_filter option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_icd10cm_inference_jobs_request)

let make_list_entities_detection_v2_jobs_response
    ?comprehend_medical_async_job_properties_list:
      (comprehend_medical_async_job_properties_list_ :
         comprehend_medical_async_job_properties_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     comprehend_medical_async_job_properties_list = comprehend_medical_async_job_properties_list_;
     next_token = next_token_;
   }
    : list_entities_detection_v2_jobs_response)

let make_list_entities_detection_v2_jobs_request
    ?filter:(filter_ : comprehend_medical_async_job_filter option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_entities_detection_v2_jobs_request)

let make_snomedct_details ?edition:(edition_ : string_ option)
    ?language:(language_ : string_ option) ?version_date:(version_date_ : string_ option) () =
  ({ edition = edition_; language = language_; version_date = version_date_ } : snomedct_details)

let make_snomedct_concept ?description:(description_ : string_ option)
    ?code:(code_ : string_ option) ?score:(score_ : float_ option) () =
  ({ description = description_; code = code_; score = score_ } : snomedct_concept)

let make_snomedct_trait ?name:(name_ : snomedct_trait_name option) ?score:(score_ : float_ option)
    () =
  ({ name = name_; score = score_ } : snomedct_trait)

let make_snomedct_attribute ?category:(category_ : snomedct_entity_category option)
    ?type_:(type__ : snomedct_attribute_type option) ?score:(score_ : float_ option)
    ?relationship_score:(relationship_score_ : float_ option)
    ?relationship_type:(relationship_type_ : snomedct_relationship_type option)
    ?id:(id_ : integer option) ?begin_offset:(begin_offset_ : integer option)
    ?end_offset:(end_offset_ : integer option) ?text:(text_ : string_ option)
    ?traits:(traits_ : snomedct_trait_list option)
    ?snomedct_concepts:(snomedct_concepts_ : snomedct_concept_list option) () =
  ({
     category = category_;
     type_ = type__;
     score = score_;
     relationship_score = relationship_score_;
     relationship_type = relationship_type_;
     id = id_;
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     text = text_;
     traits = traits_;
     snomedct_concepts = snomedct_concepts_;
   }
    : snomedct_attribute)

let make_snomedct_entity ?id:(id_ : integer option)
    ?text:(text_ : ontology_linking_bounded_length_string option)
    ?category:(category_ : snomedct_entity_category option)
    ?type_:(type__ : snomedct_entity_type option) ?score:(score_ : float_ option)
    ?begin_offset:(begin_offset_ : integer option) ?end_offset:(end_offset_ : integer option)
    ?attributes:(attributes_ : snomedct_attribute_list option)
    ?traits:(traits_ : snomedct_trait_list option)
    ?snomedct_concepts:(snomedct_concepts_ : snomedct_concept_list option) () =
  ({
     id = id_;
     text = text_;
     category = category_;
     type_ = type__;
     score = score_;
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     attributes = attributes_;
     traits = traits_;
     snomedct_concepts = snomedct_concepts_;
   }
    : snomedct_entity)

let make_infer_snomedct_response ?pagination_token:(pagination_token_ : string_ option)
    ?model_version:(model_version_ : string_ option)
    ?snomedct_details:(snomedct_details_ : snomedct_details option)
    ?characters:(characters_ : characters option) ~entities:(entities_ : snomedct_entity_list) () =
  ({
     entities = entities_;
     pagination_token = pagination_token_;
     model_version = model_version_;
     snomedct_details = snomedct_details_;
     characters = characters_;
   }
    : infer_snomedct_response)

let make_infer_snomedct_request ~text:(text_ : ontology_linking_bounded_length_string) () =
  ({ text = text_ } : infer_snomedct_request)

let make_rx_norm_concept ?description:(description_ : string_ option) ?code:(code_ : string_ option)
    ?score:(score_ : float_ option) () =
  ({ description = description_; code = code_; score = score_ } : rx_norm_concept)

let make_rx_norm_trait ?name:(name_ : rx_norm_trait_name option) ?score:(score_ : float_ option) ()
    =
  ({ name = name_; score = score_ } : rx_norm_trait)

let make_rx_norm_attribute ?type_:(type__ : rx_norm_attribute_type option)
    ?score:(score_ : float_ option) ?relationship_score:(relationship_score_ : float_ option)
    ?id:(id_ : integer option) ?begin_offset:(begin_offset_ : integer option)
    ?end_offset:(end_offset_ : integer option) ?text:(text_ : string_ option)
    ?traits:(traits_ : rx_norm_trait_list option) () =
  ({
     type_ = type__;
     score = score_;
     relationship_score = relationship_score_;
     id = id_;
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     text = text_;
     traits = traits_;
   }
    : rx_norm_attribute)

let make_rx_norm_entity ?id:(id_ : integer option)
    ?text:(text_ : ontology_linking_bounded_length_string option)
    ?category:(category_ : rx_norm_entity_category option)
    ?type_:(type__ : rx_norm_entity_type option) ?score:(score_ : float_ option)
    ?begin_offset:(begin_offset_ : integer option) ?end_offset:(end_offset_ : integer option)
    ?attributes:(attributes_ : rx_norm_attribute_list option)
    ?traits:(traits_ : rx_norm_trait_list option)
    ?rx_norm_concepts:(rx_norm_concepts_ : rx_norm_concept_list option) () =
  ({
     id = id_;
     text = text_;
     category = category_;
     type_ = type__;
     score = score_;
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     attributes = attributes_;
     traits = traits_;
     rx_norm_concepts = rx_norm_concepts_;
   }
    : rx_norm_entity)

let make_infer_rx_norm_response ?pagination_token:(pagination_token_ : string_ option)
    ?model_version:(model_version_ : string_ option) ~entities:(entities_ : rx_norm_entity_list) ()
    =
  ({ entities = entities_; pagination_token = pagination_token_; model_version = model_version_ }
    : infer_rx_norm_response)

let make_infer_rx_norm_request ~text:(text_ : ontology_linking_bounded_length_string) () =
  ({ text = text_ } : infer_rx_norm_request)

let make_icd10cm_concept ?description:(description_ : string_ option) ?code:(code_ : string_ option)
    ?score:(score_ : float_ option) () =
  ({ description = description_; code = code_; score = score_ } : icd10cm_concept)

let make_icd10cm_trait ?name:(name_ : icd10cm_trait_name option) ?score:(score_ : float_ option) ()
    =
  ({ name = name_; score = score_ } : icd10cm_trait)

let make_icd10cm_attribute ?type_:(type__ : icd10cm_attribute_type option)
    ?score:(score_ : float_ option) ?relationship_score:(relationship_score_ : float_ option)
    ?id:(id_ : integer option) ?begin_offset:(begin_offset_ : integer option)
    ?end_offset:(end_offset_ : integer option) ?text:(text_ : string_ option)
    ?traits:(traits_ : icd10cm_trait_list option) ?category:(category_ : icd10cm_entity_type option)
    ?relationship_type:(relationship_type_ : icd10cm_relationship_type option) () =
  ({
     type_ = type__;
     score = score_;
     relationship_score = relationship_score_;
     id = id_;
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     text = text_;
     traits = traits_;
     category = category_;
     relationship_type = relationship_type_;
   }
    : icd10cm_attribute)

let make_icd10cm_entity ?id:(id_ : integer option)
    ?text:(text_ : ontology_linking_bounded_length_string option)
    ?category:(category_ : icd10cm_entity_category option)
    ?type_:(type__ : icd10cm_entity_type option) ?score:(score_ : float_ option)
    ?begin_offset:(begin_offset_ : integer option) ?end_offset:(end_offset_ : integer option)
    ?attributes:(attributes_ : icd10cm_attribute_list option)
    ?traits:(traits_ : icd10cm_trait_list option)
    ?icd10cm_concepts:(icd10cm_concepts_ : icd10cm_concept_list option) () =
  ({
     id = id_;
     text = text_;
     category = category_;
     type_ = type__;
     score = score_;
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     attributes = attributes_;
     traits = traits_;
     icd10cm_concepts = icd10cm_concepts_;
   }
    : icd10cm_entity)

let make_infer_icd10cm_response ?pagination_token:(pagination_token_ : string_ option)
    ?model_version:(model_version_ : string_ option) ~entities:(entities_ : icd10cm_entity_list) ()
    =
  ({ entities = entities_; pagination_token = pagination_token_; model_version = model_version_ }
    : infer_icd10cm_response)

let make_infer_icd10cm_request ~text:(text_ : ontology_linking_bounded_length_string) () =
  ({ text = text_ } : infer_icd10cm_request)

let make_entity ?id:(id_ : integer option) ?begin_offset:(begin_offset_ : integer option)
    ?end_offset:(end_offset_ : integer option) ?score:(score_ : float_ option)
    ?text:(text_ : string_ option) ?category:(category_ : entity_type option)
    ?type_:(type__ : entity_sub_type option) ?traits:(traits_ : trait_list option)
    ?attributes:(attributes_ : attribute_list option) () =
  ({
     id = id_;
     begin_offset = begin_offset_;
     end_offset = end_offset_;
     score = score_;
     text = text_;
     category = category_;
     type_ = type__;
     traits = traits_;
     attributes = attributes_;
   }
    : entity)

let make_detect_phi_response ?pagination_token:(pagination_token_ : string_ option)
    ~entities:(entities_ : entity_list) ~model_version:(model_version_ : string_) () =
  ({ entities = entities_; pagination_token = pagination_token_; model_version = model_version_ }
    : detect_phi_response)

let make_detect_phi_request ~text:(text_ : bounded_length_string) () =
  ({ text = text_ } : detect_phi_request)

let make_unmapped_attribute ?type_:(type__ : entity_type option)
    ?attribute:(attribute_ : attribute option) () =
  ({ type_ = type__; attribute = attribute_ } : unmapped_attribute)

let make_detect_entities_v2_response
    ?unmapped_attributes:(unmapped_attributes_ : unmapped_attribute_list option)
    ?pagination_token:(pagination_token_ : string_ option) ~entities:(entities_ : entity_list)
    ~model_version:(model_version_ : string_) () =
  ({
     entities = entities_;
     unmapped_attributes = unmapped_attributes_;
     pagination_token = pagination_token_;
     model_version = model_version_;
   }
    : detect_entities_v2_response)

let make_detect_entities_v2_request ~text:(text_ : bounded_length_string) () =
  ({ text = text_ } : detect_entities_v2_request)

let make_detect_entities_response
    ?unmapped_attributes:(unmapped_attributes_ : unmapped_attribute_list option)
    ?pagination_token:(pagination_token_ : string_ option) ~entities:(entities_ : entity_list)
    ~model_version:(model_version_ : string_) () =
  ({
     entities = entities_;
     unmapped_attributes = unmapped_attributes_;
     pagination_token = pagination_token_;
     model_version = model_version_;
   }
    : detect_entities_response)

let make_detect_entities_request ~text:(text_ : bounded_length_string) () =
  ({ text = text_ } : detect_entities_request)

let make_describe_snomedct_inference_job_response
    ?comprehend_medical_async_job_properties:
      (comprehend_medical_async_job_properties_ : comprehend_medical_async_job_properties option) ()
    =
  ({ comprehend_medical_async_job_properties = comprehend_medical_async_job_properties_ }
    : describe_snomedct_inference_job_response)

let make_describe_snomedct_inference_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_snomedct_inference_job_request)

let make_describe_rx_norm_inference_job_response
    ?comprehend_medical_async_job_properties:
      (comprehend_medical_async_job_properties_ : comprehend_medical_async_job_properties option) ()
    =
  ({ comprehend_medical_async_job_properties = comprehend_medical_async_job_properties_ }
    : describe_rx_norm_inference_job_response)

let make_describe_rx_norm_inference_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_rx_norm_inference_job_request)

let make_describe_phi_detection_job_response
    ?comprehend_medical_async_job_properties:
      (comprehend_medical_async_job_properties_ : comprehend_medical_async_job_properties option) ()
    =
  ({ comprehend_medical_async_job_properties = comprehend_medical_async_job_properties_ }
    : describe_phi_detection_job_response)

let make_describe_phi_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_phi_detection_job_request)

let make_describe_icd10cm_inference_job_response
    ?comprehend_medical_async_job_properties:
      (comprehend_medical_async_job_properties_ : comprehend_medical_async_job_properties option) ()
    =
  ({ comprehend_medical_async_job_properties = comprehend_medical_async_job_properties_ }
    : describe_icd10cm_inference_job_response)

let make_describe_icd10cm_inference_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_icd10cm_inference_job_request)

let make_describe_entities_detection_v2_job_response
    ?comprehend_medical_async_job_properties:
      (comprehend_medical_async_job_properties_ : comprehend_medical_async_job_properties option) ()
    =
  ({ comprehend_medical_async_job_properties = comprehend_medical_async_job_properties_ }
    : describe_entities_detection_v2_job_response)

let make_describe_entities_detection_v2_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_entities_detection_v2_job_request)
