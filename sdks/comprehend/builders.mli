open Types

val make_warnings_list_item :
  ?warn_message:string_ ->
  ?warn_code:page_based_warning_code ->
  ?page:integer ->
  unit ->
  warnings_list_item

val make_vpc_config : subnets:subnets -> security_group_ids:security_group_ids -> unit -> vpc_config

val make_document_classification_config :
  ?labels:labels_list -> mode:document_classifier_mode -> unit -> document_classification_config

val make_entity_types_list_item : type_:entity_type_name -> unit -> entity_types_list_item

val make_entity_recognition_config :
  entity_types:entity_types_list -> unit -> entity_recognition_config

val make_task_config :
  ?entity_recognition_config:entity_recognition_config ->
  ?document_classification_config:document_classification_config ->
  language_code:language_code ->
  unit ->
  task_config

val make_data_security_config :
  ?vpc_config:vpc_config ->
  ?data_lake_kms_key_id:kms_key_id ->
  ?volume_kms_key_id:kms_key_id ->
  ?model_kms_key_id:kms_key_id ->
  unit ->
  data_security_config

val make_flywheel_properties :
  ?latest_flywheel_iteration:flywheel_iteration_id ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:any_length_string ->
  ?model_type:model_type ->
  ?status:flywheel_status ->
  ?data_security_config:data_security_config ->
  ?data_lake_s3_uri:s3_uri ->
  ?task_config:task_config ->
  ?data_access_role_arn:iam_role_arn ->
  ?active_model_arn:comprehend_model_arn ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  flywheel_properties

val make_update_flywheel_response :
  ?flywheel_properties:flywheel_properties -> unit -> update_flywheel_response

val make_update_data_security_config :
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?model_kms_key_id:kms_key_id ->
  unit ->
  update_data_security_config

val make_update_flywheel_request :
  ?data_security_config:update_data_security_config ->
  ?data_access_role_arn:iam_role_arn ->
  ?active_model_arn:comprehend_model_arn ->
  flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  update_flywheel_request

val make_invalid_request_detail :
  ?reason:invalid_request_detail_reason -> unit -> invalid_request_detail

val make_update_endpoint_response :
  ?desired_model_arn:comprehend_model_arn -> unit -> update_endpoint_response

val make_update_endpoint_request :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?desired_data_access_role_arn:iam_role_arn ->
  ?desired_inference_units:inference_units_integer ->
  ?desired_model_arn:comprehend_model_arn ->
  endpoint_arn:comprehend_endpoint_arn ->
  unit ->
  update_endpoint_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:comprehend_arn -> unit -> untag_resource_request

val make_toxic_content : ?score:float_ -> ?name:toxic_content_type -> unit -> toxic_content
val make_toxic_labels : ?toxicity:float_ -> ?labels:list_of_toxic_content -> unit -> toxic_labels

val make_document_reader_config :
  ?feature_types:list_of_document_read_feature_types ->
  ?document_read_mode:document_read_mode ->
  document_read_action:document_read_action ->
  unit ->
  document_reader_config

val make_input_data_config :
  ?document_reader_config:document_reader_config ->
  ?input_format:input_format ->
  s3_uri:s3_uri ->
  unit ->
  input_data_config

val make_output_data_config : ?kms_key_id:kms_key_id -> s3_uri:s3_uri -> unit -> output_data_config

val make_topics_detection_job_properties :
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?number_of_topics:integer ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  topics_detection_job_properties

val make_topics_detection_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  topics_detection_job_filter

val make_text_segment : text:customer_input_string -> unit -> text_segment

val make_sentiment_score :
  ?mixed:float_ ->
  ?neutral:float_ ->
  ?negative:float_ ->
  ?positive:float_ ->
  unit ->
  sentiment_score

val make_mention_sentiment :
  ?sentiment_score:sentiment_score -> ?sentiment:sentiment_type -> unit -> mention_sentiment

val make_targeted_sentiment_mention :
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?mention_sentiment:mention_sentiment ->
  ?type_:targeted_sentiment_entity_type ->
  ?text:string_ ->
  ?group_score:float_ ->
  ?score:float_ ->
  unit ->
  targeted_sentiment_mention

val make_targeted_sentiment_entity :
  ?mentions:list_of_mentions ->
  ?descriptive_mention_index:list_of_descriptive_mention_indices ->
  unit ->
  targeted_sentiment_entity

val make_targeted_sentiment_detection_job_properties :
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?language_code:language_code ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  targeted_sentiment_detection_job_properties

val make_targeted_sentiment_detection_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  targeted_sentiment_detection_job_filter

val make_tag_resource_response : unit -> unit
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:comprehend_arn -> unit -> tag_resource_request

val make_part_of_speech_tag :
  ?score:float_ -> ?tag:part_of_speech_tag_type -> unit -> part_of_speech_tag

