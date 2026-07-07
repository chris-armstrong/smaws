open Types

val make_video_metadata :
  ?color_range:video_color_range ->
  ?frame_width:u_long ->
  ?frame_height:u_long ->
  ?frame_rate:float_ ->
  ?format:string_ ->
  ?duration_millis:u_long ->
  ?codec:string_ ->
  unit ->
  video_metadata

val make_s3_object :
  ?version:s3_object_version -> ?name:s3_object_name -> ?bucket:s3_bucket -> unit -> s3_object

val make_video : ?s3_object:s3_object -> unit -> video
val make_versions : ?maximum:version -> ?minimum:version -> unit -> versions
val make_ground_truth_manifest : ?s3_object:s3_object -> unit -> ground_truth_manifest
val make_asset : ?ground_truth_manifest:ground_truth_manifest -> unit -> asset
val make_validation_data : ?assets:assets -> unit -> validation_data
val make_matched_user : ?user_status:user_status -> ?user_id:user_id -> unit -> matched_user
val make_user_match : ?user:matched_user -> ?similarity:percent -> unit -> user_match
val make_user : ?user_status:user_status -> ?user_id:user_id -> unit -> user
val make_update_stream_processor_response : unit -> unit

val make_connected_home_settings_for_update :
  ?min_confidence:percent ->
  ?labels:connected_home_labels ->
  unit ->
  connected_home_settings_for_update

val make_stream_processor_settings_for_update :
  ?connected_home_for_update:connected_home_settings_for_update ->
  unit ->
  stream_processor_settings_for_update

val make_bounding_box :
  ?top:float_ -> ?left:float_ -> ?height:float_ -> ?width:float_ -> unit -> bounding_box

val make_point : ?y:float_ -> ?x:float_ -> unit -> point

val make_region_of_interest :
  ?polygon:polygon -> ?bounding_box:bounding_box -> unit -> region_of_interest

val make_stream_processor_data_sharing_preference :
  opt_in:boolean_ -> unit -> stream_processor_data_sharing_preference

val make_update_stream_processor_request :
  ?parameters_to_delete:stream_processor_parameters_to_delete ->
  ?data_sharing_preference_for_update:stream_processor_data_sharing_preference ->
  ?regions_of_interest_for_update:regions_of_interest ->
  ?settings_for_update:stream_processor_settings_for_update ->
  name:stream_processor_name ->
  unit ->
  update_stream_processor_request

val make_update_dataset_entries_response : unit -> unit
val make_dataset_changes : ground_truth:ground_truth_blob -> unit -> dataset_changes

val make_update_dataset_entries_request :
  changes:dataset_changes -> dataset_arn:dataset_arn -> unit -> update_dataset_entries_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:resource_arn -> unit -> untag_resource_request

val make_unsuccessful_face_disassociation :
  ?reasons:unsuccessful_face_disassociation_reasons ->
  ?user_id:user_id ->
  ?face_id:face_id ->
  unit ->
  unsuccessful_face_disassociation

val make_unsuccessful_face_deletion :
  ?reasons:unsuccessful_face_deletion_reasons ->
  ?user_id:user_id ->
  ?face_id:face_id ->
  unit ->
  unsuccessful_face_deletion

val make_unsuccessful_face_association :
  ?reasons:unsuccessful_face_association_reasons ->
  ?confidence:percent ->
  ?user_id:user_id ->
  ?face_id:face_id ->
  unit ->
  unsuccessful_face_association

val make_age_range : ?high:u_integer -> ?low:u_integer -> unit -> age_range
val make_smile : ?confidence:percent -> ?value:boolean_ -> unit -> smile
val make_eyeglasses : ?confidence:percent -> ?value:boolean_ -> unit -> eyeglasses
val make_sunglasses : ?confidence:percent -> ?value:boolean_ -> unit -> sunglasses
val make_gender : ?confidence:percent -> ?value:gender_type -> unit -> gender
val make_beard : ?confidence:percent -> ?value:boolean_ -> unit -> beard
val make_mustache : ?confidence:percent -> ?value:boolean_ -> unit -> mustache
val make_eye_open : ?confidence:percent -> ?value:boolean_ -> unit -> eye_open
val make_mouth_open : ?confidence:percent -> ?value:boolean_ -> unit -> mouth_open
val make_emotion : ?confidence:percent -> ?type_:emotion_name -> unit -> emotion
val make_landmark : ?y:float_ -> ?x:float_ -> ?type_:landmark_type -> unit -> landmark
val make_pose : ?pitch:degree -> ?yaw:degree -> ?roll:degree -> unit -> pose
val make_image_quality : ?sharpness:float_ -> ?brightness:float_ -> unit -> image_quality
val make_face_occluded : ?confidence:percent -> ?value:boolean_ -> unit -> face_occluded

val make_eye_direction :
  ?confidence:percent -> ?pitch:degree -> ?yaw:degree -> unit -> eye_direction

val make_face_detail :
  ?eye_direction:eye_direction ->
  ?face_occluded:face_occluded ->
  ?confidence:percent ->
  ?quality:image_quality ->
  ?pose:pose ->
  ?landmarks:landmarks ->
  ?emotions:emotions ->
  ?mouth_open:mouth_open ->
  ?eyes_open:eye_open ->
  ?mustache:mustache ->
  ?beard:beard ->
  ?gender:gender ->
  ?sunglasses:sunglasses ->
  ?eyeglasses:eyeglasses ->
  ?smile:smile ->
  ?age_range:age_range ->
  ?bounding_box:bounding_box ->
  unit ->
  face_detail

val make_unsearched_face :
  ?reasons:unsearched_face_reasons -> ?face_details:face_detail -> unit -> unsearched_face

val make_unindexed_face : ?face_detail:face_detail -> ?reasons:reasons -> unit -> unindexed_face
val make_training_data : ?assets:assets -> unit -> training_data
val make_geometry : ?polygon:polygon -> ?bounding_box:bounding_box -> unit -> geometry

val make_text_detection :
  ?geometry:geometry ->
  ?confidence:percent ->
  ?parent_id:u_integer ->
  ?id:u_integer ->
  ?type_:text_types ->
  ?detected_text:string_ ->
  unit ->
  text_detection

val make_testing_data : ?auto_create:boolean_ -> ?assets:assets -> unit -> testing_data

