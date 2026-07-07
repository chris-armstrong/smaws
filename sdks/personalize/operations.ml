open Types
open Service_metadata

module CreateBatchInferenceJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_batch_inference_job_request) =
    let input = Json_serializers.create_batch_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateBatchInferenceJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_batch_inference_job_request) =
    let input = Json_serializers.create_batch_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateBatchInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_inference_job_response_of_yojson
      ~error_deserializer
end

module CreateBatchSegmentJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_batch_segment_job_request) =
    let input = Json_serializers.create_batch_segment_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateBatchSegmentJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_segment_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_batch_segment_job_request) =
    let input = Json_serializers.create_batch_segment_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateBatchSegmentJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_segment_job_response_of_yojson
      ~error_deserializer
end

module CreateCampaign = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_campaign_request) =
    let input = Json_serializers.create_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateCampaign" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_campaign_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_campaign_request) =
    let input = Json_serializers.create_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.CreateCampaign"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_campaign_response_of_yojson ~error_deserializer
end

module CreateDataDeletionJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_deletion_job_request) =
    let input = Json_serializers.create_data_deletion_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateDataDeletionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_deletion_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_deletion_job_request) =
    let input = Json_serializers.create_data_deletion_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateDataDeletionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_deletion_job_response_of_yojson
      ~error_deserializer
end

module CreateDataset = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.CreateDataset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson ~error_deserializer
end

module CreateDatasetExportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_export_job_request) =
    let input = Json_serializers.create_dataset_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateDatasetExportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_export_job_request) =
    let input = Json_serializers.create_dataset_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateDatasetExportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_export_job_response_of_yojson
      ~error_deserializer
end

module CreateDatasetGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_group_request) =
    let input = Json_serializers.create_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateDatasetGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_group_request) =
    let input = Json_serializers.create_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateDatasetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_group_response_of_yojson
      ~error_deserializer
end

module CreateDatasetImportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_import_job_request) =
    let input = Json_serializers.create_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateDatasetImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_import_job_request) =
    let input = Json_serializers.create_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateDatasetImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_import_job_response_of_yojson
      ~error_deserializer
end

module CreateEventTracker = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_event_tracker_request) =
    let input = Json_serializers.create_event_tracker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateEventTracker" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_event_tracker_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_event_tracker_request) =
    let input = Json_serializers.create_event_tracker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateEventTracker" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_event_tracker_response_of_yojson
      ~error_deserializer
end

module CreateFilter = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_filter_request) =
    let input = Json_serializers.create_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateFilter" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_filter_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_filter_request) =
    let input = Json_serializers.create_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.CreateFilter"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_filter_response_of_yojson ~error_deserializer
end

module CreateMetricAttribution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_metric_attribution_request) =
    let input = Json_serializers.create_metric_attribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateMetricAttribution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_metric_attribution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_metric_attribution_request) =
    let input = Json_serializers.create_metric_attribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateMetricAttribution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_metric_attribution_response_of_yojson
      ~error_deserializer
end

module CreateRecommender = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_recommender_request) =
    let input = Json_serializers.create_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateRecommender" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_recommender_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_recommender_request) =
    let input = Json_serializers.create_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateRecommender" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_recommender_response_of_yojson
      ~error_deserializer
end

module CreateSchema = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_schema_request) =
    let input = Json_serializers.create_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateSchema" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_schema_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_schema_request) =
    let input = Json_serializers.create_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.CreateSchema"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_schema_response_of_yojson ~error_deserializer
end

module CreateSolution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_solution_request) =
    let input = Json_serializers.create_solution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateSolution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_solution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_solution_request) =
    let input = Json_serializers.create_solution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.CreateSolution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_solution_response_of_yojson ~error_deserializer
end

module CreateSolutionVersion = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_solution_version_request) =
    let input = Json_serializers.create_solution_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.CreateSolutionVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_solution_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_solution_version_request) =
    let input = Json_serializers.create_solution_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.CreateSolutionVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_solution_version_response_of_yojson
      ~error_deserializer
end

