open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let u_integer_to_yojson = int_to_yojson

let age_range_to_yojson (x : age_range) =
  assoc_to_yojson
    [
      ("Low", option_to_yojson u_integer_to_yojson x.low);
      ("High", option_to_yojson u_integer_to_yojson x.high);
    ]

let s3_object_version_to_yojson = string_to_yojson
let s3_object_name_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let s3_object_to_yojson (x : s3_object) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
      ("Name", option_to_yojson s3_object_name_to_yojson x.name);
      ("Version", option_to_yojson s3_object_version_to_yojson x.version);
    ]

let ground_truth_manifest_to_yojson (x : ground_truth_manifest) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let asset_to_yojson (x : asset) =
  assoc_to_yojson
    [
      ( "GroundTruthManifest",
        option_to_yojson ground_truth_manifest_to_yojson x.ground_truth_manifest );
    ]

let assets_to_yojson tree = list_to_yojson asset_to_yojson tree

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let provisioned_throughput_exceeded_exception_to_yojson
    (x : provisioned_throughput_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let user_status_to_yojson (x : user_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"

let unsuccessful_face_association_reason_to_yojson (x : unsuccessful_face_association_reason) =
  match x with
  | FACE_NOT_FOUND -> `String "FACE_NOT_FOUND"
  | ASSOCIATED_TO_A_DIFFERENT_USER -> `String "ASSOCIATED_TO_A_DIFFERENT_USER"
  | LOW_MATCH_CONFIDENCE -> `String "LOW_MATCH_CONFIDENCE"

let unsuccessful_face_association_reasons_to_yojson tree =
  list_to_yojson unsuccessful_face_association_reason_to_yojson tree

let percent_to_yojson = float_to_yojson
let user_id_to_yojson = string_to_yojson
let face_id_to_yojson = string_to_yojson

let unsuccessful_face_association_to_yojson (x : unsuccessful_face_association) =
  assoc_to_yojson
    [
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Reasons", option_to_yojson unsuccessful_face_association_reasons_to_yojson x.reasons);
    ]

let unsuccessful_face_association_list_to_yojson tree =
  list_to_yojson unsuccessful_face_association_to_yojson tree

let associated_face_to_yojson (x : associated_face) =
  assoc_to_yojson [ ("FaceId", option_to_yojson face_id_to_yojson x.face_id) ]

let associated_faces_list_to_yojson tree = list_to_yojson associated_face_to_yojson tree

let associate_faces_response_to_yojson (x : associate_faces_response) =
  assoc_to_yojson
    [
      ("AssociatedFaces", option_to_yojson associated_faces_list_to_yojson x.associated_faces);
      ( "UnsuccessfulFaceAssociations",
        option_to_yojson unsuccessful_face_association_list_to_yojson
          x.unsuccessful_face_associations );
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
    ]

let client_request_token_to_yojson = string_to_yojson
let user_face_id_list_to_yojson tree = list_to_yojson face_id_to_yojson tree
let collection_id_to_yojson = string_to_yojson

let associate_faces_request_to_yojson (x : associate_faces_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("UserId", Some (user_id_to_yojson x.user_id));
      ("FaceIds", Some (user_face_id_list_to_yojson x.face_ids));
      ("UserMatchThreshold", option_to_yojson percent_to_yojson x.user_match_threshold);
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let attribute_to_yojson (x : attribute) =
  match x with
  | DEFAULT -> `String "DEFAULT"
  | ALL -> `String "ALL"
  | AGE_RANGE -> `String "AGE_RANGE"
  | BEARD -> `String "BEARD"
  | EMOTIONS -> `String "EMOTIONS"
  | EYE_DIRECTION -> `String "EYE_DIRECTION"
  | EYEGLASSES -> `String "EYEGLASSES"
  | EYES_OPEN -> `String "EYES_OPEN"
  | GENDER -> `String "GENDER"
  | MOUTH_OPEN -> `String "MOUTH_OPEN"
  | MUSTACHE -> `String "MUSTACHE"
  | FACE_OCCLUDED -> `String "FACE_OCCLUDED"
  | SMILE -> `String "SMILE"
  | SUNGLASSES -> `String "SUNGLASSES"

let attributes_to_yojson tree = list_to_yojson attribute_to_yojson tree
let u_long_to_yojson = long_to_yojson

let audio_metadata_to_yojson (x : audio_metadata) =
  assoc_to_yojson
    [
      ("Codec", option_to_yojson string__to_yojson x.codec);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("SampleRate", option_to_yojson u_long_to_yojson x.sample_rate);
      ("NumberOfChannels", option_to_yojson u_long_to_yojson x.number_of_channels);
    ]

let audio_metadata_list_to_yojson tree = list_to_yojson audio_metadata_to_yojson tree
let float__to_yojson = float_to_yojson

let bounding_box_to_yojson (x : bounding_box) =
  assoc_to_yojson
    [
      ("Width", option_to_yojson float__to_yojson x.width);
      ("Height", option_to_yojson float__to_yojson x.height);
      ("Left", option_to_yojson float__to_yojson x.left);
      ("Top", option_to_yojson float__to_yojson x.top);
    ]

let liveness_image_blob_to_yojson = blob_to_yojson

let audit_image_to_yojson (x : audit_image) =
  assoc_to_yojson
    [
      ("Bytes", option_to_yojson liveness_image_blob_to_yojson x.bytes);
      ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let audit_images_to_yojson tree = list_to_yojson audit_image_to_yojson tree
let audit_images_limit_to_yojson = int_to_yojson
let boolean__to_yojson = bool_to_yojson

let beard_to_yojson (x : beard) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let min_coverage_percentage_to_yojson = float_to_yojson
let max_pixel_threshold_to_yojson = float_to_yojson

let black_frame_to_yojson (x : black_frame) =
  assoc_to_yojson
    [
      ("MaxPixelThreshold", option_to_yojson max_pixel_threshold_to_yojson x.max_pixel_threshold);
      ( "MinCoveragePercentage",
        option_to_yojson min_coverage_percentage_to_yojson x.min_coverage_percentage );
    ]

let body_part_to_yojson (x : body_part) =
  match x with
  | FACE -> `String "FACE"
  | HEAD -> `String "HEAD"
  | LEFT_HAND -> `String "LEFT_HAND"
  | RIGHT_HAND -> `String "RIGHT_HAND"

let covers_body_part_to_yojson (x : covers_body_part) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson boolean__to_yojson x.value);
    ]

let protective_equipment_type_to_yojson (x : protective_equipment_type) =
  match x with
  | FACE_COVER -> `String "FACE_COVER"
  | HAND_COVER -> `String "HAND_COVER"
  | HEAD_COVER -> `String "HEAD_COVER"

let equipment_detection_to_yojson (x : equipment_detection) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Type", option_to_yojson protective_equipment_type_to_yojson x.type_);
      ("CoversBodyPart", option_to_yojson covers_body_part_to_yojson x.covers_body_part);
    ]

let equipment_detections_to_yojson tree = list_to_yojson equipment_detection_to_yojson tree

let protective_equipment_body_part_to_yojson (x : protective_equipment_body_part) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson body_part_to_yojson x.name);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("EquipmentDetections", option_to_yojson equipment_detections_to_yojson x.equipment_detections);
    ]

let body_parts_to_yojson tree = list_to_yojson protective_equipment_body_part_to_yojson tree
let bounding_box_height_to_yojson = float_to_yojson
let bounding_box_width_to_yojson = float_to_yojson

let known_gender_type_to_yojson (x : known_gender_type) =
  match x with
  | Male -> `String "Male"
  | Female -> `String "Female"
  | Nonbinary -> `String "Nonbinary"
  | Unlisted -> `String "Unlisted"

let known_gender_to_yojson (x : known_gender) =
  assoc_to_yojson [ ("Type", option_to_yojson known_gender_type_to_yojson x.type_) ]

