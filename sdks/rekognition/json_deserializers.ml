open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : access_denied_exception)

let u_integer_of_yojson = int_of_yojson

let age_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     low = option_of_yojson (value_for_key u_integer_of_yojson "Low") _list path;
     high = option_of_yojson (value_for_key u_integer_of_yojson "High") _list path;
   }
    : age_range)

let s3_object_version_of_yojson = string_of_yojson
let s3_object_name_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson

let s3_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "Bucket") _list path;
     name = option_of_yojson (value_for_key s3_object_name_of_yojson "Name") _list path;
     version = option_of_yojson (value_for_key s3_object_version_of_yojson "Version") _list path;
   }
    : s3_object)

let ground_truth_manifest_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path }
    : ground_truth_manifest)

let asset_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ground_truth_manifest =
       option_of_yojson
         (value_for_key ground_truth_manifest_of_yojson "GroundTruthManifest")
         _list path;
   }
    : asset)

let assets_of_yojson tree path = list_of_yojson asset_of_yojson tree path

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : throttling_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : service_quota_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : resource_not_found_exception)

let provisioned_throughput_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : provisioned_throughput_exceeded_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : invalid_parameter_exception)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : internal_server_error)

let idempotent_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : idempotent_parameter_mismatch_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : conflict_exception)

let user_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String "CREATED" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UserStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UserStatus")
     : user_status)
    : user_status)

let unsuccessful_face_association_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "FACE_NOT_FOUND" -> FACE_NOT_FOUND
    | `String "ASSOCIATED_TO_A_DIFFERENT_USER" -> ASSOCIATED_TO_A_DIFFERENT_USER
    | `String "LOW_MATCH_CONFIDENCE" -> LOW_MATCH_CONFIDENCE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UnsuccessfulFaceAssociationReason" value)
    | _ -> raise (deserialize_wrong_type_error path "UnsuccessfulFaceAssociationReason")
     : unsuccessful_face_association_reason)
    : unsuccessful_face_association_reason)

let unsuccessful_face_association_reasons_of_yojson tree path =
  list_of_yojson unsuccessful_face_association_reason_of_yojson tree path

let percent_of_yojson = float_of_yojson
let user_id_of_yojson = string_of_yojson
let face_id_of_yojson = string_of_yojson

let unsuccessful_face_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_id = option_of_yojson (value_for_key face_id_of_yojson "FaceId") _list path;
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     reasons =
       option_of_yojson
         (value_for_key unsuccessful_face_association_reasons_of_yojson "Reasons")
         _list path;
   }
    : unsuccessful_face_association)

let unsuccessful_face_association_list_of_yojson tree path =
  list_of_yojson unsuccessful_face_association_of_yojson tree path

let associated_face_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ face_id = option_of_yojson (value_for_key face_id_of_yojson "FaceId") _list path }
    : associated_face)

let associated_faces_list_of_yojson tree path = list_of_yojson associated_face_of_yojson tree path

let associate_faces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_faces =
       option_of_yojson (value_for_key associated_faces_list_of_yojson "AssociatedFaces") _list path;
     unsuccessful_face_associations =
       option_of_yojson
         (value_for_key unsuccessful_face_association_list_of_yojson "UnsuccessfulFaceAssociations")
         _list path;
     user_status = option_of_yojson (value_for_key user_status_of_yojson "UserStatus") _list path;
   }
    : associate_faces_response)

let client_request_token_of_yojson = string_of_yojson
let user_face_id_list_of_yojson tree path = list_of_yojson face_id_of_yojson tree path
let collection_id_of_yojson = string_of_yojson

let associate_faces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     user_id = value_for_key user_id_of_yojson "UserId" _list path;
     face_ids = value_for_key user_face_id_list_of_yojson "FaceIds" _list path;
     user_match_threshold =
       option_of_yojson (value_for_key percent_of_yojson "UserMatchThreshold") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : associate_faces_request)

let attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULT" -> DEFAULT
    | `String "ALL" -> ALL
    | `String "AGE_RANGE" -> AGE_RANGE
    | `String "BEARD" -> BEARD
    | `String "EMOTIONS" -> EMOTIONS
    | `String "EYE_DIRECTION" -> EYE_DIRECTION
    | `String "EYEGLASSES" -> EYEGLASSES
    | `String "EYES_OPEN" -> EYES_OPEN
    | `String "GENDER" -> GENDER
    | `String "MOUTH_OPEN" -> MOUTH_OPEN
    | `String "MUSTACHE" -> MUSTACHE
    | `String "FACE_OCCLUDED" -> FACE_OCCLUDED
    | `String "SMILE" -> SMILE
    | `String "SUNGLASSES" -> SUNGLASSES
    | `String value -> raise (deserialize_unknown_enum_value_error path "Attribute" value)
    | _ -> raise (deserialize_wrong_type_error path "Attribute")
     : attribute)
    : attribute)

let attributes_of_yojson tree path = list_of_yojson attribute_of_yojson tree path
let u_long_of_yojson = long_of_yojson

let audio_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     codec = option_of_yojson (value_for_key string__of_yojson "Codec") _list path;
     duration_millis = option_of_yojson (value_for_key u_long_of_yojson "DurationMillis") _list path;
     sample_rate = option_of_yojson (value_for_key u_long_of_yojson "SampleRate") _list path;
     number_of_channels =
       option_of_yojson (value_for_key u_long_of_yojson "NumberOfChannels") _list path;
   }
    : audio_metadata)

let audio_metadata_list_of_yojson tree path = list_of_yojson audio_metadata_of_yojson tree path
let float__of_yojson = float_of_yojson

let bounding_box_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     width = option_of_yojson (value_for_key float__of_yojson "Width") _list path;
     height = option_of_yojson (value_for_key float__of_yojson "Height") _list path;
     left = option_of_yojson (value_for_key float__of_yojson "Left") _list path;
     top = option_of_yojson (value_for_key float__of_yojson "Top") _list path;
   }
    : bounding_box)

let liveness_image_blob_of_yojson = blob_of_yojson

let audit_image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bytes = option_of_yojson (value_for_key liveness_image_blob_of_yojson "Bytes") _list path;
     s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path;
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
   }
    : audit_image)

let audit_images_of_yojson tree path = list_of_yojson audit_image_of_yojson tree path
let audit_images_limit_of_yojson = int_of_yojson
let boolean__of_yojson = bool_of_yojson

let beard_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : beard)

let min_coverage_percentage_of_yojson = float_of_yojson
let max_pixel_threshold_of_yojson = float_of_yojson

let black_frame_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_pixel_threshold =
       option_of_yojson (value_for_key max_pixel_threshold_of_yojson "MaxPixelThreshold") _list path;
     min_coverage_percentage =
       option_of_yojson
         (value_for_key min_coverage_percentage_of_yojson "MinCoveragePercentage")
         _list path;
   }
    : black_frame)

let body_part_of_yojson (tree : t) path =
  ((match tree with
    | `String "FACE" -> FACE
    | `String "HEAD" -> HEAD
    | `String "LEFT_HAND" -> LEFT_HAND
    | `String "RIGHT_HAND" -> RIGHT_HAND
    | `String value -> raise (deserialize_unknown_enum_value_error path "BodyPart" value)
    | _ -> raise (deserialize_wrong_type_error path "BodyPart")
     : body_part)
    : body_part)

let covers_body_part_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
   }
    : covers_body_part)

let protective_equipment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FACE_COVER" -> FACE_COVER
    | `String "HAND_COVER" -> HAND_COVER
    | `String "HEAD_COVER" -> HEAD_COVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProtectiveEquipmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProtectiveEquipmentType")
     : protective_equipment_type)
    : protective_equipment_type)

let equipment_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     type_ = option_of_yojson (value_for_key protective_equipment_type_of_yojson "Type") _list path;
     covers_body_part =
       option_of_yojson (value_for_key covers_body_part_of_yojson "CoversBodyPart") _list path;
   }
    : equipment_detection)

let equipment_detections_of_yojson tree path =
  list_of_yojson equipment_detection_of_yojson tree path

let protective_equipment_body_part_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key body_part_of_yojson "Name") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     equipment_detections =
       option_of_yojson
         (value_for_key equipment_detections_of_yojson "EquipmentDetections")
         _list path;
   }
    : protective_equipment_body_part)

let body_parts_of_yojson tree path =
  list_of_yojson protective_equipment_body_part_of_yojson tree path

let bounding_box_height_of_yojson = float_of_yojson
let bounding_box_width_of_yojson = float_of_yojson

let known_gender_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Male" -> Male
    | `String "Female" -> Female
    | `String "Nonbinary" -> Nonbinary
    | `String "Unlisted" -> Unlisted
    | `String value -> raise (deserialize_unknown_enum_value_error path "KnownGenderType" value)
    | _ -> raise (deserialize_wrong_type_error path "KnownGenderType")
     : known_gender_type)
    : known_gender_type)

let known_gender_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_ = option_of_yojson (value_for_key known_gender_type_of_yojson "Type") _list path }
    : known_gender)

let smile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : smile)

let emotion_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "HAPPY" -> HAPPY
    | `String "SAD" -> SAD
    | `String "ANGRY" -> ANGRY
    | `String "CONFUSED" -> CONFUSED
    | `String "DISGUSTED" -> DISGUSTED
    | `String "SURPRISED" -> SURPRISED
    | `String "CALM" -> CALM
    | `String "UNKNOWN" -> UNKNOWN
    | `String "FEAR" -> FEAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "EmotionName" value)
    | _ -> raise (deserialize_wrong_type_error path "EmotionName")
     : emotion_name)
    : emotion_name)

let emotion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key emotion_name_of_yojson "Type") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : emotion)

let emotions_of_yojson tree path = list_of_yojson emotion_of_yojson tree path

let image_quality_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     brightness = option_of_yojson (value_for_key float__of_yojson "Brightness") _list path;
     sharpness = option_of_yojson (value_for_key float__of_yojson "Sharpness") _list path;
   }
    : image_quality)

let degree_of_yojson = float_of_yojson

let pose_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     roll = option_of_yojson (value_for_key degree_of_yojson "Roll") _list path;
     yaw = option_of_yojson (value_for_key degree_of_yojson "Yaw") _list path;
     pitch = option_of_yojson (value_for_key degree_of_yojson "Pitch") _list path;
   }
    : pose)

let landmark_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "eyeLeft" -> EyeLeft
    | `String "eyeRight" -> EyeRight
    | `String "nose" -> Nose
    | `String "mouthLeft" -> MouthLeft
    | `String "mouthRight" -> MouthRight
    | `String "leftEyeBrowLeft" -> LeftEyeBrowLeft
    | `String "leftEyeBrowRight" -> LeftEyeBrowRight
    | `String "leftEyeBrowUp" -> LeftEyeBrowUp
    | `String "rightEyeBrowLeft" -> RightEyeBrowLeft
    | `String "rightEyeBrowRight" -> RightEyeBrowRight
    | `String "rightEyeBrowUp" -> RightEyeBrowUp
    | `String "leftEyeLeft" -> LeftEyeLeft
    | `String "leftEyeRight" -> LeftEyeRight
    | `String "leftEyeUp" -> LeftEyeUp
    | `String "leftEyeDown" -> LeftEyeDown
    | `String "rightEyeLeft" -> RightEyeLeft
    | `String "rightEyeRight" -> RightEyeRight
    | `String "rightEyeUp" -> RightEyeUp
    | `String "rightEyeDown" -> RightEyeDown
    | `String "noseLeft" -> NoseLeft
    | `String "noseRight" -> NoseRight
    | `String "mouthUp" -> MouthUp
    | `String "mouthDown" -> MouthDown
    | `String "leftPupil" -> LeftPupil
    | `String "rightPupil" -> RightPupil
    | `String "upperJawlineLeft" -> UpperJawlineLeft
    | `String "midJawlineLeft" -> MidJawlineLeft
    | `String "chinBottom" -> ChinBottom
    | `String "midJawlineRight" -> MidJawlineRight
    | `String "upperJawlineRight" -> UpperJawlineRight
    | `String value -> raise (deserialize_unknown_enum_value_error path "LandmarkType" value)
    | _ -> raise (deserialize_wrong_type_error path "LandmarkType")
     : landmark_type)
    : landmark_type)

let landmark_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key landmark_type_of_yojson "Type") _list path;
     x = option_of_yojson (value_for_key float__of_yojson "X") _list path;
     y = option_of_yojson (value_for_key float__of_yojson "Y") _list path;
   }
    : landmark)

let landmarks_of_yojson tree path = list_of_yojson landmark_of_yojson tree path

let compared_face_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     landmarks = option_of_yojson (value_for_key landmarks_of_yojson "Landmarks") _list path;
     pose = option_of_yojson (value_for_key pose_of_yojson "Pose") _list path;
     quality = option_of_yojson (value_for_key image_quality_of_yojson "Quality") _list path;
     emotions = option_of_yojson (value_for_key emotions_of_yojson "Emotions") _list path;
     smile = option_of_yojson (value_for_key smile_of_yojson "Smile") _list path;
   }
    : compared_face)

let rekognition_unique_id_of_yojson = string_of_yojson
let url_of_yojson = string_of_yojson
let urls_of_yojson tree path = list_of_yojson url_of_yojson tree path

let celebrity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     urls = option_of_yojson (value_for_key urls_of_yojson "Urls") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key rekognition_unique_id_of_yojson "Id") _list path;
     face = option_of_yojson (value_for_key compared_face_of_yojson "Face") _list path;
     match_confidence =
       option_of_yojson (value_for_key percent_of_yojson "MatchConfidence") _list path;
     known_gender = option_of_yojson (value_for_key known_gender_of_yojson "KnownGender") _list path;
   }
    : celebrity)

let eye_direction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     yaw = option_of_yojson (value_for_key degree_of_yojson "Yaw") _list path;
     pitch = option_of_yojson (value_for_key degree_of_yojson "Pitch") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : eye_direction)

let face_occluded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : face_occluded)

let mouth_open_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : mouth_open)

let eye_open_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : eye_open)

let mustache_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : mustache)

let gender_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Male" -> Male
    | `String "Female" -> Female
    | `String value -> raise (deserialize_unknown_enum_value_error path "GenderType" value)
    | _ -> raise (deserialize_wrong_type_error path "GenderType")
     : gender_type)
    : gender_type)

let gender_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key gender_type_of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : gender)

let sunglasses_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : sunglasses)

let eyeglasses_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key boolean__of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : eyeglasses)

let face_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     age_range = option_of_yojson (value_for_key age_range_of_yojson "AgeRange") _list path;
     smile = option_of_yojson (value_for_key smile_of_yojson "Smile") _list path;
     eyeglasses = option_of_yojson (value_for_key eyeglasses_of_yojson "Eyeglasses") _list path;
     sunglasses = option_of_yojson (value_for_key sunglasses_of_yojson "Sunglasses") _list path;
     gender = option_of_yojson (value_for_key gender_of_yojson "Gender") _list path;
     beard = option_of_yojson (value_for_key beard_of_yojson "Beard") _list path;
     mustache = option_of_yojson (value_for_key mustache_of_yojson "Mustache") _list path;
     eyes_open = option_of_yojson (value_for_key eye_open_of_yojson "EyesOpen") _list path;
     mouth_open = option_of_yojson (value_for_key mouth_open_of_yojson "MouthOpen") _list path;
     emotions = option_of_yojson (value_for_key emotions_of_yojson "Emotions") _list path;
     landmarks = option_of_yojson (value_for_key landmarks_of_yojson "Landmarks") _list path;
     pose = option_of_yojson (value_for_key pose_of_yojson "Pose") _list path;
     quality = option_of_yojson (value_for_key image_quality_of_yojson "Quality") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     face_occluded =
       option_of_yojson (value_for_key face_occluded_of_yojson "FaceOccluded") _list path;
     eye_direction =
       option_of_yojson (value_for_key eye_direction_of_yojson "EyeDirection") _list path;
   }
    : face_detail)

let celebrity_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     urls = option_of_yojson (value_for_key urls_of_yojson "Urls") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key rekognition_unique_id_of_yojson "Id") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     face = option_of_yojson (value_for_key face_detail_of_yojson "Face") _list path;
     known_gender = option_of_yojson (value_for_key known_gender_of_yojson "KnownGender") _list path;
   }
    : celebrity_detail)

let celebrity_list_of_yojson tree path = list_of_yojson celebrity_of_yojson tree path
let timestamp_of_yojson = long_of_yojson

let celebrity_recognition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     celebrity = option_of_yojson (value_for_key celebrity_detail_of_yojson "Celebrity") _list path;
   }
    : celebrity_recognition)

let celebrity_recognition_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "ID" -> ID
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CelebrityRecognitionSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "CelebrityRecognitionSortBy")
     : celebrity_recognition_sort_by)
    : celebrity_recognition_sort_by)

let celebrity_recognitions_of_yojson tree path =
  list_of_yojson celebrity_recognition_of_yojson tree path

let version_of_yojson = string_of_yojson

let challenge_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FaceMovementAndLightChallenge" -> FACE_MOVEMENT_AND_LIGHT_CHALLENGE
    | `String "FaceMovementChallenge" -> FACE_MOVEMENT_CHALLENGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChallengeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ChallengeType")
     : challenge_type)
    : challenge_type)

