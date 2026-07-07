open Types

let make_video_metadata ?color_range:(color_range_ : video_color_range option)
    ?frame_width:(frame_width_ : u_long option) ?frame_height:(frame_height_ : u_long option)
    ?frame_rate:(frame_rate_ : float_ option) ?format:(format_ : string_ option)
    ?duration_millis:(duration_millis_ : u_long option) ?codec:(codec_ : string_ option) () =
  ({
     color_range = color_range_;
     frame_width = frame_width_;
     frame_height = frame_height_;
     frame_rate = frame_rate_;
     format = format_;
     duration_millis = duration_millis_;
     codec = codec_;
   }
    : video_metadata)

let make_s3_object ?version:(version_ : s3_object_version option)
    ?name:(name_ : s3_object_name option) ?bucket:(bucket_ : s3_bucket option) () =
  ({ version = version_; name = name_; bucket = bucket_ } : s3_object)

let make_video ?s3_object:(s3_object_ : s3_object option) () = ({ s3_object = s3_object_ } : video)

let make_versions ?maximum:(maximum_ : version option) ?minimum:(minimum_ : version option) () =
  ({ maximum = maximum_; minimum = minimum_ } : versions)

let make_ground_truth_manifest ?s3_object:(s3_object_ : s3_object option) () =
  ({ s3_object = s3_object_ } : ground_truth_manifest)

let make_asset ?ground_truth_manifest:(ground_truth_manifest_ : ground_truth_manifest option) () =
  ({ ground_truth_manifest = ground_truth_manifest_ } : asset)

let make_validation_data ?assets:(assets_ : assets option) () =
  ({ assets = assets_ } : validation_data)

let make_matched_user ?user_status:(user_status_ : user_status option)
    ?user_id:(user_id_ : user_id option) () =
  ({ user_status = user_status_; user_id = user_id_ } : matched_user)

let make_user_match ?user:(user_ : matched_user option) ?similarity:(similarity_ : percent option)
    () =
  ({ user = user_; similarity = similarity_ } : user_match)

let make_user ?user_status:(user_status_ : user_status option) ?user_id:(user_id_ : user_id option)
    () =
  ({ user_status = user_status_; user_id = user_id_ } : user)

let make_update_stream_processor_response () = (() : unit)

let make_connected_home_settings_for_update ?min_confidence:(min_confidence_ : percent option)
    ?labels:(labels_ : connected_home_labels option) () =
  ({ min_confidence = min_confidence_; labels = labels_ } : connected_home_settings_for_update)

let make_stream_processor_settings_for_update
    ?connected_home_for_update:
      (connected_home_for_update_ : connected_home_settings_for_update option) () =
  ({ connected_home_for_update = connected_home_for_update_ }
    : stream_processor_settings_for_update)

let make_bounding_box ?top:(top_ : float_ option) ?left:(left_ : float_ option)
    ?height:(height_ : float_ option) ?width:(width_ : float_ option) () =
  ({ top = top_; left = left_; height = height_; width = width_ } : bounding_box)

let make_point ?y:(y_ : float_ option) ?x:(x_ : float_ option) () = ({ y = y_; x = x_ } : point)

let make_region_of_interest ?polygon:(polygon_ : polygon option)
    ?bounding_box:(bounding_box_ : bounding_box option) () =
  ({ polygon = polygon_; bounding_box = bounding_box_ } : region_of_interest)

let make_stream_processor_data_sharing_preference ~opt_in:(opt_in_ : boolean_) () =
  ({ opt_in = opt_in_ } : stream_processor_data_sharing_preference)

let make_update_stream_processor_request
    ?parameters_to_delete:(parameters_to_delete_ : stream_processor_parameters_to_delete option)
    ?data_sharing_preference_for_update:
      (data_sharing_preference_for_update_ : stream_processor_data_sharing_preference option)
    ?regions_of_interest_for_update:(regions_of_interest_for_update_ : regions_of_interest option)
    ?settings_for_update:(settings_for_update_ : stream_processor_settings_for_update option)
    ~name:(name_ : stream_processor_name) () =
  ({
     parameters_to_delete = parameters_to_delete_;
     data_sharing_preference_for_update = data_sharing_preference_for_update_;
     regions_of_interest_for_update = regions_of_interest_for_update_;
     settings_for_update = settings_for_update_;
     name = name_;
   }
    : update_stream_processor_request)

let make_update_dataset_entries_response () = (() : unit)

let make_dataset_changes ~ground_truth:(ground_truth_ : ground_truth_blob) () =
  ({ ground_truth = ground_truth_ } : dataset_changes)

let make_update_dataset_entries_request ~changes:(changes_ : dataset_changes)
    ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({ changes = changes_; dataset_arn = dataset_arn_ } : update_dataset_entries_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_unsuccessful_face_disassociation
    ?reasons:(reasons_ : unsuccessful_face_disassociation_reasons option)
    ?user_id:(user_id_ : user_id option) ?face_id:(face_id_ : face_id option) () =
  ({ reasons = reasons_; user_id = user_id_; face_id = face_id_ }
    : unsuccessful_face_disassociation)

let make_unsuccessful_face_deletion ?reasons:(reasons_ : unsuccessful_face_deletion_reasons option)
    ?user_id:(user_id_ : user_id option) ?face_id:(face_id_ : face_id option) () =
  ({ reasons = reasons_; user_id = user_id_; face_id = face_id_ } : unsuccessful_face_deletion)

let make_unsuccessful_face_association
    ?reasons:(reasons_ : unsuccessful_face_association_reasons option)
    ?confidence:(confidence_ : percent option) ?user_id:(user_id_ : user_id option)
    ?face_id:(face_id_ : face_id option) () =
  ({ reasons = reasons_; confidence = confidence_; user_id = user_id_; face_id = face_id_ }
    : unsuccessful_face_association)

let make_age_range ?high:(high_ : u_integer option) ?low:(low_ : u_integer option) () =
  ({ high = high_; low = low_ } : age_range)

let make_smile ?confidence:(confidence_ : percent option) ?value:(value_ : boolean_ option) () =
  ({ confidence = confidence_; value = value_ } : smile)

let make_eyeglasses ?confidence:(confidence_ : percent option) ?value:(value_ : boolean_ option) ()
    =
  ({ confidence = confidence_; value = value_ } : eyeglasses)

let make_sunglasses ?confidence:(confidence_ : percent option) ?value:(value_ : boolean_ option) ()
    =
  ({ confidence = confidence_; value = value_ } : sunglasses)

let make_gender ?confidence:(confidence_ : percent option) ?value:(value_ : gender_type option) () =
  ({ confidence = confidence_; value = value_ } : gender)

let make_beard ?confidence:(confidence_ : percent option) ?value:(value_ : boolean_ option) () =
  ({ confidence = confidence_; value = value_ } : beard)

let make_mustache ?confidence:(confidence_ : percent option) ?value:(value_ : boolean_ option) () =
  ({ confidence = confidence_; value = value_ } : mustache)

let make_eye_open ?confidence:(confidence_ : percent option) ?value:(value_ : boolean_ option) () =
  ({ confidence = confidence_; value = value_ } : eye_open)

let make_mouth_open ?confidence:(confidence_ : percent option) ?value:(value_ : boolean_ option) ()
    =
  ({ confidence = confidence_; value = value_ } : mouth_open)

let make_emotion ?confidence:(confidence_ : percent option) ?type_:(type__ : emotion_name option) ()
    =
  ({ confidence = confidence_; type_ = type__ } : emotion)

let make_landmark ?y:(y_ : float_ option) ?x:(x_ : float_ option)
    ?type_:(type__ : landmark_type option) () =
  ({ y = y_; x = x_; type_ = type__ } : landmark)

let make_pose ?pitch:(pitch_ : degree option) ?yaw:(yaw_ : degree option)
    ?roll:(roll_ : degree option) () =
  ({ pitch = pitch_; yaw = yaw_; roll = roll_ } : pose)

let make_image_quality ?sharpness:(sharpness_ : float_ option)
    ?brightness:(brightness_ : float_ option) () =
  ({ sharpness = sharpness_; brightness = brightness_ } : image_quality)

let make_face_occluded ?confidence:(confidence_ : percent option) ?value:(value_ : boolean_ option)
    () =
  ({ confidence = confidence_; value = value_ } : face_occluded)

let make_eye_direction ?confidence:(confidence_ : percent option) ?pitch:(pitch_ : degree option)
    ?yaw:(yaw_ : degree option) () =
  ({ confidence = confidence_; pitch = pitch_; yaw = yaw_ } : eye_direction)

let make_face_detail ?eye_direction:(eye_direction_ : eye_direction option)
    ?face_occluded:(face_occluded_ : face_occluded option)
    ?confidence:(confidence_ : percent option) ?quality:(quality_ : image_quality option)
    ?pose:(pose_ : pose option) ?landmarks:(landmarks_ : landmarks option)
    ?emotions:(emotions_ : emotions option) ?mouth_open:(mouth_open_ : mouth_open option)
    ?eyes_open:(eyes_open_ : eye_open option) ?mustache:(mustache_ : mustache option)
    ?beard:(beard_ : beard option) ?gender:(gender_ : gender option)
    ?sunglasses:(sunglasses_ : sunglasses option) ?eyeglasses:(eyeglasses_ : eyeglasses option)
    ?smile:(smile_ : smile option) ?age_range:(age_range_ : age_range option)
    ?bounding_box:(bounding_box_ : bounding_box option) () =
  ({
     eye_direction = eye_direction_;
     face_occluded = face_occluded_;
     confidence = confidence_;
     quality = quality_;
     pose = pose_;
     landmarks = landmarks_;
     emotions = emotions_;
     mouth_open = mouth_open_;
     eyes_open = eyes_open_;
     mustache = mustache_;
     beard = beard_;
     gender = gender_;
     sunglasses = sunglasses_;
     eyeglasses = eyeglasses_;
     smile = smile_;
     age_range = age_range_;
     bounding_box = bounding_box_;
   }
    : face_detail)

let make_unsearched_face ?reasons:(reasons_ : unsearched_face_reasons option)
    ?face_details:(face_details_ : face_detail option) () =
  ({ reasons = reasons_; face_details = face_details_ } : unsearched_face)

let make_unindexed_face ?face_detail:(face_detail_ : face_detail option)
    ?reasons:(reasons_ : reasons option) () =
  ({ face_detail = face_detail_; reasons = reasons_ } : unindexed_face)

let make_training_data ?assets:(assets_ : assets option) () = ({ assets = assets_ } : training_data)

let make_geometry ?polygon:(polygon_ : polygon option)
    ?bounding_box:(bounding_box_ : bounding_box option) () =
  ({ polygon = polygon_; bounding_box = bounding_box_ } : geometry)

let make_text_detection ?geometry:(geometry_ : geometry option)
    ?confidence:(confidence_ : percent option) ?parent_id:(parent_id_ : u_integer option)
    ?id:(id_ : u_integer option) ?type_:(type__ : text_types option)
    ?detected_text:(detected_text_ : string_ option) () =
  ({
     geometry = geometry_;
     confidence = confidence_;
     parent_id = parent_id_;
     id = id_;
     type_ = type__;
     detected_text = detected_text_;
   }
    : text_detection)

let make_testing_data ?auto_create:(auto_create_ : boolean_ option)
    ?assets:(assets_ : assets option) () =
  ({ auto_create = auto_create_; assets = assets_ } : testing_data)

let make_technical_cue_segment ?confidence:(confidence_ : segment_confidence option)
    ?type_:(type__ : technical_cue_type option) () =
  ({ confidence = confidence_; type_ = type__ } : technical_cue_segment)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_map) ~resource_arn:(resource_arn_ : resource_arn)
    () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_summary ?s3_object:(s3_object_ : s3_object option) () =
  ({ s3_object = s3_object_ } : summary)