let smile_to_yojson (x : smile) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let emotion_name_to_yojson (x : emotion_name) =
  match x with
  | HAPPY -> `String "HAPPY"
  | SAD -> `String "SAD"
  | ANGRY -> `String "ANGRY"
  | CONFUSED -> `String "CONFUSED"
  | DISGUSTED -> `String "DISGUSTED"
  | SURPRISED -> `String "SURPRISED"
  | CALM -> `String "CALM"
  | UNKNOWN -> `String "UNKNOWN"
  | FEAR -> `String "FEAR"

let emotion_to_yojson (x : emotion) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson emotion_name_to_yojson x.type_);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let emotions_to_yojson tree = list_to_yojson emotion_to_yojson tree

let image_quality_to_yojson (x : image_quality) =
  assoc_to_yojson
    [
      ("Brightness", option_to_yojson float__to_yojson x.brightness);
      ("Sharpness", option_to_yojson float__to_yojson x.sharpness);
    ]

let degree_to_yojson = float_to_yojson

let pose_to_yojson (x : pose) =
  assoc_to_yojson
    [
      ("Roll", option_to_yojson degree_to_yojson x.roll);
      ("Yaw", option_to_yojson degree_to_yojson x.yaw);
      ("Pitch", option_to_yojson degree_to_yojson x.pitch);
    ]

let landmark_type_to_yojson (x : landmark_type) =
  match x with
  | EyeLeft -> `String "eyeLeft"
  | EyeRight -> `String "eyeRight"
  | Nose -> `String "nose"
  | MouthLeft -> `String "mouthLeft"
  | MouthRight -> `String "mouthRight"
  | LeftEyeBrowLeft -> `String "leftEyeBrowLeft"
  | LeftEyeBrowRight -> `String "leftEyeBrowRight"
  | LeftEyeBrowUp -> `String "leftEyeBrowUp"
  | RightEyeBrowLeft -> `String "rightEyeBrowLeft"
  | RightEyeBrowRight -> `String "rightEyeBrowRight"
  | RightEyeBrowUp -> `String "rightEyeBrowUp"
  | LeftEyeLeft -> `String "leftEyeLeft"
  | LeftEyeRight -> `String "leftEyeRight"
  | LeftEyeUp -> `String "leftEyeUp"
  | LeftEyeDown -> `String "leftEyeDown"
  | RightEyeLeft -> `String "rightEyeLeft"
  | RightEyeRight -> `String "rightEyeRight"
  | RightEyeUp -> `String "rightEyeUp"
  | RightEyeDown -> `String "rightEyeDown"
  | NoseLeft -> `String "noseLeft"
  | NoseRight -> `String "noseRight"
  | MouthUp -> `String "mouthUp"
  | MouthDown -> `String "mouthDown"
  | LeftPupil -> `String "leftPupil"
  | RightPupil -> `String "rightPupil"
  | UpperJawlineLeft -> `String "upperJawlineLeft"
  | MidJawlineLeft -> `String "midJawlineLeft"
  | ChinBottom -> `String "chinBottom"
  | MidJawlineRight -> `String "midJawlineRight"
  | UpperJawlineRight -> `String "upperJawlineRight"

let landmark_to_yojson (x : landmark) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson landmark_type_to_yojson x.type_);
      ("X", option_to_yojson float__to_yojson x.x);
      ("Y", option_to_yojson float__to_yojson x.y);
    ]

let landmarks_to_yojson tree = list_to_yojson landmark_to_yojson tree

let compared_face_to_yojson (x : compared_face) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Landmarks", option_to_yojson landmarks_to_yojson x.landmarks);
      ("Pose", option_to_yojson pose_to_yojson x.pose);
      ("Quality", option_to_yojson image_quality_to_yojson x.quality);
      ("Emotions", option_to_yojson emotions_to_yojson x.emotions);
      ("Smile", option_to_yojson smile_to_yojson x.smile);
    ]

let rekognition_unique_id_to_yojson = string_to_yojson
let url_to_yojson = string_to_yojson
let urls_to_yojson tree = list_to_yojson url_to_yojson tree

let celebrity_to_yojson (x : celebrity) =
  assoc_to_yojson
    [
      ("Urls", option_to_yojson urls_to_yojson x.urls);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Id", option_to_yojson rekognition_unique_id_to_yojson x.id);
      ("Face", option_to_yojson compared_face_to_yojson x.face);
      ("MatchConfidence", option_to_yojson percent_to_yojson x.match_confidence);
      ("KnownGender", option_to_yojson known_gender_to_yojson x.known_gender);
    ]

let eye_direction_to_yojson (x : eye_direction) =
  assoc_to_yojson
    [
      ("Yaw", option_to_yojson degree_to_yojson x.yaw);
      ("Pitch", option_to_yojson degree_to_yojson x.pitch);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let face_occluded_to_yojson (x : face_occluded) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let mouth_open_to_yojson (x : mouth_open) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let eye_open_to_yojson (x : eye_open) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let mustache_to_yojson (x : mustache) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let gender_type_to_yojson (x : gender_type) =
  match x with Male -> `String "Male" | Female -> `String "Female"

let gender_to_yojson (x : gender) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson gender_type_to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let sunglasses_to_yojson (x : sunglasses) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let eyeglasses_to_yojson (x : eyeglasses) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson boolean__to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let face_detail_to_yojson (x : face_detail) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("AgeRange", option_to_yojson age_range_to_yojson x.age_range);
      ("Smile", option_to_yojson smile_to_yojson x.smile);
      ("Eyeglasses", option_to_yojson eyeglasses_to_yojson x.eyeglasses);
      ("Sunglasses", option_to_yojson sunglasses_to_yojson x.sunglasses);
      ("Gender", option_to_yojson gender_to_yojson x.gender);
      ("Beard", option_to_yojson beard_to_yojson x.beard);
      ("Mustache", option_to_yojson mustache_to_yojson x.mustache);
      ("EyesOpen", option_to_yojson eye_open_to_yojson x.eyes_open);
      ("MouthOpen", option_to_yojson mouth_open_to_yojson x.mouth_open);
      ("Emotions", option_to_yojson emotions_to_yojson x.emotions);
      ("Landmarks", option_to_yojson landmarks_to_yojson x.landmarks);
      ("Pose", option_to_yojson pose_to_yojson x.pose);
      ("Quality", option_to_yojson image_quality_to_yojson x.quality);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("FaceOccluded", option_to_yojson face_occluded_to_yojson x.face_occluded);
      ("EyeDirection", option_to_yojson eye_direction_to_yojson x.eye_direction);
    ]

let celebrity_detail_to_yojson (x : celebrity_detail) =
  assoc_to_yojson
    [
      ("Urls", option_to_yojson urls_to_yojson x.urls);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Id", option_to_yojson rekognition_unique_id_to_yojson x.id);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Face", option_to_yojson face_detail_to_yojson x.face);
      ("KnownGender", option_to_yojson known_gender_to_yojson x.known_gender);
    ]

let celebrity_list_to_yojson tree = list_to_yojson celebrity_to_yojson tree
let timestamp_to_yojson = long_to_yojson

let celebrity_recognition_to_yojson (x : celebrity_recognition) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Celebrity", option_to_yojson celebrity_detail_to_yojson x.celebrity);
    ]

let celebrity_recognition_sort_by_to_yojson (x : celebrity_recognition_sort_by) =
  match x with ID -> `String "ID" | TIMESTAMP -> `String "TIMESTAMP"

let celebrity_recognitions_to_yojson tree = list_to_yojson celebrity_recognition_to_yojson tree
let version_to_yojson = string_to_yojson

let challenge_type_to_yojson (x : challenge_type) =
  match x with
  | FACE_MOVEMENT_AND_LIGHT_CHALLENGE -> `String "FaceMovementAndLightChallenge"
  | FACE_MOVEMENT_CHALLENGE -> `String "FaceMovementChallenge"

let challenge_to_yojson (x : challenge) =
  assoc_to_yojson
    [
      ("Type", Some (challenge_type_to_yojson x.type_));
      ("Version", Some (version_to_yojson x.version));
    ]

let versions_to_yojson (x : versions) =
  assoc_to_yojson
    [
      ("Minimum", option_to_yojson version_to_yojson x.minimum);
      ("Maximum", option_to_yojson version_to_yojson x.maximum);
    ]

let challenge_preference_to_yojson (x : challenge_preference) =
  assoc_to_yojson
    [
      ("Type", Some (challenge_type_to_yojson x.type_));
      ("Versions", option_to_yojson versions_to_yojson x.versions);
    ]

let challenge_preferences_to_yojson tree = list_to_yojson challenge_preference_to_yojson tree
let collection_id_list_to_yojson tree = list_to_yojson collection_id_to_yojson tree

let invalid_s3_object_exception_to_yojson (x : invalid_s3_object_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let invalid_image_format_exception_to_yojson (x : invalid_image_format_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let image_too_large_exception_to_yojson (x : image_too_large_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let orientation_correction_to_yojson (x : orientation_correction) =
  match x with
  | ROTATE_0 -> `String "ROTATE_0"
  | ROTATE_90 -> `String "ROTATE_90"
  | ROTATE_180 -> `String "ROTATE_180"
  | ROTATE_270 -> `String "ROTATE_270"

let compare_faces_unmatch_list_to_yojson tree = list_to_yojson compared_face_to_yojson tree

let compare_faces_match_to_yojson (x : compare_faces_match) =
  assoc_to_yojson
    [
      ("Similarity", option_to_yojson percent_to_yojson x.similarity);
      ("Face", option_to_yojson compared_face_to_yojson x.face);
    ]

let compare_faces_match_list_to_yojson tree = list_to_yojson compare_faces_match_to_yojson tree

let compared_source_image_face_to_yojson (x : compared_source_image_face) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let compare_faces_response_to_yojson (x : compare_faces_response) =
  assoc_to_yojson
    [
      ("SourceImageFace", option_to_yojson compared_source_image_face_to_yojson x.source_image_face);
      ("FaceMatches", option_to_yojson compare_faces_match_list_to_yojson x.face_matches);
      ("UnmatchedFaces", option_to_yojson compare_faces_unmatch_list_to_yojson x.unmatched_faces);
      ( "SourceImageOrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.source_image_orientation_correction );
      ( "TargetImageOrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.target_image_orientation_correction );
    ]

let quality_filter_to_yojson (x : quality_filter) =
  match x with
  | NONE -> `String "NONE"
  | AUTO -> `String "AUTO"
  | LOW -> `String "LOW"
  | MEDIUM -> `String "MEDIUM"
  | HIGH -> `String "HIGH"

let image_blob_to_yojson = blob_to_yojson

let image_to_yojson (x : image) =
  assoc_to_yojson
    [
      ("Bytes", option_to_yojson image_blob_to_yojson x.bytes);
      ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object);
    ]

let compare_faces_request_to_yojson (x : compare_faces_request) =
  assoc_to_yojson
    [
      ("SourceImage", Some (image_to_yojson x.source_image));
      ("TargetImage", Some (image_to_yojson x.target_image));
      ("SimilarityThreshold", option_to_yojson percent_to_yojson x.similarity_threshold);
      ("QualityFilter", option_to_yojson quality_filter_to_yojson x.quality_filter);
    ]

let compared_face_list_to_yojson tree = list_to_yojson compared_face_to_yojson tree
let connected_home_label_to_yojson = string_to_yojson
let connected_home_labels_to_yojson tree = list_to_yojson connected_home_label_to_yojson tree

let connected_home_settings_to_yojson (x : connected_home_settings) =
  assoc_to_yojson
    [
      ("Labels", Some (connected_home_labels_to_yojson x.labels));
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
    ]

let connected_home_settings_for_update_to_yojson (x : connected_home_settings_for_update) =
  assoc_to_yojson
    [
      ("Labels", option_to_yojson connected_home_labels_to_yojson x.labels);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
    ]

let content_classifier_to_yojson (x : content_classifier) =
  match x with
  | FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION -> `String "FreeOfPersonallyIdentifiableInformation"
  | FREE_OF_ADULT_CONTENT -> `String "FreeOfAdultContent"

let content_classifiers_to_yojson tree = list_to_yojson content_classifier_to_yojson tree

let content_moderation_aggregate_by_to_yojson (x : content_moderation_aggregate_by) =
  match x with TIMESTAMPS -> `String "TIMESTAMPS" | SEGMENTS -> `String "SEGMENTS"

let content_type_to_yojson (x : content_type) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let content_types_to_yojson tree = list_to_yojson content_type_to_yojson tree

let moderation_label_to_yojson (x : moderation_label) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("ParentName", option_to_yojson string__to_yojson x.parent_name);
      ("TaxonomyLevel", option_to_yojson u_integer_to_yojson x.taxonomy_level);
    ]

let content_moderation_detection_to_yojson (x : content_moderation_detection) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("ModerationLabel", option_to_yojson moderation_label_to_yojson x.moderation_label);
      ("StartTimestampMillis", option_to_yojson u_long_to_yojson x.start_timestamp_millis);
      ("EndTimestampMillis", option_to_yojson u_long_to_yojson x.end_timestamp_millis);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("ContentTypes", option_to_yojson content_types_to_yojson x.content_types);
    ]

let content_moderation_detections_to_yojson tree =
  list_to_yojson content_moderation_detection_to_yojson tree

let content_moderation_sort_by_to_yojson (x : content_moderation_sort_by) =
  match x with NAME -> `String "NAME" | TIMESTAMP -> `String "TIMESTAMP"

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let project_version_arn_to_yojson = string_to_yojson

let copy_project_version_response_to_yojson (x : copy_project_version_response) =
  assoc_to_yojson
    [ ("ProjectVersionArn", option_to_yojson project_version_arn_to_yojson x.project_version_arn) ]

let kms_key_id_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let s3_key_prefix_to_yojson = string_to_yojson

