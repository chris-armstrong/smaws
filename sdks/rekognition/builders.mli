open Types

val make_age_range : ?low:u_integer -> ?high:u_integer -> unit -> age_range

val make_s3_object :
  ?bucket:s3_bucket -> ?name:s3_object_name -> ?version:s3_object_version -> unit -> s3_object

val make_ground_truth_manifest : ?s3_object:s3_object -> unit -> ground_truth_manifest
val make_asset : ?ground_truth_manifest:ground_truth_manifest -> unit -> asset

val make_unsuccessful_face_association :
  ?face_id:face_id ->
  ?user_id:user_id ->
  ?confidence:percent ->
  ?reasons:unsuccessful_face_association_reasons ->
  unit ->
  unsuccessful_face_association

val make_associated_face : ?face_id:face_id -> unit -> associated_face

val make_associate_faces_response :
  ?associated_faces:associated_faces_list ->
  ?unsuccessful_face_associations:unsuccessful_face_association_list ->
  ?user_status:user_status ->
  unit ->
  associate_faces_response

val make_associate_faces_request :
  ?user_match_threshold:percent ->
  ?client_request_token:client_request_token ->
  collection_id:collection_id ->
  user_id:user_id ->
  face_ids:user_face_id_list ->
  unit ->
  associate_faces_request

val make_audio_metadata :
  ?codec:string_ ->
  ?duration_millis:u_long ->
  ?sample_rate:u_long ->
  ?number_of_channels:u_long ->
  unit ->
  audio_metadata

val make_bounding_box :
  ?width:float_ -> ?height:float_ -> ?left:float_ -> ?top:float_ -> unit -> bounding_box

val make_audit_image :
  ?bytes:liveness_image_blob ->
  ?s3_object:s3_object ->
  ?bounding_box:bounding_box ->
  unit ->
  audit_image

val make_beard : ?value:boolean_ -> ?confidence:percent -> unit -> beard

val make_black_frame :
  ?max_pixel_threshold:max_pixel_threshold ->
  ?min_coverage_percentage:min_coverage_percentage ->
  unit ->
  black_frame

val make_covers_body_part : ?confidence:percent -> ?value:boolean_ -> unit -> covers_body_part

val make_equipment_detection :
  ?bounding_box:bounding_box ->
  ?confidence:percent ->
  ?type_:protective_equipment_type ->
  ?covers_body_part:covers_body_part ->
  unit ->
  equipment_detection

val make_protective_equipment_body_part :
  ?name:body_part ->
  ?confidence:percent ->
  ?equipment_detections:equipment_detections ->
  unit ->
  protective_equipment_body_part

val make_known_gender : ?type_:known_gender_type -> unit -> known_gender
val make_smile : ?value:boolean_ -> ?confidence:percent -> unit -> smile
val make_emotion : ?type_:emotion_name -> ?confidence:percent -> unit -> emotion
val make_image_quality : ?brightness:float_ -> ?sharpness:float_ -> unit -> image_quality
val make_pose : ?roll:degree -> ?yaw:degree -> ?pitch:degree -> unit -> pose
val make_landmark : ?type_:landmark_type -> ?x:float_ -> ?y:float_ -> unit -> landmark

val make_compared_face :
  ?bounding_box:bounding_box ->
  ?confidence:percent ->
  ?landmarks:landmarks ->
  ?pose:pose ->
  ?quality:image_quality ->
  ?emotions:emotions ->
  ?smile:smile ->
  unit ->
  compared_face

val make_celebrity :
  ?urls:urls ->
  ?name:string_ ->
  ?id:rekognition_unique_id ->
  ?face:compared_face ->
  ?match_confidence:percent ->
  ?known_gender:known_gender ->
  unit ->
  celebrity

val make_eye_direction :
  ?yaw:degree -> ?pitch:degree -> ?confidence:percent -> unit -> eye_direction

val make_face_occluded : ?value:boolean_ -> ?confidence:percent -> unit -> face_occluded
val make_mouth_open : ?value:boolean_ -> ?confidence:percent -> unit -> mouth_open
val make_eye_open : ?value:boolean_ -> ?confidence:percent -> unit -> eye_open
val make_mustache : ?value:boolean_ -> ?confidence:percent -> unit -> mustache
val make_gender : ?value:gender_type -> ?confidence:percent -> unit -> gender
val make_sunglasses : ?value:boolean_ -> ?confidence:percent -> unit -> sunglasses
val make_eyeglasses : ?value:boolean_ -> ?confidence:percent -> unit -> eyeglasses

val make_face_detail :
  ?bounding_box:bounding_box ->
  ?age_range:age_range ->
  ?smile:smile ->
  ?eyeglasses:eyeglasses ->
  ?sunglasses:sunglasses ->
  ?gender:gender ->
  ?beard:beard ->
  ?mustache:mustache ->
  ?eyes_open:eye_open ->
  ?mouth_open:mouth_open ->
  ?emotions:emotions ->
  ?landmarks:landmarks ->
  ?pose:pose ->
  ?quality:image_quality ->
  ?confidence:percent ->
  ?face_occluded:face_occluded ->
  ?eye_direction:eye_direction ->
  unit ->
  face_detail

val make_celebrity_detail :
  ?urls:urls ->
  ?name:string_ ->
  ?id:rekognition_unique_id ->
  ?confidence:percent ->
  ?bounding_box:bounding_box ->
  ?face:face_detail ->
  ?known_gender:known_gender ->
  unit ->
  celebrity_detail

val make_celebrity_recognition :
  ?timestamp:timestamp -> ?celebrity:celebrity_detail -> unit -> celebrity_recognition

val make_challenge : type_:challenge_type -> version:version -> unit -> challenge
val make_versions : ?minimum:version -> ?maximum:version -> unit -> versions

val make_challenge_preference :
  ?versions:versions -> type_:challenge_type -> unit -> challenge_preference

val make_compare_faces_match :
  ?similarity:percent -> ?face:compared_face -> unit -> compare_faces_match

val make_compared_source_image_face :
  ?bounding_box:bounding_box -> ?confidence:percent -> unit -> compared_source_image_face

val make_compare_faces_response :
  ?source_image_face:compared_source_image_face ->
  ?face_matches:compare_faces_match_list ->
  ?unmatched_faces:compare_faces_unmatch_list ->
  ?source_image_orientation_correction:orientation_correction ->
  ?target_image_orientation_correction:orientation_correction ->
  unit ->
  compare_faces_response

