open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let video_too_large_exception_to_yojson (x : video_too_large_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let u_long_to_yojson = long_to_yojson
let float__to_yojson = float_to_yojson

let video_color_range_to_yojson (x : video_color_range) =
  match x with LIMITED -> `String "LIMITED" | FULL -> `String "FULL"

let video_metadata_to_yojson (x : video_metadata) =
  assoc_to_yojson
    [
      ("ColorRange", option_to_yojson video_color_range_to_yojson x.color_range);
      ("FrameWidth", option_to_yojson u_long_to_yojson x.frame_width);
      ("FrameHeight", option_to_yojson u_long_to_yojson x.frame_height);
      ("FrameRate", option_to_yojson float__to_yojson x.frame_rate);
      ("Format", option_to_yojson string__to_yojson x.format);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("Codec", option_to_yojson string__to_yojson x.codec);
    ]

let video_metadata_list_to_yojson tree = list_to_yojson video_metadata_to_yojson tree

let video_job_status_to_yojson (x : video_job_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let s3_bucket_to_yojson = string_to_yojson
let s3_object_name_to_yojson = string_to_yojson
let s3_object_version_to_yojson = string_to_yojson

let s3_object_to_yojson (x : s3_object) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson s3_object_version_to_yojson x.version);
      ("Name", option_to_yojson s3_object_name_to_yojson x.name);
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
    ]

let video_to_yojson (x : video) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let version_to_yojson = string_to_yojson

let versions_to_yojson (x : versions) =
  assoc_to_yojson
    [
      ("Maximum", option_to_yojson version_to_yojson x.maximum);
      ("Minimum", option_to_yojson version_to_yojson x.minimum);
    ]

let version_name_to_yojson = string_to_yojson
let version_names_to_yojson tree = list_to_yojson version_name_to_yojson tree
let version_description_to_yojson = string_to_yojson

let ground_truth_manifest_to_yojson (x : ground_truth_manifest) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let asset_to_yojson (x : asset) =
  assoc_to_yojson
    [
      ( "GroundTruthManifest",
        option_to_yojson ground_truth_manifest_to_yojson x.ground_truth_manifest );
    ]

let assets_to_yojson tree = list_to_yojson asset_to_yojson tree

let validation_data_to_yojson (x : validation_data) =
  assoc_to_yojson [ ("Assets", option_to_yojson assets_to_yojson x.assets) ]

let user_status_to_yojson (x : user_status) =
  match x with
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"

let percent_to_yojson = float_to_yojson
let user_id_to_yojson = string_to_yojson

let matched_user_to_yojson (x : matched_user) =
  assoc_to_yojson
    [
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
    ]

let user_match_to_yojson (x : user_match) =
  assoc_to_yojson
    [
      ("User", option_to_yojson matched_user_to_yojson x.user);
      ("Similarity", option_to_yojson percent_to_yojson x.similarity);
    ]

let user_match_list_to_yojson tree = list_to_yojson user_match_to_yojson tree

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
    ]

let user_list_to_yojson tree = list_to_yojson user_to_yojson tree
let face_id_to_yojson = string_to_yojson
let user_face_id_list_to_yojson tree = list_to_yojson face_id_to_yojson tree
let url_to_yojson = string_to_yojson
let urls_to_yojson tree = list_to_yojson url_to_yojson tree
let update_stream_processor_response_to_yojson = unit_to_yojson
let stream_processor_name_to_yojson = string_to_yojson
let connected_home_label_to_yojson = string_to_yojson
let connected_home_labels_to_yojson tree = list_to_yojson connected_home_label_to_yojson tree

let connected_home_settings_for_update_to_yojson (x : connected_home_settings_for_update) =
  assoc_to_yojson
    [
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("Labels", option_to_yojson connected_home_labels_to_yojson x.labels);
    ]

let stream_processor_settings_for_update_to_yojson (x : stream_processor_settings_for_update) =
  assoc_to_yojson
    [
      ( "ConnectedHomeForUpdate",
        option_to_yojson connected_home_settings_for_update_to_yojson x.connected_home_for_update );
    ]

let bounding_box_to_yojson (x : bounding_box) =
  assoc_to_yojson
    [
      ("Top", option_to_yojson float__to_yojson x.top);
      ("Left", option_to_yojson float__to_yojson x.left);
      ("Height", option_to_yojson float__to_yojson x.height);
      ("Width", option_to_yojson float__to_yojson x.width);
    ]

let point_to_yojson (x : point) =
  assoc_to_yojson
    [ ("Y", option_to_yojson float__to_yojson x.y); ("X", option_to_yojson float__to_yojson x.x) ]

let polygon_to_yojson tree = list_to_yojson point_to_yojson tree

let region_of_interest_to_yojson (x : region_of_interest) =
  assoc_to_yojson
    [
      ("Polygon", option_to_yojson polygon_to_yojson x.polygon);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let regions_of_interest_to_yojson tree = list_to_yojson region_of_interest_to_yojson tree
let boolean__to_yojson = bool_to_yojson

let stream_processor_data_sharing_preference_to_yojson
    (x : stream_processor_data_sharing_preference) =
  assoc_to_yojson [ ("OptIn", Some (boolean__to_yojson x.opt_in)) ]

let stream_processor_parameter_to_delete_to_yojson (x : stream_processor_parameter_to_delete) =
  match x with
  | RegionsOfInterest -> `String "RegionsOfInterest"
  | ConnectedHomeMinConfidence -> `String "ConnectedHomeMinConfidence"

let stream_processor_parameters_to_delete_to_yojson tree =
  list_to_yojson stream_processor_parameter_to_delete_to_yojson tree

let update_stream_processor_request_to_yojson (x : update_stream_processor_request) =
  assoc_to_yojson
    [
      ( "ParametersToDelete",
        option_to_yojson stream_processor_parameters_to_delete_to_yojson x.parameters_to_delete );
      ( "DataSharingPreferenceForUpdate",
        option_to_yojson stream_processor_data_sharing_preference_to_yojson
          x.data_sharing_preference_for_update );
      ( "RegionsOfInterestForUpdate",
        option_to_yojson regions_of_interest_to_yojson x.regions_of_interest_for_update );
      ( "SettingsForUpdate",
        option_to_yojson stream_processor_settings_for_update_to_yojson x.settings_for_update );
      ("Name", Some (stream_processor_name_to_yojson x.name));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let provisioned_throughput_exceeded_exception_to_yojson
    (x : provisioned_throughput_exceeded_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let update_dataset_entries_response_to_yojson = unit_to_yojson
let dataset_arn_to_yojson = string_to_yojson
let ground_truth_blob_to_yojson = blob_to_yojson

let dataset_changes_to_yojson (x : dataset_changes) =
  assoc_to_yojson [ ("GroundTruth", Some (ground_truth_blob_to_yojson x.ground_truth)) ]

let update_dataset_entries_request_to_yojson (x : update_dataset_entries_request) =
  assoc_to_yojson
    [
      ("Changes", Some (dataset_changes_to_yojson x.changes));
      ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let unsuccessful_face_disassociation_reason_to_yojson (x : unsuccessful_face_disassociation_reason)
    =
  match x with
  | ASSOCIATED_TO_A_DIFFERENT_USER -> `String "ASSOCIATED_TO_A_DIFFERENT_USER"
  | FACE_NOT_FOUND -> `String "FACE_NOT_FOUND"

let unsuccessful_face_disassociation_reasons_to_yojson tree =
  list_to_yojson unsuccessful_face_disassociation_reason_to_yojson tree

let unsuccessful_face_disassociation_to_yojson (x : unsuccessful_face_disassociation) =
  assoc_to_yojson
    [
      ("Reasons", option_to_yojson unsuccessful_face_disassociation_reasons_to_yojson x.reasons);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
    ]

let unsuccessful_face_disassociation_list_to_yojson tree =
  list_to_yojson unsuccessful_face_disassociation_to_yojson tree

let unsuccessful_face_deletion_reason_to_yojson (x : unsuccessful_face_deletion_reason) =
  match x with
  | FACE_NOT_FOUND -> `String "FACE_NOT_FOUND"
  | ASSOCIATED_TO_AN_EXISTING_USER -> `String "ASSOCIATED_TO_AN_EXISTING_USER"

let unsuccessful_face_deletion_reasons_to_yojson tree =
  list_to_yojson unsuccessful_face_deletion_reason_to_yojson tree

let unsuccessful_face_deletion_to_yojson (x : unsuccessful_face_deletion) =
  assoc_to_yojson
    [
      ("Reasons", option_to_yojson unsuccessful_face_deletion_reasons_to_yojson x.reasons);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
    ]

let unsuccessful_face_deletions_list_to_yojson tree =
  list_to_yojson unsuccessful_face_deletion_to_yojson tree

let unsuccessful_face_association_reason_to_yojson (x : unsuccessful_face_association_reason) =
  match x with
  | LOW_MATCH_CONFIDENCE -> `String "LOW_MATCH_CONFIDENCE"
  | ASSOCIATED_TO_A_DIFFERENT_USER -> `String "ASSOCIATED_TO_A_DIFFERENT_USER"
  | FACE_NOT_FOUND -> `String "FACE_NOT_FOUND"

let unsuccessful_face_association_reasons_to_yojson tree =
  list_to_yojson unsuccessful_face_association_reason_to_yojson tree

let unsuccessful_face_association_to_yojson (x : unsuccessful_face_association) =
  assoc_to_yojson
    [
      ("Reasons", option_to_yojson unsuccessful_face_association_reasons_to_yojson x.reasons);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
    ]

let unsuccessful_face_association_list_to_yojson tree =
  list_to_yojson unsuccessful_face_association_to_yojson tree

let u_integer_to_yojson = int_to_yojson

let age_range_to_yojson (x : age_range) =
  assoc_to_yojson
    [
      ("High", option_to_yojson u_integer_to_yojson x.high);
      ("Low", option_to_yojson u_integer_to_yojson x.low);
    ]

let smile_to_yojson (x : smile) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let eyeglasses_to_yojson (x : eyeglasses) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let sunglasses_to_yojson (x : sunglasses) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let gender_type_to_yojson (x : gender_type) =
  match x with Female -> `String "Female" | Male -> `String "Male"

let gender_to_yojson (x : gender) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson gender_type_to_yojson x.value);
    ]

let beard_to_yojson (x : beard) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let mustache_to_yojson (x : mustache) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let eye_open_to_yojson (x : eye_open) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let mouth_open_to_yojson (x : mouth_open) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let emotion_name_to_yojson (x : emotion_name) =
  match x with
  | FEAR -> `String "FEAR"
  | UNKNOWN -> `String "UNKNOWN"
  | CALM -> `String "CALM"
  | SURPRISED -> `String "SURPRISED"
  | DISGUSTED -> `String "DISGUSTED"
  | CONFUSED -> `String "CONFUSED"
  | ANGRY -> `String "ANGRY"
  | SAD -> `String "SAD"
  | HAPPY -> `String "HAPPY"

let emotion_to_yojson (x : emotion) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Type", option_to_yojson emotion_name_to_yojson x.type_);
    ]

let emotions_to_yojson tree = list_to_yojson emotion_to_yojson tree

let landmark_type_to_yojson (x : landmark_type) =
  match x with
  | UpperJawlineRight -> `String "upperJawlineRight"
  | MidJawlineRight -> `String "midJawlineRight"
  | ChinBottom -> `String "chinBottom"
  | MidJawlineLeft -> `String "midJawlineLeft"
  | UpperJawlineLeft -> `String "upperJawlineLeft"
  | RightPupil -> `String "rightPupil"
  | LeftPupil -> `String "leftPupil"
  | MouthDown -> `String "mouthDown"
  | MouthUp -> `String "mouthUp"
  | NoseRight -> `String "noseRight"
  | NoseLeft -> `String "noseLeft"
  | RightEyeDown -> `String "rightEyeDown"
  | RightEyeUp -> `String "rightEyeUp"
  | RightEyeRight -> `String "rightEyeRight"
  | RightEyeLeft -> `String "rightEyeLeft"
  | LeftEyeDown -> `String "leftEyeDown"
  | LeftEyeUp -> `String "leftEyeUp"
  | LeftEyeRight -> `String "leftEyeRight"
  | LeftEyeLeft -> `String "leftEyeLeft"
  | RightEyeBrowUp -> `String "rightEyeBrowUp"
  | RightEyeBrowRight -> `String "rightEyeBrowRight"
  | RightEyeBrowLeft -> `String "rightEyeBrowLeft"
  | LeftEyeBrowUp -> `String "leftEyeBrowUp"
  | LeftEyeBrowRight -> `String "leftEyeBrowRight"
  | LeftEyeBrowLeft -> `String "leftEyeBrowLeft"
  | MouthRight -> `String "mouthRight"
  | MouthLeft -> `String "mouthLeft"
  | Nose -> `String "nose"
  | EyeRight -> `String "eyeRight"
  | EyeLeft -> `String "eyeLeft"

let landmark_to_yojson (x : landmark) =
  assoc_to_yojson
    [
      ("Y", option_to_yojson float__to_yojson x.y);
      ("X", option_to_yojson float__to_yojson x.x);
      ("Type", option_to_yojson landmark_type_to_yojson x.type_);
    ]

let landmarks_to_yojson tree = list_to_yojson landmark_to_yojson tree
let degree_to_yojson = float_to_yojson

let pose_to_yojson (x : pose) =
  assoc_to_yojson
    [
      ("Pitch", option_to_yojson degree_to_yojson x.pitch);
      ("Yaw", option_to_yojson degree_to_yojson x.yaw);
      ("Roll", option_to_yojson degree_to_yojson x.roll);
    ]

let image_quality_to_yojson (x : image_quality) =
  assoc_to_yojson
    [
      ("Sharpness", option_to_yojson float__to_yojson x.sharpness);
      ("Brightness", option_to_yojson float__to_yojson x.brightness);
    ]

let face_occluded_to_yojson (x : face_occluded) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let eye_direction_to_yojson (x : eye_direction) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Pitch", option_to_yojson degree_to_yojson x.pitch);
      ("Yaw", option_to_yojson degree_to_yojson x.yaw);
    ]

let face_detail_to_yojson (x : face_detail) =
  assoc_to_yojson
    [
      ("EyeDirection", option_to_yojson eye_direction_to_yojson x.eye_direction);
      ("FaceOccluded", option_to_yojson face_occluded_to_yojson x.face_occluded);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Quality", option_to_yojson image_quality_to_yojson x.quality);
      ("Pose", option_to_yojson pose_to_yojson x.pose);
      ("Landmarks", option_to_yojson landmarks_to_yojson x.landmarks);
      ("Emotions", option_to_yojson emotions_to_yojson x.emotions);
      ("MouthOpen", option_to_yojson mouth_open_to_yojson x.mouth_open);
      ("EyesOpen", option_to_yojson eye_open_to_yojson x.eyes_open);
      ("Mustache", option_to_yojson mustache_to_yojson x.mustache);
      ("Beard", option_to_yojson beard_to_yojson x.beard);
      ("Gender", option_to_yojson gender_to_yojson x.gender);
      ("Sunglasses", option_to_yojson sunglasses_to_yojson x.sunglasses);
      ("Eyeglasses", option_to_yojson eyeglasses_to_yojson x.eyeglasses);
      ("Smile", option_to_yojson smile_to_yojson x.smile);
      ("AgeRange", option_to_yojson age_range_to_yojson x.age_range);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let unsearched_face_reason_to_yojson (x : unsearched_face_reason) =
  match x with
  | LOW_FACE_QUALITY -> `String "LOW_FACE_QUALITY"
  | SMALL_BOUNDING_BOX -> `String "SMALL_BOUNDING_BOX"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | LOW_SHARPNESS -> `String "LOW_SHARPNESS"
  | LOW_BRIGHTNESS -> `String "LOW_BRIGHTNESS"
  | EXTREME_POSE -> `String "EXTREME_POSE"
  | EXCEEDS_MAX_FACES -> `String "EXCEEDS_MAX_FACES"
  | FACE_NOT_LARGEST -> `String "FACE_NOT_LARGEST"

let unsearched_face_reasons_to_yojson tree = list_to_yojson unsearched_face_reason_to_yojson tree

let unsearched_face_to_yojson (x : unsearched_face) =
  assoc_to_yojson
    [
      ("Reasons", option_to_yojson unsearched_face_reasons_to_yojson x.reasons);
      ("FaceDetails", option_to_yojson face_detail_to_yojson x.face_details);
    ]

let unsearched_faces_list_to_yojson tree = list_to_yojson unsearched_face_to_yojson tree

let reason_to_yojson (x : reason) =
  match x with
  | LOW_FACE_QUALITY -> `String "LOW_FACE_QUALITY"
  | SMALL_BOUNDING_BOX -> `String "SMALL_BOUNDING_BOX"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | LOW_SHARPNESS -> `String "LOW_SHARPNESS"
  | LOW_BRIGHTNESS -> `String "LOW_BRIGHTNESS"
  | EXTREME_POSE -> `String "EXTREME_POSE"
  | EXCEEDS_MAX_FACES -> `String "EXCEEDS_MAX_FACES"

let reasons_to_yojson tree = list_to_yojson reason_to_yojson tree

let unindexed_face_to_yojson (x : unindexed_face) =
  assoc_to_yojson
    [
      ("FaceDetail", option_to_yojson face_detail_to_yojson x.face_detail);
      ("Reasons", option_to_yojson reasons_to_yojson x.reasons);
    ]

let unindexed_faces_to_yojson tree = list_to_yojson unindexed_face_to_yojson tree

let training_data_to_yojson (x : training_data) =
  assoc_to_yojson [ ("Assets", option_to_yojson assets_to_yojson x.assets) ]

let training_data_result_to_yojson (x : training_data_result) =
  assoc_to_yojson
    [
      ("Validation", option_to_yojson validation_data_to_yojson x.validation);
      ("Output", option_to_yojson training_data_to_yojson x.output);
      ("Input", option_to_yojson training_data_to_yojson x.input);
    ]

let timestamp_to_yojson = long_to_yojson
let timecode_to_yojson = string_to_yojson

let text_types_to_yojson (x : text_types) =
  match x with WORD -> `String "WORD" | LINE -> `String "LINE"

let geometry_to_yojson (x : geometry) =
  assoc_to_yojson
    [
      ("Polygon", option_to_yojson polygon_to_yojson x.polygon);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let text_detection_to_yojson (x : text_detection) =
  assoc_to_yojson
    [
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("ParentId", option_to_yojson u_integer_to_yojson x.parent_id);
      ("Id", option_to_yojson u_integer_to_yojson x.id);
      ("Type", option_to_yojson text_types_to_yojson x.type_);
      ("DetectedText", option_to_yojson string__to_yojson x.detected_text);
    ]

let text_detection_result_to_yojson (x : text_detection_result) =
  assoc_to_yojson
    [
      ("TextDetection", option_to_yojson text_detection_to_yojson x.text_detection);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let text_detection_results_to_yojson tree = list_to_yojson text_detection_result_to_yojson tree
let text_detection_list_to_yojson tree = list_to_yojson text_detection_to_yojson tree

let testing_data_to_yojson (x : testing_data) =
  assoc_to_yojson
    [
      ("AutoCreate", option_to_yojson boolean__to_yojson x.auto_create);
      ("Assets", option_to_yojson assets_to_yojson x.assets);
    ]

let testing_data_result_to_yojson (x : testing_data_result) =
  assoc_to_yojson
    [
      ("Validation", option_to_yojson validation_data_to_yojson x.validation);
      ("Output", option_to_yojson testing_data_to_yojson x.output);
      ("Input", option_to_yojson testing_data_to_yojson x.input);
    ]

let technical_cue_type_to_yojson (x : technical_cue_type) =
  match x with
  | CONTENT -> `String "Content"
  | SLATE -> `String "Slate"
  | STUDIO_LOGO -> `String "StudioLogo"
  | OPENING_CREDITS -> `String "OpeningCredits"
  | BLACK_FRAMES -> `String "BlackFrames"
  | END_CREDITS -> `String "EndCredits"
  | COLOR_BARS -> `String "ColorBars"

let segment_confidence_to_yojson = float_to_yojson

let technical_cue_segment_to_yojson (x : technical_cue_segment) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson segment_confidence_to_yojson x.confidence);
      ("Type", option_to_yojson technical_cue_type_to_yojson x.type_);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_map_to_yojson x.tags));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let synthesized_json_human_loop_activation_conditions_evaluation_results_to_yojson =
  string_to_yojson