let output_config_to_yojson (x : output_config) =
  assoc_to_yojson
    [
      ("S3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
      ("S3KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.s3_key_prefix);
    ]

let version_name_to_yojson = string_to_yojson
let project_arn_to_yojson = string_to_yojson

let copy_project_version_request_to_yojson (x : copy_project_version_request) =
  assoc_to_yojson
    [
      ("SourceProjectArn", Some (project_arn_to_yojson x.source_project_arn));
      ("SourceProjectVersionArn", Some (project_version_arn_to_yojson x.source_project_version_arn));
      ("DestinationProjectArn", Some (project_arn_to_yojson x.destination_project_arn));
      ("VersionName", Some (version_name_to_yojson x.version_name));
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let create_collection_response_to_yojson (x : create_collection_response) =
  assoc_to_yojson
    [
      ("StatusCode", option_to_yojson u_integer_to_yojson x.status_code);
      ("CollectionArn", option_to_yojson string__to_yojson x.collection_arn);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
    ]

let create_collection_request_to_yojson (x : create_collection_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let dataset_arn_to_yojson = string_to_yojson

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson [ ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn) ]

let dataset_type_to_yojson (x : dataset_type) =
  match x with TRAIN -> `String "TRAIN" | TEST -> `String "TEST"

let dataset_source_to_yojson (x : dataset_source) =
  assoc_to_yojson
    [
      ( "GroundTruthManifest",
        option_to_yojson ground_truth_manifest_to_yojson x.ground_truth_manifest );
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
    ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("DatasetSource", option_to_yojson dataset_source_to_yojson x.dataset_source);
      ("DatasetType", Some (dataset_type_to_yojson x.dataset_type));
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let liveness_session_id_to_yojson = string_to_yojson

let create_face_liveness_session_response_to_yojson (x : create_face_liveness_session_response) =
  assoc_to_yojson [ ("SessionId", Some (liveness_session_id_to_yojson x.session_id)) ]

let liveness_s3_key_prefix_to_yojson = string_to_yojson

let liveness_output_config_to_yojson (x : liveness_output_config) =
  assoc_to_yojson
    [
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3KeyPrefix", option_to_yojson liveness_s3_key_prefix_to_yojson x.s3_key_prefix);
    ]

let create_face_liveness_session_request_settings_to_yojson
    (x : create_face_liveness_session_request_settings) =
  assoc_to_yojson
    [
      ("OutputConfig", option_to_yojson liveness_output_config_to_yojson x.output_config);
      ("AuditImagesLimit", option_to_yojson audit_images_limit_to_yojson x.audit_images_limit);
      ( "ChallengePreferences",
        option_to_yojson challenge_preferences_to_yojson x.challenge_preferences );
    ]

let create_face_liveness_session_request_to_yojson (x : create_face_liveness_session_request) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "Settings",
        option_to_yojson create_face_liveness_session_request_settings_to_yojson x.settings );
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
    ]

let create_project_response_to_yojson (x : create_project_response) =
  assoc_to_yojson [ ("ProjectArn", option_to_yojson project_arn_to_yojson x.project_arn) ]

let project_auto_update_to_yojson (x : project_auto_update) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let customization_feature_to_yojson (x : customization_feature) =
  match x with
  | CONTENT_MODERATION -> `String "CONTENT_MODERATION"
  | CUSTOM_LABELS -> `String "CUSTOM_LABELS"

let project_name_to_yojson = string_to_yojson

let create_project_request_to_yojson (x : create_project_request) =
  assoc_to_yojson
    [
      ("ProjectName", Some (project_name_to_yojson x.project_name));
      ("Feature", option_to_yojson customization_feature_to_yojson x.feature);
      ("AutoUpdate", option_to_yojson project_auto_update_to_yojson x.auto_update);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let create_project_version_response_to_yojson (x : create_project_version_response) =
  assoc_to_yojson
    [ ("ProjectVersionArn", option_to_yojson project_version_arn_to_yojson x.project_version_arn) ]

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

let version_description_to_yojson = string_to_yojson

let testing_data_to_yojson (x : testing_data) =
  assoc_to_yojson
    [
      ("Assets", option_to_yojson assets_to_yojson x.assets);
      ("AutoCreate", option_to_yojson boolean__to_yojson x.auto_create);
    ]

let training_data_to_yojson (x : training_data) =
  assoc_to_yojson [ ("Assets", option_to_yojson assets_to_yojson x.assets) ]

let create_project_version_request_to_yojson (x : create_project_version_request) =
  assoc_to_yojson
    [
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("VersionName", Some (version_name_to_yojson x.version_name));
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("TrainingData", option_to_yojson training_data_to_yojson x.training_data);
      ("TestingData", option_to_yojson testing_data_to_yojson x.testing_data);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("VersionDescription", option_to_yojson version_description_to_yojson x.version_description);
      ("FeatureConfig", option_to_yojson customization_feature_config_to_yojson x.feature_config);
    ]

let stream_processor_arn_to_yojson = string_to_yojson

let create_stream_processor_response_to_yojson (x : create_stream_processor_response) =
  assoc_to_yojson
    [
      ("StreamProcessorArn", option_to_yojson stream_processor_arn_to_yojson x.stream_processor_arn);
    ]

let stream_processor_data_sharing_preference_to_yojson
    (x : stream_processor_data_sharing_preference) =
  assoc_to_yojson [ ("OptIn", Some (boolean__to_yojson x.opt_in)) ]

let point_to_yojson (x : point) =
  assoc_to_yojson
    [ ("X", option_to_yojson float__to_yojson x.x); ("Y", option_to_yojson float__to_yojson x.y) ]

let polygon_to_yojson tree = list_to_yojson point_to_yojson tree

let region_of_interest_to_yojson (x : region_of_interest) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Polygon", option_to_yojson polygon_to_yojson x.polygon);
    ]

let regions_of_interest_to_yojson tree = list_to_yojson region_of_interest_to_yojson tree
let sns_topic_arn_to_yojson = string_to_yojson

let stream_processor_notification_channel_to_yojson (x : stream_processor_notification_channel) =
  assoc_to_yojson [ ("SNSTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn)) ]

let role_arn_to_yojson = string_to_yojson

let face_search_settings_to_yojson (x : face_search_settings) =
  assoc_to_yojson
    [
      ("CollectionId", option_to_yojson collection_id_to_yojson x.collection_id);
      ("FaceMatchThreshold", option_to_yojson percent_to_yojson x.face_match_threshold);
    ]

let stream_processor_settings_to_yojson (x : stream_processor_settings) =
  assoc_to_yojson
    [
      ("FaceSearch", option_to_yojson face_search_settings_to_yojson x.face_search);
      ("ConnectedHome", option_to_yojson connected_home_settings_to_yojson x.connected_home);
    ]

let stream_processor_name_to_yojson = string_to_yojson

let s3_destination_to_yojson (x : s3_destination) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
      ("KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.key_prefix);
    ]

let kinesis_data_arn_to_yojson = string_to_yojson

let kinesis_data_stream_to_yojson (x : kinesis_data_stream) =
  assoc_to_yojson [ ("Arn", option_to_yojson kinesis_data_arn_to_yojson x.arn) ]

let stream_processor_output_to_yojson (x : stream_processor_output) =
  assoc_to_yojson
    [
      ("KinesisDataStream", option_to_yojson kinesis_data_stream_to_yojson x.kinesis_data_stream);
      ("S3Destination", option_to_yojson s3_destination_to_yojson x.s3_destination);
    ]

let kinesis_video_arn_to_yojson = string_to_yojson

let kinesis_video_stream_to_yojson (x : kinesis_video_stream) =
  assoc_to_yojson [ ("Arn", option_to_yojson kinesis_video_arn_to_yojson x.arn) ]

let stream_processor_input_to_yojson (x : stream_processor_input) =
  assoc_to_yojson
    [
      ("KinesisVideoStream", option_to_yojson kinesis_video_stream_to_yojson x.kinesis_video_stream);
    ]

let create_stream_processor_request_to_yojson (x : create_stream_processor_request) =
  assoc_to_yojson
    [
      ("Input", Some (stream_processor_input_to_yojson x.input));
      ("Output", Some (stream_processor_output_to_yojson x.output));
      ("Name", Some (stream_processor_name_to_yojson x.name));
      ("Settings", Some (stream_processor_settings_to_yojson x.settings));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ( "NotificationChannel",
        option_to_yojson stream_processor_notification_channel_to_yojson x.notification_channel );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("RegionsOfInterest", option_to_yojson regions_of_interest_to_yojson x.regions_of_interest);
      ( "DataSharingPreference",
        option_to_yojson stream_processor_data_sharing_preference_to_yojson
          x.data_sharing_preference );
    ]

let create_user_response_to_yojson = unit_to_yojson

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("UserId", Some (user_id_to_yojson x.user_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let geometry_to_yojson (x : geometry) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Polygon", option_to_yojson polygon_to_yojson x.polygon);
    ]

let custom_label_to_yojson (x : custom_label) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
    ]

let custom_labels_to_yojson tree = list_to_yojson custom_label_to_yojson tree
let customization_features_to_yojson tree = list_to_yojson customization_feature_to_yojson tree
let ground_truth_blob_to_yojson = blob_to_yojson

let dataset_changes_to_yojson (x : dataset_changes) =
  assoc_to_yojson [ ("GroundTruth", Some (ground_truth_blob_to_yojson x.ground_truth)) ]

let dataset_stats_to_yojson (x : dataset_stats) =
  assoc_to_yojson
    [
      ("LabeledEntries", option_to_yojson u_integer_to_yojson x.labeled_entries);
      ("TotalEntries", option_to_yojson u_integer_to_yojson x.total_entries);
      ("TotalLabels", option_to_yojson u_integer_to_yojson x.total_labels);
      ("ErrorEntries", option_to_yojson u_integer_to_yojson x.error_entries);
    ]

let dataset_status_message_code_to_yojson (x : dataset_status_message_code) =
  match x with
  | SUCCESS -> `String "SUCCESS"
  | SERVICE_ERROR -> `String "SERVICE_ERROR"
  | CLIENT_ERROR -> `String "CLIENT_ERROR"

let status_message_to_yojson = string_to_yojson

let dataset_status_to_yojson (x : dataset_status) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_COMPLETE -> `String "UPDATE_COMPLETE"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"

let date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let dataset_description_to_yojson (x : dataset_description) =
  assoc_to_yojson
    [
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("LastUpdatedTimestamp", option_to_yojson date_time_to_yojson x.last_updated_timestamp);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ( "StatusMessageCode",
        option_to_yojson dataset_status_message_code_to_yojson x.status_message_code );
      ("DatasetStats", option_to_yojson dataset_stats_to_yojson x.dataset_stats);
    ]

let dataset_entry_to_yojson = string_to_yojson
let dataset_entries_to_yojson tree = list_to_yojson dataset_entry_to_yojson tree
let dataset_label_to_yojson = string_to_yojson

let dataset_label_stats_to_yojson (x : dataset_label_stats) =
  assoc_to_yojson
    [
      ("EntryCount", option_to_yojson u_integer_to_yojson x.entry_count);
      ("BoundingBoxCount", option_to_yojson u_integer_to_yojson x.bounding_box_count);
    ]

let dataset_label_description_to_yojson (x : dataset_label_description) =
  assoc_to_yojson
    [
      ("LabelName", option_to_yojson dataset_label_to_yojson x.label_name);
      ("LabelStats", option_to_yojson dataset_label_stats_to_yojson x.label_stats);
    ]

let dataset_label_descriptions_to_yojson tree =
  list_to_yojson dataset_label_description_to_yojson tree

let dataset_labels_to_yojson tree = list_to_yojson dataset_label_to_yojson tree

let dataset_metadata_to_yojson (x : dataset_metadata) =
  assoc_to_yojson
    [
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ( "StatusMessageCode",
        option_to_yojson dataset_status_message_code_to_yojson x.status_message_code );
    ]

let dataset_metadata_list_to_yojson tree = list_to_yojson dataset_metadata_to_yojson tree

let delete_collection_response_to_yojson (x : delete_collection_response) =
  assoc_to_yojson [ ("StatusCode", option_to_yojson u_integer_to_yojson x.status_code) ]

let delete_collection_request_to_yojson (x : delete_collection_request) =
  assoc_to_yojson [ ("CollectionId", Some (collection_id_to_yojson x.collection_id)) ]

let delete_dataset_response_to_yojson = unit_to_yojson

let delete_dataset_request_to_yojson (x : delete_dataset_request) =
  assoc_to_yojson [ ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn)) ]

let unsuccessful_face_deletion_reason_to_yojson (x : unsuccessful_face_deletion_reason) =
  match x with
  | ASSOCIATED_TO_AN_EXISTING_USER -> `String "ASSOCIATED_TO_AN_EXISTING_USER"
  | FACE_NOT_FOUND -> `String "FACE_NOT_FOUND"

let unsuccessful_face_deletion_reasons_to_yojson tree =
  list_to_yojson unsuccessful_face_deletion_reason_to_yojson tree

let unsuccessful_face_deletion_to_yojson (x : unsuccessful_face_deletion) =
  assoc_to_yojson
    [
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("Reasons", option_to_yojson unsuccessful_face_deletion_reasons_to_yojson x.reasons);
    ]

let unsuccessful_face_deletions_list_to_yojson tree =
  list_to_yojson unsuccessful_face_deletion_to_yojson tree

let face_id_list_to_yojson tree = list_to_yojson face_id_to_yojson tree

let delete_faces_response_to_yojson (x : delete_faces_response) =
  assoc_to_yojson
    [
      ("DeletedFaces", option_to_yojson face_id_list_to_yojson x.deleted_faces);
      ( "UnsuccessfulFaceDeletions",
        option_to_yojson unsuccessful_face_deletions_list_to_yojson x.unsuccessful_face_deletions );
    ]

let delete_faces_request_to_yojson (x : delete_faces_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("FaceIds", Some (face_id_list_to_yojson x.face_ids));
    ]

let project_status_to_yojson (x : project_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | DELETING -> `String "DELETING"

let delete_project_response_to_yojson (x : delete_project_response) =
  assoc_to_yojson [ ("Status", option_to_yojson project_status_to_yojson x.status) ]

let delete_project_request_to_yojson (x : delete_project_request) =
  assoc_to_yojson [ ("ProjectArn", Some (project_arn_to_yojson x.project_arn)) ]

let invalid_policy_revision_id_exception_to_yojson (x : invalid_policy_revision_id_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let delete_project_policy_response_to_yojson = unit_to_yojson
let project_policy_revision_id_to_yojson = string_to_yojson
let project_policy_name_to_yojson = string_to_yojson

let delete_project_policy_request_to_yojson (x : delete_project_policy_request) =
  assoc_to_yojson
    [
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("PolicyName", Some (project_policy_name_to_yojson x.policy_name));
      ( "PolicyRevisionId",
        option_to_yojson project_policy_revision_id_to_yojson x.policy_revision_id );
    ]

let project_version_status_to_yojson (x : project_version_status) =
  match x with
  | TRAINING_IN_PROGRESS -> `String "TRAINING_IN_PROGRESS"
  | TRAINING_COMPLETED -> `String "TRAINING_COMPLETED"
  | TRAINING_FAILED -> `String "TRAINING_FAILED"
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | FAILED -> `String "FAILED"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | DELETING -> `String "DELETING"
  | COPYING_IN_PROGRESS -> `String "COPYING_IN_PROGRESS"
  | COPYING_COMPLETED -> `String "COPYING_COMPLETED"
  | COPYING_FAILED -> `String "COPYING_FAILED"
  | DEPRECATED -> `String "DEPRECATED"
  | EXPIRED -> `String "EXPIRED"

let delete_project_version_response_to_yojson (x : delete_project_version_response) =
  assoc_to_yojson [ ("Status", option_to_yojson project_version_status_to_yojson x.status) ]

let delete_project_version_request_to_yojson (x : delete_project_version_request) =
  assoc_to_yojson
    [ ("ProjectVersionArn", Some (project_version_arn_to_yojson x.project_version_arn)) ]

let delete_stream_processor_response_to_yojson = unit_to_yojson

let delete_stream_processor_request_to_yojson (x : delete_stream_processor_request) =
  assoc_to_yojson [ ("Name", Some (stream_processor_name_to_yojson x.name)) ]

let delete_user_response_to_yojson = unit_to_yojson

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("UserId", Some (user_id_to_yojson x.user_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let describe_collection_response_to_yojson (x : describe_collection_response) =
  assoc_to_yojson
    [
      ("FaceCount", option_to_yojson u_long_to_yojson x.face_count);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("CollectionARN", option_to_yojson string__to_yojson x.collection_ar_n);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("UserCount", option_to_yojson u_long_to_yojson x.user_count);
    ]

let describe_collection_request_to_yojson (x : describe_collection_request) =
  assoc_to_yojson [ ("CollectionId", Some (collection_id_to_yojson x.collection_id)) ]

let describe_dataset_response_to_yojson (x : describe_dataset_response) =
  assoc_to_yojson
    [ ("DatasetDescription", option_to_yojson dataset_description_to_yojson x.dataset_description) ]

let describe_dataset_request_to_yojson (x : describe_dataset_request) =
  assoc_to_yojson [ ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn)) ]

let invalid_pagination_token_exception_to_yojson (x : invalid_pagination_token_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let extended_pagination_token_to_yojson = string_to_yojson
let inference_units_to_yojson = int_to_yojson

let summary_to_yojson (x : summary) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let evaluation_result_to_yojson (x : evaluation_result) =
  assoc_to_yojson
    [
      ("F1Score", option_to_yojson float__to_yojson x.f1_score);
      ("Summary", option_to_yojson summary_to_yojson x.summary);
    ]

let validation_data_to_yojson (x : validation_data) =
  assoc_to_yojson [ ("Assets", option_to_yojson assets_to_yojson x.assets) ]

let testing_data_result_to_yojson (x : testing_data_result) =
  assoc_to_yojson
    [
      ("Input", option_to_yojson testing_data_to_yojson x.input);
      ("Output", option_to_yojson testing_data_to_yojson x.output);
      ("Validation", option_to_yojson validation_data_to_yojson x.validation);
    ]

let training_data_result_to_yojson (x : training_data_result) =
  assoc_to_yojson
    [
      ("Input", option_to_yojson training_data_to_yojson x.input);
      ("Output", option_to_yojson training_data_to_yojson x.output);
      ("Validation", option_to_yojson validation_data_to_yojson x.validation);
    ]

let project_version_description_to_yojson (x : project_version_description) =
  assoc_to_yojson
    [
      ("ProjectVersionArn", option_to_yojson project_version_arn_to_yojson x.project_version_arn);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("MinInferenceUnits", option_to_yojson inference_units_to_yojson x.min_inference_units);
      ("Status", option_to_yojson project_version_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ( "BillableTrainingTimeInSeconds",
        option_to_yojson u_long_to_yojson x.billable_training_time_in_seconds );
      ("TrainingEndTimestamp", option_to_yojson date_time_to_yojson x.training_end_timestamp);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("TrainingDataResult", option_to_yojson training_data_result_to_yojson x.training_data_result);
      ("TestingDataResult", option_to_yojson testing_data_result_to_yojson x.testing_data_result);
      ("EvaluationResult", option_to_yojson evaluation_result_to_yojson x.evaluation_result);
      ("ManifestSummary", option_to_yojson ground_truth_manifest_to_yojson x.manifest_summary);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("MaxInferenceUnits", option_to_yojson inference_units_to_yojson x.max_inference_units);
      ( "SourceProjectVersionArn",
        option_to_yojson project_version_arn_to_yojson x.source_project_version_arn );
      ("VersionDescription", option_to_yojson version_description_to_yojson x.version_description);
      ("Feature", option_to_yojson customization_feature_to_yojson x.feature);
      ("BaseModelVersion", option_to_yojson string__to_yojson x.base_model_version);
      ("FeatureConfig", option_to_yojson customization_feature_config_to_yojson x.feature_config);
    ]

let project_version_descriptions_to_yojson tree =
  list_to_yojson project_version_description_to_yojson tree

let describe_project_versions_response_to_yojson (x : describe_project_versions_response) =
  assoc_to_yojson
    [
      ( "ProjectVersionDescriptions",
        option_to_yojson project_version_descriptions_to_yojson x.project_version_descriptions );
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
    ]

let project_versions_page_size_to_yojson = int_to_yojson
let version_names_to_yojson tree = list_to_yojson version_name_to_yojson tree

let describe_project_versions_request_to_yojson (x : describe_project_versions_request) =
  assoc_to_yojson
    [
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("VersionNames", option_to_yojson version_names_to_yojson x.version_names);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson project_versions_page_size_to_yojson x.max_results);
    ]

let project_description_to_yojson (x : project_description) =
  assoc_to_yojson
    [
      ("ProjectArn", option_to_yojson project_arn_to_yojson x.project_arn);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("Status", option_to_yojson project_status_to_yojson x.status);
      ("Datasets", option_to_yojson dataset_metadata_list_to_yojson x.datasets);
      ("Feature", option_to_yojson customization_feature_to_yojson x.feature);
      ("AutoUpdate", option_to_yojson project_auto_update_to_yojson x.auto_update);
    ]

let project_descriptions_to_yojson tree = list_to_yojson project_description_to_yojson tree

let describe_projects_response_to_yojson (x : describe_projects_response) =
  assoc_to_yojson
    [
      ("ProjectDescriptions", option_to_yojson project_descriptions_to_yojson x.project_descriptions);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
    ]

let project_names_to_yojson tree = list_to_yojson project_name_to_yojson tree
let projects_page_size_to_yojson = int_to_yojson

let describe_projects_request_to_yojson (x : describe_projects_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson projects_page_size_to_yojson x.max_results);
      ("ProjectNames", option_to_yojson project_names_to_yojson x.project_names);
      ("Features", option_to_yojson customization_features_to_yojson x.features);
    ]

let stream_processor_status_to_yojson (x : stream_processor_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | FAILED -> `String "FAILED"
  | STOPPING -> `String "STOPPING"
  | UPDATING -> `String "UPDATING"

let describe_stream_processor_response_to_yojson (x : describe_stream_processor_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson stream_processor_name_to_yojson x.name);
      ("StreamProcessorArn", option_to_yojson stream_processor_arn_to_yojson x.stream_processor_arn);
      ("Status", option_to_yojson stream_processor_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("LastUpdateTimestamp", option_to_yojson date_time_to_yojson x.last_update_timestamp);
      ("Input", option_to_yojson stream_processor_input_to_yojson x.input);
      ("Output", option_to_yojson stream_processor_output_to_yojson x.output);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("Settings", option_to_yojson stream_processor_settings_to_yojson x.settings);
      ( "NotificationChannel",
        option_to_yojson stream_processor_notification_channel_to_yojson x.notification_channel );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("RegionsOfInterest", option_to_yojson regions_of_interest_to_yojson x.regions_of_interest);
      ( "DataSharingPreference",
        option_to_yojson stream_processor_data_sharing_preference_to_yojson
          x.data_sharing_preference );
    ]

let describe_stream_processor_request_to_yojson (x : describe_stream_processor_request) =
  assoc_to_yojson [ ("Name", Some (stream_processor_name_to_yojson x.name)) ]

let resource_not_ready_exception_to_yojson (x : resource_not_ready_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let detect_custom_labels_response_to_yojson (x : detect_custom_labels_response) =
  assoc_to_yojson [ ("CustomLabels", option_to_yojson custom_labels_to_yojson x.custom_labels) ]

let detect_custom_labels_request_to_yojson (x : detect_custom_labels_request) =
  assoc_to_yojson
    [
      ("ProjectVersionArn", Some (project_version_arn_to_yojson x.project_version_arn));
      ("Image", Some (image_to_yojson x.image));
      ("MaxResults", option_to_yojson u_integer_to_yojson x.max_results);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
    ]

let face_detail_list_to_yojson tree = list_to_yojson face_detail_to_yojson tree

let detect_faces_response_to_yojson (x : detect_faces_response) =
  assoc_to_yojson
    [
      ("FaceDetails", option_to_yojson face_detail_list_to_yojson x.face_details);
      ( "OrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.orientation_correction );
    ]

let detect_faces_request_to_yojson (x : detect_faces_request) =
  assoc_to_yojson
    [
      ("Image", Some (image_to_yojson x.image));
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
    ]

let dominant_color_to_yojson (x : dominant_color) =
  assoc_to_yojson
    [
      ("Red", option_to_yojson u_integer_to_yojson x.red);
      ("Blue", option_to_yojson u_integer_to_yojson x.blue);
      ("Green", option_to_yojson u_integer_to_yojson x.green);
      ("HexCode", option_to_yojson string__to_yojson x.hex_code);
      ("CSSColor", option_to_yojson string__to_yojson x.css_color);
      ("SimplifiedColor", option_to_yojson string__to_yojson x.simplified_color);
      ("PixelPercent", option_to_yojson percent_to_yojson x.pixel_percent);
    ]

let dominant_colors_to_yojson tree = list_to_yojson dominant_color_to_yojson tree

let detect_labels_image_quality_to_yojson (x : detect_labels_image_quality) =
  assoc_to_yojson
    [
      ("Brightness", option_to_yojson float__to_yojson x.brightness);
      ("Sharpness", option_to_yojson float__to_yojson x.sharpness);
      ("Contrast", option_to_yojson float__to_yojson x.contrast);
    ]

let detect_labels_image_background_to_yojson (x : detect_labels_image_background) =
  assoc_to_yojson
    [
      ("Quality", option_to_yojson detect_labels_image_quality_to_yojson x.quality);
      ("DominantColors", option_to_yojson dominant_colors_to_yojson x.dominant_colors);
    ]

let detect_labels_image_foreground_to_yojson (x : detect_labels_image_foreground) =
  assoc_to_yojson
    [
      ("Quality", option_to_yojson detect_labels_image_quality_to_yojson x.quality);
      ("DominantColors", option_to_yojson dominant_colors_to_yojson x.dominant_colors);
    ]

let detect_labels_image_properties_to_yojson (x : detect_labels_image_properties) =
  assoc_to_yojson
    [
      ("Quality", option_to_yojson detect_labels_image_quality_to_yojson x.quality);
      ("DominantColors", option_to_yojson dominant_colors_to_yojson x.dominant_colors);
      ("Foreground", option_to_yojson detect_labels_image_foreground_to_yojson x.foreground);
      ("Background", option_to_yojson detect_labels_image_background_to_yojson x.background);
    ]

let label_category_to_yojson (x : label_category) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let label_categories_to_yojson tree = list_to_yojson label_category_to_yojson tree

let label_alias_to_yojson (x : label_alias) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let label_aliases_to_yojson tree = list_to_yojson label_alias_to_yojson tree

let parent_to_yojson (x : parent) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let parents_to_yojson tree = list_to_yojson parent_to_yojson tree

let instance_to_yojson (x : instance) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("DominantColors", option_to_yojson dominant_colors_to_yojson x.dominant_colors);
    ]

let instances_to_yojson tree = list_to_yojson instance_to_yojson tree

let label_to_yojson (x : label) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Instances", option_to_yojson instances_to_yojson x.instances);
      ("Parents", option_to_yojson parents_to_yojson x.parents);
      ("Aliases", option_to_yojson label_aliases_to_yojson x.aliases);
      ("Categories", option_to_yojson label_categories_to_yojson x.categories);
    ]

let labels_to_yojson tree = list_to_yojson label_to_yojson tree

let detect_labels_response_to_yojson (x : detect_labels_response) =
  assoc_to_yojson
    [
      ("Labels", option_to_yojson labels_to_yojson x.labels);
      ( "OrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.orientation_correction );
      ("LabelModelVersion", option_to_yojson string__to_yojson x.label_model_version);
      ( "ImageProperties",
        option_to_yojson detect_labels_image_properties_to_yojson x.image_properties );
    ]

let detect_labels_max_dominant_colors_to_yojson = int_to_yojson

let detect_labels_image_properties_settings_to_yojson (x : detect_labels_image_properties_settings)
    =
  assoc_to_yojson
    [
      ( "MaxDominantColors",
        option_to_yojson detect_labels_max_dominant_colors_to_yojson x.max_dominant_colors );
    ]

let general_labels_filter_value_to_yojson = string_to_yojson

let general_labels_filter_list_to_yojson tree =
  list_to_yojson general_labels_filter_value_to_yojson tree

let general_labels_settings_to_yojson (x : general_labels_settings) =
  assoc_to_yojson
    [
      ( "LabelInclusionFilters",
        option_to_yojson general_labels_filter_list_to_yojson x.label_inclusion_filters );
      ( "LabelExclusionFilters",
        option_to_yojson general_labels_filter_list_to_yojson x.label_exclusion_filters );
      ( "LabelCategoryInclusionFilters",
        option_to_yojson general_labels_filter_list_to_yojson x.label_category_inclusion_filters );
      ( "LabelCategoryExclusionFilters",
        option_to_yojson general_labels_filter_list_to_yojson x.label_category_exclusion_filters );
    ]

let detect_labels_settings_to_yojson (x : detect_labels_settings) =
  assoc_to_yojson
    [
      ("GeneralLabels", option_to_yojson general_labels_settings_to_yojson x.general_labels);
      ( "ImageProperties",
        option_to_yojson detect_labels_image_properties_settings_to_yojson x.image_properties );
    ]

let detect_labels_feature_name_to_yojson (x : detect_labels_feature_name) =
  match x with
  | GENERAL_LABELS -> `String "GENERAL_LABELS"
  | IMAGE_PROPERTIES -> `String "IMAGE_PROPERTIES"

let detect_labels_feature_list_to_yojson tree =
  list_to_yojson detect_labels_feature_name_to_yojson tree

let detect_labels_request_to_yojson (x : detect_labels_request) =
  assoc_to_yojson
    [
      ("Image", Some (image_to_yojson x.image));
      ("MaxLabels", option_to_yojson u_integer_to_yojson x.max_labels);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("Features", option_to_yojson detect_labels_feature_list_to_yojson x.features);
      ("Settings", option_to_yojson detect_labels_settings_to_yojson x.settings);
    ]

let human_loop_quota_exceeded_exception_to_yojson (x : human_loop_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("QuotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let project_version_id_to_yojson = string_to_yojson

let synthesized_json_human_loop_activation_conditions_evaluation_results_to_yojson =
  string_to_yojson

let human_loop_activation_reason_to_yojson = string_to_yojson

let human_loop_activation_reasons_to_yojson tree =
  list_to_yojson human_loop_activation_reason_to_yojson tree

let human_loop_arn_to_yojson = string_to_yojson

let human_loop_activation_output_to_yojson (x : human_loop_activation_output) =
  assoc_to_yojson
    [
      ("HumanLoopArn", option_to_yojson human_loop_arn_to_yojson x.human_loop_arn);
      ( "HumanLoopActivationReasons",
        option_to_yojson human_loop_activation_reasons_to_yojson x.human_loop_activation_reasons );
      ( "HumanLoopActivationConditionsEvaluationResults",
        option_to_yojson
          synthesized_json_human_loop_activation_conditions_evaluation_results_to_yojson
          x.human_loop_activation_conditions_evaluation_results );
    ]

let moderation_labels_to_yojson tree = list_to_yojson moderation_label_to_yojson tree

let detect_moderation_labels_response_to_yojson (x : detect_moderation_labels_response) =
  assoc_to_yojson
    [
      ("ModerationLabels", option_to_yojson moderation_labels_to_yojson x.moderation_labels);
      ("ModerationModelVersion", option_to_yojson string__to_yojson x.moderation_model_version);
      ( "HumanLoopActivationOutput",
        option_to_yojson human_loop_activation_output_to_yojson x.human_loop_activation_output );
      ("ProjectVersion", option_to_yojson project_version_id_to_yojson x.project_version);
      ("ContentTypes", option_to_yojson content_types_to_yojson x.content_types);
    ]

let human_loop_data_attributes_to_yojson (x : human_loop_data_attributes) =
  assoc_to_yojson
    [ ("ContentClassifiers", option_to_yojson content_classifiers_to_yojson x.content_classifiers) ]

let flow_definition_arn_to_yojson = string_to_yojson
let human_loop_name_to_yojson = string_to_yojson

let human_loop_config_to_yojson (x : human_loop_config) =
  assoc_to_yojson
    [
      ("HumanLoopName", Some (human_loop_name_to_yojson x.human_loop_name));
      ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn));
      ("DataAttributes", option_to_yojson human_loop_data_attributes_to_yojson x.data_attributes);
    ]

let detect_moderation_labels_request_to_yojson (x : detect_moderation_labels_request) =
  assoc_to_yojson
    [
      ("Image", Some (image_to_yojson x.image));
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("HumanLoopConfig", option_to_yojson human_loop_config_to_yojson x.human_loop_config);
      ("ProjectVersion", option_to_yojson project_version_id_to_yojson x.project_version);
    ]

let protective_equipment_person_ids_to_yojson tree = list_to_yojson u_integer_to_yojson tree

let protective_equipment_summary_to_yojson (x : protective_equipment_summary) =
  assoc_to_yojson
    [
      ( "PersonsWithRequiredEquipment",
        option_to_yojson protective_equipment_person_ids_to_yojson x.persons_with_required_equipment
      );
      ( "PersonsWithoutRequiredEquipment",
        option_to_yojson protective_equipment_person_ids_to_yojson
          x.persons_without_required_equipment );
      ( "PersonsIndeterminate",
        option_to_yojson protective_equipment_person_ids_to_yojson x.persons_indeterminate );
    ]

let protective_equipment_person_to_yojson (x : protective_equipment_person) =
  assoc_to_yojson
    [
      ("BodyParts", option_to_yojson body_parts_to_yojson x.body_parts);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Id", option_to_yojson u_integer_to_yojson x.id);
    ]

let protective_equipment_persons_to_yojson tree =
  list_to_yojson protective_equipment_person_to_yojson tree

let detect_protective_equipment_response_to_yojson (x : detect_protective_equipment_response) =
  assoc_to_yojson
    [
      ( "ProtectiveEquipmentModelVersion",
        option_to_yojson string__to_yojson x.protective_equipment_model_version );
      ("Persons", option_to_yojson protective_equipment_persons_to_yojson x.persons);
      ("Summary", option_to_yojson protective_equipment_summary_to_yojson x.summary);
    ]

let protective_equipment_types_to_yojson tree =
  list_to_yojson protective_equipment_type_to_yojson tree

let protective_equipment_summarization_attributes_to_yojson
    (x : protective_equipment_summarization_attributes) =
  assoc_to_yojson
    [
      ("MinConfidence", Some (percent_to_yojson x.min_confidence));
      ( "RequiredEquipmentTypes",
        Some (protective_equipment_types_to_yojson x.required_equipment_types) );
    ]

let detect_protective_equipment_request_to_yojson (x : detect_protective_equipment_request) =
  assoc_to_yojson
    [
      ("Image", Some (image_to_yojson x.image));
      ( "SummarizationAttributes",
        option_to_yojson protective_equipment_summarization_attributes_to_yojson
          x.summarization_attributes );
    ]

let text_types_to_yojson (x : text_types) =
  match x with LINE -> `String "LINE" | WORD -> `String "WORD"

let text_detection_to_yojson (x : text_detection) =
  assoc_to_yojson
    [
      ("DetectedText", option_to_yojson string__to_yojson x.detected_text);
      ("Type", option_to_yojson text_types_to_yojson x.type_);
      ("Id", option_to_yojson u_integer_to_yojson x.id);
      ("ParentId", option_to_yojson u_integer_to_yojson x.parent_id);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
    ]

let text_detection_list_to_yojson tree = list_to_yojson text_detection_to_yojson tree

let detect_text_response_to_yojson (x : detect_text_response) =
  assoc_to_yojson
    [
      ("TextDetections", option_to_yojson text_detection_list_to_yojson x.text_detections);
      ("TextModelVersion", option_to_yojson string__to_yojson x.text_model_version);
    ]

let detection_filter_to_yojson (x : detection_filter) =
  assoc_to_yojson
    [
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ( "MinBoundingBoxHeight",
        option_to_yojson bounding_box_height_to_yojson x.min_bounding_box_height );
      ("MinBoundingBoxWidth", option_to_yojson bounding_box_width_to_yojson x.min_bounding_box_width);
    ]

let detect_text_filters_to_yojson (x : detect_text_filters) =
  assoc_to_yojson
    [
      ("WordFilter", option_to_yojson detection_filter_to_yojson x.word_filter);
      ("RegionsOfInterest", option_to_yojson regions_of_interest_to_yojson x.regions_of_interest);
    ]

let detect_text_request_to_yojson (x : detect_text_request) =
  assoc_to_yojson
    [
      ("Image", Some (image_to_yojson x.image));
      ("Filters", option_to_yojson detect_text_filters_to_yojson x.filters);
    ]

let unsuccessful_face_disassociation_reason_to_yojson (x : unsuccessful_face_disassociation_reason)
    =
  match x with
  | FACE_NOT_FOUND -> `String "FACE_NOT_FOUND"
  | ASSOCIATED_TO_A_DIFFERENT_USER -> `String "ASSOCIATED_TO_A_DIFFERENT_USER"

let unsuccessful_face_disassociation_reasons_to_yojson tree =
  list_to_yojson unsuccessful_face_disassociation_reason_to_yojson tree

let unsuccessful_face_disassociation_to_yojson (x : unsuccessful_face_disassociation) =
  assoc_to_yojson
    [
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("Reasons", option_to_yojson unsuccessful_face_disassociation_reasons_to_yojson x.reasons);
    ]

let unsuccessful_face_disassociation_list_to_yojson tree =
  list_to_yojson unsuccessful_face_disassociation_to_yojson tree

let disassociated_face_to_yojson (x : disassociated_face) =
  assoc_to_yojson [ ("FaceId", option_to_yojson face_id_to_yojson x.face_id) ]

let disassociated_faces_list_to_yojson tree = list_to_yojson disassociated_face_to_yojson tree

let disassociate_faces_response_to_yojson (x : disassociate_faces_response) =
  assoc_to_yojson
    [
      ( "DisassociatedFaces",
        option_to_yojson disassociated_faces_list_to_yojson x.disassociated_faces );
      ( "UnsuccessfulFaceDisassociations",
        option_to_yojson unsuccessful_face_disassociation_list_to_yojson
          x.unsuccessful_face_disassociations );
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
    ]

let disassociate_faces_request_to_yojson (x : disassociate_faces_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("UserId", Some (user_id_to_yojson x.user_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FaceIds", Some (user_face_id_list_to_yojson x.face_ids));
    ]

let distribute_dataset_to_yojson (x : distribute_dataset) =
  assoc_to_yojson [ ("Arn", Some (dataset_arn_to_yojson x.arn)) ]

let distribute_dataset_entries_response_to_yojson = unit_to_yojson

let distribute_dataset_metadata_list_to_yojson tree =
  list_to_yojson distribute_dataset_to_yojson tree

let distribute_dataset_entries_request_to_yojson (x : distribute_dataset_entries_request) =
  assoc_to_yojson [ ("Datasets", Some (distribute_dataset_metadata_list_to_yojson x.datasets)) ]

let external_image_id_to_yojson = string_to_yojson
let index_faces_model_version_to_yojson = string_to_yojson
let image_id_to_yojson = string_to_yojson

let face_to_yojson (x : face) =
  assoc_to_yojson
    [
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("ImageId", option_to_yojson image_id_to_yojson x.image_id);
      ("ExternalImageId", option_to_yojson external_image_id_to_yojson x.external_image_id);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ( "IndexFacesModelVersion",
        option_to_yojson index_faces_model_version_to_yojson x.index_faces_model_version );
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
    ]

let face_attributes_to_yojson (x : face_attributes) =
  match x with DEFAULT -> `String "DEFAULT" | ALL -> `String "ALL"

let face_detection_to_yojson (x : face_detection) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Face", option_to_yojson face_detail_to_yojson x.face);
    ]

let face_detections_to_yojson tree = list_to_yojson face_detection_to_yojson tree
let face_list_to_yojson tree = list_to_yojson face_to_yojson tree

let face_match_to_yojson (x : face_match) =
  assoc_to_yojson
    [
      ("Similarity", option_to_yojson percent_to_yojson x.similarity);
      ("Face", option_to_yojson face_to_yojson x.face);
    ]

let face_match_list_to_yojson tree = list_to_yojson face_match_to_yojson tree
let face_model_version_list_to_yojson tree = list_to_yojson string__to_yojson tree

let face_record_to_yojson (x : face_record) =
  assoc_to_yojson
    [
      ("Face", option_to_yojson face_to_yojson x.face);
      ("FaceDetail", option_to_yojson face_detail_to_yojson x.face_detail);
    ]

let face_record_list_to_yojson tree = list_to_yojson face_record_to_yojson tree

let face_search_sort_by_to_yojson (x : face_search_sort_by) =
  match x with INDEX -> `String "INDEX" | TIMESTAMP -> `String "TIMESTAMP"

let get_celebrity_info_response_to_yojson (x : get_celebrity_info_response) =
  assoc_to_yojson
    [
      ("Urls", option_to_yojson urls_to_yojson x.urls);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("KnownGender", option_to_yojson known_gender_to_yojson x.known_gender);
    ]

let get_celebrity_info_request_to_yojson (x : get_celebrity_info_request) =
  assoc_to_yojson [ ("Id", Some (rekognition_unique_id_to_yojson x.id)) ]

let job_tag_to_yojson = string_to_yojson

let video_to_yojson (x : video) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let job_id_to_yojson = string_to_yojson
let pagination_token_to_yojson = string_to_yojson

let video_color_range_to_yojson (x : video_color_range) =
  match x with FULL -> `String "FULL" | LIMITED -> `String "LIMITED"

let video_metadata_to_yojson (x : video_metadata) =
  assoc_to_yojson
    [
      ("Codec", option_to_yojson string__to_yojson x.codec);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("Format", option_to_yojson string__to_yojson x.format);
      ("FrameRate", option_to_yojson float__to_yojson x.frame_rate);
      ("FrameHeight", option_to_yojson u_long_to_yojson x.frame_height);
      ("FrameWidth", option_to_yojson u_long_to_yojson x.frame_width);
      ("ColorRange", option_to_yojson video_color_range_to_yojson x.color_range);
    ]

let video_job_status_to_yojson (x : video_job_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let get_celebrity_recognition_response_to_yojson (x : get_celebrity_recognition_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Celebrities", option_to_yojson celebrity_recognitions_to_yojson x.celebrities);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let max_results_to_yojson = int_to_yojson

let get_celebrity_recognition_request_to_yojson (x : get_celebrity_recognition_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson celebrity_recognition_sort_by_to_yojson x.sort_by);
    ]

let get_content_moderation_request_metadata_to_yojson (x : get_content_moderation_request_metadata)
    =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson content_moderation_sort_by_to_yojson x.sort_by);
      ("AggregateBy", option_to_yojson content_moderation_aggregate_by_to_yojson x.aggregate_by);
    ]

let get_content_moderation_response_to_yojson (x : get_content_moderation_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ( "ModerationLabels",
        option_to_yojson content_moderation_detections_to_yojson x.moderation_labels );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ModerationModelVersion", option_to_yojson string__to_yojson x.moderation_model_version);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ( "GetRequestMetadata",
        option_to_yojson get_content_moderation_request_metadata_to_yojson x.get_request_metadata );
    ]

let get_content_moderation_request_to_yojson (x : get_content_moderation_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson content_moderation_sort_by_to_yojson x.sort_by);
      ("AggregateBy", option_to_yojson content_moderation_aggregate_by_to_yojson x.aggregate_by);
    ]

let get_face_detection_response_to_yojson (x : get_face_detection_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Faces", option_to_yojson face_detections_to_yojson x.faces);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let get_face_detection_request_to_yojson (x : get_face_detection_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let session_not_found_exception_to_yojson (x : session_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let liveness_session_status_to_yojson (x : liveness_session_status) =
  match x with
  | CREATED -> `String "CREATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | EXPIRED -> `String "EXPIRED"

let get_face_liveness_session_results_response_to_yojson
    (x : get_face_liveness_session_results_response) =
  assoc_to_yojson
    [
      ("SessionId", Some (liveness_session_id_to_yojson x.session_id));
      ("Status", Some (liveness_session_status_to_yojson x.status));
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("ReferenceImage", option_to_yojson audit_image_to_yojson x.reference_image);
      ("AuditImages", option_to_yojson audit_images_to_yojson x.audit_images);
      ("Challenge", option_to_yojson challenge_to_yojson x.challenge);
    ]

let get_face_liveness_session_results_request_to_yojson
    (x : get_face_liveness_session_results_request) =
  assoc_to_yojson [ ("SessionId", Some (liveness_session_id_to_yojson x.session_id)) ]

let person_index_to_yojson = long_to_yojson

let person_detail_to_yojson (x : person_detail) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson person_index_to_yojson x.index);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Face", option_to_yojson face_detail_to_yojson x.face);
    ]

let person_match_to_yojson (x : person_match) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Person", option_to_yojson person_detail_to_yojson x.person);
      ("FaceMatches", option_to_yojson face_match_list_to_yojson x.face_matches);
    ]