val make_technical_cue_segment :
  ?confidence:segment_confidence -> ?type_:technical_cue_type -> unit -> technical_cue_segment

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_map -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_summary : ?s3_object:s3_object -> unit -> summary

val make_face_search_settings :
  ?face_match_threshold:percent -> ?collection_id:collection_id -> unit -> face_search_settings

val make_connected_home_settings :
  ?min_confidence:percent -> labels:connected_home_labels -> unit -> connected_home_settings

val make_stream_processor_settings :
  ?connected_home:connected_home_settings ->
  ?face_search:face_search_settings ->
  unit ->
  stream_processor_settings

val make_kinesis_data_stream : ?arn:kinesis_data_arn -> unit -> kinesis_data_stream
val make_s3_destination : ?key_prefix:s3_key_prefix -> ?bucket:s3_bucket -> unit -> s3_destination

val make_stream_processor_output :
  ?s3_destination:s3_destination ->
  ?kinesis_data_stream:kinesis_data_stream ->
  unit ->
  stream_processor_output

val make_stream_processor_notification_channel :
  sns_topic_arn:sns_topic_arn -> unit -> stream_processor_notification_channel

val make_stream_processor :
  ?status:stream_processor_status -> ?name:stream_processor_name -> unit -> stream_processor

val make_kinesis_video_stream : ?arn:kinesis_video_arn -> unit -> kinesis_video_stream

val make_stream_processor_input :
  ?kinesis_video_stream:kinesis_video_stream -> unit -> stream_processor_input

val make_stream_processing_stop_selector :
  ?max_duration_in_seconds:max_duration_in_seconds_u_long -> unit -> stream_processing_stop_selector

val make_kinesis_video_stream_start_selector :
  ?fragment_number:kinesis_video_stream_fragment_number ->
  ?producer_timestamp:u_long ->
  unit ->
  kinesis_video_stream_start_selector

val make_stream_processing_start_selector :
  ?kvs_stream_start_selector:kinesis_video_stream_start_selector ->
  unit ->
  stream_processing_start_selector

val make_stop_stream_processor_response : unit -> unit

val make_stop_stream_processor_request :
  name:stream_processor_name -> unit -> stop_stream_processor_request

val make_stop_project_version_response :
  ?status:project_version_status -> unit -> stop_project_version_response

val make_stop_project_version_request :
  project_version_arn:project_version_arn -> unit -> stop_project_version_request

val make_start_text_detection_response : ?job_id:job_id -> unit -> start_text_detection_response

val make_notification_channel :
  role_arn:role_arn -> sns_topic_arn:sns_topic_arn -> unit -> notification_channel

val make_detection_filter :
  ?min_bounding_box_width:bounding_box_width ->
  ?min_bounding_box_height:bounding_box_height ->
  ?min_confidence:percent ->
  unit ->
  detection_filter

val make_start_text_detection_filters :
  ?regions_of_interest:regions_of_interest ->
  ?word_filter:detection_filter ->
  unit ->
  start_text_detection_filters

val make_start_text_detection_request :
  ?filters:start_text_detection_filters ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?client_request_token:client_request_token ->
  video:video ->
  unit ->
  start_text_detection_request

val make_black_frame :
  ?min_coverage_percentage:min_coverage_percentage ->
  ?max_pixel_threshold:max_pixel_threshold ->
  unit ->
  black_frame

val make_start_technical_cue_detection_filter :
  ?black_frame:black_frame ->
  ?min_segment_confidence:segment_confidence ->
  unit ->
  start_technical_cue_detection_filter

val make_start_stream_processor_response :
  ?session_id:start_stream_processor_session_id -> unit -> start_stream_processor_response

val make_start_stream_processor_request :
  ?stop_selector:stream_processing_stop_selector ->
  ?start_selector:stream_processing_start_selector ->
  name:stream_processor_name ->
  unit ->
  start_stream_processor_request

val make_start_shot_detection_filter :
  ?min_segment_confidence:segment_confidence -> unit -> start_shot_detection_filter

val make_start_segment_detection_response :
  ?job_id:job_id -> unit -> start_segment_detection_response

val make_start_segment_detection_filters :
  ?shot_filter:start_shot_detection_filter ->
  ?technical_cue_filter:start_technical_cue_detection_filter ->
  unit ->
  start_segment_detection_filters

val make_start_segment_detection_request :
  ?filters:start_segment_detection_filters ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?client_request_token:client_request_token ->
  segment_types:segment_types ->
  video:video ->
  unit ->
  start_segment_detection_request

val make_start_project_version_response :
  ?status:project_version_status -> unit -> start_project_version_response

val make_start_project_version_request :
  ?max_inference_units:inference_units ->
  min_inference_units:inference_units ->
  project_version_arn:project_version_arn ->
  unit ->
  start_project_version_request

val make_start_person_tracking_response : ?job_id:job_id -> unit -> start_person_tracking_response

val make_start_person_tracking_request :
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?client_request_token:client_request_token ->
  video:video ->
  unit ->
  start_person_tracking_request

val make_start_media_analysis_job_response :
  job_id:media_analysis_job_id -> unit -> start_media_analysis_job_response

val make_media_analysis_detect_moderation_labels_config :
  ?project_version:project_version_id ->
  ?min_confidence:percent ->
  unit ->
  media_analysis_detect_moderation_labels_config

val make_media_analysis_operations_config :
  ?detect_moderation_labels:media_analysis_detect_moderation_labels_config ->
  unit ->
  media_analysis_operations_config

val make_media_analysis_input : s3_object:s3_object -> unit -> media_analysis_input

val make_media_analysis_output_config :
  ?s3_key_prefix:media_analysis_s3_key_prefix ->
  s3_bucket:s3_bucket ->
  unit ->
  media_analysis_output_config

val make_start_media_analysis_job_request :
  ?kms_key_id:kms_key_id ->
  ?job_name:media_analysis_job_name ->
  ?client_request_token:client_request_token ->
  output_config:media_analysis_output_config ->
  input:media_analysis_input ->
  operations_config:media_analysis_operations_config ->
  unit ->
  start_media_analysis_job_request

val make_start_label_detection_response : ?job_id:job_id -> unit -> start_label_detection_response

val make_general_labels_settings :
  ?label_category_exclusion_filters:general_labels_filter_list ->
  ?label_category_inclusion_filters:general_labels_filter_list ->
  ?label_exclusion_filters:general_labels_filter_list ->
  ?label_inclusion_filters:general_labels_filter_list ->
  unit ->
  general_labels_settings

