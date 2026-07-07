open Types

let make_warnings_list_item ?warn_message:(warn_message_ : string_ option)
    ?warn_code:(warn_code_ : page_based_warning_code option) ?page:(page_ : integer option) () =
  ({ warn_message = warn_message_; warn_code = warn_code_; page = page_ } : warnings_list_item)

let make_vpc_config ~subnets:(subnets_ : subnets)
    ~security_group_ids:(security_group_ids_ : security_group_ids) () =
  ({ subnets = subnets_; security_group_ids = security_group_ids_ } : vpc_config)

let make_document_classification_config ?labels:(labels_ : labels_list option)
    ~mode:(mode_ : document_classifier_mode) () =
  ({ labels = labels_; mode = mode_ } : document_classification_config)

let make_entity_types_list_item ~type_:(type__ : entity_type_name) () =
  ({ type_ = type__ } : entity_types_list_item)

let make_entity_recognition_config ~entity_types:(entity_types_ : entity_types_list) () =
  ({ entity_types = entity_types_ } : entity_recognition_config)

let make_task_config
    ?entity_recognition_config:(entity_recognition_config_ : entity_recognition_config option)
    ?document_classification_config:
      (document_classification_config_ : document_classification_config option)
    ~language_code:(language_code_ : language_code) () =
  ({
     entity_recognition_config = entity_recognition_config_;
     document_classification_config = document_classification_config_;
     language_code = language_code_;
   }
    : task_config)

let make_data_security_config ?vpc_config:(vpc_config_ : vpc_config option)
    ?data_lake_kms_key_id:(data_lake_kms_key_id_ : kms_key_id option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?model_kms_key_id:(model_kms_key_id_ : kms_key_id option) () =
  ({
     vpc_config = vpc_config_;
     data_lake_kms_key_id = data_lake_kms_key_id_;
     volume_kms_key_id = volume_kms_key_id_;
     model_kms_key_id = model_kms_key_id_;
   }
    : data_security_config)

let make_flywheel_properties
    ?latest_flywheel_iteration:(latest_flywheel_iteration_ : flywheel_iteration_id option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?model_type:(model_type_ : model_type option)
    ?status:(status_ : flywheel_status option)
    ?data_security_config:(data_security_config_ : data_security_config option)
    ?data_lake_s3_uri:(data_lake_s3_uri_ : s3_uri option)
    ?task_config:(task_config_ : task_config option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?active_model_arn:(active_model_arn_ : comprehend_model_arn option)
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option) () =
  ({
     latest_flywheel_iteration = latest_flywheel_iteration_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     message = message_;
     model_type = model_type_;
     status = status_;
     data_security_config = data_security_config_;
     data_lake_s3_uri = data_lake_s3_uri_;
     task_config = task_config_;
     data_access_role_arn = data_access_role_arn_;
     active_model_arn = active_model_arn_;
     flywheel_arn = flywheel_arn_;
   }
    : flywheel_properties)

let make_update_flywheel_response
    ?flywheel_properties:(flywheel_properties_ : flywheel_properties option) () =
  ({ flywheel_properties = flywheel_properties_ } : update_flywheel_response)

let make_update_data_security_config ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?model_kms_key_id:(model_kms_key_id_ : kms_key_id option) () =
  ({
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     model_kms_key_id = model_kms_key_id_;
   }
    : update_data_security_config)

let make_update_flywheel_request
    ?data_security_config:(data_security_config_ : update_data_security_config option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?active_model_arn:(active_model_arn_ : comprehend_model_arn option)
    ~flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn) () =
  ({
     data_security_config = data_security_config_;
     data_access_role_arn = data_access_role_arn_;
     active_model_arn = active_model_arn_;
     flywheel_arn = flywheel_arn_;
   }
    : update_flywheel_request)

let make_invalid_request_detail ?reason:(reason_ : invalid_request_detail_reason option) () =
  ({ reason = reason_ } : invalid_request_detail)

let make_update_endpoint_response
    ?desired_model_arn:(desired_model_arn_ : comprehend_model_arn option) () =
  ({ desired_model_arn = desired_model_arn_ } : update_endpoint_response)

let make_update_endpoint_request ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option)
    ?desired_data_access_role_arn:(desired_data_access_role_arn_ : iam_role_arn option)
    ?desired_inference_units:(desired_inference_units_ : inference_units_integer option)
    ?desired_model_arn:(desired_model_arn_ : comprehend_model_arn option)
    ~endpoint_arn:(endpoint_arn_ : comprehend_endpoint_arn) () =
  ({
     flywheel_arn = flywheel_arn_;
     desired_data_access_role_arn = desired_data_access_role_arn_;
     desired_inference_units = desired_inference_units_;
     desired_model_arn = desired_model_arn_;
     endpoint_arn = endpoint_arn_;
   }
    : update_endpoint_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : comprehend_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_toxic_content ?score:(score_ : float_ option) ?name:(name_ : toxic_content_type option) ()
    =
  ({ score = score_; name = name_ } : toxic_content)

let make_toxic_labels ?toxicity:(toxicity_ : float_ option)
    ?labels:(labels_ : list_of_toxic_content option) () =
  ({ toxicity = toxicity_; labels = labels_ } : toxic_labels)

let make_document_reader_config
    ?feature_types:(feature_types_ : list_of_document_read_feature_types option)
    ?document_read_mode:(document_read_mode_ : document_read_mode option)
    ~document_read_action:(document_read_action_ : document_read_action) () =
  ({
     feature_types = feature_types_;
     document_read_mode = document_read_mode_;
     document_read_action = document_read_action_;
   }
    : document_reader_config)

let make_input_data_config
    ?document_reader_config:(document_reader_config_ : document_reader_config option)
    ?input_format:(input_format_ : input_format option) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({
     document_reader_config = document_reader_config_;
     input_format = input_format_;
     s3_uri = s3_uri_;
   }
    : input_data_config)

let make_output_data_config ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_uri:(s3_uri_ : s3_uri)
    () =
  ({ kms_key_id = kms_key_id_; s3_uri = s3_uri_ } : output_data_config)

let make_topics_detection_job_properties ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?number_of_topics:(number_of_topics_ : integer option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     number_of_topics = number_of_topics_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : topics_detection_job_properties)

let make_topics_detection_job_filter ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : topics_detection_job_filter)

let make_text_segment ~text:(text_ : customer_input_string) () = ({ text = text_ } : text_segment)

let make_sentiment_score ?mixed:(mixed_ : float_ option) ?neutral:(neutral_ : float_ option)
    ?negative:(negative_ : float_ option) ?positive:(positive_ : float_ option) () =
  ({ mixed = mixed_; neutral = neutral_; negative = negative_; positive = positive_ }
    : sentiment_score)

let make_mention_sentiment ?sentiment_score:(sentiment_score_ : sentiment_score option)
    ?sentiment:(sentiment_ : sentiment_type option) () =
  ({ sentiment_score = sentiment_score_; sentiment = sentiment_ } : mention_sentiment)

let make_targeted_sentiment_mention ?end_offset:(end_offset_ : integer option)
    ?begin_offset:(begin_offset_ : integer option)
    ?mention_sentiment:(mention_sentiment_ : mention_sentiment option)
    ?type_:(type__ : targeted_sentiment_entity_type option) ?text:(text_ : string_ option)
    ?group_score:(group_score_ : float_ option) ?score:(score_ : float_ option) () =
  ({
     end_offset = end_offset_;
     begin_offset = begin_offset_;
     mention_sentiment = mention_sentiment_;
     type_ = type__;
     text = text_;
     group_score = group_score_;
     score = score_;
   }
    : targeted_sentiment_mention)

let make_targeted_sentiment_entity ?mentions:(mentions_ : list_of_mentions option)
    ?descriptive_mention_index:
      (descriptive_mention_index_ : list_of_descriptive_mention_indices option) () =
  ({ mentions = mentions_; descriptive_mention_index = descriptive_mention_index_ }
    : targeted_sentiment_entity)

let make_targeted_sentiment_detection_job_properties ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?language_code:(language_code_ : language_code option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     language_code = language_code_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : targeted_sentiment_detection_job_properties)

let make_targeted_sentiment_detection_job_filter
    ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : targeted_sentiment_detection_job_filter)

let make_tag_resource_response () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : comprehend_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_part_of_speech_tag ?score:(score_ : float_ option)
    ?tag:(tag_ : part_of_speech_tag_type option) () =
  ({ score = score_; tag = tag_ } : part_of_speech_tag)

let make_syntax_token ?part_of_speech:(part_of_speech_ : part_of_speech_tag option)
    ?end_offset:(end_offset_ : integer option) ?begin_offset:(begin_offset_ : integer option)
    ?text:(text_ : string_ option) ?token_id:(token_id_ : integer option) () =
  ({
     part_of_speech = part_of_speech_;
     end_offset = end_offset_;
     begin_offset = begin_offset_;
     text = text_;
     token_id = token_id_;
   }
    : syntax_token)

let make_stop_training_entity_recognizer_response () = (() : unit)

let make_stop_training_entity_recognizer_request
    ~entity_recognizer_arn:(entity_recognizer_arn_ : entity_recognizer_arn) () =
  ({ entity_recognizer_arn = entity_recognizer_arn_ } : stop_training_entity_recognizer_request)

