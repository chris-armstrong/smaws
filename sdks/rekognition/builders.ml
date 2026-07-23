open Types

let make_age_range ?low:(low_ : u_integer option) ?high:(high_ : u_integer option) () =
  ({ low = low_; high = high_ } : age_range)

let make_s3_object ?bucket:(bucket_ : s3_bucket option) ?name:(name_ : s3_object_name option)
    ?version:(version_ : s3_object_version option) () =
  ({ bucket = bucket_; name = name_; version = version_ } : s3_object)

let make_ground_truth_manifest ?s3_object:(s3_object_ : s3_object option) () =
  ({ s3_object = s3_object_ } : ground_truth_manifest)

let make_asset ?ground_truth_manifest:(ground_truth_manifest_ : ground_truth_manifest option) () =
  ({ ground_truth_manifest = ground_truth_manifest_ } : asset)

let make_unsuccessful_face_association ?face_id:(face_id_ : face_id option)
    ?user_id:(user_id_ : user_id option) ?confidence:(confidence_ : percent option)
    ?reasons:(reasons_ : unsuccessful_face_association_reasons option) () =
  ({ face_id = face_id_; user_id = user_id_; confidence = confidence_; reasons = reasons_ }
    : unsuccessful_face_association)

let make_associated_face ?face_id:(face_id_ : face_id option) () =
  ({ face_id = face_id_ } : associated_face)

let make_associate_faces_response
    ?associated_faces:(associated_faces_ : associated_faces_list option)
    ?unsuccessful_face_associations:
      (unsuccessful_face_associations_ : unsuccessful_face_association_list option)
    ?user_status:(user_status_ : user_status option) () =
  ({
     associated_faces = associated_faces_;
     unsuccessful_face_associations = unsuccessful_face_associations_;
     user_status = user_status_;
   }
    : associate_faces_response)

let make_associate_faces_request ?user_match_threshold:(user_match_threshold_ : percent option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~collection_id:(collection_id_ : collection_id) ~user_id:(user_id_ : user_id)
    ~face_ids:(face_ids_ : user_face_id_list) () =
  ({
     collection_id = collection_id_;
     user_id = user_id_;
     face_ids = face_ids_;
     user_match_threshold = user_match_threshold_;
     client_request_token = client_request_token_;
   }
    : associate_faces_request)

let make_audio_metadata ?codec:(codec_ : string_ option)
    ?duration_millis:(duration_millis_ : u_long option) ?sample_rate:(sample_rate_ : u_long option)
    ?number_of_channels:(number_of_channels_ : u_long option) () =
  ({
     codec = codec_;
     duration_millis = duration_millis_;
     sample_rate = sample_rate_;
     number_of_channels = number_of_channels_;
   }
    : audio_metadata)

let make_bounding_box ?width:(width_ : float_ option) ?height:(height_ : float_ option)
    ?left:(left_ : float_ option) ?top:(top_ : float_ option) () =
  ({ width = width_; height = height_; left = left_; top = top_ } : bounding_box)

let make_audit_image ?bytes:(bytes_ : liveness_image_blob option)
    ?s3_object:(s3_object_ : s3_object option) ?bounding_box:(bounding_box_ : bounding_box option)
    () =
  ({ bytes = bytes_; s3_object = s3_object_; bounding_box = bounding_box_ } : audit_image)

let make_beard ?value:(value_ : boolean_ option) ?confidence:(confidence_ : percent option) () =
  ({ value = value_; confidence = confidence_ } : beard)

let make_black_frame ?max_pixel_threshold:(max_pixel_threshold_ : max_pixel_threshold option)
    ?min_coverage_percentage:(min_coverage_percentage_ : min_coverage_percentage option) () =
  ({
     max_pixel_threshold = max_pixel_threshold_;
     min_coverage_percentage = min_coverage_percentage_;
   }
    : black_frame)

let make_covers_body_part ?confidence:(confidence_ : percent option)
    ?value:(value_ : boolean_ option) () =
  ({ confidence = confidence_; value = value_ } : covers_body_part)

let make_equipment_detection ?bounding_box:(bounding_box_ : bounding_box option)
    ?confidence:(confidence_ : percent option) ?type_:(type__ : protective_equipment_type option)
    ?covers_body_part:(covers_body_part_ : covers_body_part option) () =
  ({
     bounding_box = bounding_box_;
     confidence = confidence_;
     type_ = type__;
     covers_body_part = covers_body_part_;
   }
    : equipment_detection)

let make_protective_equipment_body_part ?name:(name_ : body_part option)
    ?confidence:(confidence_ : percent option)
    ?equipment_detections:(equipment_detections_ : equipment_detections option) () =
  ({ name = name_; confidence = confidence_; equipment_detections = equipment_detections_ }
    : protective_equipment_body_part)

let make_known_gender ?type_:(type__ : known_gender_type option) () =
  ({ type_ = type__ } : known_gender)

let make_smile ?value:(value_ : boolean_ option) ?confidence:(confidence_ : percent option) () =
  ({ value = value_; confidence = confidence_ } : smile)

let make_emotion ?type_:(type__ : emotion_name option) ?confidence:(confidence_ : percent option) ()
    =
  ({ type_ = type__; confidence = confidence_ } : emotion)

let make_image_quality ?brightness:(brightness_ : float_ option)
    ?sharpness:(sharpness_ : float_ option) () =
  ({ brightness = brightness_; sharpness = sharpness_ } : image_quality)

let make_pose ?roll:(roll_ : degree option) ?yaw:(yaw_ : degree option)
    ?pitch:(pitch_ : degree option) () =
  ({ roll = roll_; yaw = yaw_; pitch = pitch_ } : pose)

let make_landmark ?type_:(type__ : landmark_type option) ?x:(x_ : float_ option)
    ?y:(y_ : float_ option) () =
  ({ type_ = type__; x = x_; y = y_ } : landmark)

let make_compared_face ?bounding_box:(bounding_box_ : bounding_box option)
    ?confidence:(confidence_ : percent option) ?landmarks:(landmarks_ : landmarks option)
    ?pose:(pose_ : pose option) ?quality:(quality_ : image_quality option)
    ?emotions:(emotions_ : emotions option) ?smile:(smile_ : smile option) () =
  ({
     bounding_box = bounding_box_;
     confidence = confidence_;
     landmarks = landmarks_;
     pose = pose_;
     quality = quality_;
     emotions = emotions_;
     smile = smile_;
   }
    : compared_face)

let make_celebrity ?urls:(urls_ : urls option) ?name:(name_ : string_ option)
    ?id:(id_ : rekognition_unique_id option) ?face:(face_ : compared_face option)
    ?match_confidence:(match_confidence_ : percent option)
    ?known_gender:(known_gender_ : known_gender option) () =
  ({
     urls = urls_;
     name = name_;
     id = id_;
     face = face_;
     match_confidence = match_confidence_;
     known_gender = known_gender_;
   }
    : celebrity)

let make_eye_direction ?yaw:(yaw_ : degree option) ?pitch:(pitch_ : degree option)
    ?confidence:(confidence_ : percent option) () =
  ({ yaw = yaw_; pitch = pitch_; confidence = confidence_ } : eye_direction)

let make_face_occluded ?value:(value_ : boolean_ option) ?confidence:(confidence_ : percent option)
    () =
  ({ value = value_; confidence = confidence_ } : face_occluded)

let make_mouth_open ?value:(value_ : boolean_ option) ?confidence:(confidence_ : percent option) ()
    =
  ({ value = value_; confidence = confidence_ } : mouth_open)

let make_eye_open ?value:(value_ : boolean_ option) ?confidence:(confidence_ : percent option) () =
  ({ value = value_; confidence = confidence_ } : eye_open)

let make_mustache ?value:(value_ : boolean_ option) ?confidence:(confidence_ : percent option) () =
  ({ value = value_; confidence = confidence_ } : mustache)

let make_gender ?value:(value_ : gender_type option) ?confidence:(confidence_ : percent option) () =
  ({ value = value_; confidence = confidence_ } : gender)

let make_sunglasses ?value:(value_ : boolean_ option) ?confidence:(confidence_ : percent option) ()
    =
  ({ value = value_; confidence = confidence_ } : sunglasses)

let make_eyeglasses ?value:(value_ : boolean_ option) ?confidence:(confidence_ : percent option) ()
    =
  ({ value = value_; confidence = confidence_ } : eyeglasses)

let make_face_detail ?bounding_box:(bounding_box_ : bounding_box option)
    ?age_range:(age_range_ : age_range option) ?smile:(smile_ : smile option)
    ?eyeglasses:(eyeglasses_ : eyeglasses option) ?sunglasses:(sunglasses_ : sunglasses option)
    ?gender:(gender_ : gender option) ?beard:(beard_ : beard option)
    ?mustache:(mustache_ : mustache option) ?eyes_open:(eyes_open_ : eye_open option)
    ?mouth_open:(mouth_open_ : mouth_open option) ?emotions:(emotions_ : emotions option)
    ?landmarks:(landmarks_ : landmarks option) ?pose:(pose_ : pose option)
    ?quality:(quality_ : image_quality option) ?confidence:(confidence_ : percent option)
    ?face_occluded:(face_occluded_ : face_occluded option)
    ?eye_direction:(eye_direction_ : eye_direction option) () =
  ({
     bounding_box = bounding_box_;
     age_range = age_range_;
     smile = smile_;
     eyeglasses = eyeglasses_;
     sunglasses = sunglasses_;
     gender = gender_;
     beard = beard_;
     mustache = mustache_;
     eyes_open = eyes_open_;
     mouth_open = mouth_open_;
     emotions = emotions_;
     landmarks = landmarks_;
     pose = pose_;
     quality = quality_;
     confidence = confidence_;
     face_occluded = face_occluded_;
     eye_direction = eye_direction_;
   }
    : face_detail)

let make_celebrity_detail ?urls:(urls_ : urls option) ?name:(name_ : string_ option)
    ?id:(id_ : rekognition_unique_id option) ?confidence:(confidence_ : percent option)
    ?bounding_box:(bounding_box_ : bounding_box option) ?face:(face_ : face_detail option)
    ?known_gender:(known_gender_ : known_gender option) () =
  ({
     urls = urls_;
     name = name_;
     id = id_;
     confidence = confidence_;
     bounding_box = bounding_box_;
     face = face_;
     known_gender = known_gender_;
   }
    : celebrity_detail)

let make_celebrity_recognition ?timestamp:(timestamp_ : timestamp option)
    ?celebrity:(celebrity_ : celebrity_detail option) () =
  ({ timestamp = timestamp_; celebrity = celebrity_ } : celebrity_recognition)

let make_challenge ~type_:(type__ : challenge_type) ~version:(version_ : version) () =
  ({ type_ = type__; version = version_ } : challenge)

let make_versions ?minimum:(minimum_ : version option) ?maximum:(maximum_ : version option) () =
  ({ minimum = minimum_; maximum = maximum_ } : versions)

let make_challenge_preference ?versions:(versions_ : versions option)
    ~type_:(type__ : challenge_type) () =
  ({ type_ = type__; versions = versions_ } : challenge_preference)

let make_compare_faces_match ?similarity:(similarity_ : percent option)
    ?face:(face_ : compared_face option) () =
  ({ similarity = similarity_; face = face_ } : compare_faces_match)

let make_compared_source_image_face ?bounding_box:(bounding_box_ : bounding_box option)
    ?confidence:(confidence_ : percent option) () =
  ({ bounding_box = bounding_box_; confidence = confidence_ } : compared_source_image_face)

let make_compare_faces_response
    ?source_image_face:(source_image_face_ : compared_source_image_face option)
    ?face_matches:(face_matches_ : compare_faces_match_list option)
    ?unmatched_faces:(unmatched_faces_ : compare_faces_unmatch_list option)
    ?source_image_orientation_correction:
      (source_image_orientation_correction_ : orientation_correction option)
    ?target_image_orientation_correction:
      (target_image_orientation_correction_ : orientation_correction option) () =
  ({
     source_image_face = source_image_face_;
     face_matches = face_matches_;
     unmatched_faces = unmatched_faces_;
     source_image_orientation_correction = source_image_orientation_correction_;
     target_image_orientation_correction = target_image_orientation_correction_;
   }
    : compare_faces_response)

let make_image ?bytes:(bytes_ : image_blob option) ?s3_object:(s3_object_ : s3_object option) () =
  ({ bytes = bytes_; s3_object = s3_object_ } : image)

let make_compare_faces_request ?similarity_threshold:(similarity_threshold_ : percent option)
    ?quality_filter:(quality_filter_ : quality_filter option) ~source_image:(source_image_ : image)
    ~target_image:(target_image_ : image) () =
  ({
     source_image = source_image_;
     target_image = target_image_;
     similarity_threshold = similarity_threshold_;
     quality_filter = quality_filter_;
   }
    : compare_faces_request)

let make_connected_home_settings ?min_confidence:(min_confidence_ : percent option)
    ~labels:(labels_ : connected_home_labels) () =
  ({ labels = labels_; min_confidence = min_confidence_ } : connected_home_settings)

let make_connected_home_settings_for_update ?labels:(labels_ : connected_home_labels option)
    ?min_confidence:(min_confidence_ : percent option) () =
  ({ labels = labels_; min_confidence = min_confidence_ } : connected_home_settings_for_update)

let make_content_type ?confidence:(confidence_ : percent option) ?name:(name_ : string_ option) () =
  ({ confidence = confidence_; name = name_ } : content_type)

let make_moderation_label ?confidence:(confidence_ : percent option) ?name:(name_ : string_ option)
    ?parent_name:(parent_name_ : string_ option)
    ?taxonomy_level:(taxonomy_level_ : u_integer option) () =
  ({
     confidence = confidence_;
     name = name_;
     parent_name = parent_name_;
     taxonomy_level = taxonomy_level_;
   }
    : moderation_label)

let make_content_moderation_detection ?timestamp:(timestamp_ : timestamp option)
    ?moderation_label:(moderation_label_ : moderation_label option)
    ?start_timestamp_millis:(start_timestamp_millis_ : u_long option)
    ?end_timestamp_millis:(end_timestamp_millis_ : u_long option)
    ?duration_millis:(duration_millis_ : u_long option)
    ?content_types:(content_types_ : content_types option) () =
  ({
     timestamp = timestamp_;
     moderation_label = moderation_label_;
     start_timestamp_millis = start_timestamp_millis_;
     end_timestamp_millis = end_timestamp_millis_;
     duration_millis = duration_millis_;
     content_types = content_types_;
   }
    : content_moderation_detection)

let make_copy_project_version_response
    ?project_version_arn:(project_version_arn_ : project_version_arn option) () =
  ({ project_version_arn = project_version_arn_ } : copy_project_version_response)

let make_output_config ?s3_bucket:(s3_bucket_ : s3_bucket option)
    ?s3_key_prefix:(s3_key_prefix_ : s3_key_prefix option) () =
  ({ s3_bucket = s3_bucket_; s3_key_prefix = s3_key_prefix_ } : output_config)

let make_copy_project_version_request ?tags:(tags_ : tag_map option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~source_project_arn:(source_project_arn_ : project_arn)
    ~source_project_version_arn:(source_project_version_arn_ : project_version_arn)
    ~destination_project_arn:(destination_project_arn_ : project_arn)
    ~version_name:(version_name_ : version_name) ~output_config:(output_config_ : output_config) ()
    =
  ({
     source_project_arn = source_project_arn_;
     source_project_version_arn = source_project_version_arn_;
     destination_project_arn = destination_project_arn_;
     version_name = version_name_;
     output_config = output_config_;
     tags = tags_;
     kms_key_id = kms_key_id_;
   }
    : copy_project_version_request)

let make_create_collection_response ?status_code:(status_code_ : u_integer option)
    ?collection_arn:(collection_arn_ : string_ option)
    ?face_model_version:(face_model_version_ : string_ option) () =
  ({
     status_code = status_code_;
     collection_arn = collection_arn_;
     face_model_version = face_model_version_;
   }
    : create_collection_response)

let make_create_collection_request ?tags:(tags_ : tag_map option)
    ~collection_id:(collection_id_ : collection_id) () =
  ({ collection_id = collection_id_; tags = tags_ } : create_collection_request)

let make_create_dataset_response ?dataset_arn:(dataset_arn_ : dataset_arn option) () =
  ({ dataset_arn = dataset_arn_ } : create_dataset_response)

let make_dataset_source
    ?ground_truth_manifest:(ground_truth_manifest_ : ground_truth_manifest option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) () =
  ({ ground_truth_manifest = ground_truth_manifest_; dataset_arn = dataset_arn_ } : dataset_source)

let make_create_dataset_request ?dataset_source:(dataset_source_ : dataset_source option)
    ?tags:(tags_ : tag_map option) ~dataset_type:(dataset_type_ : dataset_type)
    ~project_arn:(project_arn_ : project_arn) () =
  ({
     dataset_source = dataset_source_;
     dataset_type = dataset_type_;
     project_arn = project_arn_;
     tags = tags_;
   }
    : create_dataset_request)

let make_create_face_liveness_session_response ~session_id:(session_id_ : liveness_session_id) () =
  ({ session_id = session_id_ } : create_face_liveness_session_response)

let make_liveness_output_config ?s3_key_prefix:(s3_key_prefix_ : liveness_s3_key_prefix option)
    ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_bucket = s3_bucket_; s3_key_prefix = s3_key_prefix_ } : liveness_output_config)