val make_label_detection_settings :
  ?general_labels:general_labels_settings -> unit -> label_detection_settings

val make_start_label_detection_request :
  ?settings:label_detection_settings ->
  ?features:label_detection_feature_list ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?min_confidence:percent ->
  ?client_request_token:client_request_token ->
  video:video ->
  unit ->
  start_label_detection_request

val make_start_face_search_response : ?job_id:job_id -> unit -> start_face_search_response

val make_start_face_search_request :
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?face_match_threshold:percent ->
  ?client_request_token:client_request_token ->
  collection_id:collection_id ->
  video:video ->
  unit ->
  start_face_search_request

val make_start_face_detection_response : ?job_id:job_id -> unit -> start_face_detection_response

val make_start_face_detection_request :
  ?job_tag:job_tag ->
  ?face_attributes:face_attributes ->
  ?notification_channel:notification_channel ->
  ?client_request_token:client_request_token ->
  video:video ->
  unit ->
  start_face_detection_request

val make_start_content_moderation_response :
  ?job_id:job_id -> unit -> start_content_moderation_response

val make_start_content_moderation_request :
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?client_request_token:client_request_token ->
  ?min_confidence:percent ->
  video:video ->
  unit ->
  start_content_moderation_request

val make_start_celebrity_recognition_response :
  ?job_id:job_id -> unit -> start_celebrity_recognition_response

val make_start_celebrity_recognition_request :
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?client_request_token:client_request_token ->
  video:video ->
  unit ->
  start_celebrity_recognition_request

val make_shot_segment : ?confidence:segment_confidence -> ?index:u_long -> unit -> shot_segment

val make_segment_type_info :
  ?model_version:string_ -> ?type_:segment_type -> unit -> segment_type_info

val make_segment_detection :
  ?duration_frames:u_long ->
  ?end_frame_number:u_long ->
  ?start_frame_number:u_long ->
  ?shot_segment:shot_segment ->
  ?technical_cue_segment:technical_cue_segment ->
  ?duration_smpt_e:timecode ->
  ?end_timecode_smpt_e:timecode ->
  ?start_timecode_smpt_e:timecode ->
  ?duration_millis:u_long ->
  ?end_timestamp_millis:timestamp ->
  ?start_timestamp_millis:timestamp ->
  ?type_:segment_type ->
  unit ->
  segment_detection

val make_searched_user : ?user_id:user_id -> unit -> searched_user
val make_searched_face_details : ?face_detail:face_detail -> unit -> searched_face_details
val make_searched_face : ?face_id:face_id -> unit -> searched_face

val make_search_users_response :
  ?searched_user:searched_user ->
  ?searched_face:searched_face ->
  ?face_model_version:string_ ->
  ?user_matches:user_match_list ->
  unit ->
  search_users_response

val make_search_users_request :
  ?max_users:max_user_results ->
  ?user_match_threshold:percent ->
  ?face_id:face_id ->
  ?user_id:user_id ->
  collection_id:collection_id ->
  unit ->
  search_users_request

val make_search_users_by_image_response :
  ?unsearched_faces:unsearched_faces_list ->
  ?searched_face:searched_face_details ->
  ?face_model_version:string_ ->
  ?user_matches:user_match_list ->
  unit ->
  search_users_by_image_response

val make_image : ?s3_object:s3_object -> ?bytes:image_blob -> unit -> image

val make_search_users_by_image_request :
  ?quality_filter:quality_filter ->
  ?max_users:max_user_results ->
  ?user_match_threshold:percent ->
  image:image ->
  collection_id:collection_id ->
  unit ->
  search_users_by_image_request

val make_face :
  ?user_id:user_id ->
  ?index_faces_model_version:index_faces_model_version ->
  ?confidence:percent ->
  ?external_image_id:external_image_id ->
  ?image_id:image_id ->
  ?bounding_box:bounding_box ->
  ?face_id:face_id ->
  unit ->
  face

val make_face_match : ?face:face -> ?similarity:percent -> unit -> face_match

val make_search_faces_response :
  ?face_model_version:string_ ->
  ?face_matches:face_match_list ->
  ?searched_face_id:face_id ->
  unit ->
  search_faces_response

val make_search_faces_request :
  ?face_match_threshold:percent ->
  ?max_faces:max_faces ->
  face_id:face_id ->
  collection_id:collection_id ->
  unit ->
  search_faces_request

val make_search_faces_by_image_response :
  ?face_model_version:string_ ->
  ?face_matches:face_match_list ->
  ?searched_face_confidence:percent ->
  ?searched_face_bounding_box:bounding_box ->
  unit ->
  search_faces_by_image_response

val make_search_faces_by_image_request :
  ?quality_filter:quality_filter ->
  ?face_match_threshold:percent ->
  ?max_faces:max_faces ->
  image:image ->
  collection_id:collection_id ->
  unit ->
  search_faces_by_image_request

val make_compared_face :
  ?smile:smile ->
  ?emotions:emotions ->
  ?quality:image_quality ->
  ?pose:pose ->
  ?landmarks:landmarks ->
  ?confidence:percent ->
  ?bounding_box:bounding_box ->
  unit ->
  compared_face

val make_known_gender : ?type_:known_gender_type -> unit -> known_gender

val make_celebrity :
  ?known_gender:known_gender ->
  ?match_confidence:percent ->
  ?face:compared_face ->
  ?id:rekognition_unique_id ->
  ?name:string_ ->
  ?urls:urls ->
  unit ->
  celebrity

val make_recognize_celebrities_response :
  ?orientation_correction:orientation_correction ->
  ?unrecognized_faces:compared_face_list ->
  ?celebrity_faces:celebrity_list ->
  unit ->
  recognize_celebrities_response

val make_recognize_celebrities_request : image:image -> unit -> recognize_celebrities_request

val make_put_project_policy_response :
  ?policy_revision_id:project_policy_revision_id -> unit -> put_project_policy_response

val make_put_project_policy_request :
  ?policy_revision_id:project_policy_revision_id ->
  policy_document:project_policy_document ->
  policy_name:project_policy_name ->
  project_arn:project_arn ->
  unit ->
  put_project_policy_request

val make_list_users_response :
  ?next_token:pagination_token -> ?users:user_list -> unit -> list_users_response