val make_syntax_token :
  ?part_of_speech:part_of_speech_tag ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?text:string_ ->
  ?token_id:integer ->
  unit ->
  syntax_token

val make_stop_training_entity_recognizer_response : unit -> unit

val make_stop_training_entity_recognizer_request :
  entity_recognizer_arn:entity_recognizer_arn -> unit -> stop_training_entity_recognizer_request

val make_stop_training_document_classifier_response : unit -> unit

val make_stop_training_document_classifier_request :
  document_classifier_arn:document_classifier_arn ->
  unit ->
  stop_training_document_classifier_request

val make_stop_targeted_sentiment_detection_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> stop_targeted_sentiment_detection_job_response

val make_stop_targeted_sentiment_detection_job_request :
  job_id:job_id -> unit -> stop_targeted_sentiment_detection_job_request

val make_stop_sentiment_detection_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> stop_sentiment_detection_job_response

val make_stop_sentiment_detection_job_request :
  job_id:job_id -> unit -> stop_sentiment_detection_job_request

val make_stop_pii_entities_detection_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> stop_pii_entities_detection_job_response

val make_stop_pii_entities_detection_job_request :
  job_id:job_id -> unit -> stop_pii_entities_detection_job_request

val make_stop_key_phrases_detection_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> stop_key_phrases_detection_job_response

val make_stop_key_phrases_detection_job_request :
  job_id:job_id -> unit -> stop_key_phrases_detection_job_request

val make_stop_events_detection_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> stop_events_detection_job_response

val make_stop_events_detection_job_request :
  job_id:job_id -> unit -> stop_events_detection_job_request

val make_stop_entities_detection_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> stop_entities_detection_job_response

val make_stop_entities_detection_job_request :
  job_id:job_id -> unit -> stop_entities_detection_job_request

val make_stop_dominant_language_detection_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> stop_dominant_language_detection_job_response

val make_stop_dominant_language_detection_job_request :
  job_id:job_id -> unit -> stop_dominant_language_detection_job_request

val make_start_topics_detection_job_response :
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_topics_detection_job_response

val make_start_topics_detection_job_request :
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?number_of_topics:number_of_topics_integer ->
  ?job_name:job_name ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_topics_detection_job_request

val make_start_targeted_sentiment_detection_job_response :
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_targeted_sentiment_detection_job_response

val make_start_targeted_sentiment_detection_job_request :
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_targeted_sentiment_detection_job_request

val make_start_sentiment_detection_job_response :
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_sentiment_detection_job_response

val make_start_sentiment_detection_job_request :
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_sentiment_detection_job_request

val make_start_pii_entities_detection_job_response :
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_pii_entities_detection_job_response

val make_redaction_config :
  ?mask_character:mask_character ->
  ?mask_mode:pii_entities_detection_mask_mode ->
  ?pii_entity_types:list_of_pii_entity_types ->
  unit ->
  redaction_config

val make_start_pii_entities_detection_job_request :
  ?tags:tag_list ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  ?redaction_config:redaction_config ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  mode:pii_entities_detection_mode ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_pii_entities_detection_job_request

val make_start_key_phrases_detection_job_response :
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_key_phrases_detection_job_response

val make_start_key_phrases_detection_job_request :
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_key_phrases_detection_job_request

val make_start_flywheel_iteration_response :
  ?flywheel_iteration_id:flywheel_iteration_id ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  start_flywheel_iteration_response

val make_start_flywheel_iteration_request :
  ?client_request_token:client_request_token_string ->
  flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  start_flywheel_iteration_request

val make_start_events_detection_job_response :
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_events_detection_job_response

val make_start_events_detection_job_request :
  ?tags:tag_list ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  target_event_types:target_event_types ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_events_detection_job_request

val make_start_entities_detection_job_response :
  ?entity_recognizer_arn:entity_recognizer_arn ->
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_entities_detection_job_response

val make_start_entities_detection_job_request :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?entity_recognizer_arn:entity_recognizer_arn ->
  ?job_name:job_name ->
  language_code:language_code ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_entities_detection_job_request

val make_start_dominant_language_detection_job_response :
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_dominant_language_detection_job_response

val make_start_dominant_language_detection_job_request :
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?job_name:job_name ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_dominant_language_detection_job_request

val make_start_document_classification_job_response :
  ?document_classifier_arn:document_classifier_arn ->
  ?job_status:job_status ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  start_document_classification_job_response

val make_start_document_classification_job_request :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?document_classifier_arn:document_classifier_arn ->
  ?job_name:job_name ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_document_classification_job_request

val make_sentiment_detection_job_properties :
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?language_code:language_code ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  sentiment_detection_job_properties

val make_sentiment_detection_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  sentiment_detection_job_filter

val make_relationships_list_item :
  ?type_:relationship_type -> ?ids:string_list -> unit -> relationships_list_item