let make_stop_training_document_classifier_response () = (() : unit)

let make_stop_training_document_classifier_request
    ~document_classifier_arn:(document_classifier_arn_ : document_classifier_arn) () =
  ({ document_classifier_arn = document_classifier_arn_ }
    : stop_training_document_classifier_request)

let make_stop_targeted_sentiment_detection_job_response
    ?job_status:(job_status_ : job_status option) ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : stop_targeted_sentiment_detection_job_response)

let make_stop_targeted_sentiment_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_targeted_sentiment_detection_job_request)

let make_stop_sentiment_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : stop_sentiment_detection_job_response)

let make_stop_sentiment_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_sentiment_detection_job_request)

let make_stop_pii_entities_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : stop_pii_entities_detection_job_response)

let make_stop_pii_entities_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_pii_entities_detection_job_request)

let make_stop_key_phrases_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : stop_key_phrases_detection_job_response)

let make_stop_key_phrases_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_key_phrases_detection_job_request)

let make_stop_events_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : stop_events_detection_job_response)

let make_stop_events_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_events_detection_job_request)

let make_stop_entities_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : stop_entities_detection_job_response)

let make_stop_entities_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_entities_detection_job_request)

let make_stop_dominant_language_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : stop_dominant_language_detection_job_response)

let make_stop_dominant_language_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_dominant_language_detection_job_request)

let make_start_topics_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_arn:(job_arn_ : comprehend_arn option) ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_arn = job_arn_; job_id = job_id_ }
    : start_topics_detection_job_response)

let make_start_topics_detection_job_request ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?number_of_topics:(number_of_topics_ : number_of_topics_integer option)
    ?job_name:(job_name_ : job_name option)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     tags = tags_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     client_request_token = client_request_token_;
     number_of_topics = number_of_topics_;
     job_name = job_name_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
   }
    : start_topics_detection_job_request)

let make_start_targeted_sentiment_detection_job_response
    ?job_status:(job_status_ : job_status option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_arn = job_arn_; job_id = job_id_ }
    : start_targeted_sentiment_detection_job_response)

let make_start_targeted_sentiment_detection_job_request ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?job_name:(job_name_ : job_name option) ~language_code:(language_code_ : language_code)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     tags = tags_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     client_request_token = client_request_token_;
     language_code = language_code_;
     job_name = job_name_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
   }
    : start_targeted_sentiment_detection_job_request)

let make_start_sentiment_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_arn:(job_arn_ : comprehend_arn option) ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_arn = job_arn_; job_id = job_id_ }
    : start_sentiment_detection_job_response)

let make_start_sentiment_detection_job_request ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?job_name:(job_name_ : job_name option) ~language_code:(language_code_ : language_code)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     tags = tags_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     client_request_token = client_request_token_;
     language_code = language_code_;
     job_name = job_name_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
   }
    : start_sentiment_detection_job_request)

let make_start_pii_entities_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_arn:(job_arn_ : comprehend_arn option) ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_arn = job_arn_; job_id = job_id_ }
    : start_pii_entities_detection_job_response)

let make_redaction_config ?mask_character:(mask_character_ : mask_character option)
    ?mask_mode:(mask_mode_ : pii_entities_detection_mask_mode option)
    ?pii_entity_types:(pii_entity_types_ : list_of_pii_entity_types option) () =
  ({
     mask_character = mask_character_;
     mask_mode = mask_mode_;
     pii_entity_types = pii_entity_types_;
   }
    : redaction_config)

let make_start_pii_entities_detection_job_request ?tags:(tags_ : tag_list option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?job_name:(job_name_ : job_name option)
    ?redaction_config:(redaction_config_ : redaction_config option)
    ~language_code:(language_code_ : language_code)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~mode:(mode_ : pii_entities_detection_mode)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     tags = tags_;
     client_request_token = client_request_token_;
     language_code = language_code_;
     job_name = job_name_;
     data_access_role_arn = data_access_role_arn_;
     redaction_config = redaction_config_;
     mode = mode_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
   }
    : start_pii_entities_detection_job_request)

let make_start_key_phrases_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_arn:(job_arn_ : comprehend_arn option) ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_arn = job_arn_; job_id = job_id_ }
    : start_key_phrases_detection_job_response)

let make_start_key_phrases_detection_job_request ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?job_name:(job_name_ : job_name option) ~language_code:(language_code_ : language_code)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     tags = tags_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     client_request_token = client_request_token_;
     language_code = language_code_;
     job_name = job_name_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
   }
    : start_key_phrases_detection_job_request)

let make_start_flywheel_iteration_response
    ?flywheel_iteration_id:(flywheel_iteration_id_ : flywheel_iteration_id option)
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option) () =
  ({ flywheel_iteration_id = flywheel_iteration_id_; flywheel_arn = flywheel_arn_ }
    : start_flywheel_iteration_response)

let make_start_flywheel_iteration_request
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ~flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn) () =
  ({ client_request_token = client_request_token_; flywheel_arn = flywheel_arn_ }
    : start_flywheel_iteration_request)

let make_start_events_detection_job_response ?job_status:(job_status_ : job_status option)
    ?job_arn:(job_arn_ : comprehend_arn option) ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_arn = job_arn_; job_id = job_id_ }
    : start_events_detection_job_response)

let make_start_events_detection_job_request ?tags:(tags_ : tag_list option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?job_name:(job_name_ : job_name option)
    ~target_event_types:(target_event_types_ : target_event_types)
    ~language_code:(language_code_ : language_code)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     tags = tags_;
     target_event_types = target_event_types_;
     client_request_token = client_request_token_;
     language_code = language_code_;
     job_name = job_name_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
   }
    : start_events_detection_job_request)

let make_start_entities_detection_job_response
    ?entity_recognizer_arn:(entity_recognizer_arn_ : entity_recognizer_arn option)
    ?job_status:(job_status_ : job_status option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     entity_recognizer_arn = entity_recognizer_arn_;
     job_status = job_status_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : start_entities_detection_job_response)

let make_start_entities_detection_job_request
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option) ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?entity_recognizer_arn:(entity_recognizer_arn_ : entity_recognizer_arn option)
    ?job_name:(job_name_ : job_name option) ~language_code:(language_code_ : language_code)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     flywheel_arn = flywheel_arn_;
     tags = tags_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     client_request_token = client_request_token_;
     language_code = language_code_;
     entity_recognizer_arn = entity_recognizer_arn_;
     job_name = job_name_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
   }
    : start_entities_detection_job_request)

let make_start_dominant_language_detection_job_response
    ?job_status:(job_status_ : job_status option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_arn = job_arn_; job_id = job_id_ }
    : start_dominant_language_detection_job_response)

let make_start_dominant_language_detection_job_request ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?job_name:(job_name_ : job_name option)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     tags = tags_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     client_request_token = client_request_token_;
     job_name = job_name_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
   }
    : start_dominant_language_detection_job_request)

let make_start_document_classification_job_response
    ?document_classifier_arn:(document_classifier_arn_ : document_classifier_arn option)
    ?job_status:(job_status_ : job_status option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     document_classifier_arn = document_classifier_arn_;
     job_status = job_status_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : start_document_classification_job_response)

let make_start_document_classification_job_request
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option) ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?document_classifier_arn:(document_classifier_arn_ : document_classifier_arn option)
    ?job_name:(job_name_ : job_name option)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     flywheel_arn = flywheel_arn_;
     tags = tags_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     client_request_token = client_request_token_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     document_classifier_arn = document_classifier_arn_;
     job_name = job_name_;
   }
    : start_document_classification_job_request)

let make_sentiment_detection_job_properties ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?language_code:(language_code_ : language_code option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     language_code = language_code_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : sentiment_detection_job_properties)

let make_sentiment_detection_job_filter ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : sentiment_detection_job_filter)

let make_relationships_list_item ?type_:(type__ : relationship_type option)
    ?ids:(ids_ : string_list option) () =
  ({ type_ = type__; ids = ids_ } : relationships_list_item)

let make_put_resource_policy_response
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option) () =
  ({ policy_revision_id = policy_revision_id_ } : put_resource_policy_response)

let make_put_resource_policy_request
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option)
    ~resource_policy:(resource_policy_ : policy)
    ~resource_arn:(resource_arn_ : comprehend_model_arn) () =
  ({
     policy_revision_id = policy_revision_id_;
     resource_policy = resource_policy_;
     resource_arn = resource_arn_;
   }
    : put_resource_policy_request)

let make_point ?y:(y_ : float_ option) ?x:(x_ : float_ option) () = ({ y = y_; x = x_ } : point)

let make_pii_output_data_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ kms_key_id = kms_key_id_; s3_uri = s3_uri_ } : pii_output_data_config)

let make_pii_entity ?end_offset:(end_offset_ : integer option)
    ?begin_offset:(begin_offset_ : integer option) ?type_:(type__ : pii_entity_type option)
    ?score:(score_ : float_ option) () =
  ({ end_offset = end_offset_; begin_offset = begin_offset_; type_ = type__; score = score_ }
    : pii_entity)