let summary_to_yojson (x : summary) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let stream_processor_status_to_yojson (x : stream_processor_status) =
  match x with
  | UPDATING -> `String "UPDATING"
  | STOPPING -> `String "STOPPING"
  | FAILED -> `String "FAILED"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"
  | STOPPED -> `String "STOPPED"

let collection_id_to_yojson = string_to_yojson

let face_search_settings_to_yojson (x : face_search_settings) =
  assoc_to_yojson
    [
      ("FaceMatchThreshold", option_to_yojson percent_to_yojson x.face_match_threshold);
      ("CollectionId", option_to_yojson collection_id_to_yojson x.collection_id);
    ]

let connected_home_settings_to_yojson (x : connected_home_settings) =
  assoc_to_yojson
    [
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("Labels", Some (connected_home_labels_to_yojson x.labels));
    ]

let stream_processor_settings_to_yojson (x : stream_processor_settings) =
  assoc_to_yojson
    [
      ("ConnectedHome", option_to_yojson connected_home_settings_to_yojson x.connected_home);
      ("FaceSearch", option_to_yojson face_search_settings_to_yojson x.face_search);
    ]

let kinesis_data_arn_to_yojson = string_to_yojson

let kinesis_data_stream_to_yojson (x : kinesis_data_stream) =
  assoc_to_yojson [ ("Arn", option_to_yojson kinesis_data_arn_to_yojson x.arn) ]

let s3_key_prefix_to_yojson = string_to_yojson

