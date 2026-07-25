open Types
open Service_metadata

module ListFHIRDatastores = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_fhir_datastores_request) =
    let input = Json_serializers.list_fhir_datastores_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.ListFHIRDatastores" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_fhir_datastores_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fhir_datastores_request) =
    let input = Json_serializers.list_fhir_datastores_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.ListFHIRDatastores"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fhir_datastores_response_of_yojson
      ~error_deserializer
end

module ListFHIRExportJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.healthlake#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_fhir_export_jobs_request) =
    let input = Json_serializers.list_fhir_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.ListFHIRExportJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_fhir_export_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fhir_export_jobs_request) =
    let input = Json_serializers.list_fhir_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.ListFHIRExportJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fhir_export_jobs_response_of_yojson
      ~error_deserializer
end

module ListFHIRImportJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.healthlake#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_fhir_import_jobs_request) =
    let input = Json_serializers.list_fhir_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.ListFHIRImportJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_fhir_import_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fhir_import_jobs_request) =
    let input = Json_serializers.list_fhir_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.ListFHIRImportJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fhir_import_jobs_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module StartFHIRExportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.healthlake#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_fhir_export_job_request) =
    let input = Json_serializers.start_fhir_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.StartFHIRExportJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_fhir_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_fhir_export_job_request) =
    let input = Json_serializers.start_fhir_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.StartFHIRExportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_fhir_export_job_response_of_yojson
      ~error_deserializer
end

module StartFHIRImportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.healthlake#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_fhir_import_job_request) =
    let input = Json_serializers.start_fhir_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.StartFHIRImportJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_fhir_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_fhir_import_job_request) =
    let input = Json_serializers.start_fhir_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.StartFHIRImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_fhir_import_job_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateFHIRDatastore = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.healthlake#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.healthlake#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_fhir_datastore_request) =
    let input = Json_serializers.update_fhir_datastore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.UpdateFHIRDatastore" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_fhir_datastore_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_fhir_datastore_request) =
    let input = Json_serializers.update_fhir_datastore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.UpdateFHIRDatastore"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_fhir_datastore_response_of_yojson
      ~error_deserializer
end

module DescribeFHIRImportJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fhir_import_job_request) =
    let input = Json_serializers.describe_fhir_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.DescribeFHIRImportJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_fhir_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fhir_import_job_request) =
    let input = Json_serializers.describe_fhir_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.DescribeFHIRImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fhir_import_job_response_of_yojson
      ~error_deserializer
end

module DescribeFHIRExportJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fhir_export_job_request) =
    let input = Json_serializers.describe_fhir_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.DescribeFHIRExportJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_fhir_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fhir_export_job_request) =
    let input = Json_serializers.describe_fhir_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.DescribeFHIRExportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fhir_export_job_response_of_yojson
      ~error_deserializer
end

module DescribeFHIRDatastore = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fhir_datastore_request) =
    let input = Json_serializers.describe_fhir_datastore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.DescribeFHIRDatastore" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_fhir_datastore_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fhir_datastore_request) =
    let input = Json_serializers.describe_fhir_datastore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.DescribeFHIRDatastore"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fhir_datastore_response_of_yojson
      ~error_deserializer
end

module DeleteFHIRDatastore = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.healthlake#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.healthlake#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.healthlake#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_fhir_datastore_request) =
    let input = Json_serializers.delete_fhir_datastore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.DeleteFHIRDatastore" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_fhir_datastore_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_fhir_datastore_request) =
    let input = Json_serializers.delete_fhir_datastore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.DeleteFHIRDatastore"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_fhir_datastore_response_of_yojson
      ~error_deserializer
end

module CreateFHIRDatastore = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.healthlake#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.healthlake#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.healthlake#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.healthlake#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_fhir_datastore_request) =
    let input = Json_serializers.create_fhir_datastore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"HealthLake.CreateFHIRDatastore" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_fhir_datastore_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_fhir_datastore_request) =
    let input = Json_serializers.create_fhir_datastore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"HealthLake.CreateFHIRDatastore"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_fhir_datastore_response_of_yojson
      ~error_deserializer
end