let person_matches_to_yojson tree = list_to_yojson person_match_to_yojson tree

let get_face_search_response_to_yojson (x : get_face_search_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("Persons", option_to_yojson person_matches_to_yojson x.persons);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let get_face_search_request_to_yojson (x : get_face_search_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson face_search_sort_by_to_yojson x.sort_by);
    ]

let label_detection_aggregate_by_to_yojson (x : label_detection_aggregate_by) =
  match x with TIMESTAMPS -> `String "TIMESTAMPS" | SEGMENTS -> `String "SEGMENTS"

let label_detection_sort_by_to_yojson (x : label_detection_sort_by) =
  match x with NAME -> `String "NAME" | TIMESTAMP -> `String "TIMESTAMP"

let get_label_detection_request_metadata_to_yojson (x : get_label_detection_request_metadata) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson label_detection_sort_by_to_yojson x.sort_by);
      ("AggregateBy", option_to_yojson label_detection_aggregate_by_to_yojson x.aggregate_by);
    ]

let label_detection_to_yojson (x : label_detection) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Label", option_to_yojson label_to_yojson x.label);
      ("StartTimestampMillis", option_to_yojson u_long_to_yojson x.start_timestamp_millis);
      ("EndTimestampMillis", option_to_yojson u_long_to_yojson x.end_timestamp_millis);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
    ]