let s3_destination_to_yojson (x : s3_destination) =
  assoc_to_yojson
    [
      ("KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.key_prefix);
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
    ]

let stream_processor_output_to_yojson (x : stream_processor_output) =
  assoc_to_yojson
    [
      ("S3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
      ("KinesisDataStream", option_to_yojson kinesis_data_stream_to_yojson x.kinesis_data_stream);
    ]

let sns_topic_arn_to_yojson = string_to_yojson

let stream_processor_notification_channel_to_yojson (x : stream_processor_notification_channel) =
  assoc_to_yojson [ ("SNSTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn)) ]

let stream_processor_to_yojson (x : stream_processor) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson stream_processor_status_to_yojson x.status);
      ("Name", option_to_yojson stream_processor_name_to_yojson x.name);
    ]

let stream_processor_list_to_yojson tree = list_to_yojson stream_processor_to_yojson tree
let kinesis_video_arn_to_yojson = string_to_yojson

let kinesis_video_stream_to_yojson (x : kinesis_video_stream) =
  assoc_to_yojson [ ("Arn", option_to_yojson kinesis_video_arn_to_yojson x.arn) ]

let stream_processor_input_to_yojson (x : stream_processor_input) =
  assoc_to_yojson
    [
      ("KinesisVideoStream", option_to_yojson kinesis_video_stream_to_yojson x.kinesis_video_stream);
    ]

let stream_processor_arn_to_yojson = string_to_yojson
let max_duration_in_seconds_u_long_to_yojson = long_to_yojson

let stream_processing_stop_selector_to_yojson (x : stream_processing_stop_selector) =
  assoc_to_yojson
    [
      ( "MaxDurationInSeconds",
        option_to_yojson max_duration_in_seconds_u_long_to_yojson x.max_duration_in_seconds );
    ]

let kinesis_video_stream_fragment_number_to_yojson = string_to_yojson

let kinesis_video_stream_start_selector_to_yojson (x : kinesis_video_stream_start_selector) =
  assoc_to_yojson
    [
      ( "FragmentNumber",
        option_to_yojson kinesis_video_stream_fragment_number_to_yojson x.fragment_number );
      ("ProducerTimestamp", option_to_yojson u_long_to_yojson x.producer_timestamp);
    ]

let stream_processing_start_selector_to_yojson (x : stream_processing_start_selector) =
  assoc_to_yojson
    [
      ( "KVSStreamStartSelector",
        option_to_yojson kinesis_video_stream_start_selector_to_yojson x.kvs_stream_start_selector
      );
    ]

let stop_stream_processor_response_to_yojson = unit_to_yojson

let stop_stream_processor_request_to_yojson (x : stop_stream_processor_request) =
  assoc_to_yojson [ ("Name", Some (stream_processor_name_to_yojson x.name)) ]

let project_version_status_to_yojson (x : project_version_status) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | DEPRECATED -> `String "DEPRECATED"
  | COPYING_FAILED -> `String "COPYING_FAILED"
  | COPYING_COMPLETED -> `String "COPYING_COMPLETED"
  | COPYING_IN_PROGRESS -> `String "COPYING_IN_PROGRESS"
  | DELETING -> `String "DELETING"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | FAILED -> `String "FAILED"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"
  | TRAINING_FAILED -> `String "TRAINING_FAILED"
  | TRAINING_COMPLETED -> `String "TRAINING_COMPLETED"
  | TRAINING_IN_PROGRESS -> `String "TRAINING_IN_PROGRESS"

let stop_project_version_response_to_yojson (x : stop_project_version_response) =
  assoc_to_yojson [ ("Status", option_to_yojson project_version_status_to_yojson x.status) ]

let project_version_arn_to_yojson = string_to_yojson

let stop_project_version_request_to_yojson (x : stop_project_version_request) =
  assoc_to_yojson
    [ ("ProjectVersionArn", Some (project_version_arn_to_yojson x.project_version_arn)) ]

let status_message_to_yojson = string_to_yojson
let job_id_to_yojson = string_to_yojson

let start_text_detection_response_to_yojson (x : start_text_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let client_request_token_to_yojson = string_to_yojson
let role_arn_to_yojson = string_to_yojson

let notification_channel_to_yojson (x : notification_channel) =
  assoc_to_yojson
    [
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("SNSTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn));
    ]

let job_tag_to_yojson = string_to_yojson
let bounding_box_height_to_yojson = float_to_yojson
let bounding_box_width_to_yojson = float_to_yojson

let detection_filter_to_yojson (x : detection_filter) =
  assoc_to_yojson
    [
      ("MinBoundingBoxWidth", option_to_yojson bounding_box_width_to_yojson x.min_bounding_box_width);
      ( "MinBoundingBoxHeight",
        option_to_yojson bounding_box_height_to_yojson x.min_bounding_box_height );
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
    ]

let start_text_detection_filters_to_yojson (x : start_text_detection_filters) =
  assoc_to_yojson
    [
      ("RegionsOfInterest", option_to_yojson regions_of_interest_to_yojson x.regions_of_interest);
      ("WordFilter", option_to_yojson detection_filter_to_yojson x.word_filter);
    ]

let start_text_detection_request_to_yojson (x : start_text_detection_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson start_text_detection_filters_to_yojson x.filters);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Video", Some (video_to_yojson x.video));
    ]

let invalid_s3_object_exception_to_yojson (x : invalid_s3_object_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let max_pixel_threshold_to_yojson = float_to_yojson
let min_coverage_percentage_to_yojson = float_to_yojson

let black_frame_to_yojson (x : black_frame) =
  assoc_to_yojson
    [
      ( "MinCoveragePercentage",
        option_to_yojson min_coverage_percentage_to_yojson x.min_coverage_percentage );
      ("MaxPixelThreshold", option_to_yojson max_pixel_threshold_to_yojson x.max_pixel_threshold);
    ]

let start_technical_cue_detection_filter_to_yojson (x : start_technical_cue_detection_filter) =
  assoc_to_yojson
    [
      ("BlackFrame", option_to_yojson black_frame_to_yojson x.black_frame);
      ( "MinSegmentConfidence",
        option_to_yojson segment_confidence_to_yojson x.min_segment_confidence );
    ]

let start_stream_processor_session_id_to_yojson = string_to_yojson

let start_stream_processor_response_to_yojson (x : start_stream_processor_response) =
  assoc_to_yojson
    [ ("SessionId", option_to_yojson start_stream_processor_session_id_to_yojson x.session_id) ]

let start_stream_processor_request_to_yojson (x : start_stream_processor_request) =
  assoc_to_yojson
    [
      ("StopSelector", option_to_yojson stream_processing_stop_selector_to_yojson x.stop_selector);
      ("StartSelector", option_to_yojson stream_processing_start_selector_to_yojson x.start_selector);
      ("Name", Some (stream_processor_name_to_yojson x.name));
    ]

let start_shot_detection_filter_to_yojson (x : start_shot_detection_filter) =
  assoc_to_yojson
    [
      ( "MinSegmentConfidence",
        option_to_yojson segment_confidence_to_yojson x.min_segment_confidence );
    ]

let start_segment_detection_response_to_yojson (x : start_segment_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_segment_detection_filters_to_yojson (x : start_segment_detection_filters) =
  assoc_to_yojson
    [
      ("ShotFilter", option_to_yojson start_shot_detection_filter_to_yojson x.shot_filter);
      ( "TechnicalCueFilter",
        option_to_yojson start_technical_cue_detection_filter_to_yojson x.technical_cue_filter );
    ]

let segment_type_to_yojson (x : segment_type) =
  match x with SHOT -> `String "SHOT" | TECHNICAL_CUE -> `String "TECHNICAL_CUE"

let segment_types_to_yojson tree = list_to_yojson segment_type_to_yojson tree

let start_segment_detection_request_to_yojson (x : start_segment_detection_request) =
  assoc_to_yojson
    [
      ("SegmentTypes", Some (segment_types_to_yojson x.segment_types));
      ("Filters", option_to_yojson start_segment_detection_filters_to_yojson x.filters);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Video", Some (video_to_yojson x.video));
    ]

let start_project_version_response_to_yojson (x : start_project_version_response) =
  assoc_to_yojson [ ("Status", option_to_yojson project_version_status_to_yojson x.status) ]

let inference_units_to_yojson = int_to_yojson

let start_project_version_request_to_yojson (x : start_project_version_request) =
  assoc_to_yojson
    [
      ("MaxInferenceUnits", option_to_yojson inference_units_to_yojson x.max_inference_units);
      ("MinInferenceUnits", Some (inference_units_to_yojson x.min_inference_units));
      ("ProjectVersionArn", Some (project_version_arn_to_yojson x.project_version_arn));
    ]

let start_person_tracking_response_to_yojson (x : start_person_tracking_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_person_tracking_request_to_yojson (x : start_person_tracking_request) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Video", Some (video_to_yojson x.video));
    ]

let media_analysis_job_id_to_yojson = string_to_yojson

let start_media_analysis_job_response_to_yojson (x : start_media_analysis_job_response) =
  assoc_to_yojson [ ("JobId", Some (media_analysis_job_id_to_yojson x.job_id)) ]

let media_analysis_job_name_to_yojson = string_to_yojson
let project_version_id_to_yojson = string_to_yojson

let media_analysis_detect_moderation_labels_config_to_yojson
    (x : media_analysis_detect_moderation_labels_config) =
  assoc_to_yojson
    [
      ("ProjectVersion", option_to_yojson project_version_id_to_yojson x.project_version);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
    ]

let media_analysis_operations_config_to_yojson (x : media_analysis_operations_config) =
  assoc_to_yojson
    [
      ( "DetectModerationLabels",
        option_to_yojson media_analysis_detect_moderation_labels_config_to_yojson
          x.detect_moderation_labels );
    ]

let media_analysis_input_to_yojson (x : media_analysis_input) =
  assoc_to_yojson [ ("S3Object", Some (s3_object_to_yojson x.s3_object)) ]

let media_analysis_s3_key_prefix_to_yojson = string_to_yojson

let media_analysis_output_config_to_yojson (x : media_analysis_output_config) =
  assoc_to_yojson
    [
      ("S3KeyPrefix", option_to_yojson media_analysis_s3_key_prefix_to_yojson x.s3_key_prefix);
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
    ]

let kms_key_id_to_yojson = string_to_yojson

let start_media_analysis_job_request_to_yojson (x : start_media_analysis_job_request) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", Some (media_analysis_output_config_to_yojson x.output_config));
      ("Input", Some (media_analysis_input_to_yojson x.input));
      ("OperationsConfig", Some (media_analysis_operations_config_to_yojson x.operations_config));
      ("JobName", option_to_yojson media_analysis_job_name_to_yojson x.job_name);
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let resource_not_ready_exception_to_yojson (x : resource_not_ready_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_manifest_exception_to_yojson (x : invalid_manifest_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let start_label_detection_response_to_yojson (x : start_label_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let label_detection_feature_name_to_yojson (x : label_detection_feature_name) =
  match x with GENERAL_LABELS -> `String "GENERAL_LABELS"

let label_detection_feature_list_to_yojson tree =
  list_to_yojson label_detection_feature_name_to_yojson tree

let general_labels_filter_value_to_yojson = string_to_yojson

let general_labels_filter_list_to_yojson tree =
  list_to_yojson general_labels_filter_value_to_yojson tree

let general_labels_settings_to_yojson (x : general_labels_settings) =
  assoc_to_yojson
    [
      ( "LabelCategoryExclusionFilters",
        option_to_yojson general_labels_filter_list_to_yojson x.label_category_exclusion_filters );
      ( "LabelCategoryInclusionFilters",
        option_to_yojson general_labels_filter_list_to_yojson x.label_category_inclusion_filters );
      ( "LabelExclusionFilters",
        option_to_yojson general_labels_filter_list_to_yojson x.label_exclusion_filters );
      ( "LabelInclusionFilters",
        option_to_yojson general_labels_filter_list_to_yojson x.label_inclusion_filters );
    ]

let label_detection_settings_to_yojson (x : label_detection_settings) =
  assoc_to_yojson
    [ ("GeneralLabels", option_to_yojson general_labels_settings_to_yojson x.general_labels) ]

let start_label_detection_request_to_yojson (x : start_label_detection_request) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson label_detection_settings_to_yojson x.settings);
      ("Features", option_to_yojson label_detection_feature_list_to_yojson x.features);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Video", Some (video_to_yojson x.video));
    ]

let start_face_search_response_to_yojson (x : start_face_search_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_face_search_request_to_yojson (x : start_face_search_request) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("FaceMatchThreshold", option_to_yojson percent_to_yojson x.face_match_threshold);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Video", Some (video_to_yojson x.video));
    ]

let start_face_detection_response_to_yojson (x : start_face_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let face_attributes_to_yojson (x : face_attributes) =
  match x with ALL -> `String "ALL" | DEFAULT -> `String "DEFAULT"

let start_face_detection_request_to_yojson (x : start_face_detection_request) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("FaceAttributes", option_to_yojson face_attributes_to_yojson x.face_attributes);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Video", Some (video_to_yojson x.video));
    ]

let start_content_moderation_response_to_yojson (x : start_content_moderation_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_content_moderation_request_to_yojson (x : start_content_moderation_request) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("Video", Some (video_to_yojson x.video));
    ]

let start_celebrity_recognition_response_to_yojson (x : start_celebrity_recognition_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_celebrity_recognition_request_to_yojson (x : start_celebrity_recognition_request) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Video", Some (video_to_yojson x.video));
    ]

let shot_segment_to_yojson (x : shot_segment) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson segment_confidence_to_yojson x.confidence);
      ("Index", option_to_yojson u_long_to_yojson x.index);
    ]