let make_pii_entities_detection_job_properties ?mode:(mode_ : pii_entities_detection_mode option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?language_code:(language_code_ : language_code option)
    ?redaction_config:(redaction_config_ : redaction_config option)
    ?output_data_config:(output_data_config_ : pii_output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     mode = mode_;
     data_access_role_arn = data_access_role_arn_;
     language_code = language_code_;
     redaction_config = redaction_config_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : pii_entities_detection_job_properties)

let make_pii_entities_detection_job_filter
    ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : pii_entities_detection_job_filter)

let make_list_topics_detection_jobs_response ?next_token:(next_token_ : string_ option)
    ?topics_detection_job_properties_list:
      (topics_detection_job_properties_list_ : topics_detection_job_properties_list option) () =
  ({
     next_token = next_token_;
     topics_detection_job_properties_list = topics_detection_job_properties_list_;
   }
    : list_topics_detection_jobs_response)

let make_list_topics_detection_jobs_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : topics_detection_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_topics_detection_jobs_request)

let make_list_targeted_sentiment_detection_jobs_response ?next_token:(next_token_ : string_ option)
    ?targeted_sentiment_detection_job_properties_list:
      (targeted_sentiment_detection_job_properties_list_ :
         targeted_sentiment_detection_job_properties_list option) () =
  ({
     next_token = next_token_;
     targeted_sentiment_detection_job_properties_list =
       targeted_sentiment_detection_job_properties_list_;
   }
    : list_targeted_sentiment_detection_jobs_response)

let make_list_targeted_sentiment_detection_jobs_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : targeted_sentiment_detection_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_targeted_sentiment_detection_jobs_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
    ?resource_arn:(resource_arn_ : comprehend_arn option) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : comprehend_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_sentiment_detection_jobs_response ?next_token:(next_token_ : string_ option)
    ?sentiment_detection_job_properties_list:
      (sentiment_detection_job_properties_list_ : sentiment_detection_job_properties_list option) ()
    =
  ({
     next_token = next_token_;
     sentiment_detection_job_properties_list = sentiment_detection_job_properties_list_;
   }
    : list_sentiment_detection_jobs_response)

let make_list_sentiment_detection_jobs_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : sentiment_detection_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_sentiment_detection_jobs_request)

let make_list_pii_entities_detection_jobs_response ?next_token:(next_token_ : string_ option)
    ?pii_entities_detection_job_properties_list:
      (pii_entities_detection_job_properties_list_ :
         pii_entities_detection_job_properties_list option) () =
  ({
     next_token = next_token_;
     pii_entities_detection_job_properties_list = pii_entities_detection_job_properties_list_;
   }
    : list_pii_entities_detection_jobs_response)

let make_list_pii_entities_detection_jobs_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : pii_entities_detection_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_pii_entities_detection_jobs_request)

let make_document_label ?page:(page_ : integer option) ?score:(score_ : float_ option)
    ?name:(name_ : string_ option) () =
  ({ page = page_; score = score_; name = name_ } : document_label)

let make_key_phrase ?end_offset:(end_offset_ : integer option)
    ?begin_offset:(begin_offset_ : integer option) ?text:(text_ : string_ option)
    ?score:(score_ : float_ option) () =
  ({ end_offset = end_offset_; begin_offset = begin_offset_; text = text_; score = score_ }
    : key_phrase)

let make_extracted_characters_list_item ?count:(count_ : integer option)
    ?page:(page_ : integer option) () =
  ({ count = count_; page = page_ } : extracted_characters_list_item)

let make_errors_list_item ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : page_based_error_code option) ?page:(page_ : integer option) () =
  ({ error_message = error_message_; error_code = error_code_; page = page_ } : errors_list_item)

let make_entity_label ?score:(score_ : float_ option) ?name:(name_ : pii_entity_type option) () =
  ({ score = score_; name = name_ } : entity_label)

let make_child_block ?end_offset:(end_offset_ : integer option)
    ?begin_offset:(begin_offset_ : integer option)
    ?child_block_id:(child_block_id_ : string_ option) () =
  ({ end_offset = end_offset_; begin_offset = begin_offset_; child_block_id = child_block_id_ }
    : child_block)

let make_block_reference ?child_blocks:(child_blocks_ : list_of_child_blocks option)
    ?end_offset:(end_offset_ : integer option) ?begin_offset:(begin_offset_ : integer option)
    ?block_id:(block_id_ : string_ option) () =
  ({
     child_blocks = child_blocks_;
     end_offset = end_offset_;
     begin_offset = begin_offset_;
     block_id = block_id_;
   }
    : block_reference)

let make_entity ?block_references:(block_references_ : list_of_block_references option)
    ?end_offset:(end_offset_ : integer option) ?begin_offset:(begin_offset_ : integer option)
    ?text:(text_ : string_ option) ?type_:(type__ : entity_type option)
    ?score:(score_ : float_ option) () =
  ({
     block_references = block_references_;
     end_offset = end_offset_;
     begin_offset = begin_offset_;
     text = text_;
     type_ = type__;
     score = score_;
   }
    : entity)

let make_dominant_language ?score:(score_ : float_ option)
    ?language_code:(language_code_ : string_ option) () =
  ({ score = score_; language_code = language_code_ } : dominant_language)

let make_document_type_list_item ?type_:(type__ : document_type option)
    ?page:(page_ : integer option) () =
  ({ type_ = type__; page = page_ } : document_type_list_item)

let make_document_class ?page:(page_ : integer option) ?score:(score_ : float_ option)
    ?name:(name_ : string_ option) () =
  ({ page = page_; score = score_; name = name_ } : document_class)

let make_bounding_box ?width:(width_ : float_ option) ?top:(top_ : float_ option)
    ?left:(left_ : float_ option) ?height:(height_ : float_ option) () =
  ({ width = width_; top = top_; left = left_; height = height_ } : bounding_box)

let make_geometry ?polygon:(polygon_ : polygon option)
    ?bounding_box:(bounding_box_ : bounding_box option) () =
  ({ polygon = polygon_; bounding_box = bounding_box_ } : geometry)

let make_block ?relationships:(relationships_ : list_of_relationships option)
    ?geometry:(geometry_ : geometry option) ?page:(page_ : integer option)
    ?text:(text_ : string_ option) ?block_type:(block_type_ : block_type option)
    ?id:(id_ : string_ option) () =
  ({
     relationships = relationships_;
     geometry = geometry_;
     page = page_;
     text = text_;
     block_type = block_type_;
     id = id_;
   }
    : block)

let make_key_phrases_detection_job_properties ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?language_code:(language_code_ : language_code option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     language_code = language_code_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : key_phrases_detection_job_properties)

let make_list_key_phrases_detection_jobs_response ?next_token:(next_token_ : string_ option)
    ?key_phrases_detection_job_properties_list:
      (key_phrases_detection_job_properties_list_ : key_phrases_detection_job_properties_list option)
    () =
  ({
     next_token = next_token_;
     key_phrases_detection_job_properties_list = key_phrases_detection_job_properties_list_;
   }
    : list_key_phrases_detection_jobs_response)

let make_key_phrases_detection_job_filter ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : key_phrases_detection_job_filter)

let make_list_key_phrases_detection_jobs_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : key_phrases_detection_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_key_phrases_detection_jobs_request)

let make_flywheel_summary
    ?latest_flywheel_iteration:(latest_flywheel_iteration_ : flywheel_iteration_id option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?model_type:(model_type_ : model_type option)
    ?status:(status_ : flywheel_status option) ?data_lake_s3_uri:(data_lake_s3_uri_ : s3_uri option)
    ?active_model_arn:(active_model_arn_ : comprehend_model_arn option)
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option) () =
  ({
     latest_flywheel_iteration = latest_flywheel_iteration_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     message = message_;
     model_type = model_type_;
     status = status_;
     data_lake_s3_uri = data_lake_s3_uri_;
     active_model_arn = active_model_arn_;
     flywheel_arn = flywheel_arn_;
   }
    : flywheel_summary)

let make_list_flywheels_response ?next_token:(next_token_ : string_ option)
    ?flywheel_summary_list:(flywheel_summary_list_ : flywheel_summary_list option) () =
  ({ next_token = next_token_; flywheel_summary_list = flywheel_summary_list_ }
    : list_flywheels_response)

let make_flywheel_filter ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?status:(status_ : flywheel_status option) () =
  ({
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     status = status_;
   }
    : flywheel_filter)

let make_list_flywheels_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option) ?filter:(filter_ : flywheel_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_flywheels_request)

let make_flywheel_model_evaluation_metrics ?average_accuracy:(average_accuracy_ : double option)
    ?average_recall:(average_recall_ : double option)
    ?average_precision:(average_precision_ : double option)
    ?average_f1_score:(average_f1_score_ : double option) () =
  ({
     average_accuracy = average_accuracy_;
     average_recall = average_recall_;
     average_precision = average_precision_;
     average_f1_score = average_f1_score_;
   }
    : flywheel_model_evaluation_metrics)