val make_list_users_request :
  ?next_token:pagination_token ->
  ?max_results:max_user_results ->
  collection_id:collection_id ->
  unit ->
  list_users_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_stream_processors_response :
  ?stream_processors:stream_processor_list ->
  ?next_token:pagination_token ->
  unit ->
  list_stream_processors_response

val make_list_stream_processors_request :
  ?max_results:max_results -> ?next_token:pagination_token -> unit -> list_stream_processors_request

val make_project_policy :
  ?last_updated_timestamp:date_time ->
  ?creation_timestamp:date_time ->
  ?policy_document:project_policy_document ->
  ?policy_revision_id:project_policy_revision_id ->
  ?policy_name:project_policy_name ->
  ?project_arn:project_arn ->
  unit ->
  project_policy

val make_list_project_policies_response :
  ?next_token:extended_pagination_token ->
  ?project_policies:project_policies ->
  unit ->
  list_project_policies_response

val make_list_project_policies_request :
  ?max_results:list_project_policies_page_size ->
  ?next_token:extended_pagination_token ->
  project_arn:project_arn ->
  unit ->
  list_project_policies_request

val make_media_analysis_job_failure_details :
  ?message:string_ ->
  ?code:media_analysis_job_failure_code ->
  unit ->
  media_analysis_job_failure_details

val make_media_analysis_model_versions :
  ?moderation:string_ -> unit -> media_analysis_model_versions

val make_media_analysis_results :
  ?model_versions:media_analysis_model_versions ->
  ?s3_object:s3_object ->
  unit ->
  media_analysis_results

val make_media_analysis_manifest_summary :
  ?s3_object:s3_object -> unit -> media_analysis_manifest_summary

val make_media_analysis_job_description :
  ?manifest_summary:media_analysis_manifest_summary ->
  ?results:media_analysis_results ->
  ?kms_key_id:kms_key_id ->
  ?completion_timestamp:date_time ->
  ?failure_details:media_analysis_job_failure_details ->
  ?job_name:media_analysis_job_name ->
  output_config:media_analysis_output_config ->
  input:media_analysis_input ->
  creation_timestamp:date_time ->
  status:media_analysis_job_status ->
  operations_config:media_analysis_operations_config ->
  job_id:media_analysis_job_id ->
  unit ->
  media_analysis_job_description

val make_list_media_analysis_jobs_response :
  ?next_token:extended_pagination_token ->
  media_analysis_jobs:media_analysis_job_descriptions ->
  unit ->
  list_media_analysis_jobs_response

val make_list_media_analysis_jobs_request :
  ?max_results:list_media_analysis_jobs_page_size ->
  ?next_token:extended_pagination_token ->
  unit ->
  list_media_analysis_jobs_request

val make_list_faces_response :
  ?face_model_version:string_ ->
  ?next_token:string_ ->
  ?faces:face_list ->
  unit ->
  list_faces_response

val make_list_faces_request :
  ?face_ids:face_id_list ->
  ?user_id:user_id ->
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  collection_id:collection_id ->
  unit ->
  list_faces_request

val make_dataset_label_stats :
  ?bounding_box_count:u_integer -> ?entry_count:u_integer -> unit -> dataset_label_stats

val make_dataset_label_description :
  ?label_stats:dataset_label_stats -> ?label_name:dataset_label -> unit -> dataset_label_description

val make_list_dataset_labels_response :
  ?next_token:extended_pagination_token ->
  ?dataset_label_descriptions:dataset_label_descriptions ->
  unit ->
  list_dataset_labels_response

val make_list_dataset_labels_request :
  ?max_results:list_dataset_labels_page_size ->
  ?next_token:extended_pagination_token ->
  dataset_arn:dataset_arn ->
  unit ->
  list_dataset_labels_request

val make_list_dataset_entries_response :
  ?next_token:extended_pagination_token ->
  ?dataset_entries:dataset_entries ->
  unit ->
  list_dataset_entries_response

val make_list_dataset_entries_request :
  ?max_results:list_dataset_entries_page_size ->
  ?next_token:extended_pagination_token ->
  ?has_errors:has_errors ->
  ?source_ref_contains:query_string ->
  ?labeled:is_labeled ->
  ?contains_labels:dataset_labels ->
  dataset_arn:dataset_arn ->
  unit ->
  list_dataset_entries_request

val make_list_collections_response :
  ?face_model_versions:face_model_version_list ->
  ?next_token:pagination_token ->
  ?collection_ids:collection_id_list ->
  unit ->
  list_collections_response

val make_list_collections_request :
  ?max_results:page_size -> ?next_token:pagination_token -> unit -> list_collections_request

val make_face_record : ?face_detail:face_detail -> ?face:face -> unit -> face_record

val make_index_faces_response :
  ?unindexed_faces:unindexed_faces ->
  ?face_model_version:string_ ->
  ?orientation_correction:orientation_correction ->
  ?face_records:face_record_list ->
  unit ->
  index_faces_response

val make_index_faces_request :
  ?quality_filter:quality_filter ->
  ?max_faces:max_faces_to_index ->
  ?detection_attributes:attributes ->
  ?external_image_id:external_image_id ->
  image:image ->
  collection_id:collection_id ->
  unit ->
  index_faces_request

val make_get_text_detection_response :
  ?job_tag:job_tag ->
  ?video:video ->
  ?job_id:job_id ->
  ?text_model_version:string_ ->
  ?next_token:pagination_token ->
  ?text_detections:text_detection_results ->
  ?video_metadata:video_metadata ->
  ?status_message:status_message ->
  ?job_status:video_job_status ->
  unit ->
  get_text_detection_response

val make_get_text_detection_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_text_detection_request

val make_audio_metadata :
  ?number_of_channels:u_long ->
  ?sample_rate:u_long ->
  ?duration_millis:u_long ->
  ?codec:string_ ->
  unit ->
  audio_metadata

val make_get_segment_detection_response :
  ?job_tag:job_tag ->
  ?video:video ->
  ?job_id:job_id ->
  ?selected_segment_types:segment_types_info ->
  ?segments:segment_detections ->
  ?next_token:pagination_token ->
  ?audio_metadata:audio_metadata_list ->
  ?video_metadata:video_metadata_list ->
  ?status_message:status_message ->
  ?job_status:video_job_status ->
  unit ->
  get_segment_detection_response