let session_not_found_exception_to_yojson (x : session_not_found_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let segment_type_info_to_yojson (x : segment_type_info) =
  assoc_to_yojson
    [
      ("ModelVersion", option_to_yojson string__to_yojson x.model_version);
      ("Type", option_to_yojson segment_type_to_yojson x.type_);
    ]

let segment_types_info_to_yojson tree = list_to_yojson segment_type_info_to_yojson tree

let segment_detection_to_yojson (x : segment_detection) =
  assoc_to_yojson
    [
      ("DurationFrames", option_to_yojson u_long_to_yojson x.duration_frames);
      ("EndFrameNumber", option_to_yojson u_long_to_yojson x.end_frame_number);
      ("StartFrameNumber", option_to_yojson u_long_to_yojson x.start_frame_number);
      ("ShotSegment", option_to_yojson shot_segment_to_yojson x.shot_segment);
      ( "TechnicalCueSegment",
        option_to_yojson technical_cue_segment_to_yojson x.technical_cue_segment );
      ("DurationSMPTE", option_to_yojson timecode_to_yojson x.duration_smpt_e);
      ("EndTimecodeSMPTE", option_to_yojson timecode_to_yojson x.end_timecode_smpt_e);
      ("StartTimecodeSMPTE", option_to_yojson timecode_to_yojson x.start_timecode_smpt_e);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("EndTimestampMillis", option_to_yojson timestamp_to_yojson x.end_timestamp_millis);
      ("StartTimestampMillis", option_to_yojson timestamp_to_yojson x.start_timestamp_millis);
      ("Type", option_to_yojson segment_type_to_yojson x.type_);
    ]

let segment_detections_to_yojson tree = list_to_yojson segment_detection_to_yojson tree

let searched_user_to_yojson (x : searched_user) =
  assoc_to_yojson [ ("UserId", option_to_yojson user_id_to_yojson x.user_id) ]

let searched_face_details_to_yojson (x : searched_face_details) =
  assoc_to_yojson [ ("FaceDetail", option_to_yojson face_detail_to_yojson x.face_detail) ]

let searched_face_to_yojson (x : searched_face) =
  assoc_to_yojson [ ("FaceId", option_to_yojson face_id_to_yojson x.face_id) ]

let search_users_response_to_yojson (x : search_users_response) =
  assoc_to_yojson
    [
      ("SearchedUser", option_to_yojson searched_user_to_yojson x.searched_user);
      ("SearchedFace", option_to_yojson searched_face_to_yojson x.searched_face);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("UserMatches", option_to_yojson user_match_list_to_yojson x.user_matches);
    ]

let max_user_results_to_yojson = int_to_yojson

let search_users_request_to_yojson (x : search_users_request) =
  assoc_to_yojson
    [
      ("MaxUsers", option_to_yojson max_user_results_to_yojson x.max_users);
      ("UserMatchThreshold", option_to_yojson percent_to_yojson x.user_match_threshold);
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let search_users_by_image_response_to_yojson (x : search_users_by_image_response) =
  assoc_to_yojson
    [
      ("UnsearchedFaces", option_to_yojson unsearched_faces_list_to_yojson x.unsearched_faces);
      ("SearchedFace", option_to_yojson searched_face_details_to_yojson x.searched_face);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("UserMatches", option_to_yojson user_match_list_to_yojson x.user_matches);
    ]

let image_blob_to_yojson = blob_to_yojson

let image_to_yojson (x : image) =
  assoc_to_yojson
    [
      ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object);
      ("Bytes", option_to_yojson image_blob_to_yojson x.bytes);
    ]

let quality_filter_to_yojson (x : quality_filter) =
  match x with
  | HIGH -> `String "HIGH"
  | MEDIUM -> `String "MEDIUM"
  | LOW -> `String "LOW"
  | AUTO -> `String "AUTO"
  | NONE -> `String "NONE"

let search_users_by_image_request_to_yojson (x : search_users_by_image_request) =
  assoc_to_yojson
    [
      ("QualityFilter", option_to_yojson quality_filter_to_yojson x.quality_filter);
      ("MaxUsers", option_to_yojson max_user_results_to_yojson x.max_users);
      ("UserMatchThreshold", option_to_yojson percent_to_yojson x.user_match_threshold);
      ("Image", Some (image_to_yojson x.image));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let invalid_image_format_exception_to_yojson (x : invalid_image_format_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let image_too_large_exception_to_yojson (x : image_too_large_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let image_id_to_yojson = string_to_yojson
let external_image_id_to_yojson = string_to_yojson
let index_faces_model_version_to_yojson = string_to_yojson

let face_to_yojson (x : face) =
  assoc_to_yojson
    [
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ( "IndexFacesModelVersion",
        option_to_yojson index_faces_model_version_to_yojson x.index_faces_model_version );
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("ExternalImageId", option_to_yojson external_image_id_to_yojson x.external_image_id);
      ("ImageId", option_to_yojson image_id_to_yojson x.image_id);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
    ]

let face_match_to_yojson (x : face_match) =
  assoc_to_yojson
    [
      ("Face", option_to_yojson face_to_yojson x.face);
      ("Similarity", option_to_yojson percent_to_yojson x.similarity);
    ]

let face_match_list_to_yojson tree = list_to_yojson face_match_to_yojson tree

let search_faces_response_to_yojson (x : search_faces_response) =
  assoc_to_yojson
    [
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("FaceMatches", option_to_yojson face_match_list_to_yojson x.face_matches);
      ("SearchedFaceId", option_to_yojson face_id_to_yojson x.searched_face_id);
    ]

let max_faces_to_yojson = int_to_yojson

let search_faces_request_to_yojson (x : search_faces_request) =
  assoc_to_yojson
    [
      ("FaceMatchThreshold", option_to_yojson percent_to_yojson x.face_match_threshold);
      ("MaxFaces", option_to_yojson max_faces_to_yojson x.max_faces);
      ("FaceId", Some (face_id_to_yojson x.face_id));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let search_faces_by_image_response_to_yojson (x : search_faces_by_image_response) =
  assoc_to_yojson
    [
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("FaceMatches", option_to_yojson face_match_list_to_yojson x.face_matches);
      ("SearchedFaceConfidence", option_to_yojson percent_to_yojson x.searched_face_confidence);
      ( "SearchedFaceBoundingBox",
        option_to_yojson bounding_box_to_yojson x.searched_face_bounding_box );
    ]

let search_faces_by_image_request_to_yojson (x : search_faces_by_image_request) =
  assoc_to_yojson
    [
      ("QualityFilter", option_to_yojson quality_filter_to_yojson x.quality_filter);
      ("FaceMatchThreshold", option_to_yojson percent_to_yojson x.face_match_threshold);
      ("MaxFaces", option_to_yojson max_faces_to_yojson x.max_faces);
      ("Image", Some (image_to_yojson x.image));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let rekognition_unique_id_to_yojson = string_to_yojson

let compared_face_to_yojson (x : compared_face) =
  assoc_to_yojson
    [
      ("Smile", option_to_yojson smile_to_yojson x.smile);
      ("Emotions", option_to_yojson emotions_to_yojson x.emotions);
      ("Quality", option_to_yojson image_quality_to_yojson x.quality);
      ("Pose", option_to_yojson pose_to_yojson x.pose);
      ("Landmarks", option_to_yojson landmarks_to_yojson x.landmarks);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let known_gender_type_to_yojson (x : known_gender_type) =
  match x with
  | Unlisted -> `String "Unlisted"
  | Nonbinary -> `String "Nonbinary"
  | Female -> `String "Female"
  | Male -> `String "Male"

let known_gender_to_yojson (x : known_gender) =
  assoc_to_yojson [ ("Type", option_to_yojson known_gender_type_to_yojson x.type_) ]

let celebrity_to_yojson (x : celebrity) =
  assoc_to_yojson
    [
      ("KnownGender", option_to_yojson known_gender_to_yojson x.known_gender);
      ("MatchConfidence", option_to_yojson percent_to_yojson x.match_confidence);
      ("Face", option_to_yojson compared_face_to_yojson x.face);
      ("Id", option_to_yojson rekognition_unique_id_to_yojson x.id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Urls", option_to_yojson urls_to_yojson x.urls);
    ]

let celebrity_list_to_yojson tree = list_to_yojson celebrity_to_yojson tree
let compared_face_list_to_yojson tree = list_to_yojson compared_face_to_yojson tree

let orientation_correction_to_yojson (x : orientation_correction) =
  match x with
  | ROTATE_270 -> `String "ROTATE_270"
  | ROTATE_180 -> `String "ROTATE_180"
  | ROTATE_90 -> `String "ROTATE_90"
  | ROTATE_0 -> `String "ROTATE_0"

let recognize_celebrities_response_to_yojson (x : recognize_celebrities_response) =
  assoc_to_yojson
    [
      ( "OrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.orientation_correction );
      ("UnrecognizedFaces", option_to_yojson compared_face_list_to_yojson x.unrecognized_faces);
      ("CelebrityFaces", option_to_yojson celebrity_list_to_yojson x.celebrity_faces);
    ]

let recognize_celebrities_request_to_yojson (x : recognize_celebrities_request) =
  assoc_to_yojson [ ("Image", Some (image_to_yojson x.image)) ]

let malformed_policy_document_exception_to_yojson (x : malformed_policy_document_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_policy_revision_id_exception_to_yojson (x : invalid_policy_revision_id_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let project_policy_revision_id_to_yojson = string_to_yojson

let put_project_policy_response_to_yojson (x : put_project_policy_response) =
  assoc_to_yojson
    [
      ( "PolicyRevisionId",
        option_to_yojson project_policy_revision_id_to_yojson x.policy_revision_id );
    ]

let project_arn_to_yojson = string_to_yojson
let project_policy_name_to_yojson = string_to_yojson
let project_policy_document_to_yojson = string_to_yojson

let put_project_policy_request_to_yojson (x : put_project_policy_request) =
  assoc_to_yojson
    [
      ("PolicyDocument", Some (project_policy_document_to_yojson x.policy_document));
      ( "PolicyRevisionId",
        option_to_yojson project_policy_revision_id_to_yojson x.policy_revision_id );
      ("PolicyName", Some (project_policy_name_to_yojson x.policy_name));
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
    ]

let invalid_pagination_token_exception_to_yojson (x : invalid_pagination_token_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let pagination_token_to_yojson = string_to_yojson

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Users", option_to_yojson user_list_to_yojson x.users);
    ]

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_user_results_to_yojson x.max_results);
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let list_stream_processors_response_to_yojson (x : list_stream_processors_response) =
  assoc_to_yojson
    [
      ("StreamProcessors", option_to_yojson stream_processor_list_to_yojson x.stream_processors);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_stream_processors_request_to_yojson (x : list_stream_processors_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let project_policy_to_yojson (x : project_policy) =
  assoc_to_yojson
    [
      ("LastUpdatedTimestamp", option_to_yojson date_time_to_yojson x.last_updated_timestamp);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("PolicyDocument", option_to_yojson project_policy_document_to_yojson x.policy_document);
      ( "PolicyRevisionId",
        option_to_yojson project_policy_revision_id_to_yojson x.policy_revision_id );
      ("PolicyName", option_to_yojson project_policy_name_to_yojson x.policy_name);
      ("ProjectArn", option_to_yojson project_arn_to_yojson x.project_arn);
    ]

let project_policies_to_yojson tree = list_to_yojson project_policy_to_yojson tree
let extended_pagination_token_to_yojson = string_to_yojson

let list_project_policies_response_to_yojson (x : list_project_policies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("ProjectPolicies", option_to_yojson project_policies_to_yojson x.project_policies);
    ]

let list_project_policies_page_size_to_yojson = int_to_yojson

let list_project_policies_request_to_yojson (x : list_project_policies_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_project_policies_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
    ]

let media_analysis_job_status_to_yojson (x : media_analysis_job_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | QUEUED -> `String "QUEUED"
  | CREATED -> `String "CREATED"

let media_analysis_job_failure_code_to_yojson (x : media_analysis_job_failure_code) =
  match x with
  | THROTTLED -> `String "THROTTLED"
  | RESOURCE_NOT_READY -> `String "RESOURCE_NOT_READY"
  | RESOURCE_NOT_FOUND -> `String "RESOURCE_NOT_FOUND"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | INVALID_KMS_KEY -> `String "INVALID_KMS_KEY"
  | INVALID_OUTPUT_CONFIG -> `String "INVALID_OUTPUT_CONFIG"
  | INVALID_MANIFEST -> `String "INVALID_MANIFEST"
  | INVALID_S3_OBJECT -> `String "INVALID_S3_OBJECT"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let media_analysis_job_failure_details_to_yojson (x : media_analysis_job_failure_details) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson media_analysis_job_failure_code_to_yojson x.code);
    ]

let media_analysis_model_versions_to_yojson (x : media_analysis_model_versions) =
  assoc_to_yojson [ ("Moderation", option_to_yojson string__to_yojson x.moderation) ]

let media_analysis_results_to_yojson (x : media_analysis_results) =
  assoc_to_yojson
    [
      ("ModelVersions", option_to_yojson media_analysis_model_versions_to_yojson x.model_versions);
      ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object);
    ]

let media_analysis_manifest_summary_to_yojson (x : media_analysis_manifest_summary) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let media_analysis_job_description_to_yojson (x : media_analysis_job_description) =
  assoc_to_yojson
    [
      ( "ManifestSummary",
        option_to_yojson media_analysis_manifest_summary_to_yojson x.manifest_summary );
      ("Results", option_to_yojson media_analysis_results_to_yojson x.results);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", Some (media_analysis_output_config_to_yojson x.output_config));
      ("Input", Some (media_analysis_input_to_yojson x.input));
      ("CompletionTimestamp", option_to_yojson date_time_to_yojson x.completion_timestamp);
      ("CreationTimestamp", Some (date_time_to_yojson x.creation_timestamp));
      ( "FailureDetails",
        option_to_yojson media_analysis_job_failure_details_to_yojson x.failure_details );
      ("Status", Some (media_analysis_job_status_to_yojson x.status));
      ("OperationsConfig", Some (media_analysis_operations_config_to_yojson x.operations_config));
      ("JobName", option_to_yojson media_analysis_job_name_to_yojson x.job_name);
      ("JobId", Some (media_analysis_job_id_to_yojson x.job_id));
    ]

let media_analysis_job_descriptions_to_yojson tree =
  list_to_yojson media_analysis_job_description_to_yojson tree

let list_media_analysis_jobs_response_to_yojson (x : list_media_analysis_jobs_response) =
  assoc_to_yojson
    [
      ("MediaAnalysisJobs", Some (media_analysis_job_descriptions_to_yojson x.media_analysis_jobs));
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
    ]

let list_media_analysis_jobs_page_size_to_yojson = int_to_yojson

let list_media_analysis_jobs_request_to_yojson (x : list_media_analysis_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_media_analysis_jobs_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
    ]

let face_list_to_yojson tree = list_to_yojson face_to_yojson tree

let list_faces_response_to_yojson (x : list_faces_response) =
  assoc_to_yojson
    [
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Faces", option_to_yojson face_list_to_yojson x.faces);
    ]

let page_size_to_yojson = int_to_yojson
let face_id_list_to_yojson tree = list_to_yojson face_id_to_yojson tree