module DeleteCampaign = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_campaign_request) =
    let input = Json_serializers.delete_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteCampaign" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_campaign_request) =
    let input = Json_serializers.delete_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.DeleteCampaign"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDataset = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_dataset_request) =
    let input = Json_serializers.delete_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteDataset" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dataset_request) =
    let input = Json_serializers.delete_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.DeleteDataset"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDatasetGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_dataset_group_request) =
    let input = Json_serializers.delete_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteDatasetGroup" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dataset_group_request) =
    let input = Json_serializers.delete_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DeleteDatasetGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteEventTracker = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_event_tracker_request) =
    let input = Json_serializers.delete_event_tracker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteEventTracker" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_event_tracker_request) =
    let input = Json_serializers.delete_event_tracker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DeleteEventTracker" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteFilter = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_filter_request) =
    let input = Json_serializers.delete_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteFilter" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_filter_request) =
    let input = Json_serializers.delete_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.DeleteFilter"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteMetricAttribution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_metric_attribution_request) =
    let input = Json_serializers.delete_metric_attribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteMetricAttribution"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_metric_attribution_request) =
    let input = Json_serializers.delete_metric_attribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DeleteMetricAttribution" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteRecommender = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_recommender_request) =
    let input = Json_serializers.delete_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteRecommender" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_recommender_request) =
    let input = Json_serializers.delete_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DeleteRecommender" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteSchema = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_schema_request) =
    let input = Json_serializers.delete_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteSchema" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_schema_request) =
    let input = Json_serializers.delete_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.DeleteSchema"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteSolution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_solution_request) =
    let input = Json_serializers.delete_solution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DeleteSolution" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_solution_request) =
    let input = Json_serializers.delete_solution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.DeleteSolution"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeAlgorithm = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_algorithm_request) =
    let input = Json_serializers.describe_algorithm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeAlgorithm" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_algorithm_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_algorithm_request) =
    let input = Json_serializers.describe_algorithm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeAlgorithm" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_algorithm_response_of_yojson
      ~error_deserializer
end

module DescribeBatchInferenceJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_batch_inference_job_request) =
    let input = Json_serializers.describe_batch_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeBatchInferenceJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_batch_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_batch_inference_job_request) =
    let input = Json_serializers.describe_batch_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeBatchInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_batch_inference_job_response_of_yojson
      ~error_deserializer
end

module DescribeBatchSegmentJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_batch_segment_job_request) =
    let input = Json_serializers.describe_batch_segment_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeBatchSegmentJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_batch_segment_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_batch_segment_job_request) =
    let input = Json_serializers.describe_batch_segment_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeBatchSegmentJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_batch_segment_job_response_of_yojson
      ~error_deserializer
end

module DescribeCampaign = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_campaign_request) =
    let input = Json_serializers.describe_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeCampaign" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_campaign_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_campaign_request) =
    let input = Json_serializers.describe_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeCampaign" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_campaign_response_of_yojson
      ~error_deserializer
end

module DescribeDataDeletionJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_data_deletion_job_request) =
    let input = Json_serializers.describe_data_deletion_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeDataDeletionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_data_deletion_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_data_deletion_job_request) =
    let input = Json_serializers.describe_data_deletion_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeDataDeletionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_data_deletion_job_response_of_yojson
      ~error_deserializer
end

module DescribeDataset = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer
end

module DescribeDatasetExportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_export_job_request) =
    let input = Json_serializers.describe_dataset_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeDatasetExportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_export_job_request) =
    let input = Json_serializers.describe_dataset_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeDatasetExportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_export_job_response_of_yojson
      ~error_deserializer
end

module DescribeDatasetGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_group_request) =
    let input = Json_serializers.describe_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeDatasetGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_group_request) =
    let input = Json_serializers.describe_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeDatasetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_group_response_of_yojson
      ~error_deserializer
end

module DescribeDatasetImportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_import_job_request) =
    let input = Json_serializers.describe_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeDatasetImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_import_job_request) =
    let input = Json_serializers.describe_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeDatasetImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_import_job_response_of_yojson
      ~error_deserializer
end

module DescribeEventTracker = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_tracker_request) =
    let input = Json_serializers.describe_event_tracker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeEventTracker"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_tracker_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_event_tracker_request) =
    let input = Json_serializers.describe_event_tracker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeEventTracker" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_tracker_response_of_yojson
      ~error_deserializer
end

module DescribeFeatureTransformation = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_feature_transformation_request) =
    let input = Json_serializers.describe_feature_transformation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonPersonalize.DescribeFeatureTransformation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_feature_transformation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_feature_transformation_request) =
    let input = Json_serializers.describe_feature_transformation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeFeatureTransformation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_feature_transformation_response_of_yojson
      ~error_deserializer
end

module DescribeFilter = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_filter_request) =
    let input = Json_serializers.describe_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeFilter" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_filter_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_filter_request) =
    let input = Json_serializers.describe_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.DescribeFilter"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_filter_response_of_yojson ~error_deserializer
end

module DescribeMetricAttribution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metric_attribution_request) =
    let input = Json_serializers.describe_metric_attribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeMetricAttribution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metric_attribution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metric_attribution_request) =
    let input = Json_serializers.describe_metric_attribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeMetricAttribution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metric_attribution_response_of_yojson
      ~error_deserializer
end