let make_flywheel_iteration_properties
    ?evaluation_manifest_s3_prefix:(evaluation_manifest_s3_prefix_ : s3_uri option)
    ?trained_model_metrics:(trained_model_metrics_ : flywheel_model_evaluation_metrics option)
    ?trained_model_arn:(trained_model_arn_ : comprehend_model_arn option)
    ?evaluated_model_metrics:(evaluated_model_metrics_ : flywheel_model_evaluation_metrics option)
    ?evaluated_model_arn:(evaluated_model_arn_ : comprehend_model_arn option)
    ?message:(message_ : any_length_string option)
    ?status:(status_ : flywheel_iteration_status option) ?end_time:(end_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?flywheel_iteration_id:(flywheel_iteration_id_ : flywheel_iteration_id option)
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option) () =
  ({
     evaluation_manifest_s3_prefix = evaluation_manifest_s3_prefix_;
     trained_model_metrics = trained_model_metrics_;
     trained_model_arn = trained_model_arn_;
     evaluated_model_metrics = evaluated_model_metrics_;
     evaluated_model_arn = evaluated_model_arn_;
     message = message_;
     status = status_;
     end_time = end_time_;
     creation_time = creation_time_;
     flywheel_iteration_id = flywheel_iteration_id_;
     flywheel_arn = flywheel_arn_;
   }
    : flywheel_iteration_properties)

let make_list_flywheel_iteration_history_response ?next_token:(next_token_ : string_ option)
    ?flywheel_iteration_properties_list:
      (flywheel_iteration_properties_list_ : flywheel_iteration_properties_list option) () =
  ({
     next_token = next_token_;
     flywheel_iteration_properties_list = flywheel_iteration_properties_list_;
   }
    : list_flywheel_iteration_history_response)

let make_flywheel_iteration_filter ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({ creation_time_before = creation_time_before_; creation_time_after = creation_time_after_ }
    : flywheel_iteration_filter)

let make_list_flywheel_iteration_history_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option) ?filter:(filter_ : flywheel_iteration_filter option)
    ~flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     flywheel_arn = flywheel_arn_;
   }
    : list_flywheel_iteration_history_request)

let make_events_detection_job_properties
    ?target_event_types:(target_event_types_ : target_event_types option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?language_code:(language_code_ : language_code option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     target_event_types = target_event_types_;
     data_access_role_arn = data_access_role_arn_;
     language_code = language_code_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : events_detection_job_properties)

let make_list_events_detection_jobs_response ?next_token:(next_token_ : string_ option)
    ?events_detection_job_properties_list:
      (events_detection_job_properties_list_ : events_detection_job_properties_list option) () =
  ({
     next_token = next_token_;
     events_detection_job_properties_list = events_detection_job_properties_list_;
   }
    : list_events_detection_jobs_response)

let make_events_detection_job_filter ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : events_detection_job_filter)

let make_list_events_detection_jobs_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : events_detection_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_events_detection_jobs_request)

let make_entity_recognizer_documents ?input_format:(input_format_ : input_format option)
    ?test_s3_uri:(test_s3_uri_ : s3_uri option) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ input_format = input_format_; test_s3_uri = test_s3_uri_; s3_uri = s3_uri_ }
    : entity_recognizer_documents)

let make_entity_recognizer_annotations ?test_s3_uri:(test_s3_uri_ : s3_uri option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ test_s3_uri = test_s3_uri_; s3_uri = s3_uri_ } : entity_recognizer_annotations)

let make_entity_recognizer_entity_list ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : entity_recognizer_entity_list)

let make_augmented_manifests_list_item
    ?document_type:(document_type_ : augmented_manifests_document_type_format option)
    ?source_documents_s3_uri:(source_documents_s3_uri_ : s3_uri option)
    ?annotation_data_s3_uri:(annotation_data_s3_uri_ : s3_uri option) ?split:(split_ : split option)
    ~attribute_names:(attribute_names_ : attribute_names_list) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({
     document_type = document_type_;
     source_documents_s3_uri = source_documents_s3_uri_;
     annotation_data_s3_uri = annotation_data_s3_uri_;
     attribute_names = attribute_names_;
     split = split_;
     s3_uri = s3_uri_;
   }
    : augmented_manifests_list_item)

let make_entity_recognizer_input_data_config
    ?augmented_manifests:(augmented_manifests_ : entity_recognizer_augmented_manifests_list option)
    ?entity_list:(entity_list_ : entity_recognizer_entity_list option)
    ?annotations:(annotations_ : entity_recognizer_annotations option)
    ?documents:(documents_ : entity_recognizer_documents option)
    ?data_format:(data_format_ : entity_recognizer_data_format option)
    ~entity_types:(entity_types_ : entity_types_list) () =
  ({
     augmented_manifests = augmented_manifests_;
     entity_list = entity_list_;
     annotations = annotations_;
     documents = documents_;
     entity_types = entity_types_;
     data_format = data_format_;
   }
    : entity_recognizer_input_data_config)

let make_entity_recognizer_evaluation_metrics ?f1_score:(f1_score_ : double option)
    ?recall:(recall_ : double option) ?precision:(precision_ : double option) () =
  ({ f1_score = f1_score_; recall = recall_; precision = precision_ }
    : entity_recognizer_evaluation_metrics)

let make_entity_types_evaluation_metrics ?f1_score:(f1_score_ : double option)
    ?recall:(recall_ : double option) ?precision:(precision_ : double option) () =
  ({ f1_score = f1_score_; recall = recall_; precision = precision_ }
    : entity_types_evaluation_metrics)

let make_entity_recognizer_metadata_entity_types_list_item
    ?number_of_train_mentions:(number_of_train_mentions_ : integer option)
    ?evaluation_metrics:(evaluation_metrics_ : entity_types_evaluation_metrics option)
    ?type_:(type__ : any_length_string option) () =
  ({
     number_of_train_mentions = number_of_train_mentions_;
     evaluation_metrics = evaluation_metrics_;
     type_ = type__;
   }
    : entity_recognizer_metadata_entity_types_list_item)

let make_entity_recognizer_metadata
    ?entity_types:(entity_types_ : entity_recognizer_metadata_entity_types_list option)
    ?evaluation_metrics:(evaluation_metrics_ : entity_recognizer_evaluation_metrics option)
    ?number_of_test_documents:(number_of_test_documents_ : integer option)
    ?number_of_trained_documents:(number_of_trained_documents_ : integer option) () =
  ({
     entity_types = entity_types_;
     evaluation_metrics = evaluation_metrics_;
     number_of_test_documents = number_of_test_documents_;
     number_of_trained_documents = number_of_trained_documents_;
   }
    : entity_recognizer_metadata)

let make_entity_recognizer_output_data_config
    ?flywheel_stats_s3_prefix:(flywheel_stats_s3_prefix_ : s3_uri option) () =
  ({ flywheel_stats_s3_prefix = flywheel_stats_s3_prefix_ } : entity_recognizer_output_data_config)

let make_entity_recognizer_properties
    ?output_data_config:(output_data_config_ : entity_recognizer_output_data_config option)
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option)
    ?source_model_arn:(source_model_arn_ : entity_recognizer_arn option)
    ?version_name:(version_name_ : version_name option)
    ?model_kms_key_id:(model_kms_key_id_ : kms_key_id option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?recognizer_metadata:(recognizer_metadata_ : entity_recognizer_metadata option)
    ?input_data_config:(input_data_config_ : entity_recognizer_input_data_config option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ?training_start_time:(training_start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?status:(status_ : model_status option)
    ?language_code:(language_code_ : language_code option)
    ?entity_recognizer_arn:(entity_recognizer_arn_ : entity_recognizer_arn option) () =
  ({
     output_data_config = output_data_config_;
     flywheel_arn = flywheel_arn_;
     source_model_arn = source_model_arn_;
     version_name = version_name_;
     model_kms_key_id = model_kms_key_id_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     recognizer_metadata = recognizer_metadata_;
     input_data_config = input_data_config_;
     training_end_time = training_end_time_;
     training_start_time = training_start_time_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     status = status_;
     language_code = language_code_;
     entity_recognizer_arn = entity_recognizer_arn_;
   }
    : entity_recognizer_properties)

let make_list_entity_recognizers_response ?next_token:(next_token_ : string_ option)
    ?entity_recognizer_properties_list:
      (entity_recognizer_properties_list_ : entity_recognizer_properties_list option) () =
  ({
     next_token = next_token_;
     entity_recognizer_properties_list = entity_recognizer_properties_list_;
   }
    : list_entity_recognizers_response)

let make_entity_recognizer_filter ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?recognizer_name:(recognizer_name_ : comprehend_arn_name option)
    ?status:(status_ : model_status option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     recognizer_name = recognizer_name_;
     status = status_;
   }
    : entity_recognizer_filter)

let make_list_entity_recognizers_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option) ?filter:(filter_ : entity_recognizer_filter option)
    () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_entity_recognizers_request)

let make_entity_recognizer_summary
    ?latest_version_status:(latest_version_status_ : model_status option)
    ?latest_version_name:(latest_version_name_ : version_name option)
    ?latest_version_created_at:(latest_version_created_at_ : timestamp option)
    ?number_of_versions:(number_of_versions_ : integer option)
    ?recognizer_name:(recognizer_name_ : comprehend_arn_name option) () =
  ({
     latest_version_status = latest_version_status_;
     latest_version_name = latest_version_name_;
     latest_version_created_at = latest_version_created_at_;
     number_of_versions = number_of_versions_;
     recognizer_name = recognizer_name_;
   }
    : entity_recognizer_summary)