let list_faces_request_to_yojson (x : list_faces_request) =
  assoc_to_yojson
    [
      ("FaceIds", option_to_yojson face_id_list_to_yojson x.face_ids);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let dataset_label_to_yojson = string_to_yojson

let dataset_label_stats_to_yojson (x : dataset_label_stats) =
  assoc_to_yojson
    [
      ("BoundingBoxCount", option_to_yojson u_integer_to_yojson x.bounding_box_count);
      ("EntryCount", option_to_yojson u_integer_to_yojson x.entry_count);
    ]

let dataset_label_description_to_yojson (x : dataset_label_description) =
  assoc_to_yojson
    [
      ("LabelStats", option_to_yojson dataset_label_stats_to_yojson x.label_stats);
      ("LabelName", option_to_yojson dataset_label_to_yojson x.label_name);
    ]

let dataset_label_descriptions_to_yojson tree =
  list_to_yojson dataset_label_description_to_yojson tree

let list_dataset_labels_response_to_yojson (x : list_dataset_labels_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ( "DatasetLabelDescriptions",
        option_to_yojson dataset_label_descriptions_to_yojson x.dataset_label_descriptions );
    ]

let list_dataset_labels_page_size_to_yojson = int_to_yojson

let list_dataset_labels_request_to_yojson (x : list_dataset_labels_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_dataset_labels_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn));
    ]

let dataset_entry_to_yojson = string_to_yojson
let dataset_entries_to_yojson tree = list_to_yojson dataset_entry_to_yojson tree

let list_dataset_entries_response_to_yojson (x : list_dataset_entries_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("DatasetEntries", option_to_yojson dataset_entries_to_yojson x.dataset_entries);
    ]

let dataset_labels_to_yojson tree = list_to_yojson dataset_label_to_yojson tree
let is_labeled_to_yojson = bool_to_yojson
let query_string_to_yojson = string_to_yojson
let has_errors_to_yojson = bool_to_yojson
let list_dataset_entries_page_size_to_yojson = int_to_yojson

let list_dataset_entries_request_to_yojson (x : list_dataset_entries_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_dataset_entries_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("HasErrors", option_to_yojson has_errors_to_yojson x.has_errors);
      ("SourceRefContains", option_to_yojson query_string_to_yojson x.source_ref_contains);
      ("Labeled", option_to_yojson is_labeled_to_yojson x.labeled);
      ("ContainsLabels", option_to_yojson dataset_labels_to_yojson x.contains_labels);
      ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn));
    ]

let collection_id_list_to_yojson tree = list_to_yojson collection_id_to_yojson tree
let face_model_version_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_collections_response_to_yojson (x : list_collections_response) =
  assoc_to_yojson
    [
      ("FaceModelVersions", option_to_yojson face_model_version_list_to_yojson x.face_model_versions);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("CollectionIds", option_to_yojson collection_id_list_to_yojson x.collection_ids);
    ]