let challenge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key challenge_type_of_yojson "Type" _list path;
     version = value_for_key version_of_yojson "Version" _list path;
   }
    : challenge)

let versions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum = option_of_yojson (value_for_key version_of_yojson "Minimum") _list path;
     maximum = option_of_yojson (value_for_key version_of_yojson "Maximum") _list path;
   }
    : versions)

let challenge_preference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key challenge_type_of_yojson "Type" _list path;
     versions = option_of_yojson (value_for_key versions_of_yojson "Versions") _list path;
   }
    : challenge_preference)

let challenge_preferences_of_yojson tree path =
  list_of_yojson challenge_preference_of_yojson tree path

let collection_id_list_of_yojson tree path = list_of_yojson collection_id_of_yojson tree path

let invalid_s3_object_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : invalid_s3_object_exception)

let invalid_image_format_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : invalid_image_format_exception)

let image_too_large_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : image_too_large_exception)

let orientation_correction_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROTATE_0" -> ROTATE_0
    | `String "ROTATE_90" -> ROTATE_90
    | `String "ROTATE_180" -> ROTATE_180
    | `String "ROTATE_270" -> ROTATE_270
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OrientationCorrection" value)
    | _ -> raise (deserialize_wrong_type_error path "OrientationCorrection")
     : orientation_correction)
    : orientation_correction)

let compare_faces_unmatch_list_of_yojson tree path =
  list_of_yojson compared_face_of_yojson tree path

let compare_faces_match_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     similarity = option_of_yojson (value_for_key percent_of_yojson "Similarity") _list path;
     face = option_of_yojson (value_for_key compared_face_of_yojson "Face") _list path;
   }
    : compare_faces_match)

let compare_faces_match_list_of_yojson tree path =
  list_of_yojson compare_faces_match_of_yojson tree path

let compared_source_image_face_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : compared_source_image_face)

let compare_faces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_image_face =
       option_of_yojson
         (value_for_key compared_source_image_face_of_yojson "SourceImageFace")
         _list path;
     face_matches =
       option_of_yojson (value_for_key compare_faces_match_list_of_yojson "FaceMatches") _list path;
     unmatched_faces =
       option_of_yojson
         (value_for_key compare_faces_unmatch_list_of_yojson "UnmatchedFaces")
         _list path;
     source_image_orientation_correction =
       option_of_yojson
         (value_for_key orientation_correction_of_yojson "SourceImageOrientationCorrection")
         _list path;
     target_image_orientation_correction =
       option_of_yojson
         (value_for_key orientation_correction_of_yojson "TargetImageOrientationCorrection")
         _list path;
   }
    : compare_faces_response)

let quality_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "AUTO" -> AUTO
    | `String "LOW" -> LOW
    | `String "MEDIUM" -> MEDIUM
    | `String "HIGH" -> HIGH
    | `String value -> raise (deserialize_unknown_enum_value_error path "QualityFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "QualityFilter")
     : quality_filter)
    : quality_filter)

let image_blob_of_yojson = blob_of_yojson

let image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bytes = option_of_yojson (value_for_key image_blob_of_yojson "Bytes") _list path;
     s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path;
   }
    : image)

let compare_faces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_image = value_for_key image_of_yojson "SourceImage" _list path;
     target_image = value_for_key image_of_yojson "TargetImage" _list path;
     similarity_threshold =
       option_of_yojson (value_for_key percent_of_yojson "SimilarityThreshold") _list path;
     quality_filter =
       option_of_yojson (value_for_key quality_filter_of_yojson "QualityFilter") _list path;
   }
    : compare_faces_request)

let compared_face_list_of_yojson tree path = list_of_yojson compared_face_of_yojson tree path
let connected_home_label_of_yojson = string_of_yojson

let connected_home_labels_of_yojson tree path =
  list_of_yojson connected_home_label_of_yojson tree path

let connected_home_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     labels = value_for_key connected_home_labels_of_yojson "Labels" _list path;
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
   }
    : connected_home_settings)

let connected_home_settings_for_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     labels = option_of_yojson (value_for_key connected_home_labels_of_yojson "Labels") _list path;
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
   }
    : connected_home_settings_for_update)

let content_classifier_of_yojson (tree : t) path =
  ((match tree with
    | `String "FreeOfPersonallyIdentifiableInformation" ->
        FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION
    | `String "FreeOfAdultContent" -> FREE_OF_ADULT_CONTENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContentClassifier" value)
    | _ -> raise (deserialize_wrong_type_error path "ContentClassifier")
     : content_classifier)
    : content_classifier)

let content_classifiers_of_yojson tree path = list_of_yojson content_classifier_of_yojson tree path

let content_moderation_aggregate_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "TIMESTAMPS" -> TIMESTAMPS
    | `String "SEGMENTS" -> SEGMENTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContentModerationAggregateBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ContentModerationAggregateBy")
     : content_moderation_aggregate_by)
    : content_moderation_aggregate_by)

let content_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : content_type)

let content_types_of_yojson tree path = list_of_yojson content_type_of_yojson tree path

let moderation_label_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     parent_name = option_of_yojson (value_for_key string__of_yojson "ParentName") _list path;
     taxonomy_level =
       option_of_yojson (value_for_key u_integer_of_yojson "TaxonomyLevel") _list path;
   }
    : moderation_label)

let content_moderation_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     moderation_label =
       option_of_yojson (value_for_key moderation_label_of_yojson "ModerationLabel") _list path;
     start_timestamp_millis =
       option_of_yojson (value_for_key u_long_of_yojson "StartTimestampMillis") _list path;
     end_timestamp_millis =
       option_of_yojson (value_for_key u_long_of_yojson "EndTimestampMillis") _list path;
     duration_millis = option_of_yojson (value_for_key u_long_of_yojson "DurationMillis") _list path;
     content_types =
       option_of_yojson (value_for_key content_types_of_yojson "ContentTypes") _list path;
   }
    : content_moderation_detection)

let content_moderation_detections_of_yojson tree path =
  list_of_yojson content_moderation_detection_of_yojson tree path

let content_moderation_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContentModerationSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ContentModerationSortBy")
     : content_moderation_sort_by)
    : content_moderation_sort_by)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : resource_in_use_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : limit_exceeded_exception)

let project_version_arn_of_yojson = string_of_yojson

let copy_project_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_version_arn =
       option_of_yojson (value_for_key project_version_arn_of_yojson "ProjectVersionArn") _list path;
   }
    : copy_project_version_response)

let kms_key_id_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_map_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path
let s3_key_prefix_of_yojson = string_of_yojson

let output_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "S3Bucket") _list path;
     s3_key_prefix =
       option_of_yojson (value_for_key s3_key_prefix_of_yojson "S3KeyPrefix") _list path;
   }
    : output_config)

let version_name_of_yojson = string_of_yojson
let project_arn_of_yojson = string_of_yojson

let copy_project_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_project_arn = value_for_key project_arn_of_yojson "SourceProjectArn" _list path;
     source_project_version_arn =
       value_for_key project_version_arn_of_yojson "SourceProjectVersionArn" _list path;
     destination_project_arn =
       value_for_key project_arn_of_yojson "DestinationProjectArn" _list path;
     version_name = value_for_key version_name_of_yojson "VersionName" _list path;
     output_config = value_for_key output_config_of_yojson "OutputConfig" _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
   }
    : copy_project_version_request)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : resource_already_exists_exception)

let create_collection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code = option_of_yojson (value_for_key u_integer_of_yojson "StatusCode") _list path;
     collection_arn = option_of_yojson (value_for_key string__of_yojson "CollectionArn") _list path;
     face_model_version =
       option_of_yojson (value_for_key string__of_yojson "FaceModelVersion") _list path;
   }
    : create_collection_response)

let create_collection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
   }
    : create_collection_request)

let dataset_arn_of_yojson = string_of_yojson

let create_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path }
    : create_dataset_response)

let dataset_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRAIN" -> TRAIN
    | `String "TEST" -> TEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatasetType" value)
    | _ -> raise (deserialize_wrong_type_error path "DatasetType")
     : dataset_type)
    : dataset_type)

let dataset_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ground_truth_manifest =
       option_of_yojson
         (value_for_key ground_truth_manifest_of_yojson "GroundTruthManifest")
         _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
   }
    : dataset_source)

let create_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_source =
       option_of_yojson (value_for_key dataset_source_of_yojson "DatasetSource") _list path;
     dataset_type = value_for_key dataset_type_of_yojson "DatasetType" _list path;
     project_arn = value_for_key project_arn_of_yojson "ProjectArn" _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
   }
    : create_dataset_request)

let liveness_session_id_of_yojson = string_of_yojson

let create_face_liveness_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key liveness_session_id_of_yojson "SessionId" _list path }
    : create_face_liveness_session_response)

let liveness_s3_key_prefix_of_yojson = string_of_yojson

let liveness_output_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_key_prefix =
       option_of_yojson (value_for_key liveness_s3_key_prefix_of_yojson "S3KeyPrefix") _list path;
   }
    : liveness_output_config)

let create_face_liveness_session_request_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_config =
       option_of_yojson (value_for_key liveness_output_config_of_yojson "OutputConfig") _list path;
     audit_images_limit =
       option_of_yojson (value_for_key audit_images_limit_of_yojson "AuditImagesLimit") _list path;
     challenge_preferences =
       option_of_yojson
         (value_for_key challenge_preferences_of_yojson "ChallengePreferences")
         _list path;
   }
    : create_face_liveness_session_request_settings)

let create_face_liveness_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     settings =
       option_of_yojson
         (value_for_key create_face_liveness_session_request_settings_of_yojson "Settings")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : create_face_liveness_session_request)

let create_project_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project_arn = option_of_yojson (value_for_key project_arn_of_yojson "ProjectArn") _list path }
    : create_project_response)

let project_auto_update_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProjectAutoUpdate" value)
    | _ -> raise (deserialize_wrong_type_error path "ProjectAutoUpdate")
     : project_auto_update)
    : project_auto_update)

let customization_feature_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTENT_MODERATION" -> CONTENT_MODERATION
    | `String "CUSTOM_LABELS" -> CUSTOM_LABELS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomizationFeature" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomizationFeature")
     : customization_feature)
    : customization_feature)

let project_name_of_yojson = string_of_yojson