module DescribeRecipe = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_recipe_request) =
    let input = Json_serializers.describe_recipe_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeRecipe" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_recipe_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_recipe_request) =
    let input = Json_serializers.describe_recipe_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.DescribeRecipe"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_recipe_response_of_yojson ~error_deserializer
end

module DescribeRecommender = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_recommender_request) =
    let input = Json_serializers.describe_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeRecommender" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_recommender_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_recommender_request) =
    let input = Json_serializers.describe_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeRecommender" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_recommender_response_of_yojson
      ~error_deserializer
end

module DescribeSchema = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_schema_request) =
    let input = Json_serializers.describe_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeSchema" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_schema_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_schema_request) =
    let input = Json_serializers.describe_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.DescribeSchema"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_schema_response_of_yojson ~error_deserializer
end

module DescribeSolution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_solution_request) =
    let input = Json_serializers.describe_solution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeSolution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_solution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_solution_request) =
    let input = Json_serializers.describe_solution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeSolution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_solution_response_of_yojson
      ~error_deserializer
end

module DescribeSolutionVersion = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_solution_version_request) =
    let input = Json_serializers.describe_solution_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.DescribeSolutionVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_solution_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_solution_version_request) =
    let input = Json_serializers.describe_solution_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.DescribeSolutionVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_solution_version_response_of_yojson
      ~error_deserializer
end

module GetSolutionMetrics = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_solution_metrics_request) =
    let input = Json_serializers.get_solution_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.GetSolutionMetrics" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_solution_metrics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_solution_metrics_request) =
    let input = Json_serializers.get_solution_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.GetSolutionMetrics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_solution_metrics_response_of_yojson
      ~error_deserializer
end

module ListBatchInferenceJobs = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_batch_inference_jobs_request) =
    let input = Json_serializers.list_batch_inference_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListBatchInferenceJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_batch_inference_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_batch_inference_jobs_request) =
    let input = Json_serializers.list_batch_inference_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListBatchInferenceJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_batch_inference_jobs_response_of_yojson
      ~error_deserializer
end

module ListBatchSegmentJobs = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_batch_segment_jobs_request) =
    let input = Json_serializers.list_batch_segment_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListBatchSegmentJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_batch_segment_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_batch_segment_jobs_request) =
    let input = Json_serializers.list_batch_segment_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListBatchSegmentJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_batch_segment_jobs_response_of_yojson
      ~error_deserializer
end

module ListCampaigns = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_campaigns_request) =
    let input = Json_serializers.list_campaigns_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListCampaigns" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_campaigns_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_campaigns_request) =
    let input = Json_serializers.list_campaigns_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.ListCampaigns"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_campaigns_response_of_yojson ~error_deserializer
end

module ListDataDeletionJobs = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_deletion_jobs_request) =
    let input = Json_serializers.list_data_deletion_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListDataDeletionJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_deletion_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_deletion_jobs_request) =
    let input = Json_serializers.list_data_deletion_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListDataDeletionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_deletion_jobs_response_of_yojson
      ~error_deserializer
end

module ListDatasetExportJobs = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dataset_export_jobs_request) =
    let input = Json_serializers.list_dataset_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListDatasetExportJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_export_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dataset_export_jobs_request) =
    let input = Json_serializers.list_dataset_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListDatasetExportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_export_jobs_response_of_yojson
      ~error_deserializer
end

module ListDatasetGroups = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dataset_groups_request) =
    let input = Json_serializers.list_dataset_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListDatasetGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_dataset_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dataset_groups_request) =
    let input = Json_serializers.list_dataset_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListDatasetGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_groups_response_of_yojson
      ~error_deserializer
end

module ListDatasetImportJobs = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dataset_import_jobs_request) =
    let input = Json_serializers.list_dataset_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListDatasetImportJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_import_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dataset_import_jobs_request) =
    let input = Json_serializers.list_dataset_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListDatasetImportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_import_jobs_response_of_yojson
      ~error_deserializer
end

module ListDatasets = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_datasets_request) =
    let input = Json_serializers.list_datasets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListDatasets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_datasets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_datasets_request) =
    let input = Json_serializers.list_datasets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.ListDatasets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_datasets_response_of_yojson ~error_deserializer
end

module ListEventTrackers = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_event_trackers_request) =
    let input = Json_serializers.list_event_trackers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListEventTrackers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_event_trackers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_event_trackers_request) =
    let input = Json_serializers.list_event_trackers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListEventTrackers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_event_trackers_response_of_yojson
      ~error_deserializer
end

module ListFilters = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_filters_request) =
    let input = Json_serializers.list_filters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListFilters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_filters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_filters_request) =
    let input = Json_serializers.list_filters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.ListFilters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_filters_response_of_yojson ~error_deserializer