let make_create_face_liveness_session_request_settings
    ?output_config:(output_config_ : liveness_output_config option)
    ?audit_images_limit:(audit_images_limit_ : audit_images_limit option)
    ?challenge_preferences:(challenge_preferences_ : challenge_preferences option) () =
  ({
     output_config = output_config_;
     audit_images_limit = audit_images_limit_;
     challenge_preferences = challenge_preferences_;
   }
    : create_face_liveness_session_request_settings)

let make_create_face_liveness_session_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?settings:(settings_ : create_face_liveness_session_request_settings option)
    ?client_request_token:(client_request_token_ : client_request_token option) () =
  ({ kms_key_id = kms_key_id_; settings = settings_; client_request_token = client_request_token_ }
    : create_face_liveness_session_request)

let make_create_project_response ?project_arn:(project_arn_ : project_arn option) () =
  ({ project_arn = project_arn_ } : create_project_response)

let make_create_project_request ?feature:(feature_ : customization_feature option)
    ?auto_update:(auto_update_ : project_auto_update option) ?tags:(tags_ : tag_map option)
    ~project_name:(project_name_ : project_name) () =
  ({ project_name = project_name_; feature = feature_; auto_update = auto_update_; tags = tags_ }
    : create_project_request)

let make_create_project_version_response
    ?project_version_arn:(project_version_arn_ : project_version_arn option) () =
  ({ project_version_arn = project_version_arn_ } : create_project_version_response)

let make_customization_feature_content_moderation_config
    ?confidence_threshold:(confidence_threshold_ : percent option) () =
  ({ confidence_threshold = confidence_threshold_ }
    : customization_feature_content_moderation_config)

let make_customization_feature_config
    ?content_moderation:
      (content_moderation_ : customization_feature_content_moderation_config option) () =
  ({ content_moderation = content_moderation_ } : customization_feature_config)

let make_testing_data ?assets:(assets_ : assets option)
    ?auto_create:(auto_create_ : boolean_ option) () =
  ({ assets = assets_; auto_create = auto_create_ } : testing_data)

let make_training_data ?assets:(assets_ : assets option) () = ({ assets = assets_ } : training_data)

let make_create_project_version_request ?training_data:(training_data_ : training_data option)
    ?testing_data:(testing_data_ : testing_data option) ?tags:(tags_ : tag_map option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?version_description:(version_description_ : version_description option)
    ?feature_config:(feature_config_ : customization_feature_config option)
    ~project_arn:(project_arn_ : project_arn) ~version_name:(version_name_ : version_name)
    ~output_config:(output_config_ : output_config) () =
  ({
     project_arn = project_arn_;
     version_name = version_name_;
     output_config = output_config_;
     training_data = training_data_;
     testing_data = testing_data_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     version_description = version_description_;
     feature_config = feature_config_;
   }
    : create_project_version_request)

let make_create_stream_processor_response
    ?stream_processor_arn:(stream_processor_arn_ : stream_processor_arn option) () =
  ({ stream_processor_arn = stream_processor_arn_ } : create_stream_processor_response)

let make_stream_processor_data_sharing_preference ~opt_in:(opt_in_ : boolean_) () =
  ({ opt_in = opt_in_ } : stream_processor_data_sharing_preference)

let make_point ?x:(x_ : float_ option) ?y:(y_ : float_ option) () = ({ x = x_; y = y_ } : point)

let make_region_of_interest ?bounding_box:(bounding_box_ : bounding_box option)
    ?polygon:(polygon_ : polygon option) () =
  ({ bounding_box = bounding_box_; polygon = polygon_ } : region_of_interest)

let make_stream_processor_notification_channel ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn) () =
  ({ sns_topic_arn = sns_topic_arn_ } : stream_processor_notification_channel)

let make_face_search_settings ?collection_id:(collection_id_ : collection_id option)
    ?face_match_threshold:(face_match_threshold_ : percent option) () =
  ({ collection_id = collection_id_; face_match_threshold = face_match_threshold_ }
    : face_search_settings)

let make_stream_processor_settings ?face_search:(face_search_ : face_search_settings option)
    ?connected_home:(connected_home_ : connected_home_settings option) () =
  ({ face_search = face_search_; connected_home = connected_home_ } : stream_processor_settings)

let make_s3_destination ?bucket:(bucket_ : s3_bucket option)
    ?key_prefix:(key_prefix_ : s3_key_prefix option) () =
  ({ bucket = bucket_; key_prefix = key_prefix_ } : s3_destination)

let make_kinesis_data_stream ?arn:(arn_ : kinesis_data_arn option) () =
  ({ arn = arn_ } : kinesis_data_stream)