let make_face_search_settings ?face_match_threshold:(face_match_threshold_ : percent option)
    ?collection_id:(collection_id_ : collection_id option) () =
  ({ face_match_threshold = face_match_threshold_; collection_id = collection_id_ }
    : face_search_settings)

let make_connected_home_settings ?min_confidence:(min_confidence_ : percent option)
    ~labels:(labels_ : connected_home_labels) () =
  ({ min_confidence = min_confidence_; labels = labels_ } : connected_home_settings)

let make_stream_processor_settings
    ?connected_home:(connected_home_ : connected_home_settings option)
    ?face_search:(face_search_ : face_search_settings option) () =
  ({ connected_home = connected_home_; face_search = face_search_ } : stream_processor_settings)

let make_kinesis_data_stream ?arn:(arn_ : kinesis_data_arn option) () =
  ({ arn = arn_ } : kinesis_data_stream)

let make_s3_destination ?key_prefix:(key_prefix_ : s3_key_prefix option)
    ?bucket:(bucket_ : s3_bucket option) () =
  ({ key_prefix = key_prefix_; bucket = bucket_ } : s3_destination)

let make_stream_processor_output ?s3_destination:(s3_destination_ : s3_destination option)
    ?kinesis_data_stream:(kinesis_data_stream_ : kinesis_data_stream option) () =
  ({ s3_destination = s3_destination_; kinesis_data_stream = kinesis_data_stream_ }
    : stream_processor_output)

let make_stream_processor_notification_channel ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn) () =
  ({ sns_topic_arn = sns_topic_arn_ } : stream_processor_notification_channel)

let make_stream_processor ?status:(status_ : stream_processor_status option)
    ?name:(name_ : stream_processor_name option) () =
  ({ status = status_; name = name_ } : stream_processor)

let make_kinesis_video_stream ?arn:(arn_ : kinesis_video_arn option) () =
  ({ arn = arn_ } : kinesis_video_stream)

let make_stream_processor_input
    ?kinesis_video_stream:(kinesis_video_stream_ : kinesis_video_stream option) () =
  ({ kinesis_video_stream = kinesis_video_stream_ } : stream_processor_input)

let make_stream_processing_stop_selector
    ?max_duration_in_seconds:(max_duration_in_seconds_ : max_duration_in_seconds_u_long option) () =
  ({ max_duration_in_seconds = max_duration_in_seconds_ } : stream_processing_stop_selector)

let make_kinesis_video_stream_start_selector
    ?fragment_number:(fragment_number_ : kinesis_video_stream_fragment_number option)
    ?producer_timestamp:(producer_timestamp_ : u_long option) () =
  ({ fragment_number = fragment_number_; producer_timestamp = producer_timestamp_ }
    : kinesis_video_stream_start_selector)

let make_stream_processing_start_selector
    ?kvs_stream_start_selector:
      (kvs_stream_start_selector_ : kinesis_video_stream_start_selector option) () =
  ({ kvs_stream_start_selector = kvs_stream_start_selector_ } : stream_processing_start_selector)

let make_stop_stream_processor_response () = (() : unit)

let make_stop_stream_processor_request ~name:(name_ : stream_processor_name) () =
  ({ name = name_ } : stop_stream_processor_request)

let make_stop_project_version_response ?status:(status_ : project_version_status option) () =
  ({ status = status_ } : stop_project_version_response)

let make_stop_project_version_request
    ~project_version_arn:(project_version_arn_ : project_version_arn) () =
  ({ project_version_arn = project_version_arn_ } : stop_project_version_request)

let make_start_text_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_text_detection_response)

let make_notification_channel ~role_arn:(role_arn_ : role_arn)
    ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn) () =
  ({ role_arn = role_arn_; sns_topic_arn = sns_topic_arn_ } : notification_channel)

let make_detection_filter
    ?min_bounding_box_width:(min_bounding_box_width_ : bounding_box_width option)
    ?min_bounding_box_height:(min_bounding_box_height_ : bounding_box_height option)
    ?min_confidence:(min_confidence_ : percent option) () =
  ({
     min_bounding_box_width = min_bounding_box_width_;
     min_bounding_box_height = min_bounding_box_height_;
     min_confidence = min_confidence_;
   }
    : detection_filter)

let make_start_text_detection_filters
    ?regions_of_interest:(regions_of_interest_ : regions_of_interest option)
    ?word_filter:(word_filter_ : detection_filter option) () =
  ({ regions_of_interest = regions_of_interest_; word_filter = word_filter_ }
    : start_text_detection_filters)

let make_start_text_detection_request ?filters:(filters_ : start_text_detection_filters option)
    ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~video:(video_ : video) () =
  ({
     filters = filters_;
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     client_request_token = client_request_token_;
     video = video_;
   }
    : start_text_detection_request)

let make_black_frame
    ?min_coverage_percentage:(min_coverage_percentage_ : min_coverage_percentage option)
    ?max_pixel_threshold:(max_pixel_threshold_ : max_pixel_threshold option) () =
  ({
     min_coverage_percentage = min_coverage_percentage_;
     max_pixel_threshold = max_pixel_threshold_;
   }
    : black_frame)

let make_start_technical_cue_detection_filter ?black_frame:(black_frame_ : black_frame option)
    ?min_segment_confidence:(min_segment_confidence_ : segment_confidence option) () =
  ({ black_frame = black_frame_; min_segment_confidence = min_segment_confidence_ }
    : start_technical_cue_detection_filter)

let make_start_stream_processor_response
    ?session_id:(session_id_ : start_stream_processor_session_id option) () =
  ({ session_id = session_id_ } : start_stream_processor_response)

let make_start_stream_processor_request
    ?stop_selector:(stop_selector_ : stream_processing_stop_selector option)
    ?start_selector:(start_selector_ : stream_processing_start_selector option)
    ~name:(name_ : stream_processor_name) () =
  ({ stop_selector = stop_selector_; start_selector = start_selector_; name = name_ }
    : start_stream_processor_request)

let make_start_shot_detection_filter
    ?min_segment_confidence:(min_segment_confidence_ : segment_confidence option) () =
  ({ min_segment_confidence = min_segment_confidence_ } : start_shot_detection_filter)

let make_start_segment_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_segment_detection_response)

let make_start_segment_detection_filters
    ?shot_filter:(shot_filter_ : start_shot_detection_filter option)
    ?technical_cue_filter:(technical_cue_filter_ : start_technical_cue_detection_filter option) () =
  ({ shot_filter = shot_filter_; technical_cue_filter = technical_cue_filter_ }
    : start_segment_detection_filters)

let make_start_segment_detection_request
    ?filters:(filters_ : start_segment_detection_filters option)
    ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~segment_types:(segment_types_ : segment_types) ~video:(video_ : video) () =
  ({
     segment_types = segment_types_;
     filters = filters_;
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     client_request_token = client_request_token_;
     video = video_;
   }
    : start_segment_detection_request)

let make_start_project_version_response ?status:(status_ : project_version_status option) () =
  ({ status = status_ } : start_project_version_response)

let make_start_project_version_request
    ?max_inference_units:(max_inference_units_ : inference_units option)
    ~min_inference_units:(min_inference_units_ : inference_units)
    ~project_version_arn:(project_version_arn_ : project_version_arn) () =
  ({
     max_inference_units = max_inference_units_;
     min_inference_units = min_inference_units_;
     project_version_arn = project_version_arn_;
   }
    : start_project_version_request)

let make_start_person_tracking_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_person_tracking_response)

let make_start_person_tracking_request ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~video:(video_ : video) () =
  ({
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     client_request_token = client_request_token_;
     video = video_;
   }
    : start_person_tracking_request)

let make_start_media_analysis_job_response ~job_id:(job_id_ : media_analysis_job_id) () =
  ({ job_id = job_id_ } : start_media_analysis_job_response)

let make_media_analysis_detect_moderation_labels_config
    ?project_version:(project_version_ : project_version_id option)
    ?min_confidence:(min_confidence_ : percent option) () =
  ({ project_version = project_version_; min_confidence = min_confidence_ }
    : media_analysis_detect_moderation_labels_config)

let make_media_analysis_operations_config
    ?detect_moderation_labels:
      (detect_moderation_labels_ : media_analysis_detect_moderation_labels_config option) () =
  ({ detect_moderation_labels = detect_moderation_labels_ } : media_analysis_operations_config)

let make_media_analysis_input ~s3_object:(s3_object_ : s3_object) () =
  ({ s3_object = s3_object_ } : media_analysis_input)

let make_media_analysis_output_config
    ?s3_key_prefix:(s3_key_prefix_ : media_analysis_s3_key_prefix option)
    ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_key_prefix = s3_key_prefix_; s3_bucket = s3_bucket_ } : media_analysis_output_config)

let make_start_media_analysis_job_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?job_name:(job_name_ : media_analysis_job_name option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~output_config:(output_config_ : media_analysis_output_config)
    ~input:(input_ : media_analysis_input)
    ~operations_config:(operations_config_ : media_analysis_operations_config) () =
  ({
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     input = input_;
     operations_config = operations_config_;
     job_name = job_name_;
     client_request_token = client_request_token_;
   }
    : start_media_analysis_job_request)

let make_start_label_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_label_detection_response)

let make_general_labels_settings
    ?label_category_exclusion_filters:
      (label_category_exclusion_filters_ : general_labels_filter_list option)
    ?label_category_inclusion_filters:
      (label_category_inclusion_filters_ : general_labels_filter_list option)
    ?label_exclusion_filters:(label_exclusion_filters_ : general_labels_filter_list option)
    ?label_inclusion_filters:(label_inclusion_filters_ : general_labels_filter_list option) () =
  ({
     label_category_exclusion_filters = label_category_exclusion_filters_;
     label_category_inclusion_filters = label_category_inclusion_filters_;
     label_exclusion_filters = label_exclusion_filters_;
     label_inclusion_filters = label_inclusion_filters_;
   }
    : general_labels_settings)

let make_label_detection_settings ?general_labels:(general_labels_ : general_labels_settings option)
    () =
  ({ general_labels = general_labels_ } : label_detection_settings)