let label_detections_to_yojson tree = list_to_yojson label_detection_to_yojson tree

let get_label_detection_response_to_yojson (x : get_label_detection_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Labels", option_to_yojson label_detections_to_yojson x.labels);
      ("LabelModelVersion", option_to_yojson string__to_yojson x.label_model_version);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ( "GetRequestMetadata",
        option_to_yojson get_label_detection_request_metadata_to_yojson x.get_request_metadata );
    ]

let get_label_detection_request_to_yojson (x : get_label_detection_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson label_detection_sort_by_to_yojson x.sort_by);
      ("AggregateBy", option_to_yojson label_detection_aggregate_by_to_yojson x.aggregate_by);
    ]

let media_analysis_manifest_summary_to_yojson (x : media_analysis_manifest_summary) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let media_analysis_model_versions_to_yojson (x : media_analysis_model_versions) =
  assoc_to_yojson [ ("Moderation", option_to_yojson string__to_yojson x.moderation) ]

let media_analysis_results_to_yojson (x : media_analysis_results) =
  assoc_to_yojson
    [
      ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object);
      ("ModelVersions", option_to_yojson media_analysis_model_versions_to_yojson x.model_versions);
    ]

let media_analysis_s3_key_prefix_to_yojson = string_to_yojson

let media_analysis_output_config_to_yojson (x : media_analysis_output_config) =
  assoc_to_yojson
    [
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3KeyPrefix", option_to_yojson media_analysis_s3_key_prefix_to_yojson x.s3_key_prefix);
    ]