val make_image : ?bytes:image_blob -> ?s3_object:s3_object -> unit -> image

val make_compare_faces_request :
  ?similarity_threshold:percent ->
  ?quality_filter:quality_filter ->
  source_image:image ->
  target_image:image ->
  unit ->
  compare_faces_request

val make_connected_home_settings :
  ?min_confidence:percent -> labels:connected_home_labels -> unit -> connected_home_settings

val make_connected_home_settings_for_update :
  ?labels:connected_home_labels ->
  ?min_confidence:percent ->
  unit ->
  connected_home_settings_for_update

val make_content_type : ?confidence:percent -> ?name:string_ -> unit -> content_type

val make_moderation_label :
  ?confidence:percent ->
  ?name:string_ ->
  ?parent_name:string_ ->
  ?taxonomy_level:u_integer ->
  unit ->
  moderation_label

val make_content_moderation_detection :
  ?timestamp:timestamp ->
  ?moderation_label:moderation_label ->
  ?start_timestamp_millis:u_long ->
  ?end_timestamp_millis:u_long ->
  ?duration_millis:u_long ->
  ?content_types:content_types ->
  unit ->
  content_moderation_detection

val make_copy_project_version_response :
  ?project_version_arn:project_version_arn -> unit -> copy_project_version_response

val make_output_config :
  ?s3_bucket:s3_bucket -> ?s3_key_prefix:s3_key_prefix -> unit -> output_config

val make_copy_project_version_request :
  ?tags:tag_map ->
  ?kms_key_id:kms_key_id ->
  source_project_arn:project_arn ->
  source_project_version_arn:project_version_arn ->
  destination_project_arn:project_arn ->
  version_name:version_name ->
  output_config:output_config ->
  unit ->
  copy_project_version_request

val make_create_collection_response :
  ?status_code:u_integer ->
  ?collection_arn:string_ ->
  ?face_model_version:string_ ->
  unit ->
  create_collection_response

val make_create_collection_request :
  ?tags:tag_map -> collection_id:collection_id -> unit -> create_collection_request

val make_create_dataset_response : ?dataset_arn:dataset_arn -> unit -> create_dataset_response

val make_dataset_source :
  ?ground_truth_manifest:ground_truth_manifest -> ?dataset_arn:dataset_arn -> unit -> dataset_source

val make_create_dataset_request :
  ?dataset_source:dataset_source ->
  ?tags:tag_map ->
  dataset_type:dataset_type ->
  project_arn:project_arn ->
  unit ->
  create_dataset_request

val make_create_face_liveness_session_response :
  session_id:liveness_session_id -> unit -> create_face_liveness_session_response

val make_liveness_output_config :
  ?s3_key_prefix:liveness_s3_key_prefix -> s3_bucket:s3_bucket -> unit -> liveness_output_config

val make_create_face_liveness_session_request_settings :
  ?output_config:liveness_output_config ->
  ?audit_images_limit:audit_images_limit ->
  ?challenge_preferences:challenge_preferences ->
  unit ->
  create_face_liveness_session_request_settings

val make_create_face_liveness_session_request :
  ?kms_key_id:kms_key_id ->
  ?settings:create_face_liveness_session_request_settings ->
  ?client_request_token:client_request_token ->
  unit ->
  create_face_liveness_session_request

val make_create_project_response : ?project_arn:project_arn -> unit -> create_project_response

val make_create_project_request :
  ?feature:customization_feature ->
  ?auto_update:project_auto_update ->
  ?tags:tag_map ->
  project_name:project_name ->
  unit ->
  create_project_request

val make_create_project_version_response :
  ?project_version_arn:project_version_arn -> unit -> create_project_version_response

val make_customization_feature_content_moderation_config :
  ?confidence_threshold:percent -> unit -> customization_feature_content_moderation_config

val make_customization_feature_config :
  ?content_moderation:customization_feature_content_moderation_config ->
  unit ->
  customization_feature_config

val make_testing_data : ?assets:assets -> ?auto_create:boolean_ -> unit -> testing_data
val make_training_data : ?assets:assets -> unit -> training_data

val make_create_project_version_request :
  ?training_data:training_data ->
  ?testing_data:testing_data ->
  ?tags:tag_map ->
  ?kms_key_id:kms_key_id ->
  ?version_description:version_description ->
  ?feature_config:customization_feature_config ->
  project_arn:project_arn ->
  version_name:version_name ->
  output_config:output_config ->
  unit ->
  create_project_version_request

val make_create_stream_processor_response :
  ?stream_processor_arn:stream_processor_arn -> unit -> create_stream_processor_response

val make_stream_processor_data_sharing_preference :
  opt_in:boolean_ -> unit -> stream_processor_data_sharing_preference

val make_point : ?x:float_ -> ?y:float_ -> unit -> point

val make_region_of_interest :
  ?bounding_box:bounding_box -> ?polygon:polygon -> unit -> region_of_interest

val make_stream_processor_notification_channel :
  sns_topic_arn:sns_topic_arn -> unit -> stream_processor_notification_channel

val make_face_search_settings :
  ?collection_id:collection_id -> ?face_match_threshold:percent -> unit -> face_search_settings

val make_stream_processor_settings :
  ?face_search:face_search_settings ->
  ?connected_home:connected_home_settings ->
  unit ->
  stream_processor_settings

val make_s3_destination : ?bucket:s3_bucket -> ?key_prefix:s3_key_prefix -> unit -> s3_destination
val make_kinesis_data_stream : ?arn:kinesis_data_arn -> unit -> kinesis_data_stream

val make_stream_processor_output :
  ?kinesis_data_stream:kinesis_data_stream ->
  ?s3_destination:s3_destination ->
  unit ->
  stream_processor_output

val make_kinesis_video_stream : ?arn:kinesis_video_arn -> unit -> kinesis_video_stream

val make_stream_processor_input :
  ?kinesis_video_stream:kinesis_video_stream -> unit -> stream_processor_input

val make_create_stream_processor_request :
  ?tags:tag_map ->
  ?notification_channel:stream_processor_notification_channel ->
  ?kms_key_id:kms_key_id ->
  ?regions_of_interest:regions_of_interest ->
  ?data_sharing_preference:stream_processor_data_sharing_preference ->
  input:stream_processor_input ->
  output:stream_processor_output ->
  name:stream_processor_name ->
  settings:stream_processor_settings ->
  role_arn:role_arn ->
  unit ->
  create_stream_processor_request