val make_put_resource_policy_response :
  ?policy_revision_id:policy_revision_id -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?policy_revision_id:policy_revision_id ->
  resource_policy:policy ->
  resource_arn:comprehend_model_arn ->
  unit ->
  put_resource_policy_request

val make_point : ?y:float_ -> ?x:float_ -> unit -> point

val make_pii_output_data_config :
  ?kms_key_id:kms_key_id -> s3_uri:s3_uri -> unit -> pii_output_data_config

val make_pii_entity :
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?type_:pii_entity_type ->
  ?score:float_ ->
  unit ->
  pii_entity

val make_pii_entities_detection_job_properties :
  ?mode:pii_entities_detection_mode ->
  ?data_access_role_arn:iam_role_arn ->
  ?language_code:language_code ->
  ?redaction_config:redaction_config ->
  ?output_data_config:pii_output_data_config ->
  ?input_data_config:input_data_config ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  pii_entities_detection_job_properties

val make_pii_entities_detection_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  pii_entities_detection_job_filter

val make_list_topics_detection_jobs_response :
  ?next_token:string_ ->
  ?topics_detection_job_properties_list:topics_detection_job_properties_list ->
  unit ->
  list_topics_detection_jobs_response

val make_list_topics_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:topics_detection_job_filter ->
  unit ->
  list_topics_detection_jobs_request

val make_list_targeted_sentiment_detection_jobs_response :
  ?next_token:string_ ->
  ?targeted_sentiment_detection_job_properties_list:targeted_sentiment_detection_job_properties_list ->
  unit ->
  list_targeted_sentiment_detection_jobs_response

val make_list_targeted_sentiment_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:targeted_sentiment_detection_job_filter ->
  unit ->
  list_targeted_sentiment_detection_jobs_request

val make_list_tags_for_resource_response :
  ?tags:tag_list -> ?resource_arn:comprehend_arn -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:comprehend_arn -> unit -> list_tags_for_resource_request

val make_list_sentiment_detection_jobs_response :
  ?next_token:string_ ->
  ?sentiment_detection_job_properties_list:sentiment_detection_job_properties_list ->
  unit ->
  list_sentiment_detection_jobs_response

val make_list_sentiment_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:sentiment_detection_job_filter ->
  unit ->
  list_sentiment_detection_jobs_request

val make_list_pii_entities_detection_jobs_response :
  ?next_token:string_ ->
  ?pii_entities_detection_job_properties_list:pii_entities_detection_job_properties_list ->
  unit ->
  list_pii_entities_detection_jobs_response

val make_list_pii_entities_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:pii_entities_detection_job_filter ->
  unit ->
  list_pii_entities_detection_jobs_request

val make_document_label : ?page:integer -> ?score:float_ -> ?name:string_ -> unit -> document_label

val make_key_phrase :
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?text:string_ ->
  ?score:float_ ->
  unit ->
  key_phrase

val make_extracted_characters_list_item :
  ?count:integer -> ?page:integer -> unit -> extracted_characters_list_item

val make_errors_list_item :
  ?error_message:string_ ->
  ?error_code:page_based_error_code ->
  ?page:integer ->
  unit ->
  errors_list_item

val make_entity_label : ?score:float_ -> ?name:pii_entity_type -> unit -> entity_label

val make_child_block :
  ?end_offset:integer -> ?begin_offset:integer -> ?child_block_id:string_ -> unit -> child_block

val make_block_reference :
  ?child_blocks:list_of_child_blocks ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?block_id:string_ ->
  unit ->
  block_reference

val make_entity :
  ?block_references:list_of_block_references ->
  ?end_offset:integer ->
  ?begin_offset:integer ->
  ?text:string_ ->
  ?type_:entity_type ->
  ?score:float_ ->
  unit ->
  entity

val make_dominant_language : ?score:float_ -> ?language_code:string_ -> unit -> dominant_language

val make_document_type_list_item :
  ?type_:document_type -> ?page:integer -> unit -> document_type_list_item

val make_document_class : ?page:integer -> ?score:float_ -> ?name:string_ -> unit -> document_class

val make_bounding_box :
  ?width:float_ -> ?top:float_ -> ?left:float_ -> ?height:float_ -> unit -> bounding_box

val make_geometry : ?polygon:polygon -> ?bounding_box:bounding_box -> unit -> geometry

val make_block :
  ?relationships:list_of_relationships ->
  ?geometry:geometry ->
  ?page:integer ->
  ?text:string_ ->
  ?block_type:block_type ->
  ?id:string_ ->
  unit ->
  block

val make_key_phrases_detection_job_properties :
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?language_code:language_code ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  key_phrases_detection_job_properties

val make_list_key_phrases_detection_jobs_response :
  ?next_token:string_ ->
  ?key_phrases_detection_job_properties_list:key_phrases_detection_job_properties_list ->
  unit ->
  list_key_phrases_detection_jobs_response

val make_key_phrases_detection_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  key_phrases_detection_job_filter