let make_list_entity_recognizer_summaries_response ?next_token:(next_token_ : string_ option)
    ?entity_recognizer_summaries_list:
      (entity_recognizer_summaries_list_ : entity_recognizer_summaries_list option) () =
  ({
     next_token = next_token_;
     entity_recognizer_summaries_list = entity_recognizer_summaries_list_;
   }
    : list_entity_recognizer_summaries_response)

let make_list_entity_recognizer_summaries_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_entity_recognizer_summaries_request)

let make_entities_detection_job_properties
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?language_code:(language_code_ : language_code option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?entity_recognizer_arn:(entity_recognizer_arn_ : entity_recognizer_arn option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     flywheel_arn = flywheel_arn_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     language_code = language_code_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     entity_recognizer_arn = entity_recognizer_arn_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : entities_detection_job_properties)

let make_list_entities_detection_jobs_response ?next_token:(next_token_ : string_ option)
    ?entities_detection_job_properties_list:
      (entities_detection_job_properties_list_ : entities_detection_job_properties_list option) () =
  ({
     next_token = next_token_;
     entities_detection_job_properties_list = entities_detection_job_properties_list_;
   }
    : list_entities_detection_jobs_response)

let make_entities_detection_job_filter ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : entities_detection_job_filter)

let make_list_entities_detection_jobs_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : entities_detection_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_entities_detection_jobs_request)

let make_endpoint_properties ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option)
    ?desired_data_access_role_arn:(desired_data_access_role_arn_ : iam_role_arn option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?current_inference_units:(current_inference_units_ : inference_units_integer option)
    ?desired_inference_units:(desired_inference_units_ : inference_units_integer option)
    ?desired_model_arn:(desired_model_arn_ : comprehend_model_arn option)
    ?model_arn:(model_arn_ : comprehend_model_arn option)
    ?message:(message_ : any_length_string option) ?status:(status_ : endpoint_status option)
    ?endpoint_arn:(endpoint_arn_ : comprehend_endpoint_arn option) () =
  ({
     flywheel_arn = flywheel_arn_;
     desired_data_access_role_arn = desired_data_access_role_arn_;
     data_access_role_arn = data_access_role_arn_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     current_inference_units = current_inference_units_;
     desired_inference_units = desired_inference_units_;
     desired_model_arn = desired_model_arn_;
     model_arn = model_arn_;
     message = message_;
     status = status_;
     endpoint_arn = endpoint_arn_;
   }
    : endpoint_properties)

let make_list_endpoints_response ?next_token:(next_token_ : string_ option)
    ?endpoint_properties_list:(endpoint_properties_list_ : endpoint_properties_list option) () =
  ({ next_token = next_token_; endpoint_properties_list = endpoint_properties_list_ }
    : list_endpoints_response)

let make_endpoint_filter ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?status:(status_ : endpoint_status option) ?model_arn:(model_arn_ : comprehend_model_arn option)
    () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     status = status_;
     model_arn = model_arn_;
   }
    : endpoint_filter)

let make_list_endpoints_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option) ?filter:(filter_ : endpoint_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_endpoints_request)

let make_dominant_language_detection_job_properties ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : dominant_language_detection_job_properties)

let make_list_dominant_language_detection_jobs_response ?next_token:(next_token_ : string_ option)
    ?dominant_language_detection_job_properties_list:
      (dominant_language_detection_job_properties_list_ :
         dominant_language_detection_job_properties_list option) () =
  ({
     next_token = next_token_;
     dominant_language_detection_job_properties_list =
       dominant_language_detection_job_properties_list_;
   }
    : list_dominant_language_detection_jobs_response)

let make_dominant_language_detection_job_filter
    ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : dominant_language_detection_job_filter)

let make_list_dominant_language_detection_jobs_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : dominant_language_detection_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_dominant_language_detection_jobs_request)

let make_document_classifier_documents ?test_s3_uri:(test_s3_uri_ : s3_uri option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ test_s3_uri = test_s3_uri_; s3_uri = s3_uri_ } : document_classifier_documents)

let make_document_classifier_input_data_config
    ?document_reader_config:(document_reader_config_ : document_reader_config option)
    ?documents:(documents_ : document_classifier_documents option)
    ?document_type:(document_type_ : document_classifier_document_type_format option)
    ?augmented_manifests:
      (augmented_manifests_ : document_classifier_augmented_manifests_list option)
    ?label_delimiter:(label_delimiter_ : label_delimiter option)
    ?test_s3_uri:(test_s3_uri_ : s3_uri option) ?s3_uri:(s3_uri_ : s3_uri option)
    ?data_format:(data_format_ : document_classifier_data_format option) () =
  ({
     document_reader_config = document_reader_config_;
     documents = documents_;
     document_type = document_type_;
     augmented_manifests = augmented_manifests_;
     label_delimiter = label_delimiter_;
     test_s3_uri = test_s3_uri_;
     s3_uri = s3_uri_;
     data_format = data_format_;
   }
    : document_classifier_input_data_config)

let make_document_classifier_output_data_config
    ?flywheel_stats_s3_prefix:(flywheel_stats_s3_prefix_ : s3_uri option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({
     flywheel_stats_s3_prefix = flywheel_stats_s3_prefix_;
     kms_key_id = kms_key_id_;
     s3_uri = s3_uri_;
   }
    : document_classifier_output_data_config)

let make_classifier_evaluation_metrics ?hamming_loss:(hamming_loss_ : double option)
    ?micro_f1_score:(micro_f1_score_ : double option) ?micro_recall:(micro_recall_ : double option)
    ?micro_precision:(micro_precision_ : double option) ?f1_score:(f1_score_ : double option)
    ?recall:(recall_ : double option) ?precision:(precision_ : double option)
    ?accuracy:(accuracy_ : double option) () =
  ({
     hamming_loss = hamming_loss_;
     micro_f1_score = micro_f1_score_;
     micro_recall = micro_recall_;
     micro_precision = micro_precision_;
     f1_score = f1_score_;
     recall = recall_;
     precision = precision_;
     accuracy = accuracy_;
   }
    : classifier_evaluation_metrics)

let make_classifier_metadata
    ?evaluation_metrics:(evaluation_metrics_ : classifier_evaluation_metrics option)
    ?number_of_test_documents:(number_of_test_documents_ : integer option)
    ?number_of_trained_documents:(number_of_trained_documents_ : integer option)
    ?number_of_labels:(number_of_labels_ : integer option) () =
  ({
     evaluation_metrics = evaluation_metrics_;
     number_of_test_documents = number_of_test_documents_;
     number_of_trained_documents = number_of_trained_documents_;
     number_of_labels = number_of_labels_;
   }
    : classifier_metadata)

let make_document_classifier_properties
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option)
    ?source_model_arn:(source_model_arn_ : document_classifier_arn option)
    ?version_name:(version_name_ : version_name option)
    ?model_kms_key_id:(model_kms_key_id_ : kms_key_id option)
    ?mode:(mode_ : document_classifier_mode option) ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?classifier_metadata:(classifier_metadata_ : classifier_metadata option)
    ?output_data_config:(output_data_config_ : document_classifier_output_data_config option)
    ?input_data_config:(input_data_config_ : document_classifier_input_data_config option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ?training_start_time:(training_start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?status:(status_ : model_status option)
    ?language_code:(language_code_ : language_code option)
    ?document_classifier_arn:(document_classifier_arn_ : document_classifier_arn option) () =
  ({
     flywheel_arn = flywheel_arn_;
     source_model_arn = source_model_arn_;
     version_name = version_name_;
     model_kms_key_id = model_kms_key_id_;
     mode = mode_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     classifier_metadata = classifier_metadata_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     training_end_time = training_end_time_;
     training_start_time = training_start_time_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     status = status_;
     language_code = language_code_;
     document_classifier_arn = document_classifier_arn_;
   }
    : document_classifier_properties)

let make_list_document_classifiers_response ?next_token:(next_token_ : string_ option)
    ?document_classifier_properties_list:
      (document_classifier_properties_list_ : document_classifier_properties_list option) () =
  ({
     next_token = next_token_;
     document_classifier_properties_list = document_classifier_properties_list_;
   }
    : list_document_classifiers_response)

let make_document_classifier_filter ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?document_classifier_name:(document_classifier_name_ : comprehend_arn_name option)
    ?status:(status_ : model_status option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     document_classifier_name = document_classifier_name_;
     status = status_;
   }
    : document_classifier_filter)

let make_list_document_classifiers_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option) ?filter:(filter_ : document_classifier_filter option)
    () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_document_classifiers_request)

let make_document_classifier_summary
    ?latest_version_status:(latest_version_status_ : model_status option)
    ?latest_version_name:(latest_version_name_ : version_name option)
    ?latest_version_created_at:(latest_version_created_at_ : timestamp option)
    ?number_of_versions:(number_of_versions_ : integer option)
    ?document_classifier_name:(document_classifier_name_ : comprehend_arn_name option) () =
  ({
     latest_version_status = latest_version_status_;
     latest_version_name = latest_version_name_;
     latest_version_created_at = latest_version_created_at_;
     number_of_versions = number_of_versions_;
     document_classifier_name = document_classifier_name_;
   }
    : document_classifier_summary)