let make_stream_processor_output
    ?kinesis_data_stream:(kinesis_data_stream_ : kinesis_data_stream option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ kinesis_data_stream = kinesis_data_stream_; s3_destination = s3_destination_ }
    : stream_processor_output)

let make_kinesis_video_stream ?arn:(arn_ : kinesis_video_arn option) () =
  ({ arn = arn_ } : kinesis_video_stream)

let make_stream_processor_input
    ?kinesis_video_stream:(kinesis_video_stream_ : kinesis_video_stream option) () =
  ({ kinesis_video_stream = kinesis_video_stream_ } : stream_processor_input)

let make_create_stream_processor_request ?tags:(tags_ : tag_map option)
    ?notification_channel:(notification_channel_ : stream_processor_notification_channel option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?regions_of_interest:(regions_of_interest_ : regions_of_interest option)
    ?data_sharing_preference:
      (data_sharing_preference_ : stream_processor_data_sharing_preference option)
    ~input:(input_ : stream_processor_input) ~output:(output_ : stream_processor_output)
    ~name:(name_ : stream_processor_name) ~settings:(settings_ : stream_processor_settings)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     input = input_;
     output = output_;
     name = name_;
     settings = settings_;
     role_arn = role_arn_;
     tags = tags_;
     notification_channel = notification_channel_;
     kms_key_id = kms_key_id_;
     regions_of_interest = regions_of_interest_;
     data_sharing_preference = data_sharing_preference_;
   }
    : create_stream_processor_request)

let make_create_user_response () = (() : unit)

let make_create_user_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~collection_id:(collection_id_ : collection_id) ~user_id:(user_id_ : user_id) () =
  ({
     collection_id = collection_id_;
     user_id = user_id_;
     client_request_token = client_request_token_;
   }
    : create_user_request)

let make_geometry ?bounding_box:(bounding_box_ : bounding_box option)
    ?polygon:(polygon_ : polygon option) () =
  ({ bounding_box = bounding_box_; polygon = polygon_ } : geometry)

let make_custom_label ?name:(name_ : string_ option) ?confidence:(confidence_ : percent option)
    ?geometry:(geometry_ : geometry option) () =
  ({ name = name_; confidence = confidence_; geometry = geometry_ } : custom_label)

let make_dataset_changes ~ground_truth:(ground_truth_ : ground_truth_blob) () =
  ({ ground_truth = ground_truth_ } : dataset_changes)

let make_dataset_stats ?labeled_entries:(labeled_entries_ : u_integer option)
    ?total_entries:(total_entries_ : u_integer option)
    ?total_labels:(total_labels_ : u_integer option)
    ?error_entries:(error_entries_ : u_integer option) () =
  ({
     labeled_entries = labeled_entries_;
     total_entries = total_entries_;
     total_labels = total_labels_;
     error_entries = error_entries_;
   }
    : dataset_stats)

let make_dataset_description ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?last_updated_timestamp:(last_updated_timestamp_ : date_time option)
    ?status:(status_ : dataset_status option)
    ?status_message:(status_message_ : status_message option)
    ?status_message_code:(status_message_code_ : dataset_status_message_code option)
    ?dataset_stats:(dataset_stats_ : dataset_stats option) () =
  ({
     creation_timestamp = creation_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
     status = status_;
     status_message = status_message_;
     status_message_code = status_message_code_;
     dataset_stats = dataset_stats_;
   }
    : dataset_description)

let make_dataset_label_stats ?entry_count:(entry_count_ : u_integer option)
    ?bounding_box_count:(bounding_box_count_ : u_integer option) () =
  ({ entry_count = entry_count_; bounding_box_count = bounding_box_count_ } : dataset_label_stats)

let make_dataset_label_description ?label_name:(label_name_ : dataset_label option)
    ?label_stats:(label_stats_ : dataset_label_stats option) () =
  ({ label_name = label_name_; label_stats = label_stats_ } : dataset_label_description)

let make_dataset_metadata ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?dataset_type:(dataset_type_ : dataset_type option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) ?status:(status_ : dataset_status option)
    ?status_message:(status_message_ : status_message option)
    ?status_message_code:(status_message_code_ : dataset_status_message_code option) () =
  ({
     creation_timestamp = creation_timestamp_;
     dataset_type = dataset_type_;
     dataset_arn = dataset_arn_;
     status = status_;
     status_message = status_message_;
     status_message_code = status_message_code_;
   }
    : dataset_metadata)

let make_delete_collection_response ?status_code:(status_code_ : u_integer option) () =
  ({ status_code = status_code_ } : delete_collection_response)

let make_delete_collection_request ~collection_id:(collection_id_ : collection_id) () =
  ({ collection_id = collection_id_ } : delete_collection_request)

let make_delete_dataset_response () = (() : unit)

let make_delete_dataset_request ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({ dataset_arn = dataset_arn_ } : delete_dataset_request)

let make_unsuccessful_face_deletion ?face_id:(face_id_ : face_id option)
    ?user_id:(user_id_ : user_id option)
    ?reasons:(reasons_ : unsuccessful_face_deletion_reasons option) () =
  ({ face_id = face_id_; user_id = user_id_; reasons = reasons_ } : unsuccessful_face_deletion)

let make_delete_faces_response ?deleted_faces:(deleted_faces_ : face_id_list option)
    ?unsuccessful_face_deletions:
      (unsuccessful_face_deletions_ : unsuccessful_face_deletions_list option) () =
  ({ deleted_faces = deleted_faces_; unsuccessful_face_deletions = unsuccessful_face_deletions_ }
    : delete_faces_response)

let make_delete_faces_request ~collection_id:(collection_id_ : collection_id)
    ~face_ids:(face_ids_ : face_id_list) () =
  ({ collection_id = collection_id_; face_ids = face_ids_ } : delete_faces_request)

let make_delete_project_response ?status:(status_ : project_status option) () =
  ({ status = status_ } : delete_project_response)

let make_delete_project_request ~project_arn:(project_arn_ : project_arn) () =
  ({ project_arn = project_arn_ } : delete_project_request)

let make_delete_project_policy_response () = (() : unit)

let make_delete_project_policy_request
    ?policy_revision_id:(policy_revision_id_ : project_policy_revision_id option)
    ~project_arn:(project_arn_ : project_arn) ~policy_name:(policy_name_ : project_policy_name) () =
  ({
     project_arn = project_arn_;
     policy_name = policy_name_;
     policy_revision_id = policy_revision_id_;
   }
    : delete_project_policy_request)

let make_delete_project_version_response ?status:(status_ : project_version_status option) () =
  ({ status = status_ } : delete_project_version_response)

let make_delete_project_version_request
    ~project_version_arn:(project_version_arn_ : project_version_arn) () =
  ({ project_version_arn = project_version_arn_ } : delete_project_version_request)

let make_delete_stream_processor_response () = (() : unit)

let make_delete_stream_processor_request ~name:(name_ : stream_processor_name) () =
  ({ name = name_ } : delete_stream_processor_request)

let make_delete_user_response () = (() : unit)

let make_delete_user_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~collection_id:(collection_id_ : collection_id) ~user_id:(user_id_ : user_id) () =
  ({
     collection_id = collection_id_;
     user_id = user_id_;
     client_request_token = client_request_token_;
   }
    : delete_user_request)

