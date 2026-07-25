open Types

val make_augmented_manifests_list_item :
  ?split:split ->
  ?annotation_data_s3_uri:s3_uri ->
  ?source_documents_s3_uri:s3_uri ->
  ?document_type:augmented_manifests_document_type_format ->
  s3_uri:s3_uri ->
  attribute_names:attribute_names_list ->
  unit ->
  augmented_manifests_list_item

val make_invalid_request_detail :
  ?reason:invalid_request_detail_reason -> unit -> invalid_request_detail

val make_batch_item_error :
  ?index:integer -> ?error_code:string_ -> ?error_message:string_ -> unit -> batch_item_error

val make_dominant_language : ?language_code:string_ -> ?score:float_ -> unit -> dominant_language

val make_batch_detect_dominant_language_response :
  result_list:list_of_detect_dominant_language_result ->
  error_list:batch_item_error_list ->
  unit ->
  batch_detect_dominant_language_response

val make_batch_detect_dominant_language_request :
  text_list:customer_input_string_list -> unit -> batch_detect_dominant_language_request

val make_child_block :
  ?child_block_id:string_ -> ?begin_offset:integer -> ?end_offset:integer -> unit -> child_block

val make_block_reference :
  ?block_id:string_ ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?child_blocks:list_of_child_blocks ->
  unit ->
  block_reference

val make_entity :
  ?score:float_ ->
  ?type_:entity_type ->
  ?text:string_ ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?block_references:list_of_block_references ->
  unit ->
  entity

val make_batch_detect_entities_response :
  result_list:list_of_detect_entities_result ->
  error_list:batch_item_error_list ->
  unit ->
  batch_detect_entities_response

val make_batch_detect_entities_request :
  text_list:customer_input_string_list ->
  language_code:language_code ->
  unit ->
  batch_detect_entities_request

val make_key_phrase :
  ?score:float_ ->
  ?text:string_ ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  unit ->
  key_phrase

val make_batch_detect_key_phrases_response :
  result_list:list_of_detect_key_phrases_result ->
  error_list:batch_item_error_list ->
  unit ->
  batch_detect_key_phrases_response

val make_batch_detect_key_phrases_request :
  text_list:customer_input_string_list ->
  language_code:language_code ->
  unit ->
  batch_detect_key_phrases_request

val make_sentiment_score :
  ?positive:float_ ->
  ?negative:float_ ->
  ?neutral:float_ ->
  ?mixed:float_ ->
  unit ->
  sentiment_score

val make_batch_detect_sentiment_response :
  result_list:list_of_detect_sentiment_result ->
  error_list:batch_item_error_list ->
  unit ->
  batch_detect_sentiment_response

val make_batch_detect_sentiment_request :
  text_list:customer_input_string_list ->
  language_code:language_code ->
  unit ->
  batch_detect_sentiment_request

val make_part_of_speech_tag :
  ?tag:part_of_speech_tag_type -> ?score:float_ -> unit -> part_of_speech_tag

val make_syntax_token :
  ?token_id:integer ->
  ?text:string_ ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?part_of_speech:part_of_speech_tag ->
  unit ->
  syntax_token

val make_batch_detect_syntax_response :
  result_list:list_of_detect_syntax_result ->
  error_list:batch_item_error_list ->
  unit ->
  batch_detect_syntax_response

val make_batch_detect_syntax_request :
  text_list:customer_input_string_list ->
  language_code:syntax_language_code ->
  unit ->
  batch_detect_syntax_request

val make_mention_sentiment :
  ?sentiment:sentiment_type -> ?sentiment_score:sentiment_score -> unit -> mention_sentiment

val make_targeted_sentiment_mention :
  ?score:float_ ->
  ?group_score:float_ ->
  ?text:string_ ->
  ?type_:targeted_sentiment_entity_type ->
  ?mention_sentiment:mention_sentiment ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  unit ->
  targeted_sentiment_mention

val make_targeted_sentiment_entity :
  ?descriptive_mention_index:list_of_descriptive_mention_indices ->
  ?mentions:list_of_mentions ->
  unit ->
  targeted_sentiment_entity

val make_batch_detect_targeted_sentiment_response :
  result_list:list_of_detect_targeted_sentiment_result ->
  error_list:batch_item_error_list ->
  unit ->
  batch_detect_targeted_sentiment_response

val make_batch_detect_targeted_sentiment_request :
  text_list:customer_input_string_list ->
  language_code:language_code ->
  unit ->
  batch_detect_targeted_sentiment_request

val make_relationships_list_item :
  ?ids:string_list -> ?type_:relationship_type -> unit -> relationships_list_item

val make_point : ?x:float_ -> ?y:float_ -> unit -> point

val make_bounding_box :
  ?height:float_ -> ?left:float_ -> ?top:float_ -> ?width:float_ -> unit -> bounding_box

val make_geometry : ?bounding_box:bounding_box -> ?polygon:polygon -> unit -> geometry

val make_block :
  ?id:string_ ->
  ?block_type:block_type ->
  ?text:string_ ->
  ?page:integer ->
  ?geometry:geometry ->
  ?relationships:list_of_relationships ->
  unit ->
  block

val make_classifier_evaluation_metrics :
  ?accuracy:double ->
  ?precision:double ->
  ?recall:double ->
  ?f1_score:double ->
  ?micro_precision:double ->
  ?micro_recall:double ->
  ?micro_f1_score:double ->
  ?hamming_loss:double ->
  unit ->
  classifier_evaluation_metrics