let make_list_document_classifier_summaries_response ?next_token:(next_token_ : string_ option)
    ?document_classifier_summaries_list:
      (document_classifier_summaries_list_ : document_classifier_summaries_list option) () =
  ({
     next_token = next_token_;
     document_classifier_summaries_list = document_classifier_summaries_list_;
   }
    : list_document_classifier_summaries_response)

let make_list_document_classifier_summaries_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_document_classifier_summaries_request)

let make_document_classification_job_properties
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?document_classifier_arn:(document_classifier_arn_ : document_classifier_arn option)
    ?end_time:(end_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?message:(message_ : any_length_string option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : comprehend_arn option)
    ?job_id:(job_id_ : job_id option) () =
  ({
     flywheel_arn = flywheel_arn_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     document_classifier_arn = document_classifier_arn_;
     end_time = end_time_;
     submit_time = submit_time_;
     message = message_;
     job_status = job_status_;
     job_name = job_name_;
     job_arn = job_arn_;
     job_id = job_id_;
   }
    : document_classification_job_properties)

let make_list_document_classification_jobs_response ?next_token:(next_token_ : string_ option)
    ?document_classification_job_properties_list:
      (document_classification_job_properties_list_ :
         document_classification_job_properties_list option) () =
  ({
     next_token = next_token_;
     document_classification_job_properties_list = document_classification_job_properties_list_;
   }
    : list_document_classification_jobs_response)

let make_document_classification_job_filter
    ?submit_time_after:(submit_time_after_ : timestamp option)
    ?submit_time_before:(submit_time_before_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submit_time_after = submit_time_after_;
     submit_time_before = submit_time_before_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : document_classification_job_filter)

let make_list_document_classification_jobs_request
    ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : document_classification_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_document_classification_jobs_request)

let make_dataset_properties ?end_time:(end_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?number_of_documents:(number_of_documents_ : number_of_documents option)
    ?message:(message_ : any_length_string option) ?status:(status_ : dataset_status option)
    ?description:(description_ : description option)
    ?dataset_s3_uri:(dataset_s3_uri_ : s3_uri option)
    ?dataset_type:(dataset_type_ : dataset_type option)
    ?dataset_name:(dataset_name_ : comprehend_arn_name option)
    ?dataset_arn:(dataset_arn_ : comprehend_dataset_arn option) () =
  ({
     end_time = end_time_;
     creation_time = creation_time_;
     number_of_documents = number_of_documents_;
     message = message_;
     status = status_;
     description = description_;
     dataset_s3_uri = dataset_s3_uri_;
     dataset_type = dataset_type_;
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
   }
    : dataset_properties)

let make_list_datasets_response ?next_token:(next_token_ : string_ option)
    ?dataset_properties_list:(dataset_properties_list_ : dataset_properties_list option) () =
  ({ next_token = next_token_; dataset_properties_list = dataset_properties_list_ }
    : list_datasets_response)

let make_dataset_filter ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?dataset_type:(dataset_type_ : dataset_type option) ?status:(status_ : dataset_status option) ()
    =
  ({
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     dataset_type = dataset_type_;
     status = status_;
   }
    : dataset_filter)

let make_list_datasets_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : string_ option) ?filter:(filter_ : dataset_filter option)
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     flywheel_arn = flywheel_arn_;
   }
    : list_datasets_request)

let make_import_model_response ?model_arn:(model_arn_ : comprehend_model_arn option) () =
  ({ model_arn = model_arn_ } : import_model_response)

let make_import_model_request ?tags:(tags_ : tag_list option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?model_kms_key_id:(model_kms_key_id_ : kms_key_id option)
    ?version_name:(version_name_ : version_name option)
    ?model_name:(model_name_ : comprehend_arn_name option)
    ~source_model_arn:(source_model_arn_ : comprehend_model_arn) () =
  ({
     tags = tags_;
     data_access_role_arn = data_access_role_arn_;
     model_kms_key_id = model_kms_key_id_;
     version_name = version_name_;
     model_name = model_name_;
     source_model_arn = source_model_arn_;
   }
    : import_model_request)

let make_document_metadata
    ?extracted_characters:(extracted_characters_ : list_of_extracted_characters option)
    ?pages:(pages_ : integer option) () =
  ({ extracted_characters = extracted_characters_; pages = pages_ } : document_metadata)

let make_detect_toxic_content_response ?result_list:(result_list_ : list_of_toxic_labels option) ()
    =
  ({ result_list = result_list_ } : detect_toxic_content_response)

let make_detect_toxic_content_request ~language_code:(language_code_ : language_code)
    ~text_segments:(text_segments_ : list_of_text_segments) () =
  ({ language_code = language_code_; text_segments = text_segments_ }
    : detect_toxic_content_request)

let make_detect_targeted_sentiment_response
    ?entities:(entities_ : list_of_targeted_sentiment_entities option) () =
  ({ entities = entities_ } : detect_targeted_sentiment_response)

let make_detect_targeted_sentiment_request ~language_code:(language_code_ : language_code)
    ~text:(text_ : customer_input_string) () =
  ({ language_code = language_code_; text = text_ } : detect_targeted_sentiment_request)

let make_detect_syntax_response ?syntax_tokens:(syntax_tokens_ : list_of_syntax_tokens option) () =
  ({ syntax_tokens = syntax_tokens_ } : detect_syntax_response)

let make_detect_syntax_request ~language_code:(language_code_ : syntax_language_code)
    ~text:(text_ : customer_input_string) () =
  ({ language_code = language_code_; text = text_ } : detect_syntax_request)

let make_detect_sentiment_response ?sentiment_score:(sentiment_score_ : sentiment_score option)
    ?sentiment:(sentiment_ : sentiment_type option) () =
  ({ sentiment_score = sentiment_score_; sentiment = sentiment_ } : detect_sentiment_response)

let make_detect_sentiment_request ~language_code:(language_code_ : language_code)
    ~text:(text_ : customer_input_string) () =
  ({ language_code = language_code_; text = text_ } : detect_sentiment_request)

let make_detect_pii_entities_response ?entities:(entities_ : list_of_pii_entities option) () =
  ({ entities = entities_ } : detect_pii_entities_response)

let make_detect_pii_entities_request ~language_code:(language_code_ : language_code)
    ~text:(text_ : string_) () =
  ({ language_code = language_code_; text = text_ } : detect_pii_entities_request)

let make_detect_key_phrases_response ?key_phrases:(key_phrases_ : list_of_key_phrases option) () =
  ({ key_phrases = key_phrases_ } : detect_key_phrases_response)

let make_detect_key_phrases_request ~language_code:(language_code_ : language_code)
    ~text:(text_ : customer_input_string) () =
  ({ language_code = language_code_; text = text_ } : detect_key_phrases_request)

let make_detect_entities_response ?errors:(errors_ : list_of_errors option)
    ?blocks:(blocks_ : list_of_blocks option)
    ?document_type:(document_type_ : list_of_document_type option)
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?entities:(entities_ : list_of_entities option) () =
  ({
     errors = errors_;
     blocks = blocks_;
     document_type = document_type_;
     document_metadata = document_metadata_;
     entities = entities_;
   }
    : detect_entities_response)

let make_detect_entities_request
    ?document_reader_config:(document_reader_config_ : document_reader_config option)
    ?bytes:(bytes_ : semi_structured_document_blob option)
    ?endpoint_arn:(endpoint_arn_ : entity_recognizer_endpoint_arn option)
    ?language_code:(language_code_ : language_code option)
    ?text:(text_ : customer_input_string option) () =
  ({
     document_reader_config = document_reader_config_;
     bytes = bytes_;
     endpoint_arn = endpoint_arn_;
     language_code = language_code_;
     text = text_;
   }
    : detect_entities_request)

let make_detect_dominant_language_response
    ?languages:(languages_ : list_of_dominant_languages option) () =
  ({ languages = languages_ } : detect_dominant_language_response)

let make_detect_dominant_language_request ~text:(text_ : customer_input_string) () =
  ({ text = text_ } : detect_dominant_language_request)

let make_describe_topics_detection_job_response
    ?topics_detection_job_properties:
      (topics_detection_job_properties_ : topics_detection_job_properties option) () =
  ({ topics_detection_job_properties = topics_detection_job_properties_ }
    : describe_topics_detection_job_response)

let make_describe_topics_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_topics_detection_job_request)

let make_describe_targeted_sentiment_detection_job_response
    ?targeted_sentiment_detection_job_properties:
      (targeted_sentiment_detection_job_properties_ :
         targeted_sentiment_detection_job_properties option) () =
  ({ targeted_sentiment_detection_job_properties = targeted_sentiment_detection_job_properties_ }
    : describe_targeted_sentiment_detection_job_response)

let make_describe_targeted_sentiment_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_targeted_sentiment_detection_job_request)

let make_describe_sentiment_detection_job_response
    ?sentiment_detection_job_properties:
      (sentiment_detection_job_properties_ : sentiment_detection_job_properties option) () =
  ({ sentiment_detection_job_properties = sentiment_detection_job_properties_ }
    : describe_sentiment_detection_job_response)

let make_describe_sentiment_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_sentiment_detection_job_request)

let make_describe_resource_policy_response
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?resource_policy:(resource_policy_ : policy option) () =
  ({
     policy_revision_id = policy_revision_id_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     resource_policy = resource_policy_;
   }
    : describe_resource_policy_response)