val make_list_key_phrases_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:key_phrases_detection_job_filter ->
  unit ->
  list_key_phrases_detection_jobs_request

val make_flywheel_summary :
  ?latest_flywheel_iteration:flywheel_iteration_id ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:any_length_string ->
  ?model_type:model_type ->
  ?status:flywheel_status ->
  ?data_lake_s3_uri:s3_uri ->
  ?active_model_arn:comprehend_model_arn ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  flywheel_summary

val make_list_flywheels_response :
  ?next_token:string_ ->
  ?flywheel_summary_list:flywheel_summary_list ->
  unit ->
  list_flywheels_response

val make_flywheel_filter :
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?status:flywheel_status ->
  unit ->
  flywheel_filter

val make_list_flywheels_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:flywheel_filter ->
  unit ->
  list_flywheels_request

val make_flywheel_model_evaluation_metrics :
  ?average_accuracy:double ->
  ?average_recall:double ->
  ?average_precision:double ->
  ?average_f1_score:double ->
  unit ->
  flywheel_model_evaluation_metrics

val make_flywheel_iteration_properties :
  ?evaluation_manifest_s3_prefix:s3_uri ->
  ?trained_model_metrics:flywheel_model_evaluation_metrics ->
  ?trained_model_arn:comprehend_model_arn ->
  ?evaluated_model_metrics:flywheel_model_evaluation_metrics ->
  ?evaluated_model_arn:comprehend_model_arn ->
  ?message:any_length_string ->
  ?status:flywheel_iteration_status ->
  ?end_time:timestamp ->
  ?creation_time:timestamp ->
  ?flywheel_iteration_id:flywheel_iteration_id ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  flywheel_iteration_properties

val make_list_flywheel_iteration_history_response :
  ?next_token:string_ ->
  ?flywheel_iteration_properties_list:flywheel_iteration_properties_list ->
  unit ->
  list_flywheel_iteration_history_response

val make_flywheel_iteration_filter :
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  flywheel_iteration_filter

val make_list_flywheel_iteration_history_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:flywheel_iteration_filter ->
  flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  list_flywheel_iteration_history_request

val make_events_detection_job_properties :
  ?target_event_types:target_event_types ->
  ?data_access_role_arn:iam_role_arn ->
  ?language_code:language_code ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  events_detection_job_properties

val make_list_events_detection_jobs_response :
  ?next_token:string_ ->
  ?events_detection_job_properties_list:events_detection_job_properties_list ->
  unit ->
  list_events_detection_jobs_response

val make_events_detection_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  events_detection_job_filter

val make_list_events_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:events_detection_job_filter ->
  unit ->
  list_events_detection_jobs_request

val make_entity_recognizer_documents :
  ?input_format:input_format ->
  ?test_s3_uri:s3_uri ->
  s3_uri:s3_uri ->
  unit ->
  entity_recognizer_documents

val make_entity_recognizer_annotations :
  ?test_s3_uri:s3_uri -> s3_uri:s3_uri -> unit -> entity_recognizer_annotations

val make_entity_recognizer_entity_list : s3_uri:s3_uri -> unit -> entity_recognizer_entity_list

val make_augmented_manifests_list_item :
  ?document_type:augmented_manifests_document_type_format ->
  ?source_documents_s3_uri:s3_uri ->
  ?annotation_data_s3_uri:s3_uri ->
  ?split:split ->
  attribute_names:attribute_names_list ->
  s3_uri:s3_uri ->
  unit ->
  augmented_manifests_list_item

val make_entity_recognizer_input_data_config :
  ?augmented_manifests:entity_recognizer_augmented_manifests_list ->
  ?entity_list:entity_recognizer_entity_list ->
  ?annotations:entity_recognizer_annotations ->
  ?documents:entity_recognizer_documents ->
  ?data_format:entity_recognizer_data_format ->
  entity_types:entity_types_list ->
  unit ->
  entity_recognizer_input_data_config

val make_entity_recognizer_evaluation_metrics :
  ?f1_score:double ->
  ?recall:double ->
  ?precision:double ->
  unit ->
  entity_recognizer_evaluation_metrics

val make_entity_types_evaluation_metrics :
  ?f1_score:double -> ?recall:double -> ?precision:double -> unit -> entity_types_evaluation_metrics

val make_entity_recognizer_metadata_entity_types_list_item :
  ?number_of_train_mentions:integer ->
  ?evaluation_metrics:entity_types_evaluation_metrics ->
  ?type_:any_length_string ->
  unit ->
  entity_recognizer_metadata_entity_types_list_item

val make_entity_recognizer_metadata :
  ?entity_types:entity_recognizer_metadata_entity_types_list ->
  ?evaluation_metrics:entity_recognizer_evaluation_metrics ->
  ?number_of_test_documents:integer ->
  ?number_of_trained_documents:integer ->
  unit ->
  entity_recognizer_metadata