val make_classifier_metadata :
  ?number_of_labels:integer ->
  ?number_of_trained_documents:integer ->
  ?number_of_test_documents:integer ->
  ?evaluation_metrics:classifier_evaluation_metrics ->
  unit ->
  classifier_metadata

val make_warnings_list_item :
  ?page:integer ->
  ?warn_code:page_based_warning_code ->
  ?warn_message:string_ ->
  unit ->
  warnings_list_item

val make_errors_list_item :
  ?page:integer ->
  ?error_code:page_based_error_code ->
  ?error_message:string_ ->
  unit ->
  errors_list_item

val make_document_type_list_item :
  ?page:integer -> ?type_:document_type -> unit -> document_type_list_item

val make_extracted_characters_list_item :
  ?page:integer -> ?count:integer -> unit -> extracted_characters_list_item

val make_document_metadata :
  ?pages:integer -> ?extracted_characters:list_of_extracted_characters -> unit -> document_metadata

val make_document_label : ?name:string_ -> ?score:float_ -> ?page:integer -> unit -> document_label
val make_document_class : ?name:string_ -> ?score:float_ -> ?page:integer -> unit -> document_class

val make_classify_document_response :
  ?classes:list_of_classes ->
  ?labels:list_of_labels ->
  ?document_metadata:document_metadata ->
  ?document_type:list_of_document_type ->
  ?errors:list_of_errors ->
  ?warnings:list_of_warnings ->
  unit ->
  classify_document_response

val make_document_reader_config :
  ?document_read_mode:document_read_mode ->
  ?feature_types:list_of_document_read_feature_types ->
  document_read_action:document_read_action ->
  unit ->
  document_reader_config

val make_classify_document_request :
  ?text:customer_input_string ->
  ?bytes:semi_structured_document_blob ->
  ?document_reader_config:document_reader_config ->
  endpoint_arn:document_classifier_endpoint_arn ->
  unit ->
  classify_document_request

val make_vpc_config : security_group_ids:security_group_ids -> subnets:subnets -> unit -> vpc_config

val make_data_security_config :
  ?model_kms_key_id:kms_key_id ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_lake_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  unit ->
  data_security_config

val make_entity_types_list_item : type_:entity_type_name -> unit -> entity_types_list_item

val make_entity_recognition_config :
  entity_types:entity_types_list -> unit -> entity_recognition_config

val make_document_classification_config :
  ?labels:labels_list -> mode:document_classifier_mode -> unit -> document_classification_config

val make_task_config :
  ?document_classification_config:document_classification_config ->
  ?entity_recognition_config:entity_recognition_config ->
  language_code:language_code ->
  unit ->
  task_config

val make_flywheel_properties :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?active_model_arn:comprehend_model_arn ->
  ?data_access_role_arn:iam_role_arn ->
  ?task_config:task_config ->
  ?data_lake_s3_uri:s3_uri ->
  ?data_security_config:data_security_config ->
  ?status:flywheel_status ->
  ?model_type:model_type ->
  ?message:any_length_string ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?latest_flywheel_iteration:flywheel_iteration_id ->
  unit ->
  flywheel_properties

val make_update_flywheel_response :
  ?flywheel_properties:flywheel_properties -> unit -> update_flywheel_response

val make_update_data_security_config :
  ?model_kms_key_id:kms_key_id ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  unit ->
  update_data_security_config

val make_update_flywheel_request :
  ?active_model_arn:comprehend_model_arn ->
  ?data_access_role_arn:iam_role_arn ->
  ?data_security_config:update_data_security_config ->
  flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  update_flywheel_request

val make_update_endpoint_response :
  ?desired_model_arn:comprehend_model_arn -> unit -> update_endpoint_response

val make_update_endpoint_request :
  ?desired_model_arn:comprehend_model_arn ->
  ?desired_inference_units:inference_units_integer ->
  ?desired_data_access_role_arn:iam_role_arn ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  endpoint_arn:comprehend_endpoint_arn ->
  unit ->
  update_endpoint_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:comprehend_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  resource_arn:comprehend_arn -> tags:tag_list -> unit -> tag_resource_request

val make_stop_training_entity_recognizer_response : unit -> unit

val make_stop_training_entity_recognizer_request :
  entity_recognizer_arn:entity_recognizer_arn -> unit -> stop_training_entity_recognizer_request

val make_stop_training_document_classifier_response : unit -> unit

val make_stop_training_document_classifier_request :
  document_classifier_arn:document_classifier_arn ->
  unit ->
  stop_training_document_classifier_request

val make_stop_targeted_sentiment_detection_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> stop_targeted_sentiment_detection_job_response

val make_stop_targeted_sentiment_detection_job_request :
  job_id:job_id -> unit -> stop_targeted_sentiment_detection_job_request

val make_stop_sentiment_detection_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> stop_sentiment_detection_job_response

val make_stop_sentiment_detection_job_request :
  job_id:job_id -> unit -> stop_sentiment_detection_job_request

val make_stop_pii_entities_detection_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> stop_pii_entities_detection_job_response

val make_stop_pii_entities_detection_job_request :
  job_id:job_id -> unit -> stop_pii_entities_detection_job_request

val make_stop_key_phrases_detection_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> stop_key_phrases_detection_job_response