let make_describe_resource_policy_request ~resource_arn:(resource_arn_ : comprehend_model_arn) () =
  ({ resource_arn = resource_arn_ } : describe_resource_policy_request)

let make_describe_pii_entities_detection_job_response
    ?pii_entities_detection_job_properties:
      (pii_entities_detection_job_properties_ : pii_entities_detection_job_properties option) () =
  ({ pii_entities_detection_job_properties = pii_entities_detection_job_properties_ }
    : describe_pii_entities_detection_job_response)

let make_describe_pii_entities_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_pii_entities_detection_job_request)

let make_describe_key_phrases_detection_job_response
    ?key_phrases_detection_job_properties:
      (key_phrases_detection_job_properties_ : key_phrases_detection_job_properties option) () =
  ({ key_phrases_detection_job_properties = key_phrases_detection_job_properties_ }
    : describe_key_phrases_detection_job_response)

let make_describe_key_phrases_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_key_phrases_detection_job_request)

let make_describe_flywheel_response
    ?flywheel_properties:(flywheel_properties_ : flywheel_properties option) () =
  ({ flywheel_properties = flywheel_properties_ } : describe_flywheel_response)

let make_describe_flywheel_request ~flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn) () =
  ({ flywheel_arn = flywheel_arn_ } : describe_flywheel_request)

let make_describe_flywheel_iteration_response
    ?flywheel_iteration_properties:
      (flywheel_iteration_properties_ : flywheel_iteration_properties option) () =
  ({ flywheel_iteration_properties = flywheel_iteration_properties_ }
    : describe_flywheel_iteration_response)

let make_describe_flywheel_iteration_request
    ~flywheel_iteration_id:(flywheel_iteration_id_ : flywheel_iteration_id)
    ~flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn) () =
  ({ flywheel_iteration_id = flywheel_iteration_id_; flywheel_arn = flywheel_arn_ }
    : describe_flywheel_iteration_request)

let make_describe_events_detection_job_response
    ?events_detection_job_properties:
      (events_detection_job_properties_ : events_detection_job_properties option) () =
  ({ events_detection_job_properties = events_detection_job_properties_ }
    : describe_events_detection_job_response)

let make_describe_events_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_events_detection_job_request)

let make_describe_entity_recognizer_response
    ?entity_recognizer_properties:
      (entity_recognizer_properties_ : entity_recognizer_properties option) () =
  ({ entity_recognizer_properties = entity_recognizer_properties_ }
    : describe_entity_recognizer_response)

let make_describe_entity_recognizer_request
    ~entity_recognizer_arn:(entity_recognizer_arn_ : entity_recognizer_arn) () =
  ({ entity_recognizer_arn = entity_recognizer_arn_ } : describe_entity_recognizer_request)

let make_describe_entities_detection_job_response
    ?entities_detection_job_properties:
      (entities_detection_job_properties_ : entities_detection_job_properties option) () =
  ({ entities_detection_job_properties = entities_detection_job_properties_ }
    : describe_entities_detection_job_response)

let make_describe_entities_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_entities_detection_job_request)

let make_describe_endpoint_response
    ?endpoint_properties:(endpoint_properties_ : endpoint_properties option) () =
  ({ endpoint_properties = endpoint_properties_ } : describe_endpoint_response)

let make_describe_endpoint_request ~endpoint_arn:(endpoint_arn_ : comprehend_endpoint_arn) () =
  ({ endpoint_arn = endpoint_arn_ } : describe_endpoint_request)

let make_describe_dominant_language_detection_job_response
    ?dominant_language_detection_job_properties:
      (dominant_language_detection_job_properties_ :
         dominant_language_detection_job_properties option) () =
  ({ dominant_language_detection_job_properties = dominant_language_detection_job_properties_ }
    : describe_dominant_language_detection_job_response)

let make_describe_dominant_language_detection_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_dominant_language_detection_job_request)

let make_describe_document_classifier_response
    ?document_classifier_properties:
      (document_classifier_properties_ : document_classifier_properties option) () =
  ({ document_classifier_properties = document_classifier_properties_ }
    : describe_document_classifier_response)

let make_describe_document_classifier_request
    ~document_classifier_arn:(document_classifier_arn_ : document_classifier_arn) () =
  ({ document_classifier_arn = document_classifier_arn_ } : describe_document_classifier_request)

let make_describe_document_classification_job_response
    ?document_classification_job_properties:
      (document_classification_job_properties_ : document_classification_job_properties option) () =
  ({ document_classification_job_properties = document_classification_job_properties_ }
    : describe_document_classification_job_response)

let make_describe_document_classification_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_document_classification_job_request)

let make_describe_dataset_response
    ?dataset_properties:(dataset_properties_ : dataset_properties option) () =
  ({ dataset_properties = dataset_properties_ } : describe_dataset_response)

let make_describe_dataset_request ~dataset_arn:(dataset_arn_ : comprehend_dataset_arn) () =
  ({ dataset_arn = dataset_arn_ } : describe_dataset_request)

let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option)
    ~resource_arn:(resource_arn_ : comprehend_model_arn) () =
  ({ policy_revision_id = policy_revision_id_; resource_arn = resource_arn_ }
    : delete_resource_policy_request)

let make_delete_flywheel_response () = (() : unit)

let make_delete_flywheel_request ~flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn) () =
  ({ flywheel_arn = flywheel_arn_ } : delete_flywheel_request)

let make_delete_entity_recognizer_response () = (() : unit)

let make_delete_entity_recognizer_request
    ~entity_recognizer_arn:(entity_recognizer_arn_ : entity_recognizer_arn) () =
  ({ entity_recognizer_arn = entity_recognizer_arn_ } : delete_entity_recognizer_request)

let make_delete_endpoint_response () = (() : unit)

let make_delete_endpoint_request ~endpoint_arn:(endpoint_arn_ : comprehend_endpoint_arn) () =
  ({ endpoint_arn = endpoint_arn_ } : delete_endpoint_request)

let make_delete_document_classifier_response () = (() : unit)

let make_delete_document_classifier_request
    ~document_classifier_arn:(document_classifier_arn_ : document_classifier_arn) () =
  ({ document_classifier_arn = document_classifier_arn_ } : delete_document_classifier_request)

let make_dataset_augmented_manifests_list_item
    ?document_type:(document_type_ : augmented_manifests_document_type_format option)
    ?source_documents_s3_uri:(source_documents_s3_uri_ : s3_uri option)
    ?annotation_data_s3_uri:(annotation_data_s3_uri_ : s3_uri option) ~s3_uri:(s3_uri_ : s3_uri)
    ~attribute_names:(attribute_names_ : attribute_names_list) () =
  ({
     document_type = document_type_;
     source_documents_s3_uri = source_documents_s3_uri_;
     annotation_data_s3_uri = annotation_data_s3_uri_;
     s3_uri = s3_uri_;
     attribute_names = attribute_names_;
   }
    : dataset_augmented_manifests_list_item)

let make_dataset_document_classifier_input_data_config
    ?label_delimiter:(label_delimiter_ : label_delimiter option) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ label_delimiter = label_delimiter_; s3_uri = s3_uri_ }
    : dataset_document_classifier_input_data_config)

let make_dataset_entity_recognizer_annotations ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : dataset_entity_recognizer_annotations)

let make_dataset_entity_recognizer_documents ?input_format:(input_format_ : input_format option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ input_format = input_format_; s3_uri = s3_uri_ } : dataset_entity_recognizer_documents)

let make_dataset_entity_recognizer_entity_list ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : dataset_entity_recognizer_entity_list)

let make_dataset_entity_recognizer_input_data_config
    ?entity_list:(entity_list_ : dataset_entity_recognizer_entity_list option)
    ?annotations:(annotations_ : dataset_entity_recognizer_annotations option)
    ~documents:(documents_ : dataset_entity_recognizer_documents) () =
  ({ entity_list = entity_list_; documents = documents_; annotations = annotations_ }
    : dataset_entity_recognizer_input_data_config)

let make_dataset_input_data_config
    ?entity_recognizer_input_data_config:
      (entity_recognizer_input_data_config_ : dataset_entity_recognizer_input_data_config option)
    ?document_classifier_input_data_config:
      (document_classifier_input_data_config_ : dataset_document_classifier_input_data_config option)
    ?data_format:(data_format_ : dataset_data_format option)
    ?augmented_manifests:(augmented_manifests_ : dataset_augmented_manifests_list option) () =
  ({
     entity_recognizer_input_data_config = entity_recognizer_input_data_config_;
     document_classifier_input_data_config = document_classifier_input_data_config_;
     data_format = data_format_;
     augmented_manifests = augmented_manifests_;
   }
    : dataset_input_data_config)

let make_create_flywheel_response
    ?active_model_arn:(active_model_arn_ : comprehend_model_arn option)
    ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option) () =
  ({ active_model_arn = active_model_arn_; flywheel_arn = flywheel_arn_ }
    : create_flywheel_response)