let make_describe_collection_response ?face_count:(face_count_ : u_long option)
    ?face_model_version:(face_model_version_ : string_ option)
    ?collection_ar_n:(collection_ar_n_ : string_ option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?user_count:(user_count_ : u_long option) () =
  ({
     face_count = face_count_;
     face_model_version = face_model_version_;
     collection_ar_n = collection_ar_n_;
     creation_timestamp = creation_timestamp_;
     user_count = user_count_;
   }
    : describe_collection_response)

let make_describe_collection_request ~collection_id:(collection_id_ : collection_id) () =
  ({ collection_id = collection_id_ } : describe_collection_request)

let make_describe_dataset_response
    ?dataset_description:(dataset_description_ : dataset_description option) () =
  ({ dataset_description = dataset_description_ } : describe_dataset_response)

let make_describe_dataset_request ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({ dataset_arn = dataset_arn_ } : describe_dataset_request)

let make_summary ?s3_object:(s3_object_ : s3_object option) () =
  ({ s3_object = s3_object_ } : summary)

let make_validation_data ?assets:(assets_ : assets option) () =
  ({ assets = assets_ } : validation_data)

let make_project_version_description
    ?project_version_arn:(project_version_arn_ : project_version_arn option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?min_inference_units:(min_inference_units_ : inference_units option)
    ?status:(status_ : project_version_status option)
    ?status_message:(status_message_ : status_message option)
    ?billable_training_time_in_seconds:(billable_training_time_in_seconds_ : u_long option)
    ?training_end_timestamp:(training_end_timestamp_ : date_time option)
    ?output_config:(output_config_ : output_config option)
    ?training_data_result:(training_data_result_ : training_data_result option)
    ?testing_data_result:(testing_data_result_ : testing_data_result option)
    ?evaluation_result:(evaluation_result_ : evaluation_result option)
    ?manifest_summary:(manifest_summary_ : ground_truth_manifest option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?max_inference_units:(max_inference_units_ : inference_units option)
    ?source_project_version_arn:(source_project_version_arn_ : project_version_arn option)
    ?version_description:(version_description_ : version_description option)
    ?feature:(feature_ : customization_feature option)
    ?base_model_version:(base_model_version_ : string_ option)
    ?feature_config:(feature_config_ : customization_feature_config option) () =
  ({
     project_version_arn = project_version_arn_;
     creation_timestamp = creation_timestamp_;
     min_inference_units = min_inference_units_;
     status = status_;
     status_message = status_message_;
     billable_training_time_in_seconds = billable_training_time_in_seconds_;
     training_end_timestamp = training_end_timestamp_;
     output_config = output_config_;
     training_data_result = training_data_result_;
     testing_data_result = testing_data_result_;
     evaluation_result = evaluation_result_;
     manifest_summary = manifest_summary_;
     kms_key_id = kms_key_id_;
     max_inference_units = max_inference_units_;
     source_project_version_arn = source_project_version_arn_;
     version_description = version_description_;
     feature = feature_;
     base_model_version = base_model_version_;
     feature_config = feature_config_;
   }
    : project_version_description)

let make_describe_project_versions_response
    ?project_version_descriptions:
      (project_version_descriptions_ : project_version_descriptions option)
    ?next_token:(next_token_ : extended_pagination_token option) () =
  ({ project_version_descriptions = project_version_descriptions_; next_token = next_token_ }
    : describe_project_versions_response)

let make_describe_project_versions_request ?version_names:(version_names_ : version_names option)
    ?next_token:(next_token_ : extended_pagination_token option)
    ?max_results:(max_results_ : project_versions_page_size option)
    ~project_arn:(project_arn_ : project_arn) () =
  ({
     project_arn = project_arn_;
     version_names = version_names_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_project_versions_request)

let make_project_description ?project_arn:(project_arn_ : project_arn option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?status:(status_ : project_status option) ?datasets:(datasets_ : dataset_metadata_list option)
    ?feature:(feature_ : customization_feature option)
    ?auto_update:(auto_update_ : project_auto_update option) () =
  ({
     project_arn = project_arn_;
     creation_timestamp = creation_timestamp_;
     status = status_;
     datasets = datasets_;
     feature = feature_;
     auto_update = auto_update_;
   }
    : project_description)

let make_describe_projects_response
    ?project_descriptions:(project_descriptions_ : project_descriptions option)
    ?next_token:(next_token_ : extended_pagination_token option) () =
  ({ project_descriptions = project_descriptions_; next_token = next_token_ }
    : describe_projects_response)

let make_describe_projects_request ?next_token:(next_token_ : extended_pagination_token option)
    ?max_results:(max_results_ : projects_page_size option)
    ?project_names:(project_names_ : project_names option)
    ?features:(features_ : customization_features option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     project_names = project_names_;
     features = features_;
   }
    : describe_projects_request)

let make_describe_stream_processor_response ?name:(name_ : stream_processor_name option)
    ?stream_processor_arn:(stream_processor_arn_ : stream_processor_arn option)
    ?status:(status_ : stream_processor_status option)
    ?status_message:(status_message_ : string_ option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?last_update_timestamp:(last_update_timestamp_ : date_time option)
    ?input:(input_ : stream_processor_input option)
    ?output:(output_ : stream_processor_output option) ?role_arn:(role_arn_ : role_arn option)
    ?settings:(settings_ : stream_processor_settings option)
    ?notification_channel:(notification_channel_ : stream_processor_notification_channel option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?regions_of_interest:(regions_of_interest_ : regions_of_interest option)
    ?data_sharing_preference:
      (data_sharing_preference_ : stream_processor_data_sharing_preference option) () =
  ({
     name = name_;
     stream_processor_arn = stream_processor_arn_;
     status = status_;
     status_message = status_message_;
     creation_timestamp = creation_timestamp_;
     last_update_timestamp = last_update_timestamp_;
     input = input_;
     output = output_;
     role_arn = role_arn_;
     settings = settings_;
     notification_channel = notification_channel_;
     kms_key_id = kms_key_id_;
     regions_of_interest = regions_of_interest_;
     data_sharing_preference = data_sharing_preference_;
   }
    : describe_stream_processor_response)

let make_describe_stream_processor_request ~name:(name_ : stream_processor_name) () =
  ({ name = name_ } : describe_stream_processor_request)

let make_detect_custom_labels_response ?custom_labels:(custom_labels_ : custom_labels option) () =
  ({ custom_labels = custom_labels_ } : detect_custom_labels_response)

let make_detect_custom_labels_request ?max_results:(max_results_ : u_integer option)
    ?min_confidence:(min_confidence_ : percent option)
    ~project_version_arn:(project_version_arn_ : project_version_arn) ~image:(image_ : image) () =
  ({
     project_version_arn = project_version_arn_;
     image = image_;
     max_results = max_results_;
     min_confidence = min_confidence_;
   }
    : detect_custom_labels_request)

let make_detect_faces_response ?face_details:(face_details_ : face_detail_list option)
    ?orientation_correction:(orientation_correction_ : orientation_correction option) () =
  ({ face_details = face_details_; orientation_correction = orientation_correction_ }
    : detect_faces_response)

let make_detect_faces_request ?attributes:(attributes_ : attributes option) ~image:(image_ : image)
    () =
  ({ image = image_; attributes = attributes_ } : detect_faces_request)

let make_dominant_color ?red:(red_ : u_integer option) ?blue:(blue_ : u_integer option)
    ?green:(green_ : u_integer option) ?hex_code:(hex_code_ : string_ option)
    ?css_color:(css_color_ : string_ option) ?simplified_color:(simplified_color_ : string_ option)
    ?pixel_percent:(pixel_percent_ : percent option) () =
  ({
     red = red_;
     blue = blue_;
     green = green_;
     hex_code = hex_code_;
     css_color = css_color_;
     simplified_color = simplified_color_;
     pixel_percent = pixel_percent_;
   }
    : dominant_color)

let make_detect_labels_image_quality ?brightness:(brightness_ : float_ option)
    ?sharpness:(sharpness_ : float_ option) ?contrast:(contrast_ : float_ option) () =
  ({ brightness = brightness_; sharpness = sharpness_; contrast = contrast_ }
    : detect_labels_image_quality)

let make_detect_labels_image_background ?quality:(quality_ : detect_labels_image_quality option)
    ?dominant_colors:(dominant_colors_ : dominant_colors option) () =
  ({ quality = quality_; dominant_colors = dominant_colors_ } : detect_labels_image_background)

let make_detect_labels_image_foreground ?quality:(quality_ : detect_labels_image_quality option)
    ?dominant_colors:(dominant_colors_ : dominant_colors option) () =
  ({ quality = quality_; dominant_colors = dominant_colors_ } : detect_labels_image_foreground)

let make_detect_labels_image_properties ?quality:(quality_ : detect_labels_image_quality option)
    ?dominant_colors:(dominant_colors_ : dominant_colors option)
    ?foreground:(foreground_ : detect_labels_image_foreground option)
    ?background:(background_ : detect_labels_image_background option) () =
  ({
     quality = quality_;
     dominant_colors = dominant_colors_;
     foreground = foreground_;
     background = background_;
   }
    : detect_labels_image_properties)

let make_label_category ?name:(name_ : string_ option) () = ({ name = name_ } : label_category)
let make_label_alias ?name:(name_ : string_ option) () = ({ name = name_ } : label_alias)
let make_parent ?name:(name_ : string_ option) () = ({ name = name_ } : parent)

let make_instance ?bounding_box:(bounding_box_ : bounding_box option)
    ?confidence:(confidence_ : percent option)
    ?dominant_colors:(dominant_colors_ : dominant_colors option) () =
  ({ bounding_box = bounding_box_; confidence = confidence_; dominant_colors = dominant_colors_ }
    : instance)

let make_label ?name:(name_ : string_ option) ?confidence:(confidence_ : percent option)
    ?instances:(instances_ : instances option) ?parents:(parents_ : parents option)
    ?aliases:(aliases_ : label_aliases option) ?categories:(categories_ : label_categories option)
    () =
  ({
     name = name_;
     confidence = confidence_;
     instances = instances_;
     parents = parents_;
     aliases = aliases_;
     categories = categories_;
   }
    : label)

let make_detect_labels_response ?labels:(labels_ : labels option)
    ?orientation_correction:(orientation_correction_ : orientation_correction option)
    ?label_model_version:(label_model_version_ : string_ option)
    ?image_properties:(image_properties_ : detect_labels_image_properties option) () =
  ({
     labels = labels_;
     orientation_correction = orientation_correction_;
     label_model_version = label_model_version_;
     image_properties = image_properties_;
   }
    : detect_labels_response)

let make_detect_labels_image_properties_settings
    ?max_dominant_colors:(max_dominant_colors_ : detect_labels_max_dominant_colors option) () =
  ({ max_dominant_colors = max_dominant_colors_ } : detect_labels_image_properties_settings)

let make_general_labels_settings
    ?label_inclusion_filters:(label_inclusion_filters_ : general_labels_filter_list option)
    ?label_exclusion_filters:(label_exclusion_filters_ : general_labels_filter_list option)
    ?label_category_inclusion_filters:
      (label_category_inclusion_filters_ : general_labels_filter_list option)
    ?label_category_exclusion_filters:
      (label_category_exclusion_filters_ : general_labels_filter_list option) () =
  ({
     label_inclusion_filters = label_inclusion_filters_;
     label_exclusion_filters = label_exclusion_filters_;
     label_category_inclusion_filters = label_category_inclusion_filters_;
     label_category_exclusion_filters = label_category_exclusion_filters_;
   }
    : general_labels_settings)

let make_detect_labels_settings ?general_labels:(general_labels_ : general_labels_settings option)
    ?image_properties:(image_properties_ : detect_labels_image_properties_settings option) () =
  ({ general_labels = general_labels_; image_properties = image_properties_ }
    : detect_labels_settings)

let make_detect_labels_request ?max_labels:(max_labels_ : u_integer option)
    ?min_confidence:(min_confidence_ : percent option)
    ?features:(features_ : detect_labels_feature_list option)
    ?settings:(settings_ : detect_labels_settings option) ~image:(image_ : image) () =
  ({
     image = image_;
     max_labels = max_labels_;
     min_confidence = min_confidence_;
     features = features_;
     settings = settings_;
   }
    : detect_labels_request)

let make_human_loop_activation_output ?human_loop_arn:(human_loop_arn_ : human_loop_arn option)
    ?human_loop_activation_reasons:
      (human_loop_activation_reasons_ : human_loop_activation_reasons option)
    ?human_loop_activation_conditions_evaluation_results:
      (human_loop_activation_conditions_evaluation_results_ :
         synthesized_json_human_loop_activation_conditions_evaluation_results option) () =
  ({
     human_loop_arn = human_loop_arn_;
     human_loop_activation_reasons = human_loop_activation_reasons_;
     human_loop_activation_conditions_evaluation_results =
       human_loop_activation_conditions_evaluation_results_;
   }
    : human_loop_activation_output)

let make_detect_moderation_labels_response
    ?moderation_labels:(moderation_labels_ : moderation_labels option)
    ?moderation_model_version:(moderation_model_version_ : string_ option)
    ?human_loop_activation_output:
      (human_loop_activation_output_ : human_loop_activation_output option)
    ?project_version:(project_version_ : project_version_id option)
    ?content_types:(content_types_ : content_types option) () =
  ({
     moderation_labels = moderation_labels_;
     moderation_model_version = moderation_model_version_;
     human_loop_activation_output = human_loop_activation_output_;
     project_version = project_version_;
     content_types = content_types_;
   }
    : detect_moderation_labels_response)

let make_human_loop_data_attributes
    ?content_classifiers:(content_classifiers_ : content_classifiers option) () =
  ({ content_classifiers = content_classifiers_ } : human_loop_data_attributes)

let make_human_loop_config ?data_attributes:(data_attributes_ : human_loop_data_attributes option)
    ~human_loop_name:(human_loop_name_ : human_loop_name)
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn) () =
  ({
     human_loop_name = human_loop_name_;
     flow_definition_arn = flow_definition_arn_;
     data_attributes = data_attributes_;
   }
    : human_loop_config)

let make_detect_moderation_labels_request ?min_confidence:(min_confidence_ : percent option)
    ?human_loop_config:(human_loop_config_ : human_loop_config option)
    ?project_version:(project_version_ : project_version_id option) ~image:(image_ : image) () =
  ({
     image = image_;
     min_confidence = min_confidence_;
     human_loop_config = human_loop_config_;
     project_version = project_version_;
   }
    : detect_moderation_labels_request)

let make_protective_equipment_summary
    ?persons_with_required_equipment:
      (persons_with_required_equipment_ : protective_equipment_person_ids option)
    ?persons_without_required_equipment:
      (persons_without_required_equipment_ : protective_equipment_person_ids option)
    ?persons_indeterminate:(persons_indeterminate_ : protective_equipment_person_ids option) () =
  ({
     persons_with_required_equipment = persons_with_required_equipment_;
     persons_without_required_equipment = persons_without_required_equipment_;
     persons_indeterminate = persons_indeterminate_;
   }
    : protective_equipment_summary)

let make_protective_equipment_person ?body_parts:(body_parts_ : body_parts option)
    ?bounding_box:(bounding_box_ : bounding_box option) ?confidence:(confidence_ : percent option)
    ?id:(id_ : u_integer option) () =
  ({ body_parts = body_parts_; bounding_box = bounding_box_; confidence = confidence_; id = id_ }
    : protective_equipment_person)

let make_detect_protective_equipment_response
    ?protective_equipment_model_version:(protective_equipment_model_version_ : string_ option)
    ?persons:(persons_ : protective_equipment_persons option)
    ?summary:(summary_ : protective_equipment_summary option) () =
  ({
     protective_equipment_model_version = protective_equipment_model_version_;
     persons = persons_;
     summary = summary_;
   }
    : detect_protective_equipment_response)

let make_protective_equipment_summarization_attributes ~min_confidence:(min_confidence_ : percent)
    ~required_equipment_types:(required_equipment_types_ : protective_equipment_types) () =
  ({ min_confidence = min_confidence_; required_equipment_types = required_equipment_types_ }
    : protective_equipment_summarization_attributes)

let make_detect_protective_equipment_request
    ?summarization_attributes:
      (summarization_attributes_ : protective_equipment_summarization_attributes option)
    ~image:(image_ : image) () =
  ({ image = image_; summarization_attributes = summarization_attributes_ }
    : detect_protective_equipment_request)

let make_text_detection ?detected_text:(detected_text_ : string_ option)
    ?type_:(type__ : text_types option) ?id:(id_ : u_integer option)
    ?parent_id:(parent_id_ : u_integer option) ?confidence:(confidence_ : percent option)
    ?geometry:(geometry_ : geometry option) () =
  ({
     detected_text = detected_text_;
     type_ = type__;
     id = id_;
     parent_id = parent_id_;
     confidence = confidence_;
     geometry = geometry_;
   }
    : text_detection)

let make_detect_text_response ?text_detections:(text_detections_ : text_detection_list option)
    ?text_model_version:(text_model_version_ : string_ option) () =
  ({ text_detections = text_detections_; text_model_version = text_model_version_ }
    : detect_text_response)

let make_detection_filter ?min_confidence:(min_confidence_ : percent option)
    ?min_bounding_box_height:(min_bounding_box_height_ : bounding_box_height option)
    ?min_bounding_box_width:(min_bounding_box_width_ : bounding_box_width option) () =
  ({
     min_confidence = min_confidence_;
     min_bounding_box_height = min_bounding_box_height_;
     min_bounding_box_width = min_bounding_box_width_;
   }
    : detection_filter)

let make_detect_text_filters ?word_filter:(word_filter_ : detection_filter option)
    ?regions_of_interest:(regions_of_interest_ : regions_of_interest option) () =
  ({ word_filter = word_filter_; regions_of_interest = regions_of_interest_ } : detect_text_filters)

let make_detect_text_request ?filters:(filters_ : detect_text_filters option)
    ~image:(image_ : image) () =
  ({ image = image_; filters = filters_ } : detect_text_request)

let make_unsuccessful_face_disassociation ?face_id:(face_id_ : face_id option)
    ?user_id:(user_id_ : user_id option)
    ?reasons:(reasons_ : unsuccessful_face_disassociation_reasons option) () =
  ({ face_id = face_id_; user_id = user_id_; reasons = reasons_ }
    : unsuccessful_face_disassociation)

let make_disassociated_face ?face_id:(face_id_ : face_id option) () =
  ({ face_id = face_id_ } : disassociated_face)

let make_disassociate_faces_response
    ?disassociated_faces:(disassociated_faces_ : disassociated_faces_list option)
    ?unsuccessful_face_disassociations:
      (unsuccessful_face_disassociations_ : unsuccessful_face_disassociation_list option)
    ?user_status:(user_status_ : user_status option) () =
  ({
     disassociated_faces = disassociated_faces_;
     unsuccessful_face_disassociations = unsuccessful_face_disassociations_;
     user_status = user_status_;
   }
    : disassociate_faces_response)

let make_disassociate_faces_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~collection_id:(collection_id_ : collection_id) ~user_id:(user_id_ : user_id)
    ~face_ids:(face_ids_ : user_face_id_list) () =
  ({
     collection_id = collection_id_;
     user_id = user_id_;
     client_request_token = client_request_token_;
     face_ids = face_ids_;
   }
    : disassociate_faces_request)

let make_distribute_dataset ~arn:(arn_ : dataset_arn) () = ({ arn = arn_ } : distribute_dataset)
let make_distribute_dataset_entries_response () = (() : unit)

let make_distribute_dataset_entries_request ~datasets:(datasets_ : distribute_dataset_metadata_list)
    () =
  ({ datasets = datasets_ } : distribute_dataset_entries_request)

let make_face ?face_id:(face_id_ : face_id option)
    ?bounding_box:(bounding_box_ : bounding_box option) ?image_id:(image_id_ : image_id option)
    ?external_image_id:(external_image_id_ : external_image_id option)
    ?confidence:(confidence_ : percent option)
    ?index_faces_model_version:(index_faces_model_version_ : index_faces_model_version option)
    ?user_id:(user_id_ : user_id option) () =
  ({
     face_id = face_id_;
     bounding_box = bounding_box_;
     image_id = image_id_;
     external_image_id = external_image_id_;
     confidence = confidence_;
     index_faces_model_version = index_faces_model_version_;
     user_id = user_id_;
   }
    : face)

let make_face_detection ?timestamp:(timestamp_ : timestamp option)
    ?face:(face_ : face_detail option) () =
  ({ timestamp = timestamp_; face = face_ } : face_detection)

let make_face_match ?similarity:(similarity_ : percent option) ?face:(face_ : face option) () =
  ({ similarity = similarity_; face = face_ } : face_match)

let make_face_record ?face:(face_ : face option) ?face_detail:(face_detail_ : face_detail option) ()
    =
  ({ face = face_; face_detail = face_detail_ } : face_record)

let make_get_celebrity_info_response ?urls:(urls_ : urls option) ?name:(name_ : string_ option)
    ?known_gender:(known_gender_ : known_gender option) () =
  ({ urls = urls_; name = name_; known_gender = known_gender_ } : get_celebrity_info_response)

let make_get_celebrity_info_request ~id:(id_ : rekognition_unique_id) () =
  ({ id = id_ } : get_celebrity_info_request)

let make_video ?s3_object:(s3_object_ : s3_object option) () = ({ s3_object = s3_object_ } : video)

let make_video_metadata ?codec:(codec_ : string_ option)
    ?duration_millis:(duration_millis_ : u_long option) ?format:(format_ : string_ option)
    ?frame_rate:(frame_rate_ : float_ option) ?frame_height:(frame_height_ : u_long option)
    ?frame_width:(frame_width_ : u_long option)
    ?color_range:(color_range_ : video_color_range option) () =
  ({
     codec = codec_;
     duration_millis = duration_millis_;
     format = format_;
     frame_rate = frame_rate_;
     frame_height = frame_height_;
     frame_width = frame_width_;
     color_range = color_range_;
   }
    : video_metadata)

let make_get_celebrity_recognition_response ?job_status:(job_status_ : video_job_status option)
    ?status_message:(status_message_ : status_message option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?next_token:(next_token_ : pagination_token option)
    ?celebrities:(celebrities_ : celebrity_recognitions option) ?job_id:(job_id_ : job_id option)
    ?video:(video_ : video option) ?job_tag:(job_tag_ : job_tag option) () =
  ({
     job_status = job_status_;
     status_message = status_message_;
     video_metadata = video_metadata_;
     next_token = next_token_;
     celebrities = celebrities_;
     job_id = job_id_;
     video = video_;
     job_tag = job_tag_;
   }
    : get_celebrity_recognition_response)

let make_get_celebrity_recognition_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?sort_by:(sort_by_ : celebrity_recognition_sort_by option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_; sort_by = sort_by_ }
    : get_celebrity_recognition_request)

let make_get_content_moderation_request_metadata
    ?sort_by:(sort_by_ : content_moderation_sort_by option)
    ?aggregate_by:(aggregate_by_ : content_moderation_aggregate_by option) () =
  ({ sort_by = sort_by_; aggregate_by = aggregate_by_ } : get_content_moderation_request_metadata)

let make_get_content_moderation_response ?job_status:(job_status_ : video_job_status option)
    ?status_message:(status_message_ : status_message option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?moderation_labels:(moderation_labels_ : content_moderation_detections option)
    ?next_token:(next_token_ : pagination_token option)
    ?moderation_model_version:(moderation_model_version_ : string_ option)
    ?job_id:(job_id_ : job_id option) ?video:(video_ : video option)
    ?job_tag:(job_tag_ : job_tag option)
    ?get_request_metadata:(get_request_metadata_ : get_content_moderation_request_metadata option)
    () =
  ({
     job_status = job_status_;
     status_message = status_message_;
     video_metadata = video_metadata_;
     moderation_labels = moderation_labels_;
     next_token = next_token_;
     moderation_model_version = moderation_model_version_;
     job_id = job_id_;
     video = video_;
     job_tag = job_tag_;
     get_request_metadata = get_request_metadata_;
   }
    : get_content_moderation_response)

let make_get_content_moderation_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?sort_by:(sort_by_ : content_moderation_sort_by option)
    ?aggregate_by:(aggregate_by_ : content_moderation_aggregate_by option)
    ~job_id:(job_id_ : job_id) () =
  ({
     job_id = job_id_;
     max_results = max_results_;
     next_token = next_token_;
     sort_by = sort_by_;
     aggregate_by = aggregate_by_;
   }
    : get_content_moderation_request)

let make_get_face_detection_response ?job_status:(job_status_ : video_job_status option)
    ?status_message:(status_message_ : status_message option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?next_token:(next_token_ : pagination_token option) ?faces:(faces_ : face_detections option)
    ?job_id:(job_id_ : job_id option) ?video:(video_ : video option)
    ?job_tag:(job_tag_ : job_tag option) () =
  ({
     job_status = job_status_;
     status_message = status_message_;
     video_metadata = video_metadata_;
     next_token = next_token_;
     faces = faces_;
     job_id = job_id_;
     video = video_;
     job_tag = job_tag_;
   }
    : get_face_detection_response)

let make_get_face_detection_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_face_detection_request)

let make_get_face_liveness_session_results_response ?confidence:(confidence_ : percent option)
    ?reference_image:(reference_image_ : audit_image option)
    ?audit_images:(audit_images_ : audit_images option) ?challenge:(challenge_ : challenge option)
    ~session_id:(session_id_ : liveness_session_id) ~status:(status_ : liveness_session_status) () =
  ({
     session_id = session_id_;
     status = status_;
     confidence = confidence_;
     reference_image = reference_image_;
     audit_images = audit_images_;
     challenge = challenge_;
   }
    : get_face_liveness_session_results_response)

let make_get_face_liveness_session_results_request ~session_id:(session_id_ : liveness_session_id)
    () =
  ({ session_id = session_id_ } : get_face_liveness_session_results_request)

let make_person_detail ?index:(index_ : person_index option)
    ?bounding_box:(bounding_box_ : bounding_box option) ?face:(face_ : face_detail option) () =
  ({ index = index_; bounding_box = bounding_box_; face = face_ } : person_detail)

let make_person_match ?timestamp:(timestamp_ : timestamp option)
    ?person:(person_ : person_detail option) ?face_matches:(face_matches_ : face_match_list option)
    () =
  ({ timestamp = timestamp_; person = person_; face_matches = face_matches_ } : person_match)

let make_get_face_search_response ?job_status:(job_status_ : video_job_status option)
    ?status_message:(status_message_ : status_message option)
    ?next_token:(next_token_ : pagination_token option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?persons:(persons_ : person_matches option) ?job_id:(job_id_ : job_id option)
    ?video:(video_ : video option) ?job_tag:(job_tag_ : job_tag option) () =
  ({
     job_status = job_status_;
     status_message = status_message_;
     next_token = next_token_;
     video_metadata = video_metadata_;
     persons = persons_;
     job_id = job_id_;
     video = video_;
     job_tag = job_tag_;
   }
    : get_face_search_response)

let make_get_face_search_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?sort_by:(sort_by_ : face_search_sort_by option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_; sort_by = sort_by_ }
    : get_face_search_request)

let make_get_label_detection_request_metadata ?sort_by:(sort_by_ : label_detection_sort_by option)
    ?aggregate_by:(aggregate_by_ : label_detection_aggregate_by option) () =
  ({ sort_by = sort_by_; aggregate_by = aggregate_by_ } : get_label_detection_request_metadata)

let make_label_detection ?timestamp:(timestamp_ : timestamp option) ?label:(label_ : label option)
    ?start_timestamp_millis:(start_timestamp_millis_ : u_long option)
    ?end_timestamp_millis:(end_timestamp_millis_ : u_long option)
    ?duration_millis:(duration_millis_ : u_long option) () =
  ({
     timestamp = timestamp_;
     label = label_;
     start_timestamp_millis = start_timestamp_millis_;
     end_timestamp_millis = end_timestamp_millis_;
     duration_millis = duration_millis_;
   }
    : label_detection)

let make_get_label_detection_response ?job_status:(job_status_ : video_job_status option)
    ?status_message:(status_message_ : status_message option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?next_token:(next_token_ : pagination_token option) ?labels:(labels_ : label_detections option)
    ?label_model_version:(label_model_version_ : string_ option) ?job_id:(job_id_ : job_id option)
    ?video:(video_ : video option) ?job_tag:(job_tag_ : job_tag option)
    ?get_request_metadata:(get_request_metadata_ : get_label_detection_request_metadata option) () =
  ({
     job_status = job_status_;
     status_message = status_message_;
     video_metadata = video_metadata_;
     next_token = next_token_;
     labels = labels_;
     label_model_version = label_model_version_;
     job_id = job_id_;
     video = video_;
     job_tag = job_tag_;
     get_request_metadata = get_request_metadata_;
   }
    : get_label_detection_response)

let make_get_label_detection_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?sort_by:(sort_by_ : label_detection_sort_by option)
    ?aggregate_by:(aggregate_by_ : label_detection_aggregate_by option) ~job_id:(job_id_ : job_id)
    () =
  ({
     job_id = job_id_;
     max_results = max_results_;
     next_token = next_token_;
     sort_by = sort_by_;
     aggregate_by = aggregate_by_;
   }
    : get_label_detection_request)

let make_media_analysis_manifest_summary ?s3_object:(s3_object_ : s3_object option) () =
  ({ s3_object = s3_object_ } : media_analysis_manifest_summary)

let make_media_analysis_model_versions ?moderation:(moderation_ : string_ option) () =
  ({ moderation = moderation_ } : media_analysis_model_versions)

let make_media_analysis_results ?s3_object:(s3_object_ : s3_object option)
    ?model_versions:(model_versions_ : media_analysis_model_versions option) () =
  ({ s3_object = s3_object_; model_versions = model_versions_ } : media_analysis_results)

let make_media_analysis_output_config
    ?s3_key_prefix:(s3_key_prefix_ : media_analysis_s3_key_prefix option)
    ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_bucket = s3_bucket_; s3_key_prefix = s3_key_prefix_ } : media_analysis_output_config)

let make_media_analysis_input ~s3_object:(s3_object_ : s3_object) () =
  ({ s3_object = s3_object_ } : media_analysis_input)

let make_media_analysis_job_failure_details ?code:(code_ : media_analysis_job_failure_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : media_analysis_job_failure_details)

let make_media_analysis_detect_moderation_labels_config
    ?min_confidence:(min_confidence_ : percent option)
    ?project_version:(project_version_ : project_version_id option) () =
  ({ min_confidence = min_confidence_; project_version = project_version_ }
    : media_analysis_detect_moderation_labels_config)

let make_media_analysis_operations_config
    ?detect_moderation_labels:
      (detect_moderation_labels_ : media_analysis_detect_moderation_labels_config option) () =
  ({ detect_moderation_labels = detect_moderation_labels_ } : media_analysis_operations_config)

let make_get_media_analysis_job_response ?job_name:(job_name_ : media_analysis_job_name option)
    ?failure_details:(failure_details_ : media_analysis_job_failure_details option)
    ?completion_timestamp:(completion_timestamp_ : date_time option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?results:(results_ : media_analysis_results option)
    ?manifest_summary:(manifest_summary_ : media_analysis_manifest_summary option)
    ~job_id:(job_id_ : media_analysis_job_id)
    ~operations_config:(operations_config_ : media_analysis_operations_config)
    ~status:(status_ : media_analysis_job_status)
    ~creation_timestamp:(creation_timestamp_ : date_time) ~input:(input_ : media_analysis_input)
    ~output_config:(output_config_ : media_analysis_output_config) () =
  ({
     job_id = job_id_;
     job_name = job_name_;
     operations_config = operations_config_;
     status = status_;
     failure_details = failure_details_;
     creation_timestamp = creation_timestamp_;
     completion_timestamp = completion_timestamp_;
     input = input_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
     results = results_;
     manifest_summary = manifest_summary_;
   }
    : get_media_analysis_job_response)

let make_get_media_analysis_job_request ~job_id:(job_id_ : media_analysis_job_id) () =
  ({ job_id = job_id_ } : get_media_analysis_job_request)

let make_person_detection ?timestamp:(timestamp_ : timestamp option)
    ?person:(person_ : person_detail option) () =
  ({ timestamp = timestamp_; person = person_ } : person_detection)

let make_get_person_tracking_response ?job_status:(job_status_ : video_job_status option)
    ?status_message:(status_message_ : status_message option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?next_token:(next_token_ : pagination_token option)
    ?persons:(persons_ : person_detections option) ?job_id:(job_id_ : job_id option)
    ?video:(video_ : video option) ?job_tag:(job_tag_ : job_tag option) () =
  ({
     job_status = job_status_;
     status_message = status_message_;
     video_metadata = video_metadata_;
     next_token = next_token_;
     persons = persons_;
     job_id = job_id_;
     video = video_;
     job_tag = job_tag_;
   }
    : get_person_tracking_response)

let make_get_person_tracking_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?sort_by:(sort_by_ : person_tracking_sort_by option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_; sort_by = sort_by_ }
    : get_person_tracking_request)

let make_segment_type_info ?type_:(type__ : segment_type option)
    ?model_version:(model_version_ : string_ option) () =
  ({ type_ = type__; model_version = model_version_ } : segment_type_info)

let make_shot_segment ?index:(index_ : u_long option)
    ?confidence:(confidence_ : segment_confidence option) () =
  ({ index = index_; confidence = confidence_ } : shot_segment)

let make_technical_cue_segment ?type_:(type__ : technical_cue_type option)
    ?confidence:(confidence_ : segment_confidence option) () =
  ({ type_ = type__; confidence = confidence_ } : technical_cue_segment)

let make_segment_detection ?type_:(type__ : segment_type option)
    ?start_timestamp_millis:(start_timestamp_millis_ : timestamp option)
    ?end_timestamp_millis:(end_timestamp_millis_ : timestamp option)
    ?duration_millis:(duration_millis_ : u_long option)
    ?start_timecode_smpt_e:(start_timecode_smpt_e_ : timecode option)
    ?end_timecode_smpt_e:(end_timecode_smpt_e_ : timecode option)
    ?duration_smpt_e:(duration_smpt_e_ : timecode option)
    ?technical_cue_segment:(technical_cue_segment_ : technical_cue_segment option)
    ?shot_segment:(shot_segment_ : shot_segment option)
    ?start_frame_number:(start_frame_number_ : u_long option)
    ?end_frame_number:(end_frame_number_ : u_long option)
    ?duration_frames:(duration_frames_ : u_long option) () =
  ({
     type_ = type__;
     start_timestamp_millis = start_timestamp_millis_;
     end_timestamp_millis = end_timestamp_millis_;
     duration_millis = duration_millis_;
     start_timecode_smpt_e = start_timecode_smpt_e_;
     end_timecode_smpt_e = end_timecode_smpt_e_;
     duration_smpt_e = duration_smpt_e_;
     technical_cue_segment = technical_cue_segment_;
     shot_segment = shot_segment_;
     start_frame_number = start_frame_number_;
     end_frame_number = end_frame_number_;
     duration_frames = duration_frames_;
   }
    : segment_detection)

let make_get_segment_detection_response ?job_status:(job_status_ : video_job_status option)
    ?status_message:(status_message_ : status_message option)
    ?video_metadata:(video_metadata_ : video_metadata_list option)
    ?audio_metadata:(audio_metadata_ : audio_metadata_list option)
    ?next_token:(next_token_ : pagination_token option)
    ?segments:(segments_ : segment_detections option)
    ?selected_segment_types:(selected_segment_types_ : segment_types_info option)
    ?job_id:(job_id_ : job_id option) ?video:(video_ : video option)
    ?job_tag:(job_tag_ : job_tag option) () =
  ({
     job_status = job_status_;
     status_message = status_message_;
     video_metadata = video_metadata_;
     audio_metadata = audio_metadata_;
     next_token = next_token_;
     segments = segments_;
     selected_segment_types = selected_segment_types_;
     job_id = job_id_;
     video = video_;
     job_tag = job_tag_;
   }
    : get_segment_detection_response)

let make_get_segment_detection_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_segment_detection_request)

let make_get_text_detection_response ?job_status:(job_status_ : video_job_status option)
    ?status_message:(status_message_ : status_message option)
    ?video_metadata:(video_metadata_ : video_metadata option)
    ?text_detections:(text_detections_ : text_detection_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?text_model_version:(text_model_version_ : string_ option) ?job_id:(job_id_ : job_id option)
    ?video:(video_ : video option) ?job_tag:(job_tag_ : job_tag option) () =
  ({
     job_status = job_status_;
     status_message = status_message_;
     video_metadata = video_metadata_;
     text_detections = text_detections_;
     next_token = next_token_;
     text_model_version = text_model_version_;
     job_id = job_id_;
     video = video_;
     job_tag = job_tag_;
   }
    : get_text_detection_response)

let make_get_text_detection_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_text_detection_request)

let make_unindexed_face ?reasons:(reasons_ : reasons option)
    ?face_detail:(face_detail_ : face_detail option) () =
  ({ reasons = reasons_; face_detail = face_detail_ } : unindexed_face)

let make_index_faces_response ?face_records:(face_records_ : face_record_list option)
    ?orientation_correction:(orientation_correction_ : orientation_correction option)
    ?face_model_version:(face_model_version_ : string_ option)
    ?unindexed_faces:(unindexed_faces_ : unindexed_faces option) () =
  ({
     face_records = face_records_;
     orientation_correction = orientation_correction_;
     face_model_version = face_model_version_;
     unindexed_faces = unindexed_faces_;
   }
    : index_faces_response)

let make_index_faces_request ?external_image_id:(external_image_id_ : external_image_id option)
    ?detection_attributes:(detection_attributes_ : attributes option)
    ?max_faces:(max_faces_ : max_faces_to_index option)
    ?quality_filter:(quality_filter_ : quality_filter option)
    ~collection_id:(collection_id_ : collection_id) ~image:(image_ : image) () =
  ({
     collection_id = collection_id_;
     image = image_;
     external_image_id = external_image_id_;
     detection_attributes = detection_attributes_;
     max_faces = max_faces_;
     quality_filter = quality_filter_;
   }
    : index_faces_request)

let make_kinesis_video_stream_start_selector
    ?producer_timestamp:(producer_timestamp_ : u_long option)
    ?fragment_number:(fragment_number_ : kinesis_video_stream_fragment_number option) () =
  ({ producer_timestamp = producer_timestamp_; fragment_number = fragment_number_ }
    : kinesis_video_stream_start_selector)

let make_label_detection_settings ?general_labels:(general_labels_ : general_labels_settings option)
    () =
  ({ general_labels = general_labels_ } : label_detection_settings)

let make_list_collections_response ?collection_ids:(collection_ids_ : collection_id_list option)
    ?next_token:(next_token_ : pagination_token option)
    ?face_model_versions:(face_model_versions_ : face_model_version_list option) () =
  ({
     collection_ids = collection_ids_;
     next_token = next_token_;
     face_model_versions = face_model_versions_;
   }
    : list_collections_response)

let make_list_collections_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_collections_request)

let make_list_dataset_entries_response ?dataset_entries:(dataset_entries_ : dataset_entries option)
    ?next_token:(next_token_ : extended_pagination_token option) () =
  ({ dataset_entries = dataset_entries_; next_token = next_token_ } : list_dataset_entries_response)

let make_list_dataset_entries_request ?contains_labels:(contains_labels_ : dataset_labels option)
    ?labeled:(labeled_ : is_labeled option)
    ?source_ref_contains:(source_ref_contains_ : query_string option)
    ?has_errors:(has_errors_ : has_errors option)
    ?next_token:(next_token_ : extended_pagination_token option)
    ?max_results:(max_results_ : list_dataset_entries_page_size option)
    ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({
     dataset_arn = dataset_arn_;
     contains_labels = contains_labels_;
     labeled = labeled_;
     source_ref_contains = source_ref_contains_;
     has_errors = has_errors_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_dataset_entries_request)

let make_list_dataset_labels_response
    ?dataset_label_descriptions:(dataset_label_descriptions_ : dataset_label_descriptions option)
    ?next_token:(next_token_ : extended_pagination_token option) () =
  ({ dataset_label_descriptions = dataset_label_descriptions_; next_token = next_token_ }
    : list_dataset_labels_response)

let make_list_dataset_labels_request ?next_token:(next_token_ : extended_pagination_token option)
    ?max_results:(max_results_ : list_dataset_labels_page_size option)
    ~dataset_arn:(dataset_arn_ : dataset_arn) () =
  ({ dataset_arn = dataset_arn_; next_token = next_token_; max_results = max_results_ }
    : list_dataset_labels_request)

let make_list_faces_response ?faces:(faces_ : face_list option)
    ?next_token:(next_token_ : string_ option)
    ?face_model_version:(face_model_version_ : string_ option) () =
  ({ faces = faces_; next_token = next_token_; face_model_version = face_model_version_ }
    : list_faces_response)

let make_list_faces_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option) ?user_id:(user_id_ : user_id option)
    ?face_ids:(face_ids_ : face_id_list option) ~collection_id:(collection_id_ : collection_id) () =
  ({
     collection_id = collection_id_;
     next_token = next_token_;
     max_results = max_results_;
     user_id = user_id_;
     face_ids = face_ids_;
   }
    : list_faces_request)

let make_media_analysis_job_description ?job_name:(job_name_ : media_analysis_job_name option)
    ?failure_details:(failure_details_ : media_analysis_job_failure_details option)
    ?completion_timestamp:(completion_timestamp_ : date_time option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?results:(results_ : media_analysis_results option)
    ?manifest_summary:(manifest_summary_ : media_analysis_manifest_summary option)
    ~job_id:(job_id_ : media_analysis_job_id)
    ~operations_config:(operations_config_ : media_analysis_operations_config)
    ~status:(status_ : media_analysis_job_status)
    ~creation_timestamp:(creation_timestamp_ : date_time) ~input:(input_ : media_analysis_input)
    ~output_config:(output_config_ : media_analysis_output_config) () =
  ({
     job_id = job_id_;
     job_name = job_name_;
     operations_config = operations_config_;
     status = status_;
     failure_details = failure_details_;
     creation_timestamp = creation_timestamp_;
     completion_timestamp = completion_timestamp_;
     input = input_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
     results = results_;
     manifest_summary = manifest_summary_;
   }
    : media_analysis_job_description)

let make_list_media_analysis_jobs_response
    ?next_token:(next_token_ : extended_pagination_token option)
    ~media_analysis_jobs:(media_analysis_jobs_ : media_analysis_job_descriptions) () =
  ({ next_token = next_token_; media_analysis_jobs = media_analysis_jobs_ }
    : list_media_analysis_jobs_response)

let make_list_media_analysis_jobs_request
    ?next_token:(next_token_ : extended_pagination_token option)
    ?max_results:(max_results_ : list_media_analysis_jobs_page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_media_analysis_jobs_request)

let make_project_policy ?project_arn:(project_arn_ : project_arn option)
    ?policy_name:(policy_name_ : project_policy_name option)
    ?policy_revision_id:(policy_revision_id_ : project_policy_revision_id option)
    ?policy_document:(policy_document_ : project_policy_document option)
    ?creation_timestamp:(creation_timestamp_ : date_time option)
    ?last_updated_timestamp:(last_updated_timestamp_ : date_time option) () =
  ({
     project_arn = project_arn_;
     policy_name = policy_name_;
     policy_revision_id = policy_revision_id_;
     policy_document = policy_document_;
     creation_timestamp = creation_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : project_policy)

let make_list_project_policies_response
    ?project_policies:(project_policies_ : project_policies option)
    ?next_token:(next_token_ : extended_pagination_token option) () =
  ({ project_policies = project_policies_; next_token = next_token_ }
    : list_project_policies_response)

let make_list_project_policies_request ?next_token:(next_token_ : extended_pagination_token option)
    ?max_results:(max_results_ : list_project_policies_page_size option)
    ~project_arn:(project_arn_ : project_arn) () =
  ({ project_arn = project_arn_; next_token = next_token_; max_results = max_results_ }
    : list_project_policies_request)

let make_stream_processor ?name:(name_ : stream_processor_name option)
    ?status:(status_ : stream_processor_status option) () =
  ({ name = name_; status = status_ } : stream_processor)

let make_list_stream_processors_response ?next_token:(next_token_ : pagination_token option)
    ?stream_processors:(stream_processors_ : stream_processor_list option) () =
  ({ next_token = next_token_; stream_processors = stream_processors_ }
    : list_stream_processors_response)

let make_list_stream_processors_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_stream_processors_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_user ?user_id:(user_id_ : user_id option) ?user_status:(user_status_ : user_status option)
    () =
  ({ user_id = user_id_; user_status = user_status_ } : user)

let make_list_users_response ?users:(users_ : user_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ users = users_; next_token = next_token_ } : list_users_response)

let make_list_users_request ?max_results:(max_results_ : max_user_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~collection_id:(collection_id_ : collection_id) () =
  ({ collection_id = collection_id_; max_results = max_results_; next_token = next_token_ }
    : list_users_request)

let make_matched_user ?user_id:(user_id_ : user_id option)
    ?user_status:(user_status_ : user_status option) () =
  ({ user_id = user_id_; user_status = user_status_ } : matched_user)

let make_notification_channel ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn)
    ~role_arn:(role_arn_ : role_arn) () =
  ({ sns_topic_arn = sns_topic_arn_; role_arn = role_arn_ } : notification_channel)

let make_put_project_policy_response
    ?policy_revision_id:(policy_revision_id_ : project_policy_revision_id option) () =
  ({ policy_revision_id = policy_revision_id_ } : put_project_policy_response)

let make_put_project_policy_request
    ?policy_revision_id:(policy_revision_id_ : project_policy_revision_id option)
    ~project_arn:(project_arn_ : project_arn) ~policy_name:(policy_name_ : project_policy_name)
    ~policy_document:(policy_document_ : project_policy_document) () =
  ({
     project_arn = project_arn_;
     policy_name = policy_name_;
     policy_revision_id = policy_revision_id_;
     policy_document = policy_document_;
   }
    : put_project_policy_request)

let make_recognize_celebrities_response ?celebrity_faces:(celebrity_faces_ : celebrity_list option)
    ?unrecognized_faces:(unrecognized_faces_ : compared_face_list option)
    ?orientation_correction:(orientation_correction_ : orientation_correction option) () =
  ({
     celebrity_faces = celebrity_faces_;
     unrecognized_faces = unrecognized_faces_;
     orientation_correction = orientation_correction_;
   }
    : recognize_celebrities_response)

let make_recognize_celebrities_request ~image:(image_ : image) () =
  ({ image = image_ } : recognize_celebrities_request)

let make_update_stream_processor_response () = (() : unit)

let make_stream_processor_settings_for_update
    ?connected_home_for_update:
      (connected_home_for_update_ : connected_home_settings_for_update option) () =
  ({ connected_home_for_update = connected_home_for_update_ }
    : stream_processor_settings_for_update)

let make_update_stream_processor_request
    ?settings_for_update:(settings_for_update_ : stream_processor_settings_for_update option)
    ?regions_of_interest_for_update:(regions_of_interest_for_update_ : regions_of_interest option)
    ?data_sharing_preference_for_update:
      (data_sharing_preference_for_update_ : stream_processor_data_sharing_preference option)
    ?parameters_to_delete:(parameters_to_delete_ : stream_processor_parameters_to_delete option)
    ~name:(name_ : stream_processor_name) () =
  ({
     name = name_;
     settings_for_update = settings_for_update_;
     regions_of_interest_for_update = regions_of_interest_for_update_;
     data_sharing_preference_for_update = data_sharing_preference_for_update_;
     parameters_to_delete = parameters_to_delete_;
   }
    : update_stream_processor_request)

let make_update_dataset_entries_response () = (() : unit)

let make_update_dataset_entries_request ~dataset_arn:(dataset_arn_ : dataset_arn)
    ~changes:(changes_ : dataset_changes) () =
  ({ dataset_arn = dataset_arn_; changes = changes_ } : update_dataset_entries_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tag_map)
    () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

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

let make_start_text_detection_filters ?word_filter:(word_filter_ : detection_filter option)
    ?regions_of_interest:(regions_of_interest_ : regions_of_interest option) () =
  ({ word_filter = word_filter_; regions_of_interest = regions_of_interest_ }
    : start_text_detection_filters)

let make_start_text_detection_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option) ?filters:(filters_ : start_text_detection_filters option)
    ~video:(video_ : video) () =
  ({
     video = video_;
     client_request_token = client_request_token_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
     filters = filters_;
   }
    : start_text_detection_request)

let make_start_stream_processor_response
    ?session_id:(session_id_ : start_stream_processor_session_id option) () =
  ({ session_id = session_id_ } : start_stream_processor_response)

let make_stream_processing_stop_selector
    ?max_duration_in_seconds:(max_duration_in_seconds_ : max_duration_in_seconds_u_long option) () =
  ({ max_duration_in_seconds = max_duration_in_seconds_ } : stream_processing_stop_selector)

let make_stream_processing_start_selector
    ?kvs_stream_start_selector:
      (kvs_stream_start_selector_ : kinesis_video_stream_start_selector option) () =
  ({ kvs_stream_start_selector = kvs_stream_start_selector_ } : stream_processing_start_selector)

let make_start_stream_processor_request
    ?start_selector:(start_selector_ : stream_processing_start_selector option)
    ?stop_selector:(stop_selector_ : stream_processing_stop_selector option)
    ~name:(name_ : stream_processor_name) () =
  ({ name = name_; start_selector = start_selector_; stop_selector = stop_selector_ }
    : start_stream_processor_request)

let make_start_segment_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_segment_detection_response)

let make_start_shot_detection_filter
    ?min_segment_confidence:(min_segment_confidence_ : segment_confidence option) () =
  ({ min_segment_confidence = min_segment_confidence_ } : start_shot_detection_filter)

let make_start_technical_cue_detection_filter
    ?min_segment_confidence:(min_segment_confidence_ : segment_confidence option)
    ?black_frame:(black_frame_ : black_frame option) () =
  ({ min_segment_confidence = min_segment_confidence_; black_frame = black_frame_ }
    : start_technical_cue_detection_filter)

let make_start_segment_detection_filters
    ?technical_cue_filter:(technical_cue_filter_ : start_technical_cue_detection_filter option)
    ?shot_filter:(shot_filter_ : start_shot_detection_filter option) () =
  ({ technical_cue_filter = technical_cue_filter_; shot_filter = shot_filter_ }
    : start_segment_detection_filters)

let make_start_segment_detection_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option)
    ?filters:(filters_ : start_segment_detection_filters option) ~video:(video_ : video)
    ~segment_types:(segment_types_ : segment_types) () =
  ({
     video = video_;
     client_request_token = client_request_token_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
     filters = filters_;
     segment_types = segment_types_;
   }
    : start_segment_detection_request)

let make_start_project_version_response ?status:(status_ : project_version_status option) () =
  ({ status = status_ } : start_project_version_response)

let make_start_project_version_request
    ?max_inference_units:(max_inference_units_ : inference_units option)
    ~project_version_arn:(project_version_arn_ : project_version_arn)
    ~min_inference_units:(min_inference_units_ : inference_units) () =
  ({
     project_version_arn = project_version_arn_;
     min_inference_units = min_inference_units_;
     max_inference_units = max_inference_units_;
   }
    : start_project_version_request)

let make_start_person_tracking_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_person_tracking_response)

let make_start_person_tracking_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option) ~video:(video_ : video) () =
  ({
     video = video_;
     client_request_token = client_request_token_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
   }
    : start_person_tracking_request)