let media_analysis_input_to_yojson (x : media_analysis_input) =
  assoc_to_yojson [ ("S3Object", Some (s3_object_to_yojson x.s3_object)) ]

let media_analysis_job_failure_code_to_yojson (x : media_analysis_job_failure_code) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | INVALID_S3_OBJECT -> `String "INVALID_S3_OBJECT"
  | INVALID_MANIFEST -> `String "INVALID_MANIFEST"
  | INVALID_OUTPUT_CONFIG -> `String "INVALID_OUTPUT_CONFIG"
  | INVALID_KMS_KEY -> `String "INVALID_KMS_KEY"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | RESOURCE_NOT_FOUND -> `String "RESOURCE_NOT_FOUND"
  | RESOURCE_NOT_READY -> `String "RESOURCE_NOT_READY"
  | THROTTLED -> `String "THROTTLED"

let media_analysis_job_failure_details_to_yojson (x : media_analysis_job_failure_details) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson media_analysis_job_failure_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let media_analysis_job_status_to_yojson (x : media_analysis_job_status) =
  match x with
  | CREATED -> `String "CREATED"
  | QUEUED -> `String "QUEUED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let media_analysis_detect_moderation_labels_config_to_yojson
    (x : media_analysis_detect_moderation_labels_config) =
  assoc_to_yojson
    [
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("ProjectVersion", option_to_yojson project_version_id_to_yojson x.project_version);
    ]

let media_analysis_operations_config_to_yojson (x : media_analysis_operations_config) =
  assoc_to_yojson
    [
      ( "DetectModerationLabels",
        option_to_yojson media_analysis_detect_moderation_labels_config_to_yojson
          x.detect_moderation_labels );
    ]

let media_analysis_job_name_to_yojson = string_to_yojson
let media_analysis_job_id_to_yojson = string_to_yojson

let get_media_analysis_job_response_to_yojson (x : get_media_analysis_job_response) =
  assoc_to_yojson
    [
      ("JobId", Some (media_analysis_job_id_to_yojson x.job_id));
      ("JobName", option_to_yojson media_analysis_job_name_to_yojson x.job_name);
      ("OperationsConfig", Some (media_analysis_operations_config_to_yojson x.operations_config));
      ("Status", Some (media_analysis_job_status_to_yojson x.status));
      ( "FailureDetails",
        option_to_yojson media_analysis_job_failure_details_to_yojson x.failure_details );
      ("CreationTimestamp", Some (date_time_to_yojson x.creation_timestamp));
      ("CompletionTimestamp", option_to_yojson date_time_to_yojson x.completion_timestamp);
      ("Input", Some (media_analysis_input_to_yojson x.input));
      ("OutputConfig", Some (media_analysis_output_config_to_yojson x.output_config));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Results", option_to_yojson media_analysis_results_to_yojson x.results);
      ( "ManifestSummary",
        option_to_yojson media_analysis_manifest_summary_to_yojson x.manifest_summary );
    ]

let get_media_analysis_job_request_to_yojson (x : get_media_analysis_job_request) =
  assoc_to_yojson [ ("JobId", Some (media_analysis_job_id_to_yojson x.job_id)) ]

let person_detection_to_yojson (x : person_detection) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Person", option_to_yojson person_detail_to_yojson x.person);
    ]

let person_detections_to_yojson tree = list_to_yojson person_detection_to_yojson tree

let get_person_tracking_response_to_yojson (x : get_person_tracking_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Persons", option_to_yojson person_detections_to_yojson x.persons);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let person_tracking_sort_by_to_yojson (x : person_tracking_sort_by) =
  match x with INDEX -> `String "INDEX" | TIMESTAMP -> `String "TIMESTAMP"

let get_person_tracking_request_to_yojson (x : get_person_tracking_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson person_tracking_sort_by_to_yojson x.sort_by);
    ]

let segment_type_to_yojson (x : segment_type) =
  match x with TECHNICAL_CUE -> `String "TECHNICAL_CUE" | SHOT -> `String "SHOT"

let segment_type_info_to_yojson (x : segment_type_info) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson segment_type_to_yojson x.type_);
      ("ModelVersion", option_to_yojson string__to_yojson x.model_version);
    ]

let segment_types_info_to_yojson tree = list_to_yojson segment_type_info_to_yojson tree
let segment_confidence_to_yojson = float_to_yojson

let shot_segment_to_yojson (x : shot_segment) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson u_long_to_yojson x.index);
      ("Confidence", option_to_yojson segment_confidence_to_yojson x.confidence);
    ]

let technical_cue_type_to_yojson (x : technical_cue_type) =
  match x with
  | COLOR_BARS -> `String "ColorBars"
  | END_CREDITS -> `String "EndCredits"
  | BLACK_FRAMES -> `String "BlackFrames"
  | OPENING_CREDITS -> `String "OpeningCredits"
  | STUDIO_LOGO -> `String "StudioLogo"
  | SLATE -> `String "Slate"
  | CONTENT -> `String "Content"

let technical_cue_segment_to_yojson (x : technical_cue_segment) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson technical_cue_type_to_yojson x.type_);
      ("Confidence", option_to_yojson segment_confidence_to_yojson x.confidence);
    ]

let timecode_to_yojson = string_to_yojson

let segment_detection_to_yojson (x : segment_detection) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson segment_type_to_yojson x.type_);
      ("StartTimestampMillis", option_to_yojson timestamp_to_yojson x.start_timestamp_millis);
      ("EndTimestampMillis", option_to_yojson timestamp_to_yojson x.end_timestamp_millis);
      ("DurationMillis", option_to_yojson u_long_to_yojson x.duration_millis);
      ("StartTimecodeSMPTE", option_to_yojson timecode_to_yojson x.start_timecode_smpt_e);
      ("EndTimecodeSMPTE", option_to_yojson timecode_to_yojson x.end_timecode_smpt_e);
      ("DurationSMPTE", option_to_yojson timecode_to_yojson x.duration_smpt_e);
      ( "TechnicalCueSegment",
        option_to_yojson technical_cue_segment_to_yojson x.technical_cue_segment );
      ("ShotSegment", option_to_yojson shot_segment_to_yojson x.shot_segment);
      ("StartFrameNumber", option_to_yojson u_long_to_yojson x.start_frame_number);
      ("EndFrameNumber", option_to_yojson u_long_to_yojson x.end_frame_number);
      ("DurationFrames", option_to_yojson u_long_to_yojson x.duration_frames);
    ]

let segment_detections_to_yojson tree = list_to_yojson segment_detection_to_yojson tree
let video_metadata_list_to_yojson tree = list_to_yojson video_metadata_to_yojson tree