val make_create_user_response : unit -> unit

val make_create_user_request :
  ?client_request_token:client_request_token ->
  collection_id:collection_id ->
  user_id:user_id ->
  unit ->
  create_user_request

val make_geometry : ?bounding_box:bounding_box -> ?polygon:polygon -> unit -> geometry

val make_custom_label :
  ?name:string_ -> ?confidence:percent -> ?geometry:geometry -> unit -> custom_label

val make_dataset_changes : ground_truth:ground_truth_blob -> unit -> dataset_changes

val make_dataset_stats :
  ?labeled_entries:u_integer ->
  ?total_entries:u_integer ->
  ?total_labels:u_integer ->
  ?error_entries:u_integer ->
  unit ->
  dataset_stats

val make_dataset_description :
  ?creation_timestamp:date_time ->
  ?last_updated_timestamp:date_time ->
  ?status:dataset_status ->
  ?status_message:status_message ->
  ?status_message_code:dataset_status_message_code ->
  ?dataset_stats:dataset_stats ->
  unit ->
  dataset_description

val make_dataset_label_stats :
  ?entry_count:u_integer -> ?bounding_box_count:u_integer -> unit -> dataset_label_stats

val make_dataset_label_description :
  ?label_name:dataset_label -> ?label_stats:dataset_label_stats -> unit -> dataset_label_description

val make_dataset_metadata :
  ?creation_timestamp:date_time ->
  ?dataset_type:dataset_type ->
  ?dataset_arn:dataset_arn ->
  ?status:dataset_status ->
  ?status_message:status_message ->
  ?status_message_code:dataset_status_message_code ->
  unit ->
  dataset_metadata

val make_delete_collection_response : ?status_code:u_integer -> unit -> delete_collection_response

val make_delete_collection_request :
  collection_id:collection_id -> unit -> delete_collection_request

val make_delete_dataset_response : unit -> unit
val make_delete_dataset_request : dataset_arn:dataset_arn -> unit -> delete_dataset_request

val make_unsuccessful_face_deletion :
  ?face_id:face_id ->
  ?user_id:user_id ->
  ?reasons:unsuccessful_face_deletion_reasons ->
  unit ->
  unsuccessful_face_deletion

val make_delete_faces_response :
  ?deleted_faces:face_id_list ->
  ?unsuccessful_face_deletions:unsuccessful_face_deletions_list ->
  unit ->
  delete_faces_response

val make_delete_faces_request :
  collection_id:collection_id -> face_ids:face_id_list -> unit -> delete_faces_request

val make_delete_project_response : ?status:project_status -> unit -> delete_project_response
val make_delete_project_request : project_arn:project_arn -> unit -> delete_project_request
val make_delete_project_policy_response : unit -> unit

val make_delete_project_policy_request :
  ?policy_revision_id:project_policy_revision_id ->
  project_arn:project_arn ->
  policy_name:project_policy_name ->
  unit ->
  delete_project_policy_request

val make_delete_project_version_response :
  ?status:project_version_status -> unit -> delete_project_version_response

val make_delete_project_version_request :
  project_version_arn:project_version_arn -> unit -> delete_project_version_request

val make_delete_stream_processor_response : unit -> unit

val make_delete_stream_processor_request :
  name:stream_processor_name -> unit -> delete_stream_processor_request

val make_delete_user_response : unit -> unit

val make_delete_user_request :
  ?client_request_token:client_request_token ->
  collection_id:collection_id ->
  user_id:user_id ->
  unit ->
  delete_user_request

val make_describe_collection_response :
  ?face_count:u_long ->
  ?face_model_version:string_ ->
  ?collection_ar_n:string_ ->
  ?creation_timestamp:date_time ->
  ?user_count:u_long ->
  unit ->
  describe_collection_response

val make_describe_collection_request :
  collection_id:collection_id -> unit -> describe_collection_request

val make_describe_dataset_response :
  ?dataset_description:dataset_description -> unit -> describe_dataset_response

val make_describe_dataset_request : dataset_arn:dataset_arn -> unit -> describe_dataset_request
val make_summary : ?s3_object:s3_object -> unit -> summary
val make_validation_data : ?assets:assets -> unit -> validation_data

val make_project_version_description :
  ?project_version_arn:project_version_arn ->
  ?creation_timestamp:date_time ->
  ?min_inference_units:inference_units ->
  ?status:project_version_status ->
  ?status_message:status_message ->
  ?billable_training_time_in_seconds:u_long ->
  ?training_end_timestamp:date_time ->
  ?output_config:output_config ->
  ?training_data_result:training_data_result ->
  ?testing_data_result:testing_data_result ->
  ?evaluation_result:evaluation_result ->
  ?manifest_summary:ground_truth_manifest ->
  ?kms_key_id:kms_key_id ->
  ?max_inference_units:inference_units ->
  ?source_project_version_arn:project_version_arn ->
  ?version_description:version_description ->
  ?feature:customization_feature ->
  ?base_model_version:string_ ->
  ?feature_config:customization_feature_config ->
  unit ->
  project_version_description

val make_describe_project_versions_response :
  ?project_version_descriptions:project_version_descriptions ->
  ?next_token:extended_pagination_token ->
  unit ->
  describe_project_versions_response

val make_describe_project_versions_request :
  ?version_names:version_names ->
  ?next_token:extended_pagination_token ->
  ?max_results:project_versions_page_size ->
  project_arn:project_arn ->
  unit ->
  describe_project_versions_request

val make_project_description :
  ?project_arn:project_arn ->
  ?creation_timestamp:date_time ->
  ?status:project_status ->
  ?datasets:dataset_metadata_list ->
  ?feature:customization_feature ->
  ?auto_update:project_auto_update ->
  unit ->
  project_description

val make_describe_projects_response :
  ?project_descriptions:project_descriptions ->
  ?next_token:extended_pagination_token ->
  unit ->
  describe_projects_response

val make_describe_projects_request :
  ?next_token:extended_pagination_token ->
  ?max_results:projects_page_size ->
  ?project_names:project_names ->
  ?features:customization_features ->
  unit ->
  describe_projects_request