val make_get_segment_detection_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_segment_detection_request

val make_person_detail :
  ?face:face_detail -> ?bounding_box:bounding_box -> ?index:person_index -> unit -> person_detail

val make_person_detection :
  ?person:person_detail -> ?timestamp:timestamp -> unit -> person_detection

val make_get_person_tracking_response :
  ?job_tag:job_tag ->
  ?video:video ->
  ?job_id:job_id ->
  ?persons:person_detections ->
  ?next_token:pagination_token ->
  ?video_metadata:video_metadata ->
  ?status_message:status_message ->
  ?job_status:video_job_status ->
  unit ->
  get_person_tracking_response

val make_get_person_tracking_request :
  ?sort_by:person_tracking_sort_by ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_person_tracking_request

val make_get_media_analysis_job_response :
  ?manifest_summary:media_analysis_manifest_summary ->
  ?results:media_analysis_results ->
  ?kms_key_id:kms_key_id ->
  ?completion_timestamp:date_time ->
  ?failure_details:media_analysis_job_failure_details ->
  ?job_name:media_analysis_job_name ->
  output_config:media_analysis_output_config ->
  input:media_analysis_input ->
  creation_timestamp:date_time ->
  status:media_analysis_job_status ->
  operations_config:media_analysis_operations_config ->
  job_id:media_analysis_job_id ->
  unit ->
  get_media_analysis_job_response

val make_get_media_analysis_job_request :
  job_id:media_analysis_job_id -> unit -> get_media_analysis_job_request

val make_dominant_color :
  ?pixel_percent:percent ->
  ?simplified_color:string_ ->
  ?css_color:string_ ->
  ?hex_code:string_ ->
  ?green:u_integer ->
  ?blue:u_integer ->
  ?red:u_integer ->
  unit ->
  dominant_color

val make_instance :
  ?dominant_colors:dominant_colors ->
  ?confidence:percent ->
  ?bounding_box:bounding_box ->
  unit ->
  instance

val make_parent : ?name:string_ -> unit -> parent
val make_label_alias : ?name:string_ -> unit -> label_alias
val make_label_category : ?name:string_ -> unit -> label_category

val make_label :
  ?categories:label_categories ->
  ?aliases:label_aliases ->
  ?parents:parents ->
  ?instances:instances ->
  ?confidence:percent ->
  ?name:string_ ->
  unit ->
  label

val make_label_detection :
  ?duration_millis:u_long ->
  ?end_timestamp_millis:u_long ->
  ?start_timestamp_millis:u_long ->
  ?label:label ->
  ?timestamp:timestamp ->
  unit ->
  label_detection

val make_get_label_detection_request_metadata :
  ?aggregate_by:label_detection_aggregate_by ->
  ?sort_by:label_detection_sort_by ->
  unit ->
  get_label_detection_request_metadata

val make_get_label_detection_response :
  ?get_request_metadata:get_label_detection_request_metadata ->
  ?job_tag:job_tag ->
  ?video:video ->
  ?job_id:job_id ->
  ?label_model_version:string_ ->
  ?labels:label_detections ->
  ?next_token:pagination_token ->
  ?video_metadata:video_metadata ->
  ?status_message:status_message ->
  ?job_status:video_job_status ->
  unit ->
  get_label_detection_response

val make_get_label_detection_request :
  ?aggregate_by:label_detection_aggregate_by ->
  ?sort_by:label_detection_sort_by ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_label_detection_request

val make_person_match :
  ?face_matches:face_match_list ->
  ?person:person_detail ->
  ?timestamp:timestamp ->
  unit ->
  person_match

val make_get_face_search_response :
  ?job_tag:job_tag ->
  ?video:video ->
  ?job_id:job_id ->
  ?persons:person_matches ->
  ?video_metadata:video_metadata ->
  ?next_token:pagination_token ->
  ?status_message:status_message ->
  ?job_status:video_job_status ->
  unit ->
  get_face_search_response

val make_get_face_search_request :
  ?sort_by:face_search_sort_by ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_face_search_request

val make_audit_image :
  ?bounding_box:bounding_box ->
  ?s3_object:s3_object ->
  ?bytes:liveness_image_blob ->
  unit ->
  audit_image

val make_challenge : version:version -> type_:challenge_type -> unit -> challenge

val make_get_face_liveness_session_results_response :
  ?challenge:challenge ->
  ?audit_images:audit_images ->
  ?reference_image:audit_image ->
  ?confidence:percent ->
  status:liveness_session_status ->
  session_id:liveness_session_id ->
  unit ->
  get_face_liveness_session_results_response

val make_get_face_liveness_session_results_request :
  session_id:liveness_session_id -> unit -> get_face_liveness_session_results_request

val make_face_detection : ?face:face_detail -> ?timestamp:timestamp -> unit -> face_detection

val make_get_face_detection_response :
  ?job_tag:job_tag ->
  ?video:video ->
  ?job_id:job_id ->
  ?faces:face_detections ->
  ?next_token:pagination_token ->
  ?video_metadata:video_metadata ->
  ?status_message:status_message ->
  ?job_status:video_job_status ->
  unit ->
  get_face_detection_response

val make_get_face_detection_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_face_detection_request

val make_moderation_label :
  ?taxonomy_level:u_integer ->
  ?parent_name:string_ ->
  ?name:string_ ->
  ?confidence:percent ->
  unit ->
  moderation_label

val make_content_type : ?name:string_ -> ?confidence:percent -> unit -> content_type

val make_content_moderation_detection :
  ?content_types:content_types ->
  ?duration_millis:u_long ->
  ?end_timestamp_millis:u_long ->
  ?start_timestamp_millis:u_long ->
  ?moderation_label:moderation_label ->
  ?timestamp:timestamp ->
  unit ->
  content_moderation_detection

val make_get_content_moderation_request_metadata :
  ?aggregate_by:content_moderation_aggregate_by ->
  ?sort_by:content_moderation_sort_by ->
  unit ->
  get_content_moderation_request_metadata

val make_get_content_moderation_response :
  ?get_request_metadata:get_content_moderation_request_metadata ->
  ?job_tag:job_tag ->
  ?video:video ->
  ?job_id:job_id ->
  ?moderation_model_version:string_ ->
  ?next_token:pagination_token ->
  ?moderation_labels:content_moderation_detections ->
  ?video_metadata:video_metadata ->
  ?status_message:status_message ->
  ?job_status:video_job_status ->
  unit ->
  get_content_moderation_response