let make_start_media_analysis_job_response ~job_id:(job_id_ : media_analysis_job_id) () =
  ({ job_id = job_id_ } : start_media_analysis_job_response)

let make_start_media_analysis_job_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?job_name:(job_name_ : media_analysis_job_name option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~operations_config:(operations_config_ : media_analysis_operations_config)
    ~input:(input_ : media_analysis_input)
    ~output_config:(output_config_ : media_analysis_output_config) () =
  ({
     client_request_token = client_request_token_;
     job_name = job_name_;
     operations_config = operations_config_;
     input = input_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
   }
    : start_media_analysis_job_request)

let make_start_label_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_label_detection_response)

let make_start_label_detection_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?min_confidence:(min_confidence_ : percent option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option) ?features:(features_ : label_detection_feature_list option)
    ?settings:(settings_ : label_detection_settings option) ~video:(video_ : video) () =
  ({
     video = video_;
     client_request_token = client_request_token_;
     min_confidence = min_confidence_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
     features = features_;
     settings = settings_;
   }
    : start_label_detection_request)

let make_start_face_search_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_face_search_response)

let make_start_face_search_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?face_match_threshold:(face_match_threshold_ : percent option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option) ~video:(video_ : video)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     video = video_;
     client_request_token = client_request_token_;
     face_match_threshold = face_match_threshold_;
     collection_id = collection_id_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
   }
    : start_face_search_request)