let create_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_name = value_for_key project_name_of_yojson "ProjectName" _list path;
     feature = option_of_yojson (value_for_key customization_feature_of_yojson "Feature") _list path;
     auto_update =
       option_of_yojson (value_for_key project_auto_update_of_yojson "AutoUpdate") _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
   }
    : create_project_request)

let create_project_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_version_arn =
       option_of_yojson (value_for_key project_version_arn_of_yojson "ProjectVersionArn") _list path;
   }
    : create_project_version_response)

let customization_feature_content_moderation_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     confidence_threshold =
       option_of_yojson (value_for_key percent_of_yojson "ConfidenceThreshold") _list path;
   }
    : customization_feature_content_moderation_config)

let customization_feature_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content_moderation =
       option_of_yojson
         (value_for_key customization_feature_content_moderation_config_of_yojson
            "ContentModeration")
         _list path;
   }
    : customization_feature_config)

let version_description_of_yojson = string_of_yojson

let testing_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assets = option_of_yojson (value_for_key assets_of_yojson "Assets") _list path;
     auto_create = option_of_yojson (value_for_key boolean__of_yojson "AutoCreate") _list path;
   }
    : testing_data)

let training_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assets = option_of_yojson (value_for_key assets_of_yojson "Assets") _list path }
    : training_data)

let create_project_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key project_arn_of_yojson "ProjectArn" _list path;
     version_name = value_for_key version_name_of_yojson "VersionName" _list path;
     output_config = value_for_key output_config_of_yojson "OutputConfig" _list path;
     training_data =
       option_of_yojson (value_for_key training_data_of_yojson "TrainingData") _list path;
     testing_data = option_of_yojson (value_for_key testing_data_of_yojson "TestingData") _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     version_description =
       option_of_yojson
         (value_for_key version_description_of_yojson "VersionDescription")
         _list path;
     feature_config =
       option_of_yojson
         (value_for_key customization_feature_config_of_yojson "FeatureConfig")
         _list path;
   }
    : create_project_version_request)

let stream_processor_arn_of_yojson = string_of_yojson

let create_stream_processor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_processor_arn =
       option_of_yojson
         (value_for_key stream_processor_arn_of_yojson "StreamProcessorArn")
         _list path;
   }
    : create_stream_processor_response)

let stream_processor_data_sharing_preference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ opt_in = value_for_key boolean__of_yojson "OptIn" _list path }
    : stream_processor_data_sharing_preference)

let point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     x = option_of_yojson (value_for_key float__of_yojson "X") _list path;
     y = option_of_yojson (value_for_key float__of_yojson "Y") _list path;
   }
    : point)

let polygon_of_yojson tree path = list_of_yojson point_of_yojson tree path

let region_of_interest_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     polygon = option_of_yojson (value_for_key polygon_of_yojson "Polygon") _list path;
   }
    : region_of_interest)

let regions_of_interest_of_yojson tree path = list_of_yojson region_of_interest_of_yojson tree path
let sns_topic_arn_of_yojson = string_of_yojson

let stream_processor_notification_channel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ sns_topic_arn = value_for_key sns_topic_arn_of_yojson "SNSTopicArn" _list path }
    : stream_processor_notification_channel)

let role_arn_of_yojson = string_of_yojson

let face_search_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id =
       option_of_yojson (value_for_key collection_id_of_yojson "CollectionId") _list path;
     face_match_threshold =
       option_of_yojson (value_for_key percent_of_yojson "FaceMatchThreshold") _list path;
   }
    : face_search_settings)

let stream_processor_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_search =
       option_of_yojson (value_for_key face_search_settings_of_yojson "FaceSearch") _list path;
     connected_home =
       option_of_yojson (value_for_key connected_home_settings_of_yojson "ConnectedHome") _list path;
   }
    : stream_processor_settings)

let stream_processor_name_of_yojson = string_of_yojson

let s3_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "Bucket") _list path;
     key_prefix = option_of_yojson (value_for_key s3_key_prefix_of_yojson "KeyPrefix") _list path;
   }
    : s3_destination)

let kinesis_data_arn_of_yojson = string_of_yojson

let kinesis_data_stream_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = option_of_yojson (value_for_key kinesis_data_arn_of_yojson "Arn") _list path }
    : kinesis_data_stream)

let stream_processor_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kinesis_data_stream =
       option_of_yojson (value_for_key kinesis_data_stream_of_yojson "KinesisDataStream") _list path;
     s3_destination =
       option_of_yojson (value_for_key s3_destination_of_yojson "S3Destination") _list path;
   }
    : stream_processor_output)

let kinesis_video_arn_of_yojson = string_of_yojson

let kinesis_video_stream_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = option_of_yojson (value_for_key kinesis_video_arn_of_yojson "Arn") _list path }
    : kinesis_video_stream)

let stream_processor_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kinesis_video_stream =
       option_of_yojson
         (value_for_key kinesis_video_stream_of_yojson "KinesisVideoStream")
         _list path;
   }
    : stream_processor_input)

let create_stream_processor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input = value_for_key stream_processor_input_of_yojson "Input" _list path;
     output = value_for_key stream_processor_output_of_yojson "Output" _list path;
     name = value_for_key stream_processor_name_of_yojson "Name" _list path;
     settings = value_for_key stream_processor_settings_of_yojson "Settings" _list path;
     role_arn = value_for_key role_arn_of_yojson "RoleArn" _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
     notification_channel =
       option_of_yojson
         (value_for_key stream_processor_notification_channel_of_yojson "NotificationChannel")
         _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     regions_of_interest =
       option_of_yojson (value_for_key regions_of_interest_of_yojson "RegionsOfInterest") _list path;
     data_sharing_preference =
       option_of_yojson
         (value_for_key stream_processor_data_sharing_preference_of_yojson "DataSharingPreference")
         _list path;
   }
    : create_stream_processor_request)

let create_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     user_id = value_for_key user_id_of_yojson "UserId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : create_user_request)

let geometry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     polygon = option_of_yojson (value_for_key polygon_of_yojson "Polygon") _list path;
   }
    : geometry)

let custom_label_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     geometry = option_of_yojson (value_for_key geometry_of_yojson "Geometry") _list path;
   }
    : custom_label)

let custom_labels_of_yojson tree path = list_of_yojson custom_label_of_yojson tree path

let customization_features_of_yojson tree path =
  list_of_yojson customization_feature_of_yojson tree path

let ground_truth_blob_of_yojson = blob_of_yojson

let dataset_changes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ground_truth = value_for_key ground_truth_blob_of_yojson "GroundTruth" _list path }
    : dataset_changes)

let dataset_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     labeled_entries =
       option_of_yojson (value_for_key u_integer_of_yojson "LabeledEntries") _list path;
     total_entries = option_of_yojson (value_for_key u_integer_of_yojson "TotalEntries") _list path;
     total_labels = option_of_yojson (value_for_key u_integer_of_yojson "TotalLabels") _list path;
     error_entries = option_of_yojson (value_for_key u_integer_of_yojson "ErrorEntries") _list path;
   }
    : dataset_stats)

let dataset_status_message_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCESS" -> SUCCESS
    | `String "SERVICE_ERROR" -> SERVICE_ERROR
    | `String "CLIENT_ERROR" -> CLIENT_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DatasetStatusMessageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "DatasetStatusMessageCode")
     : dataset_status_message_code)
    : dataset_status_message_code)

let status_message_of_yojson = string_of_yojson

let dataset_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_COMPLETE" -> CREATE_COMPLETE
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_COMPLETE" -> UPDATE_COMPLETE
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatasetStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DatasetStatus")
     : dataset_status)
    : dataset_status)

let date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let dataset_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CreationTimestamp") _list path;
     last_updated_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "LastUpdatedTimestamp") _list path;
     status = option_of_yojson (value_for_key dataset_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     status_message_code =
       option_of_yojson
         (value_for_key dataset_status_message_code_of_yojson "StatusMessageCode")
         _list path;
     dataset_stats =
       option_of_yojson (value_for_key dataset_stats_of_yojson "DatasetStats") _list path;
   }
    : dataset_description)

let dataset_entry_of_yojson = string_of_yojson
let dataset_entries_of_yojson tree path = list_of_yojson dataset_entry_of_yojson tree path
let dataset_label_of_yojson = string_of_yojson

let dataset_label_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entry_count = option_of_yojson (value_for_key u_integer_of_yojson "EntryCount") _list path;
     bounding_box_count =
       option_of_yojson (value_for_key u_integer_of_yojson "BoundingBoxCount") _list path;
   }
    : dataset_label_stats)

let dataset_label_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_name = option_of_yojson (value_for_key dataset_label_of_yojson "LabelName") _list path;
     label_stats =
       option_of_yojson (value_for_key dataset_label_stats_of_yojson "LabelStats") _list path;
   }
    : dataset_label_description)

let dataset_label_descriptions_of_yojson tree path =
  list_of_yojson dataset_label_description_of_yojson tree path

let dataset_labels_of_yojson tree path = list_of_yojson dataset_label_of_yojson tree path

let dataset_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CreationTimestamp") _list path;
     dataset_type = option_of_yojson (value_for_key dataset_type_of_yojson "DatasetType") _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     status = option_of_yojson (value_for_key dataset_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     status_message_code =
       option_of_yojson
         (value_for_key dataset_status_message_code_of_yojson "StatusMessageCode")
         _list path;
   }
    : dataset_metadata)

let dataset_metadata_list_of_yojson tree path = list_of_yojson dataset_metadata_of_yojson tree path

let delete_collection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status_code = option_of_yojson (value_for_key u_integer_of_yojson "StatusCode") _list path }
    : delete_collection_response)

let delete_collection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path }
    : delete_collection_request)

let delete_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = value_for_key dataset_arn_of_yojson "DatasetArn" _list path }
    : delete_dataset_request)

let unsuccessful_face_deletion_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASSOCIATED_TO_AN_EXISTING_USER" -> ASSOCIATED_TO_AN_EXISTING_USER
    | `String "FACE_NOT_FOUND" -> FACE_NOT_FOUND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UnsuccessfulFaceDeletionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "UnsuccessfulFaceDeletionReason")
     : unsuccessful_face_deletion_reason)
    : unsuccessful_face_deletion_reason)

let unsuccessful_face_deletion_reasons_of_yojson tree path =
  list_of_yojson unsuccessful_face_deletion_reason_of_yojson tree path

let unsuccessful_face_deletion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_id = option_of_yojson (value_for_key face_id_of_yojson "FaceId") _list path;
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
     reasons =
       option_of_yojson
         (value_for_key unsuccessful_face_deletion_reasons_of_yojson "Reasons")
         _list path;
   }
    : unsuccessful_face_deletion)

let unsuccessful_face_deletions_list_of_yojson tree path =
  list_of_yojson unsuccessful_face_deletion_of_yojson tree path

let face_id_list_of_yojson tree path = list_of_yojson face_id_of_yojson tree path

let delete_faces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deleted_faces =
       option_of_yojson (value_for_key face_id_list_of_yojson "DeletedFaces") _list path;
     unsuccessful_face_deletions =
       option_of_yojson
         (value_for_key unsuccessful_face_deletions_list_of_yojson "UnsuccessfulFaceDeletions")
         _list path;
   }
    : delete_faces_response)

let delete_faces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     face_ids = value_for_key face_id_list_of_yojson "FaceIds" _list path;
   }
    : delete_faces_request)

let project_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "CREATED" -> CREATED
    | `String "DELETING" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProjectStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProjectStatus")
     : project_status)
    : project_status)

let delete_project_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key project_status_of_yojson "Status") _list path }
    : delete_project_response)

let delete_project_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ project_arn = value_for_key project_arn_of_yojson "ProjectArn" _list path }
    : delete_project_request)

let invalid_policy_revision_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : invalid_policy_revision_id_exception)

let delete_project_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let project_policy_revision_id_of_yojson = string_of_yojson
let project_policy_name_of_yojson = string_of_yojson

let delete_project_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key project_arn_of_yojson "ProjectArn" _list path;
     policy_name = value_for_key project_policy_name_of_yojson "PolicyName" _list path;
     policy_revision_id =
       option_of_yojson
         (value_for_key project_policy_revision_id_of_yojson "PolicyRevisionId")
         _list path;
   }
    : delete_project_policy_request)