val make_get_content_moderation_request :
  ?aggregate_by:content_moderation_aggregate_by ->
  ?sort_by:content_moderation_sort_by ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_content_moderation_request

val make_celebrity_detail :
  ?known_gender:known_gender ->
  ?face:face_detail ->
  ?bounding_box:bounding_box ->
  ?confidence:percent ->
  ?id:rekognition_unique_id ->
  ?name:string_ ->
  ?urls:urls ->
  unit ->
  celebrity_detail

val make_celebrity_recognition :
  ?celebrity:celebrity_detail -> ?timestamp:timestamp -> unit -> celebrity_recognition

val make_get_celebrity_recognition_response :
  ?job_tag:job_tag ->
  ?video:video ->
  ?job_id:job_id ->
  ?celebrities:celebrity_recognitions ->
  ?next_token:pagination_token ->
  ?video_metadata:video_metadata ->
  ?status_message:status_message ->
  ?job_status:video_job_status ->
  unit ->
  get_celebrity_recognition_response

val make_get_celebrity_recognition_request :
  ?sort_by:celebrity_recognition_sort_by ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_celebrity_recognition_request

val make_get_celebrity_info_response :
  ?known_gender:known_gender -> ?name:string_ -> ?urls:urls -> unit -> get_celebrity_info_response

val make_get_celebrity_info_request : id:rekognition_unique_id -> unit -> get_celebrity_info_request
val make_distribute_dataset_entries_response : unit -> unit
val make_distribute_dataset : arn:dataset_arn -> unit -> distribute_dataset

val make_distribute_dataset_entries_request :
  datasets:distribute_dataset_metadata_list -> unit -> distribute_dataset_entries_request

val make_disassociated_face : ?face_id:face_id -> unit -> disassociated_face

val make_disassociate_faces_response :
  ?user_status:user_status ->
  ?unsuccessful_face_disassociations:unsuccessful_face_disassociation_list ->
  ?disassociated_faces:disassociated_faces_list ->
  unit ->
  disassociate_faces_response

val make_disassociate_faces_request :
  ?client_request_token:client_request_token ->
  face_ids:user_face_id_list ->
  user_id:user_id ->
  collection_id:collection_id ->
  unit ->
  disassociate_faces_request

val make_detect_text_response :
  ?text_model_version:string_ ->
  ?text_detections:text_detection_list ->
  unit ->
  detect_text_response

val make_detect_text_filters :
  ?regions_of_interest:regions_of_interest ->
  ?word_filter:detection_filter ->
  unit ->
  detect_text_filters

val make_detect_text_request :
  ?filters:detect_text_filters -> image:image -> unit -> detect_text_request

val make_covers_body_part : ?value:boolean_ -> ?confidence:percent -> unit -> covers_body_part

val make_equipment_detection :
  ?covers_body_part:covers_body_part ->
  ?type_:protective_equipment_type ->
  ?confidence:percent ->
  ?bounding_box:bounding_box ->
  unit ->
  equipment_detection

val make_protective_equipment_body_part :
  ?equipment_detections:equipment_detections ->
  ?confidence:percent ->
  ?name:body_part ->
  unit ->
  protective_equipment_body_part

val make_protective_equipment_person :
  ?id:u_integer ->
  ?confidence:percent ->
  ?bounding_box:bounding_box ->
  ?body_parts:body_parts ->
  unit ->
  protective_equipment_person

val make_protective_equipment_summary :
  ?persons_indeterminate:protective_equipment_person_ids ->
  ?persons_without_required_equipment:protective_equipment_person_ids ->
  ?persons_with_required_equipment:protective_equipment_person_ids ->
  unit ->
  protective_equipment_summary

val make_detect_protective_equipment_response :
  ?summary:protective_equipment_summary ->
  ?persons:protective_equipment_persons ->
  ?protective_equipment_model_version:string_ ->
  unit ->
  detect_protective_equipment_response

val make_protective_equipment_summarization_attributes :
  required_equipment_types:protective_equipment_types ->
  min_confidence:percent ->
  unit ->
  protective_equipment_summarization_attributes

val make_detect_protective_equipment_request :
  ?summarization_attributes:protective_equipment_summarization_attributes ->
  image:image ->
  unit ->
  detect_protective_equipment_request

val make_human_loop_activation_output :
  ?human_loop_activation_conditions_evaluation_results:
    synthesized_json_human_loop_activation_conditions_evaluation_results ->
  ?human_loop_activation_reasons:human_loop_activation_reasons ->
  ?human_loop_arn:human_loop_arn ->
  unit ->
  human_loop_activation_output

val make_detect_moderation_labels_response :
  ?content_types:content_types ->
  ?project_version:project_version_id ->
  ?human_loop_activation_output:human_loop_activation_output ->
  ?moderation_model_version:string_ ->
  ?moderation_labels:moderation_labels ->
  unit ->
  detect_moderation_labels_response

val make_human_loop_data_attributes :
  ?content_classifiers:content_classifiers -> unit -> human_loop_data_attributes

val make_human_loop_config :
  ?data_attributes:human_loop_data_attributes ->
  flow_definition_arn:flow_definition_arn ->
  human_loop_name:human_loop_name ->
  unit ->
  human_loop_config

val make_detect_moderation_labels_request :
  ?project_version:project_version_id ->
  ?human_loop_config:human_loop_config ->
  ?min_confidence:percent ->
  image:image ->
  unit ->
  detect_moderation_labels_request

val make_detect_labels_image_quality :
  ?contrast:float_ -> ?sharpness:float_ -> ?brightness:float_ -> unit -> detect_labels_image_quality

val make_detect_labels_image_foreground :
  ?dominant_colors:dominant_colors ->
  ?quality:detect_labels_image_quality ->
  unit ->
  detect_labels_image_foreground

val make_detect_labels_image_background :
  ?dominant_colors:dominant_colors ->
  ?quality:detect_labels_image_quality ->
  unit ->
  detect_labels_image_background

val make_detect_labels_image_properties :
  ?background:detect_labels_image_background ->
  ?foreground:detect_labels_image_foreground ->
  ?dominant_colors:dominant_colors ->
  ?quality:detect_labels_image_quality ->
  unit ->
  detect_labels_image_properties