val make_entity_recognizer_output_data_config :
  ?flywheel_stats_s3_prefix:s3_uri -> unit -> entity_recognizer_output_data_config

val make_entity_recognizer_properties :
  ?output_data_config:entity_recognizer_output_data_config ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?source_model_arn:entity_recognizer_arn ->
  ?version_name:version_name ->
  ?model_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?recognizer_metadata:entity_recognizer_metadata ->
  ?input_data_config:entity_recognizer_input_data_config ->
  ?training_end_time:timestamp ->
  ?training_start_time:timestamp ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?status:model_status ->
  ?language_code:language_code ->
  ?entity_recognizer_arn:entity_recognizer_arn ->
  unit ->
  entity_recognizer_properties

val make_list_entity_recognizers_response :
  ?next_token:string_ ->
  ?entity_recognizer_properties_list:entity_recognizer_properties_list ->
  unit ->
  list_entity_recognizers_response

val make_entity_recognizer_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?recognizer_name:comprehend_arn_name ->
  ?status:model_status ->
  unit ->
  entity_recognizer_filter

val make_list_entity_recognizers_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:entity_recognizer_filter ->
  unit ->
  list_entity_recognizers_request

val make_entity_recognizer_summary :
  ?latest_version_status:model_status ->
  ?latest_version_name:version_name ->
  ?latest_version_created_at:timestamp ->
  ?number_of_versions:integer ->
  ?recognizer_name:comprehend_arn_name ->
  unit ->
  entity_recognizer_summary

val make_list_entity_recognizer_summaries_response :
  ?next_token:string_ ->
  ?entity_recognizer_summaries_list:entity_recognizer_summaries_list ->
  unit ->
  list_entity_recognizer_summaries_response

val make_list_entity_recognizer_summaries_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  unit ->
  list_entity_recognizer_summaries_request

val make_entities_detection_job_properties :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?language_code:language_code ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?entity_recognizer_arn:entity_recognizer_arn ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  entities_detection_job_properties

val make_list_entities_detection_jobs_response :
  ?next_token:string_ ->
  ?entities_detection_job_properties_list:entities_detection_job_properties_list ->
  unit ->
  list_entities_detection_jobs_response

val make_entities_detection_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  entities_detection_job_filter

val make_list_entities_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:entities_detection_job_filter ->
  unit ->
  list_entities_detection_jobs_request

val make_endpoint_properties :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?desired_data_access_role_arn:iam_role_arn ->
  ?data_access_role_arn:iam_role_arn ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?current_inference_units:inference_units_integer ->
  ?desired_inference_units:inference_units_integer ->
  ?desired_model_arn:comprehend_model_arn ->
  ?model_arn:comprehend_model_arn ->
  ?message:any_length_string ->
  ?status:endpoint_status ->
  ?endpoint_arn:comprehend_endpoint_arn ->
  unit ->
  endpoint_properties

val make_list_endpoints_response :
  ?next_token:string_ ->
  ?endpoint_properties_list:endpoint_properties_list ->
  unit ->
  list_endpoints_response

val make_endpoint_filter :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?status:endpoint_status ->
  ?model_arn:comprehend_model_arn ->
  unit ->
  endpoint_filter

val make_list_endpoints_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:endpoint_filter ->
  unit ->
  list_endpoints_request

val make_dominant_language_detection_job_properties :
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  dominant_language_detection_job_properties

val make_list_dominant_language_detection_jobs_response :
  ?next_token:string_ ->
  ?dominant_language_detection_job_properties_list:dominant_language_detection_job_properties_list ->
  unit ->
  list_dominant_language_detection_jobs_response

val make_dominant_language_detection_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  dominant_language_detection_job_filter

val make_list_dominant_language_detection_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:dominant_language_detection_job_filter ->
  unit ->
  list_dominant_language_detection_jobs_request

val make_document_classifier_documents :
  ?test_s3_uri:s3_uri -> s3_uri:s3_uri -> unit -> document_classifier_documents

val make_document_classifier_input_data_config :
  ?document_reader_config:document_reader_config ->
  ?documents:document_classifier_documents ->
  ?document_type:document_classifier_document_type_format ->
  ?augmented_manifests:document_classifier_augmented_manifests_list ->
  ?label_delimiter:label_delimiter ->
  ?test_s3_uri:s3_uri ->
  ?s3_uri:s3_uri ->
  ?data_format:document_classifier_data_format ->
  unit ->
  document_classifier_input_data_config

val make_document_classifier_output_data_config :
  ?flywheel_stats_s3_prefix:s3_uri ->
  ?kms_key_id:kms_key_id ->
  ?s3_uri:s3_uri ->
  unit ->
  document_classifier_output_data_config

val make_classifier_evaluation_metrics :
  ?hamming_loss:double ->
  ?micro_f1_score:double ->
  ?micro_recall:double ->
  ?micro_precision:double ->
  ?f1_score:double ->
  ?recall:double ->
  ?precision:double ->
  ?accuracy:double ->
  unit ->
  classifier_evaluation_metrics