let project_version_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRAINING_IN_PROGRESS" -> TRAINING_IN_PROGRESS
    | `String "TRAINING_COMPLETED" -> TRAINING_COMPLETED
    | `String "TRAINING_FAILED" -> TRAINING_FAILED
    | `String "STARTING" -> STARTING
    | `String "RUNNING" -> RUNNING
    | `String "FAILED" -> FAILED
    | `String "STOPPING" -> STOPPING
    | `String "STOPPED" -> STOPPED
    | `String "DELETING" -> DELETING
    | `String "COPYING_IN_PROGRESS" -> COPYING_IN_PROGRESS
    | `String "COPYING_COMPLETED" -> COPYING_COMPLETED
    | `String "COPYING_FAILED" -> COPYING_FAILED
    | `String "DEPRECATED" -> DEPRECATED
    | `String "EXPIRED" -> EXPIRED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProjectVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProjectVersionStatus")
     : project_version_status)
    : project_version_status)

let delete_project_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key project_version_status_of_yojson "Status") _list path;
   }
    : delete_project_version_response)

let delete_project_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_version_arn =
       value_for_key project_version_arn_of_yojson "ProjectVersionArn" _list path;
   }
    : delete_project_version_request)

let delete_stream_processor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_stream_processor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key stream_processor_name_of_yojson "Name" _list path }
    : delete_stream_processor_request)

let delete_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     user_id = value_for_key user_id_of_yojson "UserId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : delete_user_request)

let describe_collection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_count = option_of_yojson (value_for_key u_long_of_yojson "FaceCount") _list path;
     face_model_version =
       option_of_yojson (value_for_key string__of_yojson "FaceModelVersion") _list path;
     collection_ar_n = option_of_yojson (value_for_key string__of_yojson "CollectionARN") _list path;
     creation_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CreationTimestamp") _list path;
     user_count = option_of_yojson (value_for_key u_long_of_yojson "UserCount") _list path;
   }
    : describe_collection_response)

let describe_collection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path }
    : describe_collection_request)

let describe_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_description =
       option_of_yojson
         (value_for_key dataset_description_of_yojson "DatasetDescription")
         _list path;
   }
    : describe_dataset_response)

let describe_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = value_for_key dataset_arn_of_yojson "DatasetArn" _list path }
    : describe_dataset_request)

let invalid_pagination_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : invalid_pagination_token_exception)

let extended_pagination_token_of_yojson = string_of_yojson
let inference_units_of_yojson = int_of_yojson

let summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path }
    : summary)

let evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     f1_score = option_of_yojson (value_for_key float__of_yojson "F1Score") _list path;
     summary = option_of_yojson (value_for_key summary_of_yojson "Summary") _list path;
   }
    : evaluation_result)

let validation_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assets = option_of_yojson (value_for_key assets_of_yojson "Assets") _list path }
    : validation_data)

let testing_data_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input = option_of_yojson (value_for_key testing_data_of_yojson "Input") _list path;
     output = option_of_yojson (value_for_key testing_data_of_yojson "Output") _list path;
     validation = option_of_yojson (value_for_key validation_data_of_yojson "Validation") _list path;
   }
    : testing_data_result)

let training_data_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input = option_of_yojson (value_for_key training_data_of_yojson "Input") _list path;
     output = option_of_yojson (value_for_key training_data_of_yojson "Output") _list path;
     validation = option_of_yojson (value_for_key validation_data_of_yojson "Validation") _list path;
   }
    : training_data_result)

let project_version_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_version_arn =
       option_of_yojson (value_for_key project_version_arn_of_yojson "ProjectVersionArn") _list path;
     creation_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CreationTimestamp") _list path;
     min_inference_units =
       option_of_yojson (value_for_key inference_units_of_yojson "MinInferenceUnits") _list path;
     status = option_of_yojson (value_for_key project_version_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     billable_training_time_in_seconds =
       option_of_yojson (value_for_key u_long_of_yojson "BillableTrainingTimeInSeconds") _list path;
     training_end_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "TrainingEndTimestamp") _list path;
     output_config =
       option_of_yojson (value_for_key output_config_of_yojson "OutputConfig") _list path;
     training_data_result =
       option_of_yojson
         (value_for_key training_data_result_of_yojson "TrainingDataResult")
         _list path;
     testing_data_result =
       option_of_yojson (value_for_key testing_data_result_of_yojson "TestingDataResult") _list path;
     evaluation_result =
       option_of_yojson (value_for_key evaluation_result_of_yojson "EvaluationResult") _list path;
     manifest_summary =
       option_of_yojson (value_for_key ground_truth_manifest_of_yojson "ManifestSummary") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     max_inference_units =
       option_of_yojson (value_for_key inference_units_of_yojson "MaxInferenceUnits") _list path;
     source_project_version_arn =
       option_of_yojson
         (value_for_key project_version_arn_of_yojson "SourceProjectVersionArn")
         _list path;
     version_description =
       option_of_yojson
         (value_for_key version_description_of_yojson "VersionDescription")
         _list path;
     feature = option_of_yojson (value_for_key customization_feature_of_yojson "Feature") _list path;
     base_model_version =
       option_of_yojson (value_for_key string__of_yojson "BaseModelVersion") _list path;
     feature_config =
       option_of_yojson
         (value_for_key customization_feature_config_of_yojson "FeatureConfig")
         _list path;
   }
    : project_version_description)

let project_version_descriptions_of_yojson tree path =
  list_of_yojson project_version_description_of_yojson tree path

let describe_project_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_version_descriptions =
       option_of_yojson
         (value_for_key project_version_descriptions_of_yojson "ProjectVersionDescriptions")
         _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
   }
    : describe_project_versions_response)

let project_versions_page_size_of_yojson = int_of_yojson
let version_names_of_yojson tree path = list_of_yojson version_name_of_yojson tree path

let describe_project_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key project_arn_of_yojson "ProjectArn" _list path;
     version_names =
       option_of_yojson (value_for_key version_names_of_yojson "VersionNames") _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key project_versions_page_size_of_yojson "MaxResults") _list path;
   }
    : describe_project_versions_request)

let project_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = option_of_yojson (value_for_key project_arn_of_yojson "ProjectArn") _list path;
     creation_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CreationTimestamp") _list path;
     status = option_of_yojson (value_for_key project_status_of_yojson "Status") _list path;
     datasets =
       option_of_yojson (value_for_key dataset_metadata_list_of_yojson "Datasets") _list path;
     feature = option_of_yojson (value_for_key customization_feature_of_yojson "Feature") _list path;
     auto_update =
       option_of_yojson (value_for_key project_auto_update_of_yojson "AutoUpdate") _list path;
   }
    : project_description)

let project_descriptions_of_yojson tree path =
  list_of_yojson project_description_of_yojson tree path

let describe_projects_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_descriptions =
       option_of_yojson
         (value_for_key project_descriptions_of_yojson "ProjectDescriptions")
         _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
   }
    : describe_projects_response)

let project_names_of_yojson tree path = list_of_yojson project_name_of_yojson tree path
let projects_page_size_of_yojson = int_of_yojson

let describe_projects_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key projects_page_size_of_yojson "MaxResults") _list path;
     project_names =
       option_of_yojson (value_for_key project_names_of_yojson "ProjectNames") _list path;
     features =
       option_of_yojson (value_for_key customization_features_of_yojson "Features") _list path;
   }
    : describe_projects_request)

let stream_processor_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "STARTING" -> STARTING
    | `String "RUNNING" -> RUNNING
    | `String "FAILED" -> FAILED
    | `String "STOPPING" -> STOPPING
    | `String "UPDATING" -> UPDATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StreamProcessorStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamProcessorStatus")
     : stream_processor_status)
    : stream_processor_status)

let describe_stream_processor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key stream_processor_name_of_yojson "Name") _list path;
     stream_processor_arn =
       option_of_yojson
         (value_for_key stream_processor_arn_of_yojson "StreamProcessorArn")
         _list path;
     status = option_of_yojson (value_for_key stream_processor_status_of_yojson "Status") _list path;
     status_message = option_of_yojson (value_for_key string__of_yojson "StatusMessage") _list path;
     creation_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CreationTimestamp") _list path;
     last_update_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "LastUpdateTimestamp") _list path;
     input = option_of_yojson (value_for_key stream_processor_input_of_yojson "Input") _list path;
     output = option_of_yojson (value_for_key stream_processor_output_of_yojson "Output") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     settings =
       option_of_yojson (value_for_key stream_processor_settings_of_yojson "Settings") _list path;
     notification_channel =
       option_of_yojson
         (value_for_key stream_processor_notification_channel_of_yojson "NotificationChannel")
         _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     regions_of_interest =
       option_of_yojson (value_for_key regions_of_interest_of_yojson "RegionsOfInterest") _list path;
     data_sharing_preference =
       option_of_yojson
         (value_for_key stream_processor_data_sharing_preference_of_yojson "DataSharingPreference")
         _list path;
   }
    : describe_stream_processor_response)

let describe_stream_processor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key stream_processor_name_of_yojson "Name" _list path }
    : describe_stream_processor_request)

let resource_not_ready_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : resource_not_ready_exception)

let detect_custom_labels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_labels =
       option_of_yojson (value_for_key custom_labels_of_yojson "CustomLabels") _list path;
   }
    : detect_custom_labels_response)

let detect_custom_labels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_version_arn =
       value_for_key project_version_arn_of_yojson "ProjectVersionArn" _list path;
     image = value_for_key image_of_yojson "Image" _list path;
     max_results = option_of_yojson (value_for_key u_integer_of_yojson "MaxResults") _list path;
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
   }
    : detect_custom_labels_request)

let face_detail_list_of_yojson tree path = list_of_yojson face_detail_of_yojson tree path

let detect_faces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_details =
       option_of_yojson (value_for_key face_detail_list_of_yojson "FaceDetails") _list path;
     orientation_correction =
       option_of_yojson
         (value_for_key orientation_correction_of_yojson "OrientationCorrection")
         _list path;
   }
    : detect_faces_response)

let detect_faces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image = value_for_key image_of_yojson "Image" _list path;
     attributes = option_of_yojson (value_for_key attributes_of_yojson "Attributes") _list path;
   }
    : detect_faces_request)

let dominant_color_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     red = option_of_yojson (value_for_key u_integer_of_yojson "Red") _list path;
     blue = option_of_yojson (value_for_key u_integer_of_yojson "Blue") _list path;
     green = option_of_yojson (value_for_key u_integer_of_yojson "Green") _list path;
     hex_code = option_of_yojson (value_for_key string__of_yojson "HexCode") _list path;
     css_color = option_of_yojson (value_for_key string__of_yojson "CSSColor") _list path;
     simplified_color =
       option_of_yojson (value_for_key string__of_yojson "SimplifiedColor") _list path;
     pixel_percent = option_of_yojson (value_for_key percent_of_yojson "PixelPercent") _list path;
   }
    : dominant_color)

let dominant_colors_of_yojson tree path = list_of_yojson dominant_color_of_yojson tree path

let detect_labels_image_quality_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     brightness = option_of_yojson (value_for_key float__of_yojson "Brightness") _list path;
     sharpness = option_of_yojson (value_for_key float__of_yojson "Sharpness") _list path;
     contrast = option_of_yojson (value_for_key float__of_yojson "Contrast") _list path;
   }
    : detect_labels_image_quality)

let detect_labels_image_background_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quality =
       option_of_yojson (value_for_key detect_labels_image_quality_of_yojson "Quality") _list path;
     dominant_colors =
       option_of_yojson (value_for_key dominant_colors_of_yojson "DominantColors") _list path;
   }
    : detect_labels_image_background)

let detect_labels_image_foreground_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quality =
       option_of_yojson (value_for_key detect_labels_image_quality_of_yojson "Quality") _list path;
     dominant_colors =
       option_of_yojson (value_for_key dominant_colors_of_yojson "DominantColors") _list path;
   }
    : detect_labels_image_foreground)

let detect_labels_image_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quality =
       option_of_yojson (value_for_key detect_labels_image_quality_of_yojson "Quality") _list path;
     dominant_colors =
       option_of_yojson (value_for_key dominant_colors_of_yojson "DominantColors") _list path;
     foreground =
       option_of_yojson
         (value_for_key detect_labels_image_foreground_of_yojson "Foreground")
         _list path;
     background =
       option_of_yojson
         (value_for_key detect_labels_image_background_of_yojson "Background")
         _list path;
   }
    : detect_labels_image_properties)

let label_category_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key string__of_yojson "Name") _list path } : label_category)

let label_categories_of_yojson tree path = list_of_yojson label_category_of_yojson tree path

let label_alias_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key string__of_yojson "Name") _list path } : label_alias)

let label_aliases_of_yojson tree path = list_of_yojson label_alias_of_yojson tree path

let parent_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key string__of_yojson "Name") _list path } : parent)

let parents_of_yojson tree path = list_of_yojson parent_of_yojson tree path

let instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     dominant_colors =
       option_of_yojson (value_for_key dominant_colors_of_yojson "DominantColors") _list path;
   }
    : instance)

let instances_of_yojson tree path = list_of_yojson instance_of_yojson tree path

let label_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     instances = option_of_yojson (value_for_key instances_of_yojson "Instances") _list path;
     parents = option_of_yojson (value_for_key parents_of_yojson "Parents") _list path;
     aliases = option_of_yojson (value_for_key label_aliases_of_yojson "Aliases") _list path;
     categories =
       option_of_yojson (value_for_key label_categories_of_yojson "Categories") _list path;
   }
    : label)

let labels_of_yojson tree path = list_of_yojson label_of_yojson tree path

let detect_labels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     labels = option_of_yojson (value_for_key labels_of_yojson "Labels") _list path;
     orientation_correction =
       option_of_yojson
         (value_for_key orientation_correction_of_yojson "OrientationCorrection")
         _list path;
     label_model_version =
       option_of_yojson (value_for_key string__of_yojson "LabelModelVersion") _list path;
     image_properties =
       option_of_yojson
         (value_for_key detect_labels_image_properties_of_yojson "ImageProperties")
         _list path;
   }
    : detect_labels_response)

let detect_labels_max_dominant_colors_of_yojson = int_of_yojson

let detect_labels_image_properties_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_dominant_colors =
       option_of_yojson
         (value_for_key detect_labels_max_dominant_colors_of_yojson "MaxDominantColors")
         _list path;
   }
    : detect_labels_image_properties_settings)

let general_labels_filter_value_of_yojson = string_of_yojson

let general_labels_filter_list_of_yojson tree path =
  list_of_yojson general_labels_filter_value_of_yojson tree path

let general_labels_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_inclusion_filters =
       option_of_yojson
         (value_for_key general_labels_filter_list_of_yojson "LabelInclusionFilters")
         _list path;
     label_exclusion_filters =
       option_of_yojson
         (value_for_key general_labels_filter_list_of_yojson "LabelExclusionFilters")
         _list path;
     label_category_inclusion_filters =
       option_of_yojson
         (value_for_key general_labels_filter_list_of_yojson "LabelCategoryInclusionFilters")
         _list path;
     label_category_exclusion_filters =
       option_of_yojson
         (value_for_key general_labels_filter_list_of_yojson "LabelCategoryExclusionFilters")
         _list path;
   }
    : general_labels_settings)

let detect_labels_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     general_labels =
       option_of_yojson (value_for_key general_labels_settings_of_yojson "GeneralLabels") _list path;
     image_properties =
       option_of_yojson
         (value_for_key detect_labels_image_properties_settings_of_yojson "ImageProperties")
         _list path;
   }
    : detect_labels_settings)

let detect_labels_feature_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "GENERAL_LABELS" -> GENERAL_LABELS
    | `String "IMAGE_PROPERTIES" -> IMAGE_PROPERTIES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DetectLabelsFeatureName" value)
    | _ -> raise (deserialize_wrong_type_error path "DetectLabelsFeatureName")
     : detect_labels_feature_name)
    : detect_labels_feature_name)