let make_start_label_detection_request ?settings:(settings_ : label_detection_settings option)
    ?features:(features_ : label_detection_feature_list option) ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?min_confidence:(min_confidence_ : percent option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~video:(video_ : video) () =
  ({
     settings = settings_;
     features = features_;
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     min_confidence = min_confidence_;
     client_request_token = client_request_token_;
     video = video_;
   }
    : start_label_detection_request)

let make_start_face_search_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_face_search_response)

let make_start_face_search_request ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?face_match_threshold:(face_match_threshold_ : percent option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~collection_id:(collection_id_ : collection_id) ~video:(video_ : video) () =
  ({
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     collection_id = collection_id_;
     face_match_threshold = face_match_threshold_;
     client_request_token = client_request_token_;
     video = video_;
   }
    : start_face_search_request)

let make_start_face_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_face_detection_response)

let make_start_face_detection_request ?job_tag:(job_tag_ : job_tag option)
    ?face_attributes:(face_attributes_ : face_attributes option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~video:(video_ : video) () =
  ({
     job_tag = job_tag_;
     face_attributes = face_attributes_;
     notification_channel = notification_channel_;
     client_request_token = client_request_token_;
     video = video_;
   }
    : start_face_detection_request)

let make_start_content_moderation_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_content_moderation_response)

let make_start_content_moderation_request ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?min_confidence:(min_confidence_ : percent option) ~video:(video_ : video) () =
  ({
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     client_request_token = client_request_token_;
     min_confidence = min_confidence_;
     video = video_;
   }
    : start_content_moderation_request)

let make_start_celebrity_recognition_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_celebrity_recognition_response)

let make_start_celebrity_recognition_request ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~video:(video_ : video) () =
  ({
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     client_request_token = client_request_token_;
     video = video_;
   }
    : start_celebrity_recognition_request)

let make_shot_segment ?confidence:(confidence_ : segment_confidence option)
    ?index:(index_ : u_long option) () =
  ({ confidence = confidence_; index = index_ } : shot_segment)

let make_segment_type_info ?model_version:(model_version_ : string_ option)
    ?type_:(type__ : segment_type option) () =
  ({ model_version = model_version_; type_ = type__ } : segment_type_info)

let make_segment_detection ?duration_frames:(duration_frames_ : u_long option)
    ?end_frame_number:(end_frame_number_ : u_long option)
    ?start_frame_number:(start_frame_number_ : u_long option)
    ?shot_segment:(shot_segment_ : shot_segment option)
    ?technical_cue_segment:(technical_cue_segment_ : technical_cue_segment option)
    ?duration_smpt_e:(duration_smpt_e_ : timecode option)
    ?end_timecode_smpt_e:(end_timecode_smpt_e_ : timecode option)
    ?start_timecode_smpt_e:(start_timecode_smpt_e_ : timecode option)
    ?duration_millis:(duration_millis_ : u_long option)
    ?end_timestamp_millis:(end_timestamp_millis_ : timestamp option)
    ?start_timestamp_millis:(start_timestamp_millis_ : timestamp option)
    ?type_:(type__ : segment_type option) () =
  ({
     duration_frames = duration_frames_;
     end_frame_number = end_frame_number_;
     start_frame_number = start_frame_number_;
     shot_segment = shot_segment_;
     technical_cue_segment = technical_cue_segment_;
     duration_smpt_e = duration_smpt_e_;
     end_timecode_smpt_e = end_timecode_smpt_e_;
     start_timecode_smpt_e = start_timecode_smpt_e_;
     duration_millis = duration_millis_;
     end_timestamp_millis = end_timestamp_millis_;
     start_timestamp_millis = start_timestamp_millis_;
     type_ = type__;
   }
    : segment_detection)

let make_searched_user ?user_id:(user_id_ : user_id option) () =
  ({ user_id = user_id_ } : searched_user)

let make_searched_face_details ?face_detail:(face_detail_ : face_detail option) () =
  ({ face_detail = face_detail_ } : searched_face_details)

let make_searched_face ?face_id:(face_id_ : face_id option) () =
  ({ face_id = face_id_ } : searched_face)

let make_search_users_response ?searched_user:(searched_user_ : searched_user option)
    ?searched_face:(searched_face_ : searched_face option)
    ?face_model_version:(face_model_version_ : string_ option)
    ?user_matches:(user_matches_ : user_match_list option) () =
  ({
     searched_user = searched_user_;
     searched_face = searched_face_;
     face_model_version = face_model_version_;
     user_matches = user_matches_;
   }
    : search_users_response)

let make_search_users_request ?max_users:(max_users_ : max_user_results option)
    ?user_match_threshold:(user_match_threshold_ : percent option)
    ?face_id:(face_id_ : face_id option) ?user_id:(user_id_ : user_id option)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     max_users = max_users_;
     user_match_threshold = user_match_threshold_;
     face_id = face_id_;
     user_id = user_id_;
     collection_id = collection_id_;
   }
    : search_users_request)

let make_search_users_by_image_response
    ?unsearched_faces:(unsearched_faces_ : unsearched_faces_list option)
    ?searched_face:(searched_face_ : searched_face_details option)
    ?face_model_version:(face_model_version_ : string_ option)
    ?user_matches:(user_matches_ : user_match_list option) () =
  ({
     unsearched_faces = unsearched_faces_;
     searched_face = searched_face_;
     face_model_version = face_model_version_;
     user_matches = user_matches_;
   }
    : search_users_by_image_response)

let make_image ?s3_object:(s3_object_ : s3_object option) ?bytes:(bytes_ : image_blob option) () =
  ({ s3_object = s3_object_; bytes = bytes_ } : image)

let make_search_users_by_image_request ?quality_filter:(quality_filter_ : quality_filter option)
    ?max_users:(max_users_ : max_user_results option)
    ?user_match_threshold:(user_match_threshold_ : percent option) ~image:(image_ : image)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     quality_filter = quality_filter_;
     max_users = max_users_;
     user_match_threshold = user_match_threshold_;
     image = image_;
     collection_id = collection_id_;
   }
    : search_users_by_image_request)

let make_face ?user_id:(user_id_ : user_id option)
    ?index_faces_model_version:(index_faces_model_version_ : index_faces_model_version option)
    ?confidence:(confidence_ : percent option)
    ?external_image_id:(external_image_id_ : external_image_id option)
    ?image_id:(image_id_ : image_id option) ?bounding_box:(bounding_box_ : bounding_box option)
    ?face_id:(face_id_ : face_id option) () =
  ({
     user_id = user_id_;
     index_faces_model_version = index_faces_model_version_;
     confidence = confidence_;
     external_image_id = external_image_id_;
     image_id = image_id_;
     bounding_box = bounding_box_;
     face_id = face_id_;
   }
    : face)

let make_face_match ?face:(face_ : face option) ?similarity:(similarity_ : percent option) () =
  ({ face = face_; similarity = similarity_ } : face_match)

let make_search_faces_response ?face_model_version:(face_model_version_ : string_ option)
    ?face_matches:(face_matches_ : face_match_list option)
    ?searched_face_id:(searched_face_id_ : face_id option) () =
  ({
     face_model_version = face_model_version_;
     face_matches = face_matches_;
     searched_face_id = searched_face_id_;
   }
    : search_faces_response)

let make_search_faces_request ?face_match_threshold:(face_match_threshold_ : percent option)
    ?max_faces:(max_faces_ : max_faces option) ~face_id:(face_id_ : face_id)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     face_match_threshold = face_match_threshold_;
     max_faces = max_faces_;
     face_id = face_id_;
     collection_id = collection_id_;
   }
    : search_faces_request)

let make_search_faces_by_image_response ?face_model_version:(face_model_version_ : string_ option)
    ?face_matches:(face_matches_ : face_match_list option)
    ?searched_face_confidence:(searched_face_confidence_ : percent option)
    ?searched_face_bounding_box:(searched_face_bounding_box_ : bounding_box option) () =
  ({
     face_model_version = face_model_version_;
     face_matches = face_matches_;
     searched_face_confidence = searched_face_confidence_;
     searched_face_bounding_box = searched_face_bounding_box_;
   }
    : search_faces_by_image_response)

let make_search_faces_by_image_request ?quality_filter:(quality_filter_ : quality_filter option)
    ?face_match_threshold:(face_match_threshold_ : percent option)
    ?max_faces:(max_faces_ : max_faces option) ~image:(image_ : image)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     quality_filter = quality_filter_;
     face_match_threshold = face_match_threshold_;
     max_faces = max_faces_;
     image = image_;
     collection_id = collection_id_;
   }
    : search_faces_by_image_request)

let make_compared_face ?smile:(smile_ : smile option) ?emotions:(emotions_ : emotions option)
    ?quality:(quality_ : image_quality option) ?pose:(pose_ : pose option)
    ?landmarks:(landmarks_ : landmarks option) ?confidence:(confidence_ : percent option)
    ?bounding_box:(bounding_box_ : bounding_box option) () =
  ({
     smile = smile_;
     emotions = emotions_;
     quality = quality_;
     pose = pose_;
     landmarks = landmarks_;
     confidence = confidence_;
     bounding_box = bounding_box_;
   }
    : compared_face)

let make_known_gender ?type_:(type__ : known_gender_type option) () =
  ({ type_ = type__ } : known_gender)

let make_celebrity ?known_gender:(known_gender_ : known_gender option)
    ?match_confidence:(match_confidence_ : percent option) ?face:(face_ : compared_face option)
    ?id:(id_ : rekognition_unique_id option) ?name:(name_ : string_ option)
    ?urls:(urls_ : urls option) () =
  ({
     known_gender = known_gender_;
     match_confidence = match_confidence_;
     face = face_;
     id = id_;
     name = name_;
     urls = urls_;
   }
    : celebrity)

let make_recognize_celebrities_response
    ?orientation_correction:(orientation_correction_ : orientation_correction option)
    ?unrecognized_faces:(unrecognized_faces_ : compared_face_list option)
    ?celebrity_faces:(celebrity_faces_ : celebrity_list option) () =
  ({
     orientation_correction = orientation_correction_;
     unrecognized_faces = unrecognized_faces_;
     celebrity_faces = celebrity_faces_;
   }
    : recognize_celebrities_response)

let make_recognize_celebrities_request ~image:(image_ : image) () =
  ({ image = image_ } : recognize_celebrities_request)

let make_put_project_policy_response
    ?policy_revision_id:(policy_revision_id_ : project_policy_revision_id option) () =
  ({ policy_revision_id = policy_revision_id_ } : put_project_policy_response)

let make_put_project_policy_request
    ?policy_revision_id:(policy_revision_id_ : project_policy_revision_id option)
    ~policy_document:(policy_document_ : project_policy_document)
    ~policy_name:(policy_name_ : project_policy_name) ~project_arn:(project_arn_ : project_arn) () =
  ({
     policy_document = policy_document_;
     policy_revision_id = policy_revision_id_;
     policy_name = policy_name_;
     project_arn = project_arn_;
   }
    : put_project_policy_request)

let make_list_users_response ?next_token:(next_token_ : pagination_token option)
    ?users:(users_ : user_list option) () =
  ({ next_token = next_token_; users = users_ } : list_users_response)