val make_classifier_metadata :
  ?evaluation_metrics:classifier_evaluation_metrics ->
  ?number_of_test_documents:integer ->
  ?number_of_trained_documents:integer ->
  ?number_of_labels:integer ->
  unit ->
  classifier_metadata

val make_document_classifier_properties :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?source_model_arn:document_classifier_arn ->
  ?version_name:version_name ->
  ?model_kms_key_id:kms_key_id ->
  ?mode:document_classifier_mode ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?classifier_metadata:classifier_metadata ->
  ?output_data_config:document_classifier_output_data_config ->
  ?input_data_config:document_classifier_input_data_config ->
  ?training_end_time:timestamp ->
  ?training_start_time:timestamp ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?status:model_status ->
  ?language_code:language_code ->
  ?document_classifier_arn:document_classifier_arn ->
  unit ->
  document_classifier_properties

val make_list_document_classifiers_response :
  ?next_token:string_ ->
  ?document_classifier_properties_list:document_classifier_properties_list ->
  unit ->
  list_document_classifiers_response

val make_document_classifier_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?document_classifier_name:comprehend_arn_name ->
  ?status:model_status ->
  unit ->
  document_classifier_filter

val make_list_document_classifiers_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:document_classifier_filter ->
  unit ->
  list_document_classifiers_request

val make_document_classifier_summary :
  ?latest_version_status:model_status ->
  ?latest_version_name:version_name ->
  ?latest_version_created_at:timestamp ->
  ?number_of_versions:integer ->
  ?document_classifier_name:comprehend_arn_name ->
  unit ->
  document_classifier_summary

val make_list_document_classifier_summaries_response :
  ?next_token:string_ ->
  ?document_classifier_summaries_list:document_classifier_summaries_list ->
  unit ->
  list_document_classifier_summaries_response

val make_list_document_classifier_summaries_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  unit ->
  list_document_classifier_summaries_request

val make_document_classification_job_properties :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?document_classifier_arn:document_classifier_arn ->
  ?end_time:timestamp ->
  ?submit_time:timestamp ->
  ?message:any_length_string ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_arn:comprehend_arn ->
  ?job_id:job_id ->
  unit ->
  document_classification_job_properties

val make_list_document_classification_jobs_response :
  ?next_token:string_ ->
  ?document_classification_job_properties_list:document_classification_job_properties_list ->
  unit ->
  list_document_classification_jobs_response

val make_document_classification_job_filter :
  ?submit_time_after:timestamp ->
  ?submit_time_before:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  document_classification_job_filter

val make_list_document_classification_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:document_classification_job_filter ->
  unit ->
  list_document_classification_jobs_request

val make_dataset_properties :
  ?end_time:timestamp ->
  ?creation_time:timestamp ->
  ?number_of_documents:number_of_documents ->
  ?message:any_length_string ->
  ?status:dataset_status ->
  ?description:description ->
  ?dataset_s3_uri:s3_uri ->
  ?dataset_type:dataset_type ->
  ?dataset_name:comprehend_arn_name ->
  ?dataset_arn:comprehend_dataset_arn ->
  unit ->
  dataset_properties

val make_list_datasets_response :
  ?next_token:string_ ->
  ?dataset_properties_list:dataset_properties_list ->
  unit ->
  list_datasets_response

val make_dataset_filter :
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?dataset_type:dataset_type ->
  ?status:dataset_status ->
  unit ->
  dataset_filter

val make_list_datasets_request :
  ?max_results:max_results_integer ->
  ?next_token:string_ ->
  ?filter:dataset_filter ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  list_datasets_request

val make_import_model_response : ?model_arn:comprehend_model_arn -> unit -> import_model_response

val make_import_model_request :
  ?tags:tag_list ->
  ?data_access_role_arn:iam_role_arn ->
  ?model_kms_key_id:kms_key_id ->
  ?version_name:version_name ->
  ?model_name:comprehend_arn_name ->
  source_model_arn:comprehend_model_arn ->
  unit ->
  import_model_request

val make_document_metadata :
  ?extracted_characters:list_of_extracted_characters -> ?pages:integer -> unit -> document_metadata

val make_detect_toxic_content_response :
  ?result_list:list_of_toxic_labels -> unit -> detect_toxic_content_response

val make_detect_toxic_content_request :
  language_code:language_code ->
  text_segments:list_of_text_segments ->
  unit ->
  detect_toxic_content_request

val make_detect_targeted_sentiment_response :
  ?entities:list_of_targeted_sentiment_entities -> unit -> detect_targeted_sentiment_response

val make_detect_targeted_sentiment_request :
  language_code:language_code ->
  text:customer_input_string ->
  unit ->
  detect_targeted_sentiment_request

val make_detect_syntax_response :
  ?syntax_tokens:list_of_syntax_tokens -> unit -> detect_syntax_response