val make_stop_key_phrases_detection_job_request :
  job_id:job_id -> unit -> stop_key_phrases_detection_job_request

val make_stop_events_detection_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> stop_events_detection_job_response

val make_stop_events_detection_job_request :
  job_id:job_id -> unit -> stop_events_detection_job_request

val make_stop_entities_detection_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> stop_entities_detection_job_response

val make_stop_entities_detection_job_request :
  job_id:job_id -> unit -> stop_entities_detection_job_request

val make_stop_dominant_language_detection_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> stop_dominant_language_detection_job_response

val make_stop_dominant_language_detection_job_request :
  job_id:job_id -> unit -> stop_dominant_language_detection_job_request

val make_start_topics_detection_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  unit ->
  start_topics_detection_job_response

val make_output_data_config : ?kms_key_id:kms_key_id -> s3_uri:s3_uri -> unit -> output_data_config

val make_input_data_config :
  ?input_format:input_format ->
  ?document_reader_config:document_reader_config ->
  s3_uri:s3_uri ->
  unit ->
  input_data_config

val make_start_topics_detection_job_request :
  ?job_name:job_name ->
  ?number_of_topics:number_of_topics_integer ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  unit ->
  start_topics_detection_job_request

val make_start_targeted_sentiment_detection_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  unit ->
  start_targeted_sentiment_detection_job_response

val make_start_targeted_sentiment_detection_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_targeted_sentiment_detection_job_request

val make_start_sentiment_detection_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  unit ->
  start_sentiment_detection_job_response

val make_start_sentiment_detection_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_sentiment_detection_job_request

val make_start_pii_entities_detection_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  unit ->
  start_pii_entities_detection_job_response

val make_redaction_config :
  ?pii_entity_types:list_of_pii_entity_types ->
  ?mask_mode:pii_entities_detection_mask_mode ->
  ?mask_character:mask_character ->
  unit ->
  redaction_config

val make_start_pii_entities_detection_job_request :
  ?redaction_config:redaction_config ->
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?tags:tag_list ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  mode:pii_entities_detection_mode ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_pii_entities_detection_job_request

val make_start_key_phrases_detection_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  unit ->
  start_key_phrases_detection_job_response

val make_start_key_phrases_detection_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_key_phrases_detection_job_request

val make_start_flywheel_iteration_response :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?flywheel_iteration_id:flywheel_iteration_id ->
  unit ->
  start_flywheel_iteration_response

val make_start_flywheel_iteration_request :
  ?client_request_token:client_request_token_string ->
  flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  start_flywheel_iteration_request

val make_start_events_detection_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  unit ->
  start_events_detection_job_response

val make_start_events_detection_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?tags:tag_list ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  target_event_types:target_event_types ->
  unit ->
  start_events_detection_job_request

val make_start_entities_detection_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  ?entity_recognizer_arn:entity_recognizer_arn ->
  unit ->
  start_entities_detection_job_response

val make_start_entities_detection_job_request :
  ?job_name:job_name ->
  ?entity_recognizer_arn:entity_recognizer_arn ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  language_code:language_code ->
  unit ->
  start_entities_detection_job_request

val make_start_dominant_language_detection_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  unit ->
  start_dominant_language_detection_job_response

val make_start_dominant_language_detection_job_request :
  ?job_name:job_name ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  unit ->
  start_dominant_language_detection_job_request

val make_start_document_classification_job_response :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_status:job_status ->
  ?document_classifier_arn:document_classifier_arn ->
  unit ->
  start_document_classification_job_response

val make_start_document_classification_job_request :
  ?job_name:job_name ->
  ?document_classifier_arn:document_classifier_arn ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  unit ->
  start_document_classification_job_request

val make_put_resource_policy_response :
  ?policy_revision_id:policy_revision_id -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?policy_revision_id:policy_revision_id ->
  resource_arn:comprehend_model_arn ->
  resource_policy:policy ->
  unit ->
  put_resource_policy_request

val make_topics_detection_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?number_of_topics:integer ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  unit ->
  topics_detection_job_properties

val make_list_topics_detection_jobs_response :
  ?topics_detection_job_properties_list:topics_detection_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_topics_detection_jobs_response

val make_topics_detection_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  topics_detection_job_filter

val make_list_topics_detection_jobs_request :
  ?filter:topics_detection_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_topics_detection_jobs_request

val make_targeted_sentiment_detection_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?language_code:language_code ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  unit ->
  targeted_sentiment_detection_job_properties

val make_list_targeted_sentiment_detection_jobs_response :
  ?targeted_sentiment_detection_job_properties_list:targeted_sentiment_detection_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_targeted_sentiment_detection_jobs_response

val make_targeted_sentiment_detection_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  targeted_sentiment_detection_job_filter

val make_list_targeted_sentiment_detection_jobs_request :
  ?filter:targeted_sentiment_detection_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_targeted_sentiment_detection_jobs_request

val make_list_tags_for_resource_response :
  ?resource_arn:comprehend_arn -> ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:comprehend_arn -> unit -> list_tags_for_resource_request

val make_sentiment_detection_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?language_code:language_code ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  unit ->
  sentiment_detection_job_properties

val make_list_sentiment_detection_jobs_response :
  ?sentiment_detection_job_properties_list:sentiment_detection_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_sentiment_detection_jobs_response

val make_sentiment_detection_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  sentiment_detection_job_filter

