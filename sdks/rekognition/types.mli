type nonrec string_ = string [@@ocaml.doc ""]

type nonrec video_too_large_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The file size or duration of the supplied media is too large. The maximum file size is 10GB. \
   The maximum duration is 6 hours. \n"]

type nonrec u_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec float_ = float [@@ocaml.doc ""]

type nonrec video_color_range = LIMITED [@ocaml.doc ""] | FULL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec video_metadata = {
  color_range : video_color_range option;
      [@ocaml.doc
        " A description of the range of luminance values in a video, either LIMITED (16 to 235) or \
         FULL (0 to 255). \n"]
  frame_width : u_long option; [@ocaml.doc "Horizontal pixel dimension of the video.\n"]
  frame_height : u_long option; [@ocaml.doc "Vertical pixel dimension of the video.\n"]
  frame_rate : float_ option; [@ocaml.doc "Number of frames per second in the video.\n"]
  format : string_ option;
      [@ocaml.doc "Format of the analyzed video. Possible values are MP4, MOV and AVI. \n"]
  duration_millis : u_long option; [@ocaml.doc "Length of the video in milliseconds.\n"]
  codec : string_ option; [@ocaml.doc "Type of compression used in the analyzed video. \n"]
}
[@@ocaml.doc
  "Information about a video that Amazon Rekognition analyzed. [Videometadata] is returned in \
   every page of paginated responses from a Amazon Rekognition video operation.\n"]

type nonrec video_metadata_list = video_metadata list [@@ocaml.doc ""]

type nonrec video_job_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_object_name = string [@@ocaml.doc ""]

type nonrec s3_object_version = string [@@ocaml.doc ""]

type nonrec s3_object = {
  version : s3_object_version option;
      [@ocaml.doc "If the bucket is versioning enabled, you can specify the object version. \n"]
  name : s3_object_name option; [@ocaml.doc "S3 object key name.\n"]
  bucket : s3_bucket option; [@ocaml.doc "Name of the S3 bucket.\n"]
}
[@@ocaml.doc
  "Provides the S3 bucket name and object name.\n\n\
  \ The region for the S3 bucket containing the S3 object must match the region you use for Amazon \
   Rekognition operations.\n\
  \ \n\
  \  For Amazon Rekognition to process an S3 object, the user must have permission to access the \
   S3 object. For more information, see How Amazon Rekognition works with IAM in the Amazon \
   Rekognition Developer Guide. \n\
  \  "]

type nonrec video = {
  s3_object : s3_object option;
      [@ocaml.doc "The Amazon S3 bucket name and file name for the video.\n"]
}
[@@ocaml.doc
  "Video file stored in an Amazon S3 bucket. Amazon Rekognition video start operations such as \
   [StartLabelDetection] use [Video] to specify a video for analysis. The supported file formats \
   are .mp4, .mov and .avi.\n"]

type nonrec version = string [@@ocaml.doc ""]

type nonrec versions = {
  maximum : version option; [@ocaml.doc "The desired maximum version for the challenge.\n"]
  minimum : version option; [@ocaml.doc "The desired minimum version for the challenge.\n"]
}
[@@ocaml.doc "Object specifying the acceptable range of challenge versions.\n"]

type nonrec version_name = string [@@ocaml.doc ""]

type nonrec version_names = version_name list [@@ocaml.doc ""]

type nonrec version_description = string [@@ocaml.doc ""]

type nonrec ground_truth_manifest = { s3_object : s3_object option [@ocaml.doc ""] }
[@@ocaml.doc
  "The S3 bucket that contains an Amazon Sagemaker Ground Truth format manifest file. \n"]

type nonrec asset = { ground_truth_manifest : ground_truth_manifest option [@ocaml.doc ""] }
[@@ocaml.doc
  "Assets are the images that you use to train and evaluate a model version. Assets can also \
   contain validation information that you use to debug a failed model training. \n"]

type nonrec assets = asset list [@@ocaml.doc ""]

type nonrec validation_data = {
  assets : assets option; [@ocaml.doc "The assets that comprise the validation data. \n"]
}
[@@ocaml.doc
  "Contains the Amazon S3 bucket location of the validation data for a model training job. \n\n\
  \ The validation data includes error information for individual JSON Lines in the dataset. For \
   more information, see {i Debugging a Failed Model Training} in the Amazon Rekognition Custom \
   Labels Developer Guide. \n\
  \ \n\
  \  You get the [ValidationData] object for the training dataset ([TrainingDataResult]) and the \
   test dataset ([TestingDataResult]) by calling [DescribeProjectVersions]. \n\
  \  \n\
  \   The assets array contains a single [Asset] object. The [GroundTruthManifest] field of the \
   Asset object contains the S3 bucket location of the validation data. \n\
  \   "]

type nonrec user_status =
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec percent = float [@@ocaml.doc ""]

type nonrec user_id = string [@@ocaml.doc ""]

type nonrec matched_user = {
  user_status : user_status option;
      [@ocaml.doc "The status of the user matched to a provided FaceID.\n"]
  user_id : user_id option;
      [@ocaml.doc "A provided ID for the UserID. Unique within the collection.\n"]
}
[@@ocaml.doc "Contains metadata for a UserID matched with a given face.\n"]

type nonrec user_match = {
  user : matched_user option;
      [@ocaml.doc " Confidence in the match of this UserID with the input face. \n"]
  similarity : percent option; [@ocaml.doc " Describes the UserID metadata.\n"]
}
[@@ocaml.doc
  "Provides UserID metadata along with the confidence in the match of this UserID with the input \
   face.\n"]

type nonrec user_match_list = user_match list [@@ocaml.doc ""]

type nonrec user = {
  user_status : user_status option;
      [@ocaml.doc
        " Communicates if the UserID has been updated with latest set of faces to be associated \
         with the UserID. \n"]
  user_id : user_id option;
      [@ocaml.doc " A provided ID for the User. Unique within the collection.\n"]
}
[@@ocaml.doc "Metadata of the user stored in a collection.\n"]

type nonrec user_list = user list [@@ocaml.doc ""]

type nonrec face_id = string [@@ocaml.doc ""]

type nonrec user_face_id_list = face_id list [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec urls = url list [@@ocaml.doc ""]

type nonrec update_stream_processor_response = unit [@@ocaml.doc ""]

type nonrec stream_processor_name = string [@@ocaml.doc ""]

type nonrec connected_home_label = string [@@ocaml.doc ""]

type nonrec connected_home_labels = connected_home_label list [@@ocaml.doc ""]

type nonrec connected_home_settings_for_update = {
  min_confidence : percent option;
      [@ocaml.doc " The minimum confidence required to label an object in the video. \n"]
  labels : connected_home_labels option;
      [@ocaml.doc
        " Specifies what you want to detect in the video, such as people, packages, or pets. The \
         current valid labels you can include in this list are: \"PERSON\", \"PET\", \"PACKAGE\", \
         and \"ALL\". \n"]
}
[@@ocaml.doc
  " The label detection settings you want to use in your stream processor. This includes the \
   labels you want the stream processor to detect and the minimum confidence level allowed to \
   label objects. \n"]

type nonrec stream_processor_settings_for_update = {
  connected_home_for_update : connected_home_settings_for_update option;
      [@ocaml.doc " The label detection settings you want to use for your stream processor. \n"]
}
[@@ocaml.doc
  " The stream processor settings that you want to update. [ConnectedHome] settings can be updated \
   to detect different labels with a different minimum confidence. \n"]

type nonrec bounding_box = {
  top : float_ option;
      [@ocaml.doc "Top coordinate of the bounding box as a ratio of overall image height.\n"]
  left : float_ option;
      [@ocaml.doc "Left coordinate of the bounding box as a ratio of overall image width.\n"]
  height : float_ option;
      [@ocaml.doc "Height of the bounding box as a ratio of the overall image height.\n"]
  width : float_ option;
      [@ocaml.doc "Width of the bounding box as a ratio of the overall image width.\n"]
}
[@@ocaml.doc
  "Identifies the bounding box around the label, face, text, object of interest, or personal \
   protective equipment. The [left] (x-coordinate) and [top] (y-coordinate) are coordinates \
   representing the top and left sides of the bounding box. Note that the upper-left corner of the \
   image is the origin (0,0). \n\n\
  \ The [top] and [left] values returned are ratios of the overall image size. For example, if the \
   input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 \
   pixels, the API returns a [left] value of 0.5 (350/700) and a [top] value of 0.25 (50/200).\n\
  \ \n\
  \  The [width] and [height] values represent the dimensions of the bounding box as a ratio of \
   the overall image dimension. For example, if the input image is 700x200 pixels, and the \
   bounding box width is 70 pixels, the width returned is 0.1. \n\
  \  \n\
  \     The bounding box coordinates can have negative values. For example, if Amazon Rekognition \
   is able to detect a face that is at the image edge and is only partially visible, the service \
   can return coordinates that are outside the image bounds and, depending on the image edge, you \
   might get negative values or values greater than 1 for the [left] or [top] values. \n\
  \    \n\
  \     "]

type nonrec point = {
  y : float_ option; [@ocaml.doc "The value of the Y coordinate for a point on a [Polygon].\n"]
  x : float_ option; [@ocaml.doc "The value of the X coordinate for a point on a [Polygon].\n"]
}
[@@ocaml.doc
  "The X and Y coordinates of a point on an image or video frame. The X and Y values are ratios of \
   the overall image size or video resolution. For example, if an input image is 700x200 and the \
   values are X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the image.\n\n\
  \ An array of [Point] objects makes up a [Polygon]. A [Polygon] is returned by [DetectText] and \
   by [DetectCustomLabels] [Polygon] represents a fine-grained polygon around a detected item. For \
   more information, see Geometry in the Amazon Rekognition Developer Guide. \n\
  \ "]

type nonrec polygon = point list [@@ocaml.doc ""]

type nonrec region_of_interest = {
  polygon : polygon option;
      [@ocaml.doc
        " Specifies a shape made up of up to 10 [Point] objects to define a region of interest. \n"]
  bounding_box : bounding_box option;
      [@ocaml.doc "The box representing a region of interest on screen.\n"]
}
[@@ocaml.doc
  "Specifies a location within the frame that Rekognition checks for objects of interest such as \
   text, labels, or faces. It uses a [BoundingBox] or [Polygon] to set a region of the screen.\n\n\
  \ A word, face, or label is included in the region if it is more than half in that region. If \
   there is more than one region, the word, face, or label is compared with all regions of the \
   screen. Any object of interest that is more than half in a region is kept in the results.\n\
  \ "]

type nonrec regions_of_interest = region_of_interest list [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec stream_processor_data_sharing_preference = {
  opt_in : boolean_;
      [@ocaml.doc
        " If this option is set to true, you choose to share data with Rekognition to improve \
         model performance. \n"]
}
[@@ocaml.doc
  " Allows you to opt in or opt out to share data with Rekognition to improve model performance. \
   You can choose this option at the account level or on a per-stream basis. Note that if you opt \
   out at the account level this setting is ignored on individual streams. \n"]

type nonrec stream_processor_parameter_to_delete =
  | RegionsOfInterest [@ocaml.doc ""]
  | ConnectedHomeMinConfidence [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stream_processor_parameters_to_delete = stream_processor_parameter_to_delete list
[@@ocaml.doc ""]

type nonrec update_stream_processor_request = {
  parameters_to_delete : stream_processor_parameters_to_delete option;
      [@ocaml.doc " A list of parameters you want to delete from the stream processor. \n"]
  data_sharing_preference_for_update : stream_processor_data_sharing_preference option;
      [@ocaml.doc
        " Shows whether you are sharing data with Rekognition to improve model performance. You \
         can choose this option at the account level or on a per-stream basis. Note that if you \
         opt out at the account level this setting is ignored on individual streams. \n"]
  regions_of_interest_for_update : regions_of_interest option;
      [@ocaml.doc
        " Specifies locations in the frames where Amazon Rekognition checks for objects or people. \
         This is an optional parameter for label detection stream processors. \n"]
  settings_for_update : stream_processor_settings_for_update option;
      [@ocaml.doc
        " The stream processor settings that you want to update. Label detection settings can be \
         updated to detect different labels with a different minimum confidence. \n"]
  name : stream_processor_name;
      [@ocaml.doc " Name of the stream processor that you want to update. \n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Amazon Rekognition is temporarily unable to process the request. Try your call again.\n"]

type nonrec resource_not_found_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The resource specified in the request cannot be found.\n"]

type nonrec resource_in_use_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified resource is already being used.\n"]

type nonrec provisioned_throughput_exceeded_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The number of requests exceeded your throughput limit. If you want to increase this limit, \
   contact Amazon Rekognition.\n"]

type nonrec invalid_parameter_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Input parameter violated a constraint. Validate your parameter before calling the API operation \
   again.\n"]

type nonrec internal_server_error = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Amazon Rekognition experienced a service issue. Try your call again.\n"]

type nonrec access_denied_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "You are not authorized to perform the action.\n"]

type nonrec update_dataset_entries_response = unit [@@ocaml.doc ""]

type nonrec dataset_arn = string [@@ocaml.doc ""]

type nonrec ground_truth_blob = bytes [@@ocaml.doc ""]

type nonrec dataset_changes = {
  ground_truth : ground_truth_blob;
      [@ocaml.doc
        "A Base64-encoded binary data object containing one or JSON lines that either update the \
         dataset or are additions to the dataset. You change a dataset by calling \
         [UpdateDatasetEntries]. If you are using an AWS SDK to call [UpdateDatasetEntries], you \
         don't need to encode [Changes] as the SDK encodes the data for you. \n\n\
        \ For example JSON lines, see Image-Level labels in manifest files and and Object \
         localization in manifest files in the {i Amazon Rekognition Custom Labels Developer \
         Guide}. \n\
        \ "]
}
[@@ocaml.doc
  " Describes updates or additions to a dataset. A Single update or addition is an entry (JSON \
   Line) that provides information about a single image. To update an existing entry, you match \
   the [source-ref] field of the update entry with the [source-ref] filed of the entry that you \
   want to update. If the [source-ref] field doesn't match an existing entry, the entry is added \
   to dataset as a new entry. \n"]

type nonrec update_dataset_entries_request = {
  changes : dataset_changes; [@ocaml.doc " The changes that you want to make to the dataset. \n"]
  dataset_arn : dataset_arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the dataset that you want to update. \n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An Amazon Rekognition service limit was exceeded. For example, if you start too many jobs \
   concurrently, subsequent calls to start operations (ex: [StartLabelDetection]) will raise a \
   [LimitExceededException] exception (HTTP status code: 400) until the number of concurrently \
   running jobs is below the Amazon Rekognition service limit. \n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc " A list of the tags that you want to remove. \n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        " Amazon Resource Name (ARN) of the model, collection, or stream processor that you want \
         to remove the tags from. \n"]
}
[@@ocaml.doc ""]

type nonrec unsuccessful_face_disassociation_reason =
  | ASSOCIATED_TO_A_DIFFERENT_USER [@ocaml.doc ""]
  | FACE_NOT_FOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec unsuccessful_face_disassociation_reasons = unsuccessful_face_disassociation_reason list
[@@ocaml.doc ""]

type nonrec unsuccessful_face_disassociation = {
  reasons : unsuccessful_face_disassociation_reasons option;
      [@ocaml.doc "The reason why the deletion was unsuccessful. \n"]
  user_id : user_id option;
      [@ocaml.doc "A provided ID for the UserID. Unique within the collection. \n"]
  face_id : face_id option; [@ocaml.doc "A unique identifier assigned to the face. \n"]
}
[@@ocaml.doc
  "Contains metadata like FaceId, UserID, and Reasons, for a face that was unsuccessfully \
   disassociated.\n"]

type nonrec unsuccessful_face_disassociation_list = unsuccessful_face_disassociation list
[@@ocaml.doc ""]

type nonrec unsuccessful_face_deletion_reason =
  | FACE_NOT_FOUND [@ocaml.doc ""]
  | ASSOCIATED_TO_AN_EXISTING_USER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec unsuccessful_face_deletion_reasons = unsuccessful_face_deletion_reason list
[@@ocaml.doc ""]

type nonrec unsuccessful_face_deletion = {
  reasons : unsuccessful_face_deletion_reasons option;
      [@ocaml.doc "The reason why the deletion was unsuccessful. \n"]
  user_id : user_id option;
      [@ocaml.doc " A provided ID for the UserID. Unique within the collection. \n"]
  face_id : face_id option; [@ocaml.doc " A unique identifier assigned to the face.\n"]
}
[@@ocaml.doc
  "Contains metadata like FaceId, UserID, and Reasons, for a face that was unsuccessfully deleted.\n"]

type nonrec unsuccessful_face_deletions_list = unsuccessful_face_deletion list [@@ocaml.doc ""]

type nonrec unsuccessful_face_association_reason =
  | LOW_MATCH_CONFIDENCE [@ocaml.doc ""]
  | ASSOCIATED_TO_A_DIFFERENT_USER [@ocaml.doc ""]
  | FACE_NOT_FOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec unsuccessful_face_association_reasons = unsuccessful_face_association_reason list
[@@ocaml.doc ""]

type nonrec unsuccessful_face_association = {
  reasons : unsuccessful_face_association_reasons option;
      [@ocaml.doc " The reason why the association was unsuccessful. \n"]
  confidence : percent option;
      [@ocaml.doc
        "Match confidence with the UserID, provides information regarding if a face association \
         was unsuccessful because it didn't meet UserMatchThreshold.\n"]
  user_id : user_id option;
      [@ocaml.doc "A provided ID for the UserID. Unique within the collection. \n"]
  face_id : face_id option; [@ocaml.doc "A unique identifier assigned to the face. \n"]
}
[@@ocaml.doc
  "Contains metadata like FaceId, UserID, and Reasons, for a face that was unsuccessfully \
   associated.\n"]

type nonrec unsuccessful_face_association_list = unsuccessful_face_association list [@@ocaml.doc ""]

type nonrec u_integer = int [@@ocaml.doc ""]

type nonrec age_range = {
  high : u_integer option; [@ocaml.doc "The highest estimated age.\n"]
  low : u_integer option; [@ocaml.doc "The lowest estimated age.\n"]
}
[@@ocaml.doc
  "Structure containing the estimated age range, in years, for a face.\n\n\
  \ Amazon Rekognition estimates an age range for faces detected in the input image. Estimated age \
   ranges can overlap. A face of a 5-year-old might have an estimated range of 4-6, while the face \
   of a 6-year-old might have an estimated range of 4-8.\n\
  \ "]

type nonrec smile = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the determination.\n"]
  value : boolean_ option;
      [@ocaml.doc "Boolean value that indicates whether the face is smiling or not.\n"]
}
[@@ocaml.doc
  "Indicates whether or not the face is smiling, and the confidence level in the determination.\n"]

type nonrec eyeglasses = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the determination.\n"]
  value : boolean_ option;
      [@ocaml.doc "Boolean value that indicates whether the face is wearing eye glasses or not.\n"]
}
[@@ocaml.doc
  "Indicates whether or not the face is wearing eye glasses, and the confidence level in the \
   determination.\n"]

type nonrec sunglasses = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the determination.\n"]
  value : boolean_ option;
      [@ocaml.doc "Boolean value that indicates whether the face is wearing sunglasses or not.\n"]
}
[@@ocaml.doc
  "Indicates whether or not the face is wearing sunglasses, and the confidence level in the \
   determination.\n"]

type nonrec gender_type = Female [@ocaml.doc ""] | Male [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec gender = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the prediction.\n"]
  value : gender_type option; [@ocaml.doc "The predicted gender of the face.\n"]
}
[@@ocaml.doc
  "The predicted gender of a detected face. \n\n\
  \ Amazon Rekognition makes gender binary (male/female) predictions based on the physical \
   appearance of a face in a particular image. This kind of prediction is not designed to \
   categorize a person\226\128\153s gender identity, and you shouldn't use Amazon Rekognition to \
   make such a determination. For example, a male actor wearing a long-haired wig and earrings for \
   a role might be predicted as female.\n\
  \ \n\
  \  Using Amazon Rekognition to make gender binary predictions is best suited for use cases where \
   aggregate gender distribution statistics need to be analyzed without identifying specific \
   users. For example, the percentage of female users compared to male users on a social media \
   platform. \n\
  \  \n\
  \   We don't recommend using gender binary predictions to make decisions that impact an \
   individual's rights, privacy, or access to services.\n\
  \   "]

type nonrec beard = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the determination.\n"]
  value : boolean_ option;
      [@ocaml.doc "Boolean value that indicates whether the face has beard or not.\n"]
}
[@@ocaml.doc
  "Indicates whether or not the face has a beard, and the confidence level in the determination.\n"]

type nonrec mustache = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the determination.\n"]
  value : boolean_ option;
      [@ocaml.doc "Boolean value that indicates whether the face has mustache or not.\n"]
}
[@@ocaml.doc
  "Indicates whether or not the face has a mustache, and the confidence level in the determination.\n"]

type nonrec eye_open = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the determination.\n"]
  value : boolean_ option;
      [@ocaml.doc "Boolean value that indicates whether the eyes on the face are open.\n"]
}
[@@ocaml.doc
  "Indicates whether or not the eyes on the face are open, and the confidence level in the \
   determination.\n"]

type nonrec mouth_open = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the determination.\n"]
  value : boolean_ option;
      [@ocaml.doc "Boolean value that indicates whether the mouth on the face is open or not.\n"]
}
[@@ocaml.doc
  "Indicates whether or not the mouth on the face is open, and the confidence level in the \
   determination.\n"]