let detect_labels_feature_list_of_yojson tree path =
  list_of_yojson detect_labels_feature_name_of_yojson tree path

let detect_labels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image = value_for_key image_of_yojson "Image" _list path;
     max_labels = option_of_yojson (value_for_key u_integer_of_yojson "MaxLabels") _list path;
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
     features =
       option_of_yojson (value_for_key detect_labels_feature_list_of_yojson "Features") _list path;
     settings =
       option_of_yojson (value_for_key detect_labels_settings_of_yojson "Settings") _list path;
   }
    : detect_labels_request)

let human_loop_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
     quota_code = option_of_yojson (value_for_key string__of_yojson "QuotaCode") _list path;
     service_code = option_of_yojson (value_for_key string__of_yojson "ServiceCode") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : human_loop_quota_exceeded_exception)

let project_version_id_of_yojson = string_of_yojson

let synthesized_json_human_loop_activation_conditions_evaluation_results_of_yojson =
  string_of_yojson

let human_loop_activation_reason_of_yojson = string_of_yojson

let human_loop_activation_reasons_of_yojson tree path =
  list_of_yojson human_loop_activation_reason_of_yojson tree path

let human_loop_arn_of_yojson = string_of_yojson

let human_loop_activation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     human_loop_arn =
       option_of_yojson (value_for_key human_loop_arn_of_yojson "HumanLoopArn") _list path;
     human_loop_activation_reasons =
       option_of_yojson
         (value_for_key human_loop_activation_reasons_of_yojson "HumanLoopActivationReasons")
         _list path;
     human_loop_activation_conditions_evaluation_results =
       option_of_yojson
         (value_for_key
            synthesized_json_human_loop_activation_conditions_evaluation_results_of_yojson
            "HumanLoopActivationConditionsEvaluationResults")
         _list path;
   }
    : human_loop_activation_output)

let moderation_labels_of_yojson tree path = list_of_yojson moderation_label_of_yojson tree path

let detect_moderation_labels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     moderation_labels =
       option_of_yojson (value_for_key moderation_labels_of_yojson "ModerationLabels") _list path;
     moderation_model_version =
       option_of_yojson (value_for_key string__of_yojson "ModerationModelVersion") _list path;
     human_loop_activation_output =
       option_of_yojson
         (value_for_key human_loop_activation_output_of_yojson "HumanLoopActivationOutput")
         _list path;
     project_version =
       option_of_yojson (value_for_key project_version_id_of_yojson "ProjectVersion") _list path;
     content_types =
       option_of_yojson (value_for_key content_types_of_yojson "ContentTypes") _list path;
   }
    : detect_moderation_labels_response)

let human_loop_data_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content_classifiers =
       option_of_yojson
         (value_for_key content_classifiers_of_yojson "ContentClassifiers")
         _list path;
   }
    : human_loop_data_attributes)

let flow_definition_arn_of_yojson = string_of_yojson
let human_loop_name_of_yojson = string_of_yojson

let human_loop_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     human_loop_name = value_for_key human_loop_name_of_yojson "HumanLoopName" _list path;
     flow_definition_arn =
       value_for_key flow_definition_arn_of_yojson "FlowDefinitionArn" _list path;
     data_attributes =
       option_of_yojson
         (value_for_key human_loop_data_attributes_of_yojson "DataAttributes")
         _list path;
   }
    : human_loop_config)

let detect_moderation_labels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image = value_for_key image_of_yojson "Image" _list path;
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
     human_loop_config =
       option_of_yojson (value_for_key human_loop_config_of_yojson "HumanLoopConfig") _list path;
     project_version =
       option_of_yojson (value_for_key project_version_id_of_yojson "ProjectVersion") _list path;
   }
    : detect_moderation_labels_request)

let protective_equipment_person_ids_of_yojson tree path =
  list_of_yojson u_integer_of_yojson tree path

let protective_equipment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     persons_with_required_equipment =
       option_of_yojson
         (value_for_key protective_equipment_person_ids_of_yojson "PersonsWithRequiredEquipment")
         _list path;
     persons_without_required_equipment =
       option_of_yojson
         (value_for_key protective_equipment_person_ids_of_yojson "PersonsWithoutRequiredEquipment")
         _list path;
     persons_indeterminate =
       option_of_yojson
         (value_for_key protective_equipment_person_ids_of_yojson "PersonsIndeterminate")
         _list path;
   }
    : protective_equipment_summary)

let protective_equipment_person_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     body_parts = option_of_yojson (value_for_key body_parts_of_yojson "BodyParts") _list path;
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     id = option_of_yojson (value_for_key u_integer_of_yojson "Id") _list path;
   }
    : protective_equipment_person)

let protective_equipment_persons_of_yojson tree path =
  list_of_yojson protective_equipment_person_of_yojson tree path

let detect_protective_equipment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protective_equipment_model_version =
       option_of_yojson
         (value_for_key string__of_yojson "ProtectiveEquipmentModelVersion")
         _list path;
     persons =
       option_of_yojson (value_for_key protective_equipment_persons_of_yojson "Persons") _list path;
     summary =
       option_of_yojson (value_for_key protective_equipment_summary_of_yojson "Summary") _list path;
   }
    : detect_protective_equipment_response)

let protective_equipment_types_of_yojson tree path =
  list_of_yojson protective_equipment_type_of_yojson tree path

let protective_equipment_summarization_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_confidence = value_for_key percent_of_yojson "MinConfidence" _list path;
     required_equipment_types =
       value_for_key protective_equipment_types_of_yojson "RequiredEquipmentTypes" _list path;
   }
    : protective_equipment_summarization_attributes)

let detect_protective_equipment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image = value_for_key image_of_yojson "Image" _list path;
     summarization_attributes =
       option_of_yojson
         (value_for_key protective_equipment_summarization_attributes_of_yojson
            "SummarizationAttributes")
         _list path;
   }
    : detect_protective_equipment_request)

let text_types_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINE" -> LINE
    | `String "WORD" -> WORD
    | `String value -> raise (deserialize_unknown_enum_value_error path "TextTypes" value)
    | _ -> raise (deserialize_wrong_type_error path "TextTypes")
     : text_types)
    : text_types)

let text_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detected_text = option_of_yojson (value_for_key string__of_yojson "DetectedText") _list path;
     type_ = option_of_yojson (value_for_key text_types_of_yojson "Type") _list path;
     id = option_of_yojson (value_for_key u_integer_of_yojson "Id") _list path;
     parent_id = option_of_yojson (value_for_key u_integer_of_yojson "ParentId") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     geometry = option_of_yojson (value_for_key geometry_of_yojson "Geometry") _list path;
   }
    : text_detection)

let text_detection_list_of_yojson tree path = list_of_yojson text_detection_of_yojson tree path

let detect_text_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_detections =
       option_of_yojson (value_for_key text_detection_list_of_yojson "TextDetections") _list path;
     text_model_version =
       option_of_yojson (value_for_key string__of_yojson "TextModelVersion") _list path;
   }
    : detect_text_response)

let detection_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
     min_bounding_box_height =
       option_of_yojson
         (value_for_key bounding_box_height_of_yojson "MinBoundingBoxHeight")
         _list path;
     min_bounding_box_width =
       option_of_yojson
         (value_for_key bounding_box_width_of_yojson "MinBoundingBoxWidth")
         _list path;
   }
    : detection_filter)

let detect_text_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     word_filter =
       option_of_yojson (value_for_key detection_filter_of_yojson "WordFilter") _list path;
     regions_of_interest =
       option_of_yojson (value_for_key regions_of_interest_of_yojson "RegionsOfInterest") _list path;
   }
    : detect_text_filters)

let detect_text_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image = value_for_key image_of_yojson "Image" _list path;
     filters = option_of_yojson (value_for_key detect_text_filters_of_yojson "Filters") _list path;
   }
    : detect_text_request)

let unsuccessful_face_disassociation_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "FACE_NOT_FOUND" -> FACE_NOT_FOUND
    | `String "ASSOCIATED_TO_A_DIFFERENT_USER" -> ASSOCIATED_TO_A_DIFFERENT_USER
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "UnsuccessfulFaceDisassociationReason" value)
    | _ -> raise (deserialize_wrong_type_error path "UnsuccessfulFaceDisassociationReason")
     : unsuccessful_face_disassociation_reason)
    : unsuccessful_face_disassociation_reason)

let unsuccessful_face_disassociation_reasons_of_yojson tree path =
  list_of_yojson unsuccessful_face_disassociation_reason_of_yojson tree path

let unsuccessful_face_disassociation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_id = option_of_yojson (value_for_key face_id_of_yojson "FaceId") _list path;
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
     reasons =
       option_of_yojson
         (value_for_key unsuccessful_face_disassociation_reasons_of_yojson "Reasons")
         _list path;
   }
    : unsuccessful_face_disassociation)

let unsuccessful_face_disassociation_list_of_yojson tree path =
  list_of_yojson unsuccessful_face_disassociation_of_yojson tree path

let disassociated_face_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ face_id = option_of_yojson (value_for_key face_id_of_yojson "FaceId") _list path }
    : disassociated_face)

let disassociated_faces_list_of_yojson tree path =
  list_of_yojson disassociated_face_of_yojson tree path

let disassociate_faces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disassociated_faces =
       option_of_yojson
         (value_for_key disassociated_faces_list_of_yojson "DisassociatedFaces")
         _list path;
     unsuccessful_face_disassociations =
       option_of_yojson
         (value_for_key unsuccessful_face_disassociation_list_of_yojson
            "UnsuccessfulFaceDisassociations")
         _list path;
     user_status = option_of_yojson (value_for_key user_status_of_yojson "UserStatus") _list path;
   }
    : disassociate_faces_response)

let disassociate_faces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     user_id = value_for_key user_id_of_yojson "UserId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     face_ids = value_for_key user_face_id_list_of_yojson "FaceIds" _list path;
   }
    : disassociate_faces_request)

let distribute_dataset_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dataset_arn_of_yojson "Arn" _list path } : distribute_dataset)

let distribute_dataset_entries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let distribute_dataset_metadata_list_of_yojson tree path =
  list_of_yojson distribute_dataset_of_yojson tree path

let distribute_dataset_entries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ datasets = value_for_key distribute_dataset_metadata_list_of_yojson "Datasets" _list path }
    : distribute_dataset_entries_request)

let external_image_id_of_yojson = string_of_yojson
let index_faces_model_version_of_yojson = string_of_yojson
let image_id_of_yojson = string_of_yojson

let face_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_id = option_of_yojson (value_for_key face_id_of_yojson "FaceId") _list path;
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     image_id = option_of_yojson (value_for_key image_id_of_yojson "ImageId") _list path;
     external_image_id =
       option_of_yojson (value_for_key external_image_id_of_yojson "ExternalImageId") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     index_faces_model_version =
       option_of_yojson
         (value_for_key index_faces_model_version_of_yojson "IndexFacesModelVersion")
         _list path;
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
   }
    : face)

let face_attributes_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULT" -> DEFAULT
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "FaceAttributes" value)
    | _ -> raise (deserialize_wrong_type_error path "FaceAttributes")
     : face_attributes)
    : face_attributes)

let face_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     face = option_of_yojson (value_for_key face_detail_of_yojson "Face") _list path;
   }
    : face_detection)

let face_detections_of_yojson tree path = list_of_yojson face_detection_of_yojson tree path
let face_list_of_yojson tree path = list_of_yojson face_of_yojson tree path

let face_match_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     similarity = option_of_yojson (value_for_key percent_of_yojson "Similarity") _list path;
     face = option_of_yojson (value_for_key face_of_yojson "Face") _list path;
   }
    : face_match)

let face_match_list_of_yojson tree path = list_of_yojson face_match_of_yojson tree path
let face_model_version_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let face_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face = option_of_yojson (value_for_key face_of_yojson "Face") _list path;
     face_detail = option_of_yojson (value_for_key face_detail_of_yojson "FaceDetail") _list path;
   }
    : face_record)

let face_record_list_of_yojson tree path = list_of_yojson face_record_of_yojson tree path

let face_search_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "INDEX" -> INDEX
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String value -> raise (deserialize_unknown_enum_value_error path "FaceSearchSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "FaceSearchSortBy")
     : face_search_sort_by)
    : face_search_sort_by)

let get_celebrity_info_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     urls = option_of_yojson (value_for_key urls_of_yojson "Urls") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     known_gender = option_of_yojson (value_for_key known_gender_of_yojson "KnownGender") _list path;
   }
    : get_celebrity_info_response)

let get_celebrity_info_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key rekognition_unique_id_of_yojson "Id" _list path }
    : get_celebrity_info_request)

let job_tag_of_yojson = string_of_yojson

let video_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path }
    : video)

let job_id_of_yojson = string_of_yojson
let pagination_token_of_yojson = string_of_yojson

let video_color_range_of_yojson (tree : t) path =
  ((match tree with
    | `String "FULL" -> FULL
    | `String "LIMITED" -> LIMITED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VideoColorRange" value)
    | _ -> raise (deserialize_wrong_type_error path "VideoColorRange")
     : video_color_range)
    : video_color_range)

let video_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     codec = option_of_yojson (value_for_key string__of_yojson "Codec") _list path;
     duration_millis = option_of_yojson (value_for_key u_long_of_yojson "DurationMillis") _list path;
     format = option_of_yojson (value_for_key string__of_yojson "Format") _list path;
     frame_rate = option_of_yojson (value_for_key float__of_yojson "FrameRate") _list path;
     frame_height = option_of_yojson (value_for_key u_long_of_yojson "FrameHeight") _list path;
     frame_width = option_of_yojson (value_for_key u_long_of_yojson "FrameWidth") _list path;
     color_range =
       option_of_yojson (value_for_key video_color_range_of_yojson "ColorRange") _list path;
   }
    : video_metadata)

let video_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VideoJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "VideoJobStatus")
     : video_job_status)
    : video_job_status)

let get_celebrity_recognition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key video_job_status_of_yojson "JobStatus") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     video_metadata =
       option_of_yojson (value_for_key video_metadata_of_yojson "VideoMetadata") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     celebrities =
       option_of_yojson (value_for_key celebrity_recognitions_of_yojson "Celebrities") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     video = option_of_yojson (value_for_key video_of_yojson "Video") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : get_celebrity_recognition_response)

let max_results_of_yojson = int_of_yojson

let get_celebrity_recognition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     sort_by =
       option_of_yojson (value_for_key celebrity_recognition_sort_by_of_yojson "SortBy") _list path;
   }
    : get_celebrity_recognition_request)

let get_content_moderation_request_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by =
       option_of_yojson (value_for_key content_moderation_sort_by_of_yojson "SortBy") _list path;
     aggregate_by =
       option_of_yojson
         (value_for_key content_moderation_aggregate_by_of_yojson "AggregateBy")
         _list path;
   }
    : get_content_moderation_request_metadata)

let get_content_moderation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key video_job_status_of_yojson "JobStatus") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     video_metadata =
       option_of_yojson (value_for_key video_metadata_of_yojson "VideoMetadata") _list path;
     moderation_labels =
       option_of_yojson
         (value_for_key content_moderation_detections_of_yojson "ModerationLabels")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     moderation_model_version =
       option_of_yojson (value_for_key string__of_yojson "ModerationModelVersion") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     video = option_of_yojson (value_for_key video_of_yojson "Video") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     get_request_metadata =
       option_of_yojson
         (value_for_key get_content_moderation_request_metadata_of_yojson "GetRequestMetadata")
         _list path;
   }
    : get_content_moderation_response)

let get_content_moderation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     sort_by =
       option_of_yojson (value_for_key content_moderation_sort_by_of_yojson "SortBy") _list path;
     aggregate_by =
       option_of_yojson
         (value_for_key content_moderation_aggregate_by_of_yojson "AggregateBy")
         _list path;
   }
    : get_content_moderation_request)

let get_face_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key video_job_status_of_yojson "JobStatus") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     video_metadata =
       option_of_yojson (value_for_key video_metadata_of_yojson "VideoMetadata") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     faces = option_of_yojson (value_for_key face_detections_of_yojson "Faces") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     video = option_of_yojson (value_for_key video_of_yojson "Video") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : get_face_detection_response)

let get_face_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : get_face_detection_request)

let session_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : session_not_found_exception)

let liveness_session_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "EXPIRED" -> EXPIRED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LivenessSessionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LivenessSessionStatus")
     : liveness_session_status)
    : liveness_session_status)

let get_face_liveness_session_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = value_for_key liveness_session_id_of_yojson "SessionId" _list path;
     status = value_for_key liveness_session_status_of_yojson "Status" _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     reference_image =
       option_of_yojson (value_for_key audit_image_of_yojson "ReferenceImage") _list path;
     audit_images = option_of_yojson (value_for_key audit_images_of_yojson "AuditImages") _list path;
     challenge = option_of_yojson (value_for_key challenge_of_yojson "Challenge") _list path;
   }
    : get_face_liveness_session_results_response)

let get_face_liveness_session_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key liveness_session_id_of_yojson "SessionId" _list path }
    : get_face_liveness_session_results_request)

let person_index_of_yojson = long_of_yojson

let person_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key person_index_of_yojson "Index") _list path;
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     face = option_of_yojson (value_for_key face_detail_of_yojson "Face") _list path;
   }
    : person_detail)

let person_match_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     person = option_of_yojson (value_for_key person_detail_of_yojson "Person") _list path;
     face_matches =
       option_of_yojson (value_for_key face_match_list_of_yojson "FaceMatches") _list path;
   }
    : person_match)

let person_matches_of_yojson tree path = list_of_yojson person_match_of_yojson tree path

let get_face_search_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key video_job_status_of_yojson "JobStatus") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     video_metadata =
       option_of_yojson (value_for_key video_metadata_of_yojson "VideoMetadata") _list path;
     persons = option_of_yojson (value_for_key person_matches_of_yojson "Persons") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     video = option_of_yojson (value_for_key video_of_yojson "Video") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : get_face_search_response)

let get_face_search_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     sort_by = option_of_yojson (value_for_key face_search_sort_by_of_yojson "SortBy") _list path;
   }
    : get_face_search_request)

let label_detection_aggregate_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "TIMESTAMPS" -> TIMESTAMPS
    | `String "SEGMENTS" -> SEGMENTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LabelDetectionAggregateBy" value)
    | _ -> raise (deserialize_wrong_type_error path "LabelDetectionAggregateBy")
     : label_detection_aggregate_by)
    : label_detection_aggregate_by)