val make_list_sentiment_detection_jobs_request :
  ?filter:sentiment_detection_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_sentiment_detection_jobs_request

val make_pii_output_data_config :
  ?kms_key_id:kms_key_id -> s3_uri:s3_uri -> unit -> pii_output_data_config

val make_pii_entities_detection_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:pii_output_data_config ->
  ?redaction_config:redaction_config ->
  ?language_code:language_code ->
  ?data_access_role_arn:iam_role_arn ->
  ?mode:pii_entities_detection_mode ->
  unit ->
  pii_entities_detection_job_properties

val make_list_pii_entities_detection_jobs_response :
  ?pii_entities_detection_job_properties_list:pii_entities_detection_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_pii_entities_detection_jobs_response

val make_pii_entities_detection_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  pii_entities_detection_job_filter

val make_list_pii_entities_detection_jobs_request :
  ?filter:pii_entities_detection_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_pii_entities_detection_jobs_request

val make_key_phrases_detection_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?language_code:language_code ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  unit ->
  key_phrases_detection_job_properties

val make_list_key_phrases_detection_jobs_response :
  ?key_phrases_detection_job_properties_list:key_phrases_detection_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_key_phrases_detection_jobs_response

val make_key_phrases_detection_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  key_phrases_detection_job_filter

val make_list_key_phrases_detection_jobs_request :
  ?filter:key_phrases_detection_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_key_phrases_detection_jobs_request

val make_flywheel_summary :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?active_model_arn:comprehend_model_arn ->
  ?data_lake_s3_uri:s3_uri ->
  ?status:flywheel_status ->
  ?model_type:model_type ->
  ?message:any_length_string ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?latest_flywheel_iteration:flywheel_iteration_id ->
  unit ->
  flywheel_summary

val make_list_flywheels_response :
  ?flywheel_summary_list:flywheel_summary_list ->
  ?next_token:string_ ->
  unit ->
  list_flywheels_response

val make_flywheel_filter :
  ?status:flywheel_status ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  unit ->
  flywheel_filter

val make_list_flywheels_request :
  ?filter:flywheel_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_flywheels_request

val make_flywheel_model_evaluation_metrics :
  ?average_f1_score:double ->
  ?average_precision:double ->
  ?average_recall:double ->
  ?average_accuracy:double ->
  unit ->
  flywheel_model_evaluation_metrics

val make_flywheel_iteration_properties :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?flywheel_iteration_id:flywheel_iteration_id ->
  ?creation_time:timestamp ->
  ?end_time:timestamp ->
  ?status:flywheel_iteration_status ->
  ?message:any_length_string ->
  ?evaluated_model_arn:comprehend_model_arn ->
  ?evaluated_model_metrics:flywheel_model_evaluation_metrics ->
  ?trained_model_arn:comprehend_model_arn ->
  ?trained_model_metrics:flywheel_model_evaluation_metrics ->
  ?evaluation_manifest_s3_prefix:s3_uri ->
  unit ->
  flywheel_iteration_properties

val make_list_flywheel_iteration_history_response :
  ?flywheel_iteration_properties_list:flywheel_iteration_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_flywheel_iteration_history_response

val make_flywheel_iteration_filter :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  unit ->
  flywheel_iteration_filter

val make_list_flywheel_iteration_history_request :
  ?filter:flywheel_iteration_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  list_flywheel_iteration_history_request

val make_events_detection_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?language_code:language_code ->
  ?data_access_role_arn:iam_role_arn ->
  ?target_event_types:target_event_types ->
  unit ->
  events_detection_job_properties

val make_list_events_detection_jobs_response :
  ?events_detection_job_properties_list:events_detection_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_events_detection_jobs_response

val make_events_detection_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  events_detection_job_filter

val make_list_events_detection_jobs_request :
  ?filter:events_detection_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_events_detection_jobs_request

val make_entity_recognizer_summary :
  ?recognizer_name:comprehend_arn_name ->
  ?number_of_versions:integer ->
  ?latest_version_created_at:timestamp ->
  ?latest_version_name:version_name ->
  ?latest_version_status:model_status ->
  unit ->
  entity_recognizer_summary

val make_list_entity_recognizer_summaries_response :
  ?entity_recognizer_summaries_list:entity_recognizer_summaries_list ->
  ?next_token:string_ ->
  unit ->
  list_entity_recognizer_summaries_response

val make_list_entity_recognizer_summaries_request :
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_entity_recognizer_summaries_request

val make_entity_recognizer_output_data_config :
  ?flywheel_stats_s3_prefix:s3_uri -> unit -> entity_recognizer_output_data_config

val make_entity_types_evaluation_metrics :
  ?precision:double -> ?recall:double -> ?f1_score:double -> unit -> entity_types_evaluation_metrics

val make_entity_recognizer_metadata_entity_types_list_item :
  ?type_:any_length_string ->
  ?evaluation_metrics:entity_types_evaluation_metrics ->
  ?number_of_train_mentions:integer ->
  unit ->
  entity_recognizer_metadata_entity_types_list_item

val make_entity_recognizer_evaluation_metrics :
  ?precision:double ->
  ?recall:double ->
  ?f1_score:double ->
  unit ->
  entity_recognizer_evaluation_metrics