end

module ListMetricAttributionMetrics = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_metric_attribution_metrics_request) =
    let input = Json_serializers.list_metric_attribution_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListMetricAttributionMetrics"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_metric_attribution_metrics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_metric_attribution_metrics_request) =
    let input = Json_serializers.list_metric_attribution_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListMetricAttributionMetrics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_metric_attribution_metrics_response_of_yojson
      ~error_deserializer
end

module ListMetricAttributions = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_metric_attributions_request) =
    let input = Json_serializers.list_metric_attributions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListMetricAttributions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_metric_attributions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_metric_attributions_request) =
    let input = Json_serializers.list_metric_attributions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListMetricAttributions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_metric_attributions_response_of_yojson
      ~error_deserializer
end

module ListRecipes = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_recipes_request) =
    let input = Json_serializers.list_recipes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListRecipes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_recipes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_recipes_request) =
    let input = Json_serializers.list_recipes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.ListRecipes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_recipes_response_of_yojson ~error_deserializer
end

module ListRecommenders = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_recommenders_request) =
    let input = Json_serializers.list_recommenders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListRecommenders" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_recommenders_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_recommenders_request) =
    let input = Json_serializers.list_recommenders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListRecommenders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_recommenders_response_of_yojson
      ~error_deserializer
end

module ListSchemas = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_schemas_request) =
    let input = Json_serializers.list_schemas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListSchemas" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_schemas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_schemas_request) =
    let input = Json_serializers.list_schemas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.ListSchemas"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_schemas_response_of_yojson ~error_deserializer
end

module ListSolutionVersions = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_solution_versions_request) =
    let input = Json_serializers.list_solution_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListSolutionVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_solution_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_solution_versions_request) =
    let input = Json_serializers.list_solution_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListSolutionVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_solution_versions_response_of_yojson
      ~error_deserializer
end

module ListSolutions = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.personalize#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_solutions_request) =
    let input = Json_serializers.list_solutions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListSolutions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_solutions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_solutions_request) =
    let input = Json_serializers.list_solutions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.ListSolutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_solutions_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module StartRecommender = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_recommender_request) =
    let input = Json_serializers.start_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.StartRecommender" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_recommender_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_recommender_request) =
    let input = Json_serializers.start_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.StartRecommender" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_recommender_response_of_yojson
      ~error_deserializer
end

module StopRecommender = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_recommender_request) =
    let input = Json_serializers.stop_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.StopRecommender" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_recommender_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_recommender_request) =
    let input = Json_serializers.stop_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.StopRecommender" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_recommender_response_of_yojson
      ~error_deserializer
end

module StopSolutionVersionCreation = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_solution_version_creation_request) =
    let input = Json_serializers.stop_solution_version_creation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.StopSolutionVersionCreation"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_solution_version_creation_request) =
    let input = Json_serializers.stop_solution_version_creation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.StopSolutionVersionCreation" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.personalize#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | `TooManyTagKeysException _ -> "com.amazonaws.personalize#TooManyTagKeysException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagKeysException" ->
          `TooManyTagKeysException
            (Json_deserializers.too_many_tag_keys_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateCampaign = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_campaign_request) =
    let input = Json_serializers.update_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.UpdateCampaign" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_campaign_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_campaign_request) =
    let input = Json_serializers.update_campaign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.UpdateCampaign"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_campaign_response_of_yojson ~error_deserializer
end

module UpdateDataset = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_dataset_request) =
    let input = Json_serializers.update_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.UpdateDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_dataset_request) =
    let input = Json_serializers.update_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.UpdateDataset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_dataset_response_of_yojson ~error_deserializer
end

module UpdateMetricAttribution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.personalize#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_metric_attribution_request) =
    let input = Json_serializers.update_metric_attribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.UpdateMetricAttribution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_metric_attribution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_metric_attribution_request) =
    let input = Json_serializers.update_metric_attribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.UpdateMetricAttribution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_metric_attribution_response_of_yojson
      ~error_deserializer
end

module UpdateRecommender = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_recommender_request) =
    let input = Json_serializers.update_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.UpdateRecommender" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_recommender_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_recommender_request) =
    let input = Json_serializers.update_recommender_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonPersonalize.UpdateRecommender" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_recommender_response_of_yojson
      ~error_deserializer
end

module UpdateSolution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.personalize#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.personalize#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.personalize#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.personalize#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_solution_request) =
    let input = Json_serializers.update_solution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonPersonalize.UpdateSolution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_solution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_solution_request) =
    let input = Json_serializers.update_solution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonPersonalize.UpdateSolution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_solution_response_of_yojson ~error_deserializer
end