let label_detection_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LabelDetectionSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "LabelDetectionSortBy")
     : label_detection_sort_by)
    : label_detection_sort_by)

let get_label_detection_request_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by =
       option_of_yojson (value_for_key label_detection_sort_by_of_yojson "SortBy") _list path;
     aggregate_by =
       option_of_yojson
         (value_for_key label_detection_aggregate_by_of_yojson "AggregateBy")
         _list path;
   }
    : get_label_detection_request_metadata)

let label_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     label = option_of_yojson (value_for_key label_of_yojson "Label") _list path;
     start_timestamp_millis =
       option_of_yojson (value_for_key u_long_of_yojson "StartTimestampMillis") _list path;
     end_timestamp_millis =
       option_of_yojson (value_for_key u_long_of_yojson "EndTimestampMillis") _list path;
     duration_millis = option_of_yojson (value_for_key u_long_of_yojson "DurationMillis") _list path;
   }
    : label_detection)

let label_detections_of_yojson tree path = list_of_yojson label_detection_of_yojson tree path

let get_label_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key video_job_status_of_yojson "JobStatus") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     video_metadata =
       option_of_yojson (value_for_key video_metadata_of_yojson "VideoMetadata") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     labels = option_of_yojson (value_for_key label_detections_of_yojson "Labels") _list path;
     label_model_version =
       option_of_yojson (value_for_key string__of_yojson "LabelModelVersion") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     video = option_of_yojson (value_for_key video_of_yojson "Video") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     get_request_metadata =
       option_of_yojson
         (value_for_key get_label_detection_request_metadata_of_yojson "GetRequestMetadata")
         _list path;
   }
    : get_label_detection_response)

let get_label_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     sort_by =
       option_of_yojson (value_for_key label_detection_sort_by_of_yojson "SortBy") _list path;
     aggregate_by =
       option_of_yojson
         (value_for_key label_detection_aggregate_by_of_yojson "AggregateBy")
         _list path;
   }
    : get_label_detection_request)

let media_analysis_manifest_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path }
    : media_analysis_manifest_summary)

let media_analysis_model_versions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ moderation = option_of_yojson (value_for_key string__of_yojson "Moderation") _list path }
    : media_analysis_model_versions)

let media_analysis_results_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path;
     model_versions =
       option_of_yojson
         (value_for_key media_analysis_model_versions_of_yojson "ModelVersions")
         _list path;
   }
    : media_analysis_results)

let media_analysis_s3_key_prefix_of_yojson = string_of_yojson

let media_analysis_output_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_key_prefix =
       option_of_yojson
         (value_for_key media_analysis_s3_key_prefix_of_yojson "S3KeyPrefix")
         _list path;
   }
    : media_analysis_output_config)

let media_analysis_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_object = value_for_key s3_object_of_yojson "S3Object" _list path } : media_analysis_input)

let media_analysis_job_failure_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String "INVALID_S3_OBJECT" -> INVALID_S3_OBJECT
    | `String "INVALID_MANIFEST" -> INVALID_MANIFEST
    | `String "INVALID_OUTPUT_CONFIG" -> INVALID_OUTPUT_CONFIG
    | `String "INVALID_KMS_KEY" -> INVALID_KMS_KEY
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String "RESOURCE_NOT_FOUND" -> RESOURCE_NOT_FOUND
    | `String "RESOURCE_NOT_READY" -> RESOURCE_NOT_READY
    | `String "THROTTLED" -> THROTTLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MediaAnalysisJobFailureCode" value)
    | _ -> raise (deserialize_wrong_type_error path "MediaAnalysisJobFailureCode")
     : media_analysis_job_failure_code)
    : media_analysis_job_failure_code)

let media_analysis_job_failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       option_of_yojson (value_for_key media_analysis_job_failure_code_of_yojson "Code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : media_analysis_job_failure_details)

let media_analysis_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "QUEUED" -> QUEUED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MediaAnalysisJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MediaAnalysisJobStatus")
     : media_analysis_job_status)
    : media_analysis_job_status)

let media_analysis_detect_moderation_labels_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
     project_version =
       option_of_yojson (value_for_key project_version_id_of_yojson "ProjectVersion") _list path;
   }
    : media_analysis_detect_moderation_labels_config)

let media_analysis_operations_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detect_moderation_labels =
       option_of_yojson
         (value_for_key media_analysis_detect_moderation_labels_config_of_yojson
            "DetectModerationLabels")
         _list path;
   }
    : media_analysis_operations_config)

let media_analysis_job_name_of_yojson = string_of_yojson
let media_analysis_job_id_of_yojson = string_of_yojson

let get_media_analysis_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key media_analysis_job_id_of_yojson "JobId" _list path;
     job_name =
       option_of_yojson (value_for_key media_analysis_job_name_of_yojson "JobName") _list path;
     operations_config =
       value_for_key media_analysis_operations_config_of_yojson "OperationsConfig" _list path;
     status = value_for_key media_analysis_job_status_of_yojson "Status" _list path;
     failure_details =
       option_of_yojson
         (value_for_key media_analysis_job_failure_details_of_yojson "FailureDetails")
         _list path;
     creation_timestamp = value_for_key date_time_of_yojson "CreationTimestamp" _list path;
     completion_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTimestamp") _list path;
     input = value_for_key media_analysis_input_of_yojson "Input" _list path;
     output_config = value_for_key media_analysis_output_config_of_yojson "OutputConfig" _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     results =
       option_of_yojson (value_for_key media_analysis_results_of_yojson "Results") _list path;
     manifest_summary =
       option_of_yojson
         (value_for_key media_analysis_manifest_summary_of_yojson "ManifestSummary")
         _list path;
   }
    : get_media_analysis_job_response)

let get_media_analysis_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key media_analysis_job_id_of_yojson "JobId" _list path }
    : get_media_analysis_job_request)

let person_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     person = option_of_yojson (value_for_key person_detail_of_yojson "Person") _list path;
   }
    : person_detection)

let person_detections_of_yojson tree path = list_of_yojson person_detection_of_yojson tree path

let get_person_tracking_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key video_job_status_of_yojson "JobStatus") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     video_metadata =
       option_of_yojson (value_for_key video_metadata_of_yojson "VideoMetadata") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     persons = option_of_yojson (value_for_key person_detections_of_yojson "Persons") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     video = option_of_yojson (value_for_key video_of_yojson "Video") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : get_person_tracking_response)

let person_tracking_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "INDEX" -> INDEX
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PersonTrackingSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "PersonTrackingSortBy")
     : person_tracking_sort_by)
    : person_tracking_sort_by)

let get_person_tracking_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     sort_by =
       option_of_yojson (value_for_key person_tracking_sort_by_of_yojson "SortBy") _list path;
   }
    : get_person_tracking_request)

let segment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TECHNICAL_CUE" -> TECHNICAL_CUE
    | `String "SHOT" -> SHOT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SegmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "SegmentType")
     : segment_type)
    : segment_type)

let segment_type_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key segment_type_of_yojson "Type") _list path;
     model_version = option_of_yojson (value_for_key string__of_yojson "ModelVersion") _list path;
   }
    : segment_type_info)

let segment_types_info_of_yojson tree path = list_of_yojson segment_type_info_of_yojson tree path
let segment_confidence_of_yojson = float_of_yojson

let shot_segment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key u_long_of_yojson "Index") _list path;
     confidence =
       option_of_yojson (value_for_key segment_confidence_of_yojson "Confidence") _list path;
   }
    : shot_segment)

let technical_cue_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ColorBars" -> COLOR_BARS
    | `String "EndCredits" -> END_CREDITS
    | `String "BlackFrames" -> BLACK_FRAMES
    | `String "OpeningCredits" -> OPENING_CREDITS
    | `String "StudioLogo" -> STUDIO_LOGO
    | `String "Slate" -> SLATE
    | `String "Content" -> CONTENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TechnicalCueType" value)
    | _ -> raise (deserialize_wrong_type_error path "TechnicalCueType")
     : technical_cue_type)
    : technical_cue_type)

let technical_cue_segment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key technical_cue_type_of_yojson "Type") _list path;
     confidence =
       option_of_yojson (value_for_key segment_confidence_of_yojson "Confidence") _list path;
   }
    : technical_cue_segment)

let timecode_of_yojson = string_of_yojson