val make_entity_recognizer_metadata :
  ?number_of_trained_documents:integer ->
  ?number_of_test_documents:integer ->
  ?evaluation_metrics:entity_recognizer_evaluation_metrics ->
  ?entity_types:entity_recognizer_metadata_entity_types_list ->
  unit ->
  entity_recognizer_metadata

val make_entity_recognizer_entity_list : s3_uri:s3_uri -> unit -> entity_recognizer_entity_list

val make_entity_recognizer_annotations :
  ?test_s3_uri:s3_uri -> s3_uri:s3_uri -> unit -> entity_recognizer_annotations

val make_entity_recognizer_documents :
  ?test_s3_uri:s3_uri ->
  ?input_format:input_format ->
  s3_uri:s3_uri ->
  unit ->
  entity_recognizer_documents

val make_entity_recognizer_input_data_config :
  ?data_format:entity_recognizer_data_format ->
  ?documents:entity_recognizer_documents ->
  ?annotations:entity_recognizer_annotations ->
  ?entity_list:entity_recognizer_entity_list ->
  ?augmented_manifests:entity_recognizer_augmented_manifests_list ->
  entity_types:entity_types_list ->
  unit ->
  entity_recognizer_input_data_config

val make_entity_recognizer_properties :
  ?entity_recognizer_arn:entity_recognizer_arn ->
  ?language_code:language_code ->
  ?status:model_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?training_start_time:timestamp ->
  ?training_end_time:timestamp ->
  ?input_data_config:entity_recognizer_input_data_config ->
  ?recognizer_metadata:entity_recognizer_metadata ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?model_kms_key_id:kms_key_id ->
  ?version_name:version_name ->
  ?source_model_arn:entity_recognizer_arn ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?output_data_config:entity_recognizer_output_data_config ->
  unit ->
  entity_recognizer_properties

val make_list_entity_recognizers_response :
  ?entity_recognizer_properties_list:entity_recognizer_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_entity_recognizers_response

val make_entity_recognizer_filter :
  ?status:model_status ->
  ?recognizer_name:comprehend_arn_name ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  entity_recognizer_filter

val make_list_entity_recognizers_request :
  ?filter:entity_recognizer_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_entity_recognizers_request

val make_entities_detection_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?entity_recognizer_arn:entity_recognizer_arn ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?language_code:language_code ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  entities_detection_job_properties

val make_list_entities_detection_jobs_response :
  ?entities_detection_job_properties_list:entities_detection_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_entities_detection_jobs_response

val make_entities_detection_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  entities_detection_job_filter

val make_list_entities_detection_jobs_request :
  ?filter:entities_detection_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_entities_detection_jobs_request

val make_endpoint_properties :
  ?endpoint_arn:comprehend_endpoint_arn ->
  ?status:endpoint_status ->
  ?message:any_length_string ->
  ?model_arn:comprehend_model_arn ->
  ?desired_model_arn:comprehend_model_arn ->
  ?desired_inference_units:inference_units_integer ->
  ?current_inference_units:inference_units_integer ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?data_access_role_arn:iam_role_arn ->
  ?desired_data_access_role_arn:iam_role_arn ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  endpoint_properties

val make_list_endpoints_response :
  ?endpoint_properties_list:endpoint_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_endpoints_response

val make_endpoint_filter :
  ?model_arn:comprehend_model_arn ->
  ?status:endpoint_status ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  endpoint_filter

val make_list_endpoints_request :
  ?filter:endpoint_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_endpoints_request

val make_dominant_language_detection_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  unit ->
  dominant_language_detection_job_properties

val make_list_dominant_language_detection_jobs_response :
  ?dominant_language_detection_job_properties_list:dominant_language_detection_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_dominant_language_detection_jobs_response

val make_dominant_language_detection_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  dominant_language_detection_job_filter

val make_list_dominant_language_detection_jobs_request :
  ?filter:dominant_language_detection_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_dominant_language_detection_jobs_request

val make_document_classifier_summary :
  ?document_classifier_name:comprehend_arn_name ->
  ?number_of_versions:integer ->
  ?latest_version_created_at:timestamp ->
  ?latest_version_name:version_name ->
  ?latest_version_status:model_status ->
  unit ->
  document_classifier_summary

val make_list_document_classifier_summaries_response :
  ?document_classifier_summaries_list:document_classifier_summaries_list ->
  ?next_token:string_ ->
  unit ->
  list_document_classifier_summaries_response

val make_list_document_classifier_summaries_request :
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_document_classifier_summaries_request

val make_document_classifier_output_data_config :
  ?s3_uri:s3_uri ->
  ?kms_key_id:kms_key_id ->
  ?flywheel_stats_s3_prefix:s3_uri ->
  unit ->
  document_classifier_output_data_config

val make_document_classifier_documents :
  ?test_s3_uri:s3_uri -> s3_uri:s3_uri -> unit -> document_classifier_documents

val make_document_classifier_input_data_config :
  ?data_format:document_classifier_data_format ->
  ?s3_uri:s3_uri ->
  ?test_s3_uri:s3_uri ->
  ?label_delimiter:label_delimiter ->
  ?augmented_manifests:document_classifier_augmented_manifests_list ->
  ?document_type:document_classifier_document_type_format ->
  ?documents:document_classifier_documents ->
  ?document_reader_config:document_reader_config ->
  unit ->
  document_classifier_input_data_config