let make_list_users_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_user_results option)
    ~collection_id:(collection_id_ : collection_id) () =
  ({ next_token = next_token_; max_results = max_results_; collection_id = collection_id_ }
    : list_users_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_stream_processors_response
    ?stream_processors:(stream_processors_ : stream_processor_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ stream_processors = stream_processors_; next_token = next_token_ }
    : list_stream_processors_response)

let make_list_stream_processors_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_stream_processors_request)

let make_project_policy ?last_updated_timestamp:(last_updated_timestamp_ : date_time option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?policy_document:(policy_document_ : project_policy_document option)
    ?policy_revision_id:(policy_revision_id_ : project_policy_revision_id option)
    ?policy_name:(policy_name_ : project_policy_name option)
    ?project_arn:(project_arn_ : project_arn option) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     creation_timestamp = creation_timestamp_;
     policy_document = policy_document_;
     policy_revision_id = policy_revision_id_;
     policy_name = policy_name_;
     project_arn = project_arn_;
   }
    : project_policy)

let make_list_project_policies_response ?next_token:(next_token_ : extended_pagination_token option)
    ?project_policies:(project_policies_ : project_policies option) () =
  ({ next_token = next_token_; project_policies = project_policies_ }
    : list_project_policies_response)

let make_list_project_policies_request
    ?max_results:(max_results_ : list_project_policies_page_size option)
    ?next_token:(next_token_ : extended_pagination_token option)
    ~project_arn:(project_arn_ : project_arn) () =
  ({ max_results = max_results_; next_token = next_token_; project_arn = project_arn_ }
    : list_project_policies_request)

let make_media_analysis_job_failure_details ?message:(message_ : string_ option)
    ?code:(code_ : media_analysis_job_failure_code option) () =
  ({ message = message_; code = code_ } : media_analysis_job_failure_details)

let make_media_analysis_model_versions ?moderation:(moderation_ : string_ option) () =
  ({ moderation = moderation_ } : media_analysis_model_versions)

let make_media_analysis_results
    ?model_versions:(model_versions_ : media_analysis_model_versions option)
    ?s3_object:(s3_object_ : s3_object option) () =
  ({ model_versions = model_versions_; s3_object = s3_object_ } : media_analysis_results)

let make_media_analysis_manifest_summary ?s3_object:(s3_object_ : s3_object option) () =
  ({ s3_object = s3_object_ } : media_analysis_manifest_summary)

let make_media_analysis_job_description
    ?manifest_summary:(manifest_summary_ : media_analysis_manifest_summary option)
    ?results:(results_ : media_analysis_results option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?completion_timestamp:(completion_timestamp_ : date_time option)
    ?failure_details:(failure_details_ : media_analysis_job_failure_details option)
    ?job_name:(job_name_ : media_analysis_job_name option)
    ~output_config:(output_config_ : media_analysis_output_config)
    ~input:(input_ : media_analysis_input) ~creation_timestamp:(creation_timestamp_ : date_time)
    ~status:(status_ : media_analysis_job_status)
    ~operations_config:(operations_config_ : media_analysis_operations_config)
    ~job_id:(job_id_ : media_analysis_job_id) () =
  ({
     manifest_summary = manifest_summary_;
     results = results_;
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     input = input_;
     completion_timestamp = completion_timestamp_;
     creation_timestamp = creation_timestamp_;
     failure_details = failure_details_;
     status = status_;
     operations_config = operations_config_;
     job_name = job_name_;
     job_id = job_id_;
   }
    : media_analysis_job_description)

let make_list_media_analysis_jobs_response
    ?next_token:(next_token_ : extended_pagination_token option)
    ~media_analysis_jobs:(media_analysis_jobs_ : media_analysis_job_descriptions) () =
  ({ media_analysis_jobs = media_analysis_jobs_; next_token = next_token_ }
    : list_media_analysis_jobs_response)

let make_list_media_analysis_jobs_request
    ?max_results:(max_results_ : list_media_analysis_jobs_page_size option)
    ?next_token:(next_token_ : extended_pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_media_analysis_jobs_request)

let make_list_faces_response ?face_model_version:(face_model_version_ : string_ option)
    ?next_token:(next_token_ : string_ option) ?faces:(faces_ : face_list option) () =
  ({ face_model_version = face_model_version_; next_token = next_token_; faces = faces_ }
    : list_faces_response)

let make_list_faces_request ?face_ids:(face_ids_ : face_id_list option)
    ?user_id:(user_id_ : user_id option) ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     face_ids = face_ids_;
     user_id = user_id_;
     max_results = max_results_;
     next_token = next_token_;
     collection_id = collection_id_;
   }
    : list_faces_request)

let make_dataset_label_stats ?bounding_box_count:(bounding_box_count_ : u_integer option)
    ?entry_count:(entry_count_ : u_integer option) () =
  ({ bounding_box_count = bounding_box_count_; entry_count = entry_count_ } : dataset_label_stats)

let make_dataset_label_description ?label_stats:(label_stats_ : dataset_label_stats option)
    ?label_name:(label_name_ : dataset_label option) () =
  ({ label_stats = label_stats_; label_name = label_name_ } : dataset_label_description)

let make_list_dataset_labels_response ?next_token:(next_token_ : extended_pagination_token option)
    ?dataset_label_descriptions:(dataset_label_descriptions_ : dataset_label_descriptions option) ()
    =
  ({ next_token = next_token_; dataset_label_descriptions = dataset_label_descriptions_ }
    : list_dataset_labels_response)

let make_list_dataset_labels_request
    ?max_results:(max_results_ : list_dataset_labels_page_size option)
    ?next_token:(next_token_ : extended_pagination_token option)
    ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_arn = dataset_arn_ }
    : list_dataset_labels_request)

let make_list_dataset_entries_response ?next_token:(next_token_ : extended_pagination_token option)
    ?dataset_entries:(dataset_entries_ : dataset_entries option) () =
  ({ next_token = next_token_; dataset_entries = dataset_entries_ } : list_dataset_entries_response)

let make_list_dataset_entries_request
    ?max_results:(max_results_ : list_dataset_entries_page_size option)
    ?next_token:(next_token_ : extended_pagination_token option)
    ?has_errors:(has_errors_ : has_errors option)
    ?source_ref_contains:(source_ref_contains_ : query_string option)
    ?labeled:(labeled_ : is_labeled option)
    ?contains_labels:(contains_labels_ : dataset_labels option)
    ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     has_errors = has_errors_;
     source_ref_contains = source_ref_contains_;
     labeled = labeled_;
     contains_labels = contains_labels_;
     dataset_arn = dataset_arn_;
   }
    : list_dataset_entries_request)

let make_list_collections_response
    ?face_model_versions:(face_model_versions_ : face_model_version_list option)
    ?next_token:(next_token_ : pagination_token option)
    ?collection_ids:(collection_ids_ : collection_id_list option) () =
  ({
     face_model_versions = face_model_versions_;
     next_token = next_token_;
     collection_ids = collection_ids_;
   }
    : list_collections_response)

let make_list_collections_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_collections_request)

let make_face_record ?face_detail:(face_detail_ : face_detail option) ?face:(face_ : face option) ()
    =
  ({ face_detail = face_detail_; face = face_ } : face_record)

let make_index_faces_response ?unindexed_faces:(unindexed_faces_ : unindexed_faces option)
    ?face_model_version:(face_model_version_ : string_ option)
    ?orientation_correction:(orientation_correction_ : orientation_correction option)
    ?face_records:(face_records_ : face_record_list option) () =
  ({
     unindexed_faces = unindexed_faces_;
     face_model_version = face_model_version_;
     orientation_correction = orientation_correction_;
     face_records = face_records_;
   }
    : index_faces_response)

let make_index_faces_request ?quality_filter:(quality_filter_ : quality_filter option)
    ?max_faces:(max_faces_ : max_faces_to_index option)
    ?detection_attributes:(detection_attributes_ : attributes option)
    ?external_image_id:(external_image_id_ : external_image_id option) ~image:(image_ : image)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     quality_filter = quality_filter_;
     max_faces = max_faces_;
     detection_attributes = detection_attributes_;
     external_image_id = external_image_id_;
     image = image_;
     collection_id = collection_id_;
   }
    : index_faces_request)

let make_get_text_detection_response ?job_tag:(job_tag_ : job_tag option)
    ?video:(video_ : video option) ?job_id:(job_id_ : job_id option)
    ?text_model_version:(text_model_version_ : string_ option)
    ?next_token:(next_token_ : pagination_token option)
    ?text_detections:(text_detections_ : text_detection_results option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?status_message:(status_message_ : status_message option)
    ?job_status:(job_status_ : video_job_status option) () =
  ({
     job_tag = job_tag_;
     video = video_;
     job_id = job_id_;
     text_model_version = text_model_version_;
     next_token = next_token_;
     text_detections = text_detections_;
     video_metadata = video_metadata_;
     status_message = status_message_;
     job_status = job_status_;
   }
    : get_text_detection_response)

let make_get_text_detection_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_text_detection_request)

let make_audio_metadata ?number_of_channels:(number_of_channels_ : u_long option)
    ?sample_rate:(sample_rate_ : u_long option) ?duration_millis:(duration_millis_ : u_long option)
    ?codec:(codec_ : string_ option) () =
  ({
     number_of_channels = number_of_channels_;
     sample_rate = sample_rate_;
     duration_millis = duration_millis_;
     codec = codec_;
   }
    : audio_metadata)

let make_get_segment_detection_response ?job_tag:(job_tag_ : job_tag option)
    ?video:(video_ : video option) ?job_id:(job_id_ : job_id option)
    ?selected_segment_types:(selected_segment_types_ : segment_types_info option)
    ?segments:(segments_ : segment_detections option)
    ?next_token:(next_token_ : pagination_token option)
    ?audio_metadata:(audio_metadata_ : audio_metadata_list option)
    ?video_metadata:(video_metadata_ : video_metadata_list option)
    ?status_message:(status_message_ : status_message option)
    ?job_status:(job_status_ : video_job_status option) () =
  ({
     job_tag = job_tag_;
     video = video_;
     job_id = job_id_;
     selected_segment_types = selected_segment_types_;
     segments = segments_;
     next_token = next_token_;
     audio_metadata = audio_metadata_;
     video_metadata = video_metadata_;
     status_message = status_message_;
     job_status = job_status_;
   }
    : get_segment_detection_response)

let make_get_segment_detection_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_segment_detection_request)

let make_person_detail ?face:(face_ : face_detail option)
    ?bounding_box:(bounding_box_ : bounding_box option) ?index:(index_ : person_index option) () =
  ({ face = face_; bounding_box = bounding_box_; index = index_ } : person_detail)

