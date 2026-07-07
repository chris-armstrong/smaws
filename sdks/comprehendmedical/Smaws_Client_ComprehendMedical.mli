(** ComprehendMedical client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module DescribeEntitiesDetectionV2Job : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entities_detection_v2_job_request ->
    ( describe_entities_detection_v2_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entities_detection_v2_job_request ->
    ( describe_entities_detection_v2_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a medical entities detection job. Use this operation to get \
   the status of a detection job.\n"]

module DescribeICD10CMInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_icd10cm_inference_job_request ->
    ( describe_icd10cm_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_icd10cm_inference_job_request ->
    ( describe_icd10cm_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with an InferICD10CM job. Use this operation to get the status \
   of an inference job.\n"]

module DescribePHIDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_phi_detection_job_request ->
    ( describe_phi_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_phi_detection_job_request ->
    ( describe_phi_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a protected health information (PHI) detection job. Use \
   this operation to get the status of a detection job.\n"]

module DescribeRxNormInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rx_norm_inference_job_request ->
    ( describe_rx_norm_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rx_norm_inference_job_request ->
    ( describe_rx_norm_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with an InferRxNorm job. Use this operation to get the status of \
   an inference job.\n"]

module DescribeSNOMEDCTInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snomedct_inference_job_request ->
    ( describe_snomedct_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snomedct_inference_job_request ->
    ( describe_snomedct_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Gets the properties associated with an InferSNOMEDCT job. Use this operation to get the status \
   of an inference job. \n"]

module DetectEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidEncodingException of invalid_encoding_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_entities_request ->
    ( detect_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_entities_request ->
    ( detect_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [DetectEntities] operation is deprecated. You should use the [DetectEntitiesV2] operation \
   instead.\n\n\
  \ Inspects the clinical text for a variety of medical entities and returns specific information \
   about them such as entity category, location, and confidence score on that information.\n\
  \ "]

module DetectEntitiesV2 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidEncodingException of invalid_encoding_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_entities_v2_request ->
    ( detect_entities_v2_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_entities_v2_request ->
    ( detect_entities_v2_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects the clinical text for a variety of medical entities and returns specific information \
   about them such as entity category, location, and confidence score on that information. Amazon \
   Comprehend Medical only detects medical entities in English language texts.\n\n\
  \ The [DetectEntitiesV2] operation replaces the [DetectEntities] operation. This new action uses \
   a different model for determining the entities in your medical text and changes the way that \
   some entities are returned in the output. You should use the [DetectEntitiesV2] operation in \
   all new applications.\n\
  \ \n\
  \  The [DetectEntitiesV2] operation returns the [Acuity] and [Direction] entities as attributes \
   instead of types. \n\
  \  "]

module DetectPHI : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidEncodingException of invalid_encoding_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_phi_request ->
    ( detect_phi_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_phi_request ->
    ( detect_phi_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects the clinical text for protected health information (PHI) entities and returns the \
   entity category, location, and confidence score for each entity. Amazon Comprehend Medical only \
   detects entities in English language texts.\n"]

module InferICD10CM : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidEncodingException of invalid_encoding_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    infer_icd10cm_request ->
    ( infer_icd10cm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    infer_icd10cm_request ->
    ( infer_icd10cm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "InferICD10CM detects medical conditions as entities listed in a patient record and links those \
   entities to normalized concept identifiers in the ICD-10-CM knowledge base from the Centers for \
   Disease Control. Amazon Comprehend Medical only detects medical entities in English language \
   texts. \n"]

module InferRxNorm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidEncodingException of invalid_encoding_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    infer_rx_norm_request ->
    ( infer_rx_norm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    infer_rx_norm_request ->
    ( infer_rx_norm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "InferRxNorm detects medications as entities listed in a patient record and links to the \
   normalized concept identifiers in the RxNorm database from the National Library of Medicine. \
   Amazon Comprehend Medical only detects medical entities in English language texts. \n"]

module InferSNOMEDCT : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidEncodingException of invalid_encoding_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    infer_snomedct_request ->
    ( infer_snomedct_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    infer_snomedct_request ->
    ( infer_snomedct_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidEncodingException of invalid_encoding_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " InferSNOMEDCT detects possible medical concepts as entities and links them to codes from the \
   Systematized Nomenclature of Medicine, Clinical Terms (SNOMED-CT) ontology\n"]

module ListEntitiesDetectionV2Jobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entities_detection_v2_jobs_request ->
    ( list_entities_detection_v2_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entities_detection_v2_jobs_request ->
    ( list_entities_detection_v2_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of medical entity detection jobs that you have submitted.\n"]

module ListICD10CMInferenceJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_icd10cm_inference_jobs_request ->
    ( list_icd10cm_inference_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_icd10cm_inference_jobs_request ->
    ( list_icd10cm_inference_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of InferICD10CM jobs that you have submitted.\n"]

module ListPHIDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_phi_detection_jobs_request ->
    ( list_phi_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_phi_detection_jobs_request ->
    ( list_phi_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of protected health information (PHI) detection jobs you have submitted.\n"]

module ListRxNormInferenceJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rx_norm_inference_jobs_request ->
    ( list_rx_norm_inference_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rx_norm_inference_jobs_request ->
    ( list_rx_norm_inference_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of InferRxNorm jobs that you have submitted.\n"]

module ListSNOMEDCTInferenceJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_snomedct_inference_jobs_request ->
    ( list_snomedct_inference_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_snomedct_inference_jobs_request ->
    ( list_snomedct_inference_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Gets a list of InferSNOMEDCT jobs a user has submitted. \n"]

module StartEntitiesDetectionV2Job : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_entities_detection_v2_job_request ->
    ( start_entities_detection_v2_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_entities_detection_v2_job_request ->
    ( start_entities_detection_v2_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous medical entity detection job for a collection of documents. Use the \
   [DescribeEntitiesDetectionV2Job] operation to track the status of a job.\n"]

module StartICD10CMInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_icd10cm_inference_job_request ->
    ( start_icd10cm_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_icd10cm_inference_job_request ->
    ( start_icd10cm_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous job to detect medical conditions and link them to the ICD-10-CM \
   ontology. Use the [DescribeICD10CMInferenceJob] operation to track the status of a job.\n"]

module StartPHIDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_phi_detection_job_request ->
    ( start_phi_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_phi_detection_job_request ->
    ( start_phi_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous job to detect protected health information (PHI). Use the \
   [DescribePHIDetectionJob] operation to track the status of a job.\n"]

module StartRxNormInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_rx_norm_inference_job_request ->
    ( start_rx_norm_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_rx_norm_inference_job_request ->
    ( start_rx_norm_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous job to detect medication entities and link them to the RxNorm ontology. \
   Use the [DescribeRxNormInferenceJob] operation to track the status of a job.\n"]

module StartSNOMEDCTInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_snomedct_inference_job_request ->
    ( start_snomedct_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_snomedct_inference_job_request ->
    ( start_snomedct_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Starts an asynchronous job to detect medical concepts and link them to the SNOMED-CT ontology. \
   Use the DescribeSNOMEDCTInferenceJob operation to track the status of a job. \n"]

module StopEntitiesDetectionV2Job : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_entities_detection_v2_job_request ->
    ( stop_entities_detection_v2_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_entities_detection_v2_job_request ->
    ( stop_entities_detection_v2_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a medical entities detection job in progress.\n"]

module StopICD10CMInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_icd10cm_inference_job_request ->
    ( stop_icd10cm_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_icd10cm_inference_job_request ->
    ( stop_icd10cm_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops an InferICD10CM inference job in progress.\n"]

module StopPHIDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_phi_detection_job_request ->
    ( stop_phi_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_phi_detection_job_request ->
    ( stop_phi_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a protected health information (PHI) detection job in progress.\n"]

module StopRxNormInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_rx_norm_inference_job_request ->
    ( stop_rx_norm_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_rx_norm_inference_job_request ->
    ( stop_rx_norm_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops an InferRxNorm inference job in progress.\n"]

(** {1:Serialization and Deserialization} *)
module StopSNOMEDCTInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_snomedct_inference_job_request ->
    ( stop_snomedct_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_snomedct_inference_job_request ->
    ( stop_snomedct_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Stops an InferSNOMEDCT inference job in progress. \n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