val make_detect_labels_response :
  ?image_properties:detect_labels_image_properties ->
  ?label_model_version:string_ ->
  ?orientation_correction:orientation_correction ->
  ?labels:labels ->
  unit ->
  detect_labels_response

val make_detect_labels_image_properties_settings :
  ?max_dominant_colors:detect_labels_max_dominant_colors ->
  unit ->
  detect_labels_image_properties_settings

val make_detect_labels_settings :
  ?image_properties:detect_labels_image_properties_settings ->
  ?general_labels:general_labels_settings ->
  unit ->
  detect_labels_settings

val make_detect_labels_request :
  ?settings:detect_labels_settings ->
  ?features:detect_labels_feature_list ->
  ?min_confidence:percent ->
  ?max_labels:u_integer ->
  image:image ->
  unit ->
  detect_labels_request

val make_detect_faces_response :
  ?orientation_correction:orientation_correction ->
  ?face_details:face_detail_list ->
  unit ->
  detect_faces_response

val make_detect_faces_request :
  ?attributes:attributes -> image:image -> unit -> detect_faces_request

val make_custom_label :
  ?geometry:geometry -> ?confidence:percent -> ?name:string_ -> unit -> custom_label

val make_detect_custom_labels_response :
  ?custom_labels:custom_labels -> unit -> detect_custom_labels_response

val make_detect_custom_labels_request :
  ?min_confidence:percent ->
  ?max_results:u_integer ->
  image:image ->
  project_version_arn:project_version_arn ->
  unit ->
  detect_custom_labels_request

val make_describe_stream_processor_response :
  ?data_sharing_preference:stream_processor_data_sharing_preference ->
  ?regions_of_interest:regions_of_interest ->
  ?kms_key_id:kms_key_id ->
  ?notification_channel:stream_processor_notification_channel ->
  ?settings:stream_processor_settings ->
  ?role_arn:role_arn ->
  ?output:stream_processor_output ->
  ?input:stream_processor_input ->
  ?last_update_timestamp:date_time ->
  ?creation_timestamp:date_time ->
  ?status_message:string_ ->
  ?status:stream_processor_status ->
  ?stream_processor_arn:stream_processor_arn ->
  ?name:stream_processor_name ->
  unit ->
  describe_stream_processor_response

val make_describe_stream_processor_request :
  name:stream_processor_name -> unit -> describe_stream_processor_request

val make_output_config :
  ?s3_key_prefix:s3_key_prefix -> ?s3_bucket:s3_bucket -> unit -> output_config

val make_customization_feature_content_moderation_config :
  ?confidence_threshold:percent -> unit -> customization_feature_content_moderation_config

val make_customization_feature_config :
  ?content_moderation:customization_feature_content_moderation_config ->
  unit ->
  customization_feature_config

val make_project_version_description :
  ?feature_config:customization_feature_config ->
  ?base_model_version:string_ ->
  ?feature:customization_feature ->
  ?version_description:version_description ->
  ?source_project_version_arn:project_version_arn ->
  ?max_inference_units:inference_units ->
  ?kms_key_id:kms_key_id ->
  ?manifest_summary:ground_truth_manifest ->
  ?evaluation_result:evaluation_result ->
  ?testing_data_result:testing_data_result ->
  ?training_data_result:training_data_result ->
  ?output_config:output_config ->
  ?training_end_timestamp:date_time ->
  ?billable_training_time_in_seconds:u_long ->
  ?status_message:status_message ->
  ?status:project_version_status ->
  ?min_inference_units:inference_units ->
  ?creation_timestamp:date_time ->
  ?project_version_arn:project_version_arn ->
  unit ->
  project_version_description

val make_describe_project_versions_response :
  ?next_token:extended_pagination_token ->
  ?project_version_descriptions:project_version_descriptions ->
  unit ->
  describe_project_versions_response

val make_describe_project_versions_request :
  ?max_results:project_versions_page_size ->
  ?next_token:extended_pagination_token ->
  ?version_names:version_names ->
  project_arn:project_arn ->
  unit ->
  describe_project_versions_request

val make_dataset_metadata :
  ?status_message_code:dataset_status_message_code ->
  ?status_message:status_message ->
  ?status:dataset_status ->
  ?dataset_arn:dataset_arn ->
  ?dataset_type:dataset_type ->
  ?creation_timestamp:date_time ->
  unit ->
  dataset_metadata

val make_project_description :
  ?auto_update:project_auto_update ->
  ?feature:customization_feature ->
  ?datasets:dataset_metadata_list ->
  ?status:project_status ->
  ?creation_timestamp:date_time ->
  ?project_arn:project_arn ->
  unit ->
  project_description

val make_describe_projects_response :
  ?next_token:extended_pagination_token ->
  ?project_descriptions:project_descriptions ->
  unit ->
  describe_projects_response

val make_describe_projects_request :
  ?features:customization_features ->
  ?project_names:project_names ->
  ?max_results:projects_page_size ->
  ?next_token:extended_pagination_token ->
  unit ->
  describe_projects_request

val make_dataset_stats :
  ?error_entries:u_integer ->
  ?total_labels:u_integer ->
  ?total_entries:u_integer ->
  ?labeled_entries:u_integer ->
  unit ->
  dataset_stats

val make_dataset_description :
  ?dataset_stats:dataset_stats ->
  ?status_message_code:dataset_status_message_code ->
  ?status_message:status_message ->
  ?status:dataset_status ->
  ?last_updated_timestamp:date_time ->
  ?creation_timestamp:date_time ->
  unit ->
  dataset_description

val make_describe_dataset_response :
  ?dataset_description:dataset_description -> unit -> describe_dataset_response

val make_describe_dataset_request : dataset_arn:dataset_arn -> unit -> describe_dataset_request

val make_describe_collection_response :
  ?user_count:u_long ->
  ?creation_timestamp:date_time ->
  ?collection_ar_n:string_ ->
  ?face_model_version:string_ ->
  ?face_count:u_long ->
  unit ->
  describe_collection_response

val make_describe_collection_request :
  collection_id:collection_id -> unit -> describe_collection_request

val make_delete_user_response : unit -> unit

val make_delete_user_request :
  ?client_request_token:client_request_token ->
  user_id:user_id ->
  collection_id:collection_id ->
  unit ->
  delete_user_request

val make_delete_stream_processor_response : unit -> unit