val make_detect_syntax_request :
  language_code:syntax_language_code -> text:customer_input_string -> unit -> detect_syntax_request

val make_detect_sentiment_response :
  ?sentiment_score:sentiment_score -> ?sentiment:sentiment_type -> unit -> detect_sentiment_response

val make_detect_sentiment_request :
  language_code:language_code -> text:customer_input_string -> unit -> detect_sentiment_request

val make_detect_pii_entities_response :
  ?entities:list_of_pii_entities -> unit -> detect_pii_entities_response

val make_detect_pii_entities_request :
  language_code:language_code -> text:string_ -> unit -> detect_pii_entities_request

val make_detect_key_phrases_response :
  ?key_phrases:list_of_key_phrases -> unit -> detect_key_phrases_response

val make_detect_key_phrases_request :
  language_code:language_code -> text:customer_input_string -> unit -> detect_key_phrases_request

val make_detect_entities_response :
  ?errors:list_of_errors ->
  ?blocks:list_of_blocks ->
  ?document_type:list_of_document_type ->
  ?document_metadata:document_metadata ->
  ?entities:list_of_entities ->
  unit ->
  detect_entities_response

val make_detect_entities_request :
  ?document_reader_config:document_reader_config ->
  ?bytes:semi_structured_document_blob ->
  ?endpoint_arn:entity_recognizer_endpoint_arn ->
  ?language_code:language_code ->
  ?text:customer_input_string ->
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
  ?policy_revision_id:policy_revision_id ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?resource_policy:policy ->
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

val make_describe_flywheel_response :
  ?flywheel_properties:flywheel_properties -> unit -> describe_flywheel_response

val make_describe_flywheel_request :
  flywheel_arn:comprehend_flywheel_arn -> unit -> describe_flywheel_request

val make_describe_flywheel_iteration_response :
  ?flywheel_iteration_properties:flywheel_iteration_properties ->
  unit ->
  describe_flywheel_iteration_response

val make_describe_flywheel_iteration_request :
  flywheel_iteration_id:flywheel_iteration_id ->
  flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  describe_flywheel_iteration_request

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

val make_dataset_augmented_manifests_list_item :
  ?document_type:augmented_manifests_document_type_format ->
  ?source_documents_s3_uri:s3_uri ->
  ?annotation_data_s3_uri:s3_uri ->
  s3_uri:s3_uri ->
  attribute_names:attribute_names_list ->
  unit ->
  dataset_augmented_manifests_list_item

val make_dataset_document_classifier_input_data_config :
  ?label_delimiter:label_delimiter ->
  s3_uri:s3_uri ->
  unit ->
  dataset_document_classifier_input_data_config

val make_dataset_entity_recognizer_annotations :
  s3_uri:s3_uri -> unit -> dataset_entity_recognizer_annotations

val make_dataset_entity_recognizer_documents :
  ?input_format:input_format -> s3_uri:s3_uri -> unit -> dataset_entity_recognizer_documents

val make_dataset_entity_recognizer_entity_list :
  s3_uri:s3_uri -> unit -> dataset_entity_recognizer_entity_list

val make_dataset_entity_recognizer_input_data_config :
  ?entity_list:dataset_entity_recognizer_entity_list ->
  ?annotations:dataset_entity_recognizer_annotations ->
  documents:dataset_entity_recognizer_documents ->
  unit ->
  dataset_entity_recognizer_input_data_config

val make_dataset_input_data_config :
  ?entity_recognizer_input_data_config:dataset_entity_recognizer_input_data_config ->
  ?document_classifier_input_data_config:dataset_document_classifier_input_data_config ->
  ?data_format:dataset_data_format ->
  ?augmented_manifests:dataset_augmented_manifests_list ->
  unit ->
  dataset_input_data_config

val make_create_flywheel_response :
  ?active_model_arn:comprehend_model_arn ->
  ?flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  create_flywheel_response

val make_create_flywheel_request :
  ?tags:tag_list ->
  ?client_request_token:client_request_token_string ->
  ?data_security_config:data_security_config ->
  ?model_type:model_type ->
  ?task_config:task_config ->
  ?active_model_arn:comprehend_model_arn ->
  data_lake_s3_uri:flywheel_s3_uri ->
  data_access_role_arn:iam_role_arn ->
  flywheel_name:comprehend_arn_name ->
  unit ->
  create_flywheel_request

val make_create_entity_recognizer_response :
  ?entity_recognizer_arn:entity_recognizer_arn -> unit -> create_entity_recognizer_response

val make_create_entity_recognizer_request :
  ?model_policy:policy ->
  ?model_kms_key_id:kms_key_id ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?tags:tag_list ->
  ?version_name:version_name ->
  language_code:language_code ->
  input_data_config:entity_recognizer_input_data_config ->
  data_access_role_arn:iam_role_arn ->
  recognizer_name:comprehend_arn_name ->
  unit ->
  create_entity_recognizer_request