let make_start_face_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_face_detection_response)

let make_start_face_detection_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?face_attributes:(face_attributes_ : face_attributes option)
    ?job_tag:(job_tag_ : job_tag option) ~video:(video_ : video) () =
  ({
     video = video_;
     client_request_token = client_request_token_;
     notification_channel = notification_channel_;
     face_attributes = face_attributes_;
     job_tag = job_tag_;
   }
    : start_face_detection_request)

let make_start_content_moderation_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_content_moderation_response)

let make_start_content_moderation_request ?min_confidence:(min_confidence_ : percent option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option) ~video:(video_ : video) () =
  ({
     video = video_;
     min_confidence = min_confidence_;
     client_request_token = client_request_token_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
   }
    : start_content_moderation_request)

let make_start_celebrity_recognition_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_celebrity_recognition_response)

let make_start_celebrity_recognition_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option) ~video:(video_ : video) () =
  ({
     video = video_;
     client_request_token = client_request_token_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
   }
    : start_celebrity_recognition_request)

let make_unsearched_face ?face_details:(face_details_ : face_detail option)
    ?reasons:(reasons_ : unsearched_face_reasons option) () =
  ({ face_details = face_details_; reasons = reasons_ } : unsearched_face)

let make_searched_face_details ?face_detail:(face_detail_ : face_detail option) () =
  ({ face_detail = face_detail_ } : searched_face_details)