val make_describe_stream_processor_response :
  ?name:stream_processor_name ->
  ?stream_processor_arn:stream_processor_arn ->
  ?status:stream_processor_status ->
  ?status_message:string_ ->
  ?creation_timestamp:date_time ->
  ?last_update_timestamp:date_time ->
  ?input:stream_processor_input ->
  ?output:stream_processor_output ->
  ?role_arn:role_arn ->
  ?settings:stream_processor_settings ->
  ?notification_channel:stream_processor_notification_channel ->
  ?kms_key_id:kms_key_id ->
  ?regions_of_interest:regions_of_interest ->
  ?data_sharing_preference:stream_processor_data_sharing_preference ->
  unit ->
  describe_stream_processor_response

val make_describe_stream_processor_request :
  name:stream_processor_name -> unit -> describe_stream_processor_request

val make_detect_custom_labels_response :
  ?custom_labels:custom_labels -> unit -> detect_custom_labels_response

val make_detect_custom_labels_request :
  ?max_results:u_integer ->
  ?min_confidence:percent ->
  project_version_arn:project_version_arn ->
  image:image ->
  unit ->
  detect_custom_labels_request

val make_detect_faces_response :
  ?face_details:face_detail_list ->
  ?orientation_correction:orientation_correction ->
  unit ->
  detect_faces_response

val make_detect_faces_request :
  ?attributes:attributes -> image:image -> unit -> detect_faces_request

val make_dominant_color :
  ?red:u_integer ->
  ?blue:u_integer ->
  ?green:u_integer ->
  ?hex_code:string_ ->
  ?css_color:string_ ->
  ?simplified_color:string_ ->
  ?pixel_percent:percent ->
  unit ->
  dominant_color

val make_detect_labels_image_quality :
  ?brightness:float_ -> ?sharpness:float_ -> ?contrast:float_ -> unit -> detect_labels_image_quality

val make_detect_labels_image_background :
  ?quality:detect_labels_image_quality ->
  ?dominant_colors:dominant_colors ->
  unit ->
  detect_labels_image_background

val make_detect_labels_image_foreground :
  ?quality:detect_labels_image_quality ->
  ?dominant_colors:dominant_colors ->
  unit ->
  detect_labels_image_foreground

val make_detect_labels_image_properties :
  ?quality:detect_labels_image_quality ->
  ?dominant_colors:dominant_colors ->
  ?foreground:detect_labels_image_foreground ->
  ?background:detect_labels_image_background ->
  unit ->
  detect_labels_image_properties

val make_label_category : ?name:string_ -> unit -> label_category
val make_label_alias : ?name:string_ -> unit -> label_alias
val make_parent : ?name:string_ -> unit -> parent

val make_instance :
  ?bounding_box:bounding_box ->
  ?confidence:percent ->
  ?dominant_colors:dominant_colors ->
  unit ->
  instance

val make_label :
  ?name:string_ ->
  ?confidence:percent ->
  ?instances:instances ->
  ?parents:parents ->
  ?aliases:label_aliases ->
  ?categories:label_categories ->
  unit ->
  label

val make_detect_labels_response :
  ?labels:labels ->
  ?orientation_correction:orientation_correction ->
  ?label_model_version:string_ ->
  ?image_properties:detect_labels_image_properties ->
  unit ->
  detect_labels_response

val make_detect_labels_image_properties_settings :
  ?max_dominant_colors:detect_labels_max_dominant_colors ->
  unit ->
  detect_labels_image_properties_settings

val make_general_labels_settings :
  ?label_inclusion_filters:general_labels_filter_list ->
  ?label_exclusion_filters:general_labels_filter_list ->
  ?label_category_inclusion_filters:general_labels_filter_list ->
  ?label_category_exclusion_filters:general_labels_filter_list ->
  unit ->
  general_labels_settings

val make_detect_labels_settings :
  ?general_labels:general_labels_settings ->
  ?image_properties:detect_labels_image_properties_settings ->
  unit ->
  detect_labels_settings

val make_detect_labels_request :
  ?max_labels:u_integer ->
  ?min_confidence:percent ->
  ?features:detect_labels_feature_list ->
  ?settings:detect_labels_settings ->
  image:image ->
  unit ->
  detect_labels_request

val make_human_loop_activation_output :
  ?human_loop_arn:human_loop_arn ->
  ?human_loop_activation_reasons:human_loop_activation_reasons ->
  ?human_loop_activation_conditions_evaluation_results:
    synthesized_json_human_loop_activation_conditions_evaluation_results ->
  unit ->
  human_loop_activation_output

val make_detect_moderation_labels_response :
  ?moderation_labels:moderation_labels ->
  ?moderation_model_version:string_ ->
  ?human_loop_activation_output:human_loop_activation_output ->
  ?project_version:project_version_id ->
  ?content_types:content_types ->
  unit ->
  detect_moderation_labels_response

val make_human_loop_data_attributes :
  ?content_classifiers:content_classifiers -> unit -> human_loop_data_attributes

val make_human_loop_config :
  ?data_attributes:human_loop_data_attributes ->
  human_loop_name:human_loop_name ->
  flow_definition_arn:flow_definition_arn ->
  unit ->
  human_loop_config

val make_detect_moderation_labels_request :
  ?min_confidence:percent ->
  ?human_loop_config:human_loop_config ->
  ?project_version:project_version_id ->
  image:image ->
  unit ->
  detect_moderation_labels_request

val make_protective_equipment_summary :
  ?persons_with_required_equipment:protective_equipment_person_ids ->
  ?persons_without_required_equipment:protective_equipment_person_ids ->
  ?persons_indeterminate:protective_equipment_person_ids ->
  unit ->
  protective_equipment_summary

val make_protective_equipment_person :
  ?body_parts:body_parts ->
  ?bounding_box:bounding_box ->
  ?confidence:percent ->
  ?id:u_integer ->
  unit ->
  protective_equipment_person

val make_detect_protective_equipment_response :
  ?protective_equipment_model_version:string_ ->
  ?persons:protective_equipment_persons ->
  ?summary:protective_equipment_summary ->
  unit ->
  detect_protective_equipment_response

val make_protective_equipment_summarization_attributes :
  min_confidence:percent ->
  required_equipment_types:protective_equipment_types ->
  unit ->
  protective_equipment_summarization_attributes

val make_detect_protective_equipment_request :
  ?summarization_attributes:protective_equipment_summarization_attributes ->
  image:image ->
  unit ->
  detect_protective_equipment_request