val make_document_classifier_properties :
  ?document_classifier_arn:document_classifier_arn ->
  ?language_code:language_code ->
  ?status:model_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?training_start_time:timestamp ->
  ?training_end_time:timestamp ->
  ?input_data_config:document_classifier_input_data_config ->
  ?output_data_config:document_classifier_output_data_config ->
  ?classifier_metadata:classifier_metadata ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?mode:document_classifier_mode ->
  ?model_kms_key_id:kms_key_id ->
  ?version_name:version_name ->
  ?source_model_arn:document_classifier_arn ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  document_classifier_properties

val make_list_document_classifiers_response :
  ?document_classifier_properties_list:document_classifier_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_document_classifiers_response

val make_document_classifier_filter :
  ?status:model_status ->
  ?document_classifier_name:comprehend_arn_name ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  document_classifier_filter

val make_list_document_classifiers_request :
  ?filter:document_classifier_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_document_classifiers_request

val make_document_classification_job_properties :
  ?job_id:job_id ->
  ?job_arn:comprehend_arn ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?message:any_length_string ->
  ?submit_time:timestamp ->
  ?end_time:timestamp ->
  ?document_classifier_arn:document_classifier_arn ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?data_access_role_arn:iam_role_arn ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  document_classification_job_properties

val make_list_document_classification_jobs_response :
  ?document_classification_job_properties_list:document_classification_job_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_document_classification_jobs_response

val make_document_classification_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submit_time_before:timestamp ->
  ?submit_time_after:timestamp ->
  unit ->
  document_classification_job_filter

val make_list_document_classification_jobs_request :
  ?filter:document_classification_job_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_document_classification_jobs_request

val make_dataset_properties :
  ?dataset_arn:comprehend_dataset_arn ->
  ?dataset_name:comprehend_arn_name ->
  ?dataset_type:dataset_type ->
  ?dataset_s3_uri:s3_uri ->
  ?description:description ->
  ?status:dataset_status ->
  ?message:any_length_string ->
  ?number_of_documents:number_of_documents ->
  ?creation_time:timestamp ->
  ?end_time:timestamp ->
  unit ->
  dataset_properties

val make_list_datasets_response :
  ?dataset_properties_list:dataset_properties_list ->
  ?next_token:string_ ->
  unit ->
  list_datasets_response

val make_dataset_filter :
  ?status:dataset_status ->
  ?dataset_type:dataset_type ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  unit ->
  dataset_filter

val make_list_datasets_request :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?filter:dataset_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_integer ->
  unit ->
  list_datasets_request

val make_import_model_response : ?model_arn:comprehend_model_arn -> unit -> import_model_response

val make_import_model_request :
  ?model_name:comprehend_arn_name ->
  ?version_name:version_name ->
  ?model_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?tags:tag_list ->
  source_model_arn:comprehend_model_arn ->
  unit ->
  import_model_request

val make_toxic_content : ?name:toxic_content_type -> ?score:float_ -> unit -> toxic_content
val make_toxic_labels : ?labels:list_of_toxic_content -> ?toxicity:float_ -> unit -> toxic_labels

val make_detect_toxic_content_response :
  ?result_list:list_of_toxic_labels -> unit -> detect_toxic_content_response

val make_text_segment : text:customer_input_string -> unit -> text_segment

val make_detect_toxic_content_request :
  text_segments:list_of_text_segments ->
  language_code:language_code ->
  unit ->
  detect_toxic_content_request

val make_detect_targeted_sentiment_response :
  ?entities:list_of_targeted_sentiment_entities -> unit -> detect_targeted_sentiment_response

val make_detect_targeted_sentiment_request :
  text:customer_input_string ->
  language_code:language_code ->
  unit ->
  detect_targeted_sentiment_request

val make_detect_syntax_response :
  ?syntax_tokens:list_of_syntax_tokens -> unit -> detect_syntax_response

val make_detect_syntax_request :
  text:customer_input_string -> language_code:syntax_language_code -> unit -> detect_syntax_request

val make_detect_sentiment_response :
  ?sentiment:sentiment_type -> ?sentiment_score:sentiment_score -> unit -> detect_sentiment_response

val make_detect_sentiment_request :
  text:customer_input_string -> language_code:language_code -> unit -> detect_sentiment_request

val make_pii_entity :
  ?score:float_ ->
  ?type_:pii_entity_type ->
  ?begin_offset:integer ->
  ?end_offset:integer ->
  unit ->
  pii_entity

val make_detect_pii_entities_response :
  ?entities:list_of_pii_entities -> unit -> detect_pii_entities_response

val make_detect_pii_entities_request :
  text:string_ -> language_code:language_code -> unit -> detect_pii_entities_request

val make_detect_key_phrases_response :
  ?key_phrases:list_of_key_phrases -> unit -> detect_key_phrases_response

val make_detect_key_phrases_request :
  text:customer_input_string -> language_code:language_code -> unit -> detect_key_phrases_request

val make_detect_entities_response :
  ?entities:list_of_entities ->
  ?document_metadata:document_metadata ->
  ?document_type:list_of_document_type ->
  ?blocks:list_of_blocks ->
  ?errors:list_of_errors ->
  unit ->
  detect_entities_response

val make_detect_entities_request :
  ?text:customer_input_string ->
  ?language_code:language_code ->
  ?endpoint_arn:entity_recognizer_endpoint_arn ->
  ?bytes:semi_structured_document_blob ->
  ?document_reader_config:document_reader_config ->
  unit ->
  detect_entities_request