let make_user_match ?similarity:(similarity_ : percent option) ?user:(user_ : matched_user option)
    () =
  ({ similarity = similarity_; user = user_ } : user_match)

let make_search_users_by_image_response ?user_matches:(user_matches_ : user_match_list option)
    ?face_model_version:(face_model_version_ : string_ option)
    ?searched_face:(searched_face_ : searched_face_details option)
    ?unsearched_faces:(unsearched_faces_ : unsearched_faces_list option) () =
  ({
     user_matches = user_matches_;
     face_model_version = face_model_version_;
     searched_face = searched_face_;
     unsearched_faces = unsearched_faces_;
   }
    : search_users_by_image_response)

let make_search_users_by_image_request
    ?user_match_threshold:(user_match_threshold_ : percent option)
    ?max_users:(max_users_ : max_user_results option)
    ?quality_filter:(quality_filter_ : quality_filter option)
    ~collection_id:(collection_id_ : collection_id) ~image:(image_ : image) () =
  ({
     collection_id = collection_id_;
     image = image_;
     user_match_threshold = user_match_threshold_;
     max_users = max_users_;
     quality_filter = quality_filter_;
   }
    : search_users_by_image_request)

let make_searched_user ?user_id:(user_id_ : user_id option) () =
  ({ user_id = user_id_ } : searched_user)