val make_text_detection :
  ?detected_text:string_ ->
  ?type_:text_types ->
  ?id:u_integer ->
  ?parent_id:u_integer ->
  ?confidence:percent ->
  ?geometry:geometry ->
  unit ->
  text_detection

val make_detect_text_response :
  ?text_detections:text_detection_list ->
  ?text_model_version:string_ ->
  unit ->
  detect_text_response

val make_detection_filter :
  ?min_confidence:percent ->
  ?min_bounding_box_height:bounding_box_height ->
  ?min_bounding_box_width:bounding_box_width ->
  unit ->
  detection_filter

val make_detect_text_filters :
  ?word_filter:detection_filter ->
  ?regions_of_interest:regions_of_interest ->
  unit ->
  detect_text_filters

val make_detect_text_request :
  ?filters:detect_text_filters -> image:image -> unit -> detect_text_request

val make_unsuccessful_face_disassociation :
  ?face_id:face_id ->
  ?user_id:user_id ->
  ?reasons:unsuccessful_face_disassociation_reasons ->
  unit ->
  unsuccessful_face_disassociation

val make_disassociated_face : ?face_id:face_id -> unit -> disassociated_face

val make_disassociate_faces_response :
  ?disassociated_faces:disassociated_faces_list ->
  ?unsuccessful_face_disassociations:unsuccessful_face_disassociation_list ->
  ?user_status:user_status ->
  unit ->
  disassociate_faces_response

val make_disassociate_faces_request :
  ?client_request_token:client_request_token ->
  collection_id:collection_id ->
  user_id:user_id ->
  face_ids:user_face_id_list ->
  unit ->
  disassociate_faces_request

val make_distribute_dataset : arn:dataset_arn -> unit -> distribute_dataset
val make_distribute_dataset_entries_response : unit -> unit

val make_distribute_dataset_entries_request :
  datasets:distribute_dataset_metadata_list -> unit -> distribute_dataset_entries_request

val make_face :
  ?face_id:face_id ->
  ?bounding_box:bounding_box ->
  ?image_id:image_id ->
  ?external_image_id:external_image_id ->
  ?confidence:percent ->
  ?index_faces_model_version:index_faces_model_version ->
  ?user_id:user_id ->
  unit ->
  face

val make_face_detection : ?timestamp:timestamp -> ?face:face_detail -> unit -> face_detection
val make_face_match : ?similarity:percent -> ?face:face -> unit -> face_match
val make_face_record : ?face:face -> ?face_detail:face_detail -> unit -> face_record

val make_get_celebrity_info_response :
  ?urls:urls -> ?name:string_ -> ?known_gender:known_gender -> unit -> get_celebrity_info_response

val make_get_celebrity_info_request : id:rekognition_unique_id -> unit -> get_celebrity_info_request
val make_video : ?s3_object:s3_object -> unit -> video

val make_video_metadata :
  ?codec:string_ ->
  ?duration_millis:u_long ->
  ?format:string_ ->
  ?frame_rate:float_ ->
  ?frame_height:u_long ->
  ?frame_width:u_long ->
  ?color_range:video_color_range ->
  unit ->
  video_metadata

val make_get_celebrity_recognition_response :
  ?job_status:video_job_status ->
  ?status_message:status_message ->
  ?video_metadata:video_metadata ->
  ?next_token:pagination_token ->
  ?celebrities:celebrity_recognitions ->
  ?job_id:job_id ->
  ?video:video ->
  ?job_tag:job_tag ->
  unit ->
  get_celebrity_recognition_response

val make_get_celebrity_recognition_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_by:celebrity_recognition_sort_by ->
  job_id:job_id ->
  unit ->
  get_celebrity_recognition_request

val make_get_content_moderation_request_metadata :
  ?sort_by:content_moderation_sort_by ->
  ?aggregate_by:content_moderation_aggregate_by ->
  unit ->
  get_content_moderation_request_metadata

val make_get_content_moderation_response :
  ?job_status:video_job_status ->
  ?status_message:status_message ->
  ?video_metadata:video_metadata ->
  ?moderation_labels:content_moderation_detections ->
  ?next_token:pagination_token ->
  ?moderation_model_version:string_ ->
  ?job_id:job_id ->
  ?video:video ->
  ?job_tag:job_tag ->
  ?get_request_metadata:get_content_moderation_request_metadata ->
  unit ->
  get_content_moderation_response

val make_get_content_moderation_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_by:content_moderation_sort_by ->
  ?aggregate_by:content_moderation_aggregate_by ->
  job_id:job_id ->
  unit ->
  get_content_moderation_request

val make_get_face_detection_response :
  ?job_status:video_job_status ->
  ?status_message:status_message ->
  ?video_metadata:video_metadata ->
  ?next_token:pagination_token ->
  ?faces:face_detections ->
  ?job_id:job_id ->
  ?video:video ->
  ?job_tag:job_tag ->
  unit ->
  get_face_detection_response

val make_get_face_detection_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_face_detection_request

val make_get_face_liveness_session_results_response :
  ?confidence:percent ->
  ?reference_image:audit_image ->
  ?audit_images:audit_images ->
  ?challenge:challenge ->
  session_id:liveness_session_id ->
  status:liveness_session_status ->
  unit ->
  get_face_liveness_session_results_response

val make_get_face_liveness_session_results_request :
  session_id:liveness_session_id -> unit -> get_face_liveness_session_results_request

val make_person_detail :
  ?index:person_index -> ?bounding_box:bounding_box -> ?face:face_detail -> unit -> person_detail

val make_person_match :
  ?timestamp:timestamp ->
  ?person:person_detail ->
  ?face_matches:face_match_list ->
  unit ->
  person_match

val make_get_face_search_response :
  ?job_status:video_job_status ->
  ?status_message:status_message ->
  ?next_token:pagination_token ->
  ?video_metadata:video_metadata ->
  ?persons:person_matches ->
  ?job_id:job_id ->
  ?video:video ->
  ?job_tag:job_tag ->
  unit ->
  get_face_search_response

val make_get_face_search_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_by:face_search_sort_by ->
  job_id:job_id ->
  unit ->
  get_face_search_request

val make_get_label_detection_request_metadata :
  ?sort_by:label_detection_sort_by ->
  ?aggregate_by:label_detection_aggregate_by ->
  unit ->
  get_label_detection_request_metadata