val make_detect_dominant_language_response :
  ?languages:list_of_dominant_languages -> unit -> detect_dominant_language_response

val make_detect_dominant_language_request :
  text:customer_input_string -> unit -> detect_dominant_language_request

val make_describe_topics_detection_job_response :
  ?topics_detection_job_properties:topics_detection_job_properties ->
  unit ->
  describe_topics_detection_job_response

val make_describe_topics_detection_job_request :
  job_id:job_id -> unit -> describe_topics_detection_job_request

val make_describe_targeted_sentiment_detection_job_response :
  ?targeted_sentiment_detection_job_properties:targeted_sentiment_detection_job_properties ->
  unit ->
  describe_targeted_sentiment_detection_job_response

val make_describe_targeted_sentiment_detection_job_request :
  job_id:job_id -> unit -> describe_targeted_sentiment_detection_job_request

val make_describe_sentiment_detection_job_response :
  ?sentiment_detection_job_properties:sentiment_detection_job_properties ->
  unit ->
  describe_sentiment_detection_job_response

val make_describe_sentiment_detection_job_request :
  job_id:job_id -> unit -> describe_sentiment_detection_job_request

val make_describe_resource_policy_response :
  ?resource_policy:policy ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?policy_revision_id:policy_revision_id ->
  unit ->
  describe_resource_policy_response

val make_describe_resource_policy_request :
  resource_arn:comprehend_model_arn -> unit -> describe_resource_policy_request

val make_describe_pii_entities_detection_job_response :
  ?pii_entities_detection_job_properties:pii_entities_detection_job_properties ->
  unit ->
  describe_pii_entities_detection_job_response

val make_describe_pii_entities_detection_job_request :
  job_id:job_id -> unit -> describe_pii_entities_detection_job_request

val make_describe_key_phrases_detection_job_response :
  ?key_phrases_detection_job_properties:key_phrases_detection_job_properties ->
  unit ->
  describe_key_phrases_detection_job_response

val make_describe_key_phrases_detection_job_request :
  job_id:job_id -> unit -> describe_key_phrases_detection_job_request

val make_describe_flywheel_iteration_response :
  ?flywheel_iteration_properties:flywheel_iteration_properties ->
  unit ->
  describe_flywheel_iteration_response

val make_describe_flywheel_iteration_request :
  flywheel_arn:comprehend_flywheel_arn ->
  flywheel_iteration_id:flywheel_iteration_id ->
  unit ->
  describe_flywheel_iteration_request

val make_describe_flywheel_response :
  ?flywheel_properties:flywheel_properties -> unit -> describe_flywheel_response

val make_describe_flywheel_request :
  flywheel_arn:comprehend_flywheel_arn -> unit -> describe_flywheel_request

val make_describe_events_detection_job_response :
  ?events_detection_job_properties:events_detection_job_properties ->
  unit ->
  describe_events_detection_job_response

val make_describe_events_detection_job_request :
  job_id:job_id -> unit -> describe_events_detection_job_request

val make_describe_entity_recognizer_response :
  ?entity_recognizer_properties:entity_recognizer_properties ->
  unit ->
  describe_entity_recognizer_response

val make_describe_entity_recognizer_request :
  entity_recognizer_arn:entity_recognizer_arn -> unit -> describe_entity_recognizer_request

val make_describe_entities_detection_job_response :
  ?entities_detection_job_properties:entities_detection_job_properties ->
  unit ->
  describe_entities_detection_job_response

val make_describe_entities_detection_job_request :
  job_id:job_id -> unit -> describe_entities_detection_job_request

val make_describe_endpoint_response :
  ?endpoint_properties:endpoint_properties -> unit -> describe_endpoint_response

val make_describe_endpoint_request :
  endpoint_arn:comprehend_endpoint_arn -> unit -> describe_endpoint_request

val make_describe_dominant_language_detection_job_response :
  ?dominant_language_detection_job_properties:dominant_language_detection_job_properties ->
  unit ->
  describe_dominant_language_detection_job_response

val make_describe_dominant_language_detection_job_request :
  job_id:job_id -> unit -> describe_dominant_language_detection_job_request

val make_describe_document_classifier_response :
  ?document_classifier_properties:document_classifier_properties ->
  unit ->
  describe_document_classifier_response

val make_describe_document_classifier_request :
  document_classifier_arn:document_classifier_arn -> unit -> describe_document_classifier_request

val make_describe_document_classification_job_response :
  ?document_classification_job_properties:document_classification_job_properties ->
  unit ->
  describe_document_classification_job_response

val make_describe_document_classification_job_request :
  job_id:job_id -> unit -> describe_document_classification_job_request

val make_describe_dataset_response :
  ?dataset_properties:dataset_properties -> unit -> describe_dataset_response

val make_describe_dataset_request :
  dataset_arn:comprehend_dataset_arn -> unit -> describe_dataset_request

val make_delete_resource_policy_response : unit -> unit

val make_delete_resource_policy_request :
  ?policy_revision_id:policy_revision_id ->
  resource_arn:comprehend_model_arn ->
  unit ->
  delete_resource_policy_request

val make_delete_flywheel_response : unit -> unit

val make_delete_flywheel_request :
  flywheel_arn:comprehend_flywheel_arn -> unit -> delete_flywheel_request

val make_delete_entity_recognizer_response : unit -> unit