val make_create_endpoint_response :
  ?model_arn:comprehend_model_arn ->
  ?endpoint_arn:comprehend_endpoint_arn ->
  unit ->
  create_endpoint_response

val make_create_endpoint_request :
  ?flywheel_arn:comprehend_flywheel_arn ->
  ?data_access_role_arn:iam_role_arn ->
  ?tags:tag_list ->
  ?client_request_token:client_request_token_string ->
  ?model_arn:comprehend_model_arn ->
  desired_inference_units:inference_units_integer ->
  endpoint_name:comprehend_endpoint_name ->
  unit ->
  create_endpoint_request

val make_create_document_classifier_response :
  ?document_classifier_arn:document_classifier_arn -> unit -> create_document_classifier_response

val make_create_document_classifier_request :
  ?model_policy:policy ->
  ?model_kms_key_id:kms_key_id ->
  ?mode:document_classifier_mode ->
  ?vpc_config:vpc_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token_string ->
  ?output_data_config:document_classifier_output_data_config ->
  ?tags:tag_list ->
  ?version_name:version_name ->
  language_code:language_code ->
  input_data_config:document_classifier_input_data_config ->
  data_access_role_arn:iam_role_arn ->
  document_classifier_name:comprehend_arn_name ->
  unit ->
  create_document_classifier_request

val make_create_dataset_response :
  ?dataset_arn:comprehend_dataset_arn -> unit -> create_dataset_response

val make_create_dataset_request :
  ?tags:tag_list ->
  ?client_request_token:client_request_token_string ->
  ?description:description ->
  ?dataset_type:dataset_type ->
  input_data_config:dataset_input_data_config ->
  dataset_name:comprehend_arn_name ->
  flywheel_arn:comprehend_flywheel_arn ->
  unit ->
  create_dataset_request

val make_contains_pii_entities_response :
  ?labels:list_of_entity_labels -> unit -> contains_pii_entities_response

val make_contains_pii_entities_request :
  language_code:language_code -> text:string_ -> unit -> contains_pii_entities_request

val make_classify_document_response :
  ?warnings:list_of_warnings ->
  ?errors:list_of_errors ->
  ?document_type:list_of_document_type ->
  ?document_metadata:document_metadata ->
  ?labels:list_of_labels ->
  ?classes:list_of_classes ->
  unit ->
  classify_document_response

val make_classify_document_request :
  ?document_reader_config:document_reader_config ->
  ?bytes:semi_structured_document_blob ->
  ?text:customer_input_string ->
  endpoint_arn:document_classifier_endpoint_arn ->
  unit ->
  classify_document_request

val make_batch_item_error :
  ?error_message:string_ -> ?error_code:string_ -> ?index:integer -> unit -> batch_item_error

val make_batch_detect_targeted_sentiment_response :
  error_list:batch_item_error_list ->
  result_list:list_of_detect_targeted_sentiment_result ->
  unit ->
  batch_detect_targeted_sentiment_response

val make_batch_detect_targeted_sentiment_request :
  language_code:language_code ->
  text_list:customer_input_string_list ->
  unit ->
  batch_detect_targeted_sentiment_request

val make_batch_detect_syntax_response :
  error_list:batch_item_error_list ->
  result_list:list_of_detect_syntax_result ->
  unit ->
  batch_detect_syntax_response

val make_batch_detect_syntax_request :
  language_code:syntax_language_code ->
  text_list:customer_input_string_list ->
  unit ->
  batch_detect_syntax_request

val make_batch_detect_sentiment_response :
  error_list:batch_item_error_list ->
  result_list:list_of_detect_sentiment_result ->
  unit ->
  batch_detect_sentiment_response

val make_batch_detect_sentiment_request :
  language_code:language_code ->
  text_list:customer_input_string_list ->
  unit ->
  batch_detect_sentiment_request

val make_batch_detect_key_phrases_response :
  error_list:batch_item_error_list ->
  result_list:list_of_detect_key_phrases_result ->
  unit ->
  batch_detect_key_phrases_response

val make_batch_detect_key_phrases_request :
  language_code:language_code ->
  text_list:customer_input_string_list ->
  unit ->
  batch_detect_key_phrases_request

val make_batch_detect_entities_response :
  error_list:batch_item_error_list ->
  result_list:list_of_detect_entities_result ->
  unit ->
  batch_detect_entities_response

val make_batch_detect_entities_request :
  language_code:language_code ->
  text_list:customer_input_string_list ->
  unit ->
  batch_detect_entities_request

val make_batch_detect_dominant_language_response :
  error_list:batch_item_error_list ->
  result_list:list_of_detect_dominant_language_result ->
  unit ->
  batch_detect_dominant_language_response

val make_batch_detect_dominant_language_request :
  text_list:customer_input_string_list -> unit -> batch_detect_dominant_language_request