val make_label_detection :
  ?timestamp:timestamp ->
  ?label:label ->
  ?start_timestamp_millis:u_long ->
  ?end_timestamp_millis:u_long ->
  ?duration_millis:u_long ->
  unit ->
  label_detection

val make_get_label_detection_response :
  ?job_status:video_job_status ->
  ?status_message:status_message ->
  ?video_metadata:video_metadata ->
  ?next_token:pagination_token ->
  ?labels:label_detections ->
  ?label_model_version:string_ ->
  ?job_id:job_id ->
  ?video:video ->
  ?job_tag:job_tag ->
  ?get_request_metadata:get_label_detection_request_metadata ->
  unit ->
  get_label_detection_response

val make_get_label_detection_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_by:label_detection_sort_by ->
  ?aggregate_by:label_detection_aggregate_by ->
  job_id:job_id ->
  unit ->
  get_label_detection_request

val make_media_analysis_manifest_summary :
  ?s3_object:s3_object -> unit -> media_analysis_manifest_summary

val make_media_analysis_model_versions :
  ?moderation:string_ -> unit -> media_analysis_model_versions

val make_media_analysis_results :
  ?s3_object:s3_object ->
  ?model_versions:media_analysis_model_versions ->
  unit ->
  media_analysis_results

val make_media_analysis_output_config :
  ?s3_key_prefix:media_analysis_s3_key_prefix ->
  s3_bucket:s3_bucket ->
  unit ->
  media_analysis_output_config

val make_media_analysis_input : s3_object:s3_object -> unit -> media_analysis_input

val make_media_analysis_job_failure_details :
  ?code:media_analysis_job_failure_code ->
  ?message:string_ ->
  unit ->
  media_analysis_job_failure_details

val make_media_analysis_detect_moderation_labels_config :
  ?min_confidence:percent ->
  ?project_version:project_version_id ->
  unit ->
  media_analysis_detect_moderation_labels_config

val make_media_analysis_operations_config :
  ?detect_moderation_labels:media_analysis_detect_moderation_labels_config ->
  unit ->
  media_analysis_operations_config

val make_get_media_analysis_job_response :
  ?job_name:media_analysis_job_name ->
  ?failure_details:media_analysis_job_failure_details ->
  ?completion_timestamp:date_time ->
  ?kms_key_id:kms_key_id ->
  ?results:media_analysis_results ->
  ?manifest_summary:media_analysis_manifest_summary ->
  job_id:media_analysis_job_id ->
  operations_config:media_analysis_operations_config ->
  status:media_analysis_job_status ->
  creation_timestamp:date_time ->
  input:media_analysis_input ->
  output_config:media_analysis_output_config ->
  unit ->
  get_media_analysis_job_response

val make_get_media_analysis_job_request :
  job_id:media_analysis_job_id -> unit -> get_media_analysis_job_request

val make_person_detection :
  ?timestamp:timestamp -> ?person:person_detail -> unit -> person_detection

val make_get_person_tracking_response :
  ?job_status:video_job_status ->
  ?status_message:status_message ->
  ?video_metadata:video_metadata ->
  ?next_token:pagination_token ->
  ?persons:person_detections ->
  ?job_id:job_id ->
  ?video:video ->
  ?job_tag:job_tag ->
  unit ->
  get_person_tracking_response

val make_get_person_tracking_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_by:person_tracking_sort_by ->
  job_id:job_id ->
  unit ->
  get_person_tracking_request

val make_segment_type_info :
  ?type_:segment_type -> ?model_version:string_ -> unit -> segment_type_info

val make_shot_segment : ?index:u_long -> ?confidence:segment_confidence -> unit -> shot_segment

val make_technical_cue_segment :
  ?type_:technical_cue_type -> ?confidence:segment_confidence -> unit -> technical_cue_segment

val make_segment_detection :
  ?type_:segment_type ->
  ?start_timestamp_millis:timestamp ->
  ?end_timestamp_millis:timestamp ->
  ?duration_millis:u_long ->
  ?start_timecode_smpt_e:timecode ->
  ?end_timecode_smpt_e:timecode ->
  ?duration_smpt_e:timecode ->
  ?technical_cue_segment:technical_cue_segment ->
  ?shot_segment:shot_segment ->
  ?start_frame_number:u_long ->
  ?end_frame_number:u_long ->
  ?duration_frames:u_long ->
  unit ->
  segment_detection

val make_get_segment_detection_response :
  ?job_status:video_job_status ->
  ?status_message:status_message ->
  ?video_metadata:video_metadata_list ->
  ?audio_metadata:audio_metadata_list ->
  ?next_token:pagination_token ->
  ?segments:segment_detections ->
  ?selected_segment_types:segment_types_info ->
  ?job_id:job_id ->
  ?video:video ->
  ?job_tag:job_tag ->
  unit ->
  get_segment_detection_response

val make_get_segment_detection_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_segment_detection_request

val make_get_text_detection_response :
  ?job_status:video_job_status ->
  ?status_message:status_message ->
  ?video_metadata:video_metadata ->
  ?text_detections:text_detection_results ->
  ?next_token:pagination_token ->
  ?text_model_version:string_ ->
  ?job_id:job_id ->
  ?video:video ->
  ?job_tag:job_tag ->
  unit ->
  get_text_detection_response

val make_get_text_detection_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_text_detection_request

val make_unindexed_face : ?reasons:reasons -> ?face_detail:face_detail -> unit -> unindexed_face

val make_index_faces_response :
  ?face_records:face_record_list ->
  ?orientation_correction:orientation_correction ->
  ?face_model_version:string_ ->
  ?unindexed_faces:unindexed_faces ->
  unit ->
  index_faces_response

val make_index_faces_request :
  ?external_image_id:external_image_id ->
  ?detection_attributes:attributes ->
  ?max_faces:max_faces_to_index ->
  ?quality_filter:quality_filter ->
  collection_id:collection_id ->
  image:image ->
  unit ->
  index_faces_request

val make_kinesis_video_stream_start_selector :
  ?producer_timestamp:u_long ->
  ?fragment_number:kinesis_video_stream_fragment_number ->
  unit ->
  kinesis_video_stream_start_selector

val make_label_detection_settings :
  ?general_labels:general_labels_settings -> unit -> label_detection_settings

val make_list_collections_response :
  ?collection_ids:collection_id_list ->
  ?next_token:pagination_token ->
  ?face_model_versions:face_model_version_list ->
  unit ->
  list_collections_response

