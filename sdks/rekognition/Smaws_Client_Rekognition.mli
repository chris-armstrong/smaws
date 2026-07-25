(** Rekognition client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module SearchFaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_faces_request ->
    ( search_faces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_faces_request ->
    ( search_faces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For a given input face ID, searches for matching faces in the collection the face belongs to. \
   You get a face ID when you add a face to the collection using the [IndexFaces] operation. The \
   operation compares the features of the input face with faces in the specified collection. \n\n\
  \  You can also search faces without indexing faces by using the [SearchFacesByImage] operation.\n\
  \  \n\
  \     The operation response returns an array of faces that match, ordered by similarity score \
   with the highest similarity first. More specifically, it is an array of metadata for each face \
   match that is found. Along with the metadata, the response also includes a [confidence] value \
   for each face match, indicating the confidence that the specific face matches the input face. \n\
  \    \n\
  \     For an example, see Searching for a face using its face ID in the Amazon Rekognition \
   Developer Guide.\n\
  \     \n\
  \      This operation requires permissions to perform the [rekognition:SearchFaces] action.\n\
  \      "]

module SearchFacesByImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_faces_by_image_request ->
    ( search_faces_by_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_faces_by_image_request ->
    ( search_faces_by_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For a given input image, first detects the largest face in the image, and then searches the \
   specified collection for matching faces. The operation compares the features of the input face \
   with faces in the specified collection. \n\n\
  \  To search for all faces in an input image, you might first call the [IndexFaces] operation, \
   and then use the face IDs returned in subsequent calls to the [SearchFaces] operation. \n\
  \  \n\
  \    You can also call the [DetectFaces] operation and use the bounding boxes in the response to \
   make face crops, which then you can pass in to the [SearchFacesByImage] operation. \n\
  \   \n\
  \     You pass the input image either as base64-encoded image bytes or as a reference to an \
   image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, \
   passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. \n\
  \     \n\
  \       The response returns an array of faces that match, ordered by similarity score with the \
   highest similarity first. More specifically, it is an array of metadata for each face match \
   found. Along with the metadata, the response also includes a [similarity] indicating how \
   similar the face is to the input face. In the response, the operation also returns the bounding \
   box (and a confidence level that the bounding box contains a face) of the face that Amazon \
   Rekognition used for the input image. \n\
  \      \n\
  \       If no faces are detected in the input image, [SearchFacesByImage] returns an \
   [InvalidParameterException] error. \n\
  \       \n\
  \        For an example, Searching for a Face Using an Image in the Amazon Rekognition Developer \
   Guide.\n\
  \        \n\
  \         The [QualityFilter] input parameter allows you to filter out detected faces that \
   don\226\128\153t meet a required quality bar. The quality bar is based on a variety of common \
   use cases. Use [QualityFilter] to set the quality bar for filtering by specifying [LOW], \
   [MEDIUM], or [HIGH]. If you do not want to filter detected faces, specify [NONE]. The default \
   value is [NONE].\n\
  \         \n\
  \           To use quality filtering, you need a collection associated with version 3 of the \
   face model or higher. To get the version of the face model associated with a collection, call \
   [DescribeCollection]. \n\
  \           \n\
  \             This operation requires permissions to perform the \
   [rekognition:SearchFacesByImage] action.\n\
  \             "]

module SearchUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_users_request ->
    ( search_users_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_users_request ->
    ( search_users_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches for UserIDs within a collection based on a [FaceId] or [UserId]. This API can be used \
   to find the closest UserID (with a highest similarity) to associate a face. The request must be \
   provided with either [FaceId] or [UserId]. The operation returns an array of UserID that match \
   the [FaceId] or [UserId], ordered by similarity score with the highest similarity first. \n"]

module SearchUsersByImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_users_by_image_request ->
    ( search_users_by_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_users_by_image_request ->
    ( search_users_by_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches for UserIDs using a supplied image. It first detects the largest face in the image, \
   and then searches a specified collection for matching UserIDs. \n\n\
  \ The operation returns an array of UserIDs that match the face in the supplied image, ordered \
   by similarity score with the highest similarity first. It also returns a bounding box for the \
   face found in the input image. \n\
  \ \n\
  \  Information about faces detected in the supplied image, but not used for the search, is \
   returned in an array of [UnsearchedFace] objects. If no valid face is detected in the image, \
   the response will contain an empty [UserMatches] list and no [SearchedFace] object. \n\
  \  "]

module StartCelebrityRecognition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `VideoTooLargeException of video_too_large_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_celebrity_recognition_request ->
    ( start_celebrity_recognition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_celebrity_recognition_request ->
    ( start_celebrity_recognition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts asynchronous recognition of celebrities in a stored video.\n\n\
  \ Amazon Rekognition Video can detect celebrities in a video must be stored in an Amazon S3 \
   bucket. Use [Video] to specify the bucket name and the filename of the video. \
   [StartCelebrityRecognition] returns a job identifier ([JobId]) which you use to get the results \
   of the analysis. When celebrity recognition analysis is finished, Amazon Rekognition Video \
   publishes a completion status to the Amazon Simple Notification Service topic that you specify \
   in [NotificationChannel]. To get the results of the celebrity recognition analysis, first check \
   that the status value published to the Amazon SNS topic is [SUCCEEDED]. If so, call \
   [GetCelebrityRecognition] and pass the job identifier ([JobId]) from the initial call to \
   [StartCelebrityRecognition]. \n\
  \ \n\
  \  For more information, see Recognizing celebrities in the Amazon Rekognition Developer Guide.\n\
  \  "]

module StartContentModeration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `VideoTooLargeException of video_too_large_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_content_moderation_request ->
    ( start_content_moderation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_content_moderation_request ->
    ( start_content_moderation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Starts asynchronous detection of inappropriate, unwanted, or offensive content in a stored \
   video. For a list of moderation labels in Amazon Rekognition, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/moderation.html#moderation-api}Using the \
   image and video moderation APIs}.\n\n\
  \ Amazon Rekognition Video can moderate content in a video stored in an Amazon S3 bucket. Use \
   [Video] to specify the bucket name and the filename of the video. [StartContentModeration] \
   returns a job identifier ([JobId]) which you use to get the results of the analysis. When \
   content analysis is finished, Amazon Rekognition Video publishes a completion status to the \
   Amazon Simple Notification Service topic that you specify in [NotificationChannel].\n\
  \ \n\
  \  To get the results of the content analysis, first check that the status value published to \
   the Amazon SNS topic is [SUCCEEDED]. If so, call [GetContentModeration] and pass the job \
   identifier ([JobId]) from the initial call to [StartContentModeration]. \n\
  \  \n\
  \   For more information, see Moderating content in the Amazon Rekognition Developer Guide.\n\
  \   "]

module StartFaceDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `VideoTooLargeException of video_too_large_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_face_detection_request ->
    ( start_face_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_face_detection_request ->
    ( start_face_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts asynchronous detection of faces in a stored video.\n\n\
  \ Amazon Rekognition Video can detect faces in a video stored in an Amazon S3 bucket. Use \
   [Video] to specify the bucket name and the filename of the video. [StartFaceDetection] returns \
   a job identifier ([JobId]) that you use to get the results of the operation. When face \
   detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon \
   Simple Notification Service topic that you specify in [NotificationChannel]. To get the results \
   of the face detection operation, first check that the status value published to the Amazon SNS \
   topic is [SUCCEEDED]. If so, call [GetFaceDetection] and pass the job identifier ([JobId]) from \
   the initial call to [StartFaceDetection].\n\
  \ \n\
  \  For more information, see Detecting faces in a stored video in the Amazon Rekognition \
   Developer Guide.\n\
  \  "]

module StartFaceSearch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `VideoTooLargeException of video_too_large_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_face_search_request ->
    ( start_face_search_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_face_search_request ->
    ( start_face_search_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the asynchronous search for faces in a collection that match the faces of persons \
   detected in a stored video.\n\n\
  \ The video must be stored in an Amazon S3 bucket. Use [Video] to specify the bucket name and \
   the filename of the video. [StartFaceSearch] returns a job identifier ([JobId]) which you use \
   to get the search results once the search has completed. When searching is finished, Amazon \
   Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic \
   that you specify in [NotificationChannel]. To get the search results, first check that the \
   status value published to the Amazon SNS topic is [SUCCEEDED]. If so, call [GetFaceSearch] and \
   pass the job identifier ([JobId]) from the initial call to [StartFaceSearch]. For more \
   information, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/procedure-person-search-videos.html}Searching \
   stored videos for faces}. \n\
  \ "]

module StartLabelDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `VideoTooLargeException of video_too_large_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_label_detection_request ->
    ( start_label_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_label_detection_request ->
    ( start_label_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts asynchronous detection of labels in a stored video.\n\n\
  \ Amazon Rekognition Video can detect labels in a video. Labels are instances of real-world \
   entities. This includes objects like flower, tree, and table; events like wedding, graduation, \
   and birthday party; concepts like landscape, evening, and nature; and activities like a person \
   getting out of a car or a person skiing.\n\
  \ \n\
  \  The video must be stored in an Amazon S3 bucket. Use [Video] to specify the bucket name and \
   the filename of the video. [StartLabelDetection] returns a job identifier ([JobId]) which you \
   use to get the results of the operation. When label detection is finished, Amazon Rekognition \
   Video publishes a completion status to the Amazon Simple Notification Service topic that you \
   specify in [NotificationChannel].\n\
  \  \n\
  \   To get the results of the label detection operation, first check that the status value \
   published to the Amazon SNS topic is [SUCCEEDED]. If so, call [GetLabelDetection] and pass the \
   job identifier ([JobId]) from the initial call to [StartLabelDetection].\n\
  \   \n\
  \     {i Optional Parameters} \n\
  \    \n\
  \      [StartLabelDetection] has the [GENERAL_LABELS] Feature applied by default. This feature \
   allows you to provide filtering criteria to the [Settings] parameter. You can filter with sets \
   of individual labels or with label categories. You can specify inclusive filters, exclusive \
   filters, or a combination of inclusive and exclusive filters. For more information on \
   filtering, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/labels-detecting-labels-video.html}Detecting \
   labels in a video}.\n\
  \     \n\
  \      You can specify [MinConfidence] to control the confidence threshold for the labels \
   returned. The default is 50.\n\
  \      "]

module StartMediaAnalysisJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidManifestException of invalid_manifest_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_media_analysis_job_request ->
    ( start_media_analysis_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidManifestException of invalid_manifest_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_media_analysis_job_request ->
    ( start_media_analysis_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidManifestException of invalid_manifest_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a new media analysis job. Accepts a manifest file in an Amazon S3 bucket. The output \
   is a manifest file and a summary of the manifest stored in the Amazon S3 bucket.\n"]

module StartPersonTracking : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `VideoTooLargeException of video_too_large_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_person_tracking_request ->
    ( start_person_tracking_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_person_tracking_request ->
    ( start_person_tracking_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  {i End of support notice:} On October 31, 2025, AWS will discontinue support for Amazon \
   Rekognition People Pathing. After October 31, 2025, you will no longer be able to use the \
   Rekognition People Pathing capability. For more information, visit this \
   {{:https://aws.amazon.com/blogs/machine-learning/transitioning-from-amazon-rekognition-people-pathing-exploring-other-alternatives/}blog \
   post}.\n\
  \ \n\
  \   Starts the asynchronous tracking of a person's path in a stored video.\n\
  \   \n\
  \    Amazon Rekognition Video can track the path of people in a video stored in an Amazon S3 \
   bucket. Use [Video] to specify the bucket name and the filename of the video. \
   [StartPersonTracking] returns a job identifier ([JobId]) which you use to get the results of \
   the operation. When label detection is finished, Amazon Rekognition publishes a completion \
   status to the Amazon Simple Notification Service topic that you specify in \
   [NotificationChannel]. \n\
  \    \n\
  \     To get the results of the person detection operation, first check that the status value \
   published to the Amazon SNS topic is [SUCCEEDED]. If so, call [GetPersonTracking] and pass the \
   job identifier ([JobId]) from the initial call to [StartPersonTracking].\n\
  \     "]

module StartProjectVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_project_version_request ->
    ( start_project_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_project_version_request ->
    ( start_project_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Starts the running of the version of a model. Starting a model takes a while to complete. To \
   check the current state of the model, use [DescribeProjectVersions]. \n\
  \   \n\
  \    Once the model is running, you can detect custom labels in new images by calling \
   [DetectCustomLabels].\n\
  \    \n\
  \      You are charged for the amount of time that the model is running. To stop a running \
   model, call [StopProjectVersion].\n\
  \      \n\
  \        This operation requires permissions to perform the [rekognition:StartProjectVersion] \
   action.\n\
  \        "]

module StartSegmentDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `VideoTooLargeException of video_too_large_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_segment_detection_request ->
    ( start_segment_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_segment_detection_request ->
    ( start_segment_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts asynchronous detection of segment detection in a stored video.\n\n\
  \ Amazon Rekognition Video can detect segments in a video stored in an Amazon S3 bucket. Use \
   [Video] to specify the bucket name and the filename of the video. [StartSegmentDetection] \
   returns a job identifier ([JobId]) which you use to get the results of the operation. When \
   segment detection is finished, Amazon Rekognition Video publishes a completion status to the \
   Amazon Simple Notification Service topic that you specify in [NotificationChannel].\n\
  \ \n\
  \  You can use the [Filters] ([StartSegmentDetectionFilters]) input parameter to specify the \
   minimum detection confidence returned in the response. Within [Filters], use [ShotFilter] \
   ([StartShotDetectionFilter]) to filter detected shots. Use [TechnicalCueFilter] \
   ([StartTechnicalCueDetectionFilter]) to filter technical cues. \n\
  \  \n\
  \   To get the results of the segment detection operation, first check that the status value \
   published to the Amazon SNS topic is [SUCCEEDED]. if so, call [GetSegmentDetection] and pass \
   the job identifier ([JobId]) from the initial call to [StartSegmentDetection]. \n\
  \   \n\
  \    For more information, see Detecting video segments in stored video in the Amazon \
   Rekognition Developer Guide.\n\
  \    "]

module StartStreamProcessor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_stream_processor_request ->
    ( start_stream_processor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_stream_processor_request ->
    ( start_stream_processor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts processing a stream processor. You create a stream processor by calling \
   [CreateStreamProcessor]. To tell [StartStreamProcessor] which stream processor to start, use \
   the value of the [Name] field specified in the call to [CreateStreamProcessor].\n\n\
  \ If you are using a label detection stream processor to detect labels, you need to provide a \
   [Start selector] and a [Stop selector] to determine the length of the stream processing time.\n\
  \ "]

module StartTextDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `VideoTooLargeException of video_too_large_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_text_detection_request ->
    ( start_text_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_text_detection_request ->
    ( start_text_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `VideoTooLargeException of video_too_large_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts asynchronous detection of text in a stored video.\n\n\
  \ Amazon Rekognition Video can detect text in a video stored in an Amazon S3 bucket. Use [Video] \
   to specify the bucket name and the filename of the video. [StartTextDetection] returns a job \
   identifier ([JobId]) which you use to get the results of the operation. When text detection is \
   finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple \
   Notification Service topic that you specify in [NotificationChannel].\n\
  \ \n\
  \  To get the results of the text detection operation, first check that the status value \
   published to the Amazon SNS topic is [SUCCEEDED]. if so, call [GetTextDetection] and pass the \
   job identifier ([JobId]) from the initial call to [StartTextDetection]. \n\
  \  "]

module StopProjectVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_project_version_request ->
    ( stop_project_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_project_version_request ->
    ( stop_project_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Stops a running model. The operation might take a while to complete. To check the current \
   status, call [DescribeProjectVersions]. Only applies to Custom Labels projects.\n\
  \   \n\
  \    This operation requires permissions to perform the [rekognition:StopProjectVersion] action.\n\
  \    "]

module StopStreamProcessor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_stream_processor_request ->
    ( stop_stream_processor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_stream_processor_request ->
    ( stop_stream_processor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a running stream processor that was created by [CreateStreamProcessor].\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Adds one or more key-value tags to an Amazon Rekognition collection, stream processor, or \
   Custom Labels model. For more information, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging AWS Resources}. \n\n\
  \ This operation requires permissions to perform the [rekognition:TagResource] action. \n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Removes one or more tags from an Amazon Rekognition collection, stream processor, or Custom \
   Labels model. \n\n\
  \ This operation requires permissions to perform the [rekognition:UntagResource] action. \n\
  \ "]

module UpdateDatasetEntries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_dataset_entries_request ->
    ( update_dataset_entries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_dataset_entries_request ->
    ( update_dataset_entries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Adds or updates one or more entries (images) in a dataset. An entry is a JSON Line which \
   contains the information for a single image, including the image location, assigned labels, and \
   object location bounding boxes. For more information, see Image-Level labels in manifest files \
   and Object localization in manifest files in the {i Amazon Rekognition Custom Labels Developer \
   Guide}. \n\
  \   \n\
  \    If the [source-ref] field in the JSON line references an existing image, the existing image \
   in the dataset is updated. If [source-ref] field doesn't reference an existing image, the image \
   is added as a new image to the dataset. \n\
  \    \n\
  \     You specify the changes that you want to make in the [Changes] input parameter. There \
   isn't a limit to the number JSON Lines that you can change, but the size of [Changes] must be \
   less than 5MB.\n\
  \     \n\
  \       [UpdateDatasetEntries] returns immediatly, but the dataset update might take a while to \
   complete. Use [DescribeDataset] to check the current status. The dataset updated successfully \
   if the value of [Status] is [UPDATE_COMPLETE]. \n\
  \      \n\
  \       To check if any non-terminal errors occured, call [ListDatasetEntries] and check for the \
   presence of [errors] lists in the JSON Lines.\n\
  \       \n\
  \        Dataset update fails if a terminal error occurs ([Status] = [UPDATE_FAILED]). \
   Currently, you can't access the terminal error information from the Amazon Rekognition Custom \
   Labels SDK. \n\
  \        \n\
  \         This operation requires permissions to perform the [rekognition:UpdateDatasetEntries] \
   action.\n\
  \         "]

module UpdateStreamProcessor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_stream_processor_request ->
    ( update_stream_processor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_stream_processor_request ->
    ( update_stream_processor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Allows you to update a stream processor. You can change some settings and regions of interest \
   and delete certain parameters. \n"]

module RecognizeCelebrities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    recognize_celebrities_request ->
    ( recognize_celebrities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    recognize_celebrities_request ->
    ( recognize_celebrities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an array of celebrities recognized in the input image. For more information, see \
   Recognizing celebrities in the Amazon Rekognition Developer Guide. \n\n\
  \  [RecognizeCelebrities] returns the 64 largest faces in the image. It lists the recognized \
   celebrities in the [CelebrityFaces] array and any unrecognized faces in the [UnrecognizedFaces] \
   array. [RecognizeCelebrities] doesn't return celebrities whose faces aren't among the largest \
   64 faces in the image.\n\
  \ \n\
  \  For each celebrity recognized, [RecognizeCelebrities] returns a [Celebrity] object. The \
   [Celebrity] object contains the celebrity name, ID, URL links to additional information, match \
   confidence, and a [ComparedFace] object that you can use to locate the celebrity's face on the \
   image.\n\
  \  \n\
  \   Amazon Rekognition doesn't retain information about which images a celebrity has been \
   recognized in. Your application must store this information and use the [Celebrity] ID property \
   as a unique identifier for the celebrity. If you don't store the celebrity name or additional \
   information URLs returned by [RecognizeCelebrities], you will need the ID to identify the \
   celebrity in a call to the [GetCelebrityInfo] operation.\n\
  \   \n\
  \    You pass the input image either as base64-encoded image bytes or as a reference to an image \
   in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing \
   image bytes is not supported. The image must be either a PNG or JPEG formatted file. \n\
  \    \n\
  \     For an example, see Recognizing celebrities in an image in the Amazon Rekognition \
   Developer Guide.\n\
  \     \n\
  \      This operation requires permissions to perform the [rekognition:RecognizeCelebrities] \
   operation.\n\
  \      "]

module PutProjectPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPolicyRevisionIdException of invalid_policy_revision_id_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_project_policy_request ->
    ( put_project_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPolicyRevisionIdException of invalid_policy_revision_id_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_project_policy_request ->
    ( put_project_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPolicyRevisionIdException of invalid_policy_revision_id_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Attaches a project policy to a Amazon Rekognition Custom Labels project in a trusting AWS \
   account. A project policy specifies that a trusted AWS account can copy a model version from a \
   trusting AWS account to a project in the trusted AWS account. To copy a model version you use \
   the [CopyProjectVersion] operation. Only applies to Custom Labels projects.\n\
  \   \n\
  \    For more information about the format of a project policy document, see Attaching a project \
   policy (SDK) in the {i Amazon Rekognition Custom Labels Developer Guide}. \n\
  \    \n\
  \     The response from [PutProjectPolicy] is a revision ID for the project policy. You can \
   attach multiple project policies to a project. You can also update an existing project policy \
   by specifying the policy revision ID of the existing policy.\n\
  \     \n\
  \      To remove a project policy from a project, call [DeleteProjectPolicy]. To get a list of \
   project policies attached to a project, call [ListProjectPolicies]. \n\
  \      \n\
  \       You copy a model version by calling [CopyProjectVersion].\n\
  \       \n\
  \        This operation requires permissions to perform the [rekognition:PutProjectPolicy] action.\n\
  \        "]

module ListUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns metadata of the User such as [UserID] in the specified collection. Anonymous User (to \
   reserve faces without any identity) is not returned as part of this request. The results are \
   sorted by system generated primary key ID. If the response is truncated, [NextToken] is \
   returned in the response that can be used in the subsequent request to retrieve the next set of \
   identities.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns a list of tags in an Amazon Rekognition collection, stream processor, or Custom Labels \
   model. \n\n\
  \ This operation requires permissions to perform the [rekognition:ListTagsForResource] action. \n\
  \ "]

module ListStreamProcessors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stream_processors_request ->
    ( list_stream_processors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stream_processors_request ->
    ( list_stream_processors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of stream processors that you have created with [CreateStreamProcessor]. \n"]

module ListProjectPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_project_policies_request ->
    ( list_project_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_project_policies_request ->
    ( list_project_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Gets a list of the project policies attached to a project.\n\
  \   \n\
  \    To attach a project policy to a project, call [PutProjectPolicy]. To remove a project \
   policy from a project, call [DeleteProjectPolicy].\n\
  \    \n\
  \     This operation requires permissions to perform the [rekognition:ListProjectPolicies] action.\n\
  \     "]

module ListMediaAnalysisJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_media_analysis_jobs_request ->
    ( list_media_analysis_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_media_analysis_jobs_request ->
    ( list_media_analysis_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of media analysis jobs. Results are sorted by [CreationTimestamp] in descending \
   order.\n"]

module ListFaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_faces_request ->
    ( list_faces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_faces_request ->
    ( list_faces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns metadata for faces in the specified collection. This metadata includes information such \
   as the bounding box coordinates, the confidence (that the bounding box contains a face), and \
   face ID. For an example, see Listing Faces in a Collection in the Amazon Rekognition Developer \
   Guide.\n\n\
  \ This operation requires permissions to perform the [rekognition:ListFaces] action.\n\
  \ "]

module ListDatasetLabels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_labels_request ->
    ( list_dataset_labels_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_labels_request ->
    ( list_dataset_labels_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Lists the labels in a dataset. Amazon Rekognition Custom Labels uses labels to describe \
   images. For more information, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/customlabels-dg/md-labeling-images.html}Labeling \
   images}. \n\
  \   \n\
  \     Lists the labels in a dataset. Amazon Rekognition Custom Labels uses labels to describe \
   images. For more information, see Labeling images in the {i Amazon Rekognition Custom Labels \
   Developer Guide}. \n\
  \    "]

module ListDatasetEntries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_entries_request ->
    ( list_dataset_entries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_entries_request ->
    ( list_dataset_entries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \    Lists the entries (images) within a dataset. An entry is a JSON Line that contains the \
   information for a single image, including the image location, assigned labels, and object \
   location bounding boxes. For more information, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/customlabels-dg/md-manifest-files.html}Creating \
   a manifest file}.\n\
  \   \n\
  \    JSON Lines in the response include information about non-terminal errors found in the \
   dataset. Non terminal errors are reported in [errors] lists within each JSON Line. The same \
   information is reported in the training and testing validation result manifests that Amazon \
   Rekognition Custom Labels creates during model training. \n\
  \    \n\
  \     You can filter the response in variety of ways, such as choosing which labels to return \
   and returning JSON Lines created after a specific date. \n\
  \     \n\
  \      This operation requires permissions to perform the [rekognition:ListDatasetEntries] action.\n\
  \      "]

module ListCollections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_collections_request ->
    ( list_collections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_collections_request ->
    ( list_collections_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns list of collection IDs in your account. If the result is truncated, the response also \
   provides a [NextToken] that you can use in the subsequent request to fetch the next set of \
   collection IDs.\n\n\
  \ For an example, see Listing collections in the Amazon Rekognition Developer Guide.\n\
  \ \n\
  \  This operation requires permissions to perform the [rekognition:ListCollections] action.\n\
  \  "]

module IndexFaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    index_faces_request ->
    ( index_faces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    index_faces_request ->
    ( index_faces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects faces in the input image and adds them to the specified collection. \n\n\
  \ Amazon Rekognition doesn't save the actual faces that are detected. Instead, the underlying \
   detection algorithm first detects the faces in the input image. For each face, the algorithm \
   extracts facial features into a feature vector, and stores it in the backend database. Amazon \
   Rekognition uses feature vectors when it performs face match and search operations using the \
   [SearchFaces] and [SearchFacesByImage] operations.\n\
  \ \n\
  \  For more information, see Adding faces to a collection in the Amazon Rekognition Developer \
   Guide.\n\
  \  \n\
  \   To get the number of faces in a collection, call [DescribeCollection]. \n\
  \   \n\
  \    If you're using version 1.0 of the face detection model, [IndexFaces] indexes the 15 \
   largest faces in the input image. Later versions of the face detection model index the 100 \
   largest faces in the input image. \n\
  \    \n\
  \     If you're using version 4 or later of the face model, image orientation information is not \
   returned in the [OrientationCorrection] field. \n\
  \     \n\
  \      To determine which version of the model you're using, call [DescribeCollection] and \
   supply the collection ID. You can also get the model version from the value of \
   [FaceModelVersion] in the response from [IndexFaces] \n\
  \      \n\
  \       For more information, see Model Versioning in the Amazon Rekognition Developer Guide.\n\
  \       \n\
  \        If you provide the optional [ExternalImageId] for the input image you provided, Amazon \
   Rekognition associates this ID with all faces that it detects. When you call the [ListFaces] \
   operation, the response returns the external ID. You can use this external image ID to create a \
   client-side index to associate the faces with each image. You can then use the index to find \
   all faces in an image.\n\
  \        \n\
  \         You can specify the maximum number of faces to index with the [MaxFaces] input \
   parameter. This is useful when you want to index the largest faces in an image and don't want \
   to index smaller faces, such as those belonging to people standing in the background.\n\
  \         \n\
  \          The [QualityFilter] input parameter allows you to filter out detected faces that \
   don\226\128\153t meet a required quality bar. The quality bar is based on a variety of common \
   use cases. By default, [IndexFaces] chooses the quality bar that's used to filter faces. You \
   can also explicitly choose the quality bar. Use [QualityFilter], to set the quality bar by \
   specifying [LOW], [MEDIUM], or [HIGH]. If you do not want to filter detected faces, specify \
   [NONE]. \n\
  \          \n\
  \            To use quality filtering, you need a collection associated with version 3 of the \
   face model or higher. To get the version of the face model associated with a collection, call \
   [DescribeCollection]. \n\
  \            \n\
  \              Information about faces detected in an image, but not indexed, is returned in an \
   array of [UnindexedFace] objects, [UnindexedFaces]. Faces aren't indexed for reasons such as:\n\
  \              \n\
  \               {ul\n\
  \                     {-  The number of faces detected exceeds the value of the [MaxFaces] \
   request parameter.\n\
  \                         \n\
  \                          }\n\
  \                     {-  The face is too small compared to the image dimensions.\n\
  \                         \n\
  \                          }\n\
  \                     {-  The face is too blurry.\n\
  \                         \n\
  \                          }\n\
  \                     {-  The image is too dark.\n\
  \                         \n\
  \                          }\n\
  \                     {-  The face has an extreme pose.\n\
  \                         \n\
  \                          }\n\
  \                     {-  The face doesn\226\128\153t have enough detail to be suitable for face \
   search.\n\
  \                         \n\
  \                          }\n\
  \                     }\n\
  \   In response, the [IndexFaces] operation returns an array of metadata for all detected faces, \
   [FaceRecords]. This includes: \n\
  \   \n\
  \    {ul\n\
  \          {-  The bounding box, [BoundingBox], of the detected face. \n\
  \              \n\
  \               }\n\
  \          {-  A confidence value, [Confidence], which indicates the confidence that the \
   bounding box contains a face.\n\
  \              \n\
  \               }\n\
  \          {-  A face ID, [FaceId], assigned by the service for each face that's detected and \
   stored.\n\
  \              \n\
  \               }\n\
  \          {-  An image ID, [ImageId], assigned by the service for the input image.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If you request [ALL] or specific facial attributes (e.g., [FACE_OCCLUDED]) by using the \
   detectionAttributes parameter, Amazon Rekognition returns detailed facial attributes, such as \
   facial landmarks (for example, location of eye and mouth), facial occlusion, and other facial \
   attributes.\n\
  \   \n\
  \    If you provide the same image, specify the same collection, and use the same external ID in \
   the [IndexFaces] operation, Amazon Rekognition doesn't save duplicate face metadata.\n\
  \    \n\
  \     \n\
  \     \n\
  \      The input image is passed either as base64-encoded image bytes, or as a reference to an \
   image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, \
   passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. \n\
  \      \n\
  \       This operation requires permissions to perform the [rekognition:IndexFaces] action.\n\
  \       "]

module GetTextDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_text_detection_request ->
    ( get_text_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_text_detection_request ->
    ( get_text_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the text detection results of a Amazon Rekognition Video analysis started by \
   [StartTextDetection].\n\n\
  \ Text detection with Amazon Rekognition Video is an asynchronous operation. You start text \
   detection by calling [StartTextDetection] which returns a job identifier ([JobId]) When the \
   text detection operation finishes, Amazon Rekognition publishes a completion status to the \
   Amazon Simple Notification Service topic registered in the initial call to \
   [StartTextDetection]. To get the results of the text detection operation, first check that the \
   status value published to the Amazon SNS topic is [SUCCEEDED]. if so, call [GetTextDetection] \
   and pass the job identifier ([JobId]) from the initial call of [StartLabelDetection].\n\
  \ \n\
  \   [GetTextDetection] returns an array of detected text ([TextDetections]) sorted by the time \
   the text was detected, up to 100 words per frame of video.\n\
  \  \n\
  \   Each element of the array includes the detected text, the precentage confidence in the \
   acuracy of the detected text, the time the text was detected, bounding box information for \
   where the text was located, and unique identifiers for words and their lines.\n\
  \   \n\
  \    Use MaxResults parameter to limit the number of text detections returned. If there are more \
   results than specified in [MaxResults], the value of [NextToken] in the operation response \
   contains a pagination token for getting the next set of results. To get the next page of \
   results, call [GetTextDetection] and populate the [NextToken] request parameter with the token \
   value returned from the previous call to [GetTextDetection].\n\
  \    "]

module GetSegmentDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_segment_detection_request ->
    ( get_segment_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_segment_detection_request ->
    ( get_segment_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the segment detection results of a Amazon Rekognition Video analysis started by \
   [StartSegmentDetection].\n\n\
  \ Segment detection with Amazon Rekognition Video is an asynchronous operation. You start \
   segment detection by calling [StartSegmentDetection] which returns a job identifier ([JobId]). \
   When the segment detection operation finishes, Amazon Rekognition publishes a completion status \
   to the Amazon Simple Notification Service topic registered in the initial call to \
   [StartSegmentDetection]. To get the results of the segment detection operation, first check \
   that the status value published to the Amazon SNS topic is [SUCCEEDED]. if so, call \
   [GetSegmentDetection] and pass the job identifier ([JobId]) from the initial call of \
   [StartSegmentDetection].\n\
  \ \n\
  \   [GetSegmentDetection] returns detected segments in an array ([Segments]) of \
   [SegmentDetection] objects. [Segments] is sorted by the segment types specified in the \
   [SegmentTypes] input parameter of [StartSegmentDetection]. Each element of the array includes \
   the detected segment, the precentage confidence in the acuracy of the detected segment, the \
   type of the segment, and the frame in which the segment was detected.\n\
  \  \n\
  \   Use [SelectedSegmentTypes] to find out the type of segment detection requested in the call \
   to [StartSegmentDetection].\n\
  \   \n\
  \    Use the [MaxResults] parameter to limit the number of segment detections returned. If there \
   are more results than specified in [MaxResults], the value of [NextToken] in the operation \
   response contains a pagination token for getting the next set of results. To get the next page \
   of results, call [GetSegmentDetection] and populate the [NextToken] request parameter with the \
   token value returned from the previous call to [GetSegmentDetection].\n\
  \    \n\
  \     For more information, see Detecting video segments in stored video in the Amazon \
   Rekognition Developer Guide.\n\
  \     "]

module GetPersonTracking : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_person_tracking_request ->
    ( get_person_tracking_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_person_tracking_request ->
    ( get_person_tracking_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  {i End of support notice:} On October 31, 2025, AWS will discontinue support for Amazon \
   Rekognition People Pathing. After October 31, 2025, you will no longer be able to use the \
   Rekognition People Pathing capability. For more information, visit this \
   {{:https://aws.amazon.com/blogs/machine-learning/transitioning-from-amazon-rekognition-people-pathing-exploring-other-alternatives/}blog \
   post}.\n\
  \ \n\
  \   Gets the path tracking results of a Amazon Rekognition Video analysis started by \
   [StartPersonTracking].\n\
  \   \n\
  \    The person path tracking operation is started by a call to [StartPersonTracking] which \
   returns a job identifier ([JobId]). When the operation finishes, Amazon Rekognition Video \
   publishes a completion status to the Amazon Simple Notification Service topic registered in the \
   initial call to [StartPersonTracking].\n\
  \    \n\
  \     To get the results of the person path tracking operation, first check that the status \
   value published to the Amazon SNS topic is [SUCCEEDED]. If so, call [GetPersonTracking] and \
   pass the job identifier ([JobId]) from the initial call to [StartPersonTracking].\n\
  \     \n\
  \       [GetPersonTracking] returns an array, [Persons], of tracked persons and the time(s) \
   their paths were tracked in the video. \n\
  \      \n\
  \         [GetPersonTracking] only returns the default facial attributes ([BoundingBox], \
   [Confidence], [Landmarks], [Pose], and [Quality]). The other facial attributes listed in the \
   [Face] object of the following response syntax are not returned. \n\
  \        \n\
  \         For more information, see FaceDetail in the Amazon Rekognition Developer Guide.\n\
  \         \n\
  \           By default, the array is sorted by the time(s) a person's path is tracked in the \
   video. You can sort by tracked persons by specifying [INDEX] for the [SortBy] input parameter.\n\
  \           \n\
  \            Use the [MaxResults] parameter to limit the number of items returned. If there are \
   more results than specified in [MaxResults], the value of [NextToken] in the operation response \
   contains a pagination token for getting the next set of results. To get the next page of \
   results, call [GetPersonTracking] and populate the [NextToken] request parameter with the token \
   value returned from the previous call to [GetPersonTracking].\n\
  \            "]

module GetMediaAnalysisJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_media_analysis_job_request ->
    ( get_media_analysis_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_media_analysis_job_request ->
    ( get_media_analysis_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the results for a given media analysis job. Takes a [JobId] returned by \
   StartMediaAnalysisJob.\n"]

module GetLabelDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_label_detection_request ->
    ( get_label_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_label_detection_request ->
    ( get_label_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the label detection results of a Amazon Rekognition Video analysis started by \
   [StartLabelDetection]. \n\n\
  \ The label detection operation is started by a call to [StartLabelDetection] which returns a \
   job identifier ([JobId]). When the label detection operation finishes, Amazon Rekognition \
   publishes a completion status to the Amazon Simple Notification Service topic registered in the \
   initial call to [StartlabelDetection]. \n\
  \ \n\
  \  To get the results of the label detection operation, first check that the status value \
   published to the Amazon SNS topic is [SUCCEEDED]. If so, call [GetLabelDetection] and pass the \
   job identifier ([JobId]) from the initial call to [StartLabelDetection].\n\
  \  \n\
  \    [GetLabelDetection] returns an array of detected labels ([Labels]) sorted by the time the \
   labels were detected. You can also sort by the label name by specifying [NAME] for the [SortBy] \
   input parameter. If there is no [NAME] specified, the default sort is by timestamp.\n\
  \   \n\
  \    You can select how results are aggregated by using the [AggregateBy] input parameter. The \
   default aggregation method is [TIMESTAMPS]. You can also aggregate by [SEGMENTS], which \
   aggregates all instances of labels detected in a given segment. \n\
  \    \n\
  \     The returned Labels array may include the following attributes:\n\
  \     \n\
  \      {ul\n\
  \            {-  Name - The name of the detected label.\n\
  \                \n\
  \                 }\n\
  \            {-  Confidence - The level of confidence in the label assigned to a detected object. \n\
  \                \n\
  \                 }\n\
  \            {-  Parents - The ancestor labels for a detected label. GetLabelDetection returns a \
   hierarchical taxonomy of detected labels. For example, a detected car might be assigned the \
   label car. The label car has two parent labels: Vehicle (its parent) and Transportation (its \
   grandparent). The response includes the all ancestors for a label, where every ancestor is a \
   unique label. In the previous example, Car, Vehicle, and Transportation are returned as unique \
   labels in the response. \n\
  \                \n\
  \                 }\n\
  \            {-   Aliases - Possible Aliases for the label. \n\
  \                \n\
  \                 }\n\
  \            {-  Categories - The label categories that the detected label belongs to.\n\
  \                \n\
  \                 }\n\
  \            {-  BoundingBox \226\128\148 Bounding boxes are described for all instances of \
   detected common object labels, returned in an array of Instance objects. An Instance object \
   contains a BoundingBox object, describing the location of the label on the input image. It also \
   includes the confidence for the accuracy of the detected bounding box.\n\
  \                \n\
  \                 }\n\
  \            {-  Timestamp - Time, in milliseconds from the start of the video, that the label \
   was detected. For aggregation by [SEGMENTS], the [StartTimestampMillis], [EndTimestampMillis], \
   and [DurationMillis] structures are what define a segment. Although the \
   \226\128\156Timestamp\226\128\157 structure is still returned with each label, its value is set \
   to be the same as [StartTimestampMillis].\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   Timestamp and Bounding box information are returned for detected Instances, only if \
   aggregation is done by [TIMESTAMPS]. If aggregating by [SEGMENTS], information about detected \
   instances isn\226\128\153t returned. \n\
  \   \n\
  \    The version of the label model used for the detection is also returned.\n\
  \    \n\
  \      {b Note [DominantColors] isn't returned for [Instances], although it is shown as part of \
   the response in the sample seen below.} \n\
  \     \n\
  \      Use [MaxResults] parameter to limit the number of labels returned. If there are more \
   results than specified in [MaxResults], the value of [NextToken] in the operation response \
   contains a pagination token for getting the next set of results. To get the next page of \
   results, call [GetlabelDetection] and populate the [NextToken] request parameter with the token \
   value returned from the previous call to [GetLabelDetection].\n\
  \      \n\
  \       If you are retrieving results while using the Amazon Simple Notification Service, note \
   that you will receive an \"ERROR\" notification if the job encounters an issue.\n\
  \       "]

module GetFaceSearch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_face_search_request ->
    ( get_face_search_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_face_search_request ->
    ( get_face_search_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the face search results for Amazon Rekognition Video face search started by \
   [StartFaceSearch]. The search returns faces in a collection that match the faces of persons \
   detected in a video. It also includes the time(s) that faces are matched in the video.\n\n\
  \ Face search in a video is an asynchronous operation. You start face search by calling to \
   [StartFaceSearch] which returns a job identifier ([JobId]). When the search operation finishes, \
   Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification \
   Service topic registered in the initial call to [StartFaceSearch]. To get the search results, \
   first check that the status value published to the Amazon SNS topic is [SUCCEEDED]. If so, call \
   [GetFaceSearch] and pass the job identifier ([JobId]) from the initial call to \
   [StartFaceSearch].\n\
  \ \n\
  \  For more information, see Searching Faces in a Collection in the Amazon Rekognition Developer \
   Guide.\n\
  \  \n\
  \   The search results are retured in an array, [Persons], of [PersonMatch] objects. \
   Each[PersonMatch] element contains details about the matching faces in the input collection, \
   person information (facial attributes, bounding boxes, and person identifer) for the matched \
   person, and the time the person was matched in the video.\n\
  \   \n\
  \      [GetFaceSearch] only returns the default facial attributes ([BoundingBox], [Confidence], \
   [Landmarks], [Pose], and [Quality]). The other facial attributes listed in the [Face] object of \
   the following response syntax are not returned. For more information, see FaceDetail in the \
   Amazon Rekognition Developer Guide. \n\
  \     \n\
  \       By default, the [Persons] array is sorted by the time, in milliseconds from the start of \
   the video, persons are matched. You can also sort by persons by specifying [INDEX] for the \
   [SORTBY] input parameter.\n\
  \       "]

module GetFaceLivenessSessionResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `SessionNotFoundException of session_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_face_liveness_session_results_request ->
    ( get_face_liveness_session_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `SessionNotFoundException of session_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_face_liveness_session_results_request ->
    ( get_face_liveness_session_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `SessionNotFoundException of session_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the results of a specific Face Liveness session. It requires the [sessionId] as \
   input, which was created using [CreateFaceLivenessSession]. Returns the corresponding Face \
   Liveness confidence score, a reference image that includes a face bounding box, and audit \
   images that also contain face bounding boxes. The Face Liveness confidence score ranges from 0 \
   to 100. \n\n\
  \ The number of audit images returned by [GetFaceLivenessSessionResults] is defined by the \
   [AuditImagesLimit] paramater when calling [CreateFaceLivenessSession]. Reference images are \
   always returned when possible.\n\
  \ "]

module GetFaceDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_face_detection_request ->
    ( get_face_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_face_detection_request ->
    ( get_face_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets face detection results for a Amazon Rekognition Video analysis started by \
   [StartFaceDetection].\n\n\
  \ Face detection with Amazon Rekognition Video is an asynchronous operation. You start face \
   detection by calling [StartFaceDetection] which returns a job identifier ([JobId]). When the \
   face detection operation finishes, Amazon Rekognition Video publishes a completion status to \
   the Amazon Simple Notification Service topic registered in the initial call to \
   [StartFaceDetection]. To get the results of the face detection operation, first check that the \
   status value published to the Amazon SNS topic is [SUCCEEDED]. If so, call [GetFaceDetection] \
   and pass the job identifier ([JobId]) from the initial call to [StartFaceDetection].\n\
  \ \n\
  \   [GetFaceDetection] returns an array of detected faces ([Faces]) sorted by the time the faces \
   were detected. \n\
  \  \n\
  \   Use MaxResults parameter to limit the number of labels returned. If there are more results \
   than specified in [MaxResults], the value of [NextToken] in the operation response contains a \
   pagination token for getting the next set of results. To get the next page of results, call \
   [GetFaceDetection] and populate the [NextToken] request parameter with the token value returned \
   from the previous call to [GetFaceDetection].\n\
  \   \n\
  \    Note that for the [GetFaceDetection] operation, the returned values for [FaceOccluded] and \
   [EyeDirection] will always be \"null\".\n\
  \    "]

module GetContentModeration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_content_moderation_request ->
    ( get_content_moderation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_content_moderation_request ->
    ( get_content_moderation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the inappropriate, unwanted, or offensive content analysis results for a Amazon \
   Rekognition Video analysis started by [StartContentModeration]. For a list of moderation labels \
   in Amazon Rekognition, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/moderation.html#moderation-api}Using the \
   image and video moderation APIs}.\n\n\
  \ Amazon Rekognition Video inappropriate or offensive content detection in a stored video is an \
   asynchronous operation. You start analysis by calling [StartContentModeration] which returns a \
   job identifier ([JobId]). When analysis finishes, Amazon Rekognition Video publishes a \
   completion status to the Amazon Simple Notification Service topic registered in the initial \
   call to [StartContentModeration]. To get the results of the content analysis, first check that \
   the status value published to the Amazon SNS topic is [SUCCEEDED]. If so, call \
   [GetContentModeration] and pass the job identifier ([JobId]) from the initial call to \
   [StartContentModeration]. \n\
  \ \n\
  \  For more information, see Working with Stored Videos in the Amazon Rekognition Devlopers Guide.\n\
  \  \n\
  \    [GetContentModeration] returns detected inappropriate, unwanted, or offensive content \
   moderation labels, and the time they are detected, in an array, [ModerationLabels], of \
   [ContentModerationDetection] objects. \n\
  \   \n\
  \    By default, the moderated labels are returned sorted by time, in milliseconds from the \
   start of the video. You can also sort them by moderated label by specifying [NAME] for the \
   [SortBy] input parameter. \n\
  \    \n\
  \     Since video analysis can return a large number of results, use the [MaxResults] parameter \
   to limit the number of labels returned in a single call to [GetContentModeration]. If there are \
   more results than specified in [MaxResults], the value of [NextToken] in the operation response \
   contains a pagination token for getting the next set of results. To get the next page of \
   results, call [GetContentModeration] and populate the [NextToken] request parameter with the \
   value of [NextToken] returned from the previous call to [GetContentModeration].\n\
  \     \n\
  \      For more information, see moderating content in the Amazon Rekognition Developer Guide.\n\
  \      "]

module GetCelebrityRecognition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_celebrity_recognition_request ->
    ( get_celebrity_recognition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_celebrity_recognition_request ->
    ( get_celebrity_recognition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the celebrity recognition results for a Amazon Rekognition Video analysis started by \
   [StartCelebrityRecognition].\n\n\
  \ Celebrity recognition in a video is an asynchronous operation. Analysis is started by a call \
   to [StartCelebrityRecognition] which returns a job identifier ([JobId]). \n\
  \ \n\
  \  When the celebrity recognition operation finishes, Amazon Rekognition Video publishes a \
   completion status to the Amazon Simple Notification Service topic registered in the initial \
   call to [StartCelebrityRecognition]. To get the results of the celebrity recognition analysis, \
   first check that the status value published to the Amazon SNS topic is [SUCCEEDED]. If so, call \
   [GetCelebrityDetection] and pass the job identifier ([JobId]) from the initial call to \
   [StartCelebrityDetection]. \n\
  \  \n\
  \   For more information, see Working With Stored Videos in the Amazon Rekognition Developer \
   Guide.\n\
  \   \n\
  \     [GetCelebrityRecognition] returns detected celebrities and the time(s) they are detected \
   in an array ([Celebrities]) of [CelebrityRecognition] objects. Each [CelebrityRecognition] \
   contains information about the celebrity in a [CelebrityDetail] object and the time, \
   [Timestamp], the celebrity was detected. This [CelebrityDetail] object stores information about \
   the detected celebrity's face attributes, a face bounding box, known gender, the celebrity's \
   name, and a confidence estimate.\n\
  \    \n\
  \       [GetCelebrityRecognition] only returns the default facial attributes ([BoundingBox], \
   [Confidence], [Landmarks], [Pose], and [Quality]). The [BoundingBox] field only applies to the \
   detected face instance. The other facial attributes listed in the [Face] object of the \
   following response syntax are not returned. For more information, see FaceDetail in the Amazon \
   Rekognition Developer Guide. \n\
  \      \n\
  \        By default, the [Celebrities] array is sorted by time (milliseconds from the start of \
   the video). You can also sort the array by celebrity by specifying the value [ID] in the \
   [SortBy] input parameter.\n\
  \        \n\
  \         The [CelebrityDetail] object includes the celebrity identifer and additional \
   information urls. If you don't store the additional information urls, you can get them later by \
   calling [GetCelebrityInfo] with the celebrity identifer.\n\
  \         \n\
  \          No information is returned for faces not recognized as celebrities.\n\
  \          \n\
  \           Use MaxResults parameter to limit the number of labels returned. If there are more \
   results than specified in [MaxResults], the value of [NextToken] in the operation response \
   contains a pagination token for getting the next set of results. To get the next page of \
   results, call [GetCelebrityDetection] and populate the [NextToken] request parameter with the \
   token value returned from the previous call to [GetCelebrityRecognition].\n\
  \           "]

module GetCelebrityInfo : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_celebrity_info_request ->
    ( get_celebrity_info_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_celebrity_info_request ->
    ( get_celebrity_info_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the name and additional information about a celebrity based on their Amazon Rekognition \
   ID. The additional information is returned as an array of URLs. If there is no additional \
   information about the celebrity, this list is empty.\n\n\
  \ For more information, see Getting information about a celebrity in the Amazon Rekognition \
   Developer Guide.\n\
  \ \n\
  \  This operation requires permissions to perform the [rekognition:GetCelebrityInfo] action. \n\
  \  "]

module DistributeDatasetEntries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    distribute_dataset_entries_request ->
    ( distribute_dataset_entries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    distribute_dataset_entries_request ->
    ( distribute_dataset_entries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Distributes the entries (images) in a training dataset across the training dataset and the \
   test dataset for a project. [DistributeDatasetEntries] moves 20% of the training dataset images \
   to the test dataset. An entry is a JSON Line that describes an image. \n\
  \   \n\
  \    You supply the Amazon Resource Names (ARN) of a project's training dataset and test \
   dataset. The training dataset must contain the images that you want to split. The test dataset \
   must be empty. The datasets must belong to the same project. To create training and test \
   datasets for a project, call [CreateDataset].\n\
  \    \n\
  \     Distributing a dataset takes a while to complete. To check the status call \
   [DescribeDataset]. The operation is complete when the [Status] field for the training dataset \
   and the test dataset is [UPDATE_COMPLETE]. If the dataset split fails, the value of [Status] is \
   [UPDATE_FAILED].\n\
  \     \n\
  \      This operation requires permissions to perform the [rekognition:DistributeDatasetEntries] \
   action.\n\
  \      "]

module DisassociateFaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_faces_request ->
    ( disassociate_faces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_faces_request ->
    ( disassociate_faces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association between a [Face] supplied in an array of [FaceIds] and the User. If the \
   User is not present already, then a [ResourceNotFound] exception is thrown. If successful, an \
   array of faces that are disassociated from the User is returned. If a given face is already \
   disassociated from the given UserID, it will be ignored and not be returned in the response. If \
   a given face is already associated with a different User or not found in the collection it will \
   be returned as part of [UnsuccessfulDisassociations]. You can remove 1 - 100 face IDs from a \
   user at one time.\n"]

module DetectText : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_text_request ->
    ( detect_text_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_text_request ->
    ( detect_text_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects text in the input image and converts it into machine-readable text.\n\n\
  \ Pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon \
   S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, you must pass it as a \
   reference to an image in an Amazon S3 bucket. For the AWS CLI, passing image bytes is not \
   supported. The image must be either a .png or .jpeg formatted file. \n\
  \ \n\
  \  The [DetectText] operation returns text in an array of [TextDetection] elements, \
   [TextDetections]. Each [TextDetection] element provides information about a single word or line \
   of text that was detected in the image. \n\
  \  \n\
  \   A word is one or more script characters that are not separated by spaces. [DetectText] can \
   detect up to 100 words in an image.\n\
  \   \n\
  \    A line is a string of equally spaced words. A line isn't necessarily a complete sentence. \
   For example, a driver's license number is detected as a line. A line ends when there is no \
   aligned text after it. Also, a line ends when there is a large gap between words, relative to \
   the length of the words. This means, depending on the gap between words, Amazon Rekognition may \
   detect multiple lines in text aligned in the same direction. Periods don't represent the end of \
   a line. If a sentence spans multiple lines, the [DetectText] operation returns multiple lines.\n\
  \    \n\
  \     To determine whether a [TextDetection] element is a line of text or a word, use the \
   [TextDetection] object [Type] field. \n\
  \     \n\
  \      To be detected, text must be within +/- 90 degrees orientation of the horizontal axis.\n\
  \      \n\
  \       For more information, see Detecting text in the Amazon Rekognition Developer Guide.\n\
  \       "]

module DetectProtectiveEquipment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_protective_equipment_request ->
    ( detect_protective_equipment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_protective_equipment_request ->
    ( detect_protective_equipment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects Personal Protective Equipment (PPE) worn by people detected in an image. Amazon \
   Rekognition can detect the following types of PPE.\n\n\
  \ {ul\n\
  \       {-  Face cover\n\
  \           \n\
  \            }\n\
  \       {-  Hand cover\n\
  \           \n\
  \            }\n\
  \       {-  Head cover\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   You pass the input image as base64-encoded image bytes or as a reference to an image in an \
   Amazon S3 bucket. The image must be either a PNG or JPG formatted file. \n\
  \   \n\
  \     [DetectProtectiveEquipment] detects PPE worn by up to 15 persons detected in an image.\n\
  \    \n\
  \     For each person detected in the image the API returns an array of body parts (face, head, \
   left-hand, right-hand). For each body part, an array of detected items of PPE is returned, \
   including an indicator of whether or not the PPE covers the body part. The API returns the \
   confidence it has in each detection (person, PPE, body part and body part coverage). It also \
   returns a bounding box ([BoundingBox]) for each detected person and each detected item of PPE. \n\
  \     \n\
  \      You can optionally request a summary of detected PPE items with the \
   [SummarizationAttributes] input parameter. The summary provides the following information. \n\
  \      \n\
  \       {ul\n\
  \             {-  The persons detected as wearing all of the types of PPE that you specify.\n\
  \                 \n\
  \                  }\n\
  \             {-  The persons detected as not wearing all of the types PPE that you specify.\n\
  \                 \n\
  \                  }\n\
  \             {-  The persons detected where PPE adornment could not be determined. \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   This is a stateless API operation. That is, the operation does not persist any data.\n\
  \   \n\
  \    This operation requires permissions to perform the [rekognition:DetectProtectiveEquipment] \
   action. \n\
  \    "]

module DetectModerationLabels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `HumanLoopQuotaExceededException of human_loop_quota_exceeded_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_moderation_labels_request ->
    ( detect_moderation_labels_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HumanLoopQuotaExceededException of human_loop_quota_exceeded_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_moderation_labels_request ->
    ( detect_moderation_labels_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `HumanLoopQuotaExceededException of human_loop_quota_exceeded_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects unsafe content in a specified JPEG or PNG format image. Use [DetectModerationLabels] to \
   moderate images depending on your requirements. For example, you might want to filter images \
   that contain nudity, but not images containing suggestive content.\n\n\
  \ To filter images, use the labels returned by [DetectModerationLabels] to determine which types \
   of content are appropriate.\n\
  \ \n\
  \  For information about moderation labels, see Detecting Unsafe Content in the Amazon \
   Rekognition Developer Guide.\n\
  \  \n\
  \   You pass the input image either as base64-encoded image bytes or as a reference to an image \
   in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing \
   image bytes is not supported. The image must be either a PNG or JPEG formatted file. \n\
  \   \n\
  \    You can specify an adapter to use when retrieving label predictions by providing a \
   [ProjectVersionArn] to the [ProjectVersion] argument.\n\
  \    "]

module DetectLabels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_labels_request ->
    ( detect_labels_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_labels_request ->
    ( detect_labels_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects instances of real-world entities within an image (JPEG or PNG) provided as input. This \
   includes objects like flower, tree, and table; events like wedding, graduation, and birthday \
   party; and concepts like landscape, evening, and nature. \n\n\
  \ For an example, see Analyzing images stored in an Amazon S3 bucket in the Amazon Rekognition \
   Developer Guide.\n\
  \ \n\
  \  You pass the input image as base64-encoded image bytes or as a reference to an image in an \
   Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image \
   bytes is not supported. The image must be either a PNG or JPEG formatted file. \n\
  \  \n\
  \    {b Optional Parameters} \n\
  \   \n\
  \    You can specify one or both of the [GENERAL_LABELS] and [IMAGE_PROPERTIES] feature types \
   when calling the DetectLabels API. Including [GENERAL_LABELS] will ensure the response includes \
   the labels detected in the input image, while including [IMAGE_PROPERTIES ]will ensure the \
   response includes information about the image quality and color.\n\
  \    \n\
  \     When using [GENERAL_LABELS] and/or [IMAGE_PROPERTIES] you can provide filtering criteria \
   to the Settings parameter. You can filter with sets of individual labels or with label \
   categories. You can specify inclusive filters, exclusive filters, or a combination of inclusive \
   and exclusive filters. For more information on filtering see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/labels-detect-labels-image.html}Detecting \
   Labels in an Image}.\n\
  \     \n\
  \      When getting labels, you can specify [MinConfidence] to control the confidence threshold \
   for the labels returned. The default is 55%. You can also add the [MaxLabels] parameter to \
   limit the number of labels returned. The default and upper limit is 1000 labels. These \
   arguments are only valid when supplying GENERAL_LABELS as a feature type.\n\
  \      \n\
  \        {b Response Elements} \n\
  \       \n\
  \         For each object, scene, and concept the API returns one or more labels. The API \
   returns the following types of information about labels:\n\
  \        \n\
  \         {ul\n\
  \               {-   Name - The name of the detected label. \n\
  \                   \n\
  \                    }\n\
  \               {-   Confidence - The level of confidence in the label assigned to a detected \
   object. \n\
  \                   \n\
  \                    }\n\
  \               {-   Parents - The ancestor labels for a detected label. DetectLabels returns a \
   hierarchical taxonomy of detected labels. For example, a detected car might be assigned the \
   label car. The label car has two parent labels: Vehicle (its parent) and Transportation (its \
   grandparent). The response includes the all ancestors for a label, where every ancestor is a \
   unique label. In the previous example, Car, Vehicle, and Transportation are returned as unique \
   labels in the response. \n\
  \                   \n\
  \                    }\n\
  \               {-   Aliases - Possible Aliases for the label. \n\
  \                   \n\
  \                    }\n\
  \               {-   Categories - The label categories that the detected label belongs to. \n\
  \                   \n\
  \                    }\n\
  \               {-   BoundingBox \226\128\148 Bounding boxes are described for all instances of \
   detected common object labels, returned in an array of Instance objects. An Instance object \
   contains a BoundingBox object, describing the location of the label on the input image. It also \
   includes the confidence for the accuracy of the detected bounding box. \n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \    The API returns the following information regarding the image, as part of the \
   ImageProperties structure:\n\
  \   \n\
  \    {ul\n\
  \          {-  Quality - Information about the Sharpness, Brightness, and Contrast of the input \
   image, scored between 0 to 100. Image quality is returned for the entire image, as well as the \
   background and the foreground. \n\
  \              \n\
  \               }\n\
  \          {-  Dominant Color - An array of the dominant colors in the image. \n\
  \              \n\
  \               }\n\
  \          {-  Foreground - Information about the sharpness, brightness, and dominant colors of \
   the input image\226\128\153s foreground. \n\
  \              \n\
  \               }\n\
  \          {-  Background - Information about the sharpness, brightness, and dominant colors of \
   the input image\226\128\153s background.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   The list of returned labels will include at least one label for every detected object, along \
   with information about that label. In the following example, suppose the input image has a \
   lighthouse, the sea, and a rock. The response includes all three labels, one for each object, \
   as well as the confidence in the label:\n\
  \   \n\
  \     [{Name: lighthouse, Confidence: 98.4629}] \n\
  \    \n\
  \      [{Name: rock,Confidence: 79.2097}] \n\
  \     \n\
  \       [ {Name: sea,Confidence: 75.061}] \n\
  \      \n\
  \       The list of labels can include multiple labels for the same object. For example, if the \
   input image shows a flower (for example, a tulip), the operation might return the following \
   three labels. \n\
  \       \n\
  \         [{Name: flower,Confidence: 99.0562}] \n\
  \        \n\
  \          [{Name: plant,Confidence: 99.0562}] \n\
  \         \n\
  \           [{Name: tulip,Confidence: 99.0562}] \n\
  \          \n\
  \           In this example, the detection algorithm more precisely identifies the flower as a \
   tulip.\n\
  \           \n\
  \             If the object detected is a person, the operation doesn't provide the same facial \
   details that the [DetectFaces] operation provides.\n\
  \             \n\
  \               This is a stateless API operation that doesn't return any data.\n\
  \               \n\
  \                This operation requires permissions to perform the [rekognition:DetectLabels] \
   action. \n\
  \                "]

module DetectFaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_faces_request ->
    ( detect_faces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_faces_request ->
    ( detect_faces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects faces within an image that is provided as input.\n\n\
  \  [DetectFaces] detects the 100 largest faces in the image. For each face detected, the \
   operation returns face details. These details include a bounding box of the face, a confidence \
   value (that the bounding box contains a face), and a fixed set of attributes such as facial \
   landmarks (for example, coordinates of eye and mouth), pose, presence of facial occlusion, and \
   so on.\n\
  \ \n\
  \  The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured \
   faces, the algorithm might not detect the faces or might detect faces with lower confidence. \n\
  \  \n\
  \   You pass the input image either as base64-encoded image bytes or as a reference to an image \
   in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing \
   image bytes is not supported. The image must be either a PNG or JPEG formatted file. \n\
  \   \n\
  \     This is a stateless API operation. That is, the operation does not persist any data.\n\
  \     \n\
  \       This operation requires permissions to perform the [rekognition:DetectFaces] action. \n\
  \       "]

module DetectCustomLabels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_custom_labels_request ->
    ( detect_custom_labels_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_custom_labels_request ->
    ( detect_custom_labels_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Detects custom labels in a supplied image by using an Amazon Rekognition Custom Labels model. \n\
  \   \n\
  \    You specify which version of a model version to use by using the [ProjectVersionArn] input \
   parameter. \n\
  \    \n\
  \     You pass the input image as base64-encoded image bytes or as a reference to an image in an \
   Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image \
   bytes is not supported. The image must be either a PNG or JPEG formatted file. \n\
  \     \n\
  \       For each object that the model version detects on an image, the API returns a \
   ([CustomLabel]) object in an array ([CustomLabels]). Each [CustomLabel] object provides the \
   label name ([Name]), the level of confidence that the image contains the object ([Confidence]), \
   and object location information, if it exists, for the label on the image ([Geometry]). \n\
  \      \n\
  \       To filter labels that are returned, specify a value for [MinConfidence]. \
   [DetectCustomLabelsLabels] only returns labels with a confidence that's higher than the \
   specified value. The value of [MinConfidence] maps to the assumed threshold values created \
   during training. For more information, see {i Assumed threshold} in the Amazon Rekognition \
   Custom Labels Developer Guide. Amazon Rekognition Custom Labels metrics expresses an assumed \
   threshold as a floating point value between 0-1. The range of [MinConfidence] normalizes the \
   threshold value to a percentage value (0-100). Confidence responses from [DetectCustomLabels] \
   are also returned as a percentage. You can use [MinConfidence] to change the precision and \
   recall or your model. For more information, see {i Analyzing an image} in the Amazon \
   Rekognition Custom Labels Developer Guide. \n\
  \       \n\
  \        If you don't specify a value for [MinConfidence], [DetectCustomLabels] returns labels \
   based on the assumed threshold of each label.\n\
  \        \n\
  \         This is a stateless API operation. That is, the operation does not persist any data.\n\
  \         \n\
  \          This operation requires permissions to perform the [rekognition:DetectCustomLabels] \
   action. \n\
  \          \n\
  \           For more information, see {i Analyzing an image} in the Amazon Rekognition Custom \
   Labels Developer Guide. \n\
  \           "]

module DescribeStreamProcessor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stream_processor_request ->
    ( describe_stream_processor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stream_processor_request ->
    ( describe_stream_processor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information about a stream processor created by [CreateStreamProcessor]. You can get \
   information about the input and output streams, the input parameters for the face recognition \
   being performed, and the current status of the stream processor.\n"]

module DescribeProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_projects_request ->
    ( describe_projects_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_projects_request ->
    ( describe_projects_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about your Rekognition projects.\n\n\
  \ This operation requires permissions to perform the [rekognition:DescribeProjects] action.\n\
  \ "]

module DescribeProjectVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidPaginationTokenException of invalid_pagination_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_project_versions_request ->
    ( describe_project_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_project_versions_request ->
    ( describe_project_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidPaginationTokenException of invalid_pagination_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists and describes the versions of an Amazon Rekognition project. You can specify up to 10 \
   model or adapter versions in [ProjectVersionArns]. If you don't specify a value, descriptions \
   for all model/adapter versions in the project are returned.\n\n\
  \ This operation requires permissions to perform the [rekognition:DescribeProjectVersions] action.\n\
  \ "]

module DescribeDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \    Describes an Amazon Rekognition Custom Labels dataset. You can get information such as the \
   current status of a dataset and statistics about the images and labels in a dataset. \n\
  \   \n\
  \    This operation requires permissions to perform the [rekognition:DescribeDataset] action.\n\
  \    "]

module DescribeCollection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_collection_request ->
    ( describe_collection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_collection_request ->
    ( describe_collection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified collection. You can use [DescribeCollection] to get information, such \
   as the number of faces indexed into a collection and the version of the model used by the \
   collection for face detection.\n\n\
  \ For more information, see Describing a Collection in the Amazon Rekognition Developer Guide.\n\
  \ "]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified UserID within the collection. Faces that are associated with the UserID \
   are disassociated from the UserID before deleting the specified UserID. If the specified \
   [Collection] or [UserID] is already deleted or not found, a [ResourceNotFoundException] will be \
   thrown. If the action is successful with a 200 response, an empty HTTP body is returned. \n"]

module DeleteStreamProcessor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_stream_processor_request ->
    ( delete_stream_processor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_stream_processor_request ->
    ( delete_stream_processor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the stream processor identified by [Name]. You assign the value for [Name] when you \
   create the stream processor with [CreateStreamProcessor]. You might not be able to use the same \
   name for a stream processor for a few seconds after calling [DeleteStreamProcessor].\n"]

module DeleteProjectVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_project_version_request ->
    ( delete_project_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_project_version_request ->
    ( delete_project_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a Rekognition project model or project version, like a Amazon Rekognition Custom Labels \
   model or a custom adapter.\n\n\
  \ You can't delete a project version if it is running or if it is training. To check the status \
   of a project version, use the Status field returned from [DescribeProjectVersions]. To stop a \
   project version call [StopProjectVersion]. If the project version is training, wait until it \
   finishes.\n\
  \ \n\
  \  This operation requires permissions to perform the [rekognition:DeleteProjectVersion] action. \n\
  \  "]

module DeleteProjectPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidPolicyRevisionIdException of invalid_policy_revision_id_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_project_policy_request ->
    ( delete_project_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPolicyRevisionIdException of invalid_policy_revision_id_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_project_policy_request ->
    ( delete_project_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidPolicyRevisionIdException of invalid_policy_revision_id_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Deletes an existing project policy.\n\
  \   \n\
  \    To get a list of project policies attached to a project, call [ListProjectPolicies]. To \
   attach a project policy to a project, call [PutProjectPolicy].\n\
  \    \n\
  \     This operation requires permissions to perform the [rekognition:DeleteProjectPolicy] action.\n\
  \     "]

module DeleteProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_project_request ->
    ( delete_project_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_project_request ->
    ( delete_project_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a Amazon Rekognition project. To delete a project you must first delete all models or \
   adapters associated with the project. To delete a model or adapter, see \
   [DeleteProjectVersion].\n\n\
  \  [DeleteProject] is an asynchronous operation. To check if the project is deleted, call \
   [DescribeProjects]. The project is deleted when the project no longer appears in the response. \
   Be aware that deleting a given project will also delete any [ProjectPolicies] associated with \
   that project.\n\
  \ \n\
  \  This operation requires permissions to perform the [rekognition:DeleteProject] action. \n\
  \  "]

module DeleteFaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_faces_request ->
    ( delete_faces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_faces_request ->
    ( delete_faces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes faces from a collection. You specify a collection ID and an array of face IDs to remove \
   from the collection.\n\n\
  \ This operation requires permissions to perform the [rekognition:DeleteFaces] action.\n\
  \ "]

module DeleteDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_request ->
    ( delete_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_request ->
    ( delete_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Deletes an existing Amazon Rekognition Custom Labels dataset. Deleting a dataset might take \
   while. Use [DescribeDataset] to check the current status. The dataset is still deleting if the \
   value of [Status] is [DELETE_IN_PROGRESS]. If you try to access the dataset after it is \
   deleted, you get a [ResourceNotFoundException] exception. \n\
  \   \n\
  \    You can't delete a dataset while it is creating ([Status] = [CREATE_IN_PROGRESS]) or if the \
   dataset is updating ([Status] = [UPDATE_IN_PROGRESS]).\n\
  \    \n\
  \     This operation requires permissions to perform the [rekognition:DeleteDataset] action.\n\
  \     "]

module DeleteCollection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_collection_request ->
    ( delete_collection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_collection_request ->
    ( delete_collection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified collection. Note that this operation removes all faces in the collection. \
   For an example, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/delete-collection-procedure.html}Deleting \
   a collection}.\n\n\
  \ This operation requires permissions to perform the [rekognition:DeleteCollection] action.\n\
  \ "]

module CreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new User within a collection specified by [CollectionId]. Takes [UserId] as a \
   parameter, which is a user provided ID which should be unique within the collection. The \
   provided [UserId] will alias the system generated UUID to make the [UserId] more user friendly. \
   \n\n\
  \ Uses a [ClientToken], an idempotency token that ensures a call to [CreateUser] completes only \
   once. If the value is not supplied, the AWS SDK generates an idempotency token for the \
   requests. This prevents retries after a network error results from making multiple [CreateUser] \
   calls. \n\
  \ "]

module CreateStreamProcessor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_stream_processor_request ->
    ( create_stream_processor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_stream_processor_request ->
    ( create_stream_processor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Rekognition stream processor that you can use to detect and recognize faces \
   or to detect labels in a streaming video.\n\n\
  \ Amazon Rekognition Video is a consumer of live video from Amazon Kinesis Video Streams. There \
   are two different settings for stream processors in Amazon Rekognition: detecting faces and \
   detecting labels.\n\
  \ \n\
  \  {ul\n\
  \        {-  If you are creating a stream processor for detecting faces, you provide as input a \
   Kinesis video stream ([Input]) and a Kinesis data stream ([Output]) stream for receiving the \
   output. You must use the [FaceSearch] option in [Settings], specifying the collection that \
   contains the faces you want to recognize. After you have finished analyzing a streaming video, \
   use [StopStreamProcessor] to stop processing.\n\
  \            \n\
  \             }\n\
  \        {-  If you are creating a stream processor to detect labels, you provide as input a \
   Kinesis video stream ([Input]), Amazon S3 bucket information ([Output]), and an Amazon SNS \
   topic ARN ([NotificationChannel]). You can also provide a KMS key ID to encrypt the data sent \
   to your Amazon S3 bucket. You specify what you want to detect by using the [ConnectedHome] \
   option in settings, and selecting one of the following: [PERSON], [PET], [PACKAGE], [ALL] You \
   can also specify where in the frame you want Amazon Rekognition to monitor with \
   [RegionsOfInterest]. When you run the [StartStreamProcessor] operation on a label detection \
   stream processor, you input start and stop information to determine the length of the \
   processing time.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    Use [Name] to assign an identifier for the stream processor. You use [Name] to manage the \
   stream processor. For example, you can start processing the source video by calling \
   [StartStreamProcessor] with the [Name] field. \n\
  \   \n\
  \    This operation requires permissions to perform the [rekognition:CreateStreamProcessor] \
   action. If you want to tag your stream processor, you also require permission to perform the \
   [rekognition:TagResource] operation.\n\
  \    "]

module CreateProjectVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_project_version_request ->
    ( create_project_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_project_version_request ->
    ( create_project_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new version of Amazon Rekognition project (like a Custom Labels model or a custom \
   adapter) and begins training. Models and adapters are managed as part of a Rekognition project. \
   The response from [CreateProjectVersion] is an Amazon Resource Name (ARN) for the project \
   version. \n\n\
  \ The FeatureConfig operation argument allows you to configure specific model or adapter \
   settings. You can provide a description to the project version by using the VersionDescription \
   argment. Training can take a while to complete. You can get the current status by calling \
   [DescribeProjectVersions]. Training completed successfully if the value of the [Status] field \
   is [TRAINING_COMPLETED]. Once training has successfully completed, call \
   [DescribeProjectVersions] to get the training results and evaluate the model.\n\
  \ \n\
  \  This operation requires permissions to perform the [rekognition:CreateProjectVersion] action.\n\
  \  \n\
  \     {i The following applies only to projects with Amazon Rekognition Custom Labels as the \
   chosen feature:} \n\
  \    \n\
  \     You can train a model in a project that doesn't have associated datasets by specifying \
   manifest files in the [TrainingData] and [TestingData] fields. \n\
  \     \n\
  \      If you open the console after training a model with manifest files, Amazon Rekognition \
   Custom Labels creates the datasets for you using the most recent manifest files. You can no \
   longer train a model version for the project by specifying manifest files. \n\
  \      \n\
  \       Instead of training with a project without associated datasets, we recommend that you \
   use the manifest files to create training and test datasets for the project.\n\
  \       \n\
  \         \n\
  \         "]

module CreateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_project_request ->
    ( create_project_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_project_request ->
    ( create_project_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon Rekognition project. A project is a group of resources (datasets, model \
   versions) that you use to create and manage a Amazon Rekognition Custom Labels Model or custom \
   adapter. You can specify a feature to create the project with, if no feature is specified then \
   Custom Labels is used by default. For adapters, you can also choose whether or not to have the \
   project auto update by using the AutoUpdate argument. This operation requires permissions to \
   perform the [rekognition:CreateProject] action.\n"]

module CreateFaceLivenessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_face_liveness_session_request ->
    ( create_face_liveness_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_face_liveness_session_request ->
    ( create_face_liveness_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API operation initiates a Face Liveness session. It returns a [SessionId], which you can \
   use to start streaming Face Liveness video and get the results for a Face Liveness session. \n\n\
  \ You can use the [OutputConfig] option in the Settings parameter to provide an Amazon S3 bucket \
   location. The Amazon S3 bucket stores reference images and audit images. If no Amazon S3 bucket \
   is defined, raw bytes are sent instead. \n\
  \ \n\
  \  You can use [AuditImagesLimit] to limit the number of audit images returned when \
   [GetFaceLivenessSessionResults] is called. This number is between 0 and 4. By default, it is \
   set to 0. The limit is best effort and based on the duration of the selfie-video. \n\
  \  "]

module CreateDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Creates a new Amazon Rekognition Custom Labels dataset. You can create a dataset by using an \
   Amazon Sagemaker format manifest file or by copying an existing Amazon Rekognition Custom \
   Labels dataset.\n\
  \   \n\
  \    To create a training dataset for a project, specify [TRAIN] for the value of [DatasetType]. \
   To create the test dataset for a project, specify [TEST] for the value of [DatasetType]. \n\
  \    \n\
  \     The response from [CreateDataset] is the Amazon Resource Name (ARN) for the dataset. \
   Creating a dataset takes a while to complete. Use [DescribeDataset] to check the current \
   status. The dataset created successfully if the value of [Status] is [CREATE_COMPLETE]. \n\
  \     \n\
  \      To check if any non-terminal errors occurred, call [ListDatasetEntries] and check for the \
   presence of [errors] lists in the JSON Lines.\n\
  \      \n\
  \       Dataset creation fails if a terminal error occurs ([Status] = [CREATE_FAILED]). \
   Currently, you can't access the terminal error information. \n\
  \       \n\
  \        For more information, see Creating dataset in the {i Amazon Rekognition Custom Labels \
   Developer Guide}.\n\
  \        \n\
  \         This operation requires permissions to perform the [rekognition:CreateDataset] action. \
   If you want to copy an existing dataset, you also require permission to perform the \
   [rekognition:ListDatasetEntries] action.\n\
  \         "]

module CreateCollection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_collection_request ->
    ( create_collection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_collection_request ->
    ( create_collection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a collection in an AWS Region. You can add faces to the collection using the \
   [IndexFaces] operation. \n\n\
  \ For example, you might create collections, one for each of your application users. A user can \
   then index faces using the [IndexFaces] operation and persist results in a specific collection. \
   Then, a user can search the collection for faces in the user-specific container. \n\
  \ \n\
  \  When you create a collection, it is associated with the latest version of the face model \
   version.\n\
  \  \n\
  \    Collection names are case-sensitive.\n\
  \    \n\
  \      This operation requires permissions to perform the [rekognition:CreateCollection] action. \
   If you want to tag your collection, you also require permission to perform the \
   [rekognition:TagResource] operation.\n\
  \      "]

module CopyProjectVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_project_version_request ->
    ( copy_project_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_project_version_request ->
    ( copy_project_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This operation applies only to Amazon Rekognition Custom Labels.\n\
  \ \n\
  \   Copies a version of an Amazon Rekognition Custom Labels model from a source project to a \
   destination project. The source and destination projects can be in different AWS accounts but \
   must be in the same AWS Region. You can't copy a model to another AWS service. \n\
  \   \n\
  \    To copy a model version to a different AWS account, you need to create a resource-based \
   policy known as a {i project policy}. You attach the project policy to the source project by \
   calling [PutProjectPolicy]. The project policy gives permission to copy the model version from \
   a trusting AWS account to a trusted account.\n\
  \    \n\
  \     For more information creating and attaching a project policy, see Attaching a project \
   policy (SDK) in the {i Amazon Rekognition Custom Labels Developer Guide}. \n\
  \     \n\
  \      If you are copying a model version to a project in the same AWS account, you don't need \
   to create a project policy.\n\
  \      \n\
  \        Copying project versions is supported only for Custom Labels models. \n\
  \        \n\
  \         To copy a model, the destination project, source project, and source model version \
   must already exist.\n\
  \         \n\
  \           Copying a model version takes a while to complete. To get the current status, call \
   [DescribeProjectVersions] and check the value of [Status] in the [ProjectVersionDescription] \
   object. The copy operation has finished when the value of [Status] is [COPYING_COMPLETED].\n\
  \           \n\
  \            This operation requires permissions to perform the [rekognition:CopyProjectVersion] \
   action.\n\
  \            "]

module CompareFaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ImageTooLargeException of image_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidImageFormatException of invalid_image_format_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    compare_faces_request ->
    ( compare_faces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    compare_faces_request ->
    ( compare_faces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ImageTooLargeException of image_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidImageFormatException of invalid_image_format_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Compares a face in the {i source} input image with each of the 100 largest faces detected in \
   the {i target} input image. \n\n\
  \  If the source image contains multiple faces, the service detects the largest face and \
   compares it with each face detected in the target image. \n\
  \ \n\
  \   CompareFaces uses machine learning algorithms, which are probabilistic. A false negative is \
   an incorrect prediction that a face in the target image has a low similarity confidence score \
   when compared to the face in the source image. To reduce the probability of false negatives, we \
   recommend that you compare the target image against multiple source images. If you plan to use \
   [CompareFaces] to make a decision that impacts an individual's rights, privacy, or access to \
   services, we recommend that you pass the result to a human for review and further validation \
   before taking action.\n\
  \   \n\
  \     You pass the input and target images either as base64-encoded image bytes or as references \
   to images in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, \
   passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. \n\
  \     \n\
  \      In response, the operation returns an array of face matches ordered by similarity score \
   in descending order. For each face match, the response provides a bounding box of the face, \
   facial landmarks, pose details (pitch, roll, and yaw), quality (brightness and sharpness), and \
   confidence value (indicating the level of confidence that the bounding box contains a face). \
   The response also provides a similarity score, which indicates how closely the faces match. \n\
  \      \n\
  \        By default, only faces with a similarity score of greater than or equal to 80% are \
   returned in the response. You can change this value by specifying the [SimilarityThreshold] \
   parameter.\n\
  \        \n\
  \           [CompareFaces] also returns an array of faces that don't match the source image. For \
   each face, it returns a bounding box, confidence value, landmarks, pose details, and quality. \
   The response also returns information about the face in the source image, including the \
   bounding box of the face and confidence value.\n\
  \          \n\
  \           The [QualityFilter] input parameter allows you to filter out detected faces that \
   don\226\128\153t meet a required quality bar. The quality bar is based on a variety of common \
   use cases. Use [QualityFilter] to set the quality bar by specifying [LOW], [MEDIUM], or [HIGH]. \
   If you do not want to filter detected faces, specify [NONE]. The default value is [NONE]. \n\
  \           \n\
  \            If the image doesn't contain Exif metadata, [CompareFaces] returns orientation \
   information for the source and target images. Use these values to display the images with the \
   correct image orientation.\n\
  \            \n\
  \             If no faces are detected in the source or target images, [CompareFaces] returns an \
   [InvalidParameterException] error. \n\
  \             \n\
  \                This is a stateless API operation. That is, data returned by this operation \
   doesn't persist.\n\
  \               \n\
  \                 For an example, see Comparing Faces in Images in the Amazon Rekognition \
   Developer Guide.\n\
  \                 \n\
  \                  This operation requires permissions to perform the [rekognition:CompareFaces] \
   action.\n\
  \                  "]

(** {1:Serialization and Deserialization} *)
module AssociateFaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_faces_request ->
    ( associate_faces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_faces_request ->
    ( associate_faces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates one or more faces with an existing UserID. Takes an array of [FaceIds]. Each \
   [FaceId] that are present in the [FaceIds] list is associated with the provided UserID. The \
   number of FaceIds that can be used as input in a single request is limited to 100.\n\n\
  \ Note that the total number of faces that can be associated with a single [UserID] is also \
   limited to 100. Once a [UserID] has 100 faces associated with it, no additional faces can be \
   added. If more API calls are made after the limit is reached, a [ServiceQuotaExceededException] \
   will result.\n\
  \ \n\
  \  The [UserMatchThreshold] parameter specifies the minimum user match confidence required for \
   the face to be associated with a UserID that has at least one [FaceID] already associated. This \
   ensures that the [FaceIds] are associated with the right UserID. The value ranges from 0-100 \
   and default value is 75. \n\
  \  \n\
  \   If successful, an array of [AssociatedFace] objects containing the associated [FaceIds] is \
   returned. If a given face is already associated with the given [UserID], it will be ignored and \
   will not be returned in the response. If a given face is already associated to a different \
   [UserID], isn't found in the collection, doesn\226\128\153t meet the [UserMatchThreshold], or \
   there are already 100 faces associated with the [UserID], it will be returned as part of an \
   array of [UnsuccessfulFaceAssociations.] \n\
  \   \n\
  \    The [UserStatus] reflects the status of an operation which updates a UserID representation \
   with a list of given faces. The [UserStatus] can be: \n\
  \    \n\
  \     {ul\n\
  \           {-  ACTIVE - All associations or disassociations of FaceID(s) for a UserID are \
   complete.\n\
  \               \n\
  \                }\n\
  \           {-  CREATED - A UserID has been created, but has no FaceID(s) associated with it.\n\
  \               \n\
  \                }\n\
  \           {-  UPDATING - A UserID is being updated and there are current associations or \
   disassociations of FaceID(s) taking place.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