val make_delete_entity_recognizer_request :
  entity_recognizer_arn:entity_recognizer_arn -> unit -> delete_entity_recognizer_request

val make_delete_endpoint_response : unit -> unit

val make_delete_endpoint_request :
  endpoint_arn:comprehend_endpoint_arn -> unit -> delete_endpoint_request

val make_delete_document_classifier_response : unit -> unit

val make_delete_document_classifier_request :
  document_classifier_arn:document_classifier_arn -> unit -> delete_document_classifier_request

val make_create_flywheel_response :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?active_model_arn:comprehend_model_arn ->
  unit ->
  create_flywheel_response

val make_create_flywheel_request :
  ?active_model_arn:comprehend_model_arn ->
  ?task_config:task_config ->
  ?model_type:model_type ->
  ?data_security_config:data_security_config ->
  ?client_request_token:client_request_token_string ->
  ?tags:tag_list ->
  flywheel_name:comprehend_arn_name ->
  data_access_role_arn:iam_role_arn ->
  data_lake_s3_uri:flywheel_s3_uri ->
  unit ->
  create_flywheel_request

val make_create_entity_recognizer_response :
  ?entity_recognizer_arn:entity_recognizer_arn -> unit -> create_entity_recognizer_response

val make_create_entity_recognizer_request :
  ?version_name:version_name ->
  ?tags:tag_list ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?model_kms_key_id:kms_key_id ->
  ?model_policy:policy ->
  recognizer_name:comprehend_arn_name ->
  data_access_role_arn:iam_role_arn ->
  input_data_config:entity_recognizer_input_data_config ->
  language_code:language_code ->
  unit ->
  create_entity_recognizer_request

val make_create_endpoint_response :
  ?endpoint_arn:comprehend_endpoint_arn ->
  ?model_arn:comprehend_model_arn ->
  unit ->
  create_endpoint_response

val make_create_endpoint_request :
  ?model_arn:comprehend_model_arn ->
  ?client_request_token:client_request_token_string ->
  ?tags:tag_list ->
  ?data_access_role_arn:iam_role_arn ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  endpoint_name:comprehend_endpoint_name ->
  desired_inference_units:inference_units_integer ->
  unit ->
  create_endpoint_request

val make_create_document_classifier_response :
  ?document_classifier_arn:document_classifier_arn -> unit -> create_document_classifier_response

val make_create_document_classifier_request :
  ?version_name:version_name ->
  ?tags:tag_list ->
  ?output_data_config:document_classifier_output_data_config ->
  ?client_request_token:client_request_token_string ->
  ?volume_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?mode:document_classifier_mode ->
  ?model_kms_key_id:kms_key_id ->
  ?model_policy:policy ->
  document_classifier_name:comprehend_arn_name ->
  data_access_role_arn:iam_role_arn ->
  input_data_config:document_classifier_input_data_config ->
  language_code:language_code ->
  unit ->
  create_document_classifier_request

val make_create_dataset_response :
  ?dataset_arn:comprehend_dataset_arn -> unit -> create_dataset_response

val make_dataset_entity_recognizer_entity_list :
  s3_uri:s3_uri -> unit -> dataset_entity_recognizer_entity_list

val make_dataset_entity_recognizer_documents :
  ?input_format:input_format -> s3_uri:s3_uri -> unit -> dataset_entity_recognizer_documents

val make_dataset_entity_recognizer_annotations :
  s3_uri:s3_uri -> unit -> dataset_entity_recognizer_annotations

val make_dataset_entity_recognizer_input_data_config :
  ?annotations:dataset_entity_recognizer_annotations ->
  ?entity_list:dataset_entity_recognizer_entity_list ->
  documents:dataset_entity_recognizer_documents ->
  unit ->
  dataset_entity_recognizer_input_data_config

val make_dataset_document_classifier_input_data_config :
  ?label_delimiter:label_delimiter ->
  s3_uri:s3_uri ->
  unit ->
  dataset_document_classifier_input_data_config

val make_dataset_augmented_manifests_list_item :
  ?annotation_data_s3_uri:s3_uri ->
  ?source_documents_s3_uri:s3_uri ->
  ?document_type:augmented_manifests_document_type_format ->
  attribute_names:attribute_names_list ->
  s3_uri:s3_uri ->
  unit ->
  dataset_augmented_manifests_list_item

val make_dataset_input_data_config :
  ?augmented_manifests:dataset_augmented_manifests_list ->
  ?data_format:dataset_data_format ->
  ?document_classifier_input_data_config:dataset_document_classifier_input_data_config ->
  ?entity_recognizer_input_data_config:dataset_entity_recognizer_input_data_config ->
  unit ->
  dataset_input_data_config

val make_create_dataset_request :
  ?dataset_type:dataset_type ->
  ?description:description ->
  ?client_request_token:client_request_token_string ->
  ?tags:tag_list ->
  flywheel_arn:comprehend_flywheel_arn ->
  dataset_name:comprehend_arn_name ->
  input_data_config:dataset_input_data_config ->
  unit ->
  create_dataset_request

val make_entity_label : ?name:pii_entity_type -> ?score:float_ -> unit -> entity_label

val make_contains_pii_entities_response :
  ?labels:list_of_entity_labels -> unit -> contains_pii_entities_response

val make_contains_pii_entities_request :
  text:string_ -> language_code:language_code -> unit -> contains_pii_entities_request