val make_list_collections_request :
  ?next_token:pagination_token -> ?max_results:page_size -> unit -> list_collections_request

val make_list_dataset_entries_response :
  ?dataset_entries:dataset_entries ->
  ?next_token:extended_pagination_token ->
  unit ->
  list_dataset_entries_response

val make_list_dataset_entries_request :
  ?contains_labels:dataset_labels ->
  ?labeled:is_labeled ->
  ?source_ref_contains:query_string ->
  ?has_errors:has_errors ->
  ?next_token:extended_pagination_token ->
  ?max_results:list_dataset_entries_page_size ->
  dataset_arn:dataset_arn ->
  unit ->
  list_dataset_entries_request

val make_list_dataset_labels_response :
  ?dataset_label_descriptions:dataset_label_descriptions ->
  ?next_token:extended_pagination_token ->
  unit ->
  list_dataset_labels_response

val make_list_dataset_labels_request :
  ?next_token:extended_pagination_token ->
  ?max_results:list_dataset_labels_page_size ->
  dataset_arn:dataset_arn ->
  unit ->
  list_dataset_labels_request

val make_list_faces_response :
  ?faces:face_list ->
  ?next_token:string_ ->
  ?face_model_version:string_ ->
  unit ->
  list_faces_response

val make_list_faces_request :
  ?next_token:pagination_token ->
  ?max_results:page_size ->
  ?user_id:user_id ->
  ?face_ids:face_id_list ->
  collection_id:collection_id ->
  unit ->
  list_faces_request

val make_media_analysis_job_description :
  ?job_name:media_analysis_job_name ->
  ?failure_details:media_analysis_job_failure_details ->
  ?completion_timestamp:date_time ->
  ?kms_key_id:kms_key_id ->
  ?results:media_analysis_results ->
  ?manifest_summary:media_analysis_manifest_summary ->
  job_id:media_analysis_job_id ->
  operations_config:media_analysis_operations_config ->
  status:media_analysis_job_status ->
  creation_timestamp:date_time ->
  input:media_analysis_input ->
  output_config:media_analysis_output_config ->
  unit ->
  media_analysis_job_description

val make_list_media_analysis_jobs_response :
  ?next_token:extended_pagination_token ->
  media_analysis_jobs:media_analysis_job_descriptions ->
  unit ->
  list_media_analysis_jobs_response

val make_list_media_analysis_jobs_request :
  ?next_token:extended_pagination_token ->
  ?max_results:list_media_analysis_jobs_page_size ->
  unit ->
  list_media_analysis_jobs_request

val make_project_policy :
  ?project_arn:project_arn ->
  ?policy_name:project_policy_name ->
  ?policy_revision_id:project_policy_revision_id ->
  ?policy_document:project_policy_document ->
  ?creation_timestamp:date_time ->
  ?last_updated_timestamp:date_time ->
  unit ->
  project_policy

val make_list_project_policies_response :
  ?project_policies:project_policies ->
  ?next_token:extended_pagination_token ->
  unit ->
  list_project_policies_response

val make_list_project_policies_request :
  ?next_token:extended_pagination_token ->
  ?max_results:list_project_policies_page_size ->
  project_arn:project_arn ->
  unit ->
  list_project_policies_request

val make_stream_processor :
  ?name:stream_processor_name -> ?status:stream_processor_status -> unit -> stream_processor

val make_list_stream_processors_response :
  ?next_token:pagination_token ->
  ?stream_processors:stream_processor_list ->
  unit ->
  list_stream_processors_response

val make_list_stream_processors_request :
  ?next_token:pagination_token -> ?max_results:max_results -> unit -> list_stream_processors_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_user : ?user_id:user_id -> ?user_status:user_status -> unit -> user

val make_list_users_response :
  ?users:user_list -> ?next_token:pagination_token -> unit -> list_users_response

val make_list_users_request :
  ?max_results:max_user_results ->
  ?next_token:pagination_token ->
  collection_id:collection_id ->
  unit ->
  list_users_request

val make_matched_user : ?user_id:user_id -> ?user_status:user_status -> unit -> matched_user

val make_notification_channel :
  sns_topic_arn:sns_topic_arn -> role_arn:role_arn -> unit -> notification_channel

val make_put_project_policy_response :
  ?policy_revision_id:project_policy_revision_id -> unit -> put_project_policy_response

val make_put_project_policy_request :
  ?policy_revision_id:project_policy_revision_id ->
  project_arn:project_arn ->
  policy_name:project_policy_name ->
  policy_document:project_policy_document ->
  unit ->
  put_project_policy_request

val make_recognize_celebrities_response :
  ?celebrity_faces:celebrity_list ->
  ?unrecognized_faces:compared_face_list ->
  ?orientation_correction:orientation_correction ->
  unit ->
  recognize_celebrities_response

val make_recognize_celebrities_request : image:image -> unit -> recognize_celebrities_request
val make_update_stream_processor_response : unit -> unit

val make_stream_processor_settings_for_update :
  ?connected_home_for_update:connected_home_settings_for_update ->
  unit ->
  stream_processor_settings_for_update

val make_update_stream_processor_request :
  ?settings_for_update:stream_processor_settings_for_update ->
  ?regions_of_interest_for_update:regions_of_interest ->
  ?data_sharing_preference_for_update:stream_processor_data_sharing_preference ->
  ?parameters_to_delete:stream_processor_parameters_to_delete ->
  name:stream_processor_name ->
  unit ->
  update_stream_processor_request

val make_update_dataset_entries_response : unit -> unit

val make_update_dataset_entries_request :
  dataset_arn:dataset_arn -> changes:dataset_changes -> unit -> update_dataset_entries_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:resource_arn -> tags:tag_map -> unit -> tag_resource_request

val make_stop_stream_processor_response : unit -> unit

val make_stop_stream_processor_request :
  name:stream_processor_name -> unit -> stop_stream_processor_request

val make_stop_project_version_response :
  ?status:project_version_status -> unit -> stop_project_version_response

val make_stop_project_version_request :
  project_version_arn:project_version_arn -> unit -> stop_project_version_request

val make_start_text_detection_response : ?job_id:job_id -> unit -> start_text_detection_response

val make_start_text_detection_filters :
  ?word_filter:detection_filter ->
  ?regions_of_interest:regions_of_interest ->
  unit ->
  start_text_detection_filters