type nonrec emotion_name =
  | FEAR [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | CALM [@ocaml.doc ""]
  | SURPRISED [@ocaml.doc ""]
  | DISGUSTED [@ocaml.doc ""]
  | CONFUSED [@ocaml.doc ""]
  | ANGRY [@ocaml.doc ""]
  | SAD [@ocaml.doc ""]
  | HAPPY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec emotion = {
  confidence : percent option; [@ocaml.doc "Level of confidence in the determination.\n"]
  type_ : emotion_name option; [@ocaml.doc "Type of emotion detected.\n"]
}
[@@ocaml.doc
  "The API returns a prediction of an emotion based on a person's facial expressions, along with \
   the confidence level for the predicted emotion. It is not a determination of the \
   person\226\128\153s internal emotional state and should not be used in such a way. For example, \
   a person pretending to have a sad face might not be sad emotionally. The API is not intended to \
   be used, and you may not use it, in a manner that violates the EU Artificial Intelligence Act \
   or any other applicable law.\n"]

type nonrec emotions = emotion list [@@ocaml.doc ""]

type nonrec landmark_type =
  | UpperJawlineRight [@ocaml.doc ""]
  | MidJawlineRight [@ocaml.doc ""]
  | ChinBottom [@ocaml.doc ""]
  | MidJawlineLeft [@ocaml.doc ""]
  | UpperJawlineLeft [@ocaml.doc ""]
  | RightPupil [@ocaml.doc ""]
  | LeftPupil [@ocaml.doc ""]
  | MouthDown [@ocaml.doc ""]
  | MouthUp [@ocaml.doc ""]
  | NoseRight [@ocaml.doc ""]
  | NoseLeft [@ocaml.doc ""]
  | RightEyeDown [@ocaml.doc ""]
  | RightEyeUp [@ocaml.doc ""]
  | RightEyeRight [@ocaml.doc ""]
  | RightEyeLeft [@ocaml.doc ""]
  | LeftEyeDown [@ocaml.doc ""]
  | LeftEyeUp [@ocaml.doc ""]
  | LeftEyeRight [@ocaml.doc ""]
  | LeftEyeLeft [@ocaml.doc ""]
  | RightEyeBrowUp [@ocaml.doc ""]
  | RightEyeBrowRight [@ocaml.doc ""]
  | RightEyeBrowLeft [@ocaml.doc ""]
  | LeftEyeBrowUp [@ocaml.doc ""]
  | LeftEyeBrowRight [@ocaml.doc ""]
  | LeftEyeBrowLeft [@ocaml.doc ""]
  | MouthRight [@ocaml.doc ""]
  | MouthLeft [@ocaml.doc ""]
  | Nose [@ocaml.doc ""]
  | EyeRight [@ocaml.doc ""]
  | EyeLeft [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec landmark = {
  y : float_ option;
      [@ocaml.doc
        "The y-coordinate of the landmark expressed as a ratio of the height of the image. The \
         y-coordinate is measured from the top of the image. For example, if the image height is \
         200 pixels and the y-coordinate of the landmark is at 50 pixels, this value is 0.25.\n"]
  x : float_ option;
      [@ocaml.doc
        "The x-coordinate of the landmark expressed as a ratio of the width of the image. The \
         x-coordinate is measured from the left-side of the image. For example, if the image is \
         700 pixels wide and the x-coordinate of the landmark is at 350 pixels, this value is 0.5. \n"]
  type_ : landmark_type option; [@ocaml.doc "Type of landmark.\n"]
}
[@@ocaml.doc "Indicates the location of the landmark on the face.\n"]

type nonrec landmarks = landmark list [@@ocaml.doc ""]

type nonrec degree = float [@@ocaml.doc ""]

type nonrec pose = {
  pitch : degree option; [@ocaml.doc "Value representing the face rotation on the pitch axis.\n"]
  yaw : degree option; [@ocaml.doc "Value representing the face rotation on the yaw axis.\n"]
  roll : degree option; [@ocaml.doc "Value representing the face rotation on the roll axis.\n"]
}
[@@ocaml.doc "Indicates the pose of the face as determined by its pitch, roll, and yaw.\n"]

type nonrec image_quality = {
  sharpness : float_ option;
      [@ocaml.doc
        "Value representing sharpness of the face. The service returns a value between 0 and 100 \
         (inclusive). A higher value indicates a sharper face image.\n"]
  brightness : float_ option;
      [@ocaml.doc
        "Value representing brightness of the face. The service returns a value between 0 and 100 \
         (inclusive). A higher value indicates a brighter face image.\n"]
}
[@@ocaml.doc "Identifies face image brightness and sharpness. \n"]

type nonrec face_occluded = {
  confidence : percent option;
      [@ocaml.doc
        "The confidence that the service has detected the presence of a face occlusion.\n"]
  value : boolean_ option;
      [@ocaml.doc
        "True if a detected face\226\128\153s eyes, nose, and mouth are partially captured or if \
         they are covered by masks, dark sunglasses, cell phones, hands, or other objects. False \
         if common occurrences that do not impact face verification are detected, such as eye \
         glasses, lightly tinted sunglasses, strands of hair, and others.\n"]
}
[@@ocaml.doc
  " [FaceOccluded] should return \"true\" with a high confidence score if a detected \
   face\226\128\153s eyes, nose, and mouth are partially captured or if they are covered by masks, \
   dark sunglasses, cell phones, hands, or other objects. [FaceOccluded] should return \"false\" \
   with a high confidence score if common occurrences that do not impact face verification are \
   detected, such as eye glasses, lightly tinted sunglasses, strands of hair, and others. \n\n\
  \ You can use [FaceOccluded] to determine if an obstruction on a face negatively impacts using \
   the image for face matching.\n\
  \ "]

type nonrec eye_direction = {
  confidence : percent option;
      [@ocaml.doc "The confidence that the service has in its predicted eye direction.\n"]
  pitch : degree option; [@ocaml.doc "Value representing eye direction on the pitch axis.\n"]
  yaw : degree option; [@ocaml.doc "Value representing eye direction on the yaw axis.\n"]
}
[@@ocaml.doc
  "Indicates the direction the eyes are gazing in (independent of the head pose) as determined by \
   its pitch and yaw. \n"]

type nonrec face_detail = {
  eye_direction : eye_direction option;
      [@ocaml.doc "Indicates the direction the eyes are gazing in, as defined by pitch and yaw.\n"]
  face_occluded : face_occluded option;
      [@ocaml.doc
        " [FaceOccluded] should return \"true\" with a high confidence score if a detected \
         face\226\128\153s eyes, nose, and mouth are partially captured or if they are covered by \
         masks, dark sunglasses, cell phones, hands, or other objects. [FaceOccluded] should \
         return \"false\" with a high confidence score if common occurrences that do not impact \
         face verification are detected, such as eye glasses, lightly tinted sunglasses, strands \
         of hair, and others. \n"]
  confidence : percent option;
      [@ocaml.doc
        "Confidence level that the bounding box contains a face (and not a different object such \
         as a tree). Default attribute.\n"]
  quality : image_quality option;
      [@ocaml.doc "Identifies image brightness and sharpness. Default attribute.\n"]
  pose : pose option;
      [@ocaml.doc
        "Indicates the pose of the face as determined by its pitch, roll, and yaw. Default \
         attribute.\n"]
  landmarks : landmarks option;
      [@ocaml.doc "Indicates the location of landmarks on the face. Default attribute.\n"]
  emotions : emotions option;
      [@ocaml.doc
        "The emotions that appear to be expressed on the face, and the confidence level in the \
         determination. The API is only making a determination of the physical appearance of a \
         person's face. It is not a determination of the person\226\128\153s internal emotional \
         state and should not be used in such a way. For example, a person pretending to have a \
         sad face might not be sad emotionally.\n"]
  mouth_open : mouth_open option;
      [@ocaml.doc
        "Indicates whether or not the mouth on the face is open, and the confidence level in the \
         determination.\n"]
  eyes_open : eye_open option;
      [@ocaml.doc
        "Indicates whether or not the eyes on the face are open, and the confidence level in the \
         determination.\n"]
  mustache : mustache option;
      [@ocaml.doc
        "Indicates whether or not the face has a mustache, and the confidence level in the \
         determination.\n"]
  beard : beard option;
      [@ocaml.doc
        "Indicates whether or not the face has a beard, and the confidence level in the \
         determination.\n"]
  gender : gender option; [@ocaml.doc "The predicted gender of a detected face. \n"]
  sunglasses : sunglasses option;
      [@ocaml.doc
        "Indicates whether or not the face is wearing sunglasses, and the confidence level in the \
         determination.\n"]
  eyeglasses : eyeglasses option;
      [@ocaml.doc
        "Indicates whether or not the face is wearing eye glasses, and the confidence level in the \
         determination.\n"]
  smile : smile option;
      [@ocaml.doc
        "Indicates whether or not the face is smiling, and the confidence level in the \
         determination.\n"]
  age_range : age_range option;
      [@ocaml.doc
        "The estimated age range, in years, for the face. Low represents the lowest estimated age \
         and High represents the highest estimated age.\n"]
  bounding_box : bounding_box option; [@ocaml.doc "Bounding box of the face. Default attribute.\n"]
}
[@@ocaml.doc
  "Structure containing attributes of the face that the algorithm detected.\n\n\
  \ A [FaceDetail] object contains either the default facial attributes or all facial attributes. \
   The default attributes are [BoundingBox], [Confidence], [Landmarks], [Pose], and [Quality].\n\
  \ \n\
  \   [GetFaceDetection] is the only Amazon Rekognition Video stored video operation that can \
   return a [FaceDetail] object with all attributes. To specify which attributes to return, use \
   the [FaceAttributes] input parameter for [StartFaceDetection]. The following Amazon Rekognition \
   Video operations return only the default attributes. The corresponding Start operations don't \
   have a [FaceAttributes] input parameter:\n\
  \  \n\
  \   {ul\n\
  \         {-  GetCelebrityRecognition\n\
  \             \n\
  \              }\n\
  \         {-  GetPersonTracking\n\
  \             \n\
  \              }\n\
  \         {-  GetFaceSearch\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   The Amazon Rekognition Image [DetectFaces] and [IndexFaces] operations can return all facial \
   attributes. To specify which attributes to return, use the [Attributes] input parameter for \
   [DetectFaces]. For [IndexFaces], use the [DetectAttributes] input parameter.\n\
  \   "]

type nonrec unsearched_face_reason =
  | LOW_FACE_QUALITY [@ocaml.doc ""]
  | SMALL_BOUNDING_BOX [@ocaml.doc ""]
  | LOW_CONFIDENCE [@ocaml.doc ""]
  | LOW_SHARPNESS [@ocaml.doc ""]
  | LOW_BRIGHTNESS [@ocaml.doc ""]
  | EXTREME_POSE [@ocaml.doc ""]
  | EXCEEDS_MAX_FACES [@ocaml.doc ""]
  | FACE_NOT_LARGEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec unsearched_face_reasons = unsearched_face_reason list [@@ocaml.doc ""]

type nonrec unsearched_face = {
  reasons : unsearched_face_reasons option;
      [@ocaml.doc " Reasons why a face wasn't used for Search. \n"]
  face_details : face_detail option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Face details inferred from the image but not used for search. The response attribute contains \
   reasons for why a face wasn't used for Search. \n"]

type nonrec unsearched_faces_list = unsearched_face list [@@ocaml.doc ""]

type nonrec reason =
  | LOW_FACE_QUALITY [@ocaml.doc ""]
  | SMALL_BOUNDING_BOX [@ocaml.doc ""]
  | LOW_CONFIDENCE [@ocaml.doc ""]
  | LOW_SHARPNESS [@ocaml.doc ""]
  | LOW_BRIGHTNESS [@ocaml.doc ""]
  | EXTREME_POSE [@ocaml.doc ""]
  | EXCEEDS_MAX_FACES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reasons = reason list [@@ocaml.doc ""]

type nonrec unindexed_face = {
  face_detail : face_detail option;
      [@ocaml.doc
        "The structure that contains attributes of a face that [IndexFaces]detected, but didn't \
         index. \n"]
  reasons : reasons option;
      [@ocaml.doc
        "An array of reasons that specify why a face wasn't indexed. \n\n\
        \ {ul\n\
        \       {-  EXTREME_POSE - The face is at a pose that can't be detected. For example, the \
         head is turned too far away from the camera.\n\
        \           \n\
        \            }\n\
        \       {-  EXCEEDS_MAX_FACES - The number of faces detected is already higher than that \
         specified by the [MaxFaces] input parameter for [IndexFaces].\n\
        \           \n\
        \            }\n\
        \       {-  LOW_BRIGHTNESS - The image is too dark.\n\
        \           \n\
        \            }\n\
        \       {-  LOW_SHARPNESS - The image is too blurry.\n\
        \           \n\
        \            }\n\
        \       {-  LOW_CONFIDENCE - The face was detected with a low confidence.\n\
        \           \n\
        \            }\n\
        \       {-  SMALL_BOUNDING_BOX - The bounding box around the face is too small.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "A face that [IndexFaces] detected, but didn't index. Use the [Reasons] response attribute to \
   determine why a face wasn't indexed.\n"]

type nonrec unindexed_faces = unindexed_face list [@@ocaml.doc ""]

type nonrec training_data = {
  assets : assets option;
      [@ocaml.doc
        "A manifest file that contains references to the training images and ground-truth \
         annotations.\n"]
}
[@@ocaml.doc "The dataset used for training.\n"]

type nonrec training_data_result = {
  validation : validation_data option;
      [@ocaml.doc
        "A manifest that you supplied for training, with validation results for each line.\n"]
  output : training_data option;
      [@ocaml.doc
        "Reference to images (assets) that were actually used during training with trained model \
         predictions.\n"]
  input : training_data option; [@ocaml.doc "The training data that you supplied.\n"]
}
[@@ocaml.doc
  "The data validation manifest created for the training dataset during model training.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec timecode = string [@@ocaml.doc ""]

type nonrec text_types = WORD [@ocaml.doc ""] | LINE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec geometry = {
  polygon : polygon option;
      [@ocaml.doc "Within the bounding box, a fine-grained polygon around the detected item.\n"]
  bounding_box : bounding_box option;
      [@ocaml.doc
        "An axis-aligned coarse representation of the detected item's location on the image.\n"]
}
[@@ocaml.doc
  "Information about where an object ([DetectCustomLabels]) or text ([DetectText]) is located on \
   an image.\n"]

type nonrec text_detection = {
  geometry : geometry option;
      [@ocaml.doc
        "The location of the detected text on the image. Includes an axis aligned coarse bounding \
         box surrounding the text and a finer grain polygon for more accurate spatial information.\n"]
  confidence : percent option;
      [@ocaml.doc
        "The confidence that Amazon Rekognition has in the accuracy of the detected text and the \
         accuracy of the geometry points around the detected text.\n"]
  parent_id : u_integer option;
      [@ocaml.doc
        "The Parent identifier for the detected text identified by the value of [ID]. If the type \
         of detected text is [LINE], the value of [ParentId] is [Null]. \n"]
  id : u_integer option;
      [@ocaml.doc
        "The identifier for the detected text. The identifier is only unique for a single call to \
         [DetectText]. \n"]
  type_ : text_types option; [@ocaml.doc "The type of text that was detected.\n"]
  detected_text : string_ option;
      [@ocaml.doc "The word or line of text recognized by Amazon Rekognition. \n"]
}
[@@ocaml.doc
  "Information about a word or line of text detected by [DetectText].\n\n\
  \ The [DetectedText] field contains the text that Amazon Rekognition detected in the image. \n\
  \ \n\
  \  Every word and line has an identifier ([Id]). Each word belongs to a line and has a parent \
   identifier ([ParentId]) that identifies the line of text in which the word appears. The word \
   [Id] is also an index for the word within a line of words. \n\
  \  \n\
  \   For more information, see Detecting text in the Amazon Rekognition Developer Guide.\n\
  \   "]

type nonrec text_detection_result = {
  text_detection : text_detection option; [@ocaml.doc "Details about text detected in a video.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "The time, in milliseconds from the start of the video, that the text was detected. Note \
         that [Timestamp] is not guaranteed to be accurate to the individual frame where the text \
         first appears.\n"]
}
[@@ocaml.doc
  "Information about text detected in a video. Incudes the detected text, the time in milliseconds \
   from the start of the video that the text was detected, and where it was detected on the screen.\n"]

type nonrec text_detection_results = text_detection_result list [@@ocaml.doc ""]

type nonrec text_detection_list = text_detection list [@@ocaml.doc ""]

type nonrec testing_data = {
  auto_create : boolean_ option;
      [@ocaml.doc
        "If specified, Rekognition splits training dataset to create a test dataset for the \
         training job.\n"]
  assets : assets option; [@ocaml.doc "The assets used for testing.\n"]
}
[@@ocaml.doc
  "The dataset used for testing. Optionally, if [AutoCreate] is set, Amazon Rekognition uses the \
   training dataset to create a test dataset with a temporary split of the training dataset. \n"]

type nonrec testing_data_result = {
  validation : validation_data option;
      [@ocaml.doc
        "The location of the data validation manifest. The data validation manifest is created for \
         the test dataset during model training.\n"]
  output : testing_data option;
      [@ocaml.doc
        "The subset of the dataset that was actually tested. Some images (assets) might not be \
         tested due to file formatting and other issues. \n"]
  input : testing_data option; [@ocaml.doc "The testing dataset that was supplied for training.\n"]
}
[@@ocaml.doc
  "Sagemaker Groundtruth format manifest files for the input, output and validation datasets that \
   are used and created during testing.\n"]

type nonrec technical_cue_type =
  | CONTENT [@ocaml.doc ""]
  | SLATE [@ocaml.doc ""]
  | STUDIO_LOGO [@ocaml.doc ""]
  | OPENING_CREDITS [@ocaml.doc ""]
  | BLACK_FRAMES [@ocaml.doc ""]
  | END_CREDITS [@ocaml.doc ""]
  | COLOR_BARS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec segment_confidence = float [@@ocaml.doc ""]

type nonrec technical_cue_segment = {
  confidence : segment_confidence option;
      [@ocaml.doc
        "The confidence that Amazon Rekognition Video has in the accuracy of the detected segment.\n"]
  type_ : technical_cue_type option; [@ocaml.doc "The type of the technical cue.\n"]
}
[@@ocaml.doc
  "Information about a technical cue segment. For more information, see [SegmentDetection].\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_map; [@ocaml.doc " The key-value tags to assign to the resource. \n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        " Amazon Resource Name (ARN) of the model, collection, or stream processor that you want \
         to assign the tags to. \n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "\n\n\
  \ The size of the collection exceeds the allowed limit. For more information, see Guidelines and \
   quotas in Amazon Rekognition in the Amazon Rekognition Developer Guide. \n\
  \ "]

type nonrec synthesized_json_human_loop_activation_conditions_evaluation_results = string
[@@ocaml.doc ""]

type nonrec summary = { s3_object : s3_object option [@ocaml.doc ""] }
[@@ocaml.doc
  "The S3 bucket that contains the training summary. The training summary includes aggregated \
   evaluation metrics for the entire testing dataset and metrics for each individual label. \n\n\
  \ You get the training summary S3 bucket location by calling [DescribeProjectVersions]. \n\
  \ "]

type nonrec stream_processor_status =
  | UPDATING [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec collection_id = string [@@ocaml.doc ""]

type nonrec face_search_settings = {
  face_match_threshold : percent option;
      [@ocaml.doc
        "Minimum face match confidence score that must be met to return a result for a recognized \
         face. The default is 80. 0 is the lowest confidence. 100 is the highest confidence. \
         Values between 0 and 100 are accepted, and values lower than 80 are set to 80.\n"]
  collection_id : collection_id option;
      [@ocaml.doc "The ID of a collection that contains faces that you want to search for.\n"]
}
[@@ocaml.doc
  "Input face recognition parameters for an Amazon Rekognition stream processor. Includes the \
   collection to use for face recognition and the face attributes to detect. Defining the settings \
   is required in the request parameter for [CreateStreamProcessor].\n"]

type nonrec connected_home_settings = {
  min_confidence : percent option;
      [@ocaml.doc " The minimum confidence required to label an object in the video. \n"]
  labels : connected_home_labels;
      [@ocaml.doc
        " Specifies what you want to detect in the video, such as people, packages, or pets. The \
         current valid labels you can include in this list are: \"PERSON\", \"PET\", \"PACKAGE\", \
         and \"ALL\". \n"]
}
[@@ocaml.doc
  " Label detection settings to use on a streaming video. Defining the settings is required in the \
   request parameter for [CreateStreamProcessor]. Including this setting in the \
   [CreateStreamProcessor] request enables you to use the stream processor for label detection. \
   You can then select what you want the stream processor to detect, such as people or pets. When \
   the stream processor has started, one notification is sent for each object class specified. For \
   example, if packages and pets are selected, one SNS notification is published the first time a \
   package is detected and one SNS notification is published the first time a pet is detected, as \
   well as an end-of-session summary. \n"]

type nonrec stream_processor_settings = {
  connected_home : connected_home_settings option; [@ocaml.doc ""]
  face_search : face_search_settings option;
      [@ocaml.doc "Face search settings to use on a streaming video. \n"]
}
[@@ocaml.doc
  "Input parameters used in a streaming video analyzed by a Amazon Rekognition stream processor. \
   You can use [FaceSearch] to recognize faces in a streaming video, or you can use \
   [ConnectedHome] to detect labels. \n"]

type nonrec kinesis_data_arn = string [@@ocaml.doc ""]

type nonrec kinesis_data_stream = {
  arn : kinesis_data_arn option;
      [@ocaml.doc "ARN of the output Amazon Kinesis Data Streams stream.\n"]
}
[@@ocaml.doc
  "The Kinesis data stream Amazon Rekognition to which the analysis results of a Amazon \
   Rekognition stream processor are streamed. For more information, see CreateStreamProcessor in \
   the Amazon Rekognition Developer Guide.\n"]

type nonrec s3_key_prefix = string [@@ocaml.doc ""]

type nonrec s3_destination = {
  key_prefix : s3_key_prefix option;
      [@ocaml.doc
        " The prefix value of the location within the bucket that you want the information to be \
         published to. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html}Using \
         prefixes}. \n"]
  bucket : s3_bucket option;
      [@ocaml.doc
        " The name of the Amazon S3 bucket you want to associate with the streaming video project. \
         You must be the owner of the Amazon S3 bucket. \n"]
}
[@@ocaml.doc
  " The Amazon S3 bucket location to which Amazon Rekognition publishes the detailed inference \
   results of a video analysis operation. These results include the name of the stream processor \
   resource, the session ID of the stream processing session, and labeled timestamps and bounding \
   boxes for detected labels. \n"]

type nonrec stream_processor_output = {
  s3_destination : s3_destination option;
      [@ocaml.doc
        " The Amazon S3 bucket location to which Amazon Rekognition publishes the detailed \
         inference results of a video analysis operation. \n"]
  kinesis_data_stream : kinesis_data_stream option;
      [@ocaml.doc
        "The Amazon Kinesis Data Streams stream to which the Amazon Rekognition stream processor \
         streams the analysis results.\n"]
}
[@@ocaml.doc
  "Information about the Amazon Kinesis Data Streams stream to which a Amazon Rekognition Video \
   stream processor streams the results of a video analysis. For more information, see \
   CreateStreamProcessor in the Amazon Rekognition Developer Guide.\n"]

type nonrec sns_topic_arn = string [@@ocaml.doc ""]

type nonrec stream_processor_notification_channel = {
  sns_topic_arn : sns_topic_arn;
      [@ocaml.doc
        " The Amazon Resource Number (ARN) of the Amazon Amazon Simple Notification Service topic \
         to which Amazon Rekognition posts the completion status. \n"]
}
[@@ocaml.doc
  "The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the object \
   detection results and completion status of a video analysis operation.\n\n\
  \ Amazon Rekognition publishes a notification the first time an object of interest or a person \
   is detected in the video stream. For example, if Amazon Rekognition detects a person at second \
   2, a pet at second 4, and a person again at second 5, Amazon Rekognition sends 2 object class \
   detected notifications, one for a person at second 2 and one for a pet at second 4.\n\
  \ \n\
  \  Amazon Rekognition also publishes an an end-of-session notification with a summary when the \
   stream processing session is complete.\n\
  \  "]

type nonrec stream_processor = {
  status : stream_processor_status option;
      [@ocaml.doc "Current status of the Amazon Rekognition stream processor.\n"]
  name : stream_processor_name option;
      [@ocaml.doc "Name of the Amazon Rekognition stream processor. \n"]
}
[@@ocaml.doc
  "An object that recognizes faces or labels in a streaming video. An Amazon Rekognition stream \
   processor is created by a call to [CreateStreamProcessor]. The request parameters for \
   [CreateStreamProcessor] describe the Kinesis video stream source for the streaming video, face \
   recognition parameters, and where to stream the analysis resullts. \n"]

type nonrec stream_processor_list = stream_processor list [@@ocaml.doc ""]

type nonrec kinesis_video_arn = string [@@ocaml.doc ""]

type nonrec kinesis_video_stream = {
  arn : kinesis_video_arn option;
      [@ocaml.doc "ARN of the Kinesis video stream stream that streams the source video.\n"]
}
[@@ocaml.doc
  "Kinesis video stream stream that provides the source streaming video for a Amazon Rekognition \
   Video stream processor. For more information, see CreateStreamProcessor in the Amazon \
   Rekognition Developer Guide.\n"]

type nonrec stream_processor_input = {
  kinesis_video_stream : kinesis_video_stream option;
      [@ocaml.doc "The Kinesis video stream input stream for the source streaming video.\n"]
}
[@@ocaml.doc "Information about the source streaming video. \n"]

type nonrec stream_processor_arn = string [@@ocaml.doc ""]

type nonrec max_duration_in_seconds_u_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec stream_processing_stop_selector = {
  max_duration_in_seconds : max_duration_in_seconds_u_long option;
      [@ocaml.doc
        " Specifies the maximum amount of time in seconds that you want the stream to be \
         processed. The largest amount of time is 2 minutes. The default is 10 seconds. \n"]
}
[@@ocaml.doc
  " Specifies when to stop processing the stream. You can specify a maximum amount of time to \
   process the video. \n"]

type nonrec kinesis_video_stream_fragment_number = string [@@ocaml.doc ""]

type nonrec kinesis_video_stream_start_selector = {
  fragment_number : kinesis_video_stream_fragment_number option;
      [@ocaml.doc
        " The unique identifier of the fragment. This value monotonically increases based on the \
         ingestion order. \n"]
  producer_timestamp : u_long option;
      [@ocaml.doc
        " The timestamp from the producer corresponding to the fragment, in milliseconds, \
         expressed in unix time format. \n"]
}
[@@ocaml.doc
  "Specifies the starting point in a Kinesis stream to start processing. You can use the producer \
   timestamp or the fragment number. One of either producer timestamp or fragment number is \
   required. If you use the producer timestamp, you must put the time in milliseconds. For more \
   information about fragment numbers, see \
   {{:https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_reader_Fragment.html}Fragment}. \n"]

type nonrec stream_processing_start_selector = {
  kvs_stream_start_selector : kinesis_video_stream_start_selector option;
      [@ocaml.doc
        " Specifies the starting point in the stream to start processing. This can be done with a \
         producer timestamp or a fragment number in a Kinesis stream. \n"]
}
[@@ocaml.doc
  "This is a required parameter for label detection stream processors and should not be used to \
   start a face search stream processor.\n"]

type nonrec stop_stream_processor_response = unit [@@ocaml.doc ""]

type nonrec stop_stream_processor_request = {
  name : stream_processor_name;
      [@ocaml.doc "The name of a stream processor created by [CreateStreamProcessor].\n"]
}
[@@ocaml.doc ""]

type nonrec project_version_status =
  | EXPIRED [@ocaml.doc ""]
  | DEPRECATED [@ocaml.doc ""]
  | COPYING_FAILED [@ocaml.doc ""]
  | COPYING_COMPLETED [@ocaml.doc ""]
  | COPYING_IN_PROGRESS [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | TRAINING_FAILED [@ocaml.doc ""]
  | TRAINING_COMPLETED [@ocaml.doc ""]
  | TRAINING_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stop_project_version_response = {
  status : project_version_status option; [@ocaml.doc "The current status of the stop operation. \n"]
}
[@@ocaml.doc ""]

type nonrec project_version_arn = string [@@ocaml.doc ""]

type nonrec stop_project_version_request = {
  project_version_arn : project_version_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the model version that you want to stop.\n\n\
        \ This operation requires permissions to perform the [rekognition:StopProjectVersion] \
         action.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec status_message = string [@@ocaml.doc ""]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec start_text_detection_response = {
  job_id : job_id option;
      [@ocaml.doc
        "Identifier for the text detection job. Use [JobId] to identify the job in a subsequent \
         call to [GetTextDetection].\n"]
}
[@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec notification_channel = {
  role_arn : role_arn;
      [@ocaml.doc
        "The ARN of an IAM role that gives Amazon Rekognition publishing permissions to the Amazon \
         SNS topic. \n"]
  sns_topic_arn : sns_topic_arn;
      [@ocaml.doc "The Amazon SNS topic to which Amazon Rekognition posts the completion status.\n"]
}
[@@ocaml.doc
  "The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the \
   completion status of a video analysis operation. For more information, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/api-video.html}Calling Amazon Rekognition \
   Video operations}. Note that the Amazon SNS topic must have a topic name that begins with {i \
   AmazonRekognition} if you are using the AmazonRekognitionServiceRole permissions policy to \
   access the topic. For more information, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/api-video-roles.html#api-video-roles-all-topics}Giving \
   access to multiple Amazon SNS topics}.\n"]

type nonrec job_tag = string [@@ocaml.doc ""]

type nonrec bounding_box_height = float [@@ocaml.doc ""]

type nonrec bounding_box_width = float [@@ocaml.doc ""]

type nonrec detection_filter = {
  min_bounding_box_width : bounding_box_width option;
      [@ocaml.doc
        "Sets the minimum width of the word bounding box. Words with bounding boxes widths lesser \
         than this value will be excluded from the result. Value is relative to the video frame \
         width.\n"]
  min_bounding_box_height : bounding_box_height option;
      [@ocaml.doc
        "Sets the minimum height of the word bounding box. Words with bounding box heights lesser \
         than this value will be excluded from the result. Value is relative to the video frame \
         height.\n"]
  min_confidence : percent option;
      [@ocaml.doc
        "Sets the confidence of word detection. Words with detection confidence below this will be \
         excluded from the result. Values should be between 0 and 100. The default MinConfidence \
         is 80.\n"]
}
[@@ocaml.doc
  "A set of parameters that allow you to filter out certain results from your returned results.\n"]

type nonrec start_text_detection_filters = {
  regions_of_interest : regions_of_interest option;
      [@ocaml.doc
        "Filter focusing on a certain area of the frame. Uses a [BoundingBox] object to set the \
         region of the screen.\n"]
  word_filter : detection_filter option;
      [@ocaml.doc "Filters focusing on qualities of the text, such as confidence or size.\n"]
}
[@@ocaml.doc
  "Set of optional parameters that let you set the criteria text must meet to be included in your \
   response. [WordFilter] looks at a word's height, width and minimum confidence. \
   [RegionOfInterest] lets you set a specific region of the screen to look for text in.\n"]

type nonrec start_text_detection_request = {
  filters : start_text_detection_filters option;
      [@ocaml.doc
        "Optional parameters that let you set criteria the text must meet to be included in your \
         response.\n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier returned in the completion status published by your Amazon Simple \
         Notification Service topic. For example, you can use [JobTag] to group related jobs and \
         identify them in the completion notification.\n"]
  notification_channel : notification_channel option; [@ocaml.doc ""]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the start request. If you use the same token with \
         multiple [StartTextDetection] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidentaly started more than \
         once.\n"]
  video : video; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec invalid_s3_object_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Amazon Rekognition is unable to access the S3 object specified in the request.\n"]

type nonrec idempotent_parameter_mismatch_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A [ClientRequestToken] input parameter was reused with an operation, but at least one of the \
   other input parameters is different from the previous call to the operation.\n"]

type nonrec max_pixel_threshold = float [@@ocaml.doc ""]

type nonrec min_coverage_percentage = float [@@ocaml.doc ""]

type nonrec black_frame = {
  min_coverage_percentage : min_coverage_percentage option;
      [@ocaml.doc
        " The minimum percentage of pixels in a frame that need to have a luminance below the \
         max_black_pixel_value for a frame to be considered a black frame. Luminance is calculated \
         using the BT.709 matrix. \n\n\
        \ The default value is 99, which means at least 99% of all pixels in the frame are black \
         pixels as per the [MaxPixelThreshold] set. You can reduce this value to allow more noise \
         on the black frame.\n\
        \ "]
  max_pixel_threshold : max_pixel_threshold option;
      [@ocaml.doc
        " A threshold used to determine the maximum luminance value for a pixel to be considered \
         black. In a full color range video, luminance values range from 0-255. A pixel value of 0 \
         is pure black, and the most strict filter. The maximum black pixel value is computed as \
         follows: max_black_pixel_value = minimum_luminance + MaxPixelThreshold *luminance_range. \
         \n\n\
        \ For example, for a full range video with BlackPixelThreshold = 0.1, \
         max_black_pixel_value is 0 + 0.1 * (255-0) = 25.5.\n\
        \ \n\
        \  The default value of MaxPixelThreshold is 0.2, which maps to a max_black_pixel_value of \
         51 for a full range video. You can lower this threshold to be more strict on black levels.\n\
        \  "]
}
[@@ocaml.doc
  " A filter that allows you to control the black frame detection by specifying the black levels \
   and pixel coverage of black pixels in a frame. As videos can come from multiple sources, \
   formats, and time periods, they may contain different standards and varying noise levels for \
   black frames that need to be accounted for. For more information, see [StartSegmentDetection]. \n"]

type nonrec start_technical_cue_detection_filter = {
  black_frame : black_frame option;
      [@ocaml.doc
        " A filter that allows you to control the black frame detection by specifying the black \
         levels and pixel coverage of black pixels in a frame. Videos can come from multiple \
         sources, formats, and time periods, with different standards and varying noise levels for \
         black frames that need to be accounted for. \n"]
  min_segment_confidence : segment_confidence option;
      [@ocaml.doc
        "Specifies the minimum confidence that Amazon Rekognition Video must have in order to \
         return a detected segment. Confidence represents how certain Amazon Rekognition is that a \
         segment is correctly identified. 0 is the lowest confidence. 100 is the highest \
         confidence. Amazon Rekognition Video doesn't return any segments with a confidence level \
         lower than this specified value.\n\n\
        \ If you don't specify [MinSegmentConfidence], [GetSegmentDetection] returns segments with \
         confidence values greater than or equal to 50 percent.\n\
        \ "]
}
[@@ocaml.doc
  "Filters for the technical segments returned by [GetSegmentDetection]. For more information, see \
   [StartSegmentDetectionFilters].\n"]

type nonrec start_stream_processor_session_id = string [@@ocaml.doc ""]

type nonrec start_stream_processor_response = {
  session_id : start_stream_processor_session_id option;
      [@ocaml.doc " A unique identifier for the stream processing session. \n"]
}
[@@ocaml.doc ""]

type nonrec start_stream_processor_request = {
  stop_selector : stream_processing_stop_selector option;
      [@ocaml.doc
        " Specifies when to stop processing the stream. You can specify a maximum amount of time \
         to process the video. \n\n\
        \ This is a required parameter for label detection stream processors and should not be \
         used to start a face search stream processor.\n\
        \ "]
  start_selector : stream_processing_start_selector option;
      [@ocaml.doc
        " Specifies the starting point in the Kinesis stream to start processing. You can use the \
         producer timestamp or the fragment number. If you use the producer timestamp, you must \
         put the time in milliseconds. For more information about fragment numbers, see \
         {{:https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_reader_Fragment.html}Fragment}. \
         \n\n\
        \ This is a required parameter for label detection stream processors and should not be \
         used to start a face search stream processor.\n\
        \ "]
  name : stream_processor_name;
      [@ocaml.doc "The name of the stream processor to start processing.\n"]
}
[@@ocaml.doc ""]

type nonrec start_shot_detection_filter = {
  min_segment_confidence : segment_confidence option;
      [@ocaml.doc
        "Specifies the minimum confidence that Amazon Rekognition Video must have in order to \
         return a detected segment. Confidence represents how certain Amazon Rekognition is that a \
         segment is correctly identified. 0 is the lowest confidence. 100 is the highest \
         confidence. Amazon Rekognition Video doesn't return any segments with a confidence level \
         lower than this specified value.\n\n\
        \ If you don't specify [MinSegmentConfidence], the [GetSegmentDetection] returns segments \
         with confidence values greater than or equal to 50 percent.\n\
        \ "]
}
[@@ocaml.doc
  "Filters for the shot detection segments returned by [GetSegmentDetection]. For more \
   information, see [StartSegmentDetectionFilters].\n"]

type nonrec start_segment_detection_response = {
  job_id : job_id option;
      [@ocaml.doc
        "Unique identifier for the segment detection job. The [JobId] is returned from \
         [StartSegmentDetection]. \n"]
}
[@@ocaml.doc ""]

type nonrec start_segment_detection_filters = {
  shot_filter : start_shot_detection_filter option;
      [@ocaml.doc "Filters that are specific to shot detections.\n"]
  technical_cue_filter : start_technical_cue_detection_filter option;
      [@ocaml.doc "Filters that are specific to technical cues.\n"]
}
[@@ocaml.doc
  "Filters applied to the technical cue or shot detection segments. For more information, see \
   [StartSegmentDetection]. \n"]

type nonrec segment_type = SHOT [@ocaml.doc ""] | TECHNICAL_CUE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec segment_types = segment_type list [@@ocaml.doc ""]

type nonrec start_segment_detection_request = {
  segment_types : segment_types;
      [@ocaml.doc
        "An array of segment types to detect in the video. Valid values are TECHNICAL_CUE and SHOT.\n"]
  filters : start_segment_detection_filters option;
      [@ocaml.doc "Filters for technical cue or shot detection.\n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier you specify that's returned in the completion notification that's published \
         to your Amazon Simple Notification Service topic. For example, you can use [JobTag] to \
         group related jobs and identify them in the completion notification.\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the \
         completion status of the segment detection operation. Note that the Amazon SNS topic must \
         have a topic name that begins with {i AmazonRekognition} if you are using the \
         AmazonRekognitionServiceRole permissions policy to access the topic.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the start request. If you use the same token with \
         multiple [StartSegmentDetection] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidently started more than \
         once. \n"]
  video : video; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec start_project_version_response = {
  status : project_version_status option; [@ocaml.doc "The current running status of the model. \n"]
}
[@@ocaml.doc ""]

type nonrec inference_units = int [@@ocaml.doc ""]

type nonrec start_project_version_request = {
  max_inference_units : inference_units option;
      [@ocaml.doc
        "The maximum number of inference units to use for auto-scaling the model. If you don't \
         specify a value, Amazon Rekognition Custom Labels doesn't auto-scale the model.\n"]
  min_inference_units : inference_units;
      [@ocaml.doc
        "The minimum number of inference units to use. A single inference unit represents 1 hour \
         of processing. \n\n\
        \ Use a higher number to increase the TPS throughput of your model. You are charged for \
         the number of inference units that you use. \n\
        \ "]
  project_version_arn : project_version_arn;
      [@ocaml.doc "The Amazon Resource Name(ARN) of the model version that you want to start.\n"]
}
[@@ocaml.doc ""]

type nonrec start_person_tracking_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier for the person detection job. Use [JobId] to identify the job in a \
         subsequent call to [GetPersonTracking].\n"]
}
[@@ocaml.doc ""]

type nonrec start_person_tracking_request = {
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier you specify that's returned in the completion notification that's published \
         to your Amazon Simple Notification Service topic. For example, you can use [JobTag] to \
         group related jobs and identify them in the completion notification.\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion \
         status of the people detection operation to. The Amazon SNS topic must have a topic name \
         that begins with {i AmazonRekognition} if you are using the AmazonRekognitionServiceRole \
         permissions policy.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the start request. If you use the same token with \
         multiple [StartPersonTracking] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidently started more than \
         once. \n"]
  video : video;
      [@ocaml.doc
        "The video in which you want to detect people. The video must be stored in an Amazon S3 \
         bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec media_analysis_job_id = string [@@ocaml.doc ""]

type nonrec start_media_analysis_job_response = {
  job_id : media_analysis_job_id; [@ocaml.doc "Identifier for the created job.\n"]
}
[@@ocaml.doc ""]

type nonrec media_analysis_job_name = string [@@ocaml.doc ""]

type nonrec project_version_id = string [@@ocaml.doc ""]

type nonrec media_analysis_detect_moderation_labels_config = {
  project_version : project_version_id option;
      [@ocaml.doc
        "Specifies the custom moderation model to be used during the label detection job. If not \
         provided the pre-trained model is used.\n"]
  min_confidence : percent option;
      [@ocaml.doc
        "Specifies the minimum confidence level for the moderation labels to return. Amazon \
         Rekognition doesn't return any labels with a confidence level lower than this specified \
         value. \n"]
}
[@@ocaml.doc "Configuration for Moderation Labels Detection.\n"]

type nonrec media_analysis_operations_config = {
  detect_moderation_labels : media_analysis_detect_moderation_labels_config option;
      [@ocaml.doc "Contains configuration options for a DetectModerationLabels job.\n"]
}
[@@ocaml.doc
  "Configuration options for a media analysis job. Configuration is operation-specific.\n"]

type nonrec media_analysis_input = { s3_object : s3_object [@ocaml.doc ""] }
[@@ocaml.doc "Contains input information for a media analysis job.\n"]

type nonrec media_analysis_s3_key_prefix = string [@@ocaml.doc ""]

type nonrec media_analysis_output_config = {
  s3_key_prefix : media_analysis_s3_key_prefix option;
      [@ocaml.doc
        "Specifies the Amazon S3 key prefix that comes after the name of the bucket you have \
         designated for storage.\n"]
  s3_bucket : s3_bucket;
      [@ocaml.doc
        "Specifies the Amazon S3 bucket to contain the output of the media analysis job.\n"]
}
[@@ocaml.doc "Output configuration provided in the job creation request.\n"]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec start_media_analysis_job_request = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The identifier of customer managed AWS KMS key (name or ARN). The key is used to encrypt \
         images copied into the service. The key is also used to encrypt results and manifest \
         files written to the output Amazon S3 bucket.\n"]
  output_config : media_analysis_output_config;
      [@ocaml.doc "The Amazon S3 bucket location to store the results.\n"]
  input : media_analysis_input; [@ocaml.doc "Input data to be analyzed by the job.\n"]
  operations_config : media_analysis_operations_config;
      [@ocaml.doc "Configuration options for the media analysis job to be created.\n"]
  job_name : media_analysis_job_name option;
      [@ocaml.doc "The name of the job. Does not have to be unique.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotency token used to prevent the accidental creation of duplicate versions. If you \
         use the same token with multiple [StartMediaAnalysisJobRequest] requests, the same \
         response is returned. Use [ClientRequestToken] to prevent the same request from being \
         processed more than once.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_ready_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested resource isn't ready. For example, this exception occurs when you call \
   [DetectCustomLabels] with a model version that isn't deployed. \n"]

type nonrec invalid_manifest_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that a provided manifest file is empty or larger than the allowed limit.\n"]

type nonrec start_label_detection_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier for the label detection job. Use [JobId] to identify the job in a \
         subsequent call to [GetLabelDetection]. \n"]
}
[@@ocaml.doc ""]

type nonrec label_detection_feature_name = GENERAL_LABELS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec label_detection_feature_list = label_detection_feature_name list [@@ocaml.doc ""]

type nonrec general_labels_filter_value = string [@@ocaml.doc ""]

type nonrec general_labels_filter_list = general_labels_filter_value list [@@ocaml.doc ""]

type nonrec general_labels_settings = {
  label_category_exclusion_filters : general_labels_filter_list option;
      [@ocaml.doc
        "The label categories that should be excluded from the return from DetectLabels.\n"]
  label_category_inclusion_filters : general_labels_filter_list option;
      [@ocaml.doc "The label categories that should be included in the return from DetectLabels.\n"]
  label_exclusion_filters : general_labels_filter_list option;
      [@ocaml.doc "The labels that should be excluded from the return from DetectLabels.\n"]
  label_inclusion_filters : general_labels_filter_list option;
      [@ocaml.doc "The labels that should be included in the return from DetectLabels.\n"]
}
[@@ocaml.doc
  "Contains filters for the object labels returned by DetectLabels. Filters can be inclusive, \
   exclusive, or a combination of both and can be applied to individual labels or entire label \
   categories. To see a list of label categories, see \
   {{:https://docs.aws.amazon.com/rekognition/latest/dg/labels.html}Detecting Labels}.\n"]

type nonrec label_detection_settings = {
  general_labels : general_labels_settings option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Contains the specified filters that should be applied to a list of returned GENERAL_LABELS.\n"]

type nonrec start_label_detection_request = {
  settings : label_detection_settings option;
      [@ocaml.doc
        "The settings for a StartLabelDetection request.Contains the specified parameters for the \
         label detection request of an asynchronous label analysis operation. Settings can include \
         filters for GENERAL_LABELS.\n"]
  features : label_detection_feature_list option;
      [@ocaml.doc
        "The features to return after video analysis. You can specify that GENERAL_LABELS are \
         returned.\n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier you specify that's returned in the completion notification that's published \
         to your Amazon Simple Notification Service topic. For example, you can use [JobTag] to \
         group related jobs and identify them in the completion notification.\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion \
         status of the label detection operation to. The Amazon SNS topic must have a topic name \
         that begins with {i AmazonRekognition} if you are using the AmazonRekognitionServiceRole \
         permissions policy.\n"]
  min_confidence : percent option;
      [@ocaml.doc
        "Specifies the minimum confidence that Amazon Rekognition Video must have in order to \
         return a detected label. Confidence represents how certain Amazon Rekognition is that a \
         label is correctly identified.0 is the lowest confidence. 100 is the highest confidence. \
         Amazon Rekognition Video doesn't return any labels with a confidence level lower than \
         this specified value.\n\n\
        \ If you don't specify [MinConfidence], the operation returns labels and bounding boxes \
         (if detected) with confidence values greater than or equal to 50 percent.\n\
        \ "]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the start request. If you use the same token with \
         multiple [StartLabelDetection] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidently started more than \
         once. \n"]
  video : video;
      [@ocaml.doc
        "The video in which you want to detect labels. The video must be stored in an Amazon S3 \
         bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec start_face_search_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier for the search job. Use [JobId] to identify the job in a subsequent call \
         to [GetFaceSearch]. \n"]
}
[@@ocaml.doc ""]

type nonrec start_face_search_request = {
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier you specify that's returned in the completion notification that's published \
         to your Amazon Simple Notification Service topic. For example, you can use [JobTag] to \
         group related jobs and identify them in the completion notification.\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the \
         completion status of the search. The Amazon SNS topic must have a topic name that begins \
         with {i AmazonRekognition} if you are using the AmazonRekognitionServiceRole permissions \
         policy to access the topic.\n"]
  collection_id : collection_id;
      [@ocaml.doc "ID of the collection that contains the faces you want to search for.\n"]
  face_match_threshold : percent option;
      [@ocaml.doc
        "The minimum confidence in the person match to return. For example, don't return any \
         matches where confidence in matches is less than 70%. The default value is 80%.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the start request. If you use the same token with \
         multiple [StartFaceSearch] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidently started more than \
         once. \n"]
  video : video;
      [@ocaml.doc
        "The video you want to search. The video must be stored in an Amazon S3 bucket. \n"]
}
[@@ocaml.doc ""]

type nonrec start_face_detection_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier for the face detection job. Use [JobId] to identify the job in a \
         subsequent call to [GetFaceDetection].\n"]
}
[@@ocaml.doc ""]

type nonrec face_attributes = ALL [@ocaml.doc ""] | DEFAULT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec start_face_detection_request = {
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier you specify that's returned in the completion notification that's published \
         to your Amazon Simple Notification Service topic. For example, you can use [JobTag] to \
         group related jobs and identify them in the completion notification.\n"]
  face_attributes : face_attributes option;
      [@ocaml.doc
        "The face attributes you want returned.\n\n\
        \  [DEFAULT] - The following subset of facial attributes are returned: BoundingBox, \
         Confidence, Pose, Quality and Landmarks. \n\
        \ \n\
        \   [ALL] - All facial attributes are returned.\n\
        \  "]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the \
         completion status of the face detection operation. The Amazon SNS topic must have a topic \
         name that begins with {i AmazonRekognition} if you are using the \
         AmazonRekognitionServiceRole permissions policy.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the start request. If you use the same token with \
         multiple [StartFaceDetection] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidently started more than \
         once. \n"]
  video : video;
      [@ocaml.doc
        "The video in which you want to detect faces. The video must be stored in an Amazon S3 \
         bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec start_content_moderation_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier for the content analysis job. Use [JobId] to identify the job in a \
         subsequent call to [GetContentModeration].\n"]
}
[@@ocaml.doc ""]

type nonrec start_content_moderation_request = {
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier you specify that's returned in the completion notification that's published \
         to your Amazon Simple Notification Service topic. For example, you can use [JobTag] to \
         group related jobs and identify them in the completion notification.\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion \
         status of the content analysis to. The Amazon SNS topic must have a topic name that \
         begins with {i AmazonRekognition} if you are using the AmazonRekognitionServiceRole \
         permissions policy to access the topic.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the start request. If you use the same token with \
         multiple [StartContentModeration] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidently started more than \
         once. \n"]
  min_confidence : percent option;
      [@ocaml.doc
        "Specifies the minimum confidence that Amazon Rekognition must have in order to return a \
         moderated content label. Confidence represents how certain Amazon Rekognition is that the \
         moderated content is correctly identified. 0 is the lowest confidence. 100 is the highest \
         confidence. Amazon Rekognition doesn't return any moderated content labels with a \
         confidence level lower than this specified value. If you don't specify [MinConfidence], \
         [GetContentModeration] returns labels with confidence values greater than or equal to 50 \
         percent.\n"]
  video : video;
      [@ocaml.doc
        "The video in which you want to detect inappropriate, unwanted, or offensive content. The \
         video must be stored in an Amazon S3 bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec start_celebrity_recognition_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier for the celebrity recognition analysis job. Use [JobId] to identify the \
         job in a subsequent call to [GetCelebrityRecognition].\n"]
}
[@@ocaml.doc ""]

type nonrec start_celebrity_recognition_request = {
  job_tag : job_tag option;
      [@ocaml.doc
        "An identifier you specify that's returned in the completion notification that's published \
         to your Amazon Simple Notification Service topic. For example, you can use [JobTag] to \
         group related jobs and identify them in the completion notification.\n"]
  notification_channel : notification_channel option;
      [@ocaml.doc
        "The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion \
         status of the celebrity recognition analysis to. The Amazon SNS topic must have a topic \
         name that begins with {i AmazonRekognition} if you are using the \
         AmazonRekognitionServiceRole permissions policy.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the start request. If you use the same token with \
         multiple [StartCelebrityRecognition] requests, the same [JobId] is returned. Use \
         [ClientRequestToken] to prevent the same job from being accidently started more than \
         once. \n"]
  video : video;
      [@ocaml.doc
        "The video in which you want to recognize celebrities. The video must be stored in an \
         Amazon S3 bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec shot_segment = {
  confidence : segment_confidence option;
      [@ocaml.doc
        "The confidence that Amazon Rekognition Video has in the accuracy of the detected segment.\n"]
  index : u_long option;
      [@ocaml.doc "An Identifier for a shot detection segment detected in a video. \n"]
}
[@@ocaml.doc
  "Information about a shot detection segment detected in a video. For more information, see \
   [SegmentDetection].\n"]

type nonrec session_not_found_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Occurs when a given sessionId is not found.\n"]

type nonrec segment_type_info = {
  model_version : string_ option; [@ocaml.doc "The version of the model used to detect segments.\n"]
  type_ : segment_type option;
      [@ocaml.doc "The type of a segment (technical cue or shot detection).\n"]
}
[@@ocaml.doc
  "Information about the type of a segment requested in a call to [StartSegmentDetection]. An \
   array of [SegmentTypeInfo] objects is returned by the response from [GetSegmentDetection].\n"]

type nonrec segment_types_info = segment_type_info list [@@ocaml.doc ""]

type nonrec segment_detection = {
  duration_frames : u_long option;
      [@ocaml.doc " The duration of a video segment, expressed in frames. \n"]
  end_frame_number : u_long option;
      [@ocaml.doc
        " The frame number at the end of a video segment, using a frame index that starts with 0. \n"]
  start_frame_number : u_long option;
      [@ocaml.doc
        " The frame number of the start of a video segment, using a frame index that starts with 0. \n"]
  shot_segment : shot_segment option;
      [@ocaml.doc
        "If the segment is a shot detection, contains information about the shot detection.\n"]
  technical_cue_segment : technical_cue_segment option;
      [@ocaml.doc
        "If the segment is a technical cue, contains information about the technical cue.\n"]
  duration_smpt_e : timecode option;
      [@ocaml.doc "The duration of the timecode for the detected segment in SMPTE format.\n"]
  end_timecode_smpt_e : timecode option;
      [@ocaml.doc
        "The frame-accurate SMPTE timecode, from the start of a video, for the end of a detected \
         segment. [EndTimecode] is in {i HH:MM:SS:fr} format (and {i ;fr} for drop frame-rates).\n"]
  start_timecode_smpt_e : timecode option;
      [@ocaml.doc
        "The frame-accurate SMPTE timecode, from the start of a video, for the start of a detected \
         segment. [StartTimecode] is in {i HH:MM:SS:fr} format (and {i ;fr} for drop frame-rates). \n"]
  duration_millis : u_long option;
      [@ocaml.doc "The duration of the detected segment in milliseconds. \n"]
  end_timestamp_millis : timestamp option;
      [@ocaml.doc
        "The end time of the detected segment, in milliseconds, from the start of the video. This \
         value is rounded down.\n"]
  start_timestamp_millis : timestamp option;
      [@ocaml.doc
        "The start time of the detected segment in milliseconds from the start of the video. This \
         value is rounded down. For example, if the actual timestamp is 100.6667 milliseconds, \
         Amazon Rekognition Video returns a value of 100 millis.\n"]
  type_ : segment_type option;
      [@ocaml.doc "The type of the segment. Valid values are [TECHNICAL_CUE] and [SHOT].\n"]
}
[@@ocaml.doc
  "A technical cue or shot detection segment detected in a video. An array of [SegmentDetection] \
   objects containing all segments detected in a stored video is returned by \
   [GetSegmentDetection]. \n"]

type nonrec segment_detections = segment_detection list [@@ocaml.doc ""]

type nonrec searched_user = {
  user_id : user_id option;
      [@ocaml.doc " A provided ID for the UserID. Unique within the collection. \n"]
}
[@@ocaml.doc "Contains metadata about a User searched for within a collection.\n"]

type nonrec searched_face_details = { face_detail : face_detail option [@ocaml.doc ""] }
[@@ocaml.doc "Contains data regarding the input face used for a search.\n"]

type nonrec searched_face = {
  face_id : face_id option; [@ocaml.doc " Unique identifier assigned to the face.\n"]
}
[@@ocaml.doc
  "Provides face metadata such as FaceId, BoundingBox, Confidence of the input face used for search.\n"]

type nonrec search_users_response = {
  searched_user : searched_user option;
      [@ocaml.doc
        "Contains the ID of the UserID that was used to search for matches in a collection.\n"]
  searched_face : searched_face option;
      [@ocaml.doc
        "Contains the ID of a face that was used to search for matches in a collection.\n"]
  face_model_version : string_ option;
      [@ocaml.doc
        "Version number of the face detection model associated with the input CollectionId.\n"]
  user_matches : user_match_list option;
      [@ocaml.doc
        "An array of UserMatch objects that matched the input face along with the confidence in \
         the match. Array will be empty if there are no matches.\n"]
}
[@@ocaml.doc ""]

type nonrec max_user_results = int [@@ocaml.doc ""]

type nonrec search_users_request = {
  max_users : max_user_results option; [@ocaml.doc "Maximum number of identities to return.\n"]
  user_match_threshold : percent option;
      [@ocaml.doc
        "Optional value that specifies the minimum confidence in the matched UserID to return. \
         Default value of 80.\n"]
  face_id : face_id option; [@ocaml.doc "ID for the existing face.\n"]
  user_id : user_id option; [@ocaml.doc "ID for the existing User.\n"]
  collection_id : collection_id;
      [@ocaml.doc
        "The ID of an existing collection containing the UserID, used with a UserId or FaceId. If \
         a FaceId is provided, UserId isn\226\128\153t required to be present in the Collection.\n"]
}
[@@ocaml.doc ""]

type nonrec search_users_by_image_response = {
  unsearched_faces : unsearched_faces_list option;
      [@ocaml.doc
        "List of UnsearchedFace objects. Contains the face details infered from the specified \
         image but not used for search. Contains reasons that describe why a face wasn't used for \
         Search. \n"]
  searched_face : searched_face_details option;
      [@ocaml.doc
        "A list of FaceDetail objects containing the BoundingBox for the largest face in image, as \
         well as the confidence in the bounding box, that was searched for matches. If no valid \
         face is detected in the image the response will contain no SearchedFace object.\n"]
  face_model_version : string_ option;
      [@ocaml.doc
        "Version number of the face detection model associated with the input collection \
         CollectionId.\n"]
  user_matches : user_match_list option;
      [@ocaml.doc
        "An array of UserID objects that matched the input face, along with the confidence in the \
         match. The returned structure will be empty if there are no matches. Returned if the \
         SearchUsersByImageResponse action is successful.\n"]
}
[@@ocaml.doc ""]

type nonrec image_blob = bytes [@@ocaml.doc ""]

type nonrec image = {
  s3_object : s3_object option; [@ocaml.doc "Identifies an S3 object as the image source.\n"]
  bytes : image_blob option;
      [@ocaml.doc
        "Blob of image bytes up to 5 MBs. Note that the maximum image size you can pass to \
         [DetectCustomLabels] is 4MB. \n"]
}
[@@ocaml.doc
  "Provides the input image either as bytes or an S3 object.\n\n\
  \ You pass image bytes to an Amazon Rekognition API operation by using the [Bytes] property. For \
   example, you would use the [Bytes] property to pass an image loaded from a local file system. \
   Image bytes passed by using the [Bytes] property must be base64-encoded. Your code may not need \
   to encode image bytes if you are using an AWS SDK to call Amazon Rekognition API operations. \n\
  \ \n\
  \  For more information, see Analyzing an Image Loaded from a Local File System in the Amazon \
   Rekognition Developer Guide.\n\
  \  \n\
  \    You pass images stored in an S3 bucket to an Amazon Rekognition API operation by using the \
   [S3Object] property. Images stored in an S3 bucket do not need to be base64-encoded.\n\
  \   \n\
  \    The region for the S3 bucket containing the S3 object must match the region you use for \
   Amazon Rekognition operations.\n\
  \    \n\
  \     If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes using \
   the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and \
   then call the operation using the S3Object property.\n\
  \     \n\
  \      For Amazon Rekognition to process an S3 object, the user must have permission to access \
   the S3 object. For more information, see How Amazon Rekognition works with IAM in the Amazon \
   Rekognition Developer Guide. \n\
  \      "]

type nonrec quality_filter =
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | AUTO [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec search_users_by_image_request = {
  quality_filter : quality_filter option;
      [@ocaml.doc
        "A filter that specifies a quality bar for how much filtering is done to identify faces. \
         Filtered faces aren't searched for in the collection. The default value is NONE.\n"]
  max_users : max_user_results option; [@ocaml.doc "Maximum number of UserIDs to return.\n"]
  user_match_threshold : percent option;
      [@ocaml.doc
        "Specifies the minimum confidence in the UserID match to return. Default value is 80.\n"]
  image : image; [@ocaml.doc ""]
  collection_id : collection_id;
      [@ocaml.doc "The ID of an existing collection containing the UserID.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_image_format_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The provided image format is not supported. \n"]

type nonrec image_too_large_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The input image size exceeds the allowed limit. If you are calling DetectProtectiveEquipment, \
   the image size or resolution exceeds the allowed limit. For more information, see Guidelines \
   and quotas in Amazon Rekognition in the Amazon Rekognition Developer Guide. \n"]

type nonrec image_id = string [@@ocaml.doc ""]

type nonrec external_image_id = string [@@ocaml.doc ""]

type nonrec index_faces_model_version = string [@@ocaml.doc ""]

type nonrec face = {
  user_id : user_id option; [@ocaml.doc "Unique identifier assigned to the user.\n"]
  index_faces_model_version : index_faces_model_version option;
      [@ocaml.doc
        " The version of the face detect and storage model that was used when indexing the face \
         vector. \n"]
  confidence : percent option;
      [@ocaml.doc
        "Confidence level that the bounding box contains a face (and not a different object such \
         as a tree).\n"]
  external_image_id : external_image_id option;
      [@ocaml.doc "Identifier that you assign to all the faces in the input image.\n"]
  image_id : image_id option;
      [@ocaml.doc "Unique identifier that Amazon Rekognition assigns to the input image.\n"]
  bounding_box : bounding_box option; [@ocaml.doc "Bounding box of the face.\n"]
  face_id : face_id option;
      [@ocaml.doc "Unique identifier that Amazon Rekognition assigns to the face.\n"]
}
[@@ocaml.doc
  "Describes the face properties such as the bounding box, face ID, image ID of the input image, \
   and external image ID that you assigned. \n"]

type nonrec face_match = {
  face : face option;
      [@ocaml.doc
        "Describes the face properties such as the bounding box, face ID, image ID of the source \
         image, and external image ID that you assigned.\n"]
  similarity : percent option;
      [@ocaml.doc "Confidence in the match of this face with the input face.\n"]
}
[@@ocaml.doc
  "Provides face metadata. In addition, it also provides the confidence in the match of this face \
   with the input face.\n"]

type nonrec face_match_list = face_match list [@@ocaml.doc ""]

type nonrec search_faces_response = {
  face_model_version : string_ option;
      [@ocaml.doc
        "Version number of the face detection model associated with the input collection \
         ([CollectionId]).\n"]
  face_matches : face_match_list option;
      [@ocaml.doc
        "An array of faces that matched the input face, along with the confidence in the match.\n"]
  searched_face_id : face_id option;
      [@ocaml.doc "ID of the face that was searched for matches in a collection.\n"]
}
[@@ocaml.doc ""]

type nonrec max_faces = int [@@ocaml.doc ""]

type nonrec search_faces_request = {
  face_match_threshold : percent option;
      [@ocaml.doc
        "Optional value specifying the minimum confidence in the face match to return. For \
         example, don't return any matches where confidence in matches is less than 70%. The \
         default value is 80%. \n"]
  max_faces : max_faces option;
      [@ocaml.doc
        "Maximum number of faces to return. The operation returns the maximum number of faces with \
         the highest confidence in the match.\n"]
  face_id : face_id; [@ocaml.doc "ID of a face to find matches for in the collection.\n"]
  collection_id : collection_id; [@ocaml.doc "ID of the collection the face belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec search_faces_by_image_response = {
  face_model_version : string_ option;
      [@ocaml.doc
        "Version number of the face detection model associated with the input collection \
         ([CollectionId]).\n"]
  face_matches : face_match_list option;
      [@ocaml.doc
        "An array of faces that match the input face, along with the confidence in the match.\n"]
  searched_face_confidence : percent option;
      [@ocaml.doc "The level of confidence that the [searchedFaceBoundingBox], contains a face.\n"]
  searched_face_bounding_box : bounding_box option;
      [@ocaml.doc
        "The bounding box around the face in the input image that Amazon Rekognition used for the \
         search.\n"]
}
[@@ocaml.doc ""]

type nonrec search_faces_by_image_request = {
  quality_filter : quality_filter option;
      [@ocaml.doc
        "A filter that specifies a quality bar for how much filtering is done to identify faces. \
         Filtered faces aren't searched for in the collection. If you specify [AUTO], Amazon \
         Rekognition chooses the quality bar. If you specify [LOW], [MEDIUM], or [HIGH], filtering \
         removes all faces that don\226\128\153t meet the chosen quality bar. The quality bar is \
         based on a variety of common use cases. Low-quality detections can occur for a number of \
         reasons. Some examples are an object that's misidentified as a face, a face that's too \
         blurry, or a face with a pose that's too extreme to use. If you specify [NONE], no \
         filtering is performed. The default value is [NONE]. \n\n\
        \ To use quality filtering, the collection you are using must be associated with version 3 \
         of the face model or higher.\n\
        \ "]
  face_match_threshold : percent option;
      [@ocaml.doc
        "(Optional) Specifies the minimum confidence in the face match to return. For example, \
         don't return any matches where confidence in matches is less than 70%. The default value \
         is 80%.\n"]
  max_faces : max_faces option;
      [@ocaml.doc
        "Maximum number of faces to return. The operation returns the maximum number of faces with \
         the highest confidence in the match.\n"]
  image : image;
      [@ocaml.doc
        "The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call \
         Amazon Rekognition operations, passing base64-encoded image bytes is not supported. \n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
  collection_id : collection_id; [@ocaml.doc "ID of the collection to search.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_already_exists_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "A resource with the specified ID already exists.\n"]

type nonrec rekognition_unique_id = string [@@ocaml.doc ""]

type nonrec compared_face = {
  smile : smile option;
      [@ocaml.doc
        " Indicates whether or not the face is smiling, and the confidence level in the \
         determination. \n"]
  emotions : emotions option;
      [@ocaml.doc
        " The emotions that appear to be expressed on the face, and the confidence level in the \
         determination. Valid values include \"Happy\", \"Sad\", \"Angry\", \"Confused\", \
         \"Disgusted\", \"Surprised\", \"Calm\", \"Unknown\", and \"Fear\". \n"]
  quality : image_quality option; [@ocaml.doc "Identifies face image brightness and sharpness. \n"]
  pose : pose option;
      [@ocaml.doc "Indicates the pose of the face as determined by its pitch, roll, and yaw.\n"]
  landmarks : landmarks option; [@ocaml.doc "An array of facial landmarks.\n"]
  confidence : percent option;
      [@ocaml.doc "Level of confidence that what the bounding box contains is a face.\n"]
  bounding_box : bounding_box option; [@ocaml.doc "Bounding box of the face.\n"]
}
[@@ocaml.doc
  "Provides face metadata for target image faces that are analyzed by [CompareFaces] and \
   [RecognizeCelebrities].\n"]

type nonrec known_gender_type =
  | Unlisted [@ocaml.doc ""]
  | Nonbinary [@ocaml.doc ""]
  | Female [@ocaml.doc ""]
  | Male [@ocaml.doc ""]
[@@ocaml.doc "A list of enum string of possible gender values that Celebrity returns.\n"]

type nonrec known_gender = {
  type_ : known_gender_type option;
      [@ocaml.doc "A string value of the KnownGender info about the Celebrity.\n"]
}
[@@ocaml.doc
  "The known gender identity for the celebrity that matches the provided ID. The known gender \
   identity can be Male, Female, Nonbinary, or Unlisted.\n"]

type nonrec celebrity = {
  known_gender : known_gender option; [@ocaml.doc ""]
  match_confidence : percent option;
      [@ocaml.doc
        "The confidence, in percentage, that Amazon Rekognition has that the recognized face is \
         the celebrity.\n"]
  face : compared_face option;
      [@ocaml.doc
        "Provides information about the celebrity's face, such as its location on the image.\n"]
  id : rekognition_unique_id option; [@ocaml.doc "A unique identifier for the celebrity. \n"]
  name : string_ option; [@ocaml.doc "The name of the celebrity.\n"]
  urls : urls option;
      [@ocaml.doc
        "An array of URLs pointing to additional information about the celebrity. If there is no \
         additional information about the celebrity, this list is empty.\n"]
}
[@@ocaml.doc
  "Provides information about a celebrity recognized by the [RecognizeCelebrities] operation.\n"]

type nonrec celebrity_list = celebrity list [@@ocaml.doc ""]

type nonrec compared_face_list = compared_face list [@@ocaml.doc ""]

type nonrec orientation_correction =
  | ROTATE_270 [@ocaml.doc ""]
  | ROTATE_180 [@ocaml.doc ""]
  | ROTATE_90 [@ocaml.doc ""]
  | ROTATE_0 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec recognize_celebrities_response = {
  orientation_correction : orientation_correction option;
      [@ocaml.doc
        " Support for estimating image orientation using the the OrientationCorrection field has \
         ceased as of August 2021. Any returned values for this field included in an API response \
         will always be NULL.\n\
        \ \n\
        \   The orientation of the input image (counterclockwise direction). If your application \
         displays the image, you can use this value to correct the orientation. The bounding box \
         coordinates returned in [CelebrityFaces] and [UnrecognizedFaces] represent face locations \
         before the image orientation is corrected. \n\
        \   \n\
        \     If the input image is in .jpeg format, it might contain exchangeable image (Exif) \
         metadata that includes the image's orientation. If so, and the Exif metadata for the \
         input image populates the orientation field, the value of [OrientationCorrection] is \
         null. The [CelebrityFaces] and [UnrecognizedFaces] bounding box coordinates represent \
         face locations after Exif metadata is used to correct the image orientation. Images in \
         .png format don't contain Exif metadata. \n\
        \     \n\
        \      "]
  unrecognized_faces : compared_face_list option;
      [@ocaml.doc "Details about each unrecognized face in the image.\n"]
  celebrity_faces : celebrity_list option;
      [@ocaml.doc
        "Details about each celebrity found in the image. Amazon Rekognition can detect a maximum \
         of 64 celebrities in an image. Each celebrity object includes the following attributes: \
         [Face], [Confidence], [Emotions], [Landmarks], [Pose], [Quality], [Smile], [Id], \
         [KnownGender], [MatchConfidence], [Name], [Urls].\n"]
}
[@@ocaml.doc ""]

type nonrec recognize_celebrities_request = {
  image : image;
      [@ocaml.doc
        "The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call \
         Amazon Rekognition operations, passing base64-encoded image bytes is not supported. \n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec malformed_policy_document_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The format of the project policy document that you supplied to [PutProjectPolicy] is incorrect. \n"]

type nonrec invalid_policy_revision_id_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The supplied revision id for the project policy is invalid.\n"]

type nonrec project_policy_revision_id = string [@@ocaml.doc ""]

type nonrec put_project_policy_response = {
  policy_revision_id : project_policy_revision_id option;
      [@ocaml.doc "The ID of the project policy.\n"]
}
[@@ocaml.doc ""]

type nonrec project_arn = string [@@ocaml.doc ""]

type nonrec project_policy_name = string [@@ocaml.doc ""]

type nonrec project_policy_document = string [@@ocaml.doc ""]

type nonrec put_project_policy_request = {
  policy_document : project_policy_document;
      [@ocaml.doc
        "A resource policy to add to the model. The policy is a JSON structure that contains one \
         or more statements that define the policy. The policy must follow the IAM syntax. For \
         more information about the contents of a JSON policy document, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON \
         policy reference}. \n"]
  policy_revision_id : project_policy_revision_id option;
      [@ocaml.doc
        "The revision ID for the Project Policy. Each time you modify a policy, Amazon Rekognition \
         Custom Labels generates and assigns a new [PolicyRevisionId] and then deletes the \
         previous version of the policy.\n"]
  policy_name : project_policy_name; [@ocaml.doc "A name for the policy.\n"]
  project_arn : project_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project that the project policy is attached to.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_pagination_token_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "Pagination token in the request is not valid.\n"]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec list_users_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A pagination token to be used with the subsequent request if the response is truncated.\n"]
  users : user_list option;
      [@ocaml.doc "List of UsersID associated with the specified collection.\n"]
}
[@@ocaml.doc ""]

type nonrec list_users_request = {
  next_token : pagination_token option;
      [@ocaml.doc "Pagingation token to receive the next set of UsersID.\n"]
  max_results : max_user_results option; [@ocaml.doc "Maximum number of UsersID to return. \n"]
  collection_id : collection_id; [@ocaml.doc "The ID of an existing collection.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_map option; [@ocaml.doc " A list of key-value tags assigned to the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        " Amazon Resource Name (ARN) of the model, collection, or stream processor that contains \
         the tags that you want a list of. \n"]
}
[@@ocaml.doc ""]

type nonrec list_stream_processors_response = {
  stream_processors : stream_processor_list option;
      [@ocaml.doc "List of stream processors that you have created.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition Video returns this token that you can \
         use in the subsequent request to retrieve the next set of stream processors. \n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_stream_processors_request = {
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of stream processors you want Amazon Rekognition Video to return in the \
         response. The default is 1000. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more stream processors to \
         retrieve), Amazon Rekognition Video returns a pagination token in the response. You can \
         use this pagination token to retrieve the next set of stream processors. \n"]
}
[@@ocaml.doc ""]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec project_policy = {
  last_updated_timestamp : date_time option;
      [@ocaml.doc "The Unix datetime for when the project policy was last updated. \n"]
  creation_timestamp : date_time option;
      [@ocaml.doc "The Unix datetime for the creation of the project policy.\n"]
  policy_document : project_policy_document option;
      [@ocaml.doc "The JSON document for the project policy.\n"]
  policy_revision_id : project_policy_revision_id option;
      [@ocaml.doc "The revision ID of the project policy.\n"]
  policy_name : project_policy_name option; [@ocaml.doc "The name of the project policy.\n"]
  project_arn : project_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project to which the project policy is attached.\n"]
}
[@@ocaml.doc "Describes a project policy in the response from [ListProjectPolicies]. \n\n  \n "]

type nonrec project_policies = project_policy list [@@ocaml.doc ""]

type nonrec extended_pagination_token = string [@@ocaml.doc ""]

type nonrec list_project_policies_response = {
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition returns this token that you can use in \
         the subsequent request to retrieve the next set of project policies.\n"]
  project_policies : project_policies option;
      [@ocaml.doc "A list of project policies attached to the project.\n"]
}
[@@ocaml.doc ""]

type nonrec list_project_policies_page_size = int [@@ocaml.doc ""]

type nonrec list_project_policies_request = {
  max_results : list_project_policies_page_size option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value you can \
         specify is 5. If you specify a value greater than 5, a ValidationException error occurs. \
         The default value is 5. \n"]
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Amazon Rekognition Custom Labels returns a pagination token in the response. You can use \
         this pagination token to retrieve the next set of results. \n"]
  project_arn : project_arn;
      [@ocaml.doc "The ARN of the project for which you want to list the project policies.\n"]
}
[@@ocaml.doc ""]

type nonrec media_analysis_job_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec media_analysis_job_failure_code =
  | THROTTLED [@ocaml.doc ""]
  | RESOURCE_NOT_READY [@ocaml.doc ""]
  | RESOURCE_NOT_FOUND [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""]
  | INVALID_KMS_KEY [@ocaml.doc ""]
  | INVALID_OUTPUT_CONFIG [@ocaml.doc ""]
  | INVALID_MANIFEST [@ocaml.doc ""]
  | INVALID_S3_OBJECT [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec media_analysis_job_failure_details = {
  message : string_ option; [@ocaml.doc "Human readable error message.\n"]
  code : media_analysis_job_failure_code option; [@ocaml.doc "Error code for the failed job.\n"]
}
[@@ocaml.doc "Details about the error that resulted in failure of the job.\n"]

type nonrec media_analysis_model_versions = {
  moderation : string_ option; [@ocaml.doc "The Moderation base model version.\n"]
}
[@@ocaml.doc
  "Object containing information about the model versions of selected features in a given job.\n"]

type nonrec media_analysis_results = {
  model_versions : media_analysis_model_versions option;
      [@ocaml.doc
        "Information about the model versions for the features selected in a given job.\n"]
  s3_object : s3_object option; [@ocaml.doc ""]
}
[@@ocaml.doc "Contains the results for a media analysis job created with StartMediaAnalysisJob.\n"]

type nonrec media_analysis_manifest_summary = { s3_object : s3_object option [@ocaml.doc ""] }
[@@ocaml.doc
  "Summary that provides statistics on input manifest and errors identified in the input manifest.\n"]

type nonrec media_analysis_job_description = {
  manifest_summary : media_analysis_manifest_summary option;
      [@ocaml.doc
        "Provides statistics on input manifest and errors identified in the input manifest.\n"]
  results : media_analysis_results option;
      [@ocaml.doc "Output manifest that contains prediction results.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc "KMS Key that was provided in the creation request.\n"]
  output_config : media_analysis_output_config;
      [@ocaml.doc "Output configuration that was provided in the creation request.\n"]
  input : media_analysis_input;
      [@ocaml.doc
        "Reference to the input manifest that was provided in the job creation request.\n"]
  completion_timestamp : date_time option;
      [@ocaml.doc "The Unix date and time when the job finished.\n"]
  creation_timestamp : date_time; [@ocaml.doc "The Unix date and time when the job was started.\n"]
  failure_details : media_analysis_job_failure_details option;
      [@ocaml.doc "Details about the error that resulted in failure of the job.\n"]
  status : media_analysis_job_status;
      [@ocaml.doc "The status of the media analysis job being retrieved.\n"]
  operations_config : media_analysis_operations_config;
      [@ocaml.doc "Operation configurations that were provided during job creation.\n"]
  job_name : media_analysis_job_name option; [@ocaml.doc "The name of a media analysis job.\n"]
  job_id : media_analysis_job_id; [@ocaml.doc "The identifier for a media analysis job.\n"]
}
[@@ocaml.doc "Description for a media analysis job.\n"]

type nonrec media_analysis_job_descriptions = media_analysis_job_description list [@@ocaml.doc ""]

type nonrec list_media_analysis_jobs_response = {
  media_analysis_jobs : media_analysis_job_descriptions;
      [@ocaml.doc "Contains a list of all media analysis jobs.\n"]
  next_token : extended_pagination_token option;
      [@ocaml.doc "Pagination token, if the previous response was incomplete.\n"]
}
[@@ocaml.doc ""]

type nonrec list_media_analysis_jobs_page_size = int [@@ocaml.doc ""]

type nonrec list_media_analysis_jobs_request = {
  max_results : list_media_analysis_jobs_page_size option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value user can \
         specify is 100. If user specifies a value greater than 100, an \
         [InvalidParameterException] error occurs. The default value is 100.\n"]
  next_token : extended_pagination_token option;
      [@ocaml.doc "Pagination token, if the previous response was incomplete.\n"]
}
[@@ocaml.doc ""]

type nonrec face_list = face list [@@ocaml.doc ""]

type nonrec list_faces_response = {
  face_model_version : string_ option;
      [@ocaml.doc
        "Version number of the face detection model associated with the input collection \
         ([CollectionId]).\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition returns this token that you can use in \
         the subsequent request to retrieve the next set of faces.\n"]
  faces : face_list option; [@ocaml.doc "An array of [Face] objects. \n"]
}
[@@ocaml.doc ""]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec face_id_list = face_id list [@@ocaml.doc ""]

type nonrec list_faces_request = {
  face_ids : face_id_list option;
      [@ocaml.doc
        "An array of face IDs to filter results with when listing faces in a collection.\n"]
  user_id : user_id option;
      [@ocaml.doc
        "An array of user IDs to filter results with when listing faces in a collection.\n"]
  max_results : page_size option; [@ocaml.doc "Maximum number of faces to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more data to retrieve), Amazon \
         Rekognition returns a pagination token in the response. You can use this pagination token \
         to retrieve the next set of faces.\n"]
  collection_id : collection_id; [@ocaml.doc "ID of the collection from which to list the faces.\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_label = string [@@ocaml.doc ""]

type nonrec dataset_label_stats = {
  bounding_box_count : u_integer option;
      [@ocaml.doc " The total number of images that have the label assigned to a bounding box. \n"]
  entry_count : u_integer option; [@ocaml.doc " The total number of images that use the label. \n"]
}
[@@ocaml.doc
  " Statistics about a label used in a dataset. For more information, see \
   [DatasetLabelDescription]. \n"]

type nonrec dataset_label_description = {
  label_stats : dataset_label_stats option; [@ocaml.doc " Statistics about the label. \n"]
  label_name : dataset_label option; [@ocaml.doc " The name of the label. \n"]
}
[@@ocaml.doc " Describes a dataset label. For more information, see [ListDatasetLabels]. \n"]

type nonrec dataset_label_descriptions = dataset_label_description list [@@ocaml.doc ""]

type nonrec list_dataset_labels_response = {
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Amazon Rekognition Custom Labels returns a pagination token in the response. You can use \
         this pagination token to retrieve the next set of results. \n"]
  dataset_label_descriptions : dataset_label_descriptions option;
      [@ocaml.doc " A list of the labels in the dataset. \n"]
}
[@@ocaml.doc ""]

type nonrec list_dataset_labels_page_size = int [@@ocaml.doc ""]

type nonrec list_dataset_labels_request = {
  max_results : list_dataset_labels_page_size option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value you can \
         specify is 100. If you specify a value greater than 100, a ValidationException error \
         occurs. The default value is 100. \n"]
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Amazon Rekognition Custom Labels returns a pagination token in the response. You can use \
         this pagination token to retrieve the next set of results. \n"]
  dataset_arn : dataset_arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the dataset that you want to use. \n"]
}
[@@ocaml.doc ""]

type nonrec dataset_entry = string [@@ocaml.doc ""]

type nonrec dataset_entries = dataset_entry list [@@ocaml.doc ""]

type nonrec list_dataset_entries_response = {
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Amazon Rekognition Custom Labels returns a pagination token in the response. You can use \
         this pagination token to retrieve the next set of results. \n"]
  dataset_entries : dataset_entries option;
      [@ocaml.doc " A list of entries (images) in the dataset. \n"]
}
[@@ocaml.doc ""]

type nonrec dataset_labels = dataset_label list [@@ocaml.doc ""]

type nonrec is_labeled = bool [@@ocaml.doc ""]

type nonrec query_string = string [@@ocaml.doc ""]

type nonrec has_errors = bool [@@ocaml.doc ""]

type nonrec list_dataset_entries_page_size = int [@@ocaml.doc ""]

type nonrec list_dataset_entries_request = {
  max_results : list_dataset_entries_page_size option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value you can \
         specify is 100. If you specify a value greater than 100, a ValidationException error \
         occurs. The default value is 100. \n"]
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Amazon Rekognition Custom Labels returns a pagination token in the response. You can use \
         this pagination token to retrieve the next set of results. \n"]
  has_errors : has_errors option;
      [@ocaml.doc
        "Specifies an error filter for the response. Specify [True] to only include entries that \
         have errors. \n"]
  source_ref_contains : query_string option;
      [@ocaml.doc
        "If specified, [ListDatasetEntries] only returns JSON Lines where the value of \
         [SourceRefContains] is part of the [source-ref] field. The [source-ref] field contains \
         the Amazon S3 location of the image. You can use [SouceRefContains] for tasks such as \
         getting the JSON Line for a single image, or gettting JSON Lines for all images within a \
         specific folder.\n"]
  labeled : is_labeled option;
      [@ocaml.doc
        " Specify [true] to get only the JSON Lines where the image is labeled. Specify [false] to \
         get only the JSON Lines where the image isn't labeled. If you don't specify [Labeled], \
         [ListDatasetEntries] returns JSON Lines for labeled and unlabeled images. \n"]
  contains_labels : dataset_labels option;
      [@ocaml.doc
        "Specifies a label filter for the response. The response includes an entry only if one or \
         more of the labels in [ContainsLabels] exist in the entry. \n"]
  dataset_arn : dataset_arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) for the dataset that you want to use. \n"]
}
[@@ocaml.doc ""]

type nonrec collection_id_list = collection_id list [@@ocaml.doc ""]

type nonrec face_model_version_list = string_ list [@@ocaml.doc ""]

type nonrec list_collections_response = {
  face_model_versions : face_model_version_list option;
      [@ocaml.doc
        "Version numbers of the face detection models associated with the collections in the array \
         [CollectionIds]. For example, the value of [FaceModelVersions\\[2\\]] is the version \
         number for the face detection model used by the collection in [CollectionId\\[2\\]].\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the result is truncated, the response provides a [NextToken] that you can use in the \
         subsequent request to fetch the next set of collection IDs.\n"]
  collection_ids : collection_id_list option; [@ocaml.doc "An array of collection IDs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_collections_request = {
  max_results : page_size option; [@ocaml.doc "Maximum number of collection IDs to return. \n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination token from the previous response.\n"]
}
[@@ocaml.doc ""]

type nonrec face_record = {
  face_detail : face_detail option;
      [@ocaml.doc "Structure containing attributes of the face that the algorithm detected.\n"]
  face : face option;
      [@ocaml.doc
        "Describes the face properties such as the bounding box, face ID, image ID of the input \
         image, and external image ID that you assigned. \n"]
}
[@@ocaml.doc
  "Object containing both the face metadata (stored in the backend database), and facial \
   attributes that are detected but aren't stored in the database.\n"]

type nonrec face_record_list = face_record list [@@ocaml.doc ""]

type nonrec index_faces_response = {
  unindexed_faces : unindexed_faces option;
      [@ocaml.doc
        "An array of faces that were detected in the image but weren't indexed. They weren't \
         indexed because the quality filter identified them as low quality, or the [MaxFaces] \
         request parameter filtered them out. To use the quality filter, you specify the \
         [QualityFilter] request parameter.\n"]
  face_model_version : string_ option;
      [@ocaml.doc
        "The version number of the face detection model that's associated with the input \
         collection ([CollectionId]).\n"]
  orientation_correction : orientation_correction option;
      [@ocaml.doc
        "If your collection is associated with a face detection model that's later than version \
         3.0, the value of [OrientationCorrection] is always null and no orientation information \
         is returned.\n\n\
        \ If your collection is associated with a face detection model that's version 3.0 or \
         earlier, the following applies:\n\
        \ \n\
        \  {ul\n\
        \        {-  If the input image is in .jpeg format, it might contain exchangeable image \
         file format (Exif) metadata that includes the image's orientation. Amazon Rekognition \
         uses this orientation information to perform image correction - the bounding box \
         coordinates are translated to represent object locations after the orientation \
         information in the Exif metadata is used to correct the image orientation. Images in .png \
         format don't contain Exif metadata. The value of [OrientationCorrection] is null.\n\
        \            \n\
        \             }\n\
        \        {-  If the image doesn't contain orientation information in its Exif metadata, \
         Amazon Rekognition returns an estimated orientation (ROTATE_0, ROTATE_90, ROTATE_180, \
         ROTATE_270). Amazon Rekognition doesn\226\128\153t perform image correction for images. \
         The bounding box coordinates aren't translated and represent the object locations before \
         the image is rotated.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Bounding box information is returned in the [FaceRecords] array. You can get the \
         version of the face detection model by calling [DescribeCollection]. \n\
        \   "]
  face_records : face_record_list option;
      [@ocaml.doc
        "An array of faces detected and added to the collection. For more information, see \
         Searching Faces in a Collection in the Amazon Rekognition Developer Guide. \n"]
}
[@@ocaml.doc ""]

type nonrec attribute =
  | SUNGLASSES [@ocaml.doc ""]
  | SMILE [@ocaml.doc ""]
  | FACE_OCCLUDED [@ocaml.doc ""]
  | MUSTACHE [@ocaml.doc ""]
  | MOUTH_OPEN [@ocaml.doc ""]
  | GENDER [@ocaml.doc ""]
  | EYES_OPEN [@ocaml.doc ""]
  | EYEGLASSES [@ocaml.doc ""]
  | EYE_DIRECTION [@ocaml.doc ""]
  | EMOTIONS [@ocaml.doc ""]
  | BEARD [@ocaml.doc ""]
  | AGE_RANGE [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec attributes = attribute list [@@ocaml.doc ""]

type nonrec max_faces_to_index = int [@@ocaml.doc ""]

type nonrec index_faces_request = {
  quality_filter : quality_filter option;
      [@ocaml.doc
        "A filter that specifies a quality bar for how much filtering is done to identify faces. \
         Filtered faces aren't indexed. If you specify [AUTO], Amazon Rekognition chooses the \
         quality bar. If you specify [LOW], [MEDIUM], or [HIGH], filtering removes all faces that \
         don\226\128\153t meet the chosen quality bar. The default value is [AUTO]. The quality \
         bar is based on a variety of common use cases. Low-quality detections can occur for a \
         number of reasons. Some examples are an object that's misidentified as a face, a face \
         that's too blurry, or a face with a pose that's too extreme to use. If you specify \
         [NONE], no filtering is performed. \n\n\
        \ To use quality filtering, the collection you are using must be associated with version 3 \
         of the face model or higher.\n\
        \ "]
  max_faces : max_faces_to_index option;
      [@ocaml.doc
        "The maximum number of faces to index. The value of [MaxFaces] must be greater than or \
         equal to 1. [IndexFaces] returns no more than 100 detected faces in an image, even if you \
         specify a larger value for [MaxFaces].\n\n\
        \ If [IndexFaces] detects more faces than the value of [MaxFaces], the faces with the \
         lowest quality are filtered out first. If there are still more faces than the value of \
         [MaxFaces], the faces with the smallest bounding boxes are filtered out (up to the number \
         that's needed to satisfy the value of [MaxFaces]). Information about the unindexed faces \
         is available in the [UnindexedFaces] array. \n\
        \ \n\
        \  The faces that are returned by [IndexFaces] are sorted by the largest face bounding box \
         size to the smallest size, in descending order.\n\
        \  \n\
        \    [MaxFaces] can be used with a collection associated with any version of the face model.\n\
        \   "]
  detection_attributes : attributes option;
      [@ocaml.doc
        "An array of facial attributes you want to be returned. A [DEFAULT] subset of facial \
         attributes - [BoundingBox], [Confidence], [Pose], [Quality], and [Landmarks] - will \
         always be returned. You can request for specific facial attributes (in addition to the \
         default list) - by using [\\[\"DEFAULT\",\n\
        \        \"FACE_OCCLUDED\"\\]] or just [\\[\"FACE_OCCLUDED\"\\]]. You can request for all \
         facial attributes by using [\\[\"ALL\"\\]]. Requesting more attributes may increase \
         response time.\n\n\
        \ If you provide both, [\\[\"ALL\", \"DEFAULT\"\\]], the service uses a logical AND \
         operator to determine which attributes to return (in this case, all attributes). \n\
        \ "]
  external_image_id : external_image_id option;
      [@ocaml.doc "The ID you want to assign to all the faces detected in the image.\n"]
  image : image;
      [@ocaml.doc
        "The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call \
         Amazon Rekognition operations, passing base64-encoded image bytes isn't supported. \n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
  collection_id : collection_id;
      [@ocaml.doc
        "The ID of an existing collection to which you want to add the faces that are detected in \
         the input images.\n"]
}
[@@ocaml.doc ""]

type nonrec get_text_detection_response = {
  job_tag : job_tag option;
      [@ocaml.doc
        "A job identifier specified in the call to StartTextDetection and returned in the job \
         completion notification sent to your Amazon Simple Notification Service topic.\n"]
  video : video option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "Job identifier for the text detection operation for which you want to obtain results. The \
         job identifer is returned by an initial call to StartTextDetection.\n"]
  text_model_version : string_ option;
      [@ocaml.doc "Version number of the text detection model that was used to detect text.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition Video returns this token that you can \
         use in the subsequent request to retrieve the next set of text.\n"]
  text_detections : text_detection_results option;
      [@ocaml.doc
        "An array of text detected in the video. Each element contains the detected text, the time \
         in milliseconds from the start of the video that the text was detected, and where it was \
         detected on the screen.\n"]
  video_metadata : video_metadata option; [@ocaml.doc ""]
  status_message : status_message option;
      [@ocaml.doc "If the job fails, [StatusMessage] provides a descriptive error message.\n"]
  job_status : video_job_status option; [@ocaml.doc "Current status of the text detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_text_detection_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more labels to retrieve), \
         Amazon Rekognition Video returns a pagination token in the response. You can use this \
         pagination token to retrieve the next set of text.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of results to return per paginated call. The largest value you can specify \
         is 1000.\n"]
  job_id : job_id;
      [@ocaml.doc
        "Job identifier for the text detection operation for which you want results returned. You \
         get the job identifer from an initial call to [StartTextDetection].\n"]
}
[@@ocaml.doc ""]

type nonrec audio_metadata = {
  number_of_channels : u_long option; [@ocaml.doc "The number of audio channels in the segment.\n"]
  sample_rate : u_long option; [@ocaml.doc "The sample rate for the audio stream.\n"]
  duration_millis : u_long option;
      [@ocaml.doc "The duration of the audio stream in milliseconds.\n"]
  codec : string_ option;
      [@ocaml.doc "The audio codec used to encode or decode the audio stream. \n"]
}
[@@ocaml.doc
  "Metadata information about an audio stream. An array of [AudioMetadata] objects for the audio \
   streams found in a stored video is returned by [GetSegmentDetection]. \n"]

type nonrec audio_metadata_list = audio_metadata list [@@ocaml.doc ""]

type nonrec get_segment_detection_response = {
  job_tag : job_tag option;
      [@ocaml.doc
        "A job identifier specified in the call to StartSegmentDetection and returned in the job \
         completion notification sent to your Amazon Simple Notification Service topic.\n"]
  video : video option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "Job identifier for the segment detection operation for which you want to obtain results. \
         The job identifer is returned by an initial call to StartSegmentDetection.\n"]
  selected_segment_types : segment_types_info option;
      [@ocaml.doc
        "An array containing the segment types requested in the call to [StartSegmentDetection]. \n"]
  segments : segment_detections option;
      [@ocaml.doc
        "An array of segments detected in a video. The array is sorted by the segment types \
         (TECHNICAL_CUE or SHOT) specified in the [SegmentTypes] input parameter of \
         [StartSegmentDetection]. Within each segment type the array is sorted by timestamp values.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more labels to retrieve), \
         Amazon Rekognition Video returns a pagination token in the response. You can use this \
         pagination token to retrieve the next set of text.\n"]
  audio_metadata : audio_metadata_list option;
      [@ocaml.doc
        "An array of objects. There can be multiple audio streams. Each [AudioMetadata] object \
         contains metadata for a single audio stream. Audio information in an [AudioMetadata] \
         objects includes the audio codec, the number of audio channels, the duration of the audio \
         stream, and the sample rate. Audio metadata is returned in each page of information \
         returned by [GetSegmentDetection].\n"]
  video_metadata : video_metadata_list option;
      [@ocaml.doc
        "Currently, Amazon Rekognition Video returns a single object in the [VideoMetadata] array. \
         The object contains information about the video stream in the input file that Amazon \
         Rekognition Video chose to analyze. The [VideoMetadata] object includes the video codec, \
         video format and other information. Video metadata is returned in each page of \
         information returned by [GetSegmentDetection].\n"]
  status_message : status_message option;
      [@ocaml.doc "If the job fails, [StatusMessage] provides a descriptive error message.\n"]
  job_status : video_job_status option; [@ocaml.doc "Current status of the segment detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_segment_detection_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition Video returns this token that you can \
         use in the subsequent request to retrieve the next set of text.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of results to return per paginated call. The largest value you can specify \
         is 1000.\n"]
  job_id : job_id;
      [@ocaml.doc
        "Job identifier for the text detection operation for which you want results returned. You \
         get the job identifer from an initial call to [StartSegmentDetection].\n"]
}
[@@ocaml.doc ""]

type nonrec person_index = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec person_detail = {
  face : face_detail option; [@ocaml.doc "Face details for the detected person.\n"]
  bounding_box : bounding_box option; [@ocaml.doc "Bounding box around the detected person.\n"]
  index : person_index option;
      [@ocaml.doc
        "Identifier for the person detected person within a video. Use to keep track of the person \
         throughout the video. The identifier is not stored by Amazon Rekognition.\n"]
}
[@@ocaml.doc "Details about a person detected in a video analysis request.\n"]

type nonrec person_detection = {
  person : person_detail option;
      [@ocaml.doc "Details about a person whose path was tracked in a video.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "The time, in milliseconds from the start of the video, that the person's path was \
         tracked. Note that [Timestamp] is not guaranteed to be accurate to the individual frame \
         where the person's path first appears.\n"]
}
[@@ocaml.doc
  "Details and path tracking information for a single time a person's path is tracked in a video. \
   Amazon Rekognition operations that track people's paths return an array of [PersonDetection] \
   objects with elements for each time a person's path is tracked in a video. \n\n\
  \ For more information, see GetPersonTracking in the Amazon Rekognition Developer Guide. \n\
  \ "]

type nonrec person_detections = person_detection list [@@ocaml.doc ""]

type nonrec get_person_tracking_response = {
  job_tag : job_tag option;
      [@ocaml.doc
        "A job identifier specified in the call to StartCelebrityRecognition and returned in the \
         job completion notification sent to your Amazon Simple Notification Service topic.\n"]
  video : video option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "Job identifier for the person tracking operation for which you want to obtain results. \
         The job identifer is returned by an initial call to StartPersonTracking.\n"]
  persons : person_detections option;
      [@ocaml.doc
        "An array of the persons detected in the video and the time(s) their path was tracked \
         throughout the video. An array element will exist for each time a person's path is \
         tracked. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition Video returns this token that you can \
         use in the subsequent request to retrieve the next set of persons. \n"]
  video_metadata : video_metadata option;
      [@ocaml.doc
        "Information about a video that Amazon Rekognition Video analyzed. [Videometadata] is \
         returned in every page of paginated responses from a Amazon Rekognition Video operation.\n"]
  status_message : status_message option;
      [@ocaml.doc "If the job fails, [StatusMessage] provides a descriptive error message.\n"]
  job_status : video_job_status option;
      [@ocaml.doc "The current status of the person tracking job.\n"]
}
[@@ocaml.doc ""]

type nonrec person_tracking_sort_by = TIMESTAMP [@ocaml.doc ""] | INDEX [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_person_tracking_request = {
  sort_by : person_tracking_sort_by option;
      [@ocaml.doc
        "Sort to use for elements in the [Persons] array. Use [TIMESTAMP] to sort array elements \
         by the time persons are detected. Use [INDEX] to sort by the tracked persons. If you sort \
         by [INDEX], the array elements for each person are sorted by detection confidence. The \
         default sort is by [TIMESTAMP].\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more persons to retrieve), \
         Amazon Rekognition Video returns a pagination token in the response. You can use this \
         pagination token to retrieve the next set of persons. \n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of results to return per paginated call. The largest value you can specify \
         is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. \
         The default value is 1000.\n"]
  job_id : job_id;
      [@ocaml.doc
        "The identifier for a job that tracks persons in a video. You get the [JobId] from a call \
         to [StartPersonTracking]. \n"]
}
[@@ocaml.doc ""]

type nonrec get_media_analysis_job_response = {
  manifest_summary : media_analysis_manifest_summary option;
      [@ocaml.doc
        "The summary manifest provides statistics on input manifest and errors identified in the \
         input manifest.\n"]
  results : media_analysis_results option;
      [@ocaml.doc "Output manifest that contains prediction results.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc "KMS Key that was provided in the creation request.\n"]
  output_config : media_analysis_output_config;
      [@ocaml.doc "Output configuration that was provided in the creation request.\n"]
  input : media_analysis_input;
      [@ocaml.doc
        "Reference to the input manifest that was provided in the job creation request.\n"]
  completion_timestamp : date_time option;
      [@ocaml.doc "The Unix date and time when the job finished.\n"]
  creation_timestamp : date_time; [@ocaml.doc "The Unix date and time when the job was started.\n"]
  failure_details : media_analysis_job_failure_details option;
      [@ocaml.doc "Details about the error that resulted in failure of the job.\n"]
  status : media_analysis_job_status; [@ocaml.doc "The current status of the media analysis job.\n"]
  operations_config : media_analysis_operations_config;
      [@ocaml.doc "Operation configurations that were provided during job creation.\n"]
  job_name : media_analysis_job_name option; [@ocaml.doc "The name of the media analysis job.\n"]
  job_id : media_analysis_job_id; [@ocaml.doc "The identifier for the media analysis job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_media_analysis_job_request = {
  job_id : media_analysis_job_id;
      [@ocaml.doc
        "Unique identifier for the media analysis job for which you want to retrieve results.\n"]
}
[@@ocaml.doc ""]

type nonrec dominant_color = {
  pixel_percent : percent option;
      [@ocaml.doc "The percentage of image pixels that have a given dominant color.\n"]
  simplified_color : string_ option;
      [@ocaml.doc "One of 12 simplified color names applied to a dominant color.\n"]
  css_color : string_ option; [@ocaml.doc "The CSS color name of a dominant color.\n"]
  hex_code : string_ option;
      [@ocaml.doc "The Hex code equivalent of the RGB values for a dominant color.\n"]
  green : u_integer option; [@ocaml.doc "The Green RGB value for a dominant color.\n"]
  blue : u_integer option; [@ocaml.doc "The Blue RGB value for a dominant color.\n"]
  red : u_integer option; [@ocaml.doc "The Red RGB value for a dominant color.\n"]
}
[@@ocaml.doc "A description of the dominant colors in an image.\n"]

type nonrec dominant_colors = dominant_color list [@@ocaml.doc ""]

type nonrec instance = {
  dominant_colors : dominant_colors option;
      [@ocaml.doc "The dominant colors found in an individual instance of a label.\n"]
  confidence : percent option;
      [@ocaml.doc
        "The confidence that Amazon Rekognition has in the accuracy of the bounding box.\n"]
  bounding_box : bounding_box option;
      [@ocaml.doc "The position of the label instance on the image.\n"]
}
[@@ocaml.doc
  "An instance of a label returned by Amazon Rekognition Image ([DetectLabels]) or by Amazon \
   Rekognition Video ([GetLabelDetection]).\n"]

type nonrec instances = instance list [@@ocaml.doc ""]

type nonrec parent = { name : string_ option [@ocaml.doc "The name of the parent label.\n"] }
[@@ocaml.doc "A parent label for a label. A label can have 0, 1, or more parents. \n"]

type nonrec parents = parent list [@@ocaml.doc ""]

type nonrec label_alias = {
  name : string_ option; [@ocaml.doc "The name of an alias for a given label.\n"]
}
[@@ocaml.doc "A potential alias of for a given label.\n"]

type nonrec label_aliases = label_alias list [@@ocaml.doc ""]

type nonrec label_category = {
  name : string_ option; [@ocaml.doc "The name of a category that applies to a given label.\n"]
}
[@@ocaml.doc "The category that applies to a given label.\n"]

type nonrec label_categories = label_category list [@@ocaml.doc ""]

type nonrec label = {
  categories : label_categories option;
      [@ocaml.doc "A list of the categories associated with a given label.\n"]
  aliases : label_aliases option; [@ocaml.doc "A list of potential aliases for a given label.\n"]
  parents : parents option;
      [@ocaml.doc "The parent labels for a label. The response includes all ancestor labels.\n"]
  instances : instances option;
      [@ocaml.doc
        "If [Label] represents an object, [Instances] contains the bounding boxes for each \
         instance of the detected object. Bounding boxes are returned for common object labels \
         such as people, cars, furniture, apparel or pets.\n"]
  confidence : percent option; [@ocaml.doc "Level of confidence.\n"]
  name : string_ option; [@ocaml.doc "The name (label) of the object or scene.\n"]
}
[@@ocaml.doc
  "Structure containing details about the detected label, including the name, detected instances, \
   parent labels, and level of confidence.\n\n\
  \  \n\
  \ "]

type nonrec label_detection = {
  duration_millis : u_long option;
      [@ocaml.doc
        "The time duration of a segment in milliseconds, I.e. time elapsed from \
         StartTimestampMillis to EndTimestampMillis.\n"]
  end_timestamp_millis : u_long option;
      [@ocaml.doc
        "The time in milliseconds defining the end of the timeline segment containing a \
         continuously detected label.\n"]
  start_timestamp_millis : u_long option;
      [@ocaml.doc
        "The time in milliseconds defining the start of the timeline segment containing a \
         continuously detected label.\n"]
  label : label option; [@ocaml.doc "Details about the detected label.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "Time, in milliseconds from the start of the video, that the label was detected. Note that \
         [Timestamp] is not guaranteed to be accurate to the individual frame where the label \
         first appears.\n"]
}
[@@ocaml.doc
  "Information about a label detected in a video analysis request and the time the label was \
   detected in the video. \n"]

type nonrec label_detections = label_detection list [@@ocaml.doc ""]

type nonrec label_detection_sort_by = TIMESTAMP [@ocaml.doc ""] | NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec label_detection_aggregate_by = SEGMENTS [@ocaml.doc ""] | TIMESTAMPS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_label_detection_request_metadata = {
  aggregate_by : label_detection_aggregate_by option;
      [@ocaml.doc "The aggregation method chosen for a GetLabelDetection request.\n"]
  sort_by : label_detection_sort_by option;
      [@ocaml.doc "The sorting method chosen for a GetLabelDetection request.\n"]
}
[@@ocaml.doc
  "Contains metadata about a label detection request, including the SortBy and AggregateBy options.\n"]

type nonrec get_label_detection_response = {
  get_request_metadata : get_label_detection_request_metadata option;
      [@ocaml.doc
        "Information about the paramters used when getting a response. Includes information on \
         aggregation and sorting methods.\n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "A job identifier specified in the call to StartLabelDetection and returned in the job \
         completion notification sent to your Amazon Simple Notification Service topic.\n"]
  video : video option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "Job identifier for the label detection operation for which you want to obtain results. \
         The job identifer is returned by an initial call to StartLabelDetection.\n"]
  label_model_version : string_ option;
      [@ocaml.doc "Version number of the label detection model that was used to detect labels.\n"]
  labels : label_detections option;
      [@ocaml.doc
        "An array of labels detected in the video. Each element contains the detected label and \
         the time, in milliseconds from the start of the video, that the label was detected. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition Video returns this token that you can \
         use in the subsequent request to retrieve the next set of labels.\n"]
  video_metadata : video_metadata option;
      [@ocaml.doc
        "Information about a video that Amazon Rekognition Video analyzed. [Videometadata] is \
         returned in every page of paginated responses from a Amazon Rekognition video operation.\n"]
  status_message : status_message option;
      [@ocaml.doc "If the job fails, [StatusMessage] provides a descriptive error message.\n"]
  job_status : video_job_status option;
      [@ocaml.doc "The current status of the label detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_label_detection_request = {
  aggregate_by : label_detection_aggregate_by option;
      [@ocaml.doc
        "Defines how to aggregate the returned results. Results can be aggregated by timestamps or \
         segments.\n"]
  sort_by : label_detection_sort_by option;
      [@ocaml.doc
        "Sort to use for elements in the [Labels] array. Use [TIMESTAMP] to sort array elements by \
         the time labels are detected. Use [NAME] to alphabetically group elements for a label \
         together. Within each label group, the array element are sorted by detection confidence. \
         The default sort is by [TIMESTAMP].\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more labels to retrieve), \
         Amazon Rekognition Video returns a pagination token in the response. You can use this \
         pagination token to retrieve the next set of labels. \n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of results to return per paginated call. The largest value you can specify \
         is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. \
         The default value is 1000.\n"]
  job_id : job_id;
      [@ocaml.doc
        "Job identifier for the label detection operation for which you want results returned. You \
         get the job identifer from an initial call to [StartlabelDetection].\n"]
}
[@@ocaml.doc ""]

type nonrec person_match = {
  face_matches : face_match_list option;
      [@ocaml.doc
        "Information about the faces in the input collection that match the face of a person in \
         the video.\n"]
  person : person_detail option; [@ocaml.doc "Information about the matched person.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "The time, in milliseconds from the beginning of the video, that the person was matched in \
         the video.\n"]
}
[@@ocaml.doc
  "Information about a person whose face matches a face(s) in an Amazon Rekognition collection. \
   Includes information about the faces in the Amazon Rekognition collection ([FaceMatch]), \
   information about the person ([PersonDetail]), and the time stamp for when the person was \
   detected in a video. An array of [PersonMatch] objects is returned by [GetFaceSearch]. \n"]

type nonrec person_matches = person_match list [@@ocaml.doc ""]

type nonrec get_face_search_response = {
  job_tag : job_tag option;
      [@ocaml.doc
        "A job identifier specified in the call to StartFaceSearch and returned in the job \
         completion notification sent to your Amazon Simple Notification Service topic.\n"]
  video : video option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "Job identifier for the face search operation for which you want to obtain results. The \
         job identifer is returned by an initial call to StartFaceSearch.\n"]
  persons : person_matches option;
      [@ocaml.doc
        "An array of persons, [PersonMatch], in the video whose face(s) match the face(s) in an \
         Amazon Rekognition collection. It also includes time information for when persons are \
         matched in the video. You specify the input collection in an initial call to \
         [StartFaceSearch]. Each [Persons] element includes a time the person was matched, face \
         match details ([FaceMatches]) for matching faces in the collection, and person \
         information ([Person]) for the matched person. \n"]
  video_metadata : video_metadata option;
      [@ocaml.doc
        "Information about a video that Amazon Rekognition analyzed. [Videometadata] is returned \
         in every page of paginated responses from a Amazon Rekognition Video operation. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition Video returns this token that you can \
         use in the subsequent request to retrieve the next set of search results. \n"]
  status_message : status_message option;
      [@ocaml.doc "If the job fails, [StatusMessage] provides a descriptive error message.\n"]
  job_status : video_job_status option; [@ocaml.doc "The current status of the face search job.\n"]
}
[@@ocaml.doc ""]

type nonrec face_search_sort_by = TIMESTAMP [@ocaml.doc ""] | INDEX [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_face_search_request = {
  sort_by : face_search_sort_by option;
      [@ocaml.doc
        "Sort to use for grouping faces in the response. Use [TIMESTAMP] to group faces by the \
         time that they are recognized. Use [INDEX] to sort by recognized faces. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more search results to \
         retrieve), Amazon Rekognition Video returns a pagination token in the response. You can \
         use this pagination token to retrieve the next set of search results. \n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of results to return per paginated call. The largest value you can specify \
         is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. \
         The default value is 1000.\n"]
  job_id : job_id;
      [@ocaml.doc
        "The job identifer for the search request. You get the job identifier from an initial call \
         to [StartFaceSearch].\n"]
}
[@@ocaml.doc ""]

type nonrec liveness_session_id = string [@@ocaml.doc ""]

type nonrec liveness_session_status =
  | EXPIRED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec liveness_image_blob = bytes [@@ocaml.doc ""]

type nonrec audit_image = {
  bounding_box : bounding_box option; [@ocaml.doc ""]
  s3_object : s3_object option; [@ocaml.doc ""]
  bytes : liveness_image_blob option;
      [@ocaml.doc
        "The Base64-encoded bytes representing an image selected from the Face Liveness video and \
         returned for audit purposes.\n"]
}
[@@ocaml.doc
  "An image that is picked from the Face Liveness video and returned for audit trail purposes, \
   returned as Base64-encoded bytes.\n"]

type nonrec audit_images = audit_image list [@@ocaml.doc ""]

type nonrec challenge_type =
  | FACE_MOVEMENT_CHALLENGE [@ocaml.doc ""]
  | FACE_MOVEMENT_AND_LIGHT_CHALLENGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec challenge = {
  version : version;
      [@ocaml.doc "The version of the challenge being used for the Face Liveness session.\n"]
  type_ : challenge_type;
      [@ocaml.doc "The type of the challenge being used for the Face Liveness session.\n"]
}
[@@ocaml.doc
  "Describes the type and version of the challenge being used for the Face Liveness session.\n"]

type nonrec get_face_liveness_session_results_response = {
  challenge : challenge option;
      [@ocaml.doc
        "Contains information regarding the challenge type used for the Face Liveness check.\n"]
  audit_images : audit_images option;
      [@ocaml.doc
        "A set of images from the Face Liveness video that can be used for audit purposes. It \
         includes a bounding box of the face and the Base64-encoded bytes that return an image. If \
         the CreateFaceLivenessSession request included an OutputConfig argument, the image will \
         be uploaded to an S3Object specified in the output configuration. If no Amazon S3 bucket \
         is defined, raw bytes are sent instead.\n"]
  reference_image : audit_image option;
      [@ocaml.doc
        "A high-quality image from the Face Liveness video that can be used for face comparison or \
         search. It includes a bounding box of the face and the Base64-encoded bytes that return \
         an image. If the CreateFaceLivenessSession request included an OutputConfig argument, the \
         image will be uploaded to an S3Object specified in the output configuration. In case the \
         reference image is not returned, it's recommended to retry the Liveness check.\n"]
  confidence : percent option;
      [@ocaml.doc
        "Probabalistic confidence score for if the person in the given video was live, represented \
         as a float value between 0 to 100.\n"]
  status : liveness_session_status;
      [@ocaml.doc
        "Represents a status corresponding to the state of the session. Possible statuses are: \
         CREATED, IN_PROGRESS, SUCCEEDED, FAILED, EXPIRED.\n"]
  session_id : liveness_session_id; [@ocaml.doc "The sessionId for which this request was called.\n"]
}
[@@ocaml.doc ""]

type nonrec get_face_liveness_session_results_request = {
  session_id : liveness_session_id;
      [@ocaml.doc
        "A unique 128-bit UUID. This is used to uniquely identify the session and also acts as an \
         idempotency token for all operations associated with the session.\n"]
}
[@@ocaml.doc ""]

type nonrec face_detection = {
  face : face_detail option; [@ocaml.doc "The face properties for the detected face.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "Time, in milliseconds from the start of the video, that the face was detected. Note that \
         [Timestamp] is not guaranteed to be accurate to the individual frame where the face first \
         appears.\n"]
}
[@@ocaml.doc
  "Information about a face detected in a video analysis request and the time the face was \
   detected in the video. \n"]

type nonrec face_detections = face_detection list [@@ocaml.doc ""]

type nonrec get_face_detection_response = {
  job_tag : job_tag option;
      [@ocaml.doc
        "A job identifier specified in the call to StartFaceDetection and returned in the job \
         completion notification sent to your Amazon Simple Notification Service topic.\n"]
  video : video option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "Job identifier for the face detection operation for which you want to obtain results. The \
         job identifer is returned by an initial call to StartFaceDetection.\n"]
  faces : face_detections option;
      [@ocaml.doc
        "An array of faces detected in the video. Each element contains a detected face's details \
         and the time, in milliseconds from the start of the video, the face was detected. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition returns this token that you can use in \
         the subsequent request to retrieve the next set of faces. \n"]
  video_metadata : video_metadata option;
      [@ocaml.doc
        "Information about a video that Amazon Rekognition Video analyzed. [Videometadata] is \
         returned in every page of paginated responses from a Amazon Rekognition video operation.\n"]
  status_message : status_message option;
      [@ocaml.doc "If the job fails, [StatusMessage] provides a descriptive error message.\n"]
  job_status : video_job_status option;
      [@ocaml.doc "The current status of the face detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_face_detection_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there are more faces to retrieve), \
         Amazon Rekognition Video returns a pagination token in the response. You can use this \
         pagination token to retrieve the next set of faces.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of results to return per paginated call. The largest value you can specify \
         is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. \
         The default value is 1000.\n"]
  job_id : job_id;
      [@ocaml.doc
        "Unique identifier for the face detection job. The [JobId] is returned from \
         [StartFaceDetection].\n"]
}
[@@ocaml.doc ""]

type nonrec moderation_label = {
  taxonomy_level : u_integer option;
      [@ocaml.doc "The level of the moderation label with regard to its taxonomy, from 1 to 3.\n"]
  parent_name : string_ option;
      [@ocaml.doc
        "The name for the parent label. Labels at the top level of the hierarchy have the parent \
         label [\"\"].\n"]
  name : string_ option;
      [@ocaml.doc "The label name for the type of unsafe content detected in the image.\n"]
  confidence : percent option;
      [@ocaml.doc
        "Specifies the confidence that Amazon Rekognition has that the label has been correctly \
         identified.\n\n\
        \ If you don't specify the [MinConfidence] parameter in the call to \
         [DetectModerationLabels], the operation returns labels with a confidence value greater \
         than or equal to 50 percent.\n\
        \ "]
}
[@@ocaml.doc
  "Provides information about a single type of inappropriate, unwanted, or offensive content found \
   in an image or video. Each type of moderated content has a label within a hierarchical \
   taxonomy. For more information, see Content moderation in the Amazon Rekognition Developer \
   Guide.\n"]

type nonrec content_type = {
  name : string_ option; [@ocaml.doc "The name of the label\n"]
  confidence : percent option; [@ocaml.doc "The confidence level of the label given\n"]
}
[@@ocaml.doc "Contains information regarding the confidence and name of a detected content type.\n"]

type nonrec content_types = content_type list [@@ocaml.doc ""]

type nonrec content_moderation_detection = {
  content_types : content_types option;
      [@ocaml.doc
        "A list of predicted results for the type of content an image contains. For example, the \
         image content might be from animation, sports, or a video game.\n"]
  duration_millis : u_long option;
      [@ocaml.doc
        " The time duration of a segment in milliseconds, I.e. time elapsed from \
         StartTimestampMillis to EndTimestampMillis. \n"]
  end_timestamp_millis : u_long option;
      [@ocaml.doc
        " The time in milliseconds defining the end of the timeline segment containing a \
         continuously detected moderation label. \n"]
  start_timestamp_millis : u_long option;
      [@ocaml.doc
        "The time in milliseconds defining the start of the timeline segment containing a \
         continuously detected moderation label.\n"]
  moderation_label : moderation_label option;
      [@ocaml.doc "The content moderation label detected by in the stored video.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "Time, in milliseconds from the beginning of the video, that the content moderation label \
         was detected. Note that [Timestamp] is not guaranteed to be accurate to the individual \
         frame where the moderated content first appears.\n"]
}
[@@ocaml.doc
  "Information about an inappropriate, unwanted, or offensive content label detection in a stored \
   video.\n"]

type nonrec content_moderation_detections = content_moderation_detection list [@@ocaml.doc ""]

type nonrec content_moderation_sort_by = TIMESTAMP [@ocaml.doc ""] | NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec content_moderation_aggregate_by =
  | SEGMENTS [@ocaml.doc ""]
  | TIMESTAMPS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_content_moderation_request_metadata = {
  aggregate_by : content_moderation_aggregate_by option;
      [@ocaml.doc "The aggregation method chosen for a GetContentModeration request.\n"]
  sort_by : content_moderation_sort_by option;
      [@ocaml.doc "The sorting method chosen for a GetContentModeration request.\n"]
}
[@@ocaml.doc
  "Contains metadata about a content moderation request, including the SortBy and AggregateBy \
   options.\n"]

type nonrec get_content_moderation_response = {
  get_request_metadata : get_content_moderation_request_metadata option;
      [@ocaml.doc
        "Information about the paramters used when getting a response. Includes information on \
         aggregation and sorting methods.\n"]
  job_tag : job_tag option;
      [@ocaml.doc
        "A job identifier specified in the call to StartContentModeration and returned in the job \
         completion notification sent to your Amazon Simple Notification Service topic.\n"]
  video : video option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "Job identifier for the content moderation operation for which you want to obtain results. \
         The job identifer is returned by an initial call to StartContentModeration.\n"]
  moderation_model_version : string_ option;
      [@ocaml.doc
        "Version number of the moderation detection model that was used to detect inappropriate, \
         unwanted, or offensive content.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition Video returns this token that you can \
         use in the subsequent request to retrieve the next set of content moderation labels. \n"]
  moderation_labels : content_moderation_detections option;
      [@ocaml.doc
        "The detected inappropriate, unwanted, or offensive content moderation labels and the \
         time(s) they were detected.\n"]
  video_metadata : video_metadata option;
      [@ocaml.doc
        "Information about a video that Amazon Rekognition analyzed. [Videometadata] is returned \
         in every page of paginated responses from [GetContentModeration]. \n"]
  status_message : status_message option;
      [@ocaml.doc "If the job fails, [StatusMessage] provides a descriptive error message.\n"]
  job_status : video_job_status option;
      [@ocaml.doc "The current status of the content moderation analysis job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_content_moderation_request = {
  aggregate_by : content_moderation_aggregate_by option;
      [@ocaml.doc
        "Defines how to aggregate results of the StartContentModeration request. Default \
         aggregation option is TIMESTAMPS. SEGMENTS mode aggregates moderation labels over time.\n"]
  sort_by : content_moderation_sort_by option;
      [@ocaml.doc
        "Sort to use for elements in the [ModerationLabelDetections] array. Use [TIMESTAMP] to \
         sort array elements by the time labels are detected. Use [NAME] to alphabetically group \
         elements for a label together. Within each label group, the array element are sorted by \
         detection confidence. The default sort is by [TIMESTAMP].\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more data to retrieve), Amazon \
         Rekognition returns a pagination token in the response. You can use this pagination token \
         to retrieve the next set of content moderation labels.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of results to return per paginated call. The largest value you can specify \
         is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. \
         The default value is 1000.\n"]
  job_id : job_id;
      [@ocaml.doc
        "The identifier for the inappropriate, unwanted, or offensive content moderation job. Use \
         [JobId] to identify the job in a subsequent call to [GetContentModeration].\n"]
}
[@@ocaml.doc ""]

type nonrec celebrity_detail = {
  known_gender : known_gender option; [@ocaml.doc "Retrieves the known gender for the celebrity.\n"]
  face : face_detail option; [@ocaml.doc "Face details for the recognized celebrity.\n"]
  bounding_box : bounding_box option; [@ocaml.doc "Bounding box around the body of a celebrity.\n"]
  confidence : percent option;
      [@ocaml.doc
        "The confidence, in percentage, that Amazon Rekognition has that the recognized face is \
         the celebrity. \n"]
  id : rekognition_unique_id option; [@ocaml.doc "The unique identifier for the celebrity. \n"]
  name : string_ option; [@ocaml.doc "The name of the celebrity.\n"]
  urls : urls option;
      [@ocaml.doc "An array of URLs pointing to additional celebrity information. \n"]
}
[@@ocaml.doc "Information about a recognized celebrity.\n"]

type nonrec celebrity_recognition = {
  celebrity : celebrity_detail option; [@ocaml.doc "Information about a recognized celebrity.\n"]
  timestamp : timestamp option;
      [@ocaml.doc
        "The time, in milliseconds from the start of the video, that the celebrity was recognized. \
         Note that [Timestamp] is not guaranteed to be accurate to the individual frame where the \
         celebrity first appears.\n"]
}
[@@ocaml.doc
  "Information about a detected celebrity and the time the celebrity was detected in a stored \
   video. For more information, see GetCelebrityRecognition in the Amazon Rekognition Developer \
   Guide.\n"]

type nonrec celebrity_recognitions = celebrity_recognition list [@@ocaml.doc ""]

type nonrec get_celebrity_recognition_response = {
  job_tag : job_tag option;
      [@ocaml.doc
        "A job identifier specified in the call to StartCelebrityRecognition and returned in the \
         job completion notification sent to your Amazon Simple Notification Service topic.\n"]
  video : video option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "Job identifier for the celebrity recognition operation for which you want to obtain \
         results. The job identifer is returned by an initial call to StartCelebrityRecognition.\n"]
  celebrities : celebrity_recognitions option;
      [@ocaml.doc "Array of celebrities recognized in the video.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Rekognition Video returns this token that you can \
         use in the subsequent request to retrieve the next set of celebrities.\n"]
  video_metadata : video_metadata option;
      [@ocaml.doc
        "Information about a video that Amazon Rekognition Video analyzed. [Videometadata] is \
         returned in every page of paginated responses from a Amazon Rekognition Video operation.\n"]
  status_message : status_message option;
      [@ocaml.doc "If the job fails, [StatusMessage] provides a descriptive error message.\n"]
  job_status : video_job_status option;
      [@ocaml.doc "The current status of the celebrity recognition job.\n"]
}
[@@ocaml.doc ""]

type nonrec celebrity_recognition_sort_by = TIMESTAMP [@ocaml.doc ""] | ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_celebrity_recognition_request = {
  sort_by : celebrity_recognition_sort_by option;
      [@ocaml.doc
        "Sort to use for celebrities returned in [Celebrities] field. Specify [ID] to sort by the \
         celebrity identifier, specify [TIMESTAMP] to sort by the time the celebrity was \
         recognized.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more recognized celebrities to \
         retrieve), Amazon Rekognition Video returns a pagination token in the response. You can \
         use this pagination token to retrieve the next set of celebrities. \n"]
  max_results : max_results option;
      [@ocaml.doc
        "Maximum number of results to return per paginated call. The largest value you can specify \
         is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. \
         The default value is 1000.\n"]
  job_id : job_id;
      [@ocaml.doc
        "Job identifier for the required celebrity recognition analysis. You can get the job \
         identifer from a call to [StartCelebrityRecognition].\n"]
}
[@@ocaml.doc ""]

type nonrec get_celebrity_info_response = {
  known_gender : known_gender option; [@ocaml.doc "Retrieves the known gender for the celebrity.\n"]
  name : string_ option; [@ocaml.doc "The name of the celebrity.\n"]
  urls : urls option;
      [@ocaml.doc "An array of URLs pointing to additional celebrity information. \n"]
}
[@@ocaml.doc ""]

type nonrec get_celebrity_info_request = {
  id : rekognition_unique_id;
      [@ocaml.doc
        "The ID for the celebrity. You get the celebrity ID from a call to the \
         [RecognizeCelebrities] operation, which recognizes celebrities in an image. \n"]
}
[@@ocaml.doc ""]

type nonrec distribute_dataset_entries_response = unit [@@ocaml.doc ""]

type nonrec distribute_dataset = {
  arn : dataset_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset that you want to use. \n"]
}
[@@ocaml.doc
  " A training dataset or a test dataset used in a dataset distribution operation. For more \
   information, see [DistributeDatasetEntries]. \n"]

type nonrec distribute_dataset_metadata_list = distribute_dataset list [@@ocaml.doc ""]

type nonrec distribute_dataset_entries_request = {
  datasets : distribute_dataset_metadata_list;
      [@ocaml.doc
        "The ARNS for the training dataset and test dataset that you want to use. The datasets \
         must belong to the same project. The test dataset must be empty. \n"]
}
[@@ocaml.doc ""]

type nonrec conflict_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " A User with the same Id already exists within the collection, or the update or deletion of the \
   User caused an inconsistent state. ** \n"]

type nonrec disassociated_face = {
  face_id : face_id option; [@ocaml.doc "Unique identifier assigned to the face.\n"]
}
[@@ocaml.doc
  "Provides face metadata for the faces that are disassociated from a specific UserID.\n"]

type nonrec disassociated_faces_list = disassociated_face list [@@ocaml.doc ""]

type nonrec disassociate_faces_response = {
  user_status : user_status option;
      [@ocaml.doc
        "The status of an update made to a User. Reflects if the User has been updated for every \
         requested change.\n"]
  unsuccessful_face_disassociations : unsuccessful_face_disassociation_list option;
      [@ocaml.doc
        "An array of UnsuccessfulDisassociation objects containing FaceIds that are not \
         successfully associated, along with the reasons for the failure to associate. Returned if \
         the DisassociateFaces action is successful.\n"]
  disassociated_faces : disassociated_faces_list option;
      [@ocaml.doc
        "An array of DissociatedFace objects containing FaceIds that are successfully \
         disassociated with the UserID is returned. Returned if the DisassociatedFaces action is \
         successful.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_faces_request = {
  face_ids : user_face_id_list;
      [@ocaml.doc "An array of face IDs to disassociate from the UserID. \n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the request to [DisassociateFaces]. If you use the same \
         token with multiple [DisassociateFaces] requests, the same response is returned. Use \
         ClientRequestToken to prevent the same request from being processed more than once.\n"]
  user_id : user_id; [@ocaml.doc "ID for the existing UserID.\n"]
  collection_id : collection_id;
      [@ocaml.doc "The ID of an existing collection containing the UserID.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_text_response = {
  text_model_version : string_ option; [@ocaml.doc "The model version used to detect text.\n"]
  text_detections : text_detection_list option;
      [@ocaml.doc "An array of text that was detected in the input image.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_text_filters = {
  regions_of_interest : regions_of_interest option;
      [@ocaml.doc
        " A Filter focusing on a certain area of the image. Uses a [BoundingBox] object to set the \
         region of the image.\n"]
  word_filter : detection_filter option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A set of optional parameters that you can use to set the criteria that the text must meet to be \
   included in your response. [WordFilter] looks at a word\226\128\153s height, width, and minimum \
   confidence. [RegionOfInterest] lets you set a specific region of the image to look for text in. \n"]

type nonrec detect_text_request = {
  filters : detect_text_filters option;
      [@ocaml.doc
        "Optional parameters that let you set the criteria that the text must meet to be included \
         in your response.\n"]
  image : image;
      [@ocaml.doc
        "The input image as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to \
         call Amazon Rekognition operations, you can't pass image bytes. \n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec body_part =
  | RIGHT_HAND [@ocaml.doc ""]
  | LEFT_HAND [@ocaml.doc ""]
  | HEAD [@ocaml.doc ""]
  | FACE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec protective_equipment_type =
  | HEAD_COVER [@ocaml.doc ""]
  | HAND_COVER [@ocaml.doc ""]
  | FACE_COVER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec covers_body_part = {
  value : boolean_ option;
      [@ocaml.doc "True if the PPE covers the corresponding body part, otherwise false.\n"]
  confidence : percent option;
      [@ocaml.doc "The confidence that Amazon Rekognition has in the value of [Value].\n"]
}
[@@ocaml.doc
  "Information about an item of Personal Protective Equipment covering a corresponding body part. \
   For more information, see [DetectProtectiveEquipment].\n"]

type nonrec equipment_detection = {
  covers_body_part : covers_body_part option;
      [@ocaml.doc "Information about the body part covered by the detected PPE.\n"]
  type_ : protective_equipment_type option; [@ocaml.doc "The type of detected PPE.\n"]
  confidence : percent option;
      [@ocaml.doc
        "The confidence that Amazon Rekognition has that the bounding box ([BoundingBox]) contains \
         an item of PPE.\n"]
  bounding_box : bounding_box option;
      [@ocaml.doc "A bounding box surrounding the item of detected PPE.\n"]
}
[@@ocaml.doc
  "Information about an item of Personal Protective Equipment (PPE) detected by \
   [DetectProtectiveEquipment]. For more information, see [DetectProtectiveEquipment].\n"]

type nonrec equipment_detections = equipment_detection list [@@ocaml.doc ""]

type nonrec protective_equipment_body_part = {
  equipment_detections : equipment_detections option;
      [@ocaml.doc "An array of Personal Protective Equipment items detected around a body part.\n"]
  confidence : percent option;
      [@ocaml.doc
        "The confidence that Amazon Rekognition has in the detection accuracy of the detected body \
         part. \n"]
  name : body_part option; [@ocaml.doc "The detected body part.\n"]
}
[@@ocaml.doc
  "Information about a body part detected by [DetectProtectiveEquipment] that contains PPE. An \
   array of [ProtectiveEquipmentBodyPart] objects is returned for each person detected by \
   [DetectProtectiveEquipment]. \n"]

type nonrec body_parts = protective_equipment_body_part list [@@ocaml.doc ""]

type nonrec protective_equipment_person = {
  id : u_integer option;
      [@ocaml.doc
        "The identifier for the detected person. The identifier is only unique for a single call \
         to [DetectProtectiveEquipment].\n"]
  confidence : percent option;
      [@ocaml.doc
        "The confidence that Amazon Rekognition has that the bounding box contains a person.\n"]
  bounding_box : bounding_box option; [@ocaml.doc "A bounding box around the detected person.\n"]
  body_parts : body_parts option;
      [@ocaml.doc
        "An array of body parts detected on a person's body (including body parts without PPE). \n"]
}
[@@ocaml.doc
  "A person detected by a call to [DetectProtectiveEquipment]. The API returns all persons \
   detected in the input image in an array of [ProtectiveEquipmentPerson] objects.\n"]

type nonrec protective_equipment_persons = protective_equipment_person list [@@ocaml.doc ""]

type nonrec protective_equipment_person_ids = u_integer list [@@ocaml.doc ""]

type nonrec protective_equipment_summary = {
  persons_indeterminate : protective_equipment_person_ids option;
      [@ocaml.doc
        "An array of IDs for persons where it was not possible to determine if they are wearing \
         personal protective equipment. \n"]
  persons_without_required_equipment : protective_equipment_person_ids option;
      [@ocaml.doc
        "An array of IDs for persons who are not wearing all of the types of PPE specified in the \
         [RequiredEquipmentTypes] field of the detected personal protective equipment. \n"]
  persons_with_required_equipment : protective_equipment_person_ids option;
      [@ocaml.doc
        "An array of IDs for persons who are wearing detected personal protective equipment. \n"]
}
[@@ocaml.doc
  "Summary information for required items of personal protective equipment (PPE) detected on \
   persons by a call to [DetectProtectiveEquipment]. You specify the required type of PPE in the \
   [SummarizationAttributes] ([ProtectiveEquipmentSummarizationAttributes]) input parameter. The \
   summary includes which persons were detected wearing the required personal protective equipment \
   ([PersonsWithRequiredEquipment]), which persons were detected as not wearing the required PPE \
   ([PersonsWithoutRequiredEquipment]), and the persons in which a determination could not be made \
   ([PersonsIndeterminate]).\n\n\
  \ To get a total for each category, use the size of the field array. For example, to find out \
   how many people were detected as wearing the specified PPE, use the size of the \
   [PersonsWithRequiredEquipment] array. If you want to find out more about a person, such as the \
   location ([BoundingBox]) of the person on the image, use the person ID in each array element. \
   Each person ID matches the ID field of a [ProtectiveEquipmentPerson] object returned in the \
   [Persons] array by [DetectProtectiveEquipment].\n\
  \ "]

type nonrec detect_protective_equipment_response = {
  summary : protective_equipment_summary option;
      [@ocaml.doc
        "Summary information for the types of PPE specified in the [SummarizationAttributes] input \
         parameter.\n"]
  persons : protective_equipment_persons option;
      [@ocaml.doc
        "An array of persons detected in the image (including persons not wearing PPE).\n"]
  protective_equipment_model_version : string_ option;
      [@ocaml.doc
        "The version number of the PPE detection model used to detect PPE in the image.\n"]
}
[@@ocaml.doc ""]

type nonrec protective_equipment_types = protective_equipment_type list [@@ocaml.doc ""]

type nonrec protective_equipment_summarization_attributes = {
  required_equipment_types : protective_equipment_types;
      [@ocaml.doc
        "An array of personal protective equipment types for which you want summary information. \
         If a person is detected wearing a required requipment type, the person's ID is added to \
         the [PersonsWithRequiredEquipment] array field returned in [ProtectiveEquipmentSummary] \
         by [DetectProtectiveEquipment]. \n"]
  min_confidence : percent;
      [@ocaml.doc
        "The minimum confidence level for which you want summary information. The confidence level \
         applies to person detection, body part detection, equipment detection, and body part \
         coverage. Amazon Rekognition doesn't return summary information with a confidence than \
         this specified value. There isn't a default value.\n\n\
        \ Specify a [MinConfidence] value that is between 50-100% as [DetectProtectiveEquipment] \
         returns predictions only where the detection confidence is between 50% - 100%. If you \
         specify a value that is less than 50%, the results are the same specifying a value of 50%.\n\
        \ \n\
        \   \n\
        \  "]
}
[@@ocaml.doc
  "Specifies summary attributes to return from a call to [DetectProtectiveEquipment]. You can \
   specify which types of PPE to summarize. You can also specify a minimum confidence value for \
   detections. Summary information is returned in the [Summary] ([ProtectiveEquipmentSummary]) \
   field of the response from [DetectProtectiveEquipment]. The summary includes which persons in \
   an image were detected wearing the requested types of person protective equipment (PPE), which \
   persons were detected as not wearing PPE, and the persons in which a determination could not be \
   made. For more information, see [ProtectiveEquipmentSummary].\n"]

type nonrec detect_protective_equipment_request = {
  summarization_attributes : protective_equipment_summarization_attributes option;
      [@ocaml.doc "An array of PPE types that you want to summarize.\n"]
  image : image;
      [@ocaml.doc
        "The image in which you want to detect PPE on detected persons. The image can be passed as \
         image bytes or you can reference an image stored in an Amazon S3 bucket. \n"]
}
[@@ocaml.doc ""]

type nonrec human_loop_quota_exceeded_exception = {
  logref : string_ option; [@ocaml.doc "A universally unique identifier (UUID) for the request.\n"]
  code : string_ option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
  service_code : string_ option; [@ocaml.doc "The service code.\n"]
  quota_code : string_ option; [@ocaml.doc "The quota code.\n"]
  resource_type : string_ option; [@ocaml.doc "The resource type.\n"]
}
[@@ocaml.doc "The number of in-progress human reviews you have has exceeded the number allowed.\n"]

type nonrec moderation_labels = moderation_label list [@@ocaml.doc ""]

type nonrec human_loop_arn = string [@@ocaml.doc ""]

type nonrec human_loop_activation_reason = string [@@ocaml.doc ""]

type nonrec human_loop_activation_reasons = human_loop_activation_reason list [@@ocaml.doc ""]

type nonrec human_loop_activation_output = {
  human_loop_activation_conditions_evaluation_results :
    synthesized_json_human_loop_activation_conditions_evaluation_results option;
      [@ocaml.doc
        "Shows the result of condition evaluations, including those conditions which activated a \
         human review.\n"]
  human_loop_activation_reasons : human_loop_activation_reasons option;
      [@ocaml.doc "Shows if and why human review was needed.\n"]
  human_loop_arn : human_loop_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the HumanLoop created.\n"]
}
[@@ocaml.doc
  "Shows the results of the human in the loop evaluation. If there is no HumanLoopArn, the input \
   did not trigger human review.\n"]

type nonrec detect_moderation_labels_response = {
  content_types : content_types option;
      [@ocaml.doc
        "A list of predicted results for the type of content an image contains. For example, the \
         image content might be from animation, sports, or a video game.\n"]
  project_version : project_version_id option;
      [@ocaml.doc
        "Identifier of the custom adapter that was used during inference. If during inference the \
         adapter was EXPIRED, then the parameter will not be returned, indicating that a base \
         moderation detection project version was used.\n"]
  human_loop_activation_output : human_loop_activation_output option;
      [@ocaml.doc "Shows the results of the human in the loop evaluation.\n"]
  moderation_model_version : string_ option;
      [@ocaml.doc
        "Version number of the base moderation detection model that was used to detect unsafe \
         content.\n"]
  moderation_labels : moderation_labels option;
      [@ocaml.doc
        "Array of detected Moderation labels. For video operations, this includes the time, in \
         milliseconds from the start of the video, they were detected.\n"]
}
[@@ocaml.doc ""]

type nonrec human_loop_name = string [@@ocaml.doc ""]

type nonrec flow_definition_arn = string [@@ocaml.doc ""]

type nonrec content_classifier =
  | FREE_OF_ADULT_CONTENT [@ocaml.doc ""]
  | FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec content_classifiers = content_classifier list [@@ocaml.doc ""]

type nonrec human_loop_data_attributes = {
  content_classifiers : content_classifiers option;
      [@ocaml.doc "Sets whether the input image is free of personally identifiable information.\n"]
}
[@@ocaml.doc
  "Allows you to set attributes of the image. Currently, you can declare an image as free of \
   personally identifiable information.\n"]

type nonrec human_loop_config = {
  data_attributes : human_loop_data_attributes option;
      [@ocaml.doc "Sets attributes of the input data.\n"]
  flow_definition_arn : flow_definition_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the flow definition. You can create a flow definition \
         by using the Amazon Sagemaker \
         {{:https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateFlowDefinition.html}CreateFlowDefinition} \
         Operation. \n"]
  human_loop_name : human_loop_name;
      [@ocaml.doc
        "The name of the human review used for this image. This should be kept unique within a \
         region.\n"]
}
[@@ocaml.doc
  "Sets up the flow definition the image will be sent to if one of the conditions is met. You can \
   also set certain attributes of the image before review.\n"]

type nonrec detect_moderation_labels_request = {
  project_version : project_version_id option;
      [@ocaml.doc
        "Identifier for the custom adapter. Expects the ProjectVersionArn as a value. Use the \
         CreateProject or CreateProjectVersion APIs to create a custom adapter.\n"]
  human_loop_config : human_loop_config option;
      [@ocaml.doc
        "Sets up the configuration for human evaluation, including the FlowDefinition the image \
         will be sent to.\n"]
  min_confidence : percent option;
      [@ocaml.doc
        "Specifies the minimum confidence level for the labels to return. Amazon Rekognition \
         doesn't return any labels with a confidence level lower than this specified value.\n\n\
        \ If you don't specify [MinConfidence], the operation returns labels with confidence \
         values greater than or equal to 50 percent.\n\
        \ "]
  image : image;
      [@ocaml.doc
        "The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call \
         Amazon Rekognition operations, passing base64-encoded image bytes is not supported. \n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec labels = label list [@@ocaml.doc ""]

type nonrec detect_labels_image_quality = {
  contrast : float_ option; [@ocaml.doc "The contrast of an image provided for label detection.\n"]
  sharpness : float_ option;
      [@ocaml.doc "The sharpness of an image provided for label detection.\n"]
  brightness : float_ option;
      [@ocaml.doc "The brightness of an image provided for label detection.\n"]
}
[@@ocaml.doc
  "The quality of an image provided for label detection, with regard to brightness, sharpness, and \
   contrast.\n"]

type nonrec detect_labels_image_foreground = {
  dominant_colors : dominant_colors option;
      [@ocaml.doc
        "The dominant colors found in the foreground of an image, defined with RGB values, CSS \
         color name, simplified color name, and PixelPercentage (the percentage of image pixels \
         that have a particular color).\n"]
  quality : detect_labels_image_quality option;
      [@ocaml.doc "The quality of the image foreground as defined by brightness and sharpness.\n"]
}
[@@ocaml.doc "The foreground of the image with regard to image quality and dominant colors.\n"]

type nonrec detect_labels_image_background = {
  dominant_colors : dominant_colors option;
      [@ocaml.doc
        "The dominant colors found in the background of an image, defined with RGB values, CSS \
         color name, simplified color name, and PixelPercentage (the percentage of image pixels \
         that have a particular color).\n"]
  quality : detect_labels_image_quality option;
      [@ocaml.doc "The quality of the image background as defined by brightness and sharpness.\n"]
}
[@@ocaml.doc "The background of the image with regard to image quality and dominant colors.\n"]

type nonrec detect_labels_image_properties = {
  background : detect_labels_image_background option;
      [@ocaml.doc
        "Information about the properties of an image\226\128\153s background, including the \
         background\226\128\153s quality and dominant colors, including the quality and dominant \
         colors of the image.\n"]
  foreground : detect_labels_image_foreground option;
      [@ocaml.doc
        "Information about the properties of an image\226\128\153s foreground, including the \
         foreground\226\128\153s quality and dominant colors, including the quality and dominant \
         colors of the image.\n"]
  dominant_colors : dominant_colors option;
      [@ocaml.doc
        "Information about the dominant colors found in an image, described with RGB values, CSS \
         color name, simplified color name, and PixelPercentage (the percentage of image pixels \
         that have a particular color).\n"]
  quality : detect_labels_image_quality option;
      [@ocaml.doc
        "Information about the quality of the image foreground as defined by brightness, \
         sharpness, and contrast. The higher the value the greater the brightness, sharpness, and \
         contrast respectively.\n"]
}
[@@ocaml.doc
  "Information about the quality and dominant colors of an input image. Quality and color \
   information is returned for the entire image, foreground, and background.\n"]

type nonrec detect_labels_response = {
  image_properties : detect_labels_image_properties option;
      [@ocaml.doc
        "Information about the properties of the input image, such as brightness, sharpness, \
         contrast, and dominant colors.\n"]
  label_model_version : string_ option;
      [@ocaml.doc "Version number of the label detection model that was used to detect labels.\n"]
  orientation_correction : orientation_correction option;
      [@ocaml.doc
        "The value of [OrientationCorrection] is always null.\n\n\
        \ If the input image is in .jpeg format, it might contain exchangeable image file format \
         (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this \
         orientation information to perform image correction. The bounding box coordinates are \
         translated to represent object locations after the orientation information in the Exif \
         metadata is used to correct the image orientation. Images in .png format don't contain \
         Exif metadata.\n\
        \ \n\
        \  Amazon Rekognition doesn\226\128\153t perform image correction for images in .png \
         format and .jpeg images without orientation information in the image Exif metadata. The \
         bounding box coordinates aren't translated and represent the object locations before the \
         image is rotated. \n\
        \  "]
  labels : labels option; [@ocaml.doc "An array of labels for the real-world objects detected. \n"]
}
[@@ocaml.doc ""]

type nonrec detect_labels_feature_name =
  | IMAGE_PROPERTIES [@ocaml.doc ""]
  | GENERAL_LABELS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec detect_labels_feature_list = detect_labels_feature_name list [@@ocaml.doc ""]

type nonrec detect_labels_max_dominant_colors = int [@@ocaml.doc ""]

type nonrec detect_labels_image_properties_settings = {
  max_dominant_colors : detect_labels_max_dominant_colors option;
      [@ocaml.doc
        "The maximum number of dominant colors to return when detecting labels in an image. The \
         default value is 10.\n"]
}
[@@ocaml.doc "Settings for the IMAGE_PROPERTIES feature type.\n"]

type nonrec detect_labels_settings = {
  image_properties : detect_labels_image_properties_settings option;
      [@ocaml.doc "Contains the chosen number of maximum dominant colors in an image.\n"]
  general_labels : general_labels_settings option;
      [@ocaml.doc "Contains the specified filters for GENERAL_LABELS.\n"]
}
[@@ocaml.doc
  "Settings for the DetectLabels request. Settings can include filters for both GENERAL_LABELS and \
   IMAGE_PROPERTIES. GENERAL_LABELS filters can be inclusive or exclusive and applied to \
   individual labels or label categories. IMAGE_PROPERTIES filters allow specification of a \
   maximum number of dominant colors.\n"]

type nonrec detect_labels_request = {
  settings : detect_labels_settings option;
      [@ocaml.doc
        "A list of the filters to be applied to returned detected labels and image properties. \
         Specified filters can be inclusive, exclusive, or a combination of both. Filters can be \
         used for individual labels or label categories. The exact label names or label categories \
         must be supplied. For a full list of labels and label categories, see \
         {{:https://docs.aws.amazon.com/rekognition/latest/dg/labels.html}Detecting labels}.\n"]
  features : detect_labels_feature_list option;
      [@ocaml.doc
        "A list of the types of analysis to perform. Specifying GENERAL_LABELS uses the label \
         detection feature, while specifying IMAGE_PROPERTIES returns information regarding image \
         color and quality. If no option is specified GENERAL_LABELS is used by default.\n"]
  min_confidence : percent option;
      [@ocaml.doc
        "Specifies the minimum confidence level for the labels to return. Amazon Rekognition \
         doesn't return any labels with confidence lower than this specified value.\n\n\
        \ If [MinConfidence] is not specified, the operation returns labels with a confidence \
         values greater than or equal to 55 percent. Only valid when GENERAL_LABELS is specified \
         as a feature type in the Feature input parameter.\n\
        \ "]
  max_labels : u_integer option;
      [@ocaml.doc
        "Maximum number of labels you want the service to return in the response. The service \
         returns the specified number of highest confidence labels. Only valid when GENERAL_LABELS \
         is specified as a feature type in the Feature input parameter.\n"]
  image : image;
      [@ocaml.doc
        "The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call \
         Amazon Rekognition operations, passing image bytes is not supported. Images stored in an \
         S3 Bucket do not need to be base64-encoded.\n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec face_detail_list = face_detail list [@@ocaml.doc ""]

type nonrec detect_faces_response = {
  orientation_correction : orientation_correction option;
      [@ocaml.doc
        "The value of [OrientationCorrection] is always null.\n\n\
        \ If the input image is in .jpeg format, it might contain exchangeable image file format \
         (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this \
         orientation information to perform image correction. The bounding box coordinates are \
         translated to represent object locations after the orientation information in the Exif \
         metadata is used to correct the image orientation. Images in .png format don't contain \
         Exif metadata.\n\
        \ \n\
        \  Amazon Rekognition doesn\226\128\153t perform image correction for images in .png \
         format and .jpeg images without orientation information in the image Exif metadata. The \
         bounding box coordinates aren't translated and represent the object locations before the \
         image is rotated. \n\
        \  "]
  face_details : face_detail_list option; [@ocaml.doc "Details of each face found in the image. \n"]
}
[@@ocaml.doc ""]

type nonrec detect_faces_request = {
  attributes : attributes option;
      [@ocaml.doc
        "An array of facial attributes you want to be returned. A [DEFAULT] subset of facial \
         attributes - [BoundingBox], [Confidence], [Pose], [Quality], and [Landmarks] - will \
         always be returned. You can request for specific facial attributes (in addition to the \
         default list) - by using \\[[\"DEFAULT\",\n\
        \        \"FACE_OCCLUDED\"]\\] or just \\[[\"FACE_OCCLUDED\"]\\]. You can request for all \
         facial attributes by using \\[[\"ALL\"\\]]. Requesting more attributes may increase \
         response time.\n\n\
        \ If you provide both, [\\[\"ALL\", \"DEFAULT\"\\]], the service uses a logical \"AND\" \
         operator to determine which attributes to return (in this case, all attributes). \n\
        \ \n\
        \  Note that while the FaceOccluded and EyeDirection attributes are supported when using \
         [DetectFaces], they aren't supported when analyzing videos with [StartFaceDetection] and \
         [GetFaceDetection].\n\
        \  "]
  image : image;
      [@ocaml.doc
        "The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call \
         Amazon Rekognition operations, passing base64-encoded image bytes is not supported. \n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec custom_label = {
  geometry : geometry option;
      [@ocaml.doc
        "The location of the detected object on the image that corresponds to the custom label. \
         Includes an axis aligned coarse bounding box surrounding the object and a finer grain \
         polygon for more accurate spatial information.\n"]
  confidence : percent option;
      [@ocaml.doc
        "The confidence that the model has in the detection of the custom label. The range is \
         0-100. A higher value indicates a higher confidence.\n"]
  name : string_ option; [@ocaml.doc "The name of the custom label.\n"]
}
[@@ocaml.doc "A custom label detected in an image by a call to [DetectCustomLabels].\n"]

type nonrec custom_labels = custom_label list [@@ocaml.doc ""]

type nonrec detect_custom_labels_response = {
  custom_labels : custom_labels option;
      [@ocaml.doc "An array of custom labels detected in the input image.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_custom_labels_request = {
  min_confidence : percent option;
      [@ocaml.doc
        "Specifies the minimum confidence level for the labels to return. [DetectCustomLabels] \
         doesn't return any labels with a confidence value that's lower than this specified value. \
         If you specify a value of 0, [DetectCustomLabels] returns all labels, regardless of the \
         assumed threshold applied to each label. If you don't specify a value for \
         [MinConfidence], [DetectCustomLabels] returns labels based on the assumed threshold of \
         each label.\n"]
  max_results : u_integer option;
      [@ocaml.doc
        "Maximum number of results you want the service to return in the response. The service \
         returns the specified number of highest confidence labels ranked from highest confidence \
         to lowest.\n"]
  image : image; [@ocaml.doc ""]
  project_version_arn : project_version_arn;
      [@ocaml.doc
        "The ARN of the model version that you want to use. Only models associated with Custom \
         Labels projects accepted by the operation. If a provided ARN refers to a model version \
         associated with a project for a different feature type, then an InvalidParameterException \
         is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stream_processor_response = {
  data_sharing_preference : stream_processor_data_sharing_preference option;
      [@ocaml.doc
        " Shows whether you are sharing data with Rekognition to improve model performance. You \
         can choose this option at the account level or on a per-stream basis. Note that if you \
         opt out at the account level this setting is ignored on individual streams. \n"]
  regions_of_interest : regions_of_interest option;
      [@ocaml.doc
        " Specifies locations in the frames where Amazon Rekognition checks for objects or people. \
         This is an optional parameter for label detection stream processors. \n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        " The identifier for your AWS Key Management Service key (AWS KMS key). This is an \
         optional parameter for label detection stream processors. \n"]
  notification_channel : stream_processor_notification_channel option; [@ocaml.doc ""]
  settings : stream_processor_settings option;
      [@ocaml.doc
        "Input parameters used in a streaming video analyzed by a stream processor. You can use \
         [FaceSearch] to recognize faces in a streaming video, or you can use [ConnectedHome] to \
         detect labels.\n"]
  role_arn : role_arn option;
      [@ocaml.doc "ARN of the IAM role that allows access to the stream processor.\n"]
  output : stream_processor_output option;
      [@ocaml.doc
        "Kinesis data stream to which Amazon Rekognition Video puts the analysis results.\n"]
  input : stream_processor_input option;
      [@ocaml.doc "Kinesis video stream that provides the source streaming video.\n"]
  last_update_timestamp : date_time option;
      [@ocaml.doc
        "The time, in Unix format, the stream processor was last updated. For example, when the \
         stream processor moves from a running state to a failed state, or when the user starts or \
         stops the stream processor.\n"]
  creation_timestamp : date_time option;
      [@ocaml.doc "Date and time the stream processor was created\n"]
  status_message : string_ option;
      [@ocaml.doc "Detailed status message about the stream processor.\n"]
  status : stream_processor_status option; [@ocaml.doc "Current status of the stream processor.\n"]
  stream_processor_arn : stream_processor_arn option; [@ocaml.doc "ARN of the stream processor.\n"]
  name : stream_processor_name option; [@ocaml.doc "Name of the stream processor. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_stream_processor_request = {
  name : stream_processor_name;
      [@ocaml.doc "Name of the stream processor for which you want information.\n"]
}
[@@ocaml.doc ""]

type nonrec output_config = {
  s3_key_prefix : s3_key_prefix option;
      [@ocaml.doc "The prefix applied to the training output files. \n"]
  s3_bucket : s3_bucket option; [@ocaml.doc "The S3 bucket where training output is placed.\n"]
}
[@@ocaml.doc "The S3 bucket and folder location where training output is placed.\n"]

type nonrec evaluation_result = {
  summary : summary option; [@ocaml.doc "The S3 bucket that contains the training summary.\n"]
  f1_score : float_ option;
      [@ocaml.doc
        "The F1 score for the evaluation of all labels. The F1 score metric evaluates the overall \
         precision and recall performance of the model as a single value. A higher value indicates \
         better precision and recall performance. A lower score indicates that precision, recall, \
         or both are performing poorly. \n"]
}
[@@ocaml.doc "The evaluation results for the training of a model.\n"]

type nonrec customization_feature =
  | CUSTOM_LABELS [@ocaml.doc ""]
  | CONTENT_MODERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec customization_feature_content_moderation_config = {
  confidence_threshold : percent option;
      [@ocaml.doc
        "The confidence level you plan to use to identify if unsafe content is present during \
         inference.\n"]
}
[@@ocaml.doc "Configuration options for Content Moderation training.\n"]

type nonrec customization_feature_config = {
  content_moderation : customization_feature_content_moderation_config option;
      [@ocaml.doc "Configuration options for Custom Moderation training.\n"]
}
[@@ocaml.doc
  "Feature specific configuration for the training job. Configuration provided for the job must \
   match the feature type parameter associated with project. If configuration and feature type do \
   not match an InvalidParameterException is returned.\n"]

type nonrec project_version_description = {
  feature_config : customization_feature_config option;
      [@ocaml.doc "Feature specific configuration that was applied during training.\n"]
  base_model_version : string_ option;
      [@ocaml.doc "The base detection model version used to create the project version.\n"]
  feature : customization_feature option; [@ocaml.doc "The feature that was customized.\n"]
  version_description : version_description option;
      [@ocaml.doc "A user-provided description of the project version.\n"]
  source_project_version_arn : project_version_arn option;
      [@ocaml.doc
        "If the model version was copied from a different project, [SourceProjectVersionArn] \
         contains the ARN of the source model version. \n"]
  max_inference_units : inference_units option;
      [@ocaml.doc
        "The maximum number of inference units Amazon Rekognition uses to auto-scale the model. \
         Applies only to Custom Labels projects. For more information, see [StartProjectVersion].\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The identifer for the AWS Key Management Service key (AWS KMS key) that was used to \
         encrypt the model during training. \n"]
  manifest_summary : ground_truth_manifest option;
      [@ocaml.doc
        "The location of the summary manifest. The summary manifest provides aggregate data \
         validation results for the training and test datasets.\n"]
  evaluation_result : evaluation_result option;
      [@ocaml.doc
        "The training results. [EvaluationResult] is only returned if training is successful.\n"]
  testing_data_result : testing_data_result option;
      [@ocaml.doc "Contains information about the testing results.\n"]
  training_data_result : training_data_result option;
      [@ocaml.doc "Contains information about the training results.\n"]
  output_config : output_config option;
      [@ocaml.doc "The location where training results are saved.\n"]
  training_end_timestamp : date_time option;
      [@ocaml.doc "The Unix date and time that training of the model ended.\n"]
  billable_training_time_in_seconds : u_long option;
      [@ocaml.doc
        "The duration, in seconds, that you were billed for a successful training of the model \
         version. This value is only returned if the model version has been successfully trained.\n"]
  status_message : status_message option;
      [@ocaml.doc "A descriptive message for an error or warning that occurred.\n"]
  status : project_version_status option; [@ocaml.doc "The current status of the model version.\n"]
  min_inference_units : inference_units option;
      [@ocaml.doc
        "The minimum number of inference units used by the model. Applies only to Custom Labels \
         projects. For more information, see [StartProjectVersion].\n"]
  creation_timestamp : date_time option;
      [@ocaml.doc "The Unix datetime for the date and time that training started.\n"]
  project_version_arn : project_version_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the project version. \n"]
}
[@@ocaml.doc "A description of a version of a Amazon Rekognition project version.\n"]

type nonrec project_version_descriptions = project_version_description list [@@ocaml.doc ""]

type nonrec describe_project_versions_response = {
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Amazon Rekognition returns a pagination token in the response. You can use this \
         pagination token to retrieve the next set of results. \n"]
  project_version_descriptions : project_version_descriptions option;
      [@ocaml.doc
        "A list of project version descriptions. The list is sorted by the creation date and time \
         of the project versions, latest to earliest.\n"]
}
[@@ocaml.doc ""]

type nonrec project_versions_page_size = int [@@ocaml.doc ""]

type nonrec describe_project_versions_request = {
  max_results : project_versions_page_size option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value you can \
         specify is 100. If you specify a value greater than 100, a ValidationException error \
         occurs. The default value is 100. \n"]
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Amazon Rekognition returns a pagination token in the response. You can use this \
         pagination token to retrieve the next set of results. \n"]
  version_names : version_names option;
      [@ocaml.doc
        "A list of model or project version names that you want to describe. You can add up to 10 \
         model or project version names to the list. If you don't specify a value, all project \
         version descriptions are returned. A version name is part of a project version ARN. For \
         example, [my-model.2020-01-21T09.10.15] is the version name in the following ARN. \n\
         {[\n\
         arn:aws:rekognition:us-east-1:123456789012:project/getting-started/version/{i \
         my-model.2020-01-21T09.10.15}/1234567890123\n\
         ]}\n\
         .\n"]
  project_arn : project_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project that contains the model/adapter you want to \
         describe.\n"]
}
[@@ocaml.doc ""]

type nonrec project_status =
  | DELETING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dataset_type = TEST [@ocaml.doc ""] | TRAIN [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec dataset_status =
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_COMPLETE [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dataset_status_message_code =
  | CLIENT_ERROR [@ocaml.doc ""]
  | SERVICE_ERROR [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dataset_metadata = {
  status_message_code : dataset_status_message_code option;
      [@ocaml.doc
        " The status message code for the dataset operation. If a service error occurs, try the \
         API call again later. If a client error occurs, check the input parameters to the dataset \
         API call that failed. \n"]
  status_message : status_message option; [@ocaml.doc " The status message for the dataset. \n"]
  status : dataset_status option; [@ocaml.doc " The status for the dataset. \n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) for the dataset. \n"]
  dataset_type : dataset_type option; [@ocaml.doc " The type of the dataset. \n"]
  creation_timestamp : date_time option;
      [@ocaml.doc " The Unix timestamp for the date and time that the dataset was created. \n"]
}
[@@ocaml.doc
  " Summary information for an Amazon Rekognition Custom Labels dataset. For more information, see \
   [ProjectDescription]. \n"]

type nonrec dataset_metadata_list = dataset_metadata list [@@ocaml.doc ""]

type nonrec project_auto_update = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec project_description = {
  auto_update : project_auto_update option;
      [@ocaml.doc
        "Indicates whether automatic retraining will be attempted for the versions of the project. \
         Applies only to adapters. \n"]
  feature : customization_feature option;
      [@ocaml.doc "Specifies the project that is being customized.\n"]
  datasets : dataset_metadata_list option;
      [@ocaml.doc " Information about the training and test datasets in the project. \n"]
  status : project_status option; [@ocaml.doc "The current status of the project.\n"]
  creation_timestamp : date_time option;
      [@ocaml.doc "The Unix timestamp for the date and time that the project was created.\n"]
  project_arn : project_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the project.\n"]
}
[@@ocaml.doc
  "A description of an Amazon Rekognition Custom Labels project. For more information, see \
   [DescribeProjects].\n"]

type nonrec project_descriptions = project_description list [@@ocaml.doc ""]

type nonrec describe_projects_response = {
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Amazon Rekognition returns a pagination token in the response. You can use this \
         pagination token to retrieve the next set of results. \n"]
  project_descriptions : project_descriptions option;
      [@ocaml.doc
        "A list of project descriptions. The list is sorted by the date and time the projects are \
         created.\n"]
}
[@@ocaml.doc ""]

type nonrec projects_page_size = int [@@ocaml.doc ""]

type nonrec project_name = string [@@ocaml.doc ""]

type nonrec project_names = project_name list [@@ocaml.doc ""]

type nonrec customization_features = customization_feature list [@@ocaml.doc ""]

type nonrec describe_projects_request = {
  features : customization_features option;
      [@ocaml.doc
        "Specifies the type of customization to filter projects by. If no value is specified, \
         CUSTOM_LABELS is used as a default.\n"]
  project_names : project_names option;
      [@ocaml.doc
        "A list of the projects that you want Rekognition to describe. If you don't specify a \
         value, the response includes descriptions for all the projects in your AWS account.\n"]
  max_results : projects_page_size option;
      [@ocaml.doc
        "The maximum number of results to return per paginated call. The largest value you can \
         specify is 100. If you specify a value greater than 100, a ValidationException error \
         occurs. The default value is 100. \n"]
  next_token : extended_pagination_token option;
      [@ocaml.doc
        "If the previous response was incomplete (because there is more results to retrieve), \
         Rekognition returns a pagination token in the response. You can use this pagination token \
         to retrieve the next set of results. \n"]
}
[@@ocaml.doc ""]

type nonrec dataset_stats = {
  error_entries : u_integer option;
      [@ocaml.doc " The total number of entries that contain at least one error. \n"]
  total_labels : u_integer option;
      [@ocaml.doc " The total number of labels declared in the dataset. \n"]
  total_entries : u_integer option; [@ocaml.doc " The total number of images in the dataset. \n"]
  labeled_entries : u_integer option;
      [@ocaml.doc " The total number of images in the dataset that have labels. \n"]
}
[@@ocaml.doc
  " Provides statistics about a dataset. For more information, see [DescribeDataset]. \n"]

type nonrec dataset_description = {
  dataset_stats : dataset_stats option; [@ocaml.doc " The status message code for the dataset. \n"]
  status_message_code : dataset_status_message_code option;
      [@ocaml.doc
        " The status message code for the dataset operation. If a service error occurs, try the \
         API call again later. If a client error occurs, check the input parameters to the dataset \
         API call that failed. \n"]
  status_message : status_message option; [@ocaml.doc " The status message for the dataset. \n"]
  status : dataset_status option; [@ocaml.doc " The status of the dataset. \n"]
  last_updated_timestamp : date_time option;
      [@ocaml.doc " The Unix timestamp for the date and time that the dataset was last updated. \n"]
  creation_timestamp : date_time option;
      [@ocaml.doc " The Unix timestamp for the time and date that the dataset was created. \n"]
}
[@@ocaml.doc
  " A description for a dataset. For more information, see [DescribeDataset].\n\n\
  \ The status fields [Status], [StatusMessage], and [StatusMessageCode] reflect the last \
   operation on the dataset. \n\
  \ "]

type nonrec describe_dataset_response = {
  dataset_description : dataset_description option;
      [@ocaml.doc " The description for the dataset. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_request = {
  dataset_arn : dataset_arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the dataset that you want to describe. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_collection_response = {
  user_count : u_long option;
      [@ocaml.doc "The number of UserIDs assigned to the specified colleciton.\n"]
  creation_timestamp : date_time option;
      [@ocaml.doc
        "The number of milliseconds since the Unix epoch time until the creation of the \
         collection. The Unix epoch time is 00:00:00 Coordinated Universal Time (UTC), Thursday, 1 \
         January 1970.\n"]
  collection_ar_n : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the collection.\n"]
  face_model_version : string_ option;
      [@ocaml.doc
        "The version of the face model that's used by the collection for face detection.\n\n\
        \ For more information, see Model versioning in the Amazon Rekognition Developer Guide.\n\
        \ "]
  face_count : u_long option;
      [@ocaml.doc
        "The number of faces that are indexed into the collection. To index faces into a \
         collection, use [IndexFaces].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_collection_request = {
  collection_id : collection_id; [@ocaml.doc "The ID of the collection to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_response = unit [@@ocaml.doc ""]

type nonrec delete_user_request = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the request to [DeleteUser]. If you use the same token \
         with multiple [DeleteUser ]requests, the same response is returned. Use \
         ClientRequestToken to prevent the same request from being processed more than once.\n"]
  user_id : user_id; [@ocaml.doc "ID for the UserID to be deleted. \n"]
  collection_id : collection_id;
      [@ocaml.doc "The ID of an existing collection from which the UserID needs to be deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_stream_processor_response = unit [@@ocaml.doc ""]

type nonrec delete_stream_processor_request = {
  name : stream_processor_name; [@ocaml.doc "The name of the stream processor you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_project_version_response = {
  status : project_version_status option; [@ocaml.doc "The status of the deletion operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_project_version_request = {
  project_version_arn : project_version_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project version that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_project_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_project_policy_request = {
  policy_revision_id : project_policy_revision_id option;
      [@ocaml.doc "The ID of the project policy revision that you want to delete.\n"]
  policy_name : project_policy_name;
      [@ocaml.doc "The name of the policy that you want to delete.\n"]
  project_arn : project_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project that the project policy you want to delete \
         is attached to.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_project_response = {
  status : project_status option;
      [@ocaml.doc "The current status of the delete project operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_project_request = {
  project_arn : project_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the project that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_faces_response = {
  unsuccessful_face_deletions : unsuccessful_face_deletions_list option;
      [@ocaml.doc "An array of any faces that weren't deleted.\n"]
  deleted_faces : face_id_list option;
      [@ocaml.doc "An array of strings (face IDs) of the faces that were deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_faces_request = {
  face_ids : face_id_list; [@ocaml.doc "An array of face IDs to delete.\n"]
  collection_id : collection_id; [@ocaml.doc "Collection from which to remove the specific faces.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dataset_response = unit [@@ocaml.doc ""]

type nonrec delete_dataset_request = {
  dataset_arn : dataset_arn;
      [@ocaml.doc
        " The ARN of the Amazon Rekognition Custom Labels dataset that you want to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_collection_response = {
  status_code : u_integer option;
      [@ocaml.doc "HTTP status code that indicates the result of the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_collection_request = {
  collection_id : collection_id; [@ocaml.doc "ID of the collection to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_response = unit [@@ocaml.doc ""]

type nonrec create_user_request = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the request to [CreateUser]. If you use the same token \
         with multiple [CreateUser] requests, the same response is returned. Use \
         ClientRequestToken to prevent the same request from being processed more than once.\n"]
  user_id : user_id;
      [@ocaml.doc
        "ID for the UserID to be created. This ID needs to be unique within the collection.\n"]
  collection_id : collection_id;
      [@ocaml.doc "The ID of an existing collection to which the new UserID needs to be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_stream_processor_response = {
  stream_processor_arn : stream_processor_arn option;
      [@ocaml.doc "Amazon Resource Number for the newly created stream processor.\n"]
}
[@@ocaml.doc ""]

type nonrec create_stream_processor_request = {
  data_sharing_preference : stream_processor_data_sharing_preference option;
      [@ocaml.doc
        " Shows whether you are sharing data with Rekognition to improve model performance. You \
         can choose this option at the account level or on a per-stream basis. Note that if you \
         opt out at the account level this setting is ignored on individual streams. \n"]
  regions_of_interest : regions_of_interest option;
      [@ocaml.doc
        " Specifies locations in the frames where Amazon Rekognition checks for objects or people. \
         You can specify up to 10 regions of interest, and each region has either a polygon or a \
         bounding box. This is an optional parameter for label detection stream processors and \
         should not be used to create a face search stream processor. \n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        " The identifier for your AWS Key Management Service key (AWS KMS key). This is an \
         optional parameter for label detection stream processors and should not be used to create \
         a face search stream processor. You can supply the Amazon Resource Name (ARN) of your KMS \
         key, the ID of your KMS key, an alias for your KMS key, or an alias ARN. The key is used \
         to encrypt results and data published to your Amazon S3 bucket, which includes image \
         frames and hero images. Your source images are unaffected. \n\n\
        \  \n\
        \ "]
  notification_channel : stream_processor_notification_channel option; [@ocaml.doc ""]
  tags : tag_map option;
      [@ocaml.doc
        " A set of tags (key-value pairs) that you want to attach to the stream processor. \n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the IAM role that allows access to the stream \
         processor. The IAM role provides Rekognition read permissions for a Kinesis stream. It \
         also provides write permissions to an Amazon S3 bucket and Amazon Simple Notification \
         Service topic for a label detection stream processor. This is required for both face \
         search and label detection stream processors.\n"]
  settings : stream_processor_settings;
      [@ocaml.doc
        "Input parameters used in a streaming video analyzed by a stream processor. You can use \
         [FaceSearch] to recognize faces in a streaming video, or you can use [ConnectedHome] to \
         detect labels.\n"]
  name : stream_processor_name;
      [@ocaml.doc
        "An identifier you assign to the stream processor. You can use [Name] to manage the stream \
         processor. For example, you can get the current status of the stream processor by calling \
         [DescribeStreamProcessor]. [Name] is idempotent. This is required for both face search \
         and label detection stream processors. \n"]
  output : stream_processor_output;
      [@ocaml.doc
        "Kinesis data stream stream or Amazon S3 bucket location to which Amazon Rekognition Video \
         puts the analysis results. If you are using the AWS CLI, the parameter name is \
         [StreamProcessorOutput]. This must be a [S3Destination] of an Amazon S3 bucket that you \
         own for a label detection stream processor or a Kinesis data stream ARN for a face search \
         stream processor.\n"]
  input : stream_processor_input;
      [@ocaml.doc
        "Kinesis video stream stream that provides the source streaming video. If you are using \
         the AWS CLI, the parameter name is [StreamProcessorInput]. This is required for both face \
         search and label detection stream processors.\n"]
}
[@@ocaml.doc ""]

type nonrec create_project_version_response = {
  project_version_arn : project_version_arn option;
      [@ocaml.doc
        "The ARN of the model or the project version that was created. Use \
         [DescribeProjectVersion] to get the current status of the training operation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_project_version_request = {
  feature_config : customization_feature_config option;
      [@ocaml.doc
        "Feature-specific configuration of the training job. If the job configuration does not \
         match the feature type associated with the project, an InvalidParameterException is \
         returned.\n"]
  version_description : version_description option;
      [@ocaml.doc "A description applied to the project version being created.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The identifier for your AWS Key Management Service key (AWS KMS key). You can supply the \
         Amazon Resource Name (ARN) of your KMS key, the ID of your KMS key, an alias for your KMS \
         key, or an alias ARN. The key is used to encrypt training images, test images, and \
         manifest files copied into the service for the project version. Your source images are \
         unaffected. The key is also used to encrypt training results and manifest files written \
         to the output Amazon S3 bucket ([OutputConfig]).\n\n\
        \ If you choose to use your own KMS key, you need the following permissions on the KMS key.\n\
        \ \n\
        \  {ul\n\
        \        {-  kms:CreateGrant\n\
        \            \n\
        \             }\n\
        \        {-  kms:DescribeKey\n\
        \            \n\
        \             }\n\
        \        {-  kms:GenerateDataKey\n\
        \            \n\
        \             }\n\
        \        {-  kms:Decrypt\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you don't specify a value for [KmsKeyId], images copied into the service are \
         encrypted using a key that AWS owns and manages.\n\
        \   "]
  tags : tag_map option;
      [@ocaml.doc
        " A set of tags (key-value pairs) that you want to attach to the project version. \n"]
  testing_data : testing_data option;
      [@ocaml.doc
        "Specifies an external manifest that the service uses to test the project version. If you \
         specify [TestingData] you must also specify [TrainingData]. The project must not have any \
         associated datasets.\n"]
  training_data : training_data option;
      [@ocaml.doc
        "Specifies an external manifest that the services uses to train the project version. If \
         you specify [TrainingData] you must also specify [TestingData]. The project must not have \
         any associated datasets. \n"]
  output_config : output_config;
      [@ocaml.doc
        "The Amazon S3 bucket location to store the results of training. The bucket can be any S3 \
         bucket in your AWS account. You need [s3:PutObject] permission on the bucket. \n"]
  version_name : version_name;
      [@ocaml.doc "A name for the version of the project version. This value must be unique.\n"]
  project_arn : project_arn;
      [@ocaml.doc
        "The ARN of the Amazon Rekognition project that will manage the project version you want \
         to train.\n"]
}
[@@ocaml.doc ""]

type nonrec create_project_response = {
  project_arn : project_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the new project. You can use the ARN to configure IAM \
         access to the project. \n"]
}
[@@ocaml.doc ""]

type nonrec create_project_request = {
  tags : tag_map option;
      [@ocaml.doc "A set of tags (key-value pairs) that you want to attach to the project.\n"]
  auto_update : project_auto_update option;
      [@ocaml.doc
        "Specifies whether automatic retraining should be attempted for the versions of the \
         project. Automatic retraining is done as a best effort. Required argument for Content \
         Moderation. Applicable only to adapters.\n"]
  feature : customization_feature option;
      [@ocaml.doc
        "Specifies feature that is being customized. If no value is provided CUSTOM_LABELS is used \
         as a default.\n"]
  project_name : project_name; [@ocaml.doc "The name of the project to create.\n"]
}
[@@ocaml.doc ""]

type nonrec create_face_liveness_session_response = {
  session_id : liveness_session_id;
      [@ocaml.doc
        "A unique 128-bit UUID identifying a Face Liveness session. A new sessionID must be used \
         for every Face Liveness check. If a given sessionID is used for subsequent Face Liveness \
         checks, the checks will fail. Additionally, a SessionId expires 3 minutes after it's \
         sent, making all Liveness data associated with the session (e.g., sessionID, reference \
         image, audit images, etc.) unavailable. \n"]
}
[@@ocaml.doc ""]

type nonrec liveness_s3_key_prefix = string [@@ocaml.doc ""]

type nonrec liveness_output_config = {
  s3_key_prefix : liveness_s3_key_prefix option;
      [@ocaml.doc
        "The prefix prepended to the output files for the Face Liveness session results.\n"]
  s3_bucket : s3_bucket;
      [@ocaml.doc
        "The path to an AWS Amazon S3 bucket used to store Face Liveness session results.\n"]
}
[@@ocaml.doc
  "Contains settings that specify the location of an Amazon S3 bucket used to store the output of \
   a Face Liveness session. Note that the S3 bucket must be located in the caller's AWS account \
   and in the same region as the Face Liveness end-point. Additionally, the Amazon S3 object keys \
   are auto-generated by the Face Liveness system. \n"]

type nonrec audit_images_limit = int [@@ocaml.doc ""]

type nonrec challenge_preference = {
  versions : versions option;
      [@ocaml.doc
        "The version of the challenges that have been selected for the Face Liveness session.\n"]
  type_ : challenge_type;
      [@ocaml.doc
        "The types of challenges that have been selected for the Face Liveness session.\n"]
}
[@@ocaml.doc "An ordered list of preferred challenge type and versions.\n"]

type nonrec challenge_preferences = challenge_preference list [@@ocaml.doc ""]

type nonrec create_face_liveness_session_request_settings = {
  challenge_preferences : challenge_preferences option;
      [@ocaml.doc
        "Indicates preferred challenge types and versions for the Face Liveness session to be \
         created.\n"]
  audit_images_limit : audit_images_limit option;
      [@ocaml.doc
        "Number of audit images to be returned back. Takes an integer between 0-4. Any integer \
         less than 0 will return 0, any integer above 4 will return 4 images in the response. By \
         default, it is set to 0. The limit is best effort and is based on the actual duration of \
         the selfie-video.\n"]
  output_config : liveness_output_config option;
      [@ocaml.doc
        "Can specify the location of an Amazon S3 bucket, where reference and audit images will be \
         stored. Note that the Amazon S3 bucket must be located in the caller's AWS account and in \
         the same region as the Face Liveness end-point. Additionally, the Amazon S3 object keys \
         are auto-generated by the Face Liveness system. Requires that the caller has the \
         [s3:PutObject] permission on the Amazon S3 bucket.\n"]
}
[@@ocaml.doc
  "A session settings object. It contains settings for the operation to be performed. It accepts \
   arguments for OutputConfig and AuditImagesLimit.\n"]

type nonrec create_face_liveness_session_request = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token is used to recognize the Face Liveness request. If the same token is \
         used with multiple [CreateFaceLivenessSession] requests, the same session is returned. \
         This token is employed to avoid unintentionally creating the same session multiple times.\n"]
  settings : create_face_liveness_session_request_settings option;
      [@ocaml.doc
        "A session settings object. It contains settings for the operation to be performed. For \
         Face Liveness, it accepts [OutputConfig] and [AuditImagesLimit].\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        " The identifier for your AWS Key Management Service key (AWS KMS key). Used to encrypt \
         audit images and reference images.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_response = {
  dataset_arn : dataset_arn option;
      [@ocaml.doc " The ARN of the created Amazon Rekognition Custom Labels dataset. \n"]
}
[@@ocaml.doc ""]

type nonrec dataset_source = {
  dataset_arn : dataset_arn option;
      [@ocaml.doc
        " The ARN of an Amazon Rekognition Custom Labels dataset that you want to copy. \n"]
  ground_truth_manifest : ground_truth_manifest option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The source that Amazon Rekognition Custom Labels uses to create a dataset. To use an Amazon \
   Sagemaker format manifest file, specify the S3 bucket location in the [GroundTruthManifest] \
   field. The S3 bucket must be in your AWS account. To create a copy of an existing dataset, \
   specify the Amazon Resource Name (ARN) of an existing dataset in [DatasetArn].\n\n\
  \ You need to specify a value for [DatasetArn] or [GroundTruthManifest], but not both. if you \
   supply both values, or if you don't specify any values, an InvalidParameterException exception \
   occurs. \n\
  \ \n\
  \  For more information, see [CreateDataset].\n\
  \  "]

type nonrec create_dataset_request = {
  tags : tag_map option;
      [@ocaml.doc "A set of tags (key-value pairs) that you want to attach to the dataset.\n"]
  project_arn : project_arn;
      [@ocaml.doc
        " The ARN of the Amazon Rekognition Custom Labels project to which you want to asssign the \
         dataset. \n"]
  dataset_type : dataset_type;
      [@ocaml.doc
        " The type of the dataset. Specify [TRAIN] to create a training dataset. Specify [TEST] to \
         create a test dataset. \n"]
  dataset_source : dataset_source option;
      [@ocaml.doc
        " The source files for the dataset. You can specify the ARN of an existing dataset or \
         specify the Amazon S3 bucket location of an Amazon Sagemaker format manifest file. If you \
         don't specify [datasetSource], an empty dataset is created. To add labeled images to the \
         dataset, You can use the console or call [UpdateDatasetEntries]. \n"]
}
[@@ocaml.doc ""]

type nonrec create_collection_response = {
  face_model_version : string_ option;
      [@ocaml.doc
        "Version number of the face detection model associated with the collection you are creating.\n"]
  collection_arn : string_ option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the collection. You can use this to manage permissions on \
         your resources. \n"]
  status_code : u_integer option;
      [@ocaml.doc "HTTP status code indicating the result of the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_collection_request = {
  tags : tag_map option;
      [@ocaml.doc " A set of tags (key-value pairs) that you want to attach to the collection. \n"]
  collection_id : collection_id; [@ocaml.doc "ID for the collection that you are creating.\n"]
}
[@@ocaml.doc ""]

type nonrec copy_project_version_response = {
  project_version_arn : project_version_arn option;
      [@ocaml.doc "The ARN of the copied model version in the destination project. \n"]
}
[@@ocaml.doc ""]

type nonrec copy_project_version_request = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "The identifier for your AWS Key Management Service key (AWS KMS key). You can supply the \
         Amazon Resource Name (ARN) of your KMS key, the ID of your KMS key, an alias for your KMS \
         key, or an alias ARN. The key is used to encrypt training results and manifest files \
         written to the output Amazon S3 bucket ([OutputConfig]).\n\n\
        \ If you choose to use your own KMS key, you need the following permissions on the KMS key.\n\
        \ \n\
        \  {ul\n\
        \        {-  kms:CreateGrant\n\
        \            \n\
        \             }\n\
        \        {-  kms:DescribeKey\n\
        \            \n\
        \             }\n\
        \        {-  kms:GenerateDataKey\n\
        \            \n\
        \             }\n\
        \        {-  kms:Decrypt\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you don't specify a value for [KmsKeyId], images copied into the service are \
         encrypted using a key that AWS owns and manages.\n\
        \   "]
  tags : tag_map option; [@ocaml.doc "The key-value tags to assign to the model version. \n"]
  output_config : output_config;
      [@ocaml.doc
        "The S3 bucket and folder location where the training output for the source model version \
         is placed.\n"]
  version_name : version_name;
      [@ocaml.doc "A name for the version of the model that's copied to the destination project.\n"]
  destination_project_arn : project_arn;
      [@ocaml.doc
        "The ARN of the project in the trusted AWS account that you want to copy the model version \
         to. \n"]
  source_project_version_arn : project_version_arn;
      [@ocaml.doc
        "The ARN of the model version in the source project that you want to copy to a destination \
         project.\n"]
  source_project_arn : project_arn;
      [@ocaml.doc "The ARN of the source project in the trusting AWS account.\n"]
}
[@@ocaml.doc ""]

type nonrec compared_source_image_face = {
  confidence : percent option;
      [@ocaml.doc "Confidence level that the selected bounding box contains a face.\n"]
  bounding_box : bounding_box option; [@ocaml.doc "Bounding box of the face.\n"]
}
[@@ocaml.doc
  "Type that describes the face Amazon Rekognition chose to compare with the faces in the target. \
   This contains a bounding box for the selected face and confidence level that the bounding box \
   contains a face. Note that Amazon Rekognition selects the largest face in the source image for \
   this comparison. \n"]

type nonrec compare_faces_match = {
  face : compared_face option;
      [@ocaml.doc
        "Provides face metadata (bounding box and confidence that the bounding box actually \
         contains a face).\n"]
  similarity : percent option; [@ocaml.doc "Level of confidence that the faces match.\n"]
}
[@@ocaml.doc
  "Provides information about a face in a target image that matches the source image face analyzed \
   by [CompareFaces]. The [Face] property contains the bounding box of the face in the target \
   image. The [Similarity] property is the confidence that the source image face matches the face \
   in the bounding box.\n"]

type nonrec compare_faces_match_list = compare_faces_match list [@@ocaml.doc ""]

type nonrec compare_faces_unmatch_list = compared_face list [@@ocaml.doc ""]

type nonrec compare_faces_response = {
  target_image_orientation_correction : orientation_correction option;
      [@ocaml.doc
        "The value of [TargetImageOrientationCorrection] is always null.\n\n\
        \ If the input image is in .jpeg format, it might contain exchangeable image file format \
         (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this \
         orientation information to perform image correction. The bounding box coordinates are \
         translated to represent object locations after the orientation information in the Exif \
         metadata is used to correct the image orientation. Images in .png format don't contain \
         Exif metadata.\n\
        \ \n\
        \  Amazon Rekognition doesn\226\128\153t perform image correction for images in .png \
         format and .jpeg images without orientation information in the image Exif metadata. The \
         bounding box coordinates aren't translated and represent the object locations before the \
         image is rotated. \n\
        \  "]
  source_image_orientation_correction : orientation_correction option;
      [@ocaml.doc
        "The value of [SourceImageOrientationCorrection] is always null.\n\n\
        \ If the input image is in .jpeg format, it might contain exchangeable image file format \
         (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this \
         orientation information to perform image correction. The bounding box coordinates are \
         translated to represent object locations after the orientation information in the Exif \
         metadata is used to correct the image orientation. Images in .png format don't contain \
         Exif metadata.\n\
        \ \n\
        \  Amazon Rekognition doesn\226\128\153t perform image correction for images in .png \
         format and .jpeg images without orientation information in the image Exif metadata. The \
         bounding box coordinates aren't translated and represent the object locations before the \
         image is rotated. \n\
        \  "]
  unmatched_faces : compare_faces_unmatch_list option;
      [@ocaml.doc
        "An array of faces in the target image that did not match the source image face.\n"]
  face_matches : compare_faces_match_list option;
      [@ocaml.doc
        "An array of faces in the target image that match the source image face. Each \
         [CompareFacesMatch] object provides the bounding box, the confidence level that the \
         bounding box contains a face, and the similarity score for the face in the bounding box \
         and the face in the source image.\n"]
  source_image_face : compared_source_image_face option;
      [@ocaml.doc "The face in the source image that was used for comparison.\n"]
}
[@@ocaml.doc ""]

type nonrec compare_faces_request = {
  quality_filter : quality_filter option;
      [@ocaml.doc
        "A filter that specifies a quality bar for how much filtering is done to identify faces. \
         Filtered faces aren't compared. If you specify [AUTO], Amazon Rekognition chooses the \
         quality bar. If you specify [LOW], [MEDIUM], or [HIGH], filtering removes all faces that \
         don\226\128\153t meet the chosen quality bar. The quality bar is based on a variety of \
         common use cases. Low-quality detections can occur for a number of reasons. Some examples \
         are an object that's misidentified as a face, a face that's too blurry, or a face with a \
         pose that's too extreme to use. If you specify [NONE], no filtering is performed. The \
         default value is [NONE]. \n\n\
        \ To use quality filtering, the collection you are using must be associated with version 3 \
         of the face model or higher.\n\
        \ "]
  similarity_threshold : percent option;
      [@ocaml.doc
        "The minimum level of confidence in the face matches that a match must meet to be included \
         in the [FaceMatches] array.\n"]
  target_image : image;
      [@ocaml.doc
        "The target image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call \
         Amazon Rekognition operations, passing base64-encoded image bytes is not supported. \n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
  source_image : image;
      [@ocaml.doc
        "The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call \
         Amazon Rekognition operations, passing base64-encoded image bytes is not supported. \n\n\
        \ If you are using an AWS SDK to call Amazon Rekognition, you might not need to \
         base64-encode image bytes passed using the [Bytes] field. For more information, see \
         Images in the Amazon Rekognition developer guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec associated_face = {
  face_id : face_id option; [@ocaml.doc "Unique identifier assigned to the face.\n"]
}
[@@ocaml.doc "Provides face metadata for the faces that are associated to a specific UserID.\n"]

type nonrec associated_faces_list = associated_face list [@@ocaml.doc ""]

type nonrec associate_faces_response = {
  user_status : user_status option;
      [@ocaml.doc
        "The status of an update made to a UserID. Reflects if the UserID has been updated for \
         every requested change.\n"]
  unsuccessful_face_associations : unsuccessful_face_association_list option;
      [@ocaml.doc
        "An array of UnsuccessfulAssociation objects containing FaceIDs that are not successfully \
         associated along with the reasons. Returned if the AssociateFaces action is successful.\n"]
  associated_faces : associated_faces_list option;
      [@ocaml.doc
        "An array of AssociatedFace objects containing FaceIDs that have been successfully \
         associated with the UserID. Returned if the AssociateFaces action is successful.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_faces_request = {
  client_request_token : client_request_token option;
      [@ocaml.doc
        "Idempotent token used to identify the request to [AssociateFaces]. If you use the same \
         token with multiple [AssociateFaces] requests, the same response is returned. Use \
         ClientRequestToken to prevent the same request from being processed more than once.\n"]
  user_match_threshold : percent option;
      [@ocaml.doc
        "An optional value specifying the minimum confidence in the UserID match to return. The \
         default value is 75.\n"]
  face_ids : user_face_id_list; [@ocaml.doc "An array of FaceIDs to associate with the UserID.\n"]
  user_id : user_id; [@ocaml.doc "The ID for the existing UserID.\n"]
  collection_id : collection_id;
      [@ocaml.doc "The ID of an existing collection containing the UserID.\n"]
}
[@@ocaml.doc ""]