let segment_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key segment_type_of_yojson "Type") _list path;
     start_timestamp_millis =
       option_of_yojson (value_for_key timestamp_of_yojson "StartTimestampMillis") _list path;
     end_timestamp_millis =
       option_of_yojson (value_for_key timestamp_of_yojson "EndTimestampMillis") _list path;
     duration_millis = option_of_yojson (value_for_key u_long_of_yojson "DurationMillis") _list path;
     start_timecode_smpt_e =
       option_of_yojson (value_for_key timecode_of_yojson "StartTimecodeSMPTE") _list path;
     end_timecode_smpt_e =
       option_of_yojson (value_for_key timecode_of_yojson "EndTimecodeSMPTE") _list path;
     duration_smpt_e =
       option_of_yojson (value_for_key timecode_of_yojson "DurationSMPTE") _list path;
     technical_cue_segment =
       option_of_yojson
         (value_for_key technical_cue_segment_of_yojson "TechnicalCueSegment")
         _list path;
     shot_segment = option_of_yojson (value_for_key shot_segment_of_yojson "ShotSegment") _list path;
     start_frame_number =
       option_of_yojson (value_for_key u_long_of_yojson "StartFrameNumber") _list path;
     end_frame_number =
       option_of_yojson (value_for_key u_long_of_yojson "EndFrameNumber") _list path;
     duration_frames = option_of_yojson (value_for_key u_long_of_yojson "DurationFrames") _list path;
   }
    : segment_detection)

let segment_detections_of_yojson tree path = list_of_yojson segment_detection_of_yojson tree path
let video_metadata_list_of_yojson tree path = list_of_yojson video_metadata_of_yojson tree path

let get_segment_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key video_job_status_of_yojson "JobStatus") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     video_metadata =
       option_of_yojson (value_for_key video_metadata_list_of_yojson "VideoMetadata") _list path;
     audio_metadata =
       option_of_yojson (value_for_key audio_metadata_list_of_yojson "AudioMetadata") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     segments = option_of_yojson (value_for_key segment_detections_of_yojson "Segments") _list path;
     selected_segment_types =
       option_of_yojson
         (value_for_key segment_types_info_of_yojson "SelectedSegmentTypes")
         _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     video = option_of_yojson (value_for_key video_of_yojson "Video") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : get_segment_detection_response)

let get_segment_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : get_segment_detection_request)

let text_detection_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     text_detection =
       option_of_yojson (value_for_key text_detection_of_yojson "TextDetection") _list path;
   }
    : text_detection_result)

let text_detection_results_of_yojson tree path =
  list_of_yojson text_detection_result_of_yojson tree path

let get_text_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_status = option_of_yojson (value_for_key video_job_status_of_yojson "JobStatus") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     video_metadata =
       option_of_yojson (value_for_key video_metadata_of_yojson "VideoMetadata") _list path;
     text_detections =
       option_of_yojson (value_for_key text_detection_results_of_yojson "TextDetections") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     text_model_version =
       option_of_yojson (value_for_key string__of_yojson "TextModelVersion") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     video = option_of_yojson (value_for_key video_of_yojson "Video") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : get_text_detection_response)

let get_text_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : get_text_detection_request)

let has_errors_of_yojson = bool_of_yojson

let reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXCEEDS_MAX_FACES" -> EXCEEDS_MAX_FACES
    | `String "EXTREME_POSE" -> EXTREME_POSE
    | `String "LOW_BRIGHTNESS" -> LOW_BRIGHTNESS
    | `String "LOW_SHARPNESS" -> LOW_SHARPNESS
    | `String "LOW_CONFIDENCE" -> LOW_CONFIDENCE
    | `String "SMALL_BOUNDING_BOX" -> SMALL_BOUNDING_BOX
    | `String "LOW_FACE_QUALITY" -> LOW_FACE_QUALITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "Reason" value)
    | _ -> raise (deserialize_wrong_type_error path "Reason")
     : reason)
    : reason)

let reasons_of_yojson tree path = list_of_yojson reason_of_yojson tree path

let unindexed_face_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reasons = option_of_yojson (value_for_key reasons_of_yojson "Reasons") _list path;
     face_detail = option_of_yojson (value_for_key face_detail_of_yojson "FaceDetail") _list path;
   }
    : unindexed_face)

let unindexed_faces_of_yojson tree path = list_of_yojson unindexed_face_of_yojson tree path

let index_faces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_records =
       option_of_yojson (value_for_key face_record_list_of_yojson "FaceRecords") _list path;
     orientation_correction =
       option_of_yojson
         (value_for_key orientation_correction_of_yojson "OrientationCorrection")
         _list path;
     face_model_version =
       option_of_yojson (value_for_key string__of_yojson "FaceModelVersion") _list path;
     unindexed_faces =
       option_of_yojson (value_for_key unindexed_faces_of_yojson "UnindexedFaces") _list path;
   }
    : index_faces_response)

let max_faces_to_index_of_yojson = int_of_yojson

let index_faces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     image = value_for_key image_of_yojson "Image" _list path;
     external_image_id =
       option_of_yojson (value_for_key external_image_id_of_yojson "ExternalImageId") _list path;
     detection_attributes =
       option_of_yojson (value_for_key attributes_of_yojson "DetectionAttributes") _list path;
     max_faces = option_of_yojson (value_for_key max_faces_to_index_of_yojson "MaxFaces") _list path;
     quality_filter =
       option_of_yojson (value_for_key quality_filter_of_yojson "QualityFilter") _list path;
   }
    : index_faces_request)

let invalid_manifest_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : invalid_manifest_exception)

let is_labeled_of_yojson = bool_of_yojson
let kinesis_video_stream_fragment_number_of_yojson = string_of_yojson

let kinesis_video_stream_start_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     producer_timestamp =
       option_of_yojson (value_for_key u_long_of_yojson "ProducerTimestamp") _list path;
     fragment_number =
       option_of_yojson
         (value_for_key kinesis_video_stream_fragment_number_of_yojson "FragmentNumber")
         _list path;
   }
    : kinesis_video_stream_start_selector)

let label_detection_feature_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "GENERAL_LABELS" -> GENERAL_LABELS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LabelDetectionFeatureName" value)
    | _ -> raise (deserialize_wrong_type_error path "LabelDetectionFeatureName")
     : label_detection_feature_name)
    : label_detection_feature_name)

let label_detection_feature_list_of_yojson tree path =
  list_of_yojson label_detection_feature_name_of_yojson tree path

let label_detection_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     general_labels =
       option_of_yojson (value_for_key general_labels_settings_of_yojson "GeneralLabels") _list path;
   }
    : label_detection_settings)

let list_collections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_ids =
       option_of_yojson (value_for_key collection_id_list_of_yojson "CollectionIds") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     face_model_versions =
       option_of_yojson
         (value_for_key face_model_version_list_of_yojson "FaceModelVersions")
         _list path;
   }
    : list_collections_response)

let page_size_of_yojson = int_of_yojson

let list_collections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : list_collections_request)

let list_dataset_entries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_entries =
       option_of_yojson (value_for_key dataset_entries_of_yojson "DatasetEntries") _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
   }
    : list_dataset_entries_response)

let list_dataset_entries_page_size_of_yojson = int_of_yojson
let query_string_of_yojson = string_of_yojson

let list_dataset_entries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn = value_for_key dataset_arn_of_yojson "DatasetArn" _list path;
     contains_labels =
       option_of_yojson (value_for_key dataset_labels_of_yojson "ContainsLabels") _list path;
     labeled = option_of_yojson (value_for_key is_labeled_of_yojson "Labeled") _list path;
     source_ref_contains =
       option_of_yojson (value_for_key query_string_of_yojson "SourceRefContains") _list path;
     has_errors = option_of_yojson (value_for_key has_errors_of_yojson "HasErrors") _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_dataset_entries_page_size_of_yojson "MaxResults")
         _list path;
   }
    : list_dataset_entries_request)

let list_dataset_labels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_label_descriptions =
       option_of_yojson
         (value_for_key dataset_label_descriptions_of_yojson "DatasetLabelDescriptions")
         _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
   }
    : list_dataset_labels_response)

let list_dataset_labels_page_size_of_yojson = int_of_yojson

let list_dataset_labels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn = value_for_key dataset_arn_of_yojson "DatasetArn" _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_dataset_labels_page_size_of_yojson "MaxResults")
         _list path;
   }
    : list_dataset_labels_request)

let list_faces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     faces = option_of_yojson (value_for_key face_list_of_yojson "Faces") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     face_model_version =
       option_of_yojson (value_for_key string__of_yojson "FaceModelVersion") _list path;
   }
    : list_faces_response)

let list_faces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
     face_ids = option_of_yojson (value_for_key face_id_list_of_yojson "FaceIds") _list path;
   }
    : list_faces_request)

let media_analysis_job_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key media_analysis_job_id_of_yojson "JobId" _list path;
     job_name =
       option_of_yojson (value_for_key media_analysis_job_name_of_yojson "JobName") _list path;
     operations_config =
       value_for_key media_analysis_operations_config_of_yojson "OperationsConfig" _list path;
     status = value_for_key media_analysis_job_status_of_yojson "Status" _list path;
     failure_details =
       option_of_yojson
         (value_for_key media_analysis_job_failure_details_of_yojson "FailureDetails")
         _list path;
     creation_timestamp = value_for_key date_time_of_yojson "CreationTimestamp" _list path;
     completion_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionTimestamp") _list path;
     input = value_for_key media_analysis_input_of_yojson "Input" _list path;
     output_config = value_for_key media_analysis_output_config_of_yojson "OutputConfig" _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     results =
       option_of_yojson (value_for_key media_analysis_results_of_yojson "Results") _list path;
     manifest_summary =
       option_of_yojson
         (value_for_key media_analysis_manifest_summary_of_yojson "ManifestSummary")
         _list path;
   }
    : media_analysis_job_description)

let media_analysis_job_descriptions_of_yojson tree path =
  list_of_yojson media_analysis_job_description_of_yojson tree path

let list_media_analysis_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
     media_analysis_jobs =
       value_for_key media_analysis_job_descriptions_of_yojson "MediaAnalysisJobs" _list path;
   }
    : list_media_analysis_jobs_response)

let list_media_analysis_jobs_page_size_of_yojson = int_of_yojson

let list_media_analysis_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_media_analysis_jobs_page_size_of_yojson "MaxResults")
         _list path;
   }
    : list_media_analysis_jobs_request)

let project_policy_document_of_yojson = string_of_yojson

let project_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = option_of_yojson (value_for_key project_arn_of_yojson "ProjectArn") _list path;
     policy_name =
       option_of_yojson (value_for_key project_policy_name_of_yojson "PolicyName") _list path;
     policy_revision_id =
       option_of_yojson
         (value_for_key project_policy_revision_id_of_yojson "PolicyRevisionId")
         _list path;
     policy_document =
       option_of_yojson
         (value_for_key project_policy_document_of_yojson "PolicyDocument")
         _list path;
     creation_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "CreationTimestamp") _list path;
     last_updated_timestamp =
       option_of_yojson (value_for_key date_time_of_yojson "LastUpdatedTimestamp") _list path;
   }
    : project_policy)

let project_policies_of_yojson tree path = list_of_yojson project_policy_of_yojson tree path

let list_project_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_policies =
       option_of_yojson (value_for_key project_policies_of_yojson "ProjectPolicies") _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
   }
    : list_project_policies_response)

let list_project_policies_page_size_of_yojson = int_of_yojson

let list_project_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key project_arn_of_yojson "ProjectArn" _list path;
     next_token =
       option_of_yojson (value_for_key extended_pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_project_policies_page_size_of_yojson "MaxResults")
         _list path;
   }
    : list_project_policies_request)

let stream_processor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key stream_processor_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key stream_processor_status_of_yojson "Status") _list path;
   }
    : stream_processor)

let stream_processor_list_of_yojson tree path = list_of_yojson stream_processor_of_yojson tree path

let list_stream_processors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     stream_processors =
       option_of_yojson
         (value_for_key stream_processor_list_of_yojson "StreamProcessors")
         _list path;
   }
    : list_stream_processors_response)

let list_stream_processors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_stream_processors_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let resource_arn_of_yojson = string_of_yojson

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
     user_status = option_of_yojson (value_for_key user_status_of_yojson "UserStatus") _list path;
   }
    : user)

let user_list_of_yojson tree path = list_of_yojson user_of_yojson tree path

let list_users_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     users = option_of_yojson (value_for_key user_list_of_yojson "Users") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_users_response)

let max_user_results_of_yojson = int_of_yojson

let list_users_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     max_results =
       option_of_yojson (value_for_key max_user_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_users_request)

let malformed_policy_document_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : malformed_policy_document_exception)

let matched_user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
     user_status = option_of_yojson (value_for_key user_status_of_yojson "UserStatus") _list path;
   }
    : matched_user)

let max_duration_in_seconds_u_long_of_yojson = long_of_yojson
let max_faces_of_yojson = int_of_yojson

let notification_channel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_topic_arn = value_for_key sns_topic_arn_of_yojson "SNSTopicArn" _list path;
     role_arn = value_for_key role_arn_of_yojson "RoleArn" _list path;
   }
    : notification_channel)

let put_project_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_revision_id =
       option_of_yojson
         (value_for_key project_policy_revision_id_of_yojson "PolicyRevisionId")
         _list path;
   }
    : put_project_policy_response)

let put_project_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_arn = value_for_key project_arn_of_yojson "ProjectArn" _list path;
     policy_name = value_for_key project_policy_name_of_yojson "PolicyName" _list path;
     policy_revision_id =
       option_of_yojson
         (value_for_key project_policy_revision_id_of_yojson "PolicyRevisionId")
         _list path;
     policy_document = value_for_key project_policy_document_of_yojson "PolicyDocument" _list path;
   }
    : put_project_policy_request)