val make_start_text_detection_request :
  ?client_request_token:client_request_token ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  ?filters:start_text_detection_filters ->
  video:video ->
  unit ->
  start_text_detection_request

val make_start_stream_processor_response :
  ?session_id:start_stream_processor_session_id -> unit -> start_stream_processor_response

val make_stream_processing_stop_selector :
  ?max_duration_in_seconds:max_duration_in_seconds_u_long -> unit -> stream_processing_stop_selector

val make_stream_processing_start_selector :
  ?kvs_stream_start_selector:kinesis_video_stream_start_selector ->
  unit ->
  stream_processing_start_selector

val make_start_stream_processor_request :
  ?start_selector:stream_processing_start_selector ->
  ?stop_selector:stream_processing_stop_selector ->
  name:stream_processor_name ->
  unit ->
  start_stream_processor_request

val make_start_segment_detection_response :
  ?job_id:job_id -> unit -> start_segment_detection_response

val make_start_shot_detection_filter :
  ?min_segment_confidence:segment_confidence -> unit -> start_shot_detection_filter

val make_start_technical_cue_detection_filter :
  ?min_segment_confidence:segment_confidence ->
  ?black_frame:black_frame ->
  unit ->
  start_technical_cue_detection_filter

val make_start_segment_detection_filters :
  ?technical_cue_filter:start_technical_cue_detection_filter ->
  ?shot_filter:start_shot_detection_filter ->
  unit ->
  start_segment_detection_filters

val make_start_segment_detection_request :
  ?client_request_token:client_request_token ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  ?filters:start_segment_detection_filters ->
  video:video ->
  segment_types:segment_types ->
  unit ->
  start_segment_detection_request

val make_start_project_version_response :
  ?status:project_version_status -> unit -> start_project_version_response

val make_start_project_version_request :
  ?max_inference_units:inference_units ->
  project_version_arn:project_version_arn ->
  min_inference_units:inference_units ->
  unit ->
  start_project_version_request

val make_start_person_tracking_response : ?job_id:job_id -> unit -> start_person_tracking_response

val make_start_person_tracking_request :
  ?client_request_token:client_request_token ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  video:video ->
  unit ->
  start_person_tracking_request

val make_start_media_analysis_job_response :
  job_id:media_analysis_job_id -> unit -> start_media_analysis_job_response

val make_start_media_analysis_job_request :
  ?client_request_token:client_request_token ->
  ?job_name:media_analysis_job_name ->
  ?kms_key_id:kms_key_id ->
  operations_config:media_analysis_operations_config ->
  input:media_analysis_input ->
  output_config:media_analysis_output_config ->
  unit ->
  start_media_analysis_job_request

val make_start_label_detection_response : ?job_id:job_id -> unit -> start_label_detection_response

val make_start_label_detection_request :
  ?client_request_token:client_request_token ->
  ?min_confidence:percent ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  ?features:label_detection_feature_list ->
  ?settings:label_detection_settings ->
  video:video ->
  unit ->
  start_label_detection_request

val make_start_face_search_response : ?job_id:job_id -> unit -> start_face_search_response

val make_start_face_search_request :
  ?client_request_token:client_request_token ->
  ?face_match_threshold:percent ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  video:video ->
  collection_id:collection_id ->
  unit ->
  start_face_search_request

val make_start_face_detection_response : ?job_id:job_id -> unit -> start_face_detection_response

val make_start_face_detection_request :
  ?client_request_token:client_request_token ->
  ?notification_channel:notification_channel ->
  ?face_attributes:face_attributes ->
  ?job_tag:job_tag ->
  video:video ->
  unit ->
  start_face_detection_request

val make_start_content_moderation_response :
  ?job_id:job_id -> unit -> start_content_moderation_response

val make_start_content_moderation_request :
  ?min_confidence:percent ->
  ?client_request_token:client_request_token ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  video:video ->
  unit ->
  start_content_moderation_request

val make_start_celebrity_recognition_response :
  ?job_id:job_id -> unit -> start_celebrity_recognition_response

val make_start_celebrity_recognition_request :
  ?client_request_token:client_request_token ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  video:video ->
  unit ->
  start_celebrity_recognition_request

val make_unsearched_face :
  ?face_details:face_detail -> ?reasons:unsearched_face_reasons -> unit -> unsearched_face

val make_searched_face_details : ?face_detail:face_detail -> unit -> searched_face_details
val make_user_match : ?similarity:percent -> ?user:matched_user -> unit -> user_match

val make_search_users_by_image_response :
  ?user_matches:user_match_list ->
  ?face_model_version:string_ ->
  ?searched_face:searched_face_details ->
  ?unsearched_faces:unsearched_faces_list ->
  unit ->
  search_users_by_image_response

val make_search_users_by_image_request :
  ?user_match_threshold:percent ->
  ?max_users:max_user_results ->
  ?quality_filter:quality_filter ->
  collection_id:collection_id ->
  image:image ->
  unit ->
  search_users_by_image_request

val make_searched_user : ?user_id:user_id -> unit -> searched_user
val make_searched_face : ?face_id:face_id -> unit -> searched_face

val make_search_users_response :
  ?user_matches:user_match_list ->
  ?face_model_version:string_ ->
  ?searched_face:searched_face ->
  ?searched_user:searched_user ->
  unit ->
  search_users_response

val make_search_users_request :
  ?user_id:user_id ->
  ?face_id:face_id ->
  ?user_match_threshold:percent ->
  ?max_users:max_user_results ->
  collection_id:collection_id ->
  unit ->
  search_users_request

val make_search_faces_by_image_response :
  ?searched_face_bounding_box:bounding_box ->
  ?searched_face_confidence:percent ->
  ?face_matches:face_match_list ->
  ?face_model_version:string_ ->
  unit ->
  search_faces_by_image_response

val make_search_faces_by_image_request :
  ?max_faces:max_faces ->
  ?face_match_threshold:percent ->
  ?quality_filter:quality_filter ->
  collection_id:collection_id ->
  image:image ->
  unit ->
  search_faces_by_image_request

val make_search_faces_response :
  ?searched_face_id:face_id ->
  ?face_matches:face_match_list ->
  ?face_model_version:string_ ->
  unit ->
  search_faces_response

val make_search_faces_request :
  ?max_faces:max_faces ->
  ?face_match_threshold:percent ->
  collection_id:collection_id ->
  face_id:face_id ->
  unit ->
  search_faces_request