val make_delete_stream_processor_request :
  name:stream_processor_name -> unit -> delete_stream_processor_request

val make_delete_project_version_response :
  ?status:project_version_status -> unit -> delete_project_version_response

val make_delete_project_version_request :
  project_version_arn:project_version_arn -> unit -> delete_project_version_request

val make_delete_project_policy_response : unit -> unit

val make_delete_project_policy_request :
  ?policy_revision_id:project_policy_revision_id ->
  policy_name:project_policy_name ->
  project_arn:project_arn ->
  unit ->
  delete_project_policy_request

val make_delete_project_response : ?status:project_status -> unit -> delete_project_response
val make_delete_project_request : project_arn:project_arn -> unit -> delete_project_request

val make_delete_faces_response :
  ?unsuccessful_face_deletions:unsuccessful_face_deletions_list ->
  ?deleted_faces:face_id_list ->
  unit ->
  delete_faces_response

val make_delete_faces_request :
  face_ids:face_id_list -> collection_id:collection_id -> unit -> delete_faces_request

val make_delete_dataset_response : unit -> unit
val make_delete_dataset_request : dataset_arn:dataset_arn -> unit -> delete_dataset_request
val make_delete_collection_response : ?status_code:u_integer -> unit -> delete_collection_response

val make_delete_collection_request :
  collection_id:collection_id -> unit -> delete_collection_request

val make_create_user_response : unit -> unit

val make_create_user_request :
  ?client_request_token:client_request_token ->
  user_id:user_id ->
  collection_id:collection_id ->
  unit ->
  create_user_request

val make_create_stream_processor_response :
  ?stream_processor_arn:stream_processor_arn -> unit -> create_stream_processor_response

val make_create_stream_processor_request :
  ?data_sharing_preference:stream_processor_data_sharing_preference ->
  ?regions_of_interest:regions_of_interest ->
  ?kms_key_id:kms_key_id ->
  ?notification_channel:stream_processor_notification_channel ->
  ?tags:tag_map ->
  role_arn:role_arn ->
  settings:stream_processor_settings ->
  name:stream_processor_name ->
  output:stream_processor_output ->
  input:stream_processor_input ->
  unit ->
  create_stream_processor_request

val make_create_project_version_response :
  ?project_version_arn:project_version_arn -> unit -> create_project_version_response

val make_create_project_version_request :
  ?feature_config:customization_feature_config ->
  ?version_description:version_description ->
  ?kms_key_id:kms_key_id ->
  ?tags:tag_map ->
  ?testing_data:testing_data ->
  ?training_data:training_data ->
  output_config:output_config ->
  version_name:version_name ->
  project_arn:project_arn ->
  unit ->
  create_project_version_request

val make_create_project_response : ?project_arn:project_arn -> unit -> create_project_response

val make_create_project_request :
  ?tags:tag_map ->
  ?auto_update:project_auto_update ->
  ?feature:customization_feature ->
  project_name:project_name ->
  unit ->
  create_project_request

val make_create_face_liveness_session_response :
  session_id:liveness_session_id -> unit -> create_face_liveness_session_response

val make_liveness_output_config :
  ?s3_key_prefix:liveness_s3_key_prefix -> s3_bucket:s3_bucket -> unit -> liveness_output_config

val make_challenge_preference :
  ?versions:versions -> type_:challenge_type -> unit -> challenge_preference

val make_create_face_liveness_session_request_settings :
  ?challenge_preferences:challenge_preferences ->
  ?audit_images_limit:audit_images_limit ->
  ?output_config:liveness_output_config ->
  unit ->
  create_face_liveness_session_request_settings

val make_create_face_liveness_session_request :
  ?client_request_token:client_request_token ->
  ?settings:create_face_liveness_session_request_settings ->
  ?kms_key_id:kms_key_id ->
  unit ->
  create_face_liveness_session_request

val make_create_dataset_response : ?dataset_arn:dataset_arn -> unit -> create_dataset_response

val make_dataset_source :
  ?dataset_arn:dataset_arn -> ?ground_truth_manifest:ground_truth_manifest -> unit -> dataset_source

val make_create_dataset_request :
  ?tags:tag_map ->
  ?dataset_source:dataset_source ->
  project_arn:project_arn ->
  dataset_type:dataset_type ->
  unit ->
  create_dataset_request

val make_create_collection_response :
  ?face_model_version:string_ ->
  ?collection_arn:string_ ->
  ?status_code:u_integer ->
  unit ->
  create_collection_response

val make_create_collection_request :
  ?tags:tag_map -> collection_id:collection_id -> unit -> create_collection_request

val make_copy_project_version_response :
  ?project_version_arn:project_version_arn -> unit -> copy_project_version_response

val make_copy_project_version_request :
  ?kms_key_id:kms_key_id ->
  ?tags:tag_map ->
  output_config:output_config ->
  version_name:version_name ->
  destination_project_arn:project_arn ->
  source_project_version_arn:project_version_arn ->
  source_project_arn:project_arn ->
  unit ->
  copy_project_version_request

val make_compared_source_image_face :
  ?confidence:percent -> ?bounding_box:bounding_box -> unit -> compared_source_image_face

val make_compare_faces_match :
  ?face:compared_face -> ?similarity:percent -> unit -> compare_faces_match

val make_compare_faces_response :
  ?target_image_orientation_correction:orientation_correction ->
  ?source_image_orientation_correction:orientation_correction ->
  ?unmatched_faces:compare_faces_unmatch_list ->
  ?face_matches:compare_faces_match_list ->
  ?source_image_face:compared_source_image_face ->
  unit ->
  compare_faces_response

val make_compare_faces_request :
  ?quality_filter:quality_filter ->
  ?similarity_threshold:percent ->
  target_image:image ->
  source_image:image ->
  unit ->
  compare_faces_request

val make_associated_face : ?face_id:face_id -> unit -> associated_face

val make_associate_faces_response :
  ?user_status:user_status ->
  ?unsuccessful_face_associations:unsuccessful_face_association_list ->
  ?associated_faces:associated_faces_list ->
  unit ->
  associate_faces_response

val make_associate_faces_request :
  ?client_request_token:client_request_token ->
  ?user_match_threshold:percent ->
  face_ids:user_face_id_list ->
  user_id:user_id ->
  collection_id:collection_id ->
  unit ->
  associate_faces_request