let list_collections_request_to_yojson (x : list_collections_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let face_record_to_yojson (x : face_record) =
  assoc_to_yojson
    [
      ("FaceDetail", option_to_yojson face_detail_to_yojson x.face_detail);
      ("Face", option_to_yojson face_to_yojson x.face);
    ]

let face_record_list_to_yojson tree = list_to_yojson face_record_to_yojson tree

let index_faces_response_to_yojson (x : index_faces_response) =
  assoc_to_yojson
    [
      ("UnindexedFaces", option_to_yojson unindexed_faces_to_yojson x.unindexed_faces);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ( "OrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.orientation_correction );
      ("FaceRecords", option_to_yojson face_record_list_to_yojson x.face_records);
    ]

let attribute_to_yojson (x : attribute) =
  match x with
  | SUNGLASSES -> `String "SUNGLASSES"
  | SMILE -> `String "SMILE"
  | FACE_OCCLUDED -> `String "FACE_OCCLUDED"
  | MUSTACHE -> `String "MUSTACHE"
  | MOUTH_OPEN -> `String "MOUTH_OPEN"
  | GENDER -> `String "GENDER"
  | EYES_OPEN -> `String "EYES_OPEN"
  | EYEGLASSES -> `String "EYEGLASSES"
  | EYE_DIRECTION -> `String "EYE_DIRECTION"
  | EMOTIONS -> `String "EMOTIONS"
  | BEARD -> `String "BEARD"
  | AGE_RANGE -> `String "AGE_RANGE"
  | ALL -> `String "ALL"
  | DEFAULT -> `String "DEFAULT"

let attributes_to_yojson tree = list_to_yojson attribute_to_yojson tree
let max_faces_to_index_to_yojson = int_to_yojson

let index_faces_request_to_yojson (x : index_faces_request) =
  assoc_to_yojson
    [
      ("QualityFilter", option_to_yojson quality_filter_to_yojson x.quality_filter);
      ("MaxFaces", option_to_yojson max_faces_to_index_to_yojson x.max_faces);
      ("DetectionAttributes", option_to_yojson attributes_to_yojson x.detection_attributes);
      ("ExternalImageId", option_to_yojson external_image_id_to_yojson x.external_image_id);
      ("Image", Some (image_to_yojson x.image));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let get_text_detection_response_to_yojson (x : get_text_detection_response) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("TextModelVersion", option_to_yojson string__to_yojson x.text_model_version);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("TextDetections", option_to_yojson text_detection_results_to_yojson x.text_detections);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
    ]

let get_text_detection_request_to_yojson (x : get_text_detection_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let audio_metadata_to_yojson (x : audio_metadata) =
  assoc_to_yojson
    [
      ("NumberOfChannels", option_to_yojson u_long_to_yojson x.number_of_channels);
      ("SampleRate", option_to_yojson u_long_to_yojson x.sample_rate);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("Codec", option_to_yojson string__to_yojson x.codec);
    ]

let audio_metadata_list_to_yojson tree = list_to_yojson audio_metadata_to_yojson tree

let get_segment_detection_response_to_yojson (x : get_segment_detection_response) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ( "SelectedSegmentTypes",
        option_to_yojson segment_types_info_to_yojson x.selected_segment_types );
      ("Segments", option_to_yojson segment_detections_to_yojson x.segments);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AudioMetadata", option_to_yojson audio_metadata_list_to_yojson x.audio_metadata);
      ("VideoMetadata", option_to_yojson video_metadata_list_to_yojson x.video_metadata);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
    ]

let get_segment_detection_request_to_yojson (x : get_segment_detection_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let person_index_to_yojson = long_to_yojson

let person_detail_to_yojson (x : person_detail) =
  assoc_to_yojson
    [
      ("Face", option_to_yojson face_detail_to_yojson x.face);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Index", option_to_yojson person_index_to_yojson x.index);
    ]

let person_detection_to_yojson (x : person_detection) =
  assoc_to_yojson
    [
      ("Person", option_to_yojson person_detail_to_yojson x.person);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let person_detections_to_yojson tree = list_to_yojson person_detection_to_yojson tree

let get_person_tracking_response_to_yojson (x : get_person_tracking_response) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Persons", option_to_yojson person_detections_to_yojson x.persons);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
    ]

let person_tracking_sort_by_to_yojson (x : person_tracking_sort_by) =
  match x with TIMESTAMP -> `String "TIMESTAMP" | INDEX -> `String "INDEX"

let get_person_tracking_request_to_yojson (x : get_person_tracking_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson person_tracking_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let get_media_analysis_job_response_to_yojson (x : get_media_analysis_job_response) =
  assoc_to_yojson
    [
      ( "ManifestSummary",
        option_to_yojson media_analysis_manifest_summary_to_yojson x.manifest_summary );
      ("Results", option_to_yojson media_analysis_results_to_yojson x.results);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", Some (media_analysis_output_config_to_yojson x.output_config));
      ("Input", Some (media_analysis_input_to_yojson x.input));
      ("CompletionTimestamp", option_to_yojson date_time_to_yojson x.completion_timestamp);
      ("CreationTimestamp", Some (date_time_to_yojson x.creation_timestamp));
      ( "FailureDetails",
        option_to_yojson media_analysis_job_failure_details_to_yojson x.failure_details );
      ("Status", Some (media_analysis_job_status_to_yojson x.status));
      ("OperationsConfig", Some (media_analysis_operations_config_to_yojson x.operations_config));
      ("JobName", option_to_yojson media_analysis_job_name_to_yojson x.job_name);
      ("JobId", Some (media_analysis_job_id_to_yojson x.job_id));
    ]

let get_media_analysis_job_request_to_yojson (x : get_media_analysis_job_request) =
  assoc_to_yojson [ ("JobId", Some (media_analysis_job_id_to_yojson x.job_id)) ]

let dominant_color_to_yojson (x : dominant_color) =
  assoc_to_yojson
    [
      ("PixelPercent", option_to_yojson percent_to_yojson x.pixel_percent);
      ("SimplifiedColor", option_to_yojson string__to_yojson x.simplified_color);
      ("CSSColor", option_to_yojson string__to_yojson x.css_color);
      ("HexCode", option_to_yojson string__to_yojson x.hex_code);
      ("Green", option_to_yojson u_integer_to_yojson x.green);
      ("Blue", option_to_yojson u_integer_to_yojson x.blue);
      ("Red", option_to_yojson u_integer_to_yojson x.red);
    ]

let dominant_colors_to_yojson tree = list_to_yojson dominant_color_to_yojson tree

let instance_to_yojson (x : instance) =
  assoc_to_yojson
    [
      ("DominantColors", option_to_yojson dominant_colors_to_yojson x.dominant_colors);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let instances_to_yojson tree = list_to_yojson instance_to_yojson tree

let parent_to_yojson (x : parent) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let parents_to_yojson tree = list_to_yojson parent_to_yojson tree

let label_alias_to_yojson (x : label_alias) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let label_aliases_to_yojson tree = list_to_yojson label_alias_to_yojson tree

let label_category_to_yojson (x : label_category) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let label_categories_to_yojson tree = list_to_yojson label_category_to_yojson tree

let label_to_yojson (x : label) =
  assoc_to_yojson
    [
      ("Categories", option_to_yojson label_categories_to_yojson x.categories);
      ("Aliases", option_to_yojson label_aliases_to_yojson x.aliases);
      ("Parents", option_to_yojson parents_to_yojson x.parents);
      ("Instances", option_to_yojson instances_to_yojson x.instances);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let label_detection_to_yojson (x : label_detection) =
  assoc_to_yojson
    [
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("EndTimestampMillis", option_to_yojson u_long_to_yojson x.end_timestamp_millis);
      ("StartTimestampMillis", option_to_yojson u_long_to_yojson x.start_timestamp_millis);
      ("Label", option_to_yojson label_to_yojson x.label);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let label_detections_to_yojson tree = list_to_yojson label_detection_to_yojson tree

let label_detection_sort_by_to_yojson (x : label_detection_sort_by) =
  match x with TIMESTAMP -> `String "TIMESTAMP" | NAME -> `String "NAME"

let label_detection_aggregate_by_to_yojson (x : label_detection_aggregate_by) =
  match x with SEGMENTS -> `String "SEGMENTS" | TIMESTAMPS -> `String "TIMESTAMPS"

let get_label_detection_request_metadata_to_yojson (x : get_label_detection_request_metadata) =
  assoc_to_yojson
    [
      ("AggregateBy", option_to_yojson label_detection_aggregate_by_to_yojson x.aggregate_by);
      ("SortBy", option_to_yojson label_detection_sort_by_to_yojson x.sort_by);
    ]

let get_label_detection_response_to_yojson (x : get_label_detection_response) =
  assoc_to_yojson
    [
      ( "GetRequestMetadata",
        option_to_yojson get_label_detection_request_metadata_to_yojson x.get_request_metadata );
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("LabelModelVersion", option_to_yojson string__to_yojson x.label_model_version);
      ("Labels", option_to_yojson label_detections_to_yojson x.labels);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
    ]

let get_label_detection_request_to_yojson (x : get_label_detection_request) =
  assoc_to_yojson
    [
      ("AggregateBy", option_to_yojson label_detection_aggregate_by_to_yojson x.aggregate_by);
      ("SortBy", option_to_yojson label_detection_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let person_match_to_yojson (x : person_match) =
  assoc_to_yojson
    [
      ("FaceMatches", option_to_yojson face_match_list_to_yojson x.face_matches);
      ("Person", option_to_yojson person_detail_to_yojson x.person);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let person_matches_to_yojson tree = list_to_yojson person_match_to_yojson tree

let get_face_search_response_to_yojson (x : get_face_search_response) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Persons", option_to_yojson person_matches_to_yojson x.persons);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
    ]

let face_search_sort_by_to_yojson (x : face_search_sort_by) =
  match x with TIMESTAMP -> `String "TIMESTAMP" | INDEX -> `String "INDEX"

let get_face_search_request_to_yojson (x : get_face_search_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson face_search_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let liveness_session_id_to_yojson = string_to_yojson

let liveness_session_status_to_yojson (x : liveness_session_status) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | CREATED -> `String "CREATED"

let liveness_image_blob_to_yojson = blob_to_yojson

let audit_image_to_yojson (x : audit_image) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object);
      ("Bytes", option_to_yojson liveness_image_blob_to_yojson x.bytes);
    ]

let audit_images_to_yojson tree = list_to_yojson audit_image_to_yojson tree

let challenge_type_to_yojson (x : challenge_type) =
  match x with
  | FACE_MOVEMENT_CHALLENGE -> `String "FaceMovementChallenge"
  | FACE_MOVEMENT_AND_LIGHT_CHALLENGE -> `String "FaceMovementAndLightChallenge"

let challenge_to_yojson (x : challenge) =
  assoc_to_yojson
    [
      ("Version", Some (version_to_yojson x.version));
      ("Type", Some (challenge_type_to_yojson x.type_));
    ]

let get_face_liveness_session_results_response_to_yojson
    (x : get_face_liveness_session_results_response) =
  assoc_to_yojson
    [
      ("Challenge", option_to_yojson challenge_to_yojson x.challenge);
      ("AuditImages", option_to_yojson audit_images_to_yojson x.audit_images);
      ("ReferenceImage", option_to_yojson audit_image_to_yojson x.reference_image);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Status", Some (liveness_session_status_to_yojson x.status));
      ("SessionId", Some (liveness_session_id_to_yojson x.session_id));
    ]

let get_face_liveness_session_results_request_to_yojson
    (x : get_face_liveness_session_results_request) =
  assoc_to_yojson [ ("SessionId", Some (liveness_session_id_to_yojson x.session_id)) ]

let face_detection_to_yojson (x : face_detection) =
  assoc_to_yojson
    [
      ("Face", option_to_yojson face_detail_to_yojson x.face);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let face_detections_to_yojson tree = list_to_yojson face_detection_to_yojson tree

let get_face_detection_response_to_yojson (x : get_face_detection_response) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Faces", option_to_yojson face_detections_to_yojson x.faces);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
    ]

let get_face_detection_request_to_yojson (x : get_face_detection_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let moderation_label_to_yojson (x : moderation_label) =
  assoc_to_yojson
    [
      ("TaxonomyLevel", option_to_yojson u_integer_to_yojson x.taxonomy_level);
      ("ParentName", option_to_yojson string__to_yojson x.parent_name);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let content_type_to_yojson (x : content_type) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let content_types_to_yojson tree = list_to_yojson content_type_to_yojson tree

let content_moderation_detection_to_yojson (x : content_moderation_detection) =
  assoc_to_yojson
    [
      ("ContentTypes", option_to_yojson content_types_to_yojson x.content_types);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("EndTimestampMillis", option_to_yojson u_long_to_yojson x.end_timestamp_millis);
      ("StartTimestampMillis", option_to_yojson u_long_to_yojson x.start_timestamp_millis);
      ("ModerationLabel", option_to_yojson moderation_label_to_yojson x.moderation_label);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let content_moderation_detections_to_yojson tree =
  list_to_yojson content_moderation_detection_to_yojson tree

let content_moderation_sort_by_to_yojson (x : content_moderation_sort_by) =
  match x with TIMESTAMP -> `String "TIMESTAMP" | NAME -> `String "NAME"

let content_moderation_aggregate_by_to_yojson (x : content_moderation_aggregate_by) =
  match x with SEGMENTS -> `String "SEGMENTS" | TIMESTAMPS -> `String "TIMESTAMPS"

let get_content_moderation_request_metadata_to_yojson (x : get_content_moderation_request_metadata)
    =
  assoc_to_yojson
    [
      ("AggregateBy", option_to_yojson content_moderation_aggregate_by_to_yojson x.aggregate_by);
      ("SortBy", option_to_yojson content_moderation_sort_by_to_yojson x.sort_by);
    ]

let get_content_moderation_response_to_yojson (x : get_content_moderation_response) =
  assoc_to_yojson
    [
      ( "GetRequestMetadata",
        option_to_yojson get_content_moderation_request_metadata_to_yojson x.get_request_metadata );
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("ModerationModelVersion", option_to_yojson string__to_yojson x.moderation_model_version);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "ModerationLabels",
        option_to_yojson content_moderation_detections_to_yojson x.moderation_labels );
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
    ]

let get_content_moderation_request_to_yojson (x : get_content_moderation_request) =
  assoc_to_yojson
    [
      ("AggregateBy", option_to_yojson content_moderation_aggregate_by_to_yojson x.aggregate_by);
      ("SortBy", option_to_yojson content_moderation_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let celebrity_detail_to_yojson (x : celebrity_detail) =
  assoc_to_yojson
    [
      ("KnownGender", option_to_yojson known_gender_to_yojson x.known_gender);
      ("Face", option_to_yojson face_detail_to_yojson x.face);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Id", option_to_yojson rekognition_unique_id_to_yojson x.id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Urls", option_to_yojson urls_to_yojson x.urls);
    ]

let celebrity_recognition_to_yojson (x : celebrity_recognition) =
  assoc_to_yojson
    [
      ("Celebrity", option_to_yojson celebrity_detail_to_yojson x.celebrity);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let celebrity_recognitions_to_yojson tree = list_to_yojson celebrity_recognition_to_yojson tree

let get_celebrity_recognition_response_to_yojson (x : get_celebrity_recognition_response) =
  assoc_to_yojson
    [
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Celebrities", option_to_yojson celebrity_recognitions_to_yojson x.celebrities);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
    ]

let celebrity_recognition_sort_by_to_yojson (x : celebrity_recognition_sort_by) =
  match x with TIMESTAMP -> `String "TIMESTAMP" | ID -> `String "ID"

let get_celebrity_recognition_request_to_yojson (x : get_celebrity_recognition_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson celebrity_recognition_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let get_celebrity_info_response_to_yojson (x : get_celebrity_info_response) =
  assoc_to_yojson
    [
      ("KnownGender", option_to_yojson known_gender_to_yojson x.known_gender);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Urls", option_to_yojson urls_to_yojson x.urls);
    ]

let get_celebrity_info_request_to_yojson (x : get_celebrity_info_request) =
  assoc_to_yojson [ ("Id", Some (rekognition_unique_id_to_yojson x.id)) ]

let distribute_dataset_entries_response_to_yojson = unit_to_yojson

let distribute_dataset_to_yojson (x : distribute_dataset) =
  assoc_to_yojson [ ("Arn", Some (dataset_arn_to_yojson x.arn)) ]

let distribute_dataset_metadata_list_to_yojson tree =
  list_to_yojson distribute_dataset_to_yojson tree

let distribute_dataset_entries_request_to_yojson (x : distribute_dataset_entries_request) =
  assoc_to_yojson [ ("Datasets", Some (distribute_dataset_metadata_list_to_yojson x.datasets)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let disassociated_face_to_yojson (x : disassociated_face) =
  assoc_to_yojson [ ("FaceId", option_to_yojson face_id_to_yojson x.face_id) ]

let disassociated_faces_list_to_yojson tree = list_to_yojson disassociated_face_to_yojson tree

let disassociate_faces_response_to_yojson (x : disassociate_faces_response) =
  assoc_to_yojson
    [
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
      ( "UnsuccessfulFaceDisassociations",
        option_to_yojson unsuccessful_face_disassociation_list_to_yojson
          x.unsuccessful_face_disassociations );
      ( "DisassociatedFaces",
        option_to_yojson disassociated_faces_list_to_yojson x.disassociated_faces );
    ]

let disassociate_faces_request_to_yojson (x : disassociate_faces_request) =
  assoc_to_yojson
    [
      ("FaceIds", Some (user_face_id_list_to_yojson x.face_ids));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("UserId", Some (user_id_to_yojson x.user_id));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let detect_text_response_to_yojson (x : detect_text_response) =
  assoc_to_yojson
    [
      ("TextModelVersion", option_to_yojson string__to_yojson x.text_model_version);
      ("TextDetections", option_to_yojson text_detection_list_to_yojson x.text_detections);
    ]

let detect_text_filters_to_yojson (x : detect_text_filters) =
  assoc_to_yojson
    [
      ("RegionsOfInterest", option_to_yojson regions_of_interest_to_yojson x.regions_of_interest);
      ("WordFilter", option_to_yojson detection_filter_to_yojson x.word_filter);
    ]

let detect_text_request_to_yojson (x : detect_text_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson detect_text_filters_to_yojson x.filters);
      ("Image", Some (image_to_yojson x.image));
    ]

let body_part_to_yojson (x : body_part) =
  match x with
  | RIGHT_HAND -> `String "RIGHT_HAND"
  | LEFT_HAND -> `String "LEFT_HAND"
  | HEAD -> `String "HEAD"
  | FACE -> `String "FACE"

let protective_equipment_type_to_yojson (x : protective_equipment_type) =
  match x with
  | HEAD_COVER -> `String "HEAD_COVER"
  | HAND_COVER -> `String "HAND_COVER"
  | FACE_COVER -> `String "FACE_COVER"

let covers_body_part_to_yojson (x : covers_body_part) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let equipment_detection_to_yojson (x : equipment_detection) =
  assoc_to_yojson
    [
      ("CoversBodyPart", option_to_yojson covers_body_part_to_yojson x.covers_body_part);
      ("Type", option_to_yojson protective_equipment_type_to_yojson x.type_);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let equipment_detections_to_yojson tree = list_to_yojson equipment_detection_to_yojson tree

let protective_equipment_body_part_to_yojson (x : protective_equipment_body_part) =
  assoc_to_yojson
    [
      ("EquipmentDetections", option_to_yojson equipment_detections_to_yojson x.equipment_detections);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Name", option_to_yojson body_part_to_yojson x.name);
    ]

let body_parts_to_yojson tree = list_to_yojson protective_equipment_body_part_to_yojson tree

let protective_equipment_person_to_yojson (x : protective_equipment_person) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson u_integer_to_yojson x.id);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("BodyParts", option_to_yojson body_parts_to_yojson x.body_parts);
    ]

let protective_equipment_persons_to_yojson tree =
  list_to_yojson protective_equipment_person_to_yojson tree

let protective_equipment_person_ids_to_yojson tree = list_to_yojson u_integer_to_yojson tree

let protective_equipment_summary_to_yojson (x : protective_equipment_summary) =
  assoc_to_yojson
    [
      ( "PersonsIndeterminate",
        option_to_yojson protective_equipment_person_ids_to_yojson x.persons_indeterminate );
      ( "PersonsWithoutRequiredEquipment",
        option_to_yojson protective_equipment_person_ids_to_yojson
          x.persons_without_required_equipment );
      ( "PersonsWithRequiredEquipment",
        option_to_yojson protective_equipment_person_ids_to_yojson x.persons_with_required_equipment
      );
    ]

let detect_protective_equipment_response_to_yojson (x : detect_protective_equipment_response) =
  assoc_to_yojson
    [
      ("Summary", option_to_yojson protective_equipment_summary_to_yojson x.summary);
      ("Persons", option_to_yojson protective_equipment_persons_to_yojson x.persons);
      ( "ProtectiveEquipmentModelVersion",
        option_to_yojson string__to_yojson x.protective_equipment_model_version );
    ]

let protective_equipment_types_to_yojson tree =
  list_to_yojson protective_equipment_type_to_yojson tree

let protective_equipment_summarization_attributes_to_yojson
    (x : protective_equipment_summarization_attributes) =
  assoc_to_yojson
    [
      ( "RequiredEquipmentTypes",
        Some (protective_equipment_types_to_yojson x.required_equipment_types) );
      ("MinConfidence", Some (percent_to_yojson x.min_confidence));
    ]

let detect_protective_equipment_request_to_yojson (x : detect_protective_equipment_request) =
  assoc_to_yojson
    [
      ( "SummarizationAttributes",
        option_to_yojson protective_equipment_summarization_attributes_to_yojson
          x.summarization_attributes );
      ("Image", Some (image_to_yojson x.image));
    ]

let human_loop_quota_exceeded_exception_to_yojson (x : human_loop_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Logref", option_to_yojson string__to_yojson x.logref);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
      ("QuotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let moderation_labels_to_yojson tree = list_to_yojson moderation_label_to_yojson tree
let human_loop_arn_to_yojson = string_to_yojson
let human_loop_activation_reason_to_yojson = string_to_yojson

let human_loop_activation_reasons_to_yojson tree =
  list_to_yojson human_loop_activation_reason_to_yojson tree

let human_loop_activation_output_to_yojson (x : human_loop_activation_output) =
  assoc_to_yojson
    [
      ( "HumanLoopActivationConditionsEvaluationResults",
        option_to_yojson
          synthesized_json_human_loop_activation_conditions_evaluation_results_to_yojson
          x.human_loop_activation_conditions_evaluation_results );
      ( "HumanLoopActivationReasons",
        option_to_yojson human_loop_activation_reasons_to_yojson x.human_loop_activation_reasons );
      ("HumanLoopArn", option_to_yojson human_loop_arn_to_yojson x.human_loop_arn);
    ]

let detect_moderation_labels_response_to_yojson (x : detect_moderation_labels_response) =
  assoc_to_yojson
    [
      ("ContentTypes", option_to_yojson content_types_to_yojson x.content_types);
      ("ProjectVersion", option_to_yojson project_version_id_to_yojson x.project_version);
      ( "HumanLoopActivationOutput",
        option_to_yojson human_loop_activation_output_to_yojson x.human_loop_activation_output );
      ("ModerationModelVersion", option_to_yojson string__to_yojson x.moderation_model_version);
      ("ModerationLabels", option_to_yojson moderation_labels_to_yojson x.moderation_labels);
    ]

let human_loop_name_to_yojson = string_to_yojson
let flow_definition_arn_to_yojson = string_to_yojson

let content_classifier_to_yojson (x : content_classifier) =
  match x with
  | FREE_OF_ADULT_CONTENT -> `String "FreeOfAdultContent"
  | FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION -> `String "FreeOfPersonallyIdentifiableInformation"

let content_classifiers_to_yojson tree = list_to_yojson content_classifier_to_yojson tree

let human_loop_data_attributes_to_yojson (x : human_loop_data_attributes) =
  assoc_to_yojson
    [ ("ContentClassifiers", option_to_yojson content_classifiers_to_yojson x.content_classifiers) ]

let human_loop_config_to_yojson (x : human_loop_config) =
  assoc_to_yojson
    [
      ("DataAttributes", option_to_yojson human_loop_data_attributes_to_yojson x.data_attributes);
      ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn));
      ("HumanLoopName", Some (human_loop_name_to_yojson x.human_loop_name));
    ]

let detect_moderation_labels_request_to_yojson (x : detect_moderation_labels_request) =
  assoc_to_yojson
    [
      ("ProjectVersion", option_to_yojson project_version_id_to_yojson x.project_version);
      ("HumanLoopConfig", option_to_yojson human_loop_config_to_yojson x.human_loop_config);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("Image", Some (image_to_yojson x.image));
    ]

let labels_to_yojson tree = list_to_yojson label_to_yojson tree

let detect_labels_image_quality_to_yojson (x : detect_labels_image_quality) =
  assoc_to_yojson
    [
      ("Contrast", option_to_yojson float__to_yojson x.contrast);
      ("Sharpness", option_to_yojson float__to_yojson x.sharpness);
      ("Brightness", option_to_yojson float__to_yojson x.brightness);
    ]

let detect_labels_image_foreground_to_yojson (x : detect_labels_image_foreground) =
  assoc_to_yojson
    [
      ("DominantColors", option_to_yojson dominant_colors_to_yojson x.dominant_colors);
      ("Quality", option_to_yojson detect_labels_image_quality_to_yojson x.quality);
    ]

let detect_labels_image_background_to_yojson (x : detect_labels_image_background) =
  assoc_to_yojson
    [
      ("DominantColors", option_to_yojson dominant_colors_to_yojson x.dominant_colors);
      ("Quality", option_to_yojson detect_labels_image_quality_to_yojson x.quality);
    ]

let detect_labels_image_properties_to_yojson (x : detect_labels_image_properties) =
  assoc_to_yojson
    [
      ("Background", option_to_yojson detect_labels_image_background_to_yojson x.background);
      ("Foreground", option_to_yojson detect_labels_image_foreground_to_yojson x.foreground);
      ("DominantColors", option_to_yojson dominant_colors_to_yojson x.dominant_colors);
      ("Quality", option_to_yojson detect_labels_image_quality_to_yojson x.quality);
    ]

let detect_labels_response_to_yojson (x : detect_labels_response) =
  assoc_to_yojson
    [
      ( "ImageProperties",
        option_to_yojson detect_labels_image_properties_to_yojson x.image_properties );
      ("LabelModelVersion", option_to_yojson string__to_yojson x.label_model_version);
      ( "OrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.orientation_correction );
      ("Labels", option_to_yojson labels_to_yojson x.labels);
    ]

let detect_labels_feature_name_to_yojson (x : detect_labels_feature_name) =
  match x with
  | IMAGE_PROPERTIES -> `String "IMAGE_PROPERTIES"
  | GENERAL_LABELS -> `String "GENERAL_LABELS"

let detect_labels_feature_list_to_yojson tree =
  list_to_yojson detect_labels_feature_name_to_yojson tree

let detect_labels_max_dominant_colors_to_yojson = int_to_yojson

let detect_labels_image_properties_settings_to_yojson (x : detect_labels_image_properties_settings)
    =
  assoc_to_yojson
    [
      ( "MaxDominantColors",
        option_to_yojson detect_labels_max_dominant_colors_to_yojson x.max_dominant_colors );
    ]

let detect_labels_settings_to_yojson (x : detect_labels_settings) =
  assoc_to_yojson
    [
      ( "ImageProperties",
        option_to_yojson detect_labels_image_properties_settings_to_yojson x.image_properties );
      ("GeneralLabels", option_to_yojson general_labels_settings_to_yojson x.general_labels);
    ]

let detect_labels_request_to_yojson (x : detect_labels_request) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson detect_labels_settings_to_yojson x.settings);
      ("Features", option_to_yojson detect_labels_feature_list_to_yojson x.features);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("MaxLabels", option_to_yojson u_integer_to_yojson x.max_labels);
      ("Image", Some (image_to_yojson x.image));
    ]

let face_detail_list_to_yojson tree = list_to_yojson face_detail_to_yojson tree

let detect_faces_response_to_yojson (x : detect_faces_response) =
  assoc_to_yojson
    [
      ( "OrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.orientation_correction );
      ("FaceDetails", option_to_yojson face_detail_list_to_yojson x.face_details);
    ]

let detect_faces_request_to_yojson (x : detect_faces_request) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("Image", Some (image_to_yojson x.image));
    ]

let custom_label_to_yojson (x : custom_label) =
  assoc_to_yojson
    [
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let custom_labels_to_yojson tree = list_to_yojson custom_label_to_yojson tree

let detect_custom_labels_response_to_yojson (x : detect_custom_labels_response) =
  assoc_to_yojson [ ("CustomLabels", option_to_yojson custom_labels_to_yojson x.custom_labels) ]

let detect_custom_labels_request_to_yojson (x : detect_custom_labels_request) =
  assoc_to_yojson
    [
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("MaxResults", option_to_yojson u_integer_to_yojson x.max_results);
      ("Image", Some (image_to_yojson x.image));
      ("ProjectVersionArn", Some (project_version_arn_to_yojson x.project_version_arn));
    ]

let describe_stream_processor_response_to_yojson (x : describe_stream_processor_response) =
  assoc_to_yojson
    [
      ( "DataSharingPreference",
        option_to_yojson stream_processor_data_sharing_preference_to_yojson
          x.data_sharing_preference );
      ("RegionsOfInterest", option_to_yojson regions_of_interest_to_yojson x.regions_of_interest);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "NotificationChannel",
        option_to_yojson stream_processor_notification_channel_to_yojson x.notification_channel );
      ("Settings", option_to_yojson stream_processor_settings_to_yojson x.settings);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Output", option_to_yojson stream_processor_output_to_yojson x.output);
      ("Input", option_to_yojson stream_processor_input_to_yojson x.input);
      ("LastUpdateTimestamp", option_to_yojson date_time_to_yojson x.last_update_timestamp);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("Status", option_to_yojson stream_processor_status_to_yojson x.status);
      ("StreamProcessorArn", option_to_yojson stream_processor_arn_to_yojson x.stream_processor_arn);
      ("Name", option_to_yojson stream_processor_name_to_yojson x.name);
    ]

let describe_stream_processor_request_to_yojson (x : describe_stream_processor_request) =
  assoc_to_yojson [ ("Name", Some (stream_processor_name_to_yojson x.name)) ]

let output_config_to_yojson (x : output_config) =
  assoc_to_yojson
    [
      ("S3KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.s3_key_prefix);
      ("S3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
    ]

let evaluation_result_to_yojson (x : evaluation_result) =
  assoc_to_yojson
    [
      ("Summary", option_to_yojson summary_to_yojson x.summary);
      ("F1Score", option_to_yojson float__to_yojson x.f1_score);
    ]

let customization_feature_to_yojson (x : customization_feature) =
  match x with
  | CUSTOM_LABELS -> `String "CUSTOM_LABELS"
  | CONTENT_MODERATION -> `String "CONTENT_MODERATION"

let customization_feature_content_moderation_config_to_yojson
    (x : customization_feature_content_moderation_config) =
  assoc_to_yojson
    [ ("ConfidenceThreshold", option_to_yojson percent_to_yojson x.confidence_threshold) ]

let customization_feature_config_to_yojson (x : customization_feature_config) =
  assoc_to_yojson
    [
      ( "ContentModeration",
        option_to_yojson customization_feature_content_moderation_config_to_yojson
          x.content_moderation );
    ]

let project_version_description_to_yojson (x : project_version_description) =
  assoc_to_yojson
    [
      ("FeatureConfig", option_to_yojson customization_feature_config_to_yojson x.feature_config);
      ("BaseModelVersion", option_to_yojson string__to_yojson x.base_model_version);
      ("Feature", option_to_yojson customization_feature_to_yojson x.feature);
      ("VersionDescription", option_to_yojson version_description_to_yojson x.version_description);
      ( "SourceProjectVersionArn",
        option_to_yojson project_version_arn_to_yojson x.source_project_version_arn );
      ("MaxInferenceUnits", option_to_yojson inference_units_to_yojson x.max_inference_units);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("ManifestSummary", option_to_yojson ground_truth_manifest_to_yojson x.manifest_summary);
      ("EvaluationResult", option_to_yojson evaluation_result_to_yojson x.evaluation_result);
      ("TestingDataResult", option_to_yojson testing_data_result_to_yojson x.testing_data_result);
      ("TrainingDataResult", option_to_yojson training_data_result_to_yojson x.training_data_result);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("TrainingEndTimestamp", option_to_yojson date_time_to_yojson x.training_end_timestamp);
      ( "BillableTrainingTimeInSeconds",
        option_to_yojson u_long_to_yojson x.billable_training_time_in_seconds );
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson project_version_status_to_yojson x.status);
      ("MinInferenceUnits", option_to_yojson inference_units_to_yojson x.min_inference_units);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("ProjectVersionArn", option_to_yojson project_version_arn_to_yojson x.project_version_arn);
    ]

let project_version_descriptions_to_yojson tree =
  list_to_yojson project_version_description_to_yojson tree

let describe_project_versions_response_to_yojson (x : describe_project_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ( "ProjectVersionDescriptions",
        option_to_yojson project_version_descriptions_to_yojson x.project_version_descriptions );
    ]

let project_versions_page_size_to_yojson = int_to_yojson

let describe_project_versions_request_to_yojson (x : describe_project_versions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson project_versions_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("VersionNames", option_to_yojson version_names_to_yojson x.version_names);
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
    ]

let project_status_to_yojson (x : project_status) =
  match x with
  | DELETING -> `String "DELETING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let dataset_type_to_yojson (x : dataset_type) =
  match x with TEST -> `String "TEST" | TRAIN -> `String "TRAIN"

let dataset_status_to_yojson (x : dataset_status) =
  match x with
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_COMPLETE -> `String "UPDATE_COMPLETE"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"

let dataset_status_message_code_to_yojson (x : dataset_status_message_code) =
  match x with
  | CLIENT_ERROR -> `String "CLIENT_ERROR"
  | SERVICE_ERROR -> `String "SERVICE_ERROR"
  | SUCCESS -> `String "SUCCESS"

let dataset_metadata_to_yojson (x : dataset_metadata) =
  assoc_to_yojson
    [
      ( "StatusMessageCode",
        option_to_yojson dataset_status_message_code_to_yojson x.status_message_code );
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
    ]

let dataset_metadata_list_to_yojson tree = list_to_yojson dataset_metadata_to_yojson tree

let project_auto_update_to_yojson (x : project_auto_update) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let project_description_to_yojson (x : project_description) =
  assoc_to_yojson
    [
      ("AutoUpdate", option_to_yojson project_auto_update_to_yojson x.auto_update);
      ("Feature", option_to_yojson customization_feature_to_yojson x.feature);
      ("Datasets", option_to_yojson dataset_metadata_list_to_yojson x.datasets);
      ("Status", option_to_yojson project_status_to_yojson x.status);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("ProjectArn", option_to_yojson project_arn_to_yojson x.project_arn);
    ]

let project_descriptions_to_yojson tree = list_to_yojson project_description_to_yojson tree

let describe_projects_response_to_yojson (x : describe_projects_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("ProjectDescriptions", option_to_yojson project_descriptions_to_yojson x.project_descriptions);
    ]

let projects_page_size_to_yojson = int_to_yojson
let project_name_to_yojson = string_to_yojson
let project_names_to_yojson tree = list_to_yojson project_name_to_yojson tree
let customization_features_to_yojson tree = list_to_yojson customization_feature_to_yojson tree

let describe_projects_request_to_yojson (x : describe_projects_request) =
  assoc_to_yojson
    [
      ("Features", option_to_yojson customization_features_to_yojson x.features);
      ("ProjectNames", option_to_yojson project_names_to_yojson x.project_names);
      ("MaxResults", option_to_yojson projects_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
    ]

let dataset_stats_to_yojson (x : dataset_stats) =
  assoc_to_yojson
    [
      ("ErrorEntries", option_to_yojson u_integer_to_yojson x.error_entries);
      ("TotalLabels", option_to_yojson u_integer_to_yojson x.total_labels);
      ("TotalEntries", option_to_yojson u_integer_to_yojson x.total_entries);
      ("LabeledEntries", option_to_yojson u_integer_to_yojson x.labeled_entries);
    ]

let dataset_description_to_yojson (x : dataset_description) =
  assoc_to_yojson
    [
      ("DatasetStats", option_to_yojson dataset_stats_to_yojson x.dataset_stats);
      ( "StatusMessageCode",
        option_to_yojson dataset_status_message_code_to_yojson x.status_message_code );
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("LastUpdatedTimestamp", option_to_yojson date_time_to_yojson x.last_updated_timestamp);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
    ]

let describe_dataset_response_to_yojson (x : describe_dataset_response) =
  assoc_to_yojson
    [ ("DatasetDescription", option_to_yojson dataset_description_to_yojson x.dataset_description) ]

let describe_dataset_request_to_yojson (x : describe_dataset_request) =
  assoc_to_yojson [ ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn)) ]

let describe_collection_response_to_yojson (x : describe_collection_response) =
  assoc_to_yojson
    [
      ("UserCount", option_to_yojson u_long_to_yojson x.user_count);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("CollectionARN", option_to_yojson string__to_yojson x.collection_ar_n);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("FaceCount", option_to_yojson u_long_to_yojson x.face_count);
    ]

let describe_collection_request_to_yojson (x : describe_collection_request) =
  assoc_to_yojson [ ("CollectionId", Some (collection_id_to_yojson x.collection_id)) ]

let delete_user_response_to_yojson = unit_to_yojson

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("UserId", Some (user_id_to_yojson x.user_id));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let delete_stream_processor_response_to_yojson = unit_to_yojson

let delete_stream_processor_request_to_yojson (x : delete_stream_processor_request) =
  assoc_to_yojson [ ("Name", Some (stream_processor_name_to_yojson x.name)) ]

let delete_project_version_response_to_yojson (x : delete_project_version_response) =
  assoc_to_yojson [ ("Status", option_to_yojson project_version_status_to_yojson x.status) ]

let delete_project_version_request_to_yojson (x : delete_project_version_request) =
  assoc_to_yojson
    [ ("ProjectVersionArn", Some (project_version_arn_to_yojson x.project_version_arn)) ]

let delete_project_policy_response_to_yojson = unit_to_yojson

let delete_project_policy_request_to_yojson (x : delete_project_policy_request) =
  assoc_to_yojson
    [
      ( "PolicyRevisionId",
        option_to_yojson project_policy_revision_id_to_yojson x.policy_revision_id );
      ("PolicyName", Some (project_policy_name_to_yojson x.policy_name));
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
    ]

let delete_project_response_to_yojson (x : delete_project_response) =
  assoc_to_yojson [ ("Status", option_to_yojson project_status_to_yojson x.status) ]

let delete_project_request_to_yojson (x : delete_project_request) =
  assoc_to_yojson [ ("ProjectArn", Some (project_arn_to_yojson x.project_arn)) ]

let delete_faces_response_to_yojson (x : delete_faces_response) =
  assoc_to_yojson
    [
      ( "UnsuccessfulFaceDeletions",
        option_to_yojson unsuccessful_face_deletions_list_to_yojson x.unsuccessful_face_deletions );
      ("DeletedFaces", option_to_yojson face_id_list_to_yojson x.deleted_faces);
    ]

let delete_faces_request_to_yojson (x : delete_faces_request) =
  assoc_to_yojson
    [
      ("FaceIds", Some (face_id_list_to_yojson x.face_ids));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let delete_dataset_response_to_yojson = unit_to_yojson

let delete_dataset_request_to_yojson (x : delete_dataset_request) =
  assoc_to_yojson [ ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn)) ]

let delete_collection_response_to_yojson (x : delete_collection_response) =
  assoc_to_yojson [ ("StatusCode", option_to_yojson u_integer_to_yojson x.status_code) ]

let delete_collection_request_to_yojson (x : delete_collection_request) =
  assoc_to_yojson [ ("CollectionId", Some (collection_id_to_yojson x.collection_id)) ]

let create_user_response_to_yojson = unit_to_yojson

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("UserId", Some (user_id_to_yojson x.user_id));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let create_stream_processor_response_to_yojson (x : create_stream_processor_response) =
  assoc_to_yojson
    [
      ("StreamProcessorArn", option_to_yojson stream_processor_arn_to_yojson x.stream_processor_arn);
    ]

let create_stream_processor_request_to_yojson (x : create_stream_processor_request) =
  assoc_to_yojson
    [
      ( "DataSharingPreference",
        option_to_yojson stream_processor_data_sharing_preference_to_yojson
          x.data_sharing_preference );
      ("RegionsOfInterest", option_to_yojson regions_of_interest_to_yojson x.regions_of_interest);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "NotificationChannel",
        option_to_yojson stream_processor_notification_channel_to_yojson x.notification_channel );
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Settings", Some (stream_processor_settings_to_yojson x.settings));
      ("Name", Some (stream_processor_name_to_yojson x.name));
      ("Output", Some (stream_processor_output_to_yojson x.output));
      ("Input", Some (stream_processor_input_to_yojson x.input));
    ]

let create_project_version_response_to_yojson (x : create_project_version_response) =
  assoc_to_yojson
    [ ("ProjectVersionArn", option_to_yojson project_version_arn_to_yojson x.project_version_arn) ]

let create_project_version_request_to_yojson (x : create_project_version_request) =
  assoc_to_yojson
    [
      ("FeatureConfig", option_to_yojson customization_feature_config_to_yojson x.feature_config);
      ("VersionDescription", option_to_yojson version_description_to_yojson x.version_description);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("TestingData", option_to_yojson testing_data_to_yojson x.testing_data);
      ("TrainingData", option_to_yojson training_data_to_yojson x.training_data);
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("VersionName", Some (version_name_to_yojson x.version_name));
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
    ]

let create_project_response_to_yojson (x : create_project_response) =
  assoc_to_yojson [ ("ProjectArn", option_to_yojson project_arn_to_yojson x.project_arn) ]

let create_project_request_to_yojson (x : create_project_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("AutoUpdate", option_to_yojson project_auto_update_to_yojson x.auto_update);
      ("Feature", option_to_yojson customization_feature_to_yojson x.feature);
      ("ProjectName", Some (project_name_to_yojson x.project_name));
    ]

let create_face_liveness_session_response_to_yojson (x : create_face_liveness_session_response) =
  assoc_to_yojson [ ("SessionId", Some (liveness_session_id_to_yojson x.session_id)) ]

let liveness_s3_key_prefix_to_yojson = string_to_yojson

let liveness_output_config_to_yojson (x : liveness_output_config) =
  assoc_to_yojson
    [
      ("S3KeyPrefix", option_to_yojson liveness_s3_key_prefix_to_yojson x.s3_key_prefix);
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
    ]

let audit_images_limit_to_yojson = int_to_yojson

let challenge_preference_to_yojson (x : challenge_preference) =
  assoc_to_yojson
    [
      ("Versions", option_to_yojson versions_to_yojson x.versions);
      ("Type", Some (challenge_type_to_yojson x.type_));
    ]

let challenge_preferences_to_yojson tree = list_to_yojson challenge_preference_to_yojson tree

let create_face_liveness_session_request_settings_to_yojson
    (x : create_face_liveness_session_request_settings) =
  assoc_to_yojson
    [
      ( "ChallengePreferences",
        option_to_yojson challenge_preferences_to_yojson x.challenge_preferences );
      ("AuditImagesLimit", option_to_yojson audit_images_limit_to_yojson x.audit_images_limit);
      ("OutputConfig", option_to_yojson liveness_output_config_to_yojson x.output_config);
    ]

let create_face_liveness_session_request_to_yojson (x : create_face_liveness_session_request) =
  assoc_to_yojson
    [
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ( "Settings",
        option_to_yojson create_face_liveness_session_request_settings_to_yojson x.settings );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson [ ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn) ]

let dataset_source_to_yojson (x : dataset_source) =
  assoc_to_yojson
    [
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ( "GroundTruthManifest",
        option_to_yojson ground_truth_manifest_to_yojson x.ground_truth_manifest );
    ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("DatasetType", Some (dataset_type_to_yojson x.dataset_type));
      ("DatasetSource", option_to_yojson dataset_source_to_yojson x.dataset_source);
    ]

let create_collection_response_to_yojson (x : create_collection_response) =
  assoc_to_yojson
    [
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("CollectionArn", option_to_yojson string__to_yojson x.collection_arn);
      ("StatusCode", option_to_yojson u_integer_to_yojson x.status_code);
    ]

let create_collection_request_to_yojson (x : create_collection_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]

let copy_project_version_response_to_yojson (x : copy_project_version_response) =
  assoc_to_yojson
    [ ("ProjectVersionArn", option_to_yojson project_version_arn_to_yojson x.project_version_arn) ]

let copy_project_version_request_to_yojson (x : copy_project_version_request) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("VersionName", Some (version_name_to_yojson x.version_name));
      ("DestinationProjectArn", Some (project_arn_to_yojson x.destination_project_arn));
      ("SourceProjectVersionArn", Some (project_version_arn_to_yojson x.source_project_version_arn));
      ("SourceProjectArn", Some (project_arn_to_yojson x.source_project_arn));
    ]

let compared_source_image_face_to_yojson (x : compared_source_image_face) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let compare_faces_match_to_yojson (x : compare_faces_match) =
  assoc_to_yojson
    [
      ("Face", option_to_yojson compared_face_to_yojson x.face);
      ("Similarity", option_to_yojson percent_to_yojson x.similarity);
    ]

let compare_faces_match_list_to_yojson tree = list_to_yojson compare_faces_match_to_yojson tree
let compare_faces_unmatch_list_to_yojson tree = list_to_yojson compared_face_to_yojson tree

let compare_faces_response_to_yojson (x : compare_faces_response) =
  assoc_to_yojson
    [
      ( "TargetImageOrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.target_image_orientation_correction );
      ( "SourceImageOrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.source_image_orientation_correction );
      ("UnmatchedFaces", option_to_yojson compare_faces_unmatch_list_to_yojson x.unmatched_faces);
      ("FaceMatches", option_to_yojson compare_faces_match_list_to_yojson x.face_matches);
      ("SourceImageFace", option_to_yojson compared_source_image_face_to_yojson x.source_image_face);
    ]

let compare_faces_request_to_yojson (x : compare_faces_request) =
  assoc_to_yojson
    [
      ("QualityFilter", option_to_yojson quality_filter_to_yojson x.quality_filter);
      ("SimilarityThreshold", option_to_yojson percent_to_yojson x.similarity_threshold);
      ("TargetImage", Some (image_to_yojson x.target_image));
      ("SourceImage", Some (image_to_yojson x.source_image));
    ]

let associated_face_to_yojson (x : associated_face) =
  assoc_to_yojson [ ("FaceId", option_to_yojson face_id_to_yojson x.face_id) ]

let associated_faces_list_to_yojson tree = list_to_yojson associated_face_to_yojson tree

let associate_faces_response_to_yojson (x : associate_faces_response) =
  assoc_to_yojson
    [
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
      ( "UnsuccessfulFaceAssociations",
        option_to_yojson unsuccessful_face_association_list_to_yojson
          x.unsuccessful_face_associations );
      ("AssociatedFaces", option_to_yojson associated_faces_list_to_yojson x.associated_faces);
    ]

let associate_faces_request_to_yojson (x : associate_faces_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("UserMatchThreshold", option_to_yojson percent_to_yojson x.user_match_threshold);
      ("FaceIds", Some (user_face_id_list_to_yojson x.face_ids));
      ("UserId", Some (user_id_to_yojson x.user_id));
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
    ]