let make_create_flywheel_request ?tags:(tags_ : tag_list option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?data_security_config:(data_security_config_ : data_security_config option)
    ?model_type:(model_type_ : model_type option) ?task_config:(task_config_ : task_config option)
    ?active_model_arn:(active_model_arn_ : comprehend_model_arn option)
    ~data_lake_s3_uri:(data_lake_s3_uri_ : flywheel_s3_uri)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~flywheel_name:(flywheel_name_ : comprehend_arn_name) () =
  ({
     tags = tags_;
     client_request_token = client_request_token_;
     data_security_config = data_security_config_;
     data_lake_s3_uri = data_lake_s3_uri_;
     model_type = model_type_;
     task_config = task_config_;
     data_access_role_arn = data_access_role_arn_;
     active_model_arn = active_model_arn_;
     flywheel_name = flywheel_name_;
   }
    : create_flywheel_request)

let make_create_entity_recognizer_response
    ?entity_recognizer_arn:(entity_recognizer_arn_ : entity_recognizer_arn option) () =
  ({ entity_recognizer_arn = entity_recognizer_arn_ } : create_entity_recognizer_response)

let make_create_entity_recognizer_request ?model_policy:(model_policy_ : policy option)
    ?model_kms_key_id:(model_kms_key_id_ : kms_key_id option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?tags:(tags_ : tag_list option) ?version_name:(version_name_ : version_name option)
    ~language_code:(language_code_ : language_code)
    ~input_data_config:(input_data_config_ : entity_recognizer_input_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~recognizer_name:(recognizer_name_ : comprehend_arn_name) () =
  ({
     model_policy = model_policy_;
     model_kms_key_id = model_kms_key_id_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     language_code = language_code_;
     client_request_token = client_request_token_;
     input_data_config = input_data_config_;
     tags = tags_;
     data_access_role_arn = data_access_role_arn_;
     version_name = version_name_;
     recognizer_name = recognizer_name_;
   }
    : create_entity_recognizer_request)

let make_create_endpoint_response ?model_arn:(model_arn_ : comprehend_model_arn option)
    ?endpoint_arn:(endpoint_arn_ : comprehend_endpoint_arn option) () =
  ({ model_arn = model_arn_; endpoint_arn = endpoint_arn_ } : create_endpoint_response)

let make_create_endpoint_request ?flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?tags:(tags_ : tag_list option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?model_arn:(model_arn_ : comprehend_model_arn option)
    ~desired_inference_units:(desired_inference_units_ : inference_units_integer)
    ~endpoint_name:(endpoint_name_ : comprehend_endpoint_name) () =
  ({
     flywheel_arn = flywheel_arn_;
     data_access_role_arn = data_access_role_arn_;
     tags = tags_;
     client_request_token = client_request_token_;
     desired_inference_units = desired_inference_units_;
     model_arn = model_arn_;
     endpoint_name = endpoint_name_;
   }
    : create_endpoint_request)

let make_create_document_classifier_response
    ?document_classifier_arn:(document_classifier_arn_ : document_classifier_arn option) () =
  ({ document_classifier_arn = document_classifier_arn_ } : create_document_classifier_response)

let make_create_document_classifier_request ?model_policy:(model_policy_ : policy option)
    ?model_kms_key_id:(model_kms_key_id_ : kms_key_id option)
    ?mode:(mode_ : document_classifier_mode option) ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?output_data_config:(output_data_config_ : document_classifier_output_data_config option)
    ?tags:(tags_ : tag_list option) ?version_name:(version_name_ : version_name option)
    ~language_code:(language_code_ : language_code)
    ~input_data_config:(input_data_config_ : document_classifier_input_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~document_classifier_name:(document_classifier_name_ : comprehend_arn_name) () =
  ({
     model_policy = model_policy_;
     model_kms_key_id = model_kms_key_id_;
     mode = mode_;
     vpc_config = vpc_config_;
     volume_kms_key_id = volume_kms_key_id_;
     language_code = language_code_;
     client_request_token = client_request_token_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     tags = tags_;
     data_access_role_arn = data_access_role_arn_;
     version_name = version_name_;
     document_classifier_name = document_classifier_name_;
   }
    : create_document_classifier_request)

let make_create_dataset_response ?dataset_arn:(dataset_arn_ : comprehend_dataset_arn option) () =
  ({ dataset_arn = dataset_arn_ } : create_dataset_response)

let make_create_dataset_request ?tags:(tags_ : tag_list option)
    ?client_request_token:(client_request_token_ : client_request_token_string option)
    ?description:(description_ : description option)
    ?dataset_type:(dataset_type_ : dataset_type option)
    ~input_data_config:(input_data_config_ : dataset_input_data_config)
    ~dataset_name:(dataset_name_ : comprehend_arn_name)
    ~flywheel_arn:(flywheel_arn_ : comprehend_flywheel_arn) () =
  ({
     tags = tags_;
     client_request_token = client_request_token_;
     input_data_config = input_data_config_;
     description = description_;
     dataset_type = dataset_type_;
     dataset_name = dataset_name_;
     flywheel_arn = flywheel_arn_;
   }
    : create_dataset_request)

let make_contains_pii_entities_response ?labels:(labels_ : list_of_entity_labels option) () =
  ({ labels = labels_ } : contains_pii_entities_response)

let make_contains_pii_entities_request ~language_code:(language_code_ : language_code)
    ~text:(text_ : string_) () =
  ({ language_code = language_code_; text = text_ } : contains_pii_entities_request)

let make_classify_document_response ?warnings:(warnings_ : list_of_warnings option)
    ?errors:(errors_ : list_of_errors option)
    ?document_type:(document_type_ : list_of_document_type option)
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?labels:(labels_ : list_of_labels option) ?classes:(classes_ : list_of_classes option) () =
  ({
     warnings = warnings_;
     errors = errors_;
     document_type = document_type_;
     document_metadata = document_metadata_;
     labels = labels_;
     classes = classes_;
   }
    : classify_document_response)

let make_classify_document_request
    ?document_reader_config:(document_reader_config_ : document_reader_config option)
    ?bytes:(bytes_ : semi_structured_document_blob option)
    ?text:(text_ : customer_input_string option)
    ~endpoint_arn:(endpoint_arn_ : document_classifier_endpoint_arn) () =
  ({
     document_reader_config = document_reader_config_;
     bytes = bytes_;
     endpoint_arn = endpoint_arn_;
     text = text_;
   }
    : classify_document_request)

let make_batch_item_error ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : string_ option) ?index:(index_ : integer option) () =
  ({ error_message = error_message_; error_code = error_code_; index = index_ } : batch_item_error)

let make_batch_detect_targeted_sentiment_response ~error_list:(error_list_ : batch_item_error_list)
    ~result_list:(result_list_ : list_of_detect_targeted_sentiment_result) () =
  ({ error_list = error_list_; result_list = result_list_ }
    : batch_detect_targeted_sentiment_response)

let make_batch_detect_targeted_sentiment_request ~language_code:(language_code_ : language_code)
    ~text_list:(text_list_ : customer_input_string_list) () =
  ({ language_code = language_code_; text_list = text_list_ }
    : batch_detect_targeted_sentiment_request)

let make_batch_detect_syntax_response ~error_list:(error_list_ : batch_item_error_list)
    ~result_list:(result_list_ : list_of_detect_syntax_result) () =
  ({ error_list = error_list_; result_list = result_list_ } : batch_detect_syntax_response)

let make_batch_detect_syntax_request ~language_code:(language_code_ : syntax_language_code)
    ~text_list:(text_list_ : customer_input_string_list) () =
  ({ language_code = language_code_; text_list = text_list_ } : batch_detect_syntax_request)

let make_batch_detect_sentiment_response ~error_list:(error_list_ : batch_item_error_list)
    ~result_list:(result_list_ : list_of_detect_sentiment_result) () =
  ({ error_list = error_list_; result_list = result_list_ } : batch_detect_sentiment_response)

let make_batch_detect_sentiment_request ~language_code:(language_code_ : language_code)
    ~text_list:(text_list_ : customer_input_string_list) () =
  ({ language_code = language_code_; text_list = text_list_ } : batch_detect_sentiment_request)

let make_batch_detect_key_phrases_response ~error_list:(error_list_ : batch_item_error_list)
    ~result_list:(result_list_ : list_of_detect_key_phrases_result) () =
  ({ error_list = error_list_; result_list = result_list_ } : batch_detect_key_phrases_response)

let make_batch_detect_key_phrases_request ~language_code:(language_code_ : language_code)
    ~text_list:(text_list_ : customer_input_string_list) () =
  ({ language_code = language_code_; text_list = text_list_ } : batch_detect_key_phrases_request)

let make_batch_detect_entities_response ~error_list:(error_list_ : batch_item_error_list)
    ~result_list:(result_list_ : list_of_detect_entities_result) () =
  ({ error_list = error_list_; result_list = result_list_ } : batch_detect_entities_response)

let make_batch_detect_entities_request ~language_code:(language_code_ : language_code)
    ~text_list:(text_list_ : customer_input_string_list) () =
  ({ language_code = language_code_; text_list = text_list_ } : batch_detect_entities_request)

let make_batch_detect_dominant_language_response ~error_list:(error_list_ : batch_item_error_list)
    ~result_list:(result_list_ : list_of_detect_dominant_language_result) () =
  ({ error_list = error_list_; result_list = result_list_ }
    : batch_detect_dominant_language_response)

let make_batch_detect_dominant_language_request ~text_list:(text_list_ : customer_input_string_list)
    () =
  ({ text_list = text_list_ } : batch_detect_dominant_language_request)