let make_person_detection ?person:(person_ : person_detail option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({ person = person_; timestamp = timestamp_ } : person_detection)

let make_get_person_tracking_response ?job_tag:(job_tag_ : job_tag option)
    ?video:(video_ : video option) ?job_id:(job_id_ : job_id option)
    ?persons:(persons_ : person_detections option)
    ?next_token:(next_token_ : pagination_token option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?status_message:(status_message_ : status_message option)
    ?job_status:(job_status_ : video_job_status option) () =
  ({
     job_tag = job_tag_;
     video = video_;
     job_id = job_id_;
     persons = persons_;
     next_token = next_token_;
     video_metadata = video_metadata_;
     status_message = status_message_;
     job_status = job_status_;
   }
    : get_person_tracking_response)

let make_get_person_tracking_request ?sort_by:(sort_by_ : person_tracking_sort_by option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ sort_by = sort_by_; next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_person_tracking_request)

let make_get_media_analysis_job_response
    ?manifest_summary:(manifest_summary_ : media_analysis_manifest_summary option)
    ?results:(results_ : media_analysis_results option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?completion_timestamp:(completion_timestamp_ : date_time option)
    ?failure_details:(failure_details_ : media_analysis_job_failure_details option)
    ?job_name:(job_name_ : media_analysis_job_name option)
    ~output_config:(output_config_ : media_analysis_output_config)
    ~input:(input_ : media_analysis_input) ~creation_timestamp:(creation_timestamp_ : date_time)
    ~status:(status_ : media_analysis_job_status)
    ~operations_config:(operations_config_ : media_analysis_operations_config)
    ~job_id:(job_id_ : media_analysis_job_id) () =
  ({
     manifest_summary = manifest_summary_;
     results = results_;
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     input = input_;
     completion_timestamp = completion_timestamp_;
     creation_timestamp = creation_timestamp_;
     failure_details = failure_details_;
     status = status_;
     operations_config = operations_config_;
     job_name = job_name_;
     job_id = job_id_;
   }
    : get_media_analysis_job_response)

let make_get_media_analysis_job_request ~job_id:(job_id_ : media_analysis_job_id) () =
  ({ job_id = job_id_ } : get_media_analysis_job_request)

let make_dominant_color ?pixel_percent:(pixel_percent_ : percent option)
    ?simplified_color:(simplified_color_ : string_ option) ?css_color:(css_color_ : string_ option)
    ?hex_code:(hex_code_ : string_ option) ?green:(green_ : u_integer option)
    ?blue:(blue_ : u_integer option) ?red:(red_ : u_integer option) () =
  ({
     pixel_percent = pixel_percent_;
     simplified_color = simplified_color_;
     css_color = css_color_;
     hex_code = hex_code_;
     green = green_;
     blue = blue_;
     red = red_;
   }
    : dominant_color)

let make_instance ?dominant_colors:(dominant_colors_ : dominant_colors option)
    ?confidence:(confidence_ : percent option) ?bounding_box:(bounding_box_ : bounding_box option)
    () =
  ({ dominant_colors = dominant_colors_; confidence = confidence_; bounding_box = bounding_box_ }
    : instance)

let make_parent ?name:(name_ : string_ option) () = ({ name = name_ } : parent)
let make_label_alias ?name:(name_ : string_ option) () = ({ name = name_ } : label_alias)
let make_label_category ?name:(name_ : string_ option) () = ({ name = name_ } : label_category)

let make_label ?categories:(categories_ : label_categories option)
    ?aliases:(aliases_ : label_aliases option) ?parents:(parents_ : parents option)
    ?instances:(instances_ : instances option) ?confidence:(confidence_ : percent option)
    ?name:(name_ : string_ option) () =
  ({
     categories = categories_;
     aliases = aliases_;
     parents = parents_;
     instances = instances_;
     confidence = confidence_;
     name = name_;
   }
    : label)

let make_label_detection ?duration_millis:(duration_millis_ : u_long option)
    ?end_timestamp_millis:(end_timestamp_millis_ : u_long option)
    ?start_timestamp_millis:(start_timestamp_millis_ : u_long option) ?label:(label_ : label option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({
     duration_millis = duration_millis_;
     end_timestamp_millis = end_timestamp_millis_;
     start_timestamp_millis = start_timestamp_millis_;
     label = label_;
     timestamp = timestamp_;
   }
    : label_detection)

let make_get_label_detection_request_metadata
    ?aggregate_by:(aggregate_by_ : label_detection_aggregate_by option)
    ?sort_by:(sort_by_ : label_detection_sort_by option) () =
  ({ aggregate_by = aggregate_by_; sort_by = sort_by_ } : get_label_detection_request_metadata)

let make_get_label_detection_response
    ?get_request_metadata:(get_request_metadata_ : get_label_detection_request_metadata option)
    ?job_tag:(job_tag_ : job_tag option) ?video:(video_ : video option)
    ?job_id:(job_id_ : job_id option) ?label_model_version:(label_model_version_ : string_ option)
    ?labels:(labels_ : label_detections option) ?next_token:(next_token_ : pagination_token option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?status_message:(status_message_ : status_message option)
    ?job_status:(job_status_ : video_job_status option) () =
  ({
     get_request_metadata = get_request_metadata_;
     job_tag = job_tag_;
     video = video_;
     job_id = job_id_;
     label_model_version = label_model_version_;
     labels = labels_;
     next_token = next_token_;
     video_metadata = video_metadata_;
     status_message = status_message_;
     job_status = job_status_;
   }
    : get_label_detection_response)

let make_get_label_detection_request
    ?aggregate_by:(aggregate_by_ : label_detection_aggregate_by option)
    ?sort_by:(sort_by_ : label_detection_sort_by option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({
     aggregate_by = aggregate_by_;
     sort_by = sort_by_;
     next_token = next_token_;
     max_results = max_results_;
     job_id = job_id_;
   }
    : get_label_detection_request)

let make_person_match ?face_matches:(face_matches_ : face_match_list option)
    ?person:(person_ : person_detail option) ?timestamp:(timestamp_ : timestamp option) () =
  ({ face_matches = face_matches_; person = person_; timestamp = timestamp_ } : person_match)

let make_get_face_search_response ?job_tag:(job_tag_ : job_tag option)
    ?video:(video_ : video option) ?job_id:(job_id_ : job_id option)
    ?persons:(persons_ : person_matches option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?next_token:(next_token_ : pagination_token option)
    ?status_message:(status_message_ : status_message option)
    ?job_status:(job_status_ : video_job_status option) () =
  ({
     job_tag = job_tag_;
     video = video_;
     job_id = job_id_;
     persons = persons_;
     video_metadata = video_metadata_;
     next_token = next_token_;
     status_message = status_message_;
     job_status = job_status_;
   }
    : get_face_search_response)

let make_get_face_search_request ?sort_by:(sort_by_ : face_search_sort_by option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ sort_by = sort_by_; next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_face_search_request)

let make_audit_image ?bounding_box:(bounding_box_ : bounding_box option)
    ?s3_object:(s3_object_ : s3_object option) ?bytes:(bytes_ : liveness_image_blob option) () =
  ({ bounding_box = bounding_box_; s3_object = s3_object_; bytes = bytes_ } : audit_image)

let make_challenge ~version:(version_ : version) ~type_:(type__ : challenge_type) () =
  ({ version = version_; type_ = type__ } : challenge)

let make_get_face_liveness_session_results_response ?challenge:(challenge_ : challenge option)
    ?audit_images:(audit_images_ : audit_images option)
    ?reference_image:(reference_image_ : audit_image option)
    ?confidence:(confidence_ : percent option) ~status:(status_ : liveness_session_status)
    ~session_id:(session_id_ : liveness_session_id) () =
  ({
     challenge = challenge_;
     audit_images = audit_images_;
     reference_image = reference_image_;
     confidence = confidence_;
     status = status_;
     session_id = session_id_;
   }
    : get_face_liveness_session_results_response)

let make_get_face_liveness_session_results_request ~session_id:(session_id_ : liveness_session_id)
    () =
  ({ session_id = session_id_ } : get_face_liveness_session_results_request)

let make_face_detection ?face:(face_ : face_detail option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({ face = face_; timestamp = timestamp_ } : face_detection)

let make_get_face_detection_response ?job_tag:(job_tag_ : job_tag option)
    ?video:(video_ : video option) ?job_id:(job_id_ : job_id option)
    ?faces:(faces_ : face_detections option) ?next_token:(next_token_ : pagination_token option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?status_message:(status_message_ : status_message option)
    ?job_status:(job_status_ : video_job_status option) () =
  ({
     job_tag = job_tag_;
     video = video_;
     job_id = job_id_;
     faces = faces_;
     next_token = next_token_;
     video_metadata = video_metadata_;
     status_message = status_message_;
     job_status = job_status_;
   }
    : get_face_detection_response)

let make_get_face_detection_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_face_detection_request)

let make_moderation_label ?taxonomy_level:(taxonomy_level_ : u_integer option)
    ?parent_name:(parent_name_ : string_ option) ?name:(name_ : string_ option)
    ?confidence:(confidence_ : percent option) () =
  ({
     taxonomy_level = taxonomy_level_;
     parent_name = parent_name_;
     name = name_;
     confidence = confidence_;
   }
    : moderation_label)

let make_content_type ?name:(name_ : string_ option) ?confidence:(confidence_ : percent option) () =
  ({ name = name_; confidence = confidence_ } : content_type)

let make_content_moderation_detection ?content_types:(content_types_ : content_types option)
    ?duration_millis:(duration_millis_ : u_long option)
    ?end_timestamp_millis:(end_timestamp_millis_ : u_long option)
    ?start_timestamp_millis:(start_timestamp_millis_ : u_long option)
    ?moderation_label:(moderation_label_ : moderation_label option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({
     content_types = content_types_;
     duration_millis = duration_millis_;
     end_timestamp_millis = end_timestamp_millis_;
     start_timestamp_millis = start_timestamp_millis_;
     moderation_label = moderation_label_;
     timestamp = timestamp_;
   }
    : content_moderation_detection)

let make_get_content_moderation_request_metadata
    ?aggregate_by:(aggregate_by_ : content_moderation_aggregate_by option)
    ?sort_by:(sort_by_ : content_moderation_sort_by option) () =
  ({ aggregate_by = aggregate_by_; sort_by = sort_by_ } : get_content_moderation_request_metadata)

let make_get_content_moderation_response
    ?get_request_metadata:(get_request_metadata_ : get_content_moderation_request_metadata option)
    ?job_tag:(job_tag_ : job_tag option) ?video:(video_ : video option)
    ?job_id:(job_id_ : job_id option)
    ?moderation_model_version:(moderation_model_version_ : string_ option)
    ?next_token:(next_token_ : pagination_token option)
    ?moderation_labels:(moderation_labels_ : content_moderation_detections option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?status_message:(status_message_ : status_message option)
    ?job_status:(job_status_ : video_job_status option) () =
  ({
     get_request_metadata = get_request_metadata_;
     job_tag = job_tag_;
     video = video_;
     job_id = job_id_;
     moderation_model_version = moderation_model_version_;
     next_token = next_token_;
     moderation_labels = moderation_labels_;
     video_metadata = video_metadata_;
     status_message = status_message_;
     job_status = job_status_;
   }
    : get_content_moderation_response)

let make_get_content_moderation_request
    ?aggregate_by:(aggregate_by_ : content_moderation_aggregate_by option)
    ?sort_by:(sort_by_ : content_moderation_sort_by option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({
     aggregate_by = aggregate_by_;
     sort_by = sort_by_;
     next_token = next_token_;
     max_results = max_results_;
     job_id = job_id_;
   }
    : get_content_moderation_request)

let make_celebrity_detail ?known_gender:(known_gender_ : known_gender option)
    ?face:(face_ : face_detail option) ?bounding_box:(bounding_box_ : bounding_box option)
    ?confidence:(confidence_ : percent option) ?id:(id_ : rekognition_unique_id option)
    ?name:(name_ : string_ option) ?urls:(urls_ : urls option) () =
  ({
     known_gender = known_gender_;
     face = face_;
     bounding_box = bounding_box_;
     confidence = confidence_;
     id = id_;
     name = name_;
     urls = urls_;
   }
    : celebrity_detail)

let make_celebrity_recognition ?celebrity:(celebrity_ : celebrity_detail option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({ celebrity = celebrity_; timestamp = timestamp_ } : celebrity_recognition)

let make_get_celebrity_recognition_response ?job_tag:(job_tag_ : job_tag option)
    ?video:(video_ : video option) ?job_id:(job_id_ : job_id option)
    ?celebrities:(celebrities_ : celebrity_recognitions option)
    ?next_token:(next_token_ : pagination_token option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?status_message:(status_message_ : status_message option)
    ?job_status:(job_status_ : video_job_status option) () =
  ({
     job_tag = job_tag_;
     video = video_;
     job_id = job_id_;
     celebrities = celebrities_;
     next_token = next_token_;
     video_metadata = video_metadata_;
     status_message = status_message_;
     job_status = job_status_;
   }
    : get_celebrity_recognition_response)

let make_get_celebrity_recognition_request
    ?sort_by:(sort_by_ : celebrity_recognition_sort_by option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ sort_by = sort_by_; next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_celebrity_recognition_request)

let make_get_celebrity_info_response ?known_gender:(known_gender_ : known_gender option)
    ?name:(name_ : string_ option) ?urls:(urls_ : urls option) () =
  ({ known_gender = known_gender_; name = name_; urls = urls_ } : get_celebrity_info_response)

let make_get_celebrity_info_request ~id:(id_ : rekognition_unique_id) () =
  ({ id = id_ } : get_celebrity_info_request)

let make_distribute_dataset_entries_response () = (() : unit)
let make_distribute_dataset ~arn:(arn_ : dataset_arn) () = ({ arn = arn_ } : distribute_dataset)

let make_distribute_dataset_entries_request ~datasets:(datasets_ : distribute_dataset_metadata_list)
    () =
  ({ datasets = datasets_ } : distribute_dataset_entries_request)

let make_disassociated_face ?face_id:(face_id_ : face_id option) () =
  ({ face_id = face_id_ } : disassociated_face)

let make_disassociate_faces_response ?user_status:(user_status_ : user_status option)
    ?unsuccessful_face_disassociations:
      (unsuccessful_face_disassociations_ : unsuccessful_face_disassociation_list option)
    ?disassociated_faces:(disassociated_faces_ : disassociated_faces_list option) () =
  ({
     user_status = user_status_;
     unsuccessful_face_disassociations = unsuccessful_face_disassociations_;
     disassociated_faces = disassociated_faces_;
   }
    : disassociate_faces_response)

let make_disassociate_faces_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~face_ids:(face_ids_ : user_face_id_list) ~user_id:(user_id_ : user_id)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     face_ids = face_ids_;
     client_request_token = client_request_token_;
     user_id = user_id_;
     collection_id = collection_id_;
   }
    : disassociate_faces_request)

let make_detect_text_response ?text_model_version:(text_model_version_ : string_ option)
    ?text_detections:(text_detections_ : text_detection_list option) () =
  ({ text_model_version = text_model_version_; text_detections = text_detections_ }
    : detect_text_response)

let make_detect_text_filters
    ?regions_of_interest:(regions_of_interest_ : regions_of_interest option)
    ?word_filter:(word_filter_ : detection_filter option) () =
  ({ regions_of_interest = regions_of_interest_; word_filter = word_filter_ } : detect_text_filters)

let make_detect_text_request ?filters:(filters_ : detect_text_filters option)
    ~image:(image_ : image) () =
  ({ filters = filters_; image = image_ } : detect_text_request)

let make_covers_body_part ?value:(value_ : boolean_ option)
    ?confidence:(confidence_ : percent option) () =
  ({ value = value_; confidence = confidence_ } : covers_body_part)

let make_equipment_detection ?covers_body_part:(covers_body_part_ : covers_body_part option)
    ?type_:(type__ : protective_equipment_type option) ?confidence:(confidence_ : percent option)
    ?bounding_box:(bounding_box_ : bounding_box option) () =
  ({
     covers_body_part = covers_body_part_;
     type_ = type__;
     confidence = confidence_;
     bounding_box = bounding_box_;
   }
    : equipment_detection)

let make_protective_equipment_body_part
    ?equipment_detections:(equipment_detections_ : equipment_detections option)
    ?confidence:(confidence_ : percent option) ?name:(name_ : body_part option) () =
  ({ equipment_detections = equipment_detections_; confidence = confidence_; name = name_ }
    : protective_equipment_body_part)

let make_protective_equipment_person ?id:(id_ : u_integer option)
    ?confidence:(confidence_ : percent option) ?bounding_box:(bounding_box_ : bounding_box option)
    ?body_parts:(body_parts_ : body_parts option) () =
  ({ id = id_; confidence = confidence_; bounding_box = bounding_box_; body_parts = body_parts_ }
    : protective_equipment_person)

let make_protective_equipment_summary
    ?persons_indeterminate:(persons_indeterminate_ : protective_equipment_person_ids option)
    ?persons_without_required_equipment:
      (persons_without_required_equipment_ : protective_equipment_person_ids option)
    ?persons_with_required_equipment:
      (persons_with_required_equipment_ : protective_equipment_person_ids option) () =
  ({
     persons_indeterminate = persons_indeterminate_;
     persons_without_required_equipment = persons_without_required_equipment_;
     persons_with_required_equipment = persons_with_required_equipment_;
   }
    : protective_equipment_summary)

let make_detect_protective_equipment_response
    ?summary:(summary_ : protective_equipment_summary option)
    ?persons:(persons_ : protective_equipment_persons option)
    ?protective_equipment_model_version:(protective_equipment_model_version_ : string_ option) () =
  ({
     summary = summary_;
     persons = persons_;
     protective_equipment_model_version = protective_equipment_model_version_;
   }
    : detect_protective_equipment_response)

let make_protective_equipment_summarization_attributes
    ~required_equipment_types:(required_equipment_types_ : protective_equipment_types)
    ~min_confidence:(min_confidence_ : percent) () =
  ({ required_equipment_types = required_equipment_types_; min_confidence = min_confidence_ }
    : protective_equipment_summarization_attributes)

let make_detect_protective_equipment_request
    ?summarization_attributes:
      (summarization_attributes_ : protective_equipment_summarization_attributes option)
    ~image:(image_ : image) () =
  ({ summarization_attributes = summarization_attributes_; image = image_ }
    : detect_protective_equipment_request)

let make_human_loop_activation_output
    ?human_loop_activation_conditions_evaluation_results:
      (human_loop_activation_conditions_evaluation_results_ :
         synthesized_json_human_loop_activation_conditions_evaluation_results option)
    ?human_loop_activation_reasons:
      (human_loop_activation_reasons_ : human_loop_activation_reasons option)
    ?human_loop_arn:(human_loop_arn_ : human_loop_arn option) () =
  ({
     human_loop_activation_conditions_evaluation_results =
       human_loop_activation_conditions_evaluation_results_;
     human_loop_activation_reasons = human_loop_activation_reasons_;
     human_loop_arn = human_loop_arn_;
   }
    : human_loop_activation_output)

let make_detect_moderation_labels_response ?content_types:(content_types_ : content_types option)
    ?project_version:(project_version_ : project_version_id option)
    ?human_loop_activation_output:
      (human_loop_activation_output_ : human_loop_activation_output option)
    ?moderation_model_version:(moderation_model_version_ : string_ option)
    ?moderation_labels:(moderation_labels_ : moderation_labels option) () =
  ({
     content_types = content_types_;
     project_version = project_version_;
     human_loop_activation_output = human_loop_activation_output_;
     moderation_model_version = moderation_model_version_;
     moderation_labels = moderation_labels_;
   }
    : detect_moderation_labels_response)

let make_human_loop_data_attributes
    ?content_classifiers:(content_classifiers_ : content_classifiers option) () =
  ({ content_classifiers = content_classifiers_ } : human_loop_data_attributes)

let make_human_loop_config ?data_attributes:(data_attributes_ : human_loop_data_attributes option)
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn)
    ~human_loop_name:(human_loop_name_ : human_loop_name) () =
  ({
     data_attributes = data_attributes_;
     flow_definition_arn = flow_definition_arn_;
     human_loop_name = human_loop_name_;
   }
    : human_loop_config)

let make_detect_moderation_labels_request
    ?project_version:(project_version_ : project_version_id option)
    ?human_loop_config:(human_loop_config_ : human_loop_config option)
    ?min_confidence:(min_confidence_ : percent option) ~image:(image_ : image) () =
  ({
     project_version = project_version_;
     human_loop_config = human_loop_config_;
     min_confidence = min_confidence_;
     image = image_;
   }
    : detect_moderation_labels_request)

let make_detect_labels_image_quality ?contrast:(contrast_ : float_ option)
    ?sharpness:(sharpness_ : float_ option) ?brightness:(brightness_ : float_ option) () =
  ({ contrast = contrast_; sharpness = sharpness_; brightness = brightness_ }
    : detect_labels_image_quality)

let make_detect_labels_image_foreground ?dominant_colors:(dominant_colors_ : dominant_colors option)
    ?quality:(quality_ : detect_labels_image_quality option) () =
  ({ dominant_colors = dominant_colors_; quality = quality_ } : detect_labels_image_foreground)

let make_detect_labels_image_background ?dominant_colors:(dominant_colors_ : dominant_colors option)
    ?quality:(quality_ : detect_labels_image_quality option) () =
  ({ dominant_colors = dominant_colors_; quality = quality_ } : detect_labels_image_background)

let make_detect_labels_image_properties
    ?background:(background_ : detect_labels_image_background option)
    ?foreground:(foreground_ : detect_labels_image_foreground option)
    ?dominant_colors:(dominant_colors_ : dominant_colors option)
    ?quality:(quality_ : detect_labels_image_quality option) () =
  ({
     background = background_;
     foreground = foreground_;
     dominant_colors = dominant_colors_;
     quality = quality_;
   }
    : detect_labels_image_properties)

let make_detect_labels_response
    ?image_properties:(image_properties_ : detect_labels_image_properties option)
    ?label_model_version:(label_model_version_ : string_ option)
    ?orientation_correction:(orientation_correction_ : orientation_correction option)
    ?labels:(labels_ : labels option) () =
  ({
     image_properties = image_properties_;
     label_model_version = label_model_version_;
     orientation_correction = orientation_correction_;
     labels = labels_;
   }
    : detect_labels_response)

let make_detect_labels_image_properties_settings
    ?max_dominant_colors:(max_dominant_colors_ : detect_labels_max_dominant_colors option) () =
  ({ max_dominant_colors = max_dominant_colors_ } : detect_labels_image_properties_settings)

let make_detect_labels_settings
    ?image_properties:(image_properties_ : detect_labels_image_properties_settings option)
    ?general_labels:(general_labels_ : general_labels_settings option) () =
  ({ image_properties = image_properties_; general_labels = general_labels_ }
    : detect_labels_settings)

let make_detect_labels_request ?settings:(settings_ : detect_labels_settings option)
    ?features:(features_ : detect_labels_feature_list option)
    ?min_confidence:(min_confidence_ : percent option) ?max_labels:(max_labels_ : u_integer option)
    ~image:(image_ : image) () =
  ({
     settings = settings_;
     features = features_;
     min_confidence = min_confidence_;
     max_labels = max_labels_;
     image = image_;
   }
    : detect_labels_request)

let make_detect_faces_response
    ?orientation_correction:(orientation_correction_ : orientation_correction option)
    ?face_details:(face_details_ : face_detail_list option) () =
  ({ orientation_correction = orientation_correction_; face_details = face_details_ }
    : detect_faces_response)

let make_detect_faces_request ?attributes:(attributes_ : attributes option) ~image:(image_ : image)
    () =
  ({ attributes = attributes_; image = image_ } : detect_faces_request)

let make_custom_label ?geometry:(geometry_ : geometry option)
    ?confidence:(confidence_ : percent option) ?name:(name_ : string_ option) () =
  ({ geometry = geometry_; confidence = confidence_; name = name_ } : custom_label)

let make_detect_custom_labels_response ?custom_labels:(custom_labels_ : custom_labels option) () =
  ({ custom_labels = custom_labels_ } : detect_custom_labels_response)

let make_detect_custom_labels_request ?min_confidence:(min_confidence_ : percent option)
    ?max_results:(max_results_ : u_integer option) ~image:(image_ : image)
    ~project_version_arn:(project_version_arn_ : project_version_arn) () =
  ({
     min_confidence = min_confidence_;
     max_results = max_results_;
     image = image_;
     project_version_arn = project_version_arn_;
   }
    : detect_custom_labels_request)

let make_describe_stream_processor_response
    ?data_sharing_preference:
      (data_sharing_preference_ : stream_processor_data_sharing_preference option)
    ?regions_of_interest:(regions_of_interest_ : regions_of_interest option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?notification_channel:(notification_channel_ : stream_processor_notification_channel option)
    ?settings:(settings_ : stream_processor_settings option) ?role_arn:(role_arn_ : role_arn option)
    ?output:(output_ : stream_processor_output option)
    ?input:(input_ : stream_processor_input option)
    ?last_update_timestamp:(last_update_timestamp_ : date_time option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?status_message:(status_message_ : string_ option)
    ?status:(status_ : stream_processor_status option)
    ?stream_processor_arn:(stream_processor_arn_ : stream_processor_arn option)
    ?name:(name_ : stream_processor_name option) () =
  ({
     data_sharing_preference = data_sharing_preference_;
     regions_of_interest = regions_of_interest_;
     kms_key_id = kms_key_id_;
     notification_channel = notification_channel_;
     settings = settings_;
     role_arn = role_arn_;
     output = output_;
     input = input_;
     last_update_timestamp = last_update_timestamp_;
     creation_timestamp = creation_timestamp_;
     status_message = status_message_;
     status = status_;
     stream_processor_arn = stream_processor_arn_;
     name = name_;
   }
    : describe_stream_processor_response)

let make_describe_stream_processor_request ~name:(name_ : stream_processor_name) () =
  ({ name = name_ } : describe_stream_processor_request)

let make_output_config ?s3_key_prefix:(s3_key_prefix_ : s3_key_prefix option)
    ?s3_bucket:(s3_bucket_ : s3_bucket option) () =
  ({ s3_key_prefix = s3_key_prefix_; s3_bucket = s3_bucket_ } : output_config)

let make_customization_feature_content_moderation_config
    ?confidence_threshold:(confidence_threshold_ : percent option) () =
  ({ confidence_threshold = confidence_threshold_ }
    : customization_feature_content_moderation_config)

let make_customization_feature_config
    ?content_moderation:
      (content_moderation_ : customization_feature_content_moderation_config option) () =
  ({ content_moderation = content_moderation_ } : customization_feature_config)

let make_project_version_description
    ?feature_config:(feature_config_ : customization_feature_config option)
    ?base_model_version:(base_model_version_ : string_ option)
    ?feature:(feature_ : customization_feature option)
    ?version_description:(version_description_ : version_description option)
    ?source_project_version_arn:(source_project_version_arn_ : project_version_arn option)
    ?max_inference_units:(max_inference_units_ : inference_units option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?manifest_summary:(manifest_summary_ : ground_truth_manifest option)
    ?evaluation_result:(evaluation_result_ : evaluation_result option)
    ?testing_data_result:(testing_data_result_ : testing_data_result option)
    ?training_data_result:(training_data_result_ : training_data_result option)
    ?output_config:(output_config_ : output_config option)
    ?training_end_timestamp:(training_end_timestamp_ : date_time option)
    ?billable_training_time_in_seconds:(billable_training_time_in_seconds_ : u_long option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : project_version_status option)
    ?min_inference_units:(min_inference_units_ : inference_units option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?project_version_arn:(project_version_arn_ : project_version_arn option) () =
  ({
     feature_config = feature_config_;
     base_model_version = base_model_version_;
     feature = feature_;
     version_description = version_description_;
     source_project_version_arn = source_project_version_arn_;
     max_inference_units = max_inference_units_;
     kms_key_id = kms_key_id_;
     manifest_summary = manifest_summary_;
     evaluation_result = evaluation_result_;
     testing_data_result = testing_data_result_;
     training_data_result = training_data_result_;
     output_config = output_config_;
     training_end_timestamp = training_end_timestamp_;
     billable_training_time_in_seconds = billable_training_time_in_seconds_;
     status_message = status_message_;
     status = status_;
     min_inference_units = min_inference_units_;
     creation_timestamp = creation_timestamp_;
     project_version_arn = project_version_arn_;
   }
    : project_version_description)

let make_describe_project_versions_response
    ?next_token:(next_token_ : extended_pagination_token option)
    ?project_version_descriptions:
      (project_version_descriptions_ : project_version_descriptions option) () =
  ({ next_token = next_token_; project_version_descriptions = project_version_descriptions_ }
    : describe_project_versions_response)

let make_describe_project_versions_request
    ?max_results:(max_results_ : project_versions_page_size option)
    ?next_token:(next_token_ : extended_pagination_token option)
    ?version_names:(version_names_ : version_names option) ~project_arn:(project_arn_ : project_arn)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     version_names = version_names_;
     project_arn = project_arn_;
   }
    : describe_project_versions_request)

let make_dataset_metadata
    ?status_message_code:(status_message_code_ : dataset_status_message_code option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : dataset_status option) ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_type:(dataset_type_ : dataset_type option)
    ?creation_timestamp:(creation_timestamp_ : date_time option) () =
  ({
     status_message_code = status_message_code_;
     status_message = status_message_;
     status = status_;
     dataset_arn = dataset_arn_;
     dataset_type = dataset_type_;
     creation_timestamp = creation_timestamp_;
   }
    : dataset_metadata)

let make_project_description ?auto_update:(auto_update_ : project_auto_update option)
    ?feature:(feature_ : customization_feature option)
    ?datasets:(datasets_ : dataset_metadata_list option) ?status:(status_ : project_status option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?project_arn:(project_arn_ : project_arn option) () =
  ({
     auto_update = auto_update_;
     feature = feature_;
     datasets = datasets_;
     status = status_;
     creation_timestamp = creation_timestamp_;
     project_arn = project_arn_;
   }
    : project_description)

let make_describe_projects_response ?next_token:(next_token_ : extended_pagination_token option)
    ?project_descriptions:(project_descriptions_ : project_descriptions option) () =
  ({ next_token = next_token_; project_descriptions = project_descriptions_ }
    : describe_projects_response)

let make_describe_projects_request ?features:(features_ : customization_features option)
    ?project_names:(project_names_ : project_names option)
    ?max_results:(max_results_ : projects_page_size option)
    ?next_token:(next_token_ : extended_pagination_token option) () =
  ({
     features = features_;
     project_names = project_names_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_projects_request)

let make_dataset_stats ?error_entries:(error_entries_ : u_integer option)
    ?total_labels:(total_labels_ : u_integer option)
    ?total_entries:(total_entries_ : u_integer option)
    ?labeled_entries:(labeled_entries_ : u_integer option) () =
  ({
     error_entries = error_entries_;
     total_labels = total_labels_;
     total_entries = total_entries_;
     labeled_entries = labeled_entries_;
   }
    : dataset_stats)

let make_dataset_description ?dataset_stats:(dataset_stats_ : dataset_stats option)
    ?status_message_code:(status_message_code_ : dataset_status_message_code option)
    ?status_message:(status_message_ : status_message option)
    ?status:(status_ : dataset_status option)
    ?last_updated_timestamp:(last_updated_timestamp_ : date_time option)
    ?creation_timestamp:(creation_timestamp_ : date_time option) () =
  ({
     dataset_stats = dataset_stats_;
     status_message_code = status_message_code_;
     status_message = status_message_;
     status = status_;
     last_updated_timestamp = last_updated_timestamp_;
     creation_timestamp = creation_timestamp_;
   }
    : dataset_description)

let make_describe_dataset_response
    ?dataset_description:(dataset_description_ : dataset_description option) () =
  ({ dataset_description = dataset_description_ } : describe_dataset_response)

let make_describe_dataset_request ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({ dataset_arn = dataset_arn_ } : describe_dataset_request)

let make_describe_collection_response ?user_count:(user_count_ : u_long option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?collection_ar_n:(collection_ar_n_ : string_ option)
    ?face_model_version:(face_model_version_ : string_ option)
    ?face_count:(face_count_ : u_long option) () =
  ({
     user_count = user_count_;
     creation_timestamp = creation_timestamp_;
     collection_ar_n = collection_ar_n_;
     face_model_version = face_model_version_;
     face_count = face_count_;
   }
    : describe_collection_response)

let make_describe_collection_request ~collection_id:(collection_id_ : collection_id) () =
  ({ collection_id = collection_id_ } : describe_collection_request)

let make_delete_user_response () = (() : unit)

let make_delete_user_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~user_id:(user_id_ : user_id) ~collection_id:(collection_id_ : collection_id) () =
  ({
     client_request_token = client_request_token_;
     user_id = user_id_;
     collection_id = collection_id_;
   }
    : delete_user_request)

let make_delete_stream_processor_response () = (() : unit)

let make_delete_stream_processor_request ~name:(name_ : stream_processor_name) () =
  ({ name = name_ } : delete_stream_processor_request)

let make_delete_project_version_response ?status:(status_ : project_version_status option) () =
  ({ status = status_ } : delete_project_version_response)

let make_delete_project_version_request
    ~project_version_arn:(project_version_arn_ : project_version_arn) () =
  ({ project_version_arn = project_version_arn_ } : delete_project_version_request)

let make_delete_project_policy_response () = (() : unit)

let make_delete_project_policy_request
    ?policy_revision_id:(policy_revision_id_ : project_policy_revision_id option)
    ~policy_name:(policy_name_ : project_policy_name) ~project_arn:(project_arn_ : project_arn) () =
  ({
     policy_revision_id = policy_revision_id_;
     policy_name = policy_name_;
     project_arn = project_arn_;
   }
    : delete_project_policy_request)

let make_delete_project_response ?status:(status_ : project_status option) () =
  ({ status = status_ } : delete_project_response)

let make_delete_project_request ~project_arn:(project_arn_ : project_arn) () =
  ({ project_arn = project_arn_ } : delete_project_request)

let make_delete_faces_response
    ?unsuccessful_face_deletions:
      (unsuccessful_face_deletions_ : unsuccessful_face_deletions_list option)
    ?deleted_faces:(deleted_faces_ : face_id_list option) () =
  ({ unsuccessful_face_deletions = unsuccessful_face_deletions_; deleted_faces = deleted_faces_ }
    : delete_faces_response)

let make_delete_faces_request ~face_ids:(face_ids_ : face_id_list)
    ~collection_id:(collection_id_ : collection_id) () =
  ({ face_ids = face_ids_; collection_id = collection_id_ } : delete_faces_request)

let make_delete_dataset_response () = (() : unit)

let make_delete_dataset_request ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({ dataset_arn = dataset_arn_ } : delete_dataset_request)

let make_delete_collection_response ?status_code:(status_code_ : u_integer option) () =
  ({ status_code = status_code_ } : delete_collection_response)

let make_delete_collection_request ~collection_id:(collection_id_ : collection_id) () =
  ({ collection_id = collection_id_ } : delete_collection_request)

let make_create_user_response () = (() : unit)

let make_create_user_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~user_id:(user_id_ : user_id) ~collection_id:(collection_id_ : collection_id) () =
  ({
     client_request_token = client_request_token_;
     user_id = user_id_;
     collection_id = collection_id_;
   }
    : create_user_request)

let make_create_stream_processor_response
    ?stream_processor_arn:(stream_processor_arn_ : stream_processor_arn option) () =
  ({ stream_processor_arn = stream_processor_arn_ } : create_stream_processor_response)

let make_create_stream_processor_request
    ?data_sharing_preference:
      (data_sharing_preference_ : stream_processor_data_sharing_preference option)
    ?regions_of_interest:(regions_of_interest_ : regions_of_interest option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?notification_channel:(notification_channel_ : stream_processor_notification_channel option)
    ?tags:(tags_ : tag_map option) ~role_arn:(role_arn_ : role_arn)
    ~settings:(settings_ : stream_processor_settings) ~name:(name_ : stream_processor_name)
    ~output:(output_ : stream_processor_output) ~input:(input_ : stream_processor_input) () =
  ({
     data_sharing_preference = data_sharing_preference_;
     regions_of_interest = regions_of_interest_;
     kms_key_id = kms_key_id_;
     notification_channel = notification_channel_;
     tags = tags_;
     role_arn = role_arn_;
     settings = settings_;
     name = name_;
     output = output_;
     input = input_;
   }
    : create_stream_processor_request)

let make_create_project_version_response
    ?project_version_arn:(project_version_arn_ : project_version_arn option) () =
  ({ project_version_arn = project_version_arn_ } : create_project_version_response)

let make_create_project_version_request
    ?feature_config:(feature_config_ : customization_feature_config option)
    ?version_description:(version_description_ : version_description option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?tags:(tags_ : tag_map option)
    ?testing_data:(testing_data_ : testing_data option)
    ?training_data:(training_data_ : training_data option)
    ~output_config:(output_config_ : output_config) ~version_name:(version_name_ : version_name)
    ~project_arn:(project_arn_ : project_arn) () =
  ({
     feature_config = feature_config_;
     version_description = version_description_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     testing_data = testing_data_;
     training_data = training_data_;
     output_config = output_config_;
     version_name = version_name_;
     project_arn = project_arn_;
   }
    : create_project_version_request)

let make_create_project_response ?project_arn:(project_arn_ : project_arn option) () =
  ({ project_arn = project_arn_ } : create_project_response)

let make_create_project_request ?tags:(tags_ : tag_map option)
    ?auto_update:(auto_update_ : project_auto_update option)
    ?feature:(feature_ : customization_feature option) ~project_name:(project_name_ : project_name)
    () =
  ({ tags = tags_; auto_update = auto_update_; feature = feature_; project_name = project_name_ }
    : create_project_request)

let make_create_face_liveness_session_response ~session_id:(session_id_ : liveness_session_id) () =
  ({ session_id = session_id_ } : create_face_liveness_session_response)

let make_liveness_output_config ?s3_key_prefix:(s3_key_prefix_ : liveness_s3_key_prefix option)
    ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_key_prefix = s3_key_prefix_; s3_bucket = s3_bucket_ } : liveness_output_config)

let make_challenge_preference ?versions:(versions_ : versions option)
    ~type_:(type__ : challenge_type) () =
  ({ versions = versions_; type_ = type__ } : challenge_preference)

let make_create_face_liveness_session_request_settings
    ?challenge_preferences:(challenge_preferences_ : challenge_preferences option)
    ?audit_images_limit:(audit_images_limit_ : audit_images_limit option)
    ?output_config:(output_config_ : liveness_output_config option) () =
  ({
     challenge_preferences = challenge_preferences_;
     audit_images_limit = audit_images_limit_;
     output_config = output_config_;
   }
    : create_face_liveness_session_request_settings)

let make_create_face_liveness_session_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?settings:(settings_ : create_face_liveness_session_request_settings option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({ client_request_token = client_request_token_; settings = settings_; kms_key_id = kms_key_id_ }
    : create_face_liveness_session_request)

let make_create_dataset_response ?dataset_arn:(dataset_arn_ : dataset_arn option) () =
  ({ dataset_arn = dataset_arn_ } : create_dataset_response)

let make_dataset_source ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?ground_truth_manifest:(ground_truth_manifest_ : ground_truth_manifest option) () =
  ({ dataset_arn = dataset_arn_; ground_truth_manifest = ground_truth_manifest_ } : dataset_source)

let make_create_dataset_request ?tags:(tags_ : tag_map option)
    ?dataset_source:(dataset_source_ : dataset_source option)
    ~project_arn:(project_arn_ : project_arn) ~dataset_type:(dataset_type_ : dataset_type) () =
  ({
     tags = tags_;
     project_arn = project_arn_;
     dataset_type = dataset_type_;
     dataset_source = dataset_source_;
   }
    : create_dataset_request)

let make_create_collection_response ?face_model_version:(face_model_version_ : string_ option)
    ?collection_arn:(collection_arn_ : string_ option)
    ?status_code:(status_code_ : u_integer option) () =
  ({
     face_model_version = face_model_version_;
     collection_arn = collection_arn_;
     status_code = status_code_;
   }
    : create_collection_response)

let make_create_collection_request ?tags:(tags_ : tag_map option)
    ~collection_id:(collection_id_ : collection_id) () =
  ({ tags = tags_; collection_id = collection_id_ } : create_collection_request)

let make_copy_project_version_response
    ?project_version_arn:(project_version_arn_ : project_version_arn option) () =
  ({ project_version_arn = project_version_arn_ } : copy_project_version_response)

let make_copy_project_version_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?tags:(tags_ : tag_map option) ~output_config:(output_config_ : output_config)
    ~version_name:(version_name_ : version_name)
    ~destination_project_arn:(destination_project_arn_ : project_arn)
    ~source_project_version_arn:(source_project_version_arn_ : project_version_arn)
    ~source_project_arn:(source_project_arn_ : project_arn) () =
  ({
     kms_key_id = kms_key_id_;
     tags = tags_;
     output_config = output_config_;
     version_name = version_name_;
     destination_project_arn = destination_project_arn_;
     source_project_version_arn = source_project_version_arn_;
     source_project_arn = source_project_arn_;
   }
    : copy_project_version_request)

let make_compared_source_image_face ?confidence:(confidence_ : percent option)
    ?bounding_box:(bounding_box_ : bounding_box option) () =
  ({ confidence = confidence_; bounding_box = bounding_box_ } : compared_source_image_face)

let make_compare_faces_match ?face:(face_ : compared_face option)
    ?similarity:(similarity_ : percent option) () =
  ({ face = face_; similarity = similarity_ } : compare_faces_match)

let make_compare_faces_response
    ?target_image_orientation_correction:
      (target_image_orientation_correction_ : orientation_correction option)
    ?source_image_orientation_correction:
      (source_image_orientation_correction_ : orientation_correction option)
    ?unmatched_faces:(unmatched_faces_ : compare_faces_unmatch_list option)
    ?face_matches:(face_matches_ : compare_faces_match_list option)
    ?source_image_face:(source_image_face_ : compared_source_image_face option) () =
  ({
     target_image_orientation_correction = target_image_orientation_correction_;
     source_image_orientation_correction = source_image_orientation_correction_;
     unmatched_faces = unmatched_faces_;
     face_matches = face_matches_;
     source_image_face = source_image_face_;
   }
    : compare_faces_response)

let make_compare_faces_request ?quality_filter:(quality_filter_ : quality_filter option)
    ?similarity_threshold:(similarity_threshold_ : percent option)
    ~target_image:(target_image_ : image) ~source_image:(source_image_ : image) () =
  ({
     quality_filter = quality_filter_;
     similarity_threshold = similarity_threshold_;
     target_image = target_image_;
     source_image = source_image_;
   }
    : compare_faces_request)

let make_associated_face ?face_id:(face_id_ : face_id option) () =
  ({ face_id = face_id_ } : associated_face)

let make_associate_faces_response ?user_status:(user_status_ : user_status option)
    ?unsuccessful_face_associations:
      (unsuccessful_face_associations_ : unsuccessful_face_association_list option)
    ?associated_faces:(associated_faces_ : associated_faces_list option) () =
  ({
     user_status = user_status_;
     unsuccessful_face_associations = unsuccessful_face_associations_;
     associated_faces = associated_faces_;
   }
    : associate_faces_response)

let make_associate_faces_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?user_match_threshold:(user_match_threshold_ : percent option)
    ~face_ids:(face_ids_ : user_face_id_list) ~user_id:(user_id_ : user_id)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     client_request_token = client_request_token_;
     user_match_threshold = user_match_threshold_;
     face_ids = face_ids_;
     user_id = user_id_;
     collection_id = collection_id_;
   }
    : associate_faces_request)