let get_segment_detection_response_to_yojson (x : get_segment_detection_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("VideoMetadata", option_to_yojson video_metadata_list_to_yojson x.video_metadata);
      ("AudioMetadata", option_to_yojson audio_metadata_list_to_yojson x.audio_metadata);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Segments", option_to_yojson segment_detections_to_yojson x.segments);
      ( "SelectedSegmentTypes",
        option_to_yojson segment_types_info_to_yojson x.selected_segment_types );
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let get_segment_detection_request_to_yojson (x : get_segment_detection_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let text_detection_result_to_yojson (x : text_detection_result) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("TextDetection", option_to_yojson text_detection_to_yojson x.text_detection);
    ]

let text_detection_results_to_yojson tree = list_to_yojson text_detection_result_to_yojson tree

let get_text_detection_response_to_yojson (x : get_text_detection_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson video_job_status_to_yojson x.job_status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("VideoMetadata", option_to_yojson video_metadata_to_yojson x.video_metadata);
      ("TextDetections", option_to_yojson text_detection_results_to_yojson x.text_detections);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("TextModelVersion", option_to_yojson string__to_yojson x.text_model_version);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("Video", option_to_yojson video_to_yojson x.video);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let get_text_detection_request_to_yojson (x : get_text_detection_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let has_errors_to_yojson = bool_to_yojson

let reason_to_yojson (x : reason) =
  match x with
  | EXCEEDS_MAX_FACES -> `String "EXCEEDS_MAX_FACES"
  | EXTREME_POSE -> `String "EXTREME_POSE"
  | LOW_BRIGHTNESS -> `String "LOW_BRIGHTNESS"
  | LOW_SHARPNESS -> `String "LOW_SHARPNESS"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | SMALL_BOUNDING_BOX -> `String "SMALL_BOUNDING_BOX"
  | LOW_FACE_QUALITY -> `String "LOW_FACE_QUALITY"

let reasons_to_yojson tree = list_to_yojson reason_to_yojson tree

let unindexed_face_to_yojson (x : unindexed_face) =
  assoc_to_yojson
    [
      ("Reasons", option_to_yojson reasons_to_yojson x.reasons);
      ("FaceDetail", option_to_yojson face_detail_to_yojson x.face_detail);
    ]

let unindexed_faces_to_yojson tree = list_to_yojson unindexed_face_to_yojson tree

let index_faces_response_to_yojson (x : index_faces_response) =
  assoc_to_yojson
    [
      ("FaceRecords", option_to_yojson face_record_list_to_yojson x.face_records);
      ( "OrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.orientation_correction );
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("UnindexedFaces", option_to_yojson unindexed_faces_to_yojson x.unindexed_faces);
    ]

let max_faces_to_index_to_yojson = int_to_yojson

let index_faces_request_to_yojson (x : index_faces_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("Image", Some (image_to_yojson x.image));
      ("ExternalImageId", option_to_yojson external_image_id_to_yojson x.external_image_id);
      ("DetectionAttributes", option_to_yojson attributes_to_yojson x.detection_attributes);
      ("MaxFaces", option_to_yojson max_faces_to_index_to_yojson x.max_faces);
      ("QualityFilter", option_to_yojson quality_filter_to_yojson x.quality_filter);
    ]

let invalid_manifest_exception_to_yojson (x : invalid_manifest_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let is_labeled_to_yojson = bool_to_yojson
let kinesis_video_stream_fragment_number_to_yojson = string_to_yojson

let kinesis_video_stream_start_selector_to_yojson (x : kinesis_video_stream_start_selector) =
  assoc_to_yojson
    [
      ("ProducerTimestamp", option_to_yojson u_long_to_yojson x.producer_timestamp);
      ( "FragmentNumber",
        option_to_yojson kinesis_video_stream_fragment_number_to_yojson x.fragment_number );
    ]

let label_detection_feature_name_to_yojson (x : label_detection_feature_name) =
  match x with GENERAL_LABELS -> `String "GENERAL_LABELS"

let label_detection_feature_list_to_yojson tree =
  list_to_yojson label_detection_feature_name_to_yojson tree

let label_detection_settings_to_yojson (x : label_detection_settings) =
  assoc_to_yojson
    [ ("GeneralLabels", option_to_yojson general_labels_settings_to_yojson x.general_labels) ]

let list_collections_response_to_yojson (x : list_collections_response) =
  assoc_to_yojson
    [
      ("CollectionIds", option_to_yojson collection_id_list_to_yojson x.collection_ids);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("FaceModelVersions", option_to_yojson face_model_version_list_to_yojson x.face_model_versions);
    ]

let page_size_to_yojson = int_to_yojson

let list_collections_request_to_yojson (x : list_collections_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let list_dataset_entries_response_to_yojson (x : list_dataset_entries_response) =
  assoc_to_yojson
    [
      ("DatasetEntries", option_to_yojson dataset_entries_to_yojson x.dataset_entries);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
    ]

let list_dataset_entries_page_size_to_yojson = int_to_yojson
let query_string_to_yojson = string_to_yojson

let list_dataset_entries_request_to_yojson (x : list_dataset_entries_request) =
  assoc_to_yojson
    [
      ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn));
      ("ContainsLabels", option_to_yojson dataset_labels_to_yojson x.contains_labels);
      ("Labeled", option_to_yojson is_labeled_to_yojson x.labeled);
      ("SourceRefContains", option_to_yojson query_string_to_yojson x.source_ref_contains);
      ("HasErrors", option_to_yojson has_errors_to_yojson x.has_errors);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_dataset_entries_page_size_to_yojson x.max_results);
    ]

let list_dataset_labels_response_to_yojson (x : list_dataset_labels_response) =
  assoc_to_yojson
    [
      ( "DatasetLabelDescriptions",
        option_to_yojson dataset_label_descriptions_to_yojson x.dataset_label_descriptions );
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
    ]

let list_dataset_labels_page_size_to_yojson = int_to_yojson

let list_dataset_labels_request_to_yojson (x : list_dataset_labels_request) =
  assoc_to_yojson
    [
      ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn));
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_dataset_labels_page_size_to_yojson x.max_results);
    ]

let list_faces_response_to_yojson (x : list_faces_response) =
  assoc_to_yojson
    [
      ("Faces", option_to_yojson face_list_to_yojson x.faces);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
    ]

let list_faces_request_to_yojson (x : list_faces_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("FaceIds", option_to_yojson face_id_list_to_yojson x.face_ids);
    ]

let media_analysis_job_description_to_yojson (x : media_analysis_job_description) =
  assoc_to_yojson
    [
      ("JobId", Some (media_analysis_job_id_to_yojson x.job_id));
      ("JobName", option_to_yojson media_analysis_job_name_to_yojson x.job_name);
      ("OperationsConfig", Some (media_analysis_operations_config_to_yojson x.operations_config));
      ("Status", Some (media_analysis_job_status_to_yojson x.status));
      ( "FailureDetails",
        option_to_yojson media_analysis_job_failure_details_to_yojson x.failure_details );
      ("CreationTimestamp", Some (date_time_to_yojson x.creation_timestamp));
      ("CompletionTimestamp", option_to_yojson date_time_to_yojson x.completion_timestamp);
      ("Input", Some (media_analysis_input_to_yojson x.input));
      ("OutputConfig", Some (media_analysis_output_config_to_yojson x.output_config));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Results", option_to_yojson media_analysis_results_to_yojson x.results);
      ( "ManifestSummary",
        option_to_yojson media_analysis_manifest_summary_to_yojson x.manifest_summary );
    ]

let media_analysis_job_descriptions_to_yojson tree =
  list_to_yojson media_analysis_job_description_to_yojson tree

let list_media_analysis_jobs_response_to_yojson (x : list_media_analysis_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("MediaAnalysisJobs", Some (media_analysis_job_descriptions_to_yojson x.media_analysis_jobs));
    ]

let list_media_analysis_jobs_page_size_to_yojson = int_to_yojson

let list_media_analysis_jobs_request_to_yojson (x : list_media_analysis_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_media_analysis_jobs_page_size_to_yojson x.max_results);
    ]

let project_policy_document_to_yojson = string_to_yojson

let project_policy_to_yojson (x : project_policy) =
  assoc_to_yojson
    [
      ("ProjectArn", option_to_yojson project_arn_to_yojson x.project_arn);
      ("PolicyName", option_to_yojson project_policy_name_to_yojson x.policy_name);
      ( "PolicyRevisionId",
        option_to_yojson project_policy_revision_id_to_yojson x.policy_revision_id );
      ("PolicyDocument", option_to_yojson project_policy_document_to_yojson x.policy_document);
      ("CreationTimestamp", option_to_yojson date_time_to_yojson x.creation_timestamp);
      ("LastUpdatedTimestamp", option_to_yojson date_time_to_yojson x.last_updated_timestamp);
    ]

let project_policies_to_yojson tree = list_to_yojson project_policy_to_yojson tree

let list_project_policies_response_to_yojson (x : list_project_policies_response) =
  assoc_to_yojson
    [
      ("ProjectPolicies", option_to_yojson project_policies_to_yojson x.project_policies);
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
    ]

let list_project_policies_page_size_to_yojson = int_to_yojson

let list_project_policies_request_to_yojson (x : list_project_policies_request) =
  assoc_to_yojson
    [
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("NextToken", option_to_yojson extended_pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_project_policies_page_size_to_yojson x.max_results);
    ]

let stream_processor_to_yojson (x : stream_processor) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson stream_processor_name_to_yojson x.name);
      ("Status", option_to_yojson stream_processor_status_to_yojson x.status);
    ]

let stream_processor_list_to_yojson tree = list_to_yojson stream_processor_to_yojson tree

let list_stream_processors_response_to_yojson (x : list_stream_processors_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("StreamProcessors", option_to_yojson stream_processor_list_to_yojson x.stream_processors);
    ]

let list_stream_processors_request_to_yojson (x : list_stream_processors_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_map_to_yojson x.tags) ]

let resource_arn_to_yojson = string_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
    ]

let user_list_to_yojson tree = list_to_yojson user_to_yojson tree

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("Users", option_to_yojson user_list_to_yojson x.users);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let max_user_results_to_yojson = int_to_yojson

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("MaxResults", option_to_yojson max_user_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let malformed_policy_document_exception_to_yojson (x : malformed_policy_document_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let matched_user_to_yojson (x : matched_user) =
  assoc_to_yojson
    [
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
    ]

let max_duration_in_seconds_u_long_to_yojson = long_to_yojson
let max_faces_to_yojson = int_to_yojson

let notification_channel_to_yojson (x : notification_channel) =
  assoc_to_yojson
    [
      ("SNSTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
    ]

let put_project_policy_response_to_yojson (x : put_project_policy_response) =
  assoc_to_yojson
    [
      ( "PolicyRevisionId",
        option_to_yojson project_policy_revision_id_to_yojson x.policy_revision_id );
    ]

let put_project_policy_request_to_yojson (x : put_project_policy_request) =
  assoc_to_yojson
    [
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("PolicyName", Some (project_policy_name_to_yojson x.policy_name));
      ( "PolicyRevisionId",
        option_to_yojson project_policy_revision_id_to_yojson x.policy_revision_id );
      ("PolicyDocument", Some (project_policy_document_to_yojson x.policy_document));
    ]

let recognize_celebrities_response_to_yojson (x : recognize_celebrities_response) =
  assoc_to_yojson
    [
      ("CelebrityFaces", option_to_yojson celebrity_list_to_yojson x.celebrity_faces);
      ("UnrecognizedFaces", option_to_yojson compared_face_list_to_yojson x.unrecognized_faces);
      ( "OrientationCorrection",
        option_to_yojson orientation_correction_to_yojson x.orientation_correction );
    ]

let recognize_celebrities_request_to_yojson (x : recognize_celebrities_request) =
  assoc_to_yojson [ ("Image", Some (image_to_yojson x.image)) ]

let update_stream_processor_response_to_yojson = unit_to_yojson

let stream_processor_parameter_to_delete_to_yojson (x : stream_processor_parameter_to_delete) =
  match x with
  | ConnectedHomeMinConfidence -> `String "ConnectedHomeMinConfidence"
  | RegionsOfInterest -> `String "RegionsOfInterest"

let stream_processor_parameters_to_delete_to_yojson tree =
  list_to_yojson stream_processor_parameter_to_delete_to_yojson tree

let stream_processor_settings_for_update_to_yojson (x : stream_processor_settings_for_update) =
  assoc_to_yojson
    [
      ( "ConnectedHomeForUpdate",
        option_to_yojson connected_home_settings_for_update_to_yojson x.connected_home_for_update );
    ]

let update_stream_processor_request_to_yojson (x : update_stream_processor_request) =
  assoc_to_yojson
    [
      ("Name", Some (stream_processor_name_to_yojson x.name));
      ( "SettingsForUpdate",
        option_to_yojson stream_processor_settings_for_update_to_yojson x.settings_for_update );
      ( "RegionsOfInterestForUpdate",
        option_to_yojson regions_of_interest_to_yojson x.regions_of_interest_for_update );
      ( "DataSharingPreferenceForUpdate",
        option_to_yojson stream_processor_data_sharing_preference_to_yojson
          x.data_sharing_preference_for_update );
      ( "ParametersToDelete",
        option_to_yojson stream_processor_parameters_to_delete_to_yojson x.parameters_to_delete );
    ]

let update_dataset_entries_response_to_yojson = unit_to_yojson

let update_dataset_entries_request_to_yojson (x : update_dataset_entries_request) =
  assoc_to_yojson
    [
      ("DatasetArn", Some (dataset_arn_to_yojson x.dataset_arn));
      ("Changes", Some (dataset_changes_to_yojson x.changes));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_map_to_yojson x.tags));
    ]

let stop_stream_processor_response_to_yojson = unit_to_yojson

let stop_stream_processor_request_to_yojson (x : stop_stream_processor_request) =
  assoc_to_yojson [ ("Name", Some (stream_processor_name_to_yojson x.name)) ]

let stop_project_version_response_to_yojson (x : stop_project_version_response) =
  assoc_to_yojson [ ("Status", option_to_yojson project_version_status_to_yojson x.status) ]

let stop_project_version_request_to_yojson (x : stop_project_version_request) =
  assoc_to_yojson
    [ ("ProjectVersionArn", Some (project_version_arn_to_yojson x.project_version_arn)) ]

let video_too_large_exception_to_yojson (x : video_too_large_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Logref", option_to_yojson string__to_yojson x.logref);
    ]

let start_text_detection_response_to_yojson (x : start_text_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_text_detection_filters_to_yojson (x : start_text_detection_filters) =
  assoc_to_yojson
    [
      ("WordFilter", option_to_yojson detection_filter_to_yojson x.word_filter);
      ("RegionsOfInterest", option_to_yojson regions_of_interest_to_yojson x.regions_of_interest);
    ]

let start_text_detection_request_to_yojson (x : start_text_detection_request) =
  assoc_to_yojson
    [
      ("Video", Some (video_to_yojson x.video));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Filters", option_to_yojson start_text_detection_filters_to_yojson x.filters);
    ]

let start_stream_processor_session_id_to_yojson = string_to_yojson

let start_stream_processor_response_to_yojson (x : start_stream_processor_response) =
  assoc_to_yojson
    [ ("SessionId", option_to_yojson start_stream_processor_session_id_to_yojson x.session_id) ]

let stream_processing_stop_selector_to_yojson (x : stream_processing_stop_selector) =
  assoc_to_yojson
    [
      ( "MaxDurationInSeconds",
        option_to_yojson max_duration_in_seconds_u_long_to_yojson x.max_duration_in_seconds );
    ]

let stream_processing_start_selector_to_yojson (x : stream_processing_start_selector) =
  assoc_to_yojson
    [
      ( "KVSStreamStartSelector",
        option_to_yojson kinesis_video_stream_start_selector_to_yojson x.kvs_stream_start_selector
      );
    ]

let start_stream_processor_request_to_yojson (x : start_stream_processor_request) =
  assoc_to_yojson
    [
      ("Name", Some (stream_processor_name_to_yojson x.name));
      ("StartSelector", option_to_yojson stream_processing_start_selector_to_yojson x.start_selector);
      ("StopSelector", option_to_yojson stream_processing_stop_selector_to_yojson x.stop_selector);
    ]

let start_segment_detection_response_to_yojson (x : start_segment_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let segment_types_to_yojson tree = list_to_yojson segment_type_to_yojson tree

let start_shot_detection_filter_to_yojson (x : start_shot_detection_filter) =
  assoc_to_yojson
    [
      ( "MinSegmentConfidence",
        option_to_yojson segment_confidence_to_yojson x.min_segment_confidence );
    ]

let start_technical_cue_detection_filter_to_yojson (x : start_technical_cue_detection_filter) =
  assoc_to_yojson
    [
      ( "MinSegmentConfidence",
        option_to_yojson segment_confidence_to_yojson x.min_segment_confidence );
      ("BlackFrame", option_to_yojson black_frame_to_yojson x.black_frame);
    ]

let start_segment_detection_filters_to_yojson (x : start_segment_detection_filters) =
  assoc_to_yojson
    [
      ( "TechnicalCueFilter",
        option_to_yojson start_technical_cue_detection_filter_to_yojson x.technical_cue_filter );
      ("ShotFilter", option_to_yojson start_shot_detection_filter_to_yojson x.shot_filter);
    ]

let start_segment_detection_request_to_yojson (x : start_segment_detection_request) =
  assoc_to_yojson
    [
      ("Video", Some (video_to_yojson x.video));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Filters", option_to_yojson start_segment_detection_filters_to_yojson x.filters);
      ("SegmentTypes", Some (segment_types_to_yojson x.segment_types));
    ]

let start_project_version_response_to_yojson (x : start_project_version_response) =
  assoc_to_yojson [ ("Status", option_to_yojson project_version_status_to_yojson x.status) ]

let start_project_version_request_to_yojson (x : start_project_version_request) =
  assoc_to_yojson
    [
      ("ProjectVersionArn", Some (project_version_arn_to_yojson x.project_version_arn));
      ("MinInferenceUnits", Some (inference_units_to_yojson x.min_inference_units));
      ("MaxInferenceUnits", option_to_yojson inference_units_to_yojson x.max_inference_units);
    ]

let start_person_tracking_response_to_yojson (x : start_person_tracking_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_person_tracking_request_to_yojson (x : start_person_tracking_request) =
  assoc_to_yojson
    [
      ("Video", Some (video_to_yojson x.video));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let start_media_analysis_job_response_to_yojson (x : start_media_analysis_job_response) =
  assoc_to_yojson [ ("JobId", Some (media_analysis_job_id_to_yojson x.job_id)) ]

let start_media_analysis_job_request_to_yojson (x : start_media_analysis_job_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson media_analysis_job_name_to_yojson x.job_name);
      ("OperationsConfig", Some (media_analysis_operations_config_to_yojson x.operations_config));
      ("Input", Some (media_analysis_input_to_yojson x.input));
      ("OutputConfig", Some (media_analysis_output_config_to_yojson x.output_config));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let start_label_detection_response_to_yojson (x : start_label_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_label_detection_request_to_yojson (x : start_label_detection_request) =
  assoc_to_yojson
    [
      ("Video", Some (video_to_yojson x.video));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("Features", option_to_yojson label_detection_feature_list_to_yojson x.features);
      ("Settings", option_to_yojson label_detection_settings_to_yojson x.settings);
    ]

let start_face_search_response_to_yojson (x : start_face_search_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_face_search_request_to_yojson (x : start_face_search_request) =
  assoc_to_yojson
    [
      ("Video", Some (video_to_yojson x.video));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("FaceMatchThreshold", option_to_yojson percent_to_yojson x.face_match_threshold);
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let start_face_detection_response_to_yojson (x : start_face_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_face_detection_request_to_yojson (x : start_face_detection_request) =
  assoc_to_yojson
    [
      ("Video", Some (video_to_yojson x.video));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("FaceAttributes", option_to_yojson face_attributes_to_yojson x.face_attributes);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let start_content_moderation_response_to_yojson (x : start_content_moderation_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_content_moderation_request_to_yojson (x : start_content_moderation_request) =
  assoc_to_yojson
    [
      ("Video", Some (video_to_yojson x.video));
      ("MinConfidence", option_to_yojson percent_to_yojson x.min_confidence);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let start_celebrity_recognition_response_to_yojson (x : start_celebrity_recognition_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_celebrity_recognition_request_to_yojson (x : start_celebrity_recognition_request) =
  assoc_to_yojson
    [
      ("Video", Some (video_to_yojson x.video));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
    ]

let unsearched_face_reason_to_yojson (x : unsearched_face_reason) =
  match x with
  | FACE_NOT_LARGEST -> `String "FACE_NOT_LARGEST"
  | EXCEEDS_MAX_FACES -> `String "EXCEEDS_MAX_FACES"
  | EXTREME_POSE -> `String "EXTREME_POSE"
  | LOW_BRIGHTNESS -> `String "LOW_BRIGHTNESS"
  | LOW_SHARPNESS -> `String "LOW_SHARPNESS"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | SMALL_BOUNDING_BOX -> `String "SMALL_BOUNDING_BOX"
  | LOW_FACE_QUALITY -> `String "LOW_FACE_QUALITY"

let unsearched_face_reasons_to_yojson tree = list_to_yojson unsearched_face_reason_to_yojson tree

let unsearched_face_to_yojson (x : unsearched_face) =
  assoc_to_yojson
    [
      ("FaceDetails", option_to_yojson face_detail_to_yojson x.face_details);
      ("Reasons", option_to_yojson unsearched_face_reasons_to_yojson x.reasons);
    ]

let unsearched_faces_list_to_yojson tree = list_to_yojson unsearched_face_to_yojson tree

let searched_face_details_to_yojson (x : searched_face_details) =
  assoc_to_yojson [ ("FaceDetail", option_to_yojson face_detail_to_yojson x.face_detail) ]

let user_match_to_yojson (x : user_match) =
  assoc_to_yojson
    [
      ("Similarity", option_to_yojson percent_to_yojson x.similarity);
      ("User", option_to_yojson matched_user_to_yojson x.user);
    ]

let user_match_list_to_yojson tree = list_to_yojson user_match_to_yojson tree

let search_users_by_image_response_to_yojson (x : search_users_by_image_response) =
  assoc_to_yojson
    [
      ("UserMatches", option_to_yojson user_match_list_to_yojson x.user_matches);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("SearchedFace", option_to_yojson searched_face_details_to_yojson x.searched_face);
      ("UnsearchedFaces", option_to_yojson unsearched_faces_list_to_yojson x.unsearched_faces);
    ]

let search_users_by_image_request_to_yojson (x : search_users_by_image_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("Image", Some (image_to_yojson x.image));
      ("UserMatchThreshold", option_to_yojson percent_to_yojson x.user_match_threshold);
      ("MaxUsers", option_to_yojson max_user_results_to_yojson x.max_users);
      ("QualityFilter", option_to_yojson quality_filter_to_yojson x.quality_filter);
    ]

let searched_user_to_yojson (x : searched_user) =
  assoc_to_yojson [ ("UserId", option_to_yojson user_id_to_yojson x.user_id) ]

let searched_face_to_yojson (x : searched_face) =
  assoc_to_yojson [ ("FaceId", option_to_yojson face_id_to_yojson x.face_id) ]

let search_users_response_to_yojson (x : search_users_response) =
  assoc_to_yojson
    [
      ("UserMatches", option_to_yojson user_match_list_to_yojson x.user_matches);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
      ("SearchedFace", option_to_yojson searched_face_to_yojson x.searched_face);
      ("SearchedUser", option_to_yojson searched_user_to_yojson x.searched_user);
    ]

let search_users_request_to_yojson (x : search_users_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("FaceId", option_to_yojson face_id_to_yojson x.face_id);
      ("UserMatchThreshold", option_to_yojson percent_to_yojson x.user_match_threshold);
      ("MaxUsers", option_to_yojson max_user_results_to_yojson x.max_users);
    ]

let search_faces_by_image_response_to_yojson (x : search_faces_by_image_response) =
  assoc_to_yojson
    [
      ( "SearchedFaceBoundingBox",
        option_to_yojson bounding_box_to_yojson x.searched_face_bounding_box );
      ("SearchedFaceConfidence", option_to_yojson percent_to_yojson x.searched_face_confidence);
      ("FaceMatches", option_to_yojson face_match_list_to_yojson x.face_matches);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
    ]

let search_faces_by_image_request_to_yojson (x : search_faces_by_image_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("Image", Some (image_to_yojson x.image));
      ("MaxFaces", option_to_yojson max_faces_to_yojson x.max_faces);
      ("FaceMatchThreshold", option_to_yojson percent_to_yojson x.face_match_threshold);
      ("QualityFilter", option_to_yojson quality_filter_to_yojson x.quality_filter);
    ]

let search_faces_response_to_yojson (x : search_faces_response) =
  assoc_to_yojson
    [
      ("SearchedFaceId", option_to_yojson face_id_to_yojson x.searched_face_id);
      ("FaceMatches", option_to_yojson face_match_list_to_yojson x.face_matches);
      ("FaceModelVersion", option_to_yojson string__to_yojson x.face_model_version);
    ]

let search_faces_request_to_yojson (x : search_faces_request) =
  assoc_to_yojson
    [
      ("CollectionId", Some (collection_id_to_yojson x.collection_id));
      ("FaceId", Some (face_id_to_yojson x.face_id));
      ("MaxFaces", option_to_yojson max_faces_to_yojson x.max_faces);
      ("FaceMatchThreshold", option_to_yojson percent_to_yojson x.face_match_threshold);
    ]