let recognize_celebrities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     celebrity_faces =
       option_of_yojson (value_for_key celebrity_list_of_yojson "CelebrityFaces") _list path;
     unrecognized_faces =
       option_of_yojson (value_for_key compared_face_list_of_yojson "UnrecognizedFaces") _list path;
     orientation_correction =
       option_of_yojson
         (value_for_key orientation_correction_of_yojson "OrientationCorrection")
         _list path;
   }
    : recognize_celebrities_response)

let recognize_celebrities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image = value_for_key image_of_yojson "Image" _list path } : recognize_celebrities_request)

let update_stream_processor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stream_processor_parameter_to_delete_of_yojson (tree : t) path =
  ((match tree with
    | `String "ConnectedHomeMinConfidence" -> ConnectedHomeMinConfidence
    | `String "RegionsOfInterest" -> RegionsOfInterest
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StreamProcessorParameterToDelete" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamProcessorParameterToDelete")
     : stream_processor_parameter_to_delete)
    : stream_processor_parameter_to_delete)

let stream_processor_parameters_to_delete_of_yojson tree path =
  list_of_yojson stream_processor_parameter_to_delete_of_yojson tree path

let stream_processor_settings_for_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connected_home_for_update =
       option_of_yojson
         (value_for_key connected_home_settings_for_update_of_yojson "ConnectedHomeForUpdate")
         _list path;
   }
    : stream_processor_settings_for_update)

let update_stream_processor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key stream_processor_name_of_yojson "Name" _list path;
     settings_for_update =
       option_of_yojson
         (value_for_key stream_processor_settings_for_update_of_yojson "SettingsForUpdate")
         _list path;
     regions_of_interest_for_update =
       option_of_yojson
         (value_for_key regions_of_interest_of_yojson "RegionsOfInterestForUpdate")
         _list path;
     data_sharing_preference_for_update =
       option_of_yojson
         (value_for_key stream_processor_data_sharing_preference_of_yojson
            "DataSharingPreferenceForUpdate")
         _list path;
     parameters_to_delete =
       option_of_yojson
         (value_for_key stream_processor_parameters_to_delete_of_yojson "ParametersToDelete")
         _list path;
   }
    : update_stream_processor_request)

let update_dataset_entries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_dataset_entries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn = value_for_key dataset_arn_of_yojson "DatasetArn" _list path;
     changes = value_for_key dataset_changes_of_yojson "Changes" _list path;
   }
    : update_dataset_entries_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_map_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let stop_stream_processor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_stream_processor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key stream_processor_name_of_yojson "Name" _list path }
    : stop_stream_processor_request)

let stop_project_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key project_version_status_of_yojson "Status") _list path;
   }
    : stop_project_version_response)

let stop_project_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_version_arn =
       value_for_key project_version_arn_of_yojson "ProjectVersionArn" _list path;
   }
    : stop_project_version_request)

let video_too_large_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     logref = option_of_yojson (value_for_key string__of_yojson "Logref") _list path;
   }
    : video_too_large_exception)

let start_text_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_text_detection_response)

let start_text_detection_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     word_filter =
       option_of_yojson (value_for_key detection_filter_of_yojson "WordFilter") _list path;
     regions_of_interest =
       option_of_yojson (value_for_key regions_of_interest_of_yojson "RegionsOfInterest") _list path;
   }
    : start_text_detection_filters)

let start_text_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video = value_for_key video_of_yojson "Video" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     filters =
       option_of_yojson (value_for_key start_text_detection_filters_of_yojson "Filters") _list path;
   }
    : start_text_detection_request)

let start_stream_processor_session_id_of_yojson = string_of_yojson

let start_stream_processor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id =
       option_of_yojson
         (value_for_key start_stream_processor_session_id_of_yojson "SessionId")
         _list path;
   }
    : start_stream_processor_response)

let stream_processing_stop_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_duration_in_seconds =
       option_of_yojson
         (value_for_key max_duration_in_seconds_u_long_of_yojson "MaxDurationInSeconds")
         _list path;
   }
    : stream_processing_stop_selector)

let stream_processing_start_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kvs_stream_start_selector =
       option_of_yojson
         (value_for_key kinesis_video_stream_start_selector_of_yojson "KVSStreamStartSelector")
         _list path;
   }
    : stream_processing_start_selector)

let start_stream_processor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key stream_processor_name_of_yojson "Name" _list path;
     start_selector =
       option_of_yojson
         (value_for_key stream_processing_start_selector_of_yojson "StartSelector")
         _list path;
     stop_selector =
       option_of_yojson
         (value_for_key stream_processing_stop_selector_of_yojson "StopSelector")
         _list path;
   }
    : start_stream_processor_request)

let start_segment_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_segment_detection_response)

let segment_types_of_yojson tree path = list_of_yojson segment_type_of_yojson tree path

let start_shot_detection_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_segment_confidence =
       option_of_yojson
         (value_for_key segment_confidence_of_yojson "MinSegmentConfidence")
         _list path;
   }
    : start_shot_detection_filter)

let start_technical_cue_detection_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_segment_confidence =
       option_of_yojson
         (value_for_key segment_confidence_of_yojson "MinSegmentConfidence")
         _list path;
     black_frame = option_of_yojson (value_for_key black_frame_of_yojson "BlackFrame") _list path;
   }
    : start_technical_cue_detection_filter)

let start_segment_detection_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     technical_cue_filter =
       option_of_yojson
         (value_for_key start_technical_cue_detection_filter_of_yojson "TechnicalCueFilter")
         _list path;
     shot_filter =
       option_of_yojson
         (value_for_key start_shot_detection_filter_of_yojson "ShotFilter")
         _list path;
   }
    : start_segment_detection_filters)

let start_segment_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video = value_for_key video_of_yojson "Video" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     filters =
       option_of_yojson
         (value_for_key start_segment_detection_filters_of_yojson "Filters")
         _list path;
     segment_types = value_for_key segment_types_of_yojson "SegmentTypes" _list path;
   }
    : start_segment_detection_request)

let start_project_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key project_version_status_of_yojson "Status") _list path;
   }
    : start_project_version_response)

let start_project_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project_version_arn =
       value_for_key project_version_arn_of_yojson "ProjectVersionArn" _list path;
     min_inference_units = value_for_key inference_units_of_yojson "MinInferenceUnits" _list path;
     max_inference_units =
       option_of_yojson (value_for_key inference_units_of_yojson "MaxInferenceUnits") _list path;
   }
    : start_project_version_request)

let start_person_tracking_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_person_tracking_response)

let start_person_tracking_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video = value_for_key video_of_yojson "Video" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : start_person_tracking_request)

let start_media_analysis_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key media_analysis_job_id_of_yojson "JobId" _list path }
    : start_media_analysis_job_response)

let start_media_analysis_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     job_name =
       option_of_yojson (value_for_key media_analysis_job_name_of_yojson "JobName") _list path;
     operations_config =
       value_for_key media_analysis_operations_config_of_yojson "OperationsConfig" _list path;
     input = value_for_key media_analysis_input_of_yojson "Input" _list path;
     output_config = value_for_key media_analysis_output_config_of_yojson "OutputConfig" _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
   }
    : start_media_analysis_job_request)

let start_label_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_label_detection_response)

let start_label_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video = value_for_key video_of_yojson "Video" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     features =
       option_of_yojson (value_for_key label_detection_feature_list_of_yojson "Features") _list path;
     settings =
       option_of_yojson (value_for_key label_detection_settings_of_yojson "Settings") _list path;
   }
    : start_label_detection_request)

let start_face_search_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_face_search_response)

let start_face_search_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video = value_for_key video_of_yojson "Video" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     face_match_threshold =
       option_of_yojson (value_for_key percent_of_yojson "FaceMatchThreshold") _list path;
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : start_face_search_request)

let start_face_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_face_detection_response)

let start_face_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video = value_for_key video_of_yojson "Video" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     face_attributes =
       option_of_yojson (value_for_key face_attributes_of_yojson "FaceAttributes") _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : start_face_detection_request)

let start_content_moderation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_content_moderation_response)

let start_content_moderation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video = value_for_key video_of_yojson "Video" _list path;
     min_confidence = option_of_yojson (value_for_key percent_of_yojson "MinConfidence") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : start_content_moderation_request)

let start_celebrity_recognition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_celebrity_recognition_response)

let start_celebrity_recognition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     video = value_for_key video_of_yojson "Video" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
   }
    : start_celebrity_recognition_request)

let unsearched_face_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "FACE_NOT_LARGEST" -> FACE_NOT_LARGEST
    | `String "EXCEEDS_MAX_FACES" -> EXCEEDS_MAX_FACES
    | `String "EXTREME_POSE" -> EXTREME_POSE
    | `String "LOW_BRIGHTNESS" -> LOW_BRIGHTNESS
    | `String "LOW_SHARPNESS" -> LOW_SHARPNESS
    | `String "LOW_CONFIDENCE" -> LOW_CONFIDENCE
    | `String "SMALL_BOUNDING_BOX" -> SMALL_BOUNDING_BOX
    | `String "LOW_FACE_QUALITY" -> LOW_FACE_QUALITY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UnsearchedFaceReason" value)
    | _ -> raise (deserialize_wrong_type_error path "UnsearchedFaceReason")
     : unsearched_face_reason)
    : unsearched_face_reason)

let unsearched_face_reasons_of_yojson tree path =
  list_of_yojson unsearched_face_reason_of_yojson tree path

let unsearched_face_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     face_details = option_of_yojson (value_for_key face_detail_of_yojson "FaceDetails") _list path;
     reasons =
       option_of_yojson (value_for_key unsearched_face_reasons_of_yojson "Reasons") _list path;
   }
    : unsearched_face)

let unsearched_faces_list_of_yojson tree path = list_of_yojson unsearched_face_of_yojson tree path

let searched_face_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ face_detail = option_of_yojson (value_for_key face_detail_of_yojson "FaceDetail") _list path }
    : searched_face_details)

let user_match_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     similarity = option_of_yojson (value_for_key percent_of_yojson "Similarity") _list path;
     user = option_of_yojson (value_for_key matched_user_of_yojson "User") _list path;
   }
    : user_match)

let user_match_list_of_yojson tree path = list_of_yojson user_match_of_yojson tree path

let search_users_by_image_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_matches =
       option_of_yojson (value_for_key user_match_list_of_yojson "UserMatches") _list path;
     face_model_version =
       option_of_yojson (value_for_key string__of_yojson "FaceModelVersion") _list path;
     searched_face =
       option_of_yojson (value_for_key searched_face_details_of_yojson "SearchedFace") _list path;
     unsearched_faces =
       option_of_yojson (value_for_key unsearched_faces_list_of_yojson "UnsearchedFaces") _list path;
   }
    : search_users_by_image_response)

let search_users_by_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     image = value_for_key image_of_yojson "Image" _list path;
     user_match_threshold =
       option_of_yojson (value_for_key percent_of_yojson "UserMatchThreshold") _list path;
     max_users = option_of_yojson (value_for_key max_user_results_of_yojson "MaxUsers") _list path;
     quality_filter =
       option_of_yojson (value_for_key quality_filter_of_yojson "QualityFilter") _list path;
   }
    : search_users_by_image_request)

let searched_user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path }
    : searched_user)

let searched_face_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ face_id = option_of_yojson (value_for_key face_id_of_yojson "FaceId") _list path }
    : searched_face)

let search_users_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_matches =
       option_of_yojson (value_for_key user_match_list_of_yojson "UserMatches") _list path;
     face_model_version =
       option_of_yojson (value_for_key string__of_yojson "FaceModelVersion") _list path;
     searched_face =
       option_of_yojson (value_for_key searched_face_of_yojson "SearchedFace") _list path;
     searched_user =
       option_of_yojson (value_for_key searched_user_of_yojson "SearchedUser") _list path;
   }
    : search_users_response)

let search_users_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
     face_id = option_of_yojson (value_for_key face_id_of_yojson "FaceId") _list path;
     user_match_threshold =
       option_of_yojson (value_for_key percent_of_yojson "UserMatchThreshold") _list path;
     max_users = option_of_yojson (value_for_key max_user_results_of_yojson "MaxUsers") _list path;
   }
    : search_users_request)

let search_faces_by_image_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     searched_face_bounding_box =
       option_of_yojson (value_for_key bounding_box_of_yojson "SearchedFaceBoundingBox") _list path;
     searched_face_confidence =
       option_of_yojson (value_for_key percent_of_yojson "SearchedFaceConfidence") _list path;
     face_matches =
       option_of_yojson (value_for_key face_match_list_of_yojson "FaceMatches") _list path;
     face_model_version =
       option_of_yojson (value_for_key string__of_yojson "FaceModelVersion") _list path;
   }
    : search_faces_by_image_response)

let search_faces_by_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     image = value_for_key image_of_yojson "Image" _list path;
     max_faces = option_of_yojson (value_for_key max_faces_of_yojson "MaxFaces") _list path;
     face_match_threshold =
       option_of_yojson (value_for_key percent_of_yojson "FaceMatchThreshold") _list path;
     quality_filter =
       option_of_yojson (value_for_key quality_filter_of_yojson "QualityFilter") _list path;
   }
    : search_faces_by_image_request)

let search_faces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     searched_face_id =
       option_of_yojson (value_for_key face_id_of_yojson "SearchedFaceId") _list path;
     face_matches =
       option_of_yojson (value_for_key face_match_list_of_yojson "FaceMatches") _list path;
     face_model_version =
       option_of_yojson (value_for_key string__of_yojson "FaceModelVersion") _list path;
   }
    : search_faces_response)

let search_faces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_id = value_for_key collection_id_of_yojson "CollectionId" _list path;
     face_id = value_for_key face_id_of_yojson "FaceId" _list path;
     max_faces = option_of_yojson (value_for_key max_faces_of_yojson "MaxFaces") _list path;
     face_match_threshold =
       option_of_yojson (value_for_key percent_of_yojson "FaceMatchThreshold") _list path;
   }
    : search_faces_request)