let make_searched_face ?face_id:(face_id_ : face_id option) () =
  ({ face_id = face_id_ } : searched_face)

let make_search_users_response ?user_matches:(user_matches_ : user_match_list option)
    ?face_model_version:(face_model_version_ : string_ option)
    ?searched_face:(searched_face_ : searched_face option)
    ?searched_user:(searched_user_ : searched_user option) () =
  ({
     user_matches = user_matches_;
     face_model_version = face_model_version_;
     searched_face = searched_face_;
     searched_user = searched_user_;
   }
    : search_users_response)

let make_search_users_request ?user_id:(user_id_ : user_id option)
    ?face_id:(face_id_ : face_id option)
    ?user_match_threshold:(user_match_threshold_ : percent option)
    ?max_users:(max_users_ : max_user_results option)
    ~collection_id:(collection_id_ : collection_id) () =
  ({
     collection_id = collection_id_;
     user_id = user_id_;
     face_id = face_id_;
     user_match_threshold = user_match_threshold_;
     max_users = max_users_;
   }
    : search_users_request)

let make_search_faces_by_image_response
    ?searched_face_bounding_box:(searched_face_bounding_box_ : bounding_box option)
    ?searched_face_confidence:(searched_face_confidence_ : percent option)
    ?face_matches:(face_matches_ : face_match_list option)
    ?face_model_version:(face_model_version_ : string_ option) () =
  ({
     searched_face_bounding_box = searched_face_bounding_box_;
     searched_face_confidence = searched_face_confidence_;
     face_matches = face_matches_;
     face_model_version = face_model_version_;
   }
    : search_faces_by_image_response)

let make_search_faces_by_image_request ?max_faces:(max_faces_ : max_faces option)
    ?face_match_threshold:(face_match_threshold_ : percent option)
    ?quality_filter:(quality_filter_ : quality_filter option)
    ~collection_id:(collection_id_ : collection_id) ~image:(image_ : image) () =
  ({
     collection_id = collection_id_;
     image = image_;
     max_faces = max_faces_;
     face_match_threshold = face_match_threshold_;
     quality_filter = quality_filter_;
   }
    : search_faces_by_image_request)

let make_search_faces_response ?searched_face_id:(searched_face_id_ : face_id option)
    ?face_matches:(face_matches_ : face_match_list option)
    ?face_model_version:(face_model_version_ : string_ option) () =
  ({
     searched_face_id = searched_face_id_;
     face_matches = face_matches_;
     face_model_version = face_model_version_;
   }
    : search_faces_response)

let make_search_faces_request ?max_faces:(max_faces_ : max_faces option)
    ?face_match_threshold:(face_match_threshold_ : percent option)
    ~collection_id:(collection_id_ : collection_id) ~face_id:(face_id_ : face_id) () =
  ({
     collection_id = collection_id_;
     face_id = face_id_;
     max_faces = max_faces_;
     face_match_threshold = face_match_threshold_;
   }
    : search_faces_request)
